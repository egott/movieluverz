class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user, null: false
      t.references :movie, null: false

      t.timestamps(null: false)
    end
  end
end
