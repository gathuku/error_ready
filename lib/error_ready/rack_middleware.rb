module ErrorReady
  class RackMiddleware
    def initialize(app)
      @app = app
    end

    def call(env)
      Rails.error.set_context(
        server_name: env["SERVER_NAME"],
        http_host: env["HTTP_HOST"],
        http_user_agent: env["HTTP_USER_AGENT"]
      )

      Rails.error.record do
        @app.call(env)
      end
    end
  end
end
