require 'net/http'

MANGA_URI = "http://mngacow.com/wp-content/manga/52686/190"

start_time = Time.now

(1..20).each do |i|
  p "downloading: #{i}, #{Time.now - start_time}"
  url = URI.parse("#{MANGA_URI}/00#{i.to_s.rjust(2, "0")}.jpg")
  req = Net::HTTP::Get.new(url.path)
  res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
  }
  File.open("naive/tower_of_god_#{i}.jpg", 'w'){ |file| file.write(res.body) }
end

p "Total Time: #{Time.now - start_time}"