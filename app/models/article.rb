class Article < ApplicationRecord
  belongs_to :user
  after_initialize :set_defaults
  validates :title, presence: true
  validates :content, presence: true
  validates :published_at, presence: true

  def set_defaults
    self.readings ||= 0
  end
end
