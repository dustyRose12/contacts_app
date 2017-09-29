class ContactsController < ApplicationController

  def index
    @contacts = Contact.all

     search_term = params[:search_term]

     group_sort = params[:group_id]

     if group_sort 
      @contacts = Group.find_by(id: group_sort).contacts 
    end

    if search_term
      @contacts = @contacts.where("first_name iLIKE ? OR last_name iLIKE ? OR email iLIKE ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
    end 
  end

   def show
    @contact = Contact.find_by(id: params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(
                                    first_name: params[:first_name],
                                    middle_name: params[:middle_name],
                                    last_name: params[:last_name],
                                    user_id: current_user.id,
                                    email: params[:email],
                                    phone_number: params[:phone_number],
                                    bio: params[:bio]
                                    )
    if @contact.save
      flash[:success] = "Contact Successfully Created"
      redirect_to "/contacts/#{@contact.id}"
    else
      @errors = @contact.errors.full_messages
      render "new.html.erb"
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])

    @contact.assign_attributes(
                                          first_name: params[:first_name],
                                          middle_name: params[:middle_name],
                                          last_name: params[:last_name],
                                          email: params[:email],
                                          phone_number: params[:phone_number],
                                          bio: params[:bio]
                                    )

    if @contact.save
      flash[:success] = "Contact Successfully Updated"
      redirect_to "/contacts/#{@contact.id}"
    else
      #need to add the supplier line in here and fix it in the edit page too
      @errors = @contact.errors.full_messages
      render "edit.html.erb"
    end

  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    flash[:warning] = "Contact Successfully Destroyed"
    redirect_to "/contacts"
  end

end


