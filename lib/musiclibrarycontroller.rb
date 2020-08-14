class MusicLibraryController

  def initialize(path = './db/mp3s') #Upon initialization, accepts an optional path to the library of MP3 files, defaulting to ./db/mp3s/
    importer = MusicImporter.new(path) #creates a new MusicImporter object, passing in the 'path' value/ the 'path' argument defaults to './db/mp3s'
    importer.import  # invokes the #import method on the created MusicImporter object
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    
  end


end
