# correct output:
#
# if no output of diff, then it'a all correct
# end of compare

task default: [:default_rake, :complex] do
    puts "if no output of diff, then it'a all correct"
    puts "end of compare"
end

task :default_rake do
    system 'rake --rakefile cchen120_default.rb > correct.txt'
    system './simrake.rb cchen120_default.rb > output.txt'
    system 'diff correct.txt output.txt'
    system 'rm correct.txt output.txt'
end

task :complex do
    system 'rake --rakefile cchen120_complex.rb > correct.txt'
    system './simrake.rb cchen120_complex.rb > output.txt'
    system 'diff correct.txt output.txt'
    system 'rm correct.txt output.txt'
end
