class Session < ApplicationRecord
  has_many :blocks, dependent: :destroy
  validates :name, presence: true

  scope :ordered, -> { order(created_at: :desc) }
  # after_create_commit -> { broadcast_prepend_to "sessions", partial: "sessions/session", locals: { session: self }, target: "sessions" }
  # if following naming conventions the above line can be abbreviated to the following line :
  # after_create_commit -> { broadcast_prepend_later_to "sessions" }
  # after_update_commit -> { broadcast_replace_later_to "sessions" }
  # after_destroy_commit -> { broadcast_remove_to "sessions" }

  # again if following conventions the 3 lines above are equivalent to the following
  broadcasts_to ->(session) { "sessions" }, inserts_by: :prepend
end
