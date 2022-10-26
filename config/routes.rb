ErrorReady::Engine.routes.draw do
  resources :problems do
    resource :resolve, only: [:create], controller: :problem_resolves
  end
end
