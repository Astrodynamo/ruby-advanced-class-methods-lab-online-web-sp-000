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
    self.all.each {|song| return song if song.name == name}
    false
  end
  
  def self.find_or_create_by_name (name)
    self.find_by_name(name) || self.create_by_name(name)
  end

end
