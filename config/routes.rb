Rails.application.routes.draw do

#INDEX/READ
get '/polls',     to: 'polls#index'

#SHOW/READ
get '/polls/:id', to: 'polls#show'

#CREATE
post 'polls',      to: 'polls#create'

#DELETE
delete 'polls',      to: 'polls#delete'

#UPDATE
put 'polls',      to: 'polls#update'

end
