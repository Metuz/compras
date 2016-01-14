class AddIndexToEmpleadosEmail < ActiveRecord::Migration
    def change
        add_index :empleados, :email, unique: true
    end
end
