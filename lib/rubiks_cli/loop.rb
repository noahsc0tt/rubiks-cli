require_relative 'clear'
require_relative 'help'
require_relative 'timer'
require_relative 'scrambler' 

module RubiksCli
  class Loop
    def self.solve
      Help.loop
      loop do
        begin
          self.process_input(gets.chomp)
          print "\n"
        rescue SystemExit
          exit
        end
      end
    end

    private
    def self.process_input(cmd)
      case cmd.downcase
      when 'n'
        puts Scrambler.get_scramble
      when 'h', '?'
        Help.loop
      when 'q'
        raise SystemExit
      else
        Timer.show
        puts Scrambler.get_scramble
      end
    end
  end
end

if __FILE__ == $0
  RubiksCli::Loop.solve
end
