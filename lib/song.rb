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
    new_song = self.new
    self.all << new_song
    new_song
  end
  
  def self.new_by_name (name)
    new_song_by_name = self.new
    new_song_by_name.name = name
    new_song_by_name
  end
  
  def self.create_by_name (name)
    new_create_by_name = self.create
    new_create_by_name.name = name
    new_create_by_name
  end
  
  def self.find_by_name (name)
    self.all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name (name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename (filename)
    data = filename.split(" - ")
    artist_name = data[0]
    song_name = data[1].chomp(".mp3")
    new_song = self.new_by_name(song_name)
    new_song.artist_name = artist_name
    new_song
  end
  
  def self.create_from_filename (filename)
    data = filename.split(" - ")
    artist_name = data[0]
    song_name = data[1].chomp(".mp3")
    new_song = self.create_by_name(song_name)
    new_song.artist_name = artist_name
    new_song
  end
  
  def self.destroy_all
    @@all.clear
  end

end
