#!/usr/bin/env ruby
#
# call this file with
#   $ simrake test1.script 
#
#------------------------------------------------------------------------------
# 

#-------------------------------------------------
class Task
	attr_accessor :name, :deps, :action, :action_ran
	def initialize()
		@name = ""
		@deps = []
		@action = []
		@action_ran = false
	end
end

#-------------------------------------------------
class SimRake
  # Store all tasks and dependencies

  #-----------------------------------------------
  def initialize()
    # allocates new Hash for holding all tasks
    @tasks = Hash.new
  end
  
  #-----------------------------------------------
  def build_target(symb) 
    # recursively builds targets starting from root

    puts "...build_target(" + String(symb) + ")"

    @tasks[symb].deps.each do |e|
      build_target(e)
    end
    @tasks[symb].action.call

  end

  #-----------------------------------------------
  def complete_root_task()
  	# check if there is a task :default and if so, replace
  	# !root task with this task
  	if @tasks[:default]
  		@tasks["!root"].deps = [@tasks[:default].name]
  	end
    build_target("!root")
  end
  
  #-----------------------------------------------
  def add_task(task_hash, &action)
    # merges the task_hash with the tasks_hash, adds
    # action to the action_hash

    is_first = @tasks.none?

    new_task = Task.new
    new_task.action = action
    if task_hash.is_a?(Hash) 
      new_task.name = task_hash.first[0]  # ignore others if more than 1 element
      deps = task_hash.first[1]
      if deps.is_a?(Symbol)
        new_task.deps = [deps]
      else
        new_task.deps = deps
      end
    elsif task_hash.is_a?(Symbol)
      new_task.name = task_hash  # ignore others if more than 1 element
      new_task.deps = []
    else
      puts "ERROR, abnormal task syntax:"
      puts task_hash
      return
    end
	@tasks[new_task.name] = new_task    
    
    if is_first
      root_task = Task.new
      root_task.name = "!root"
      root_task.deps = [new_task.name]
      root_task.action = lambda{puts "default task completed"}
      @tasks[root_task.name] = root_task
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
