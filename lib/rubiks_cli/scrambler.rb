module RubiksCli
  class Scrambler
    LENGTH = 20
    FACES = ['U', 'D', 'F', 'B', 'L', 'R']
    SUFFIXES = [ '', '\'', '2' ]

    def self.get_scramble
      moves = []
      second_to_last_face = ''
      last_face = ''

      LENGTH.times do |i|
          next_move = ""
          next_face = ''
          begin
              next_move = self.get_move
              next_face = next_move[0]
          end while next_face == second_to_last_face || next_face == last_face

          moves[i] = next_move
          second_to_last_face = last_face
          last_face = next_face
      end
      moves.join(", ")
    end

    private
    def self.get_move
      FACES.sample + SUFFIXES.sample
    end
  end
end
