class TicketsController < ApplicationController

  before_action :authenticate_user! 

  def index
    @ticket = Ticket.all
  end 

  def new 
    @ticket = Ticket.new 
  end 

  def create 
    @ticket = Ticket.new ticket_params
    @ticket.user = current_user
    if @ticket.save
      redirect_to root_path 
    else 
      render :new
    end 
  end

  def destroy
    @ticket = Ticket.find params[:id]
    @ticket.destroy
    redirect_to root_path
  end 

  def edit
    @ticket = Ticket.find params[:id]
  end

  def update
    @ticket = Ticket.find params[:id]
    if @ticket.update ticket_params
      redirect_to root_path
    else
      render :edit
    end 
  end 


  private

  def ticket_params
    params.require(:ticket).permit(:title, :body, :author, :user_id)
  end 

end
