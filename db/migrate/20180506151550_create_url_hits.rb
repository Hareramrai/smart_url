class CreateUrlHits < ActiveRecord::Migration[5.1]
  def change
    create_table :url_hits do |t|
      t.string :browser
      t.string :platform_name
      t.string :platform_version
      t.string :browser_version
      t.string :browser_type
      t.string :country
      t.string :city
      t.references :short_url, foreign_key: true

      t.timestamps
    end
  end
end
