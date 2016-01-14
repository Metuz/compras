class CreateSolicituds < ActiveRecord::Migration
  def change
    create_table :solicituds do |t|
      t.string :pin
      t.integer :empleado_id
      t.integer :proyecto_id

      t.timestamps
    end
  end
end
