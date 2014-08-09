class Chapter < ActiveRecord::Base
  belongs_to :version
  has_many :laws, dependent: :destroy
  validates :version_id, presence: true, uniqueness: {scope: [:name, :ordinal]}
  validates :name, presence: true
  validates :ordinal, presence: true

  def laws_by_subchapters_and_subsubchapters
    Law.where(chapter_id: id).group_by(&:subchapter).map do |k, v|
      [k, v.group_by(&:subsubchapter)]
    end.to_h
  end
end
