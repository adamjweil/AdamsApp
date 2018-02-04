class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, unique: true, index: true, NULL: false
      t.string :username, NULL: false
      t.string :password_digest

      t.timestamps(NULL: false)
    end
  end
end
