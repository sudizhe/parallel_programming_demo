require 'eventmachine'
require 'em-http-request'

MANGA_URI = "http://mngacow.com/wp-content/manga/52686/190"
@count = 20

start_time = Time.now

EM.threadpool_size = 20
EM::run do
  (1..20).each do |i|
    fb = Fiber.new do
      p "Fiber started"
      http = EM::HttpRequest.new("#{MANGA_URI}/00#{i.to_s.rjust(2, "0")}.jpg").get
      http.errback { p 'Uh oh'; fb.resume }

      http.callback do
        File.open("event_machine/tower_of_god_#{i}.jpg", 'w'){ |file| file.write(http.response) }
        fb.resume
      end
      Fiber.yield
      @count -= 1
      p @count
      if @count == 0
        p "Total Time: #{Time.now - start_time}"
        EM::stop
      end
    end
    fb.resume
  end
end
