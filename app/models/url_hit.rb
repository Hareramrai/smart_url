class UrlHit < ApplicationRecord
  validates :browser_version, :browser_type, :platform_name, :platform_version, presence: true
  belongs_to :short_url
end