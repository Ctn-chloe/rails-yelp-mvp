class Review < ApplicationRecord
  belongs_to :restaurant

  after_destroy :log_destroy_action

  def log_destroy_action
    puts 'Reviews destroyed'
  end

  validates :content, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, numericality: { greater_than_or_equal_to: 0 }
  validates :rating, numericality: { less_than_or_equal_to: 5 }
end
