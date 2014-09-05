class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, :omniauth_providers => [:facebook]

   has_many :courses, :dependent => :destroy


	def self.new_with_session(params, session)
       super.tap do |user|
	      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
	        user.email = data["email"] if user.email.blank?
	      end
        end
  end

 def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.email = auth.info.email
	    user.password = Devise.friendly_token[0,20]
	    user.profile_name = auth.info.name   # assuming the user model has a name
	  end
	end


# def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
#     user = User.where(:provider => auth.provider, :uid => auth.uid).first
#     if user
#       return user
#     else
#       registered_user = User.where(:email => auth.info.email).first
#       if registered_user
#         return registered_user
#       else
#         user = User.create(profile_name:auth.extra.raw_info.name,
#                             provider:auth.provider,
#                             uid:auth.uid,
#                             email:auth.info.email,
#                             password:Devise.friendly_token[0,20],
#                           )
#       end    end
#   end
	
end
