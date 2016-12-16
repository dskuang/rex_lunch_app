class UserMailer < ApplicationMailer
  attr_reader :restaurant, :time

  def send_lunch_email(restaurant, time)
    @time = time
    @restaurant = restaurant
    mail(
      to: sf_email,
      subject: subject,
      template_name: 'send_lunch_email'
    )
  end

  private

  def subject
    "#{restaurant.name.titleize} - #{time || Date.upcoming_lunch_day.strftime('%A, %B %e')}"
  end

  def sf_email
    Email.of_group('global').addresses
  end

  def individual_emails
    Email.of_group('individual').addresses
  end

  def test_emails
    Email.of_group('test').addresses
  end
end
