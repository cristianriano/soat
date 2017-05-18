class User < ApplicationRecord
  DOCUMENT_TYPES = ["Cedula", "Tarjeta de identidiad", "Cedula de Extranjeria"]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates :lastname, presence: true
  validates :document, presence: true, format: { with: /\d/ }, length: { minimum: 6 }
  validates :document_type, presence: true, inclusion: { in: DOCUMENT_TYPES }
end
