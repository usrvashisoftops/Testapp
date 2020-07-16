class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :questions
  has_many :answers
  has_many :topics  
  has_many :follow_users
  has_many :follow_topics
  
  def following
    self.follow_users.map do |u|
      User.where(id: u.folow_user_id) 
    end  
  end

  def following_topics
    self.follow_topics.map do |u|
      Topic.where(id: u.topic_id) 
    end  
  end
end
