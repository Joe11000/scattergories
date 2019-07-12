require 'rails_helper'
require 'support/round_runner/round_scoring_twelve'
require 'support/round_runner/round_scoring_eleven'

RSpec.describe "Playing Multiple Rounds", type: :system do  
  before :each do 
    driven_by :selenium_chrome_headless
  end

  it 'calculates the correct score' do   
    visit root_path 

    RoundRunner::RoundScoringEleven.new page: page, rspec_binding: self
    RoundRunner::RoundScoringTwelve.new page: page, rspec_binding: self
  end

end