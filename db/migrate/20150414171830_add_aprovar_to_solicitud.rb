class AddAprovarToSolicitud < ActiveRecord::Migration
    def change
         add_column :solicituds, :aprobar, :boolean, default: false
    end
end
