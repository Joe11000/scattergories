require 'rails_helper'

RSpec.describe "FormSubmissions", type: :request do
  describe "POST games/" do
    let(:params) do 
      JSON.parse(file_fixture('request_bodies/single_round_form_submission.json').read)
    end

    it "works! (now write some real specs)" do
      post games_path, params: params 

      follow_redirect!
      expect(response).to have_http_status(200)
      expect(response.body).to match /score: 11/
    end
  end
end
