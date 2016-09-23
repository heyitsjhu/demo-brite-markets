require 'test_helper'

class SubscribeMailerTest < ActionMailer::TestCase
  
  def setup
    @subscriber = Subscriber.new( email: 'johnny@example.com' )
  end

  test "subscription" do
    # Create the subscription email
    email = SubscribeMailer.welcome_email(@subscriber)

    # Assert that the email has been queued
    assert_emails 1 do
      email.deliver_now
    end

    #Test the presence of elements in the email body
    assert_equal ['do-not-reply@britemarketsdemoapp.com'], email.from
    assert_equal ['johnny@example.com'], email.to
    assert_equal 'Thank You For Testing Out My Demo App!', email.subject
    assert_not   email.body.to_s.nil?
  end
end
