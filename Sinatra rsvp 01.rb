require 'rubygems'
require 'sinatra'
require 'haml'

require './MeetupRsvp.rb'

get '/' do
	haml :index
end

post '/' do
	@rsvp_value = MeetupRsvp.instance.FetchYes('http://www.meetup.com/csopensource/calendar/14714249/')
	haml :rsvp_yes
end
