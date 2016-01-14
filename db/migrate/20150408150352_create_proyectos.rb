class CreateProyectos < ActiveRecord::Migration
  def change
    create_table :proyectos do |t|
      t.string :nombre
      t.boolean :status, default: true
      t.string :pin

      t.timestamps
    end
  end
end
