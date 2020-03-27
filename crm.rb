require_relative 'contact'

class CRM 

  def initialize
    

  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end 

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit 

    end 

  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    contact = Contact.create(
      first_name: first_name,
      # last_name:  last_name,
      email:      email,
      note:       note
    )

  end

  def modify_existing_contact
    print "Enter the ID of the contact you would like to modify? "
    contacts_id = gets.chomp
    

  end

  def delete_contact
    def delete_contact
      print 'Enter ID of contact: '
      id = gets.chomp.to_i
      Contact.find(id).delete
    end

  end


  def display_all_contacts
    p Contact.all
    
  end

  def search_by_attribute
    puts "Select from the following options: "
    puts "1. First name "
    puts "2. Last name "
    puts "3. Email "
    select_option = gets.chomp.to_i
    if select_option == 1
      print "Enter first name "
      user_input = gets.chomp
      p Contact.find_by(first_name: user_input)
    end 
    if select_option == 2
      print "Enter last name "
      user_input = gets.chomp
      p Contact.find_by(last_name: user_input)
    end 
    if select_option == 3
      print "Enter email "
      user_input = gets.chomp
      p Contact.find_by(email: user_input)
    end 
    
  end


end

a_crm_app = CRM.new
a_crm_app.main_menu

at_exit do
  ActiveRecord::Base.connection.close
end

