require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

  describe "#create" do
    context "valid request" do
      def valid_request
      post :create, {ticket: {title: "Ticket", 
                              body: "I need help", 
                              author: "Zac"}}
      end

      it "creates a new ticket record in the database" do 
        expect { valid_request }.to change { Ticket.count }.by(1)
      end 

      it "redirect to home page" do
        valid_request
        expect(response).to redirect_to(root_path)
      end
    end 



    context "invalid request" do
      def invalid_request
        post :create, {ticket: {
                                body: "I need help",
                                author: "Zac"}}
      end 

      it "doesn't create a record in the database" do
        expect { invalid_request }.not_to change { Ticket.count }
      end

      it "renders the new page" do
        invalid_request
        expect(response).to render_template(:new)
      end
    end 
  end 




end
