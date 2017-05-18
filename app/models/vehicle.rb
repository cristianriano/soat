class Vehicle < ApplicationRecord
  # Constants
  CATEGORIES = ["CAMPEROS Y CAMIONETAS", "BUSES Y BUSETAS DE SERVICIO PUBLICO URBANO", "MOTOS", "AUTOS DE NEGOCIOS Y TAXIS", "AUTOS FAMILIARES", "VEHICULO PARA SEIS O MAS PASAJEROS", "CARGA O MIXTO", "SERVICIO PUBLICO INTERMUNICIPAL", "OFICIALES ESPECIALES"]
  SUBCATEGORIES = ["Más de 15 toneladas", "1500 a 2500 cc", "De 5 a 15 toneladas", "MOTOCARROS", "Menos de 5 toneladas", "2500 cc o mas", "De 100 a 200 cc", "", "Menos de 2500 cc", "Más de 200 cc", "Más de 2500 cc", "Menos de 1500 cc", "10 ó mas pasajeros", "Menos de 100 cc", "Menor de 10 pasajeros"]
  SUBCATEGORIES_HASH = { "CAMPEROS Y CAMIONETAS" => ["Menos de 1500 cc", "Menos de 1500 cc", "1500 a 2500 cc", "1500 a 2500 cc", "Más de 2500 cc", "Más de 2500 cc"],
    "BUSES Y BUSETAS DE SERVICIO PUBLICO URBANO"=>[""],
    "MOTOS"=>["Menos de 100 cc", "De 100 a 200 cc", "Más de 200 cc", "MOTOCARROS"],
    "AUTOS DE NEGOCIOS Y TAXIS"=>["Menos de 1500 cc", "Menos de 1500 cc", "1500 a 2500 cc", "1500 a 2500 cc", "Más de 2500 cc", "Más de 2500 cc"],
    "AUTOS FAMILIARES"=>["Menos de 1500 cc", "Menos de 1500 cc", "1500 a 2500 cc", "1500 a 2500 cc", "Más de 2500 cc", "Menos de 1500 cc"],
    "VEHICULO PARA SEIS O MAS PASAJEROS"=>["Menos de 2500 cc", "Menos de 2500 cc", "2500 cc o mas", "2500 cc o mas"],
    "CARGA O MIXTO"=>["Menos de 5 toneladas", "De 5 a 15 toneladas", "Más de 15 toneladas"],
    "SERVICIO PUBLICO INTERMUNICIPAL"=>["Menor de 10 pasajeros", "10 ó mas pasajeros"],
    "OFICIALES ESPECIALES"=>["Menos de 1500 cc", "1500 a 2500 cc", "Más de 2500 cc"]}

  VALUE_TYPES = ["Número de pasajeros", "Cilindraje", "Toneladas"]

  # Associations
  belongs_to :user
  belongs_to :rate

  # Validations
  # Acording to Colombia types of licenses found on: http://andina.com.co/blog/sabes-cuantos-tipos-de-placas-existen-en-colombia/
  # Un comment format validator if only colombian licenses
  validates :license, presence: true#, format: {with: /[A-Z]{1,3}\d{3,4}/}, length: { minimum: 5, maximum: 6}
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :subcategory, presence: true, inclusion: { in: SUBCATEGORIES }
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :value_type, presence: false, inclusion: { in: VALUE_TYPES }
  validates :value, presence: false, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end