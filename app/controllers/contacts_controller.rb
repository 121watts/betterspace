class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash[:notice] = 'Thank you for your message!'
      UserMailer.contact_us(current_user).deliver
      redirect_to complaints_path
    else
      flash[:notice]
      render :new
    end
  end

end
