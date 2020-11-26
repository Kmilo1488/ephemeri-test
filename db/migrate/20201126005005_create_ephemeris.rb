class CreateEphemeris < ActiveRecord::Migration[6.0]
  def change
    create_table :ephemeris do |t|
      t.text :name
      t.datetime :happened
      t.integer :category

      t.timestamps
    end
  end
end
