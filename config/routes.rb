Rails.application.routes.draw do

#INDEX/READ
get '/polls',     to: 'polls#index'

#SHOW/READ
get '/polls/:id', to: 'polls#show'

#CREATE
get 'polls',      to: 'polls#create'

#DELETE
get 'polls',      to: 'polls#delete'

#UPDATE
get 'polls',      to: 'polls#update'

end
