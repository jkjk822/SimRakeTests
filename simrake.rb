#!/usr/bin/env ruby
#
# call this file with
#   $ simrake test1.script 
#
#------------------------------------------------------------------------------
# 
#-------------------------------------------------
class SimRake
  # store all tasks and dependencies

  def complete_root_task()
    puts "...complete_root_task"
    # TODO
  end
  
end

# $builder is a global variable that can be refer to in the task function.
$builder = SimRake.new   


#------------------------------------------------------------------------------
# parameters
#   hash: string representing the 
#        "target: [:dep1, :dep2, …]”
#-------------------------------------------------
def task( hash, &action )
  # register the task,its dependent tasks,and the action at the builder object
  puts hash
  # TODO
  
end

#==============================================================================
# main

puts "starting simrake"
puts "ARGS:" + ARGV[0]
# load the script file which is passed in to simrake (e.g. test1.script)
load ARGV[0]  


$builder.complete_root_task
