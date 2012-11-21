require 'spec_helper'

describe "hookups/edit" do
  before(:each) do
    @hookup = assign(:hookup, stub_model(Hookup))
  end

  it "renders the edit hookup form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hookups_path(@hookup), :method => "post" do
    end
  end
end
