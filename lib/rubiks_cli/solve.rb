require_relative 'clear'
require_relative 'loop/builder'
require_relative 'loop/action'
require_relative 'timer'
require_relative 'scrambler' 

HELP = "Press Enter to start timing\nPress any key to stop timing\nType 'n' for a new scramble\nType 'c' to clear the screen\nType 'h' or '?' for this message\nType 'q' to quit"

module RubiksCli
  module Solve
    def self.once(inspection)
        puts Scrambler.get_scramble
        gets
        Clear.line_above
        Timer.start(inspection)
    end

    def self.loop(clear_screen, inspection)
      on_enter = lambda {
        Timer.start(inspection)
        puts "\n#{Scrambler.get_scramble}"
      }

      Loop.build(
        Loop.build_action('', on_enter, "start solve"),
        [
          Loop.build_action('n', lambda { puts Scrambler.get_scramble }, "generate a new scramble")
        ]
      ).start

    end
  end
end

if __FILE__ == $0
  RubiksCli::Solve.loop(true, false)
end
