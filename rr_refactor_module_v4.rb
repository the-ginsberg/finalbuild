module RussianRouletteMod

## Introduction and Game Selection
  def introduction
    @round_counter = 1
    @bullet_location = rand(6).to_i

    puts <<-END
    Welcome to Russian Roulette!
    The rules are simple:
    The revolver has a single bullet in the cylinder,
    spin the cylinder and fire at your own head.
    If you live you survive the round if you die you lose.
    Please select an option:
    (S)ingle Player, (M)ulti Player, or (Q)uit
    END

    player_response = gets.chomp.downcase

    case player_response
      when "s"
      single_player
      when "m"
      player_1_name
      when "q"
      quit_game
      else
      puts @invalid_response
      introduction
      end
  end


## Initialize single player game
  def single_player
    puts <<-END
    You are brave to play alone!
    Will you (s)pin the cylinder and take a shot?
    Would you rather (q)uit while you still have your life?
    END

    player_response = gets.chomp.downcase

    case player_response
      when "s"
      cylinder_spin
      when "q"
      quit_game
      else
      puts @invalid_response
      single_player
    end
  end


## Method for checking player roll verse bullet location
def cylinder_spin
  puts "You spin the cylinder and pull the trigger!"
  fire = rand(6).to_i

  if fire == @bullet_location
    singleplayer_died
  else
    singleplayer_lived
  end
end



## Single Player died
def singleplayer_died
    puts "BANG! You died in Round #{@round_counter}!"
    sleep(0.2)
    puts "Would you like to (p)lay again or (q)uit?"
    player_response = gets.chomp.downcase

    case player_response
      when "p"
      introduction
      when "q"
      quit_game
      else
      puts @invalid_response
      singleplayer_died
    end
  end

## Single Player lived
  def singleplayer_lived
    @round_counter = @round_counter + 1
    puts "Click. You survived!"
    sleep(0.2)
    puts "Moving on to Round #{@round_counter}!"
    sleep(0.2)
    puts
    puts
    single_player_reroll
  end


## Single player Re-roll
def single_player_reroll
  puts <<-END
  Congratulations on making it to Round #{@round_counter}.
  Will you (s)pin again or (q)uit while your ahead?
  END
  player_response = gets.chomp.downcase

  case player_response
    when "s"
    cylinder_spin
    when "q"
    quit_game
    else
    puts @invalid_response
    single_player_reroll
  end
end


## Initialize Multiplayer Game

## Get player 1 name
  def player_1_name
    puts <<-END
    Welcome to multi-player.
    Player 1, please enter your name.
    END
    @name_1 = gets.chomp
    player_2_name
  end

## Get Player 2 name
  def player_2_name
    puts "Player 2, please enter your name."
    @name_2 = gets.chomp
    player_1_roll
  end

## Player 1 roll
  def player_1_roll
    puts <<-END
    #{@name_1} it is your turn to play.
    Will you (s)pin the cylinder and take the shot?
    Or (q)uit?
    END
    player_response = gets.chomp.downcase

    case player_response
      when "s"
        cylinder_spin_p1
      when "q"
        p1_quit
      else
        puts @invalid_response
        player_1_roll
    end
  end


## Multiplayer P1 Roll check
  def cylinder_spin_p1
    puts "#{@name_1} spins the cylinder and pulls the trigger!"
    fire = rand(6).to_i
    if fire == @bullet_location
      player1_dies
    else
      player1_lives
    end
  end



## P1 dies
  def player1_dies
      puts "Bang!"
      sleep(0.2)
      puts "#{@name_1} died in Round #{@round_counter}."
      sleep 1
      puts <<-END
      #{@name_2} is victorious!
      Would you like to (p)lay again, or (q)uit playing?
      END
      player_response = gets.chomp.downcase

      case player_response
        when "p"
        introduction
        when "q"
        quit_game
        else
        puts @invalid_response
        player1_dies
      end
  end

## P1 lives
    def player1_lives
      puts "Click"
      sleep(0.2)
      puts "#{@name_1} survived!"
      puts
      player_2_roll
    end


## Multiplayer P2 Roll
  def player_2_roll
    puts <<-END
    #{@name_2} it is your turn to play.
    Will you (s)pin the cylinder and take the shot?
    Or (q)uit?
    END
    player_response = gets.chomp.downcase

    case player_response
      when "s"
        cylinder_spin_p2
      when "q"
        p2_quit
      else
        puts @invalid_response
        player_2_roll
    end
  end


  ## Multiplayer P2 Roll Check
    def cylinder_spin_p2
      puts "#{@name_2} spins the cylinder and pulls the trigger!"
      fire = rand(6).to_i
      if fire == @bullet_location
        player2_dies
      else
        player2_lives
      end
    end


  ## P2 dies
  def player2_dies
        puts "Bang!"
        sleep(0.2)
        puts "#{@name_2} died in Round #{@round_counter}."
        sleep(0.4)
        puts <<-END
        #{@name_1} is victorious!
        Would you like to (p)lay again, or (q)uit playing?
        END
        player_response = gets.chomp.downcase

        case player_response
          when "p"
          introduction
          when "q"
          quit_game
          else
          puts @invalid_response
          player2_dies
        end
      end


  ## P2 lives
      def player2_lives
        @round_counter += 1
        puts "Click"
        sleep(0.2)
        puts <<-END
        #{@name_2} survived!
        Lets move on to Round #{@round_counter}!
        END
        puts
        puts
        puts
        player_1_roll
      end


## Player 1 quits mid game
  def p1_quit
    puts "#{@name_1} has quit the game, what a coward!"
    puts "#{@name_2} wins by deault. Thanks for playing."
    @again = false
  end


## Player 2 quits mid game
  def p2_quit
    puts "#{@name_2} has quit the game, what a coward!"
    puts "#{@name_1} wins by deault. Thanks for playing."
    @again = false
  end


## Method to quit game
  def quit_game
    puts "Thank you for playing!"
    @again = false
  end


## Invalid Response
    @invalid_response = "Invalid Response. Please try again."

end
