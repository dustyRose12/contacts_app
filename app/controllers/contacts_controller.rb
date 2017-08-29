class ContactsController < ApplicationController
  def one_contact_action
    @contact = Contact.first
    render 'one_contact_page.html.erb'
  end
end
