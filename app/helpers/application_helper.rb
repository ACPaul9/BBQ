module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-warning',
      alert: 'alert-danger',
      notice: 'alert-success'
    }.stringify_keys[flash_type] || flash_type
  end

  def bootstrap_flash
    flash.each do |type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(type)} alert-dismissible fade show mt-4", role: 'alert') do
        concat content_tag(:button, '',type: 'button', class: 'btn-close', data: { bs_dismiss: 'alert' })
        concat message
      end)
    end
    nil
  end

  def user_avatar(user)
    asset_path('user.png')
  end
end
