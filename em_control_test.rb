require 'eventmachine'
require 'em-http-request'

EM::run do
  fb1 = Fiber.new do
    p "F1"
    start_time = Time.now
    EM::add_timer(2){fb1.resume}
    Fiber.yield
    p "F1 time: #{Time.now - start_time}"
    EM::stop()
  end
  
  fb2 = Fiber.new do
    p "F2 started"
    sleep 4
    p "F2 End"
  end
  
  fb1.resume
  fb2.resume
end