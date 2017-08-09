require 'rails_helper'

RSpec.describe "refs/index", type: :view do
  before(:each) do
    assign(:refs, [
      Ref.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :publisher => "Publisher",
        :format => "Format",
        :pdf_url => "Pdf Url"
      ),
      Ref.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :publisher => "Publisher",
        :format => "Format",
        :pdf_url => "Pdf Url"
      )
    ])
  end

  it "renders a list of refs" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Publisher".to_s, :count => 2
    assert_select "tr>td", :text => "Format".to_s, :count => 2
    assert_select "tr>td", :text => "Pdf Url".to_s, :count => 2
  end
end
