#Jordan Caldwell
#SimRake names test file
#18 Oct. 2017

#Expected output:

#Done with second, part 1
#Done with second, part 2
#Done with third
#Done with first

task first: [:second, :third] do
  puts "Done with first"
end

task :second do
  puts "Done with second, part 1"
end

task :second do
  puts "Done with second, part 2"
end

task :third do
  puts "Done with third"
end
