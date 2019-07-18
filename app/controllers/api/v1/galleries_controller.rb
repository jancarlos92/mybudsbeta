class Api::V1::GalleriesController < ApplicationController




def update
    # the update function should create a new photo then add the photo ID to the
    # gallery

    #if the user is trying to remove a photo from the gallery the update function should use
    #the photo id from the post event and remove it from the gallery

    @user = User.find(params[:id])


end







private

def user_params
    params.require(:user).require(:user).permit(:id, :image, :descripition)
end





end
