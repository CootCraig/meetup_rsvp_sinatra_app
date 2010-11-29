require 'rubygems'
require 'sinatra'
require 'haml'

require './MeetupRsvp.rb'

get '/' do
	haml :index
end

post '/' do
	@rsvp_value = MeetupRsvp.instance.FetchYes(params['meetup_url'])
	haml :rsvp_yes
end
