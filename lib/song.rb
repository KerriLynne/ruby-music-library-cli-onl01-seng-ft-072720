class Song
  attr_accessor :name, :artist, :genre

  @@all = [] # is initialized as an empty array

  def initialize(name, artist = nil, genre = nil) #accepts a name for the new song
    @name = name  #  can set the name of a song
    self.artist=artist if artist
    self.genre=genre if genre #assigns a genre to the song (song belongs to genre)/ # invokes #genre= instead of simply assigning to a @genre instance variable to ensure that associations are
 #created upon initialization
  end

  def self.all
    @@all
  end

  def self.destroy_all #resets the @@all class variable to an empty array
    @@all.clear
  end

  def save #adds the Song instance to the @@all class variable
    @@all << self
  end

  def self.create(name) #initializes, saves, and returns the song
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)  #invokes Artist#add_song to add itself to the artist's collection of songs (artist has many song
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !(genre.songs.include?(self))  #does not add the song to the genre's collection of songs if it already exists therein
    genre.songs << self # adds the song to the genre's collection of songs (genre has many songs)
    end
  end

  def self.find_by_name(name)
    all.detect {|song| song.name == name} # finds a song instance in @@all by the name property of the song
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name) #returns (does not recreate) an existing song with the provided name if one exists in/ invokes .find_by_name instead of re-coding the same functionality/ creates a song if an existing match is not found/ invokes .create instead of re-coding the same functionality
  end

  def self.new_from_filename(file)
    info = file.split(" - ")
    s = Song.new
    s.name = name.slice(0...-4)
    s.artist_name = artist
    s
  end


end
