class AppsController < ApplicationController
  def paid
   @apps = App
   .where('price > 0.00')
   .paginate(:page => params[:page], :per_page => 50)
   .order('iphone_downloads + ipad_downloads')
  end

  def free
   @apps = App
   .where('price = 0.00')
   .paginate(:page => params[:page], :per_page => 50)
   .order('iphone_downloads + ipad_downloads')
  end

  def top_grossing
   @apps = App
   .paginate(:page => params[:page], :per_page => 50)
   .order('iphone_revenue + ipad_revenue')
  end
end
