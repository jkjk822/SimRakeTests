

task :purchaseVegetables => [:cook, :laundry] do
  puts "test1"
end


task :cook => [:laundry]  do
  puts "test2"
end


task :laundry  do
  puts "test3"
end

task :test4 do
   puts "test4"
end

task :test5 => [:cook] do
  puts "test5"
end


