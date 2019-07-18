class Api::V1::FriendsController < ApplicationController

      before_action :set_friend, only: :destroy

      def index
        @friends = current_user.friends
      end


      def destroy
          @friend.destroy
      end




      private
      def set_user
        @user = User.find(params[:id])
      end

      def set_friend
        @friend = current_user.friends.find(params[:id])
      end
    end
