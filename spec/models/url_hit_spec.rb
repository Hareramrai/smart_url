require 'rails_helper'

RSpec.describe UrlHit, type: :model do
 describe 'validations' do
    it { should validate_presence_of(:browser_version) }
    it { should validate_presence_of(:browser_type) }
    it { should validate_presence_of(:platform_name) }
    it { should validate_presence_of(:platform_version) }
  end

  describe 'associations' do 
    it { should belong_to(:short_url) }
  end
end
