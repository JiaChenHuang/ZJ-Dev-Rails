Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'  #首页
  get '/help', to: 'static_pages#help'  #帮助
  get '/about', to: 'static_pages#about'  #关于
  get '/contact', to: 'static_pages#contact'  #联系
  get '/signup', to: 'users#new'  #注册
  get '/login', to: 'sessions#new'  #登录页
  post '/login', to: 'sessions#create'  #登录
  delete '/logout', to: 'sessions#destroy'  #退出
  
  resources :users
end
# Ruby on Rails 350
