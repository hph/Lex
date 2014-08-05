class Version < ActiveRecord::Base
  has_many :chapters, dependent: :destroy
  has_many :laws, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
