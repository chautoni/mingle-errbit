require 'action_mailer'
require 'messagebus-sdk/actionmailer_client'

class MessagebusMailer < MessagebusActionMailerClient
  def initialize(*args)
    # Move this to config file later
    api_key = '62EEBBDA5C064CF3B97F8C9CE4E34ECC'
    api_endpoint = "https://api-v4.messagebus.com"
    super(api_key, api_endpoint)
  end

  def deliver!(message)
    super(MessagebusEmailDelegator.new(message))
  end
end

ActionMailer::Base.add_delivery_method :messagebus, MessagebusMailer
ActionMailer::Base.delivery_method = :messagebus