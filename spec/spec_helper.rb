require 'rspec'
require_relative '../tools/driver.rb'
require 'pry'
require_relative '../env/common_variables'
<<<<<<< HEAD
Dir[File.join(Dir.pwd, 'pages/**/*.rb')].each { |f| require f }
=======
require_relative '../pages/base_page'
Dir[File.join(Dir.pwd, 'pages/**/*.rb')].each { |f| require f }
>>>>>>> master
