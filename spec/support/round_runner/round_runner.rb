module RoundRunner
  class RoundRunner 
    def initialize page:, rspec_binding:
      @page = page
      @rspec_binding = rspec_binding

      play_round
    end

    def play_round 
      page.click_on 'Start Game'

      @secret_letter = page.find('#secret-letter').text[1]

      page.all('#questions-form [id*="answer_"]').each_with_index do |input_element, index| 
        input_element.fill_in with: submitted_answers(secret_letter)[index]
      end
      
      page.click_on 'Submit Early'

      rspec_binding.expect(page).to rspec_binding.have_content "score: #{score_for_this_round}"
    end

    def submitted_answers
      raise 'Child must give answers submitted by user' 
    end

    def score_for_this_round 
      raise 'Child must give score' 
    end

    private 
      attr_reader :secret_letter, :page, :rspec_binding
  end
end
