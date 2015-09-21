class CreateParadas < ActiveRecord::Migration
  def change
    create_table :paradas do |t|
      t.decimal :x
      t.decimal :y
      t.time :inicio
      t.time :fin
      t.text :tipo
      t.integer :trayectoria_id

      t.timestamps null: false
    end

     execute <<-SQL
    ALTER TABLE paradas
    ADD CONSTRAINT fk_paradas_trayectorias
    FOREIGN KEY(trayectoria_id)
    REFERENCES trayectoria(id);
    SQL
  end
end
