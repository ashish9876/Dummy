class FeedsController < ApplicationController



  
def published
 @user =User.all
    end



  def index
    @feeds = if current_user.present?
    @friends = current_user.all_my_friends
      Feed.all
     else
      Feed.universal
    end
  end

  def show
   @feed = Feed.find(params[:id])
   # Feed.order("created_at DESC")
  end 

  def new
   @feed = Feed.new
   
  end

  def create
  
   @feed = current_user.feeds.build(feed_params)

   if @feed.save
     redirect_to @feed
   else
   render 'new'
    end
  #  if current_user.feed.exist?
  #   render 'new'
  # else
  #   @feed.save
  # end
end


  private
   def feed_params
     params.require(:feed).permit(:text ,:image,  :permission,:desc)
  end
end

