#dependent tasks: Week, Day, Constellation, w2, w3, w4
#expected output of Week:
#I have three classes on Monday
#I have one class on Tuesday
#I have three classes on Wednesday
#I have one class on Thursday
#I have a lot of assignmemts on Friday
#I have no assignment on weekends
#Start a new week!
#
#expected output of Day:
#I have eaten breakfast
#I have eaten lunch
#I have eaten dinner
#I learn Dynamic Language at night
#Have a good day!
#
#expected output of Constellation:
#w1 = [ 1, 0]
#w1 = [ 1, 0]
#w2 = [ 0, 1]
#w1 = [ 1, 0]
#w2 = [ 0, 1]
#w3 = [-1, 0]
#w1 = [ 1, 0]
#w2 = [ 0, 1]
#w3 = [-1, 0]
#w4 = [ 0,-1]
#This is a QPSK constellation


task :Week => [:Monday, :Tuesday, :Wednesday, :Thursday, :Friday, :default] do
    
    puts "Start a new week!"

end


task :Monday do

    puts "I have three classes on Monday"

end

task :Tuesday do

    puts "I have one class on Tuesday"

end

task :Wednesday do

    puts "I have three classes on Wednesday"

end

task :Thursday do

    puts "I have one class on Thursday"

end

task :Friday do

    puts "I have a lot of assignmemts on Friday"

end

task :default do

	puts "I have no assignment on weekends"

end

task :Day => [:Morning, :Afternoon, :Evening, :Night] do

	puts "Have a good day!"

end


task :Morning do

	puts "I have eaten breakfast"

end

task :Afternoon do

	puts "I have eaten lunch"

end

task :Evening do

	puts "I have eaten dinner"

end

task :Night do

	puts "I learn Dynamic Language at night"

end

task :Constellation => [:w1, :w2, :w3, :w4] do

	puts "This is a QPSK constellation"

end

task :w1  do

	puts "w1 = [ 1, 0]"

end

task :w2 => [:w1] do

	puts "w2 = [ 0, 1]"

end

task :w3 => [:w2] do

	puts "w3 = [-1, 0]"

end

task :w4 => [:w3] do

	puts "w4 = [ 0,-1]"

end
