class AddAprobarToProdcuto < ActiveRecord::Migration
    def change
         add_column :productos, :aprobar, :boolean, default: false
    end
end
