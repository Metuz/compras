class Proveedor < ActiveRecord::Base
    has_many :productos
    has_many :compras
    
    validates :empresa, presence: true
    validates :nombre, presence: true
    validates :direccion, presence: true
    validates :cp, presence: true
    validates :telefono, presence: true
    validates :contacto, presence: true
end
