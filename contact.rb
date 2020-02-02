class Contact

  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []
  @@id = 1

  # This method should initialize the contact's attributes
  
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1 
  end

  # This method should call the initializer, 
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    return @@contacts

  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |i|
      if i == id 
        p i 
      end
    end 
    
  end

  # This method should allow you to specify 
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(type, updated)
    if type == "1"
      @first_name = updated
    elsif type == "2"
      @last_name = updated
    elsif type == "3"
      @email = updated
    elsif type == "4"
      @note = updated
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(type, input)
  	if type == "1"
  		@@contacts.each do |f|
  			if f.first_name == input
  				return f.first_name
  			end
  		end
  	elsif type == "2"
  		@@contacts.each do |l|
  			if l.last_name == input
  				return l.last_name
  			end
  		end
  	elsif type == "3"
  		@@contacts.each do |e|
  			if e.email == input
  				return e.email
  			end
  		end
  	end
  			
    
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear

  end

  def full_name
  	return "#{@first_name} #{@last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
 
    def delete_contact
      print 'Enter ID of contact: '
      id = gets.chomp.to_i
      Contact.find(id).delete
    end



  # Feel free to add other methods here, if you need them.
  
end

# a = Contact.create("Yossi", "Goldberg", "hgjdf", "jhsg")
# # p Contact.find(1)
# p Contact.find_by("1", "Yossi")
# a.update("3", "yygold")
# p Contact.all


