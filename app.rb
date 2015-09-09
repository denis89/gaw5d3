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
  get '/order/new' do
  @menu = Order.new
  erb(:"order/new")
  end
  
  # create
  post '/order' do
  @order = Order.new(params[:menu])
  if @menu.save
    redirect("/menu/#{@menu.id}")
  else 
    erb(:"menu/new")
  end
  end


  # show
  get '/order/:id' do
  @menu = Order.find(params[:id])    
  erb(:"menu/show")
  end

  # edit 
  get 'order/:id/edit' do
    @menu = Order.find(params[:id])
    erb(:"menu/edit")
  end

  #update
  put '/order/:id' do
    @menu = Order.find(params[:id])
    if @menu.update_attributes(params[:menu])
      redirect ("/menu/#{menu.id}")
    else 
      erb(:"menu/edit")
    end
  end

  #delete
  delete '/order/:id/delete'
  do
    @menu = Order.find(params[:id])
    if @menu.destroy
      redirect('/menu')
    else 
      redirect ("/menu/#{menu.id}")
    end
  end
end