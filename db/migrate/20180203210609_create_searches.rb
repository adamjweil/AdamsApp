class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :url, NULL: false
      t.string :user_id, foreign_key: true, NULL: false

      t.timestamps(NULL: false)
    end
  end
end
