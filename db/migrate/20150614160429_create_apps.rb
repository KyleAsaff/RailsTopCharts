class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :country
      t.string :category
      t.date :date
      t.string :name
      t.string :company
      t.string :icon
      t.string :url
      t.timestamp :release_date
      t.timestamp :updated_date
      t.boolean :in_app_purchases
      t.decimal :rating
      t.decimal :price
      t.integer :global_ratings
      t.integer :current_version_ratings
      t.integer :country_ratings
      t.integer :iphone_downloads
      t.integer :ipad_downloads
      t.decimal :iphone_revenue
      t.decimal :ipad_revenue

      t.timestamps null: false
    end
  end
end
