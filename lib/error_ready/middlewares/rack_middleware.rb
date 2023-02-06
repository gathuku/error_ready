module ErrorReady
  class RackMiddleware
    def initialize(app)
      @app = app
    end

    def call(env)
      # Load session
      if env["rack.session"]
        env["rack.session"]["init"] = true
      end

      Rails.error.set_context(
        server_name: env["SERVER_NAME"],
        http_host: env["HTTP_HOST"],
        http_user_agent: env["HTTP_USER_AGENT"],
        session: env["rack.session"].to_json
      )

      Rails.error.record do
        @app.call(env)
      end
    end
  end
end
