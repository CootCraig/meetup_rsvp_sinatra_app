# ~/.rvm $ find . -name 'haml.rb'
# ./gems/ruby-1.9.2-p0/gems/haml-3.0.18/lib/haml.rb
# ./gems/ruby-1.8.7-p302@tut1/gems/haml-3.0.18/lib/haml.rb
# ./gems/ree-1.8.7-2010.02/gems/haml-3.0.18/lib/haml.rb

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
