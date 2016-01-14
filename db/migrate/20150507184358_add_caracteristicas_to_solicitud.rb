class AddCaracteristicasToSolicitud < ActiveRecord::Migration
    def change
        add_column :solicituds, :tipo, :string
        add_column :solicituds, :moneda, :string
        add_column :solicituds, :emergencia, :boolean
    end
end
