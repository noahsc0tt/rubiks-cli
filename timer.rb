require 'io/console'

module Timer

  def self.clear_screen
    system("clear") || system("cls")
  end

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

  def self.start
    clear_screen
    time = Timer.time
    clear_screen
    puts time.round(3)
  end
end

if __FILE__ == $0
  Timer.start
end
