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
    @deps_hash = Hash.new
    @actions_hash = Hash.new
  end
  
  #-----------------------------------------------
  def build_target(symb) 
    # recursively builds targets starting from root

    puts "...build_target(" + String(symb) + ")"

    @deps_hash[symb].each do |e|
      build_target(e)
    end
    @actions_hash[symb].call

  end

  #-----------------------------------------------
  def complete_root_task()
    puts "...complete_root_task"
    build_target(:def)
    
    #puts @deps_hash
    #puts "\nactions_hash" 
  end
  
  #-----------------------------------------------
  def add_task(task_hash, &action)
    # merges the task_hash with the tasks_hash, adds
    # action to the action_hash

    is_first = @deps_hash.none?

    if task_hash.is_a?(Hash) 
      target_name = task_hash.first[0]  # ignore others if more than 1 element
      deps = task_hash.first[1]
      @actions_hash[target_name] = action
      if deps.is_a?(Symbol)
        @deps_hash[target_name] = [deps]
      else
        @deps_hash[target_name] = deps
      end
    elsif task_hash.is_a?(Symbol)
      target_name = task_hash  # ignore others if more than 1 element
      @actions_hash[target_name] = action
      @deps_hash[target_name] = []
    else
      puts "ERROR, abnormal task syntax:"
      puts task_hash
      return
    end

    if is_first
      puts "default task is " + String(target_name)
      @deps_hash[:def] = [target_name]
      @actions_hash[:def] = lambda{puts "default task completed"}
    end

  end
  
end


#------------------------------------------------------------------------------
# parameters
#   hash: hash table reference representing the task dependency
#        "target: [:dep1, :dep2]"
#-------------------------------------------------
def task( task_hash, &callback_function )
  # register the task,its dependent tasks,and the action at the builder object
  #puts task_hash
  
  $SIM_RAKE.add_task(task_hash, &callback_function)
end

#==============================================================================
# main

# $SIM_RAKE is a global variable that can be refer to in the task function.
$SIM_RAKE = SimRake.new   

puts "starting simrake"
puts "ARGS:" + ARGV[0]
# load the script file which is passed in to simrake (e.g. test1.script)
load ARGV[0]  


$SIM_RAKE.complete_root_task
