json.array!(@empleados) do |empleado|
  json.extract! empleado, :id, :nombre, :email
  json.url empleado_url(empleado, format: :json)
end
