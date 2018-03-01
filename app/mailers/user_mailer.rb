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

  def send_zero_cater_email
    @restaurant = ZeroCater::Restaurant.new.upcoming_restaurant
    @dishes = ZeroCater::Dishes.new(restaurant.url).parse_data
    mail(
      to: to_email,
      subject: subject,
      template_name: 'zero_cater_email'
    )
  end

  private

  def subject
    "#{restaurant['name'].titleize} - #{Time.at(restaurant['time']).strftime('%A, %B %e')}"
  end

  def to_email
    if Rails.env.development?
      test_emails
    else
      sf_email
    end
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
