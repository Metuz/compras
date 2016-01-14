class CreateEmpleados < ActiveRecord::Migration
  def change
    create_table :empleados do |t|
      t.string :nombre
      t.string :email
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
