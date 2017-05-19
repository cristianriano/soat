class Insurance < ApplicationRecord
  # Associations
  belongs_to :vehicle
  belongs_to :rate
  has_one :user, through: :vehicle

  # Methods
  alias_attribute :bought_at, :created_at

  # Scopes
  default_scope { order('created_at DESC') }

  def calculate_expiration
    self.starts_at = vehicle.next_insurance_start
    self.ends_at = starts_at + 1.year
  end
end
