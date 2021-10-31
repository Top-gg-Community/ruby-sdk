require 'net/http'
require 'json'

module Dbl 
   module Utils
   class Request
    def initialize(token)
      @token = token
      @url = "https://top.gg/api"
    end
        
   
     def get(params)
        
        uri = URI.parse(@url+"/#{params}")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(uri.request_uri)
        request.add_field 'Authorization', @token

        response = http.request(request)
        JSON.parse(response.body)
   end

   def post(params, data)


        uri = URI.parse(@url+"/#{params}")
         http = Net::HTTP.new(uri.host, uri.port)
         http.use_ssl = true
         http.verify_mode = OpenSSL::SSL::VERIFY_NONE

         request = Net::HTTP::Post.new(uri.request_uri, initheader = {'Content-Type' =>'application/json', 'Authorization' => @token})
         request.body = data.to_json

         response = http.request(request)
         JSON.parse(response.body)
   end
end
end
end