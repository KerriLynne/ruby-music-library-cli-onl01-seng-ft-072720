class MusicLibraryController

  def initialize(path = './db/mp3s') #Upon initialization, accepts an optional path to the library of MP3 files, defaulting to ./db/mp3s/
    importer = MusicImporter.new(path) #creates a new MusicImporter object, passing in the 'path' value/ the 'path' argument defaults to './db/mp3s'
    importer.import  # invokes the #import method on the created MusicImporter object
  end

  def call
    puts "Welcome to your music library!"
  end


end
