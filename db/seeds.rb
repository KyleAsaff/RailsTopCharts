# Seeds database from CSV file

require 'csv'
require 'date'

csv_file_path = "#{Rails.root}/db/category-rankings_US_iPhone_All Categories_2015-5-8_Stripped.csv"
puts csv_file_path
CSV.foreach(csv_file_path, headers: true, :encoding => 'MacRoman') do |row|
  id = row[3]
  date = Date.strptime(row[2], "%m/%d/%y")
  iap = row[10]? true : false
  # If not duplicate app by ID
  if(!App.exists?(:id => id))
    App.create!({
                  :country => row[0],
                  :category => row[1],
                  :date => date,
                  :id => id,
                  :name => row[4],
                  :company => row[5],
                  :icon => row[6],
                  :url => row[7],
                  :release_date => row[8],
                  :updated_date => row[9],
                  :in_app_purchases => iap,
                  :rating => row[11].to_f,
                  :price => row[12].to_f,
                  :global_ratings => row[13].to_i,
                  :country_ratings => row[14].to_i,
                  :current_version_ratings => row[15].to_i,
                  :iphone_downloads => row[16].to_i,
                  :ipad_downloads => row[17].to_i,
                  :iphone_revenue => row[18].to_s.tr('$', '').to_f,
                  :ipad_revenue => row[19].to_s.tr('$', '').to_f
    })
    puts "Added Record (ID: "+id+")"

=begin
# Uncomment to update records if duplicate found

  else
    App.update(id, {
    :country => row[0],
    :category => row[1],
    :date => date,
    :id => id,
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
    puts "Added Record (ID: "+id+")"
=end

  end
end
