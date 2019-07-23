class Api::V1::GalleryController < ApplicationController

    skip_before_action :authorized, only: [:update, :show]

    def show
        @gallery = current_user.gallery
        render json: GallerySerializer.new(@gallery.with_attached_photos)
    end

    def update

        @user = User.find(params['id'])



        if @user.valid?

        # @newImage = Photo.new
        #
        # @newImage.image = params['image']
        #
        # @photo = Photo.create!(image: @newImage.image, description: @newImage.description, gallery_id: @user.gallery.id)

        @user.gallery.photos.attach(params['image'])

        render json: {gallery: GallerySerializer.new(Gallery.where(user:@user.id).with_attached_photos)}

        else @user.valid? && !params['image'].nil?

        render json: { error: "No Can Do Buddy" }, status: :not_acceptable

        end
    end









end
