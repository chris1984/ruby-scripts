# frozen_string_literal: true

require 'whirly' # spinner
require 'paint' # makes whirly colorful
require 'ruby2d' # provides sound and graphics

puts 'Enter the names of the people in your standup (one per line, blank line to finish):'
@names = []
while (name = gets.chomp) != ''
  @names << name
end

system 'clear'

def info(message)
  "\033[32m#{message}\033[0m"
end

def important(message)
  "\033[31m#{message}\033[0m"
end

@cheer = Sound.new('cheer.wav')

@spinners = %w[bouncingBall pong bouncingBall fistBump soccerHeader mindblown]

def selector
  puts info('PRESS ENTER TO SELECT A WINNER')
  if gets.chomp == '' && @names.any?
    winner = @names.sample
    winner = winner.upcase
    Whirly.start spinner: @spinners.sample
    sleep 2
    puts important("THE WINNER IS #{winner}!!!!!")
    Whirly.stop
    @cheer.play
    sleep 3
    system 'clear'
    random(winner)
  else
    puts info('STANDUP IS DONE!!!!!')
  end
end

def random(winner)
  @names.delete(winner)
  selector
end

selector
