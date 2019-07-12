require_relative 'round_runner'

module RoundRunner
  class RoundScoringEleven < RoundRunner
    def submitted_answers secret_letter
      @submitted_answers ||= ["#{secret_letter}", "#{secret_letter} #{secret_letter}", "#{secret_letter}", "#{secret_letter}", "#{secret_letter}",
        "#{secret_letter}", "#{secret_letter}", "#{secret_letter}", "#{secret_letter}", "#{secret_letter}",
        "", ""]
    end

    def score_for_this_round
      11
    end
  end
end