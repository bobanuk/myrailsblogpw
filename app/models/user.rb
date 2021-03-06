class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  validate  :avatar_size
  extend FriendlyId
  friendly_id :name, use: :slugged

  private
  def avatar_size
    if avatar.size > 5.megabytes
      errors.add(:user_avatar, "should be less than 5MB")
    end
  end

end
