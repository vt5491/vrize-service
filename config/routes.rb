Rails.application.routes.draw do
  resources :example_lift_reqs
  #resources :examples
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :examples do
    collection do
      get 'search'
      get 'import'
      post 'import'
      get 'all_lifted'
    end
  end
  #post 'home/action'
  resources :examples_import do
    collection do
      post 'write'
    end
  end
  # resources :dummy do
  #   collection do
  #     get 'get_back'
  #   end
  # end
end
