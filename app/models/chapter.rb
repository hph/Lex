class Chapter < ActiveRecord::Base
  belongs_to :version
  has_many :laws, dependent: :destroy
  validates :version_id, presence: true, uniqueness: {scope: [:name, :ordinal]}
  validates :name, presence: true
  validates :ordinal, presence: true
end
