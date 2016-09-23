class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save

      #Instructs SubscribeMailer to send welcome email to subscriber immediately.
      SubscribeMailer.welcome_email(@subscriber).deliver_now

      redirect_to root_url
      flash[:success] = "Thank you for subscribing! Please check your email."
    else
      flash.now[:alert] = "Unsuccessful! Please refer to the error message in the form."
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end
