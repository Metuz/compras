class AddPrecioTotalToSolicituds < ActiveRecord::Migration
    def change
        add_column :solicituds, :total, :float
    end
end
