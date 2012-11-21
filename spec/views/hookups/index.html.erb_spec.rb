require 'spec_helper'

describe "hookups/index" do
  before(:each) do
    assign(:hookups, [
      stub_model(Hookup),
      stub_model(Hookup)
    ])
  end

  it "renders a list of hookups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
