require 'httparty'

module RunregApi
  class Client
    include HTTParty

    BASE_URL = "https://www.runreg.com/api"

    def search **opts
      # Response in format
      #  {
      #    "CompletionTime":0,
      #    "MatchingEvents":[
      #      {
      #        "Categories":[
      #          {
      #            "CategoryID":34293
      #       ... 
      call_api('search', opts)['MatchingEvents'].map do |event|
        Runreg::Event.new(event)
      end
    end

    protected

    def call_api path, params = {}
      response = self.class.get("#{BASE_URL}/#{path}", query: params)
      if response.code == 200
        response.parsed_response
      else
        raise Error.new response.body
      end
    end
  end
end
