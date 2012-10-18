class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable
  devise :omniauthable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid
  # attr_accessible :title, :body

  has_many :posts
  has_many :comments

  def self.find_by_facebook_id(id)
    user = User.where(:provider => 'facebook', :uid => id).first
    user = User.create(:provider => 'facebook', :uid => id) unless user
    user
  end
end
