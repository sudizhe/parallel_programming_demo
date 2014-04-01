require 'fiber'
require 'eventmachine'

EM::run do
  fb1 = Fiber.new do
    puts "[Fiber 1] Started"
    EM::add_timer(2){ fb1.resume }
    Fiber.yield
    puts "[Fiber 1] Completed"
    EM::stop()
  end

  fb2 = Fiber.new do
    5.times {|n| puts "[Fiber 2] tick #{n}" }
  end

  fb1.resume
  fb2.resume
end