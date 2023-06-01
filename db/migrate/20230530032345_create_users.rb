class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.integer :edad
      t.string :photo
      t.string :cc
      t.string :direccion
      t.string :celular
      t.string :telefono
      t.string :password_digest

      t.timestamps
    end
  end
end
