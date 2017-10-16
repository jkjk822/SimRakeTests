#!/usr/bin/env ruby
#
# call this file with
#   $ simrake test1.script 
#
#------------------------------------------------------------------------------
# 

#-------------------------------------------------
class SimRake
  # Store all tasks and dependencies

  #-----------------------------------------------
  def initialize()
    # allocates new Hash for holding all tasks
    @target_dependencies_hash = Hash.new
    @target_actions_hash = Hash.new
  end
  
  #-----------------------------------------------
  def complete_root_task()
    puts "...complete_root_task"
    # TODO
    puts "target_dependencies_hash:"
    puts @target_dependencies_hash
    
    puts "target_actions_hash"
    puts @target_actions_hash
  end
  
  #-----------------------------------------------
  def add_task(task_hash, &action)
    # merges the task_hash with the tasks_hash, adds
    # action to the action_hash

    if task_hash.is_a?(Hash) 
      @target_dependencies_hash.merge!(task_hash)
      target_name = task_hash.first[0]  # ignore others if more than 1 element
      @target_actions_hash[target_name] = action
    elsif task_hash.is_a?(Symbol)
      target_name = task_hash  # ignore others if more than 1 element
      @target_actions_hash[target_name] = action
      @target_dependencies_hash[target_name] = nil
    else
      puts "ERROR, abnormal task syntax:"
      puts task_hash
    end
  end
  
end

# $SIM_RAKE is a global variable that can be refer to in the task function.
$SIM_RAKE = SimRake.new   


#------------------------------------------------------------------------------
# parameters
#   hash: hash table reference representing the task dependency
#        "target: [:dep1, :dep2]"
#-------------------------------------------------
def task( task_hash, &callback_function )
  # register the task,its dependent tasks,and the action at the builder object
  puts task_hash
  
  $SIM_RAKE.add_task(task_hash, &callback_function)
  # TODO
  
end

#==============================================================================
# main

puts "starting simrake"
puts "ARGS:" + ARGV[0]
# load the script file which is passed in to simrake (e.g. test1.script)
load ARGV[0]  


$SIM_RAKE.complete_root_task
