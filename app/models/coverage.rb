class Coverage < ApplicationRecord
  include ActionView::Helpers::NumberHelper
  TYPES = [:death, :medical, :inability, :transport]
  DESCRIPTIONS = {death: "Muerte y gastos funerarios",
    medical: "Gastos médicos",
    inability: "Incapacidad permanente",
    transport: "Gastos de transporte"}

  acts_as_singleton

  # Methods
  def death_coverage
    "#{number_to_currency(death, delimiter: '.', precision: 0)} #{currency}"
  end

  def medical_coverage
    "#{number_to_currency(medical, delimiter: '.', precision: 0)} #{currency}"
  end

  def inability_coverage
    "#{number_to_currency(inability, delimiter: '.', precision: 0)} #{currency}"
  end

  def transport_coverage
    "#{number_to_currency(transport, delimiter: '.', precision: 0)} #{currency}"
  end
end
