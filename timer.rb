require 'io/console'

module Timer
  def self.time
    start = Time.now

    STDIN.raw do
      loop do
        break if STDIN.wait_readable(0.01)
      end
      STDIN.read_nonblock(1) rescue nil
    end

    return Time.now - start
  end
end

if __FILE__ == $0
  puts Timer.time
end
