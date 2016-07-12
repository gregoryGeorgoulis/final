Rails.application.routes.draw do
 root 'states#index'
 get '/state/:id' => 'states#show', as: 'state'
 get '/states/polster', to: 'states#polster'
 get '/states/graph', to: 'states#graph'

#   Prefix Verb URI Pattern               Controller#Action
#           root GET  /                         states#index
#          state GET  /state/:id(.:format)      states#show
# states_polster GET  /states/polster(.:format) states#polster
#   states_graph GET  /states/graph(.:format)   states#graph
end
