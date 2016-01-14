class CreateProveedors < ActiveRecord::Migration
  def change
    create_table :proveedors do |t|
      t.string :empresa
      t.string :nombre
      t.string :direccion
      t.string :cp
      t.string :telefono
      t.string :rfc
      t.string :contacto

      t.timestamps
    end
  end
end
