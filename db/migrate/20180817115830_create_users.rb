class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :first_name
      t.string :last_name
      t.string :sex
      t.date :birthdate
      t.string :address
      t.string :phone_number
      t.string :type, null: false

      t.timestamps
    end
  end
end
