require_relative 'dealer'
require_relative 'player'
require_relative 'deck'
# class to manage the game
class MainInterface
  def menu
    puts 'Напишите своё имя, если хотите сыграть: '
    name = gets.chomp.to_s
    puts "Добрый вечер #{name}"
    exit
  end
end

def method_name
  "#{}"
end
