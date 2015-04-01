require 'spec_helper'
require 'rails_helper'

describe Message, :vcr => true do
  it "doesn't save the message if twilio throws an error" do
    message = Message.new(
      :body => 'Hello jello mold',
      :to => '1111111',
      :from => ENV['TWILIO_PHONE_NUM']
      )
    expect(message.save).to be_falsey
  end

  it 'adds an error if the number is invalid' do
    message = Message.new(
    :body => 'Hello jello mold',
    :to => '1111111',
    :from => ENV['TWILIO_PHONE_NUM']
    )
    message.save
    message.errors[:base].should eq ["The 'To' number 1111111 is not a valid phone number."]
  end
end
