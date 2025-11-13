module RubiksCli
  module Loop
    private
    def self.build_help_message(actions)
      actions.map { |action| action.help }.join("\n")
    end

    def self.build_loop(actions)
      help_action = build_action('h', -> { puts build_help_message(actions) }, "show help")
      Loop::Loop.send(:new, actions += DEFAULT_ACTIONS << help_action)
    end
  end
end
