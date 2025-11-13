module RubiksCli
  module Loop
    class Action < Data.define(:command, :function, :help)
      private_class_method :new
    end

    DEFAULT_ACTIONS = [
      build_action('c', Clear.method(:screen), 'clear the screen'),
      build_action('q', lambda { raise SystemExit }, 'quit'),
    ]

    def self.build_action(command, function, description)
        help = "Press '#{command}' to #{description}"
        Action.send(:new, command, function, help)
    end
  end
end
