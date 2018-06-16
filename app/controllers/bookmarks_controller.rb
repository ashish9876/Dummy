class BookmarksController < ApplicationController
 
  def index
    @feeds = current_user.bookmark_feeds
  end

  def create
	  @bookmark = current_user.bookmarks.build(feed_id: params[:feed_id])
    if @bookmark.save
      flash[:notice] = "Successfully feed added as bookmark"
    else
      flash[:error] = @bookmark.error.full_messages
    end
    redirect_to root_path
  end

  def destroy
    @bookmark = current_user.bookmarks.find_by(feed_id: params[:feed_id], id: params[:id]) 
    if @bookmark.destroy
      flash[:notice] = "Bookmark feed Successfully destroy"
    else
      flash[:error] = @bookmark.error.full_messages
    end
    redirect_to root_path
  end

end