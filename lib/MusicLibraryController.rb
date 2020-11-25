
class MusicLibraryController
    attr_accessor :path

    def initialize(path = './db/mp3s')
        @path = path
        MusicImporter.new(@path).import
    end


    def list_songs
        i = 1
        array = Song.all
        array_of_names = []
        array.each do |song|
            array_of_names << song.name
        end
        sorted_array = array_of_names.sort
        sorted_songs = []
        sorted_array.each do |name|
            sorted_songs << Song.find_or_create_by_name(name)
        end
        sorted_songs.each do |song|
            puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
            i += 1
        end
    end

    def list_artists
        i = 1
        array = Artist.all
        array_of_artists = []
        array.each do |artist|
            array_of_artists << artist.name
        end
        sorted_array = array_of_artists.sort
        sorted_array.each do |name|
            puts "#{i}. #{name}"
            i += 1
        end
    end

    def list_genres
        i = 1
        array = Genre.all
        array_of_genres = []
        array.each do |genre|
            array_of_genres << genre.name
        end
        sorted_array = array_of_genres.sort.uniq
        sorted_array.each do |name|
            puts "#{i}. #{name}"
            i += 1
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        artist_name = gets
        i = 1
        array = Song.all
        array_of_names = []
        array.each do |song|
            array_of_names << song.name
        end
        sorted_array = array_of_names.sort
        sorted_songs = []
        sorted_array.each do |name|
            sorted_songs << Song.find_or_create_by_name(name)
        end
        sorted_songs.each do |song|
            if song.artist.name == artist_name
                puts "#{i}. #{song.name} - #{song.genre.name}"
                i += 1
            end
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        genre_name = gets
        i = 1
        array = Song.all
        array_of_names = []
        array.each do |song|
            array_of_names << song.name
        end
        sorted_array = array_of_names.sort
        sorted_songs = []
        sorted_array.each do |name|
            sorted_songs << Song.find_or_create_by_name(name)
        end
        sorted_songs.each do |song|
            if song.genre.name == genre_name
                puts "#{i}. #{song.artist.name} - #{song.name}"
                i += 1
            end
        end
    end

    def play_song
        array = Song.all
        array_of_names = []
        array.each do |song|
            array_of_names << song.name
        end
        sorted_array = array_of_names.sort
        sorted_songs = []
        sorted_array.each do |name|
            sorted_songs << Song.find_or_create_by_name(name)
        end
        puts "Which song number would you like to play?"
        song_number = gets.chomp
        if song_number.match(/\d/)
            number = song_number.to_i
            if number > 0 && number <= sorted_songs.length
                puts "Playing #{sorted_songs[number-1].name} by #{sorted_songs[number-1].artist.name}"
            end
        else
            nil
        end
    end

    def call
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
        input = gets
        until input == "exit"
            if input == 'list songs'
                self.list_songs
                input = gets
            elsif input == 'list artists'
                self.list_artists
                input = gets
            elsif input == 'list genres'
                self.list_genres
                input = gets
            elsif input == 'list artist'
                self.list_songs_by_artist
                input = gets
            elsif input == 'list genre'
                self.list_songs_by_genre
                input = gets
            elsif input == 'play song'
                self.play_song
                input = gets
            else
                input = gets
            end
        end
    end
end