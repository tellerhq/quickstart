require "sinatra"
require "./client.rb"

get "/" do
  if request.params["token"]
    @client   = Client.new(request.params["token"])
    @accounts = @client.get("/accounts")
    slim :index, layout: false
  else
    slim :connect, layout: false
  end
end

def institution_logo(account)
  id = account['institution']['id']
  if File.exist?("assets/logos/#{id}.svg")
    File.read("assets/logos/#{id}.svg")
  else
    account['institution']['name']
  end
end

def mask(string)
  string.gsub(/.(?=.{4})/, "•")
end

