module RubiksCli
  module Loop
    class Engine
      private_class_method :new

      def initialize(on_enter, actions)
        commands = actions.map { |action| action.command }
        if commands.uniq.size != commands.size
          raise ArgumentError, "Duplicate command"
        end

        @actions = Hash.new(on_enter)
        actions.each { |action| @actions[action.command] = action.function }
      end

      def start
        @actions['h'].call
        loop do
          @actions[gets.chomp.downcase].call
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
