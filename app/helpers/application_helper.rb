module ApplicationHelper

	def authenticate_admin
		if logged_in?
			current_user.admin?
		else
			false
		end
	end

	def currentuser
		if logged_in?
			current_user
		end
	end

  def booleantick(b)
    icon=b ?'ok' : 'remove'
    "<i class='icon icon-#{icon}'>".html_safe
  end
end
