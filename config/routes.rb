Rails.application.routes.draw do
  resources :lift_reqs
  #resources :example_lift_reqs
  resources :stats
  #resources :examples
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :examples, shallow: true do
    collection do
      get 'search'
      get 'import'
      post 'import'
      get 'all_lifted'
    end
    resources :stats do
      collection do
        put 'increment(/:id)' => 'stats#increment'
      end
    end
    resources :lift_reqs, :tags do
      collection do
      end
    end
  end
  #post 'home/action'
  resources :examples_import do
    collection do
      post 'write'
    end
  end

#  resources :stats do
#    collection do
#      put 'increment(/:id)' => 'stats#increment'
#    end
#  end

end
