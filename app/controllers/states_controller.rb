class StatesController < ApplicationController

	def index
		@states = State.all

	end
# this route makes two api calls and grabs data about congress and senate depending on which state id is passed in
	def show
		@state = State.find(params[:id])

		puts '============================'
		# this is where i get the state initials so i can put them in the api call to get the right state data
		puts @state.initials
		puts '============================'
		da_key = ENV['SUN_LIGHT_KEY']
		state = @state.initials

		uri = "https://congress.api.sunlightfoundation.com/legislators?title=Sen&state=#{state}&in_office=true&apikey=#{da_key}" 
		@response = HTTParty.get(uri) 
		@results = @response['results']

		uri = "https://congress.api.sunlightfoundation.com/legislators?title=Rep&state=#{state}&in_office=true&apikey=#{da_key}" 
		@response1 = HTTParty.get(uri) 
		@results1 = @response1['results']
	end

	def graph
		
	end
# grab the pollster data here and formt it to send back json to my front end api call
	def polster
		uri ="http://elections.huffingtonpost.com/pollster/api/polls.json?topic=2016-president"
    @response = HTTParty.get(uri) 
    respond_to do |format|
    	format.json {render json: @response}
  end
 end 
  
   





end
