module RubiksCli
  module Loop
    class Loop
      private_class_method :new

      def initialize(on_enter, actions)
        @on_enter = on_enter

        commands = actions.map { |action| action.command }
        if commands.uniq.size != commands.size
          raise ArgumentError, "Duplicate command"
        end

        @action_map = {}
        actions.each { |action| @action_map[action.command] = action.function }
      end
    end
  end
end
