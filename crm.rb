require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'
require 'faker'
require 'pry'

$rolodex = Rolodex.new

get '/' do
  @crm_app_name = "My CRM"
  @time = Time.new.strftime('%H:%M:%S')
  erb :index
end

get '/contacts' do
    erb :contacts
    # erb :contacts, layout: :other_layout
    # erb(:contacts, layout: :other_layout)       # => These all do the same thing. Used for adding a different layout
    # erb(:contacts, :layout => :other_layout)
    # erb(:contacts, {:layout => :other_layout})
end

get '/contacts/new' do
  erb :addcontact
end

post '/contacts' do
  puts "Submitting - params: #{params.inspect}"
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  $rolodex.add_contact(new_contact)
  redirect("/contacts")
end

get '/contacts/:id' do
  @search_contact = $rolodex.find(params[:id].to_i)

  if @search_contact
    erb :showcontact
  else
    raise Sinatra::NotFound
  end
end

get '/contacts/:id/edit' do
  @search_contact = $rolodex.find(params[:id].to_i)

  if @search_contact
    erb :editcontact
  else
    raise Sinatra::NotFound
  end
end