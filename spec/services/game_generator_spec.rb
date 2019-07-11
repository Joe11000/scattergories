require 'rails_helper'

RSpec.describe PregameSetup do
  context '#call' do 
    it 'populates the database with categories' do  
      expect{PregameSetup.call}.to change{Category.count}.from(0).to(316)
      expect(Category.first.question).to be_a String
      expect(Category.last.question).to be_a String
      expect(Category.first.question).to eq "3-Letter Words"
      expect( Category.last.question).to eq "World Leaders/Politicians"
    end
  end

  context '#category_file_path' do  
    it 'load the file' do 
      expect( PregameSetup.send(:populate_db_with_categories) ).to eq true
    end
  end
  context '#category_file_path' do  
    it 'load the file' do 
      expect(PregameSetup.send :category_file_path).to eq '/Users/joe/Dropbox/coding/coding/ruby/rails/wip/rails5/scattergories/app/assets/json/categories.json'
    end
  end
end