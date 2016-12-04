unless RexLunchApp::Application.config.action_mailer.nil?

  RexLunchApp::Application.config.action_mailer.smtp_settings = {}

  options =
    if Rails.env.development?
      Technology.of_type('dev_smtp_settings').first.try(:obtain_data)
    else
      Technology.of_type('prod_smtp_settings').first.try(:obtain_data)
    end

  options.each do |name, value|
    RexLunchApp::Application.config.action_mailer.smtp_settings[name] = value
  end unless options.nil?
end
