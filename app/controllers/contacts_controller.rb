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
    else
      flash[:notice]
      render :new
    end
  rescue ScriptError { flash[:notice] = 'Sorry, this message appears to be spam and was not delivered.'}
  end

end
