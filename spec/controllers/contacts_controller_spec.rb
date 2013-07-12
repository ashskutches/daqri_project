require 'spec_helper'

describe ContactsController do

  let(:valid_attributes) { { "name" => "Ash Skutches", "number" => "6100002312" } }
  let(:contact) { FactoryGirl.create(:contact) }


  describe "GET index" do
    it "assigns a newly created contact as @contacts" do
      contact
      get :index, {}
      assigns(:contacts).first.should eq(contact)
    end
    it "returns all contacts" do
      contact
      get :index, {}
      expect(response.body).to eq([contact].to_json)
    end
  end

  describe "GET show" do
    it "assigns the requested contact as @contact" do
      contact
      get :show, {:id => contact.to_param}
      assigns(:contact).should eq(contact)
    end
    it "returns a contact" do
      contact
      get :show, {id: contact.to_param}
      expect(response.body).to eq(contact.to_json)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Contact" do
        expect {
          post :create, {:contact => valid_attributes}
        }.to change(Contact, :count).by(1)
      end

      it "assigns a newly created contact as @contact" do
        pending
        post :create, {:contact => valid_attributes}
        assigns(:contact).should be_a(Contact)
        assigns(:contact).should be_persisted
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested contact" do
        contact
        Contact.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => contact.to_param, :contact => { "name" => "MyString" }}
      end

      it "assigns the requested contact as @contact" do
        contact
        put :update, {:id => contact.to_param, :contact => valid_attributes}
        assigns(:contact).should eq(contact)
      end
    end

    describe "with invalid params" do
      it "assigns the contact as @contact" do
        contact
        # Trigger the behavior that occurs when invalid params are submitted
        Contact.any_instance.stub(:save).and_return(false)
        put :update, {:id => contact.to_param, :contact => { "name" => "invalid value" }}
        assigns(:contact).should eq(contact)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested contact" do
      contact
      expect {
        delete :destroy, {:id => contact.to_param}
      }.to change(Contact, :count).by(-1)
    end
  end

end
