class MusicImporter
  attr_accessor :path #accepts a file path to parse MP3 files from

  def initialize(path) #retrieves the path provided to the MusicImporter object
    @path = path
  end

  def files
    @files = Dir.glob("#{@path}/*mp3").collect{ |file| file.gsub("#{@path}/","")}



end
