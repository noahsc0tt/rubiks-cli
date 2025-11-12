require 'io/console'
require_relative 'clear'

module RubiksCli
  class Timer
    INSPECTION_TIME = 5

    def self.show
      puts "\r#{self.time.round(3)}"
    end

    def self.time
      start = Time.now

      STDIN.raw do
        loop do
          print "\r#{(Time.now - start).round(1)}"
          break if STDIN.wait_readable(0.01)
        end
        STDIN.read_nonblock(1) rescue nil
      end

      return Time.now - start
    end

    def self.inspection
      STDIN.raw do
        (0..INSPECTION_TIME-1).each do |i|
          print "\r#{i}"
          return if STDIN.wait_readable(1)
        end
        print "\r+2"
        2.times do
          return if STDIN.wait_readable(1)
        end
        print "\rDNF"
        STDIN.getch
      ensure
        STDIN.read_nonblock(1) rescue nil
      end
    end
  end
end

if __FILE__ == $0
  RubiksCli::Timer.inspection
end
