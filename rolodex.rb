require 'faker'
class Rolodex   # => This is the class that helps us hold the contacts and contain them and organize them

  attr_reader :contacts

  def initialize
    @contacts = []
    @id = 0
    10.times do
      new_contact = Contact.new(Faker::Name.first_name, Faker::Name.last_name, Faker::Internet.email, Faker::Hacker.say_something_smart)
      add_contact(new_contact)
      @contacts << new_contact
    end
  end

  def add_contact(contact)
    puts "Adding contact...#{@id}"
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def find(contact_id)
    @contacts.find {|contact| contact.id == contact_id }
  end

end