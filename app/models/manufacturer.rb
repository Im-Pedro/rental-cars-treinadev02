class Manufacturer < ApplicationRecord
  validates :name, presence: { message: 'não pode ficar em branco'}
  validates :name, uniqueness: { message: 'Fabricante já está em uso'}
end
