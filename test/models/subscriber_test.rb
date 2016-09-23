require 'test_helper'

class SubscriberTest < ActiveSupport::TestCase
  def setup
    @subscriber = Subscriber.new( email: "johnny@example.com" )
  end

  test "valid email submission" do
    assert @subscriber.valid?
  end

  test "email validation should reject blank email" do
    @subscriber.email = ''
    assert_not @subscriber.valid?, "A blank email should not be accepted."
  end

  test "email validation should reject emails longer than 255 characters" do
    @subscriber.email = 'a' * 244 + "@example.com"
    assert_not @subscriber.valid?, "Emails longer than 255 characters should not be valid"
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @subscriber.email = valid_address
      assert @subscriber.valid?, "#{valid_address} should be valid."
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @subscriber.email = invalid_address
      assert_not @subscriber.valid?, "#{invalid_address} should be invalid."
    end
  end
end
