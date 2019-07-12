require 'rails_helper'

RSpec.describe 'starting game' do 
  before :each do   
    driven_by :selenium_chrome_headless
  end
  context 'lands on the page' do   
    before :all do 
    end

    it 'sees the pregame section' do 
      visit root_path


      expect(page).to have_css '#pregame'      
    end
    
    it "doesn't see the midgame section " do  
      expect(page).to have_no_css '#midgame'
    end

    context 'clicks start button and', js: true do
      it 'sees the count down timer' do         
        visit root_path
        click_button 'Start Game'

        expect(page).to have_css '#timer-text', text: /\d+ seconds remaining/

        old_timer_val = page.find('#timer-text #time').text
        sleep 1

        page.find('#timer-text', text: /\d+ seconds remaining/)
        new_timer_val = page.find('#timer-text #time').text
        expect(old_timer_val.to_i).to be > new_timer_val.to_i
      end

      it 'sees the form' do 
        visit root_path
        click_button 'Start Game'

        expect(page).to have_css '#questions-form'
      end

      it 'sees the category letter' do 
        visit root_path
        click_button 'Start Game'

        expect(page).to have_css '#instructions #secret-letter'
        
      end
      it "doesn't see the start button" do  
        visit root_path
        click_button 'Start Game'

        expect(page).to have_no_css '#start-button'
      end
    end
  end
  
end