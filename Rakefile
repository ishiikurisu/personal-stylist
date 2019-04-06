task default: %w[test]
API = ENV['API'] || nil

desc "Starts the fake server"
task :run do
    ruby 'app/main.rb', API
end
