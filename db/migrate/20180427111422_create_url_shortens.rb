class CreateUrlShortens < ActiveRecord::Migration[5.2]
  def change
    create_table :url_shortens do |t|
      t.references :user, foreign_key: true, index: true
      t.text :original_url
      t.string :short_url
      t.integer :clicks, default: 0
      t.datetime :expire_at
      t.boolean :is_disable, default: false
      t.string :ip_address
      t.string :geo_location

      t.timestamps
    end
  end
end
