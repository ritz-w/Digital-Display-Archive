require 'rails_helper'

RSpec.describe "refs/show", type: :view do
  before(:each) do
    @ref = assign(:ref, Ref.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :publisher => "Publisher",
      :format => "Format",
      :pdf_url => "Pdf Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Publisher/)
    expect(rendered).to match(/Format/)
    expect(rendered).to match(/Pdf Url/)
  end
end
