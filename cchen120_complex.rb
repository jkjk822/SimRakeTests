# correct output:
#
# Cut 3 tablespoons of butter,
# hands is clean right now
# finish bathroom
# knead butter into flour,
# add milk,
# sizzle.

task default: [:flour,:milk,:butter] do
  puts "sizzle."
end

task :butter do
  puts "Cut 3 tablespoons of butter,"
end

task flour: [:butter,:goto_bathroom] do
  puts "knead butter into flour,"
end

task goto_bathroom: [:pee, :wash_hands] do
  puts "finish bathroom"
end

task :pee

task :wash_hands do
  puts "hands is clean right now"
end

task :milk do
  puts "add milk,"
end
