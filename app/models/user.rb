# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  has_one_attached :avatar
  has_many :active_friendships,   class_name: 'Friendship',
                                    inverse_of: 'follower',
                                    foreign_key: 'follower_id',
                                    dependent: :destroy
  has_many :passive_friendships,  class_name: 'Friendship',
                                    inverse_of: 'followed',
                                    foreign_key: 'followed_id',
                                    dependent: :destroy
  has_many :following, through: :active_friendships, source: :followed
  has_many :followers, through: :passive_friendships, source: :follower

  validates :uid, uniqueness: { scope: :provider }, if: -> { uid.present? }

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
