class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :stripe_token

  has_many :links

  def create_link(link)
    self.links << Link.create(text: link)
    save
  end
end
