class MusicLibraryController

  def initialize(path = './db/mp3s') #Upon initialization, accepts an optional path to the library of MP3 files, defaulting to ./db/mp3s/
    importer = MusicImporter.new(path) #creates a new MusicImporter object, passing in the 'path' value/ the 'path' argument defaults to './db/mp3s'
    importer.import  # invokes the #import method on the created MusicImporter object
  end

  def call
    input = ""

    while input != "exit"  #loops and asks for user input until they type in exit
      puts "Welcome to your music library!"   # welcomes the user
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets  #asks the user for input
    end

  end

  def list_songs
    Song.all.sort {|a,b| a.name <=> b.name}.each.with_index(1) do |song, i| #prints all songs in the music library in a numbered list (alphabetized by song name)/ is not hard-coded
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    artists = Artist.all.sort {|a,b| a.name <=> b.name}.each.with_index(1) {|artist, i| #prints all artists in the music library in a numbered list (alphabetized by artist name)
      puts "#{i}. #{artist.name}"}
  end

  def list_genres
    genres = Genre.all.sort {|a,b| a.name <=> b.name}.each.with_index(1) {|genre, i| #prints all genres in the music library in a numbered list (alphabetized by genre name)
      puts "#{i}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets  #    accepts user input

      if artist = Artist.find_by_name(input) #rints all songs by a particular artist in a numbered list (alphabetized by song name)
        artist.songs.sort {|a,b| a.name <=> b.name}.each.with_index(1) do |song, i| # does nothing if no matching artist is found
          puts "#{i}. #{song.name} - #{song.genre.name}"
        end
      end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets  #accepts user input

      if genre = Genre.find_by_name(input)
        genre.songs.sort {|a,b| a.name <=> b.name}.each.with_index(1) do |song, i|
          puts "#{i}. #{song.artist.name} - #{song.name}"
        end
      end
  end


 #  def play_song
 #   sorted_songs = Song.all.sort_by{|song| song.name}
 #   puts "Which song number would you like to play?"
 #   list_songs
 #   index = gets.strip.to_i - 1
 #
 #   if index.between?(0, sorted_songs.length)
 #     puts "Playing #{list_songs}"
 #   end
 # end

 def play_song
  puts "Which song number would you like to play?"
  input = gets.chomp.to_i

  # self.list_songs
  songs = Song.all
  # songs.sort {|a,b| a.name <=> b.name}



  if (1..songs.length).include?(input)
    song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
  end
  # binding.pry

  puts "Playing #{song.name} by #{song.artist.name}" if song
end



end
