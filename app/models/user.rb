class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :stripe_token

  has_many :links

  def create_link(link, seed_id)
    self.links << Link.create(text: link, seed_id: seed_id)
    save
  end
end
