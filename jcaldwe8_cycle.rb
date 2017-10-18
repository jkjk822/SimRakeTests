#Jordan Caldwell
#SimRake circular test file
#18 Oct. 2017

#no expected output

task task1: :task2 do
  puts "Circ_test failed"
end

task task2: :task1 do
  puts "Circ_test failed"
end
