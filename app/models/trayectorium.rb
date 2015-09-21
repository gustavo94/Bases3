class Trayectorium < ActiveRecord::Base
	has_many :paradas, :foreign_key => "trayectoria_id", :class_name => "Parada"
	LIMITES = {espacio: 10 , tiempo: 0.5, semantica: 0.5}
	PESOS = {espacio: 0.33 , tiempo: 0.33, semantica: 0.34}

	def self.parity( trayectoriaA , trayectoriaB)
		parity = 0
		trayectoriaA.paradas.each do |a|
			parity = parity + trayectoriaB.paradas.map{ |b| score(a,b) }.max
		end
		parity	
	end

	def self.MSM(trayectoriaA, trayectoriaB)
		numerador = parity(trayectoriaA,trayectoriaB) + parity(trayectoriaB,trayectoriaA)
		denominador = trayectoriaA.paradas.count + trayectoriaB.paradas.count
		numerador/denominador
	end

private
	def self.score(a,b)
		espacio = (dist_espacio(a,b) < LIMITES[:espacio])? 1 : 0
		espacio = espacio * PESOS[:espacio]
		tiempo = (dist_tiempo(a,b) < LIMITES[:tiempo])? 1 : 0
		tiempo = tiempo * PESOS[:tiempo]
		semantica = (dist_semantica(a,b) < LIMITES[:semantica])? 1 : 0
		semantica = semantica * PESOS[:semantica]
		puts "match tiempo #{a.tipo}  #{b.tipo} #{dist_tiempo(a,b) < LIMITES[:tiempo]}"

		espacio + tiempo + semantica
	end

	def self.dist_espacio(a,b)
		Math.sqrt((a.x-b.x)**2 + (a.y-b.y)**2)
	end

	def self.dist_tiempo(a,b)
		numerador= ([a.inicio,b.inicio].max - [a.fin,b.fin].min).abs
		denominador = ([a.inicio,b.inicio].min - [a.fin,b.fin].max).abs
		1 - (numerador/denominador)
	end

	def self.dist_semantica(a,b)
		(a.tipo.downcase.eql? b.tipo.downcase)? 0 : 1
	end


end
