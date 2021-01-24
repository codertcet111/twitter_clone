class User < ApplicationRecord
  validates :username, :fullname, presence: true, length: { maximum: 20, minimum: 3 }
  validates :username, uniqueness: true

  has_many :tweets, dependent: :destroy, foreign_key: :author_id
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :follows, foreign_key: :follower_id
  has_many :followings, through: :follows, source: :followed_user
  has_many :received_follows, foreign_key: :followed_id, class_name: 'Follow'
  has_many :followers, through: :received_follows, source: :follower
  has_secure_password
  validates :password, length: { minimum: 6 }, presence: true

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end
