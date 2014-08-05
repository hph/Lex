class Law < ActiveRecord::Base
  belongs_to :version
  belongs_to :chapter
  validates :version_id, presence: true, uniqueness: {scope: [
    :chapter_id, :name, :ordinal
  ]}
  validates :chapter_id, presence: true
  validates :name, presence: true
  validates :date, presence: true
  validates :raw_html, presence: true
  validates :original_uri, presence: true
end
