Rails.application.routes.draw do
 root 'states#index'
 get '/state/:id' => 'states#show', as: 'state'
 get '/states/polster', to: 'states#polster'

#  Prefix Verb URI Pattern              Controller#Action
#          root GET  /                        states#index
#         state GET  /state/:id(.:format)     states#show
# state_polster GET  /state/polster(.:format) states#polster
end
