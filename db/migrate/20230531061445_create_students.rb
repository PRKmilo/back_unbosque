class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.references :user, null: false, foreign_key: true
      t.string :faculty
      t.string :carerr
      t.string :state
      t.string :journey

      t.timestamps
    end
  end
end
