task :send_zero_cater_email => :environment do
  UserMailer.send_zero_cater_email.deliver if Time.current.wday.in?([1, 3, 5])
end
