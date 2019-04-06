task default: %w[run]
API = `cat b/tumblr.txt`

desc "Starts the fake server"
task :run do
    ruby 'app/main.rb', API
end

# TODO implement theme compiler
