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
	end

	def graph
		
	end

	def polster
		uri ="http://elections.huffingtonpost.com/pollster/api/polls.json?topic=2016-president"
    @response = HTTParty.get(uri) 
    respond_to do |format|
    	format.json {render json: @response}
  end
 end 
  
   





end
