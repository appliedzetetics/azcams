# app/inputs/date_time_input.rb
class DateTimeInput < SimpleForm::Inputs::DateTimeInput
  def input
    #@builder.send(:"#{input_type}_select", attribute_name, input_options, input_html_options)
    @builder.text_field(attribute_name, input_html_options)
  end

  def has_required?
    false
  end

  private

  def label_target
    position = case input_type
    when :date, :datetime
      date_order = input_options[:order] || I18n.t('date.order')
      date_order.first
    else
      :hour
    end

    position = ActionView::Helpers::DateTimeSelector::POSITION[position]
    "#{attribute_name}_#{position}i"
  end
end
