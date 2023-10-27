class Block < ApplicationRecord
  belongs_to :session

  validates :name, presence: true, uniqueness: { scope: :session_id }

  scope :ordered, -> { order(created_at: :asc) }

  # before_validation :set_block_name, on: :create

  private

  # def set_block_name
  #   puts "HELLO BORDEL"
  #   existing_blocks = self.session.blocks.count
  #   self.name = "Block #{existing_blocks + 1}"
  # end
end
