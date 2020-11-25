require 'pry'
class MusicImporter

    def initialize(path)
        @path = path
        self.files
    end

    def path
        @path
    end

    def files
        Dir.chdir(@path) do
            @files = Dir.glob("*.mp3")
        end
        @files
    end

    def import
        @files.each do |file|
            Song.create_from_filename(file)
        end
    end
end