module RubiksCli
  module Loop
    class Action
      attr_reader :command, :function, :help

      def initialize(command, function, description)
        @command = command
        @function = function
        @help = "Press '#{command}' to #{description}\n"
      end
    end
  end
end
