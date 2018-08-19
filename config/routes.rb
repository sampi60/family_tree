Rails.application.routes.draw do
  scope "/:locale" do
    resources :members
    devise_for :users
    root 'members#index'
  end
end
