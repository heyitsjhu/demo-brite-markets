require 'test_helper'

class SubscribersControllerTest < ActionDispatch::IntegrationTest

  test "should create new subscriber" do
    assert_difference('Subscriber.count') do
      post subscribers_url, params: { subscriber: { email: 'johnny@example.com' } }
    end
    assert_equal flash[:success], 'Success! Thank you for subscribing. Go ahead, check your email.'
    assert_redirected_to root_url
  end

  test "should reject invalid subscriber submission" do
    assert_no_difference('Subscriber.count') do
      post subscribers_url, params: { subscriber: { email: 'user@example,com' } }
    end
    assert_equal flash[:alert], 'Uh oh, you may have entered an invalid email address! Try one more time.'
  end
end
