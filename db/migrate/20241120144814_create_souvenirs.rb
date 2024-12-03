class CreateSouvenirs < ActiveRecord::Migration[6.1]
  def change
    create_table :souvenirs do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
