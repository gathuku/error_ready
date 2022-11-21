module ErrorReady
  class SidekiqMiddleware
    def call(worker, job, queue)
      Rails.error.set_context(
        params: job.to_json
      )
      Rails.error.record do
        yield
      end
    end
  end
end
