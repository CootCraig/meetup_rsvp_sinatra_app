require 'rubygems'
require 'sinatra'
require 'haml'

require './MeetupRsvp.rb'

get '/' do
	haml :index
end

post '/' do
	@rsvp_value = MeetupRsvp.instance.FetchYes('xxx')
	haml :rsvp_yes
end
