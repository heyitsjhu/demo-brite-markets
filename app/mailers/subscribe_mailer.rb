class SubscribeMailer < ApplicationMailer
  default from: 'do-not-reply@britemarketsdemoapp.com'

  def welcome_email(subscriber)
      @subscriber = subscriber
      @git_url = ''
      mail(to: @subscriber.email, subject: 'Thank You For Testing Out My Demo App!')
  end
end
