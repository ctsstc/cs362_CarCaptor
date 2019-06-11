module Config
  HOST = (ENV['HOST'] || 'localhost').freeze
  PORT = (ENV['PORT'] || 3000).freeze
end
