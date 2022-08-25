require 'pry'

# Song
# can initialize a song
# can have a name
# converts its name to a url friendly parameter
# has an artist
# Class methods
#   keeps track of the songs that have been created
#   can count how many songs have been created
#   can find a song by name
#   can reset the songs that have been created

class Song

  extend Memorable::ClassMethods
  extend Findable::ClassMethods
  include Memorable::InstanceMethods
  include Paramable::InstanceMethods

  attr_accessor :name
  attr_reader :artist

  @@songs = []

  def self.all
    @@songs
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end
end
