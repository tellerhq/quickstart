require "net/https"
require "json"
require "openssl"

class Client
  BASE = "https://api.teller.io".freeze

  def initialize(token)
    @token = token
    @cert  = OpenSSL::X509::Certificate.new File.read("certificates/certificate.pem")
    @key   = OpenSSL::PKey::RSA.new File.read("certificates/private_key.pem")
  end

  def get(path)
    uri  = URI(BASE).tap { |u| u.path = path }
    req  = Net::HTTP::Get.new(uri).tap { |req| req.basic_auth(@token, "") }
    http = Net::HTTP.new(uri.hostname, uri.port)
    http.use_ssl = true
    http.cert = @cert
    http.key = @key

    res = http.request(req)

    JSON.parse(res.body)
  end
end
