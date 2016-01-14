json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :nombre, :email, :status
  json.url usuario_url(usuario, format: :json)
end
