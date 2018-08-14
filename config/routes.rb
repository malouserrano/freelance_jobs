Rails.application.routes.draw do
  root 'pages#home'
  get    '/login',              to: 'sessions#new'
  post   '/login',              to: 'sessions#create'
  delete '/logout',             to: 'sessions#destroy'

  resources :users do
    resources :addresses
    resources :skills
  end
  resources :invites do
    member do
      get '/accept',    to: 'invites#accept'
      get '/decline',   to: 'invites#decline'
      # get '/delete',    to: 'invites#destroy'
    end
  end
  resources :job_applications do
    member do
      get '/accept',    to: 'job_applications#accept'
      # get '/delete',    to: 'job_applications#destroy'
    end
  end
  resources :active_jobs do
    member do
      get '/complete',  to: 'active_jobs#complete'
    end
  end
  resources :completed_jobs
  resources :posts
  resources :reviews

  get    '/freelancers',        to: 'freelancers#index'
  get    '/freelancers/:id',    to: 'freelancers#show', as: 'freelancer_profile'
  get    '/employers/:id',      to: 'employers#show', as: 'employer_profile'
end
