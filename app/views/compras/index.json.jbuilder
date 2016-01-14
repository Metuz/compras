json.array!(@compras) do |compra|
  json.extract! compra, :id, :pin, :empleado_id, :proyecto_id
  json.url compra_url(compra, format: :json)
end
