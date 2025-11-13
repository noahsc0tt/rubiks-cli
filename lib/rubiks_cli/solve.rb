require_relative 'clear'
require_relative 'help'
require_relative 'timer'
require_relative 'scrambler' 

module RubiksCli
  module Solve
    def self.solve(inspection)
        puts Scrambler.get_scramble
        gets
        Clear.line_above
        Timer.start(inspection)
    end

    def self.loop(clear_screen, inspection)
      Help.loop
      Kernel.loop do
        begin
          input = gets.chomp
          clear_screen ? Clear.screen : Clear.line_above
          process_input(input, inspection)
        rescue SystemExit
          exit
        end
      end
    end

    private
    def self.process_input(cmd, inspection)
      case cmd.downcase
      when 'n'
        puts Scrambler.get_scramble
      when 'c'
        Clear.screen
      when 'h', '?'
        Help.loop
      when 'q'
        raise SystemExit
      else
        Timer.start(inspection)
        puts "\n#{Scrambler.get_scramble}"
      end
    end
  end
end

if __FILE__ == $0
  RubiksCli::Solve.loop(true, false)
end
