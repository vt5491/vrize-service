Rails.application.routes.draw do
  #resources :examples
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :examples do
    collection do
      get 'search'
      get 'import'
      post 'import'
    end
  end
  #post 'home/action'
  resources :examples_import do
    collection do
      post 'write'
    end
  end
end
