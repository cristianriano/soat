# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#
# Insurance Coverage
#
coverage = Coverage.instance
coverage.death = 750
coverage.medical = 800
coverage.inability = 180
coverage.transport = 10
coverage.currency = "SMLDV"
coverage.save

#
# Rates
#
if Rate.count.zero?
  Rate.create!(
    code: "110",
    category: "MOTOS",
    subcategory: "Menos de 100 cc",
    bonus: 203100,
    total: 306260
  )

  Rate.create!(
    code: "120",
    category: "MOTOS",
    subcategory: "De 100 a 200 cc",
    bonus: 272700,
    total: 410660
  )

  Rate.create!(
    code: "130",
    category: "MOTOS",
    subcategory: "Más de 200 cc",
    bonus: 307600,
    total: 463010
  )

  Rate.create!(
    code: "140",
    category: "MOTOS",
    subcategory: "MOTOCARROS",
    bonus: 307600,
    total: 463010
  )

  Rate.create!(
    code: "211",
    category: "CAMPEROS Y CAMIONETAS",
    subcategory: "Menos de 1500 cc",
    min_age: 0,
    max_age: 9,
    bonus: 326800,
    total: 491810
  )

  Rate.create!(
    code: "212",
    category: "CAMPEROS Y CAMIONETAS",
    subcategory: "Menos de 1500 cc",
    min_age: 10,
    max_age: 99,
    bonus: 393200,
    total: 591410
  )

  Rate.create!(
    code: "221",
    category: "CAMPEROS Y CAMIONETAS",
    subcategory: "1500 a 2500 cc",
    min_age: 0,
    max_age: 9,
    bonus: 390400,
    total: 587200
  )

  Rate.create!(
    code: "222",
    category: "CAMPEROS Y CAMIONETAS",
    subcategory: "1500 a 2500 cc",
    min_age: 10,
    max_age: 99,
    bonus: 462700,
    total: 695660
  )

  Rate.create!(
    code: "231",
    category: "CAMPEROS Y CAMIONETAS",
    subcategory: "Más de 2500 cc",
    min_age: 0,
    max_age: 9,
    bonus: 458100,
    total: 688760
  )

  Rate.create!(
    code: "232",
    category: "CAMPEROS Y CAMIONETAS",
    subcategory: "Más de 2500 cc",
    min_age: 10,
    max_age: 99,
    bonus: 525900,
    total: 790640
  )

  Rate.create!(
    code: "310",
    category: "CARGA O MIXTO",
    subcategory: "Menos de 5 toneladas",
    bonus: 366300,
    total: 551060
  )

  Rate.create!(
    code: "320",
    category: "CARGA O MIXTO",
    subcategory: "De 5 a 15 toneladas",
    bonus: 529400,
    total: 795710
  )

  Rate.create!(
    code: "330",
    category: "CARGA O MIXTO",
    subcategory: "Más de 15 toneladas",
    bonus: 669600,
    total: 1006010
  )

  Rate.create!(
    code: "410",
    category: "OFICIALES ESPECIALES",
    subcategory: "Menos de 1500 cc",
    bonus: 412300,
    total: 620060
  )

  Rate.create!(
    code: "420",
    category: "OFICIALES ESPECIALES",
    subcategory: "1500 a 2500 cc",
    bonus: 520000,
    total: 781610
  )

  Rate.create!(
    code: "430",
    category: "OFICIALES ESPECIALES",
    subcategory: "Más de 2500 cc",
    bonus: 623600,
    total: 937010
  )

  Rate.create!(
    code: "511",
    category: "AUTOS FAMILIARES",
    subcategory: "Menos de 1500 cc",
    min_age: 0,
    max_age: 9,
    bonus: 183900,
    total: 277460
  )

  Rate.create!(
    code: "512",
    category: "AUTOS FAMILIARES",
    subcategory: "Menos de 1500 cc",
    min_age: 10,
    max_age: 99,
    bonus: 244100,
    total: 367760
  )

  Rate.create!(
    code: "521",
    category: "AUTOS FAMILIARES",
    subcategory: "1500 a 2500 cc",
    min_age: 0,
    max_age: 9,
    bonus: 224200,
    total: 337910
  )

  Rate.create!(
    code: "522",
    category: "AUTOS FAMILIARES",
    subcategory: "1500 a 2500 cc",
    min_age: 10,
    max_age: 99,
    bonus: 279100,
    total: 420260
  )

  Rate.create!(
    code: "531",
    category: "AUTOS FAMILIARES",
    subcategory: "Más de 2500 cc",
    min_age: 0,
    max_age: 9,
    bonus: 262100,
    total: 394760
  )

  Rate.create!(
    code: "532",
    category: "AUTOS FAMILIARES",
    subcategory: "Menos de 1500 cc",
    min_age: 10,
    max_age: 99,
    bonus: 311000,
    total: 468110
  )

  Rate.create!(
    code: "611",
    category: "VEHICULO PARA SEIS O MAS PASAJEROS",
    subcategory: "Menos de 2500 cc",
    min_age: 0,
    max_age: 9,
    bonus: 328700,
    total: 494660
  )

  Rate.create!(
    code: "612",
    category: "VEHICULO PARA SEIS O MAS PASAJEROS",
    subcategory: "Menos de 2500 cc",
    min_age: 10,
    max_age: 99,
    bonus: 420000,
    total: 631610
  )

  Rate.create!(
    code: "621",
    category: "VEHICULO PARA SEIS O MAS PASAJEROS",
    subcategory: "2500 cc o mas",
    min_age: 0,
    max_age: 9,
    bonus: 440400,
    total: 662210
  )

  Rate.create!(
    code: "622",
    category: "VEHICULO PARA SEIS O MAS PASAJEROS",
    subcategory: "2500 cc o mas",
    min_age: 10,
    max_age: 99,
    bonus: 528900,
    total: 794960
  )

  Rate.create!(
    code: "711",
    category: "AUTOS DE NEGOCIOS Y TAXIS",
    subcategory: "Menos de 1500 cc",
    min_age: 0,
    max_age: 9,
    bonus: 228200,
    total: 343910
  )

  Rate.create!(
    code: "712",
    category: "AUTOS DE NEGOCIOS Y TAXIS",
    subcategory: "Menos de 1500 cc",
    min_age: 10,
    max_age: 99,
    bonus: 285200,
    total: 429410
  )

  Rate.create!(
    code: "721",
    category: "AUTOS DE NEGOCIOS Y TAXIS",
    subcategory: "1500 a 2500 cc",
    min_age: 0,
    max_age: 9,
    bonus: 283700,
    total: 427160
  )

  Rate.create!(
    code: "722",
    category: "AUTOS DE NEGOCIOS Y TAXIS",
    subcategory: "1500 a 2500 cc",
    min_age: 10,
    max_age: 99,
    bonus: 350900,
    total: 527960
  )

  Rate.create!(
    code: "731",
    category: "AUTOS DE NEGOCIOS Y TAXIS",
    subcategory: "Más de 2500 cc",
    min_age: 0,
    max_age: 9,
    bonus: 366300,
    total: 551060
  )

  Rate.create!(
    code: "732",
    category: "AUTOS DE NEGOCIOS Y TAXIS",
    subcategory: "Más de 2500 cc",
    min_age: 10,
    max_age: 99,
    bonus: 430000,
    total: 646610
  )

  Rate.create!(
    code: "810",
    category: "BUSES Y BUSETAS DE SERVICIO PUBLICO URBANO",
    subcategory: "",
    bonus: 536300,
    total: 806060
  )

  Rate.create!(
    code: "910",
    category: "SERVICIO PUBLICO INTERMUNICIPAL",
    subcategory: "Menor de 10 pasajeros",
    bonus: 541200,
    total: 813410
  )

  Rate.create!(
    code: "920",
    category: "SERVICIO PUBLICO INTERMUNICIPAL",
    subcategory: "10 ó mas pasajeros",
    bonus: 785900,
    total: 1180460
  )
end
