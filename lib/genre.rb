class Genre

  extend Concerns::Findable  

  attr_accessor :name # accepts a name for the new genre
  attr_reader :songs

  @@all = [] # is initialized as an empty array


  def initialize(name) #retrieves the name of an genre
    @name = name #can set the name of an genre
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all #resets the @@all class variable to an empty array
    @@all.clear
  end

  def save #adds the genre instance to the @@all class variable
    @@all << self
  end

  def self.create(name) #initializes, saves, and returns the artist
    genre = self.new(name)
    genre.save
    genre
  end

  def artists
    songs.collect{|song| song.artist}.uniq #returns a collection of artists for all of the genre's songs (genre has many artists through songs)    does not return duplicate artists if the genre has more than one song by a particular artist (genre has many artists through songs)
  end


end
