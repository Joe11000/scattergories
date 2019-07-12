# args must resemble
  # args[:answers][#integer#] = 'Gravy'
  # args[:letter_that_answers_must_start_with] = 'G'

ScoreCalculator = Proc.new do |args|
  score = 0
  args[:answers].each do |key, answer|
    answer.split(' ').select do |word_in_answer| 
      if word_in_answer.capitalize.starts_with? args[:letter_that_answers_must_start_with] 
        score += 1
      end
    end
  end
  score
end