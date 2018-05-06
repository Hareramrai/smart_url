module Encoder
  extend ActiveSupport::Concern

  def encode value 
    hashids.encode(value)
  end

  def hashids 
    @hashids ||= Hashids.new(Rails.application.secrets.hashids_salt)
  end
end