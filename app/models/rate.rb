class Rate < ApplicationRecord
  # Constants
  FOSYGA_RATE = 0.5
  RUNT_RATE = 1610

  # Methods
  def fosyga
    FOSYGA_RATE * bonus
  end

  def fosyga_percentage
    number_to_percentage(FOSYGA_RATE, precision: 1)
  end

  def runt
    RUNT_RATE
  end
end
