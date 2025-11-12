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
  end
end
