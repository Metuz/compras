json.array!(@solicituds) do |solicitud|
  json.extract! solicitud, :id, :pin, :empleado_id, :proyecto_id
  json.url solicitud_url(solicitud, format: :json)
end
