class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, unique: true, index: true
      t.string :username
      t.string :password_digest

      t.timestamps(NULL: false)
    end
  end
end
