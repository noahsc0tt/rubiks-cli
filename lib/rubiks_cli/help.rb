module RubiksCli
  class Help
    LOOP = "Press Enter to start timing\nPress any key to stop timing\nType 'q' to quit\nType 'n' for a new scramble\nType 'h' or '?' for this message"

    def self.loop
      puts LOOP
    end
  end 
end
