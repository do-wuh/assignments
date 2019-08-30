class Gaming
  attr_accessor :gaming_system, :gaming_genre

  def initialize(gaming_system, gaming_genre)
    self.gaming_system = gaming_system
    self.gaming_genre = gaming_genre
  end

  def random_game
    puts "The Best #{self.gaming_system.sample} game is a #{self.gaming_genre.sample} game!"
  end
end

type = Gaming.new(['Arcade', 'Computer', 'Console', 'Handheld', 'Mobile', 'Virtual Reality'],['Action', 'Adventure', 'Fighting', 'Platform', 'Puzzle', 'Racing', 'Role-Playing', 'Shooter', 'Simulation', 'Sports', 'Startegy'])

type.random_game