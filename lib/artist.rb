# Artist
# can be initialized
# can have a name
# converts its name to a url friendly parameter
# Class methods
#   keeps track of the artists that have been created
#   can count how many artists have been created
#   can find an artist by name
#   can reset the artists that have been created
# with songs
#   can have a song added
#   knows how many songs it has

class Artist
  attr_accessor :name
  attr_reader :songs

  extend Memorable::ClassMethods
  extend Findable::ClassMethods
  include Memorable::InstanceMethods
  include Paramable::InstanceMethods

  @@artists = []

  def initialize
    @@artists << self
    @songs = []
  end

  def self.find_by_name(name)
    @@artists.detect{|a| a.name == name}
  end

  def self.all
    @@artists
  end

  def add_song(song)
    @songs << song
    song.artist = self unless song.artist
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

end
