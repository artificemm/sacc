class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  def index
    @clients = Client.search_by_name_or_lastname(params[:search]).order("#{sort_column}  #{sort_direction}").page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.js{ @clients}
    end
  end

  def show
  end

  def new
    @client = Client.new
  end

  def edit
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to @client, notice: 'Client was successfully created.'
    else
      render :new
    end
  end

  def update
    if @client.update(client_params)
      redirect_to @client, notice: 'Client was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_url, notice: 'Client was successfully destroyed.'
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:search,:sort,:direction,:page,:name, :paternal_lastname, :maternal_lastname, :curp, :imss, :spouse, :birthdate, :mail, :income, :notes, :workplace, :gender,
                                      phones_attributes: [:number, :phone_type, :available_from, :available_to],
                                      addresses_attributes: [:street, :colony,:external_number, :internal_number,:zip_code])
    end

    def sort_column
      Client.columns_names.include?(params[:sort]) ? params[:sort] : 'name'
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
