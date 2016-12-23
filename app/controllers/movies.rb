get '/movies' do
  BASE_URL = "http://www.omdbapi.com/?s="

  json_string_response = open(BASE_URL + params["movie"]).read
  ruby_hash_response = JSON.parse(json_string_response)
  parsed_data = ruby_hash_response["Search"]

  @searched_movies = []

   parsed_data.each do |movie|
     id = movie[id]
     title = movie['Title']
     year = movie['Year']
     poster = movie['Poster']
     plot = movie['Plot']
     genre = movie['Genre']
     runtime = movie['Runtime']
     rating = movie['Rating']
     imdbID = movie['imdbID']

     @searched_movies <<  Movie.create!(Title: title, Poster: poster, Year: year, Plot: plot, Rating: rating, Genre: genre, imdbID: imdbID)
  end

  erb :'/movies/show'
end

get '/movies/:id' do
  @movie = Movie.find(params[:id])
  # trailer_url = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=titanic+trailer&key={AIzaSyCXXBOVsNHo6Snd9DJpBlZYELN4TXyZ3cQ}"

  # json_string_response = open(trailer_url + params["movie_name_trailer"]).read
  # ruby_hash_response = JSON.parse(json_string_response)
  # parsed_data = ruby_hash_response["Search"]

  trailer_url = "http://www.omdbapi.com/?i="

  json_string_response = open(trailer_url + @movie.imdbID).read
  ruby_hash_response = JSON.parse(json_string_response)
  movie = ruby_hash_response
  puts "**************************************"
  puts movie

       id = movie[id]
       title = movie['Title']
       year = movie['Year']
       poster = movie['Poster']
       plot = movie['Plot']
       genre = movie['Genre']
       runtime = movie['Runtime']
       rating = movie['Rated']
       imdbID = movie['imdbID']
       actors = movie['Actors']
       awards = movie['Awards']

    @new_movie = @movie.update_attributes(Title: title, Poster: poster, Year: year, Plot: plot, Rating: rating, Genre: genre, imdbID: imdbID, Runtime: runtime, Actors: actors, Awards: awards)

  erb :'/movies/show_one'
end
