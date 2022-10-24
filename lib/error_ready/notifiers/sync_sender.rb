require 'net/http'

module ErrorReady
  class SyncSender
    include Concurrent::Async

    def initialize(formatted_error)
      @error = formatted_error
    end

    def call
      http = Net::HTTP.new(uri.hostname, uri.port)
      http.use_ssl = true
      req = Net::HTTP::Post.new(uri)
      req.body = @error.to_json
      res = http.request(req)

      case res
      when Net::HTTPSuccess, Net::HTTPOK
        Rails.logger.debug ActiveSupport::LogSubscriber.new.send(:color, "Error sent to #{uri.hostname}", :green, true)
      when Net::HTTPBadRequest
        Rails.logger.debug "Bad request"
      when HTTPServerError
        Rails.logger.debug "server error"
      else
        Rails.logger.debug "Something wrong"
      end
    end

    def uri
      @uri ||= URI('https://errorready.free.beeceptor.com')
    end

  end
end
