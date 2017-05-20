class Rate < ApplicationRecord
  # Constants
  FOSYGA_RATE = 0.5
  RUNT_RATE = 1610
  CODES = ["110", "120", "130", "140", "211", "212", "221", "222", "231", "232", "310", "320", "330", "410", "420", "430", "511", "512", "521", "522", "531", "532", "611", "612", "621", "622", "711", "712", "721", "722", "731", "732", "810", "910", "920"]

  # Hooks
  before_save :set_total

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

  def age_range
    if min_age == 0 && max_age == 99
      ""
    elsif max_age == 99
      "#{min_age} años o más"
    else
      "#{min_age} a #{max_age} años"
    end
  end

  def calculate_total
    bonus + fosyga + RUNT_RATE
  end

  def set_total
    self.total = calculate_total unless total.present?
  end
end
