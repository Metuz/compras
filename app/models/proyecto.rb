class Proyecto < ActiveRecord::Base
    has_many :solicituds
    has_many :compras
    validates :nombre, presence: true
    validates :pin, presence: true
    
    def estatus
        if self.status
            "Activo"
        else
            "Inactivo"
        end
    end
end
