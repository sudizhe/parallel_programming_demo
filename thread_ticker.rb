t1 = Thread.new do
  puts "[Thread 1] Started"
  sleep 2
  puts "[Thread 1] Completed"
end

t2 = Thread.new do
  5.times do |n|
    puts "[Thread 2] tick #{n}"
  end
end

t1.join
t2.join