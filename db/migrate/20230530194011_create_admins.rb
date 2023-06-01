class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.references :user, null: false, foreign_key: true
      t.string :position
      t.string :type_contract
      t.integer :year_begin_contract
      t.integer :salary_admin

      t.timestamps
    end
  end
end
