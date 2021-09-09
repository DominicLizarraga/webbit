class User < ApplicationRecord
  before_create :add_unsuscribe_hash

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :subscriptions
  has_many :communities, through: :subscriptions

  has_many :submissions
  has_many :comments


  has_many :subscribed_submissions, through: :communities, source: :submissions




  validates :username, uniqueness: true
  validates :username, presence: true

  acts_as_votable
  acts_as_voter

  private

  def add_unsuscribe_hash
    self.unsubscribe_hash = SecureRandom.hex
  end


end
