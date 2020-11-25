class Artist
    extend Concerns::Findable
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
        @songs = []
    end

    def songs
        @songs
    end

    def self.all
        @@all
    end

    def add_song(song)
        if song.artist == nil
            song.artist = self
        end
        if !(@songs.include?(song))
            @songs << song
        end
    end
    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def genres
        list = []
        @songs.collect do |song|
            list << song.genre
        end
        list.uniq
    end

    def self.create(name)
        self.new(name)
    end
end