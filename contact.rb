class Contact
  attr_accessor :first_name, :last_name, :email, :note, :id

  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
  end

  def to_s
    "Contact #{@id}, First name: #{@first_name}, Last name: #{@last_name}, Email: #{@email}, Note: #{@note}"
  end
end