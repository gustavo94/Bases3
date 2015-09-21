json.array!(@trayectoria) do |trayectorium|
  json.extract! trayectorium, :id, :nombre
  json.url trayectorium_url(trayectorium, format: :json)
end
