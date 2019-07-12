require 'rails_helper'

RSpec.describe "Playing A Round", type: :system do  
  before :each do 
    driven_by :selenium_chrome_headless
  end
  # let(:params) {file_fixture('request_bodies/single_round_form_submission.json').read()['game']}

  def answers_to_score_eleven_points(letter)
    @answers_to_score_eleven_points ||= ["#{letter}", "#{letter} #{letter}", "#{letter}", "#{letter}", "#{letter}",
      "#{letter}", "#{letter}", "#{letter}", "#{letter}", "#{letter}",
      "", ""]
  end
  let(:score){11}

  it 'calculates the correct score' do   
    visit root_path 
    
    RoundRunner::RoundScoringEleven.new page, self
  end

end