json.array!(@proyectos) do |proyecto|
  json.extract! proyecto, :id, :nombre, :status, :pin
  json.url proyecto_url(proyecto, format: :json)
end
