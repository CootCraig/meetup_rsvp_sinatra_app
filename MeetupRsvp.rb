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
		meetingPage = Nokogiri::HTML(open(meetingUrl))
		yesNodeList = meetingPage.css('li.D_rsvpAttendeeGroup div.D_yes')
		unless yesNodeList
			return "<p>No Yes RSVP found at [#{meetingUrl}]</p>"
		end
		rsvp_yes_list_html = ""
		yesNodeList.first.parent.css('ul.D_feedItems li.D_feedItem').each do |memberNode|
			name = memberNode.css('span.D_name a').first.content
			name << memberNode.css('span.D_chapterTitle').first if memberNode.css('span.D_chapterTitle').first
			memberUrl = memberNode.css('span.D_name a').first.attributes['href'].value
			memberPage = Nokogiri::HTML(open(memberUrl))
			pictureUrl = memberPage.css('div#D_memberProfile img.D_memberProfilePhoto').first.attributes['src'].value
			rsvp_yes_list_html << " #{@haml_engine.render(Object.new,{:name => name, :image_url => pictureUrl})}"
		end
		rsvp_yes_list_html
	end
end

