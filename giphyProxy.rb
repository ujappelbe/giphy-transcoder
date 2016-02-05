require 'sinatra'
require 'open-uri'
require 'base64'

get '/giphy/:base64url' do
  giphy_url = Base64.decode64(params[:base64url])
  puts "url is #{giphy_url}"
  File.open('pie.mp4', 'wb') do |fo|
    fo.write open(giphy_url).read
  end
  `rm output.mp4 output.ogv`
  `avconv -y -i pie.mp4 -i 25sec.mp3 -c copy -map 0:0 -map 1:0 output.mp4 -shortest > /dev/null`
  `ffmpeg2theora output.mp4`
  send_file "output.ogv"
  return "Url = #{full_url}"

end
