Rails.application.routes.draw do
  # Root.
  root("pages#index")

  # Custom.
  get("/auth/github/callback" => "sessions#create")
  get("/logout" => "sessions#destroy")
end

