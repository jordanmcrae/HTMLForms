require 'faker'
class Rolodex   # => This is the class that helps us hold the contacts and contain them and organize them

  attr_reader :contacts

  def initialize
    @contacts = []
    @id = 0
    10.times do
      @contacts << Contact.new(Faker::Name.first_name, Faker::Name.last_name, Faker::Internet.email, Faker::Hacker.say_something_smart)
    end
  end

  def add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end
end