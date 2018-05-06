require 'rails_helper'

RSpec.describe ShortUrl, type: :model do
  
  describe 'validations' do
    it { should validate_presence_of(:url) }
  end

  describe 'callbacks' do
    it 'execute update_url_key when gets created' do
      expect_any_instance_of(ShortUrl).to receive(:update_url_key)
      create(:short_url)
    end

    it 'generates the url key after saving to db ' do
      short_url = create(:short_url)
      expect(short_url.url_key).to_not be_blank
    end
  end
end
