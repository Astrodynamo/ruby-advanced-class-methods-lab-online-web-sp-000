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
    create_by_name = self.new_by_name(name)
    self.all << create_by_name
  end

end
