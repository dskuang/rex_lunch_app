class UserMailer < ApplicationMailer
  attr_reader :restaurant, :time
  SF_EMAIL = Email.of_group('global').addresses

  INDIVIDUAL_EMAILS = Email.of_group('individual').addresses

  TEST_EMAILS = Email.of_group('test').addresses

  def send_lunch_email(restaurant, time)
    @time = time
    @restaurant = restaurant
    mail(
      to: TEST_EMAILS,
      subject: subject,
      template_name: 'send_lunch_email'
    )
  end

  private

  def subject
    "#{restaurant.name.titleize} - #{time || Date.upcoming_lunch_day.strftime('%A, %B %e')}"
  end
end
