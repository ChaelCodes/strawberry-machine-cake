require 'rails_helper'

RSpec.describe PixesController, type: :controller do
  let(:pix) { create :pix }
  describe "GET #index" do
    it "returns a success response" do
      pix
      get :index, params: {}
      expect(response).to be_successful
    end
  end

   describe "POST #create" do
    context "with valid params" do
      let(:character) { create :character }
      let(:valid_params) { { pix: { msg: 'PARTY!', character_id: character.id } } }

      it "creates a new Pix" do
        expect {
          post :create, params: valid_params
        }.to change(Pix, :count).by(1)
      end

      it "lets the user know the pix was created" do
        post :create, params: valid_params
        expect(flash[:success]).to eq 'Pix was successfully saved.'
      end

      context 'without scenario' do
        it "redirects to the updated pix's character page" do
          post :create, params: valid_params
          pix = Pix.find_by(msg: 'PARTY!')
          expect(response).to redirect_to(character_path(pix.character, anchor: "pix-#{pix.id}"))
        end
      end

      context 'with scenario' do
        let(:scenario) { create :scenario }
        let(:valid_params) { { pix: { msg: 'PARTY!', character_id: character.id, scenario_id: scenario.id } } }

        it "redirects to the updated pix's scenario page" do
          post :create, params: valid_params
          pix = Pix.find_by(msg: 'PARTY!')
          expect(response).to redirect_to(scenario_path(pix.scenario, anchor: "pix-#{pix.id}"))
        end
      end
    end

    # context "with invalid params" do
    #   it "returns a success response (i.e. to display the 'new' template)" do
    #     post :create, params: { pix: { name: 'Falsey' } }
    #     expect(response).to be_successful
    #   end
    # end
  end

   describe "PUT #update" do
    let(:pix) { create :pix }

    context "with valid params" do
      before do
        put :update, params: { id: pix.to_param, pix: { msg: 'PARTY!' } }
      end

      it "updates an existing Pix" do
        expect(pix.reload.msg).to eq 'PARTY!'
      end

      it "lets the user know the pix was updated" do
        expect(flash[:success]).to eq 'Pix was successfully saved.'
      end

      context 'without scenario' do
        it "redirects to the updated pix's character page" do
          expect(response).to redirect_to(character_path pix.character, anchor: "pix-#{pix.id}")
        end
      end

      context 'with scenario' do
        let(:scenario) { create :scenario }
        let(:pix) { create :pix, scenario: scenario }

        it "redirects to the updated pix's scenario page" do
          expect(response).to redirect_to(scenario_path pix.scenario, anchor: "pix-#{pix.id}")
        end
      end
    end

    # context "with invalid params" do
    #   it "returns a success response (i.e. to display the 'edit' template)" do
    #     expect(response).to be_successful
    #   end
    # end
  end

  describe "DELETE #destroy" do
    let(:pix) { create :pix }

    it "destroys the requested pix" do
      pix
      expect {
        delete :destroy, params: {id: pix.to_param}
      }.to change(Pix, :count).by(-1)
    end

    it "redirects to the pixes list" do
      delete :destroy, params: {id: pix.to_param}
      expect(response).to redirect_to(pixes_url)
    end

    it "issues a flash message" do
      delete :destroy, params: {id: pix.to_param}
      expect(flash[:success]).to eq 'Pix was successfully destroyed.'
    end
  end
end