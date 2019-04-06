require 'net/http'
require 'json'

module Tumblr
  def Tumblr.get_posts blog, api
    url = URI.parse "http://api.tumblr.com/v2/blog/#{blog}/posts?api_key=#{api}"
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) do |http|
      http.request(req)
    end
    JSON.parse res.body
  end
end
