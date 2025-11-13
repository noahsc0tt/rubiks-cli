module RubiksCli
  module Loop
    Action = Data.define(:command, :function, :help)

    def build_action(command, function, description)
        help = "Press '#{command}' to #{description}"
        return Action.new(command, function, help)
    end
  end
end
