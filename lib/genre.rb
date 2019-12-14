class Genre

    attr_reader :name, :song, :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def songs
        Song.all.select do |song|
            song.genre == self
        end
    end 

    def artists
        songs.map do |song|
            song.artist
        end
    end

    def self.all
        @@all
    end

end


# The Genre class needs an instance method, #songs, that iterates through all songs and 
# finds the songs that belong to that genre.

# The Genre class needs an instance method, #artists, that iterates over 
# the genre's collection of songs and collects the artist that owns each song.