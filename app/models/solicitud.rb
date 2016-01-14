class Solicitud < ActiveRecord::Base
    belongs_to :empleado
    belongs_to :proyecto
    has_one :compra
    
    has_many :productos, :dependent => :destroy  
    accepts_nested_attributes_for :productos, :allow_destroy => true, reject_if: :all_blank
    
    validates :proyecto_id, presence: true
    validates :empleado_id, presence: true
    
    before_save :precio_total
    before_create :setpin
    
    def self.search(search)
        Empleado.find_by(email: search)
    end
    
    def precio_total
        self.total = self.productos.sum(:total)
    end
        
    def estatus
       if self.aprobar
           "Aprobada"
       else
           "Pendiente"
       end
    end
    
    def crear_compra(solicitud)
        Compra.create(empleado_id: solicitud.empleado_id, proyecto_id: solicitud.proyecto_id, solicitud_id: solicitud.id)
    end
    
    private
   
    def setpin
       self.pin = "HPI#{Solicitud.count + 1}"
    end
    
end
