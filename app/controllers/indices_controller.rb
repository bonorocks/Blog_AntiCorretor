class IndicesController < ApplicationController
 
  # Requisicao de autenticacao
   before_filter :authenticate, :except => [:index, :show]
 
 $json = Indice.all.to_gmaps4rails
 
 # GET /indices
  # GET /indices.xml
  def index
    @indices = Indice.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @indices }
    end
  end

  # GET /indices/1
  # GET /indices/1.xml
  def show
    @index = Indice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @index }
    end
  end

  # GET /indices/new
  # GET /indices/new.xml
  def new
    @index = Indice.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @index }
    end
  end

  # GET /indices/1/edit
  def edit
    @index = Indice.find(params[:id])
  end

  # POST /indices
  # POST /indices.xml
  def create
    @index = Indice.new(params[:index])

    respond_to do |format|
      if @index.save
        format.html { redirect_to(@index, :notice => 'Indice was successfully created.') }
        format.xml  { render :xml => @index, :status => :created, :location => @index }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @index.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /indices/1
  # PUT /indices/1.xml
  def update
    @index = Indice.find(params[:id])

    respond_to do |format|
      if @index.update_attributes(params[:index])
        format.html { redirect_to(@index, :notice => 'Indice was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @index.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /indices/1
  # DELETE /indices/1.xml
  def destroy
    @index = Indice.find(params[:id])
    @index.destroy

    respond_to do |format|
      format.html { redirect_to(indices_url) }
      format.xml  { head :ok }
    end
  end
  
    #Adicionando codigo par autenticação básica
  
   private

   def authenticate
      authenticate_or_request_with_http_basic do |name, password|
         name =="corretor" && password == "anticorretor"
      end
    end
    
end
