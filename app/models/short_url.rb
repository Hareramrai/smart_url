class ShortUrl < ApplicationRecord
  include Encoder
  validates :url, presence: true
  # callbacks
  after_save {
    update_url_key
  }

  private 

  def update_url_key 
    update_column(:url_key, encode(id))
  end
end
