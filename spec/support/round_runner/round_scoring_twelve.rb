require_relative 'round_runner'

module RoundRunner
  class RoundScoringTwelve < RoundRunner
    def submitted_answers secret_letter
      @submitted_answers ||= ["#{secret_letter}", "#{secret_letter} #{secret_letter}", "#{secret_letter}", "#{secret_letter}", "#{secret_letter}",
        "#{secret_letter}", "#{secret_letter}", "#{secret_letter}", "#{secret_letter}", "#{secret_letter}",
        "#{secret_letter}", ""]
    end

    def score_for_this_round
      12
    end
  end
end
