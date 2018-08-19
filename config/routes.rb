Rails.application.routes.draw do
  scope "/:locale" do
    resources :members do
      get :search, on: :collection
    end
    devise_for :users
    root 'members#index'
  end
end
