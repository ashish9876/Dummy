class UsersController < ApplicationController


  def index
	@users =User.all
	@friendships =Friendship.all
    @friends = current_user.all_my_friends
    @feeds = current_user.feeds
 
  end


  def show
  	 @friendship =Friendship.all
  	 @user = User.find(params[:id])
  	  @friends = current_user.all_my_friends
  	   @feeds = current_user.feeds

  end
end