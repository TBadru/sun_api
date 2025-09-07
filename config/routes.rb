Rails.application.routes.draw do
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
#   # Can be used by load balancers and uptime monitors to verify that the app is live.
#   # get "up" => "rails/health#show", as: :rails_health_check

#   # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
#   # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
#   # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

#   # Defines the root path route ("/")
#   # root "posts#index"
#   #
#   get "/docs", to: "docs#index"

namespace :api do
  namespace :v1 do
    get "sun_data", to: "sun_data#show"
    get "sun_data/today", to: "sun_data#today"
    get "sun_data/range", to: "sun_data#range"
  end
end

  # Swagger docs
  get "/docs", to: redirect("/api-docs/index.html")
end
