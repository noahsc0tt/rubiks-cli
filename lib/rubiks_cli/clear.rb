module RubiksCli
  module Clear
    def self.screen
      system("clear") || system("cls")
    end

    def self.current_line
      print "\r\e[K"
    end

    def self.line_above
      print "\e[1A\r\e[K\n"
    end
  end
end
