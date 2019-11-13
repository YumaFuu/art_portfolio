class Gyazo
  require 'net/http'
  require 'uri'
  require 'rest-client'

  class << self
    def upload(file_path)
      token = ENV["ACCESS_TOKEN"]

      url = "https://upload.gyazo.com/api/upload?access_token=#{token}"
      res = RestClient.post(url, :imagedata => File.new(file_path, 'rb'))
      return if res.code != 200

      res.body.gsub('"',"'").match(/'url':'(.+)'/)[1] rescue nil
    end
  end
end
