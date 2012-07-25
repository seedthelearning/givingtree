class Link < ActiveRecord::Base
  attr_accessible :text, :user_id, :seed_id

  belongs_to :user

  def url
    "#{HOST_URL}participants/#{text}"
  end

  def facebook_url
    <<-url
http://www.facebook.com/dialog/feed?
app_id=100736836740408&
link=#{HOST_URL}/participants/#{text}&
picture=http://1337807.com/images/seedthelearning.png&
name=Seed%20The%20Learning&
caption=Change%20Kids%27%20Lives&
description=Visit%20SeedTheLearning.com%20and%20I%20will%20donate%20$1%20to%20DonorsChoose.org!%20Easiest%20Karma%20ever.&
redirect_uri=http://seedthelearning.com/users/#{self.user_id}
    url
  end
end
