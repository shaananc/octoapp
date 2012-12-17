require 'spec_helper'

describe Person, :js => true do
  
  
    ##Unit test
  it "needs to be filled out" do
    
    subject.should_not be_valid
    subject.name = "Shaanan1234"
    subject.gender = "Male"
    subject.password = "12345678"
    subject.aboutme = "I am awesome"
    subject.email = "shaananc1234@seas.upenn.edu"
    subject.should be_valid
    
  end
  
    ##Integration test
  it "should be fillable online and verify upenn address" do
    visit '/'
    click_button 'Find a Date!'
    click_button 'Sign Up'
    
    fill_in 'Name', :with => 'Jason K'
    select('Male', :from => 'Gender')
    fill_in 'About You', :with => 'I am so cool'
    fill_in 'Email', :with => 'shaananc24324@gmail.com'
    fill_in 'person[password]', :with => '123456789'
    fill_in 'Password confirmation', :with => '123456789'
    click_button "Create Person"
    subject.should have(1).error_on(:email)
    
    
    fill_in 'Email', :with => 'shaananc24324@upenn.edu'
    fill_in 'person[password]', :with => '123456789'
    fill_in 'Password confirmation', :with => '123456789'
    click_button "Create Person"
    page.should have_content("University of Pennsylvania")
  end
  
  
end
