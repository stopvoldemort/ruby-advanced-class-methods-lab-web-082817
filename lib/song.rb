require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(given_name)
    s = Song.new
    s.name = given_name
    s
  end

  def self.create_by_name(given_name)
    s = Song.new
    s.name = given_name
    @@all << s
    s
  end

  def self.find_by_name(given_name)
    @@all.find {|s| s.name == given_name}
  end

  def self.find_or_create_by_name(given_name)
    s = self.find_by_name(given_name)
    s = self.create_by_name(given_name) if !s
    s
  end

  def self.alphabetical
    @@all.sort_by{|s| s.name}
  end

  def self.new_from_filename(filename)
    song = Song.new
    filename = filename.split(" - ")
    song.artist_name = filename[0]
    song.name = filename[1].chomp(".mp3")
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all = []
  end
end
