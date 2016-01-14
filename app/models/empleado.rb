class Empleado < ActiveRecord::Base
    has_many :solicituds
    has_many :compras
    
    before_save :downcase_email
    validates :nombre,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@hpi.org.mx+\z/i
    #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 60 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    
    def estatus
        if self.status
            "Activo"
        else
            "Desactivado"
        end
    end
    
    private 
    
    def downcase_email
        self.email = email.downcase
    end
end
