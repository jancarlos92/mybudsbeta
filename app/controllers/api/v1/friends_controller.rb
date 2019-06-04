class FriendsController < ApplicationController
  def index
  end

  def destroy
      current_user.remove_friend(@friend)
      head :no_content
  end
end
