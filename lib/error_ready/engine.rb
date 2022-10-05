module ErrorReady
  class Engine < ::Rails::Engine
    isolate_namespace ErrorReady

    initializer "error_subscribe.error_ready" do |app|
      Rails.error.subscribe(Subscriber.new)
      # register midddleware
      app.config.middleware.use(RackMiddleware)
    end
  end
end
