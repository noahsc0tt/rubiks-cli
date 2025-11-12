require 'io/console'
require_relative 'clear'

module RubiksCli
  class Timer
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
        start = Time.now
        while (i = (Time.now - start).floor()) < 5
          print "\r#{i}"
          sleep(0.01)
          return if STDIN.wait_readable(0.01)
        end
        print "\r+2"
        start = Time.now
        while (Time.now - start) < 2
          return if STDIN.wait_readable(0.01)
        end
        print "\rDNF"

        STDIN.read(1) rescue nil
      ensure
        STDIN.read_nonblock(1) rescue nil
      end
    end
  end
end

if __FILE__ == $0
  RubiksCli::Timer.inspection
end
