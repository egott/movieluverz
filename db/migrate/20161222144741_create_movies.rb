class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :Title, null: false
      t.string :Year
      t.string :Poster
      t.string :Plot
      t.string :Rating
      t.string :Genre
      t.string :Runtime
      t.string :Release
      t.string :Actors
      t.string :imdbID
      t.string :Director
      t.string :imdbRating
      t.string :Awards

      t.timestamps
    end
  end
end
