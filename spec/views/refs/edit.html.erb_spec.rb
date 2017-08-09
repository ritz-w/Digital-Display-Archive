require 'rails_helper'

RSpec.describe "refs/edit", type: :view do
  before(:each) do
    @ref = assign(:ref, Ref.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :publisher => "MyString",
      :format => "MyString",
      :pdf_url => "MyString"
    ))
  end

  it "renders the edit ref form" do
    render

    assert_select "form[action=?][method=?]", ref_path(@ref), "post" do

      assert_select "input#ref_first_name[name=?]", "ref[first_name]"

      assert_select "input#ref_last_name[name=?]", "ref[last_name]"

      assert_select "input#ref_publisher[name=?]", "ref[publisher]"

      assert_select "input#ref_format[name=?]", "ref[format]"

      assert_select "input#ref_pdf_url[name=?]", "ref[pdf_url]"
    end
  end
end
