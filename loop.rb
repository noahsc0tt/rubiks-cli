require_relative 'scrambler'
require_relative 'timer'

HELP = "Press Enter to start\nType 'q' to quit\nType 'n' for a new scramble"

cmd = 'n'

while true
  Timer.clear_screen
  if cmd == ''
    Timer.start
    cmd = 'n'
  end

  if cmd == 'n'
    puts Scrambler.get_scramble
  elsif cmd.downcase == 'q'
    break
  else
    puts HELP
  end

  cmd = gets.chomp
end

