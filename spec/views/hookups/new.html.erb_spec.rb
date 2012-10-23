require 'spec_helper'

describe "hookups/new" do
  before(:each) do
    assign(:hookup, stub_model(Hookup).as_new_record)
  end

  it "renders new hookup form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hookups_path, :method => "post" do
    end
  end
end
