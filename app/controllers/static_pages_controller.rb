class StaticPagesController < ApplicationController
  def paid
   @static_pages = App
   .where('price > 0.00')
   .paginate(:page => params[:page], :per_page => 50)
   .order('iphone_downloads + ipad_downloads')
  end

  def free
   @static_pages = App
   .where('price = 0.00')
   .paginate(:page => params[:page], :per_page => 50)
   .order('iphone_downloads + ipad_downloads')
  end

  def top_grossing
   @static_pages = App
   .paginate(:page => params[:page], :per_page => 50)
   .order('iphone_revenue + ipad_revenue')
  end

end
