class CreateShortUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :short_urls do |t|
      t.string :url
      t.string :url_key

      t.timestamps
    end
  end
end
