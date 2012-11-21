require 'spec_helper'

describe Hookup, :js => true do
  fixtures :people
  
  before do
    visit '/hookups'
    click_link "New Hookup"
  end
  
  ##Unit test
  it "needs to have people" do
    subject.should_not be_valid
    subject.person_a = Person.find(:all)[0]
    subject.person_b = Person.find(:all)[1]
    subject.should be_valid
  end
  

  ##Integration
  it "needs to have unique partners" do

    select('Shaanan', :from => 'Person A')
    select('Shaanan', :from => 'Person B')
    click_button "Create Hookup"
    error_message = "Can't have two of the same user"
    page.should have_content(error_message)
  end
  
  ##Integration
  it "should work overall" do
    select('Shaanan', :from => 'Person A')
    select('Ariana', :from => 'Person B')
    click_button "Create Hookup"
    page.should have_content("successful")
  end
  
end
