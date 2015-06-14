# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# category-rankings_US_iPhone_All_Categories_2015-5-8_Stripped.csv
=begin
App.copy_from "#{Rails.root}/db/data2.csv",
  :map => {'Country' => 'country',
  		   'Category' => 'category',
  	  	   'Date' => 'date',
  	  	   'App ID' => 'id',
  	  	   'App name' => 'name',
  	  	   'Company' => 'company',
  	  	   'App icon' => 'icon',
  	  	   'App URL' => 'url',
  	  	   'Release date' => 'release_date',
  	  	   'Update date' => 'update_date',
  	  	   'In app purchases' => 'in_app_purchases',
  	  	   'Rating' => 'rating',
  	  	   'Price' => 'price',
  	  	   'Global ratings' => 'global_ratings',
  	  	   'Current version ratings' => 'current_version_ratings',
  	  	   'Country ratings' => 'country_ratings',
  	  	   'iPhone downloads' => 'iphone_downloads',
  	  	   'iPad downloads' => 'ipad_downloads',
  	  	   'iPhone revenue' => 'iphone_revenue',
  	  	   'iPad revenue' => 'ipad_revenue',
  	  	}
=end

# Seeds database from CSV file

require 'csv'
require 'date'

csv_file_path = "#{Rails.root}/db/data.csv"
puts csv_file_path
CSV.foreach(csv_file_path, headers: true, :encoding => 'windows-1251:utf-8') do |row|
  id = row[3]
  date = Date.strptime(row[2], "%m/%d/%y")
  # If not duplicate app by ID
  if(!App.exists?(:id => id))
  	App.create!({
      :country => row[0],
	  :category => row[1],
	  :date => date,
      :id => row[3],
	  :name => row[4],
	  :company => row[5],
	  :icon => row[6],
	  :url => row[7],
	  :release_date => row[8],
	  :updated_date => row[9],
	  :in_app_purchases => row[10],
	  :rating => row[11].to_i,
	  :price => row[12].to_f,
	  :global_ratings => row[13].to_i,
	  :country_ratings => row[14].to_i,
	  :current_version_ratings => row[15],
	  :iphone_downloads => row[16].to_i,
	  :ipad_downloads => row[17].to_i,
	  :iphone_revenue => row[18].to_s.tr('$', '').to_f,
	  :ipad_revenue => row[19].to_s.tr('$', '').to_f
  })
  	puts "Added Record"
  else
  	App.update(id, {
      :country => row[0],
	  :category => row[1],
	  :date => date,
      :id => row[3],
	  :name => row[4],
	  :company => row[5],
	  :icon => row[6],
	  :url => row[7],
	  :release_date => row[8],
	  :updated_date => row[9],
	  :in_app_purchases => row[10],
	  :rating => row[11].to_i,
	  :price => row[12].to_f,
	  :global_ratings => row[13].to_i,
	  :country_ratings => row[14].to_i,
	  :current_version_ratings => row[15],
	  :iphone_downloads => row[16].to_i,
	  :ipad_downloads => row[17].to_i,
	  :iphone_revenue => row[18].to_s.tr('$', '').to_f,
	  :ipad_revenue => row[19].to_s.tr('$', '').to_f
  })
  	puts "Updated Record"
  end
end