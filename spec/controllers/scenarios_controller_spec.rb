require 'rails_helper'

RSpec.describe ScenariosController, type: :controller do
  login_user

  let(:scenario) { create :scenario }
  describe "GET #index" do
    it "returns a success response" do
      scenario
      get :index, params: {}
      expect(response).to be_successful
    end
  end

   describe "POST #create" do
    context "with valid params" do
      let(:valid_params) { { scenario: { name: '#1-04B - Monster Mama' } } }
      it "creates a new Scenario" do
        expect {
          post :create, params: valid_params
        }.to change(Scenario, :count).by(1)
      end

      it "redirects to the created scenario" do
        post :create, params: valid_params
        expect(response).to redirect_to(Scenario.find_by(name: '#1-04B - Monster Mama'))
      end

      it "lets the user know the scenario was created" do
        post :create, params: valid_params
        expect(flash[:success]).to eq 'Scenario was successfully saved.'
      end
    end

    # context "with invalid params" do
    #   it "returns a success response (i.e. to display the 'new' template)" do
    #     post :create, params: { scenario: { name: 'Falsey' } }
    #     expect(response).to be_successful
    #   end
    # end
  end

   describe "PUT #update" do
    let(:scenario) { create :scenario }

    context "with valid params" do
      before do
        put :update, params: {id: scenario.to_param, scenario: { name: '#1-01 - Commencement' } }
      end

      it "updates an existing Scenario" do
        expect(scenario.reload.name).to eq '#1-01 - Commencement'
      end

      it "redirects to the updated scenario" do
        expect(response).to redirect_to(Scenario.find_by(name: '#1-01 - Commencement'))
      end

      it "lets the user know the scenario was updated" do
        expect(flash[:success]).to eq 'Scenario was successfully saved.'
      end
    end

    # context "with invalid params" do
    #   it "returns a success response (i.e. to display the 'edit' template)" do
    #     expect(response).to be_successful
    #   end
    # end
  end

  describe "DELETE #destroy" do
    let(:scenario) { create :scenario }

    it "destroys the requested scenario" do
      scenario
      expect {
        delete :destroy, params: {id: scenario.to_param}
      }.to change(Scenario, :count).by(-1)
    end

    it "redirects to the scenarios list" do
      delete :destroy, params: {id: scenario.to_param}
      expect(response).to redirect_to(scenarios_url)
    end

    it "issues a flash message" do
      delete :destroy, params: {id: scenario.to_param}
      expect(flash[:success]).to eq 'Scenario was successfully destroyed.'
    end
  end
end