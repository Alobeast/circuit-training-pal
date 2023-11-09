class Exercise < ApplicationRecord
  belongs_to :block

  validates :name, presence: true
  validates :reps, presence: true

  delegate :session, to: :block
end
