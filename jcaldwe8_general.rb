#Jordan Caldwell
#SimRake test file
#18 Oct. 2017

#Expected output:

#Add butter to hot pan and melt
#Add flour and combine
#Stir until toasty brown
#Add milk
#Add cheese and melt (shredded works best)
#Cook pasta of choice (penne recommended)
#Mix everything together
#You just made mac-and-cheese!

#the 2nd line should only appear once

task default: :macandcheese do
  puts "You just made mac-and-cheese!"
end

task macandcheese: [:rue,:milk,:cheese,:pasta] do
  puts "Mix everything together"
end

task :butter do
  puts "Add butter to hot pan and melt"
end

task :flour do
  puts "Add flour and combine"
end

#should only run flour once, not twice!
task rue: [:butter, :flour, :flour] do
  puts "Stir until toasty brown"
end

task :milk do
  puts "Add milk"
end

task :cheese do
  puts "Add cheese and melt (shredded works best)"
end

task :pasta do
  puts "Cook pasta of choice (penne recommended)"
end
