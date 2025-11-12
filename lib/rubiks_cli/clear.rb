module RubiksCli
  class Clear
    def self.screen
      system("clear") || system("cls")
    end

    def self.line_above
      print "\e[1A\e[K\n"
    end
  end
end
