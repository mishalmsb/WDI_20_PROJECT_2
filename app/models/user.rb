class User < ActiveRecord::Base
  has_many :bets
  has_many :bets, :through => :bets
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :graffiti_image, GraffitiImageUploader
  

end
