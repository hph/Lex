class User < ActiveRecord::Base
  devise :confirmable, :database_authenticatable, :recoverable, :registerable,
    :rememberable, :trackable, :validatable
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates_format_of :username, with: /\A[a-z0-9]{2,16}\Z/
end
