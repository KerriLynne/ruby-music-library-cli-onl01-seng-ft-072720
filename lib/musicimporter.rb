class MusicImporter
  attr_accessor :path, :files #accepts a file path to parse MP3 files from

  def initialize(path) #retrieves the path provided to the MusicImporter object
    @path = path
  end

  def files
    @files = Dir.glob("#{@path}/*mp3").collect{ |file| file.gsub("#{@path}/","")}  #loads all the MP3 files in the path directory/ normalizes the filename to just the MP3 filename with no path
  end

  def import(files)
    Song.create_from_filename.tap{|s| s.save}



end
