class User < ApplicationRecord

include Rails.application.routes.url_helpers


validates :username, presence: true, uniqueness: { case_sensitive: false }
#
#
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
#
validates :email, presence: true, length: { maximum: 255 },
                  format: { with: VALID_EMAIL_REGEX },
                  uniqueness: { case_sensitive: false }
#
#
validates :password_digest, presence: true, length: { minimum: 6 }

has_secure_password

has_one_attached :avatar

has_many :friend_requests, dependent: :destroy

has_many :pending_friends, through: :friend_requests, source: :friend

has_many :friendships, dependent: :destroy

has_many :friends, through: :friendships

has_many :strain_reviews

has_one :strain, through: :strain_reviews

has_many :dispensary_strains

has_many :strains, through: :dispensary_strains

has_one :gallery

has_many :photos, :through => :gallery




# def avatar_on_disk
#     ActiveStorage::Blob.service.send(:path_for, avatar.key)
# end

end
