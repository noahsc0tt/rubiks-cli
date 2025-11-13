require_relative '../clear'

module RubiksCli
  module Loop
    class Engine
      private_class_method :new

      def initialize(action_on_enter, other_actions)
        commands = other_actions.map { |action| action.command }
        if commands.uniq.size != commands.size
          raise ArgumentError, "Duplicate command"
        end

        @actions = Hash.new(action_on_enter.function)
        other_actions.each { |action| @actions[action.command] = action.function }
      end

      def start
        @actions['h'].call
        loop do
          input = gets.chomp.downcase
          Clear.line_above
          @actions[input].call
        end
      end
    end
  end
end

if __FILE__ == $0
  require_relative 'builder'

  on_enter = lambda { puts "You pressed Enter!" }
  actions = [
    RubiksCli::Loop.build_action('x', -> { puts "Action X executed" }, "execute action X"),
    RubiksCli::Loop.build_action('y', -> { puts "Action Y executed" }, "execute action Y"),
  ]
  loop_instance = RubiksCli::Loop.build_loop(on_enter, actions)
  loop_instance.start
end
