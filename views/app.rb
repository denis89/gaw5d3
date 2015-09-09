class Order < Sinatra::Base

  get '/' do
    erb :home
  end

  get '/contact' do
    erb :contact
  end
  
  # index
  get '/menu' do
    @menus = Order.all
    erb(:"menu/index")
  end

  #new -> Order in this case
  get '/menu/new' do
  @menu = Order.new
  erb(:"menu/new")
  end
  
  # create
  post '/menu' do
  @order = Order.new(params[:menu])
  if @menu.save
    redirect("/menu/#{@menu.id}")
  else 
    erb(:"menu/new")
  end
    
