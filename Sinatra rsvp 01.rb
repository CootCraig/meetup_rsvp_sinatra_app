require 'rubygems'
require 'sinatra'
require 'haml'

get '/' do
	haml :index
end

post '/' do
	@form_params = params
	haml :rsvp_yes
end
