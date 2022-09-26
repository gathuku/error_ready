Rails.application.routes.draw do
  mount ErrorReady::Engine => "/error_ready"
end
