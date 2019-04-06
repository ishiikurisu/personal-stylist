require 'sinatra'

$api = ARGV[0]

get '/' do
    "Your API is #{$api}"
end
