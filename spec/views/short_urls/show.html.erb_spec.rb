require 'rails_helper'

RSpec.describe "short_urls/show", type: :view do
  before(:each) do
    @short_url = assign(:short_url, ShortUrl.create!(
      :url => "Url",
      :url_key => "Url Key"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Short Url/)
  end
end
