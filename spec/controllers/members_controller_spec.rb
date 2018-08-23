require 'rails_helper'

RSpec.describe MembersController, type: :controller do
  login_user

  let(:valid_attributes) { attributes_for :member }
  let(:invalid_attributes) { attributes_for :member, email: nil }
  let(:member) { create :member }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: member.to_param}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: {id: member.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Member" do
        expect {
          post :create, params: {member: valid_attributes}
        }.to change(Member, :count).by(1)
      end

      it "redirects to the created member" do
        post :create, params: {member: valid_attributes}
        expect(response).to redirect_to(Member.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {member: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { attributes_for :member, first_name: 'Anakin' }

      it "updates the requested member" do
        put :update, params: {id: member.to_param, member: new_attributes}
        member.reload
        expect(member.first_name).to eq 'Anakin'
      end

      it "redirects to the member" do
        put :update, params: {id: member.to_param, member: valid_attributes}
        expect(response).to redirect_to(member)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: {id: member.to_param, member: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested member" do
      member = create :member
      expect {
        delete :destroy, params: {id: member.to_param}
      }.to change(Member, :count).by(-1)
    end

    it "redirects to the members list" do
      delete :destroy, params: {id: member.to_param}
      expect(response).to redirect_to(members_url)
    end
  end

  describe 'GET #search' do
    it 'finds by given substring' do
      kowalski = create :member, last_name: 'Kowalski'
      get :search, params: {q: 'Lski'}
      expect(response).to be_successful
      expect(assigns :members).to eq [ kowalski ]
    end
  end

end
