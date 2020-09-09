Rails.application.routes.draw do
  root 'static_pages#home'  # 首页
  get '/help', to: 'static_pages#help' # 帮助
  get '/about', to: 'static_pages#about' # 关于
  get '/contact', to: 'static_pages#contact' # 联系
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  get '/signup', to: 'users#new' # 注册
  get '/login', to: 'sessions#new' # 登录页
  post '/login', to: 'sessions#create' # 登录
  delete '/logout', to: 'sessions#destroy' # 退出
  resources :users do
    member do
      # http://localhost:3000/users/1/following 我关注的用户
      # http://localhost:3000/users/1/followers 关注我的用户
      get :following, :followers
    end
  end
  resources :users
  resources :account_activations, only: [:edit] # 激活账户
  resources :password_resets, only: [:new, :create, :edit, :update] # 重置密码
  resources :microposts, only: [:create, :destroy]  # 用户微博
  resources :relationships, only: [:create, :destroy]
end
# Ruby on Rails 434
