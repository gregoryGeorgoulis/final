class StatesController < ApplicationController

	def index
		@states = State.all

	end

	def show
		@state = State.find(params[:id])
		puts '============================'
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

		 uri ="http://elections.huffingtonpost.com/pollster/api/polls.json?state=#{state}"
    @response = HTTParty.get(uri) 
    puts @response[0]['questions'][0]['topic']
    puts @response[0]['questions'][0]['name']
	end





end
