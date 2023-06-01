class CreateWorks < ActiveRecord::Migration[7.0]
  def change
    create_table :works do |t|
      t.references :graduate, null: false, foreign_key: true
      t.string :carge
      t.string :company
      t.string :country
      t.string :description
      t.string :date_contract

      t.timestamps
    end
  end
end
