require 'net/http'
require 'json'

module Tumblr
  def Tumblr.get_posts blog, api
    cache = "b/#{blog}.json"
    if File.exist? cache
      raw = File.open(cache, 'r') { |fp| fp.read }
    else
      url = URI.parse "http://api.tumblr.com/v2/blog/#{blog}/posts?api_key=#{api}"
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port) do |http|
        http.request(req)
      end
      raw = res.body
      File.open(cache, 'w') { |fp| fp.write raw }
    end
    JSON.parse raw
  end
end
