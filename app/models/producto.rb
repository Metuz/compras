class Producto < ActiveRecord::Base
    belongs_to :solicitud
    belongs_to :proveedor
    belongs_to :compra
    
    before_save :precio_total, :total
    

    def precio_total
        if self.cantidad && self.precio
            self.total = self.cantidad * self.precio
        end
    end
    
    def total
        if self.aprobar && self.compra_id
            self.total_compra = self.cantidad_compra * self.precio_compra
        end
    end
   
end
