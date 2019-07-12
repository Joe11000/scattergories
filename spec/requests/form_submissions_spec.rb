require 'rails_helper'

RSpec.describe "FormSubmissions", type: :request do
  describe "POST games/" do
    let(:params){ 
                  { 'game': { 
                              "answers": {
                                            "answer_0"=>"Gruel", 
                                            "answer_1"=>"", 
                                            "answer_2"=>"Gateway", 
                                            "answer_3"=>"Grade Papers", 
                                            "answer_4"=>"girls", 
                                            "answer_5"=>"Glaves", 
                                            "answer_6"=>"GPU", 
                                            "answer_7"=>"Gravy", 
                                            "answer_8"=>"Girls", 
                                            "answer_9"=>"Gilbert Gotfryd", 
                                            "answer_10"=>"Gulping", 
                                            "answer_11"=>"huggy"
                                         },
                              "letter_that_answers_must_start_with"=>"G" 
                            }
                } } 

                    

    it "works! (now write some real specs)" do
      post games_path, params: params 

      follow_redirect!
      # expect(response).to have_http_status(200)
      expect(response.body).to match /score: 11/
    end


  end
end
