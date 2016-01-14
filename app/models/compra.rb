class Compra < ActiveRecord::Base
    belongs_to :empleado
    belongs_to :proyecto
    belongs_to :solicitud
    belongs_to :proveedor
    has_many :productos
    accepts_nested_attributes_for :productos, :allow_destroy => true, reject_if: :all_blank
    
    before_save :subtotal, :iva, :total
    
    before_create :setpin
    
    def estatus
        if self.aprobar
            "Aprobada"
        else
            "Pendiente"
        end
    end
    
    def subtotal
        self.sub_total = self.productos.sum(:total_compra)
    end
    
    def iva
        subtotal
        self.iva = self.sub_total * 0.16
    end
    
    def total
        iva
        self.total = self.iva + self.sub_total
    end
    
    private
   
    def setpin
       self.pin = "HPIOC#{Compra.count + 1}"
    end
end
