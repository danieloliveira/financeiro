class ExemplosController < ApplicationController
  # GET /exemplos
  # GET /exemplos.xml
  def index
    @exemplos = Exemplo.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @exemplos }
    end
  end

  # GET /exemplos/1
  # GET /exemplos/1.xml
  def show
    @exemplo = Exemplo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @exemplo }
    end
  end

  # GET /exemplos/new
  # GET /exemplos/new.xml
  def new
    @exemplo = Exemplo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @exemplo }
    end
  end

  # GET /exemplos/1/edit
  def edit
    @exemplo = Exemplo.find(params[:id])
  end

  # POST /exemplos
  # POST /exemplos.xml
  def create
    @exemplo = Exemplo.new(params[:exemplo])

    respond_to do |format|
      if @exemplo.save
        flash[:notice] = 'Exemplo was successfully created.'
        format.html { redirect_to(@exemplo) }
        format.xml  { render :xml => @exemplo, :status => :created, :location => @exemplo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @exemplo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /exemplos/1
  # PUT /exemplos/1.xml
  def update
    @exemplo = Exemplo.find(params[:id])

    respond_to do |format|
      if @exemplo.update_attributes(params[:exemplo])
        flash[:notice] = 'Exemplo was successfully updated.'
        format.html { redirect_to(@exemplo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @exemplo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /exemplos/1
  # DELETE /exemplos/1.xml
  def destroy
    @exemplo = Exemplo.find(params[:id])
    @exemplo.destroy

    respond_to do |format|
      format.html { redirect_to(exemplos_url) }
      format.xml  { head :ok }
    end
  end
end
