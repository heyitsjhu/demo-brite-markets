class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save

      #Instructs SubscribeMailer to send welcome email to subscriber immediately.
      SubscribeMailer.welcome_email(@subscriber).deliver_now

      redirect_to root_url
      flash[:success] = "Success! Thank you for subscribing. Go ahead, check your email."
    else
      flash[:alert] = "Uh oh, you may have entered an invalid email address! Try one more time."
      redirect_to root_url
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end
