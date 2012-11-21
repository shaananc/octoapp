require 'spec_helper'

describe "hookups/show" do
  before(:each) do
    @hookup = assign(:hookup, stub_model(Hookup))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
