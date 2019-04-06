require 'sinatra'
require './app/tumblr/Tumblr.rb'
require './app/stylist/Stylist.rb'

$api = ARGV[0]

get '/' do
  data = Tumblr.get_posts 'liberdadeorganizacao', $api
  stylist = Stylist.new './assets/'
  posts = stylist.read data
  stylist.draw posts
end
