class PersonMailer < ActionMailer::Base
  default :from => "no-reply@pennhookups.heroku.com"
 
  def date_email(person, hookup, personb)
    @person = person
    @hookup = hookup
    @personb = personb
    mail(:to => person.email, :subject => "Your date is ready")
  end
end