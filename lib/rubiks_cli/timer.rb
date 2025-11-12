require 'io/console'
require_relative 'clear'

module RubiksCli
  class Timer
    INSPECTION_TIME = 15

    def self.start(inspection)
      if inspection
        self.inspection
      end
      Clear.current_line
      puts "\r#{self.time.round(3)}"
    end

    def self.time
      start = Time.now

      STDIN.raw do
        loop do
          elapsed = Time.now - start
          print "\r#{elapsed.round(1)}"
          return elapsed if STDIN.wait_readable(0.1)
        end
      ensure
        STDIN.getch rescue nil
      end
    end

    def self.inspection
      STDIN.raw do
        (0...INSPECTION_TIME).each do |i|
          print "\rInspection: #{i}"
          return if STDIN.wait_readable(1)
        end

        print "\r+2"
        2.times do
          return if STDIN.wait_readable(1)
        end
        
        print "\rDNF"
      ensure
        STDIN.getch rescue nil
      end
    end
  end
end

if __FILE__ == $0
  RubiksCli::Timer.start(true)
end
