json.array!(@paradas) do |parada|
  json.extract! parada, :id, :x, :y, :inicio, :fin, :tipo, :trayectoria
  json.url parada_url(parada, format: :json)
end
