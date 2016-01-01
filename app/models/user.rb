class User < ActiveRecord::Base
  has_many :tweets
  has_secure_password

  def slug
    username.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    all.find{|user| user.slug == slug}
  end

  def before_save
    username.downcase!
  end
end