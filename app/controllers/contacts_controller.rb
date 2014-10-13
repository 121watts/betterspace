class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash[:notice] = 'Thank you for your message!'
      redirect_to complaints_path
      UserMailer.contact_us(current_user).deliver
    else
      flash[:notice]
      render :new
    end
  end

end
