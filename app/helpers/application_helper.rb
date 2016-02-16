module ApplicationHelper

	def page_header(text)
		content_for(:page_header) { text.to_s}
	end

	def active_page(active_page)
	  @active == active_page ? 'active' : ''
	end

	def unread_messages_count
	  mailbox.inbox(:unread => true).count(:id, :distinct => true)
	end

	def recipients_options(chosen_recipient = nil)
	  s = ' '
	  User.all.each do |user|
	  	s << "<option value='#{user.id}' #{'selected' if user == chosen_recipient}>#{user.name}</option>"
	  end
	  s.html_safe
	end
	
end
