module RubiksCli
  module Loop
    class Loop
      private_class_method :new

      def initialize(on_enter, actions)
        commands = actions.map { |action| action.command }
        if commands.uniq.size != commands.size
          raise ArgumentError, "Duplicate command"
        end

        @actions = Hash.new(on_enter)
        actions.each { |action| @actions[action.command] = action.function }
      end

    end
  end
end
