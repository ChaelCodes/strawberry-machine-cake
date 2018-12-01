require 'rails_helper'

RSpec.describe CharactersController, type: :controller do
  describe "GET #index" do
    let(:active_character) { create :character }
    let(:inactive_character) { create :character, :inactive }

    render_views
    it "returns a success response" do
      active_character
      get :index, params: {}
      expect(response).to be_successful
    end

    it 'only returns active characters' do
      active_character
      inactive_character
      get :index, params: { format: :json }
      resp = JSON.parse(response.body).map { |chara| chara['id'] }
      expect(resp).to include(active_character.id)
      expect(resp).not_to include(inactive_character.id)
    end
  end

   describe "POST #create" do
    context "with valid params" do
      it "creates a new Character" do
        expect {
          post :create, params: { character: { display_name: 'Ace Hadoop' } }
        }.to change(Character, :count).by(1)
      end

      it "redirects to the created user" do
        post :create, params: { character: { display_name: 'Ace Hadoop' } }
        expect(response).to redirect_to(Character.find_by(display_name: 'Ace Hadoop'))
      end

      it "lets the user know the character was created" do
        post :create, params: { character: { display_name: 'Ace Hadoop' } }
        expect(flash[:success]).to eq 'Character was successfully saved.'
      end
    end

    # context "with invalid params" do
    #   it "returns a success response (i.e. to display the 'new' template)" do
    #     post :create, params: { character: { name: 'Falsey' } }
    #     expect(response).to be_successful
    #   end
    # end
  end

   describe "PUT #update" do
    let(:character) { create :character }

    context "with valid params" do
      before do
        put :update, params: {id: character.to_param, character: { display_name: 'Ace Hadoop' } }
      end

      it "updates an existing User" do
        expect(character.reload.display_name).to eq 'Ace Hadoop'
      end

      it "redirects to the updated user" do
        expect(response).to redirect_to(Character.find_by(display_name: 'Ace Hadoop'))
      end

      it "lets the user know the character was updated" do
        expect(flash[:success]).to eq 'Character was successfully saved.'
      end
    end

    # context "with invalid params" do
    #   it "returns a success response (i.e. to display the 'edit' template)" do
    #     expect(response).to be_successful
    #   end
    # end
  end

  describe "DELETE #destroy" do
    let(:character) { create :character }

    it "destroys the requested character" do
      character
      expect {
        delete :destroy, params: {id: character.to_param}
      }.to change(Character, :count).by(-1)
    end

    it "redirects to the characters list" do
      delete :destroy, params: {id: character.to_param}
      expect(response).to redirect_to(characters_url)
    end

    it "issues a flash message" do
      delete :destroy, params: {id: character.to_param}
      expect(flash[:success]).to eq 'Character was successfully destroyed.'
    end
  end
end