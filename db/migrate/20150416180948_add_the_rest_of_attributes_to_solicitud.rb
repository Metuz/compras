class AddTheRestOfAttributesToSolicitud < ActiveRecord::Migration
    def change
        add_column :productos, :precio_compra, :float
        add_column :productos, :unidad_compra, :string
        add_column :productos, :total_compra, :float
        add_column :productos, :descripcion_compra, :string
        add_column :productos, :cantidad_compra, :int
    end
end
