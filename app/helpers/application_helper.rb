module ApplicationHelper

  def booleantick(b)
    icon=b ?'ok' : 'remove'
    "<i class='icon icon-#{icon}'>".html_safe
  end
end
