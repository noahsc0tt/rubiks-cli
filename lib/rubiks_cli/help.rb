module RubiksCli
  class Help
    LOOP = "Press Enter to start timing\nPress any key to stop timing\nType 'n' for a new scramble\nType 'c' to clear the screen\nType 'h' or '?' for this message\nType 'q' to quit"

    def self.loop
      puts LOOP
    end
  end 
end
