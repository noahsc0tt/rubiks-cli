module RubiksCli
  module Loop
    class Action < Data.define(:command, :function, :help)
      private_class_method :new
    end

    def self.build_action(command, function, description)
        help = "Press '#{command}' to #{description}"
        return Action.send(:new, command, function, help)
    end
  end
end
