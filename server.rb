require 'sinatra'

require_relative 'contact'

get '/' do 
    redirect to ('/contacts')
end 

get '/contacts' do 
    @title = "contacts"
    @contacts = Contact.all

    erb :contacts 
end 


get '/form' do 
    erb :form 
end 

post '/contacts' do 
    puts "post request received..#{params}"
@contact = Contact.new
@contact.first_name = params[:first_name] 
@contact.last_name = params[:last_name] 
@contact.phone_number = params[:phone_number]
@contact.email = params[:email]
@contact.note = params[:note]


    if @contact.save
        redirect to ('/contacts')
    else 
        redirect to ('/form')

    end 
end

get '/contacts/:id' do 
    @contact = Contact.find(params[:id])
    erb :contact

end


