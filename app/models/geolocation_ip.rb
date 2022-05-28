require 'net/http'
class GeolocationIp
  attr_reader :city, :region, :country
  END_POINT = "http://ipinfo.io/"
  TOKEN = "d9690b7bb568c1"

  def initialize(ip)
    set_attributes(find_url_json(ip))
  end
  def set_attributes(json)
    @city = json["city"]
    @region = json["region"]
    @country = json["country"]
  end
  def find_url_json(ip)
    ActiveSupport::JSON.decode(
      Net::HTTP.get(
        URI("#{END_POINT}#{ip}?token=#{TOKEN}")
      )
    )
    
  end
  
  
end