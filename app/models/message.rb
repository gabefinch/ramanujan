class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :number
  before_create :send_sms

private
  begin
    def send_sms
      RestClient::Request.new(
      :method => :post,
      :url => 'https://api.twilio.com/2010-04-01/Accounts/' + ENV['TWILIO_ACCOUNT_SID'] + '/Messages.json',
      :user => ENV['TWILIO_ACCOUNT_SID'],
      :password => ENV['TWILIO_AUTH_TOKEN'],
      :payload => {
        :Body => body,
        :From => from,
        :To => to }
      ).execute
    rescue RestClient::BadRequest => error
      message = JSON.parse(error.response)['message']
      errors.add(:base, message)
      false
    end
  end
end
