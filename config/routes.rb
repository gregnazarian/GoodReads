Rails.application.routes.draw do
  
  root 'static#index'
  
  resources :users do
      resources :bookshelves do
        resources :books
      end
        #each book needs to be in "All"

  end

  # resources :authors do
  #   resources :books
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# 
#       resources :books do 
#             resources :reviews 
#     end
# 
# 
# 
# 
#   
end
