class SubscribeMailer < ApplicationMailer
  default from: 'do-not-reply@britemarketsdemoapp.com'

  def welcome_email(subscriber)
      @subscriber = subscriber
      @git_url = 'https://github.com/heyitsjhu/demo-brite-markets'
      @email_address = 'jgeehen.hu@gmail.com'
      mail(to: @subscriber.email, subject: 'Thank You For Testing Out My Demo App!')
  end
end
