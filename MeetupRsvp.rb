require 'singleton'
require 'rubygems'
require 'haml'
require 'open-uri'
require 'nokogiri'

class MeetupRsvp
	include Singleton
	
	def initialize
		@haml_engine = Haml::Engine.new(File.read('rsvp.haml'))
	end
	
	def FetchYes(meetingUrl)
		if 1
			test_data = [ {:name => 'Alice Brown', :image_url => '/alice/brown'},
				{:name => 'Chris Dent', :image_url => '/chris/dent'},
				{:name => 'Ellen Fargo', :image_url => '/ellen/fargo'},
				{:name => 'Grant Hume', :image_url => '/grant/hume'} ]
			return test_data.inject('') do |all_persons, person|
				all_persons << " #{@haml_engine.render(Object.new,{:name => person[:name], :image_url => person[:image_url]})}"
			end
		end
		meetingPage = Nokogiri::HTML(open(MeetupUri))
		yesNodeList = meetingPage.css('li.D_rsvpAttendeeGroup div.D_yes')
		unless yesNodeList
			return "<p>No Yes RSVP found at [#{meetingUrl}]</p>"
		end
		yesNodeList.first.parent.css('ul.D_feedItems li.D_feedItem').each do |memberNode|
			name = memberNode.css('span.D_name a').first.content
		end
		
		"MeetupRsvp.FetchYes called with #{meetingUrl}"
	end
end

