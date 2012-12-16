require 'spec_helper'

include Warden::Test::Helpers


describe Hookup, :js => true do
  fixtures :people
  
  before do
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', :with => 'shaananc@seas.upenn.edu'
    fill_in 'Password', :with => '1234'
    click_button 'Sign In'
    @current_person = Person.where(:email => "shaananc@seas.upenn.edu").first
    visit '/'
    click_button 'Find a Date!'
  end
  
  ##Unit test
  it "needs to have people" do
    
    subject.should_not be_valid
    subject.person_a = @current_person
    subject.person_b = Person.where("id != ?", @current_person.id).first
    subject.weara = "funny hat"
    subject.should be_valid
    
    
  end
  

 
  
  ##Integration test
  it "should work overall" do
    select('Ariana', :from => 'Person B')
    fill_in 'Piece of clothing to recognize you by', :with => 'funny hat'
    #debugger;1
    click_button "Create Hookup"
    
    page.should have_content("Congratulations!")
  end
  
end
