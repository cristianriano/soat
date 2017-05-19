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
    "#{death.round(0)} #{currency}"
  end

  def medical_coverage
    "#{medical.round(0)} #{currency}"
  end

  def inability_coverage
    "#{inability.round(0)} #{currency}"
  end

  def transport_coverage
    "#{transport.round(0)} #{currency}"
  end
end
