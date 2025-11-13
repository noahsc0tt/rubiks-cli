require_relative 'action'
require_relative 'engine'

module RubiksCli
  module Loop
    private
    def self.build_help_message(actions)
      actions.map { |action| action.help }.join("\n")
    end

    def self.build(on_enter, actions)
      help_action = create_action('h', -> { puts build_help_message(actions) }, "show this message")
      Loop::Engine.send(:new, on_enter, actions += DEFAULT_ACTIONS << help_action)
    end
  end
end
