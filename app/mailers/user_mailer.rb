class UserMailer < ApplicationMailer
  attr_reader :restaurant, :time
  SF_EMAIL = 'sf@referralexchange.com'.freeze

  INDIVIDUAL_EMAILS = %w(
  ).freeze

  TEST_EMAILS = %w(
  ).freeze

  def send_lunch_email(restaurant, time)
    @time = time
    @restaurant = restaurant
    mail(
      to: INDIVIDUAL_EMAILS,
      subject: subject,
      template_name: 'send_lunch_email'
    )
  end

  private

  def subject
    "#{restaurant.name.titleize} - #{time || Date.upcoming_lunch_day.strftime('%A, %B %e')}"
  end
end
