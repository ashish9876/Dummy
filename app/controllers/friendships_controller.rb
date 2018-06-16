class FriendshipsController < ApplicationController

#   def index
#     @friends = current_user.all_my_friends
#     @users = User.all
#      end




  def search
    @users = User.search(params[:keyword])
    respond_to do |format|
      format.js
    end
  end

  def index
    @friendships = Friendship.all
    # @users  = User.all
    if params[:search]
      @users = User.where("first_name like ?", "%#{params[:search]}%")
    # else
    #   @users = User.all
    end
  end

  def create 
    @friendship = current_user.friendships.build(friend_id: params[:user_id])
    if @friendship.save
      flash[:notice] = "friendships Successfully created"
    else
      flash[:error] = @friendship.error.full_messages
    end
  end


  private
    def friend_params
     params.require(:friendship).permit(:user_id, :friend_id, :status)
    end

end
