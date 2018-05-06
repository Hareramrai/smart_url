require 'rails_helper'

RSpec.describe "short_urls/index", type: :view do
  before(:each) do
    assign(:short_urls, [
      ShortUrl.create!(
        :url => "Url",
        :url_key => "Url Key"
      ),
      ShortUrl.create!(
        :url => "Url",
        :url_key => "Url Key"
      )
    ])
  end

  it "renders a list of short_urls" do
    render
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
