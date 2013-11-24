module Tennis
  class Game
    attr_accessor :player1, :player2

    def initialize
      @player1 = Player.new
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end

    # Records a win for a ball in a game.       
    # Returns the score of the winning player.  
    
    def wins_ball(winner)
      winner.points += 1
    end
  end

  class Player
    attr_accessor :points, :opponent

    def initialize
      @points = 0
    end

    # Increments the score by 1.
    # Returns the integer new score.

    def record_won_ball!
      @points += 1
    end

    # Returns a string message for the player. 
    def score
      return "Sorry, you lost the game!" if (@points == 0 || @points == 1 || @points == 2) && @opponent.points == 4
      return "love" if @points == 0 
      return "fifteen" if @points == 1
      return "thirty" if @points == 2
      return "forty" if @points == 3 && @opponent.points < 3
      return "duece" if @points == 3 && @opponent.points == 3
      return "advantage" if @points >= 4 && @points == @opponent.points + 1
      return "You won the game!" if (@points >= 3 && @opponent.points < 3) || (@points >= 3 && @opponent.points >= 3 && @points > @opponent.points + 1)
    end
  end
end