class Order < Sinatra::Base

  get '/' do
    erb :home
  end

  get '/contact' do
    erb :contact
  end
  
  # index
  get '/menu' do
    @menus = Orders.all
    erb(:"menu/index")
  end

  #new -> Orders in this case
  get '/Orders/new' do
  @menu = Orders.new
  erb(:"Orders/new")
  end
  
  # create
  post '/Orders' do
  @Orders = Orders.new(params[:menu])
  if @menu.save
    redirect("/menu/#{@menu.id}")
  else 
    erb(:"menu/new")
  end
  end


  # show
  get '/Orders/:id' do
  @menu = Orders.find(params[:id])    
  erb(:"menu/show")
  end

  # edit 
  get 'Orders/:id/edit' do
    @menu = Orders.find(params[:id])
    erb(:"menu/edit")
  end

  #update
  put '/Orders/:id' do
    @menu = Orders.find(params[:id])
    if @menu.update_attributes(params[:menu])
      redirect ("/menu/#{menu.id}")
    else 
      erb(:"menu/edit")
    end
  end

  #delete
  delete '/Orders/:id/delete' do
    @menu = Orders.find(params[:id])
    if @menu.destroy
      redirect('/menu')
    else 
      redirect ("/menu/#{menu.id}")
    end
  end
end