require_relative '../clear'

module RubiksCli
  module Loop
    class Engine
      private_class_method :new

      def initialize(on_enter, other_actions)
        commands = other_actions.map { |action| action.command }
        if commands.uniq.size != commands.size
          raise ArgumentError, "Duplicate command"
        end

        @actions = Hash.new(on_enter)
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
