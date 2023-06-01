class CreateAcademicTitles < ActiveRecord::Migration[7.0]
  def change
    create_table :academic_titles do |t|
      t.references :graduate, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.string :institucion
      t.string :country
      t.integer :year
      t.string :title_type

      t.timestamps
    end
  end
end
