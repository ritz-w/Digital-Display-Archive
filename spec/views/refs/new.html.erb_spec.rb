require 'rails_helper'

RSpec.describe "refs/new", type: :view do
  before(:each) do
    assign(:ref, Ref.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :publisher => "MyString",
      :format => "MyString",
      :pdf_url => "MyString"
    ))
  end

  it "renders new ref form" do
    render

    assert_select "form[action=?][method=?]", refs_path, "post" do

      assert_select "input#ref_first_name[name=?]", "ref[first_name]"

      assert_select "input#ref_last_name[name=?]", "ref[last_name]"

      assert_select "input#ref_publisher[name=?]", "ref[publisher]"

      assert_select "input#ref_format[name=?]", "ref[format]"

      assert_select "input#ref_pdf_url[name=?]", "ref[pdf_url]"
    end
  end
end
