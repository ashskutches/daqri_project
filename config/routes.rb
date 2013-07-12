Contacts::Application.routes.draw do
  resources :contacts, except: [:new, :edit, :patch]

  root to: 'application#home'
end
