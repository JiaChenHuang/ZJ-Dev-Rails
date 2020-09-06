Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  root 'static_pages#home'  # 首页
  get '/help', to: 'static_pages#help' # 帮助
  get '/about', to: 'static_pages#about' # 关于
  get '/contact', to: 'static_pages#contact' # 联系
  get '/signup', to: 'users#new' # 注册
  get '/login', to: 'sessions#new' # 登录页
  post '/login', to: 'sessions#create' # 登录
  delete '/logout', to: 'sessions#destroy' # 退出
  resources :users
  resources :account_activations, only: [:edit] # 激活账户
  resources :password_resets, only: %i[new create edit update] # 重置密码
end
# Ruby on Rails 434
