#dependent tasks: Week, Day, Constellation, w2, w3, w4


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
