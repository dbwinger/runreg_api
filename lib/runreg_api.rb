if ENV['ENV'] == 'development'
  require 'dotenv/load'
  require 'byebug'
end
require 'runreg_api/version'
require 'runreg/event'
require 'runreg_api/client'


module RunregApi
  class Error < StandardError; end;
end
