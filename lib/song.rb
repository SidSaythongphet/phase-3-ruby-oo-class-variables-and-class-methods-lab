require "pry"

class Song
    attr_accessor :name, :artist, :genre

    @@count = 0
    @@genres = []
    @@artists = []
    @@genre_count
    @@artist_count

    def initialize name, artist, genre
        @name = name
        @artist = artist
        @genre = genre
        @@count += 1
        @@genres << genre
        @@artists << artist
    end

    def self.count
        @@count
    end

    def self.genres
        @@genres.uniq
    end

    def self.artists
        @@artists.uniq
    end

    def self.genre_count
        @@genre_count = self.genres.map do |genre| 
            { "#{genre}" => @@genres.select { |g| g == genre }.length }
        end
        @@genre_count.reduce({}, :merge)
    end

    def self.artist_count 
        @@artist_count = self.artists.map do |artist|
            { "#{artist}" => @@artists.select { |a| a == artist }.length }
        end
        @@artist_count.reduce({}, :merge)
    end


end

Song.new("Lucifer", "Jay-Z", "rap")
Song.new("99 Problems", "Jay-Z", "rap")
Song.new('hit me baby one more time', 'Brittany Spears', 'pop')

puts Song.genre_count