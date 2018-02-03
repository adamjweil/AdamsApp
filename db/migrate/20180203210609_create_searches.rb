class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :username, foreign_key: true
      t.string :url, NULL: false
      t.timestamps(NULL: false)
    end
  end
end
