class Gaming
  attr_accessor :gaming_system, :gaming_genre

  def initialize(gaming_system, gaming_genre)
    @gaming_system = gaming_system
    @gaming_genre = gaming_genre
    @games = []

    @gaming_system.each do |gaming_system|
      @gaming_genre.each do |gaming_genre|
        @game << Game.new(gaming_system, gaming_genre)
      end
    end
  end

  def random_game
    puts "Best #{self.gaming_genre} #{self.gaming_system} game: "
  end
end


class Gaming_genre
  def initialize
    @gaming_genres = ['Action', 'Adventure', 'Fighting', 'Platform', 'Puzzle', 'Racing', 'Role-Playing', 'Shooter', 'Simulation', 'Sports', 'Startegy'].sample
  end
end


class Gaming_system < Gaming_genre
  def initialize
    @gaming_systems = ['Arcade', 'Computer', 'Console', 'Handheld', 'Mobile', 'Virtual Reality'].sample
  end
end

game = Gaming.new
game.random_game