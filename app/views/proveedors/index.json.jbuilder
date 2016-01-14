json.array!(@proveedors) do |proveedor|
  json.extract! proveedor, :id, :empresa, :nombre, :direccion, :cp, :telefono, :rfc, :contacto
  json.url proveedor_url(proveedor, format: :json)
end
