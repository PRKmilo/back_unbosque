class CreateGraduates < ActiveRecord::Migration[7.0]
  def change
    create_table :graduates do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :graduation_year
      t.string :faculty
      t.string :qualification

      t.timestamps
    end
  end
end
