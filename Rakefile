task default: %w[run]
API = `cat b/tumblr.txt`

desc "Starts the fake server"
task :run do
    ruby 'app/main.rb', API
end

desc "Compile the theme"
task :build do
    ruby 'app/compiler.rb'
end

# TODO implement theme compiler
