require 'spec_helper'


## Didn't have time to make a proper controller test for welcome
describe Hookup, :js => true do
  fixtures :people

  it "should get right links" do
    visit '/'
    click_button 'Find a Date!'
    page.should have_button("Sign In")
    page.should have_button("Sign Up")
    click_button 'Sign Up'
    page.should have_content("Gender")
    visit '/'
    click_button 'Find a Date!'
    click_button 'Sign In'
    page.should have_content("Forgot")
  end

  it "should change on login" do
    visit '/'
    click_button 'Find a Date!'
    page.should have_button("Sign In")
    page.should have_button("Sign Up")
    click_button 'Sign In'
    fill_in 'Email', :with => 'shaananc@seas.upenn.edu'
    fill_in 'Password', :with => '1234'
    @current_person = Person.where(:email => "shaananc@seas.upenn.edu").first
    click_button 'Sign In'
    visit '/'
    click_button 'Find a Date!'
    page.should have_content("Prepare your Date!")
  end

end