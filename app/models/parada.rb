class Parada < ActiveRecord::Base
	belongs_to :trayectoria, :foreign_key => "trayectoria_id", :class_name => "Trayectorium"
end
