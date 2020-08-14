class Artist

  attr_accessor :name # accepts a name for the new artist
  attr_reader :songs

  @@all = [] # is initialized as an empty array


  def initialize(name) #retrieves the name of an artist
    @name = name #can set the name of an artist
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all #resets the @@all class variable to an empty array
    @@all.clear
  end

  def save #adds the artist instance to the @@all class variable
    @@all << self
  end

  def self.create(name) #initializes, saves, and returns the artist
    artist = self.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self unless song.artist #assigns the current artist to the song's 'artist' property/ does not assign the artist if the song already has an artist
    songs << song unless songs.include?(song) #adds the song to the current artist's 'songs' collection/ does not add the song to the current artist's collection of songs if it already exists therein
  end

  def genres
    songs.collect{|song| song.genre}.uniq #  returns a collection of genres for all of the artist's songs (artist has many genres through songs) does not return duplicate genres if the artist has more than one song of a particular genre (artist has m any genres through songs) collects genres through its songs instead of maintaining its own @genres instance variable (artist has many genres through songs)
  end







end
