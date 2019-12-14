class Artist

    attr_reader :name, :genre

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def new_song(name, genre)
        Song.new(name, self, genre)
    end

    def songs
        Song.all.select do |song|
            song.artist.name
        end
    end

    def genres
        songs.map do |song|
           song.genre
        end
    end

    def self.all
        @@all
    end
end


# The Artist class needs an instance method, #genres that iterates over that artist's songs and 
# collects the genre of each song.