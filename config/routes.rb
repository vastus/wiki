Rails.application.routes.draw do
  # Root.
  root("pages#index")

  # Resources.
  resources(:pages, :only => [:index, :new, :create, :show, :edit, :update])

  # Custom.
  get("/auth/github/callback" => "sessions#create")
  get("/logout" => "sessions#destroy")
end

