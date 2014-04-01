require 'fiber'

fb1 = Fiber.new do
  puts "[Fiber 1] Started"
  sleep 2
  puts "[Fiber 1] Completed"
end

fb2 = Fiber.new do
  5.times do |n|
    puts "[Fiber 2] tick #{n}"
  end
end

fb1.resume
fb2.resume