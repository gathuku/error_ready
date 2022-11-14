require 'net/http'

module ErrorReady
  class SyncSender
    include Concurrent::Async

    def initialize(formatted_error)
      @error = formatted_error
    end

    def call
      http = Net::HTTP.new(uri.hostname, uri.port)
      http.use_ssl = true if uri.port == 443
      req = Net::HTTP::Post.new(uri)
      req['Content-type'] = "application/json"
      req['APP-SECRET'] = ErrorReady.configuration.app_secret
      req.body = @error.to_json
      res = http.request(req)

      case res
      when Net::HTTPSuccess, Net::HTTPOK
        log_message("error sent to #{uri.hostname}", :green)
      when Net::HTTPUnauthorized
        log_message("unauthorized, ensure you add app_secret on config file")
      when Net::HTTPBadRequest
        log_message("bad request")
      when HTTPServerError
        log_message("server error")
      else
        log_message("something wrong")
      end
    end

    def log_message(msg, color = :red)
      Rails.logger.debug ActiveSupport::LogSubscriber.new.send(:color, "ErrorReady: #{msg}", color, true)
    end

    def uri
      @uri ||= URI(ErrorReady.configuration.host)
    end

  end
end
