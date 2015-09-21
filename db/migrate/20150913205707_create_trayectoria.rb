class CreateTrayectoria < ActiveRecord::Migration
  def change
    create_table :trayectoria do |t|
      t.text :nombre

      t.timestamps null: false
    end
  end
end
