class User < ApplicationRecord
  has_many :rooms
  has_many :reservations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable
         #このconfirmable追加後down,up
  validates :fullname, presence:true, length:{ maximum:50}

  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first
    if user
      return user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.fullname = auth.info.name #assuming the user model has a name
        user.image = auth.info.image
        user.uid = auth.uid
        user.provider = auth.provider
        # If you are using congirmable and the provider(s) you use validate emails.
        # uncomment the line below to skip the confirmation emails.

        user.skip_confirmation!
      end
    end
  end

end