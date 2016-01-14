class CreateCompras < ActiveRecord::Migration
  def change
    create_table :compras do |t|
      t.string :pin
      t.integer :empleado_id
      t.integer :proyecto_id
      t.integer :solicitud_id
      t.boolean :aprobar, default: false
      t.float :total
      t.integer :proveedor_id
      t.float :sub_total
      t.float :iva

      t.timestamps
    end
  end
end
