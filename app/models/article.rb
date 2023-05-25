class Article < ApplicationRecord
  belongs_to :user
  after_initialize :set_defaults

  def set_defaults
    self.readings ||= 0
  end
end
