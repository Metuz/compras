class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :nombre
      t.string :descripcion
      t.string :uso
      t.integer :cantidad
      t.float :precio
      t.string :unidad
      t.integer :solicitud_id
      t.integer :compra_id

      t.timestamps
    end
  end
end
