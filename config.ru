require "sinatra"
require "./app"

# Preflight check cert and key have been copied into parent certs dir

["certificate.pem", "private_key.pem"].each do |file|
  raise "#{file} not found. Copy both your certificate and private key into the top level certificates directory" unless File.exist?("certificates/#{file}")
end

run Sinatra::Application