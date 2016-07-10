Rails.application.routes.draw do
 root 'states#index'
 get '/state/:id' => 'states#show', as: 'state'

#  Prefix Verb URI Pattern        Controller#Action
#    root GET  /                  states#index
# newyork GET  /newyork(.:format) states#show
end
