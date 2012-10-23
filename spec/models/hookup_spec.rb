require 'spec_helper'

describe Hookup do
  it "needs to have people" do
    subject.should_not be_valid
    subject.person_a = Person.find(:all)[0]
    subject.person_b = Person.find(:all)[1]
    subject.should be_valid
  end
end
