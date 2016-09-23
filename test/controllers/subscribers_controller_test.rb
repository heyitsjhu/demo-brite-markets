require 'test_helper'

class SubscribersControllerTest < ActionDispatch::IntegrationTest

  test "should create new subscriber" do
    assert_difference('Subscriber.count') do
      post subscribers_url, params: { subscriber: { email: 'johnny@example.com' } }
    end
    assert_equal flash[:success], 'Thank you for subscribing! Please check your email.'
    assert_redirected_to root_url
  end

  test "should reject invalid subscriber submission" do
    assert_no_difference('Subscriber.count') do
      post subscribers_url, params: { subscriber: { email: 'user@example,com' } }
    end
    assert_equal flash[:alert], 'Unsuccessful! Please refer to the error message in the form.'
  end
end
