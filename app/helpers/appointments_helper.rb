module AppointmentsHelper

  def sequencelabel(a)
	  if a.allocation.allocation_type.is_assessment
			"<span class=\"label label-warning\">ia</span>".html_safe
		else
			"<span class=\"label label-info\">#{a.sequence}</span>".html_safe
		end
  end

  def appointmentlabel(a)
    if (a.id.nil?) # we're dealing with a virtual appointment
      i = "<i class='icon-pencil'></i>"
    else
      i = ''
    end

    "#{i} #{a.fullname}".html_safe
  end

  def dropdownmenu(a)
    if a.id.nil? # virtual appointment

    else

    end
  end

  def editable(a)
    a.appointment_date.nil? ? true : (current_user.admin? || !a.appointment_date.past? )
  end

end
