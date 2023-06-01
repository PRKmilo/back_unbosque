class CreateLifeHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :life_histories do |t|
      t.references :graduate, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.string :date

      t.timestamps
    end
  end
end
