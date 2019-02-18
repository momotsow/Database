/*creating a database and name it store*/
use STORE;

/*creating a collection and name it movie*/
db.createCollection("movie");

/*adding movies to the database*/
db.movie.insertMany([
    { title: "Ralph breaks the internet", genre:"Animation",year_released:"2018",language:"English",movie_length:"129m"  },
    { title: "Nobody's fool", genre:"Romance",year_released:"2018", language:"English",movie_length:"142m"}, 
    { title: "The Hate U Give", genre:"Drama",year_released:"2018", language:"English", movie_length:"134m" }, 
    { title: "Night School", genre:"Comedy",year_released:"2018", language:"English", movie_length:"134m" }, 
    { title: "The Grinch", genre:"Animation",year_released:"2018", language:"English", movie_length:"134m" }
])

//selecting all rows
db.movie.find().pretty()

//finding a movies by genre
db.movie.find({genre: "Animation"})

//finding a specific movie
db.movie.findOne({title: "The Grinch"})

//deleting a specific movie
db.movie.deleteOne({title: "Bird Box"})

//Updating the movie title
db.movie.update({"title":"Night School"},{$set:{"title":"Day School"}})

//deleting a collection
db.movie.drop()
