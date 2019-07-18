
class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :dob, :location, :personality_type, :avatar, :password, :bio, :friendships,
  :friend_requests, :gallery, :strain_reviews

  include Rails.application.routes.url_helpers



  def avatar
    return unless object.avatar.attached?
    object.avatar.blob.attributes
          .slice('filename', 'byte_size')
          .merge(url: avatar_url)
          .tap { |attrs| attrs['name'] = attrs.delete('filename') }

  end

  def avatar_url
    url_for(object.avatar)
  end



end
