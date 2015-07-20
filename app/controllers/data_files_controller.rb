class DataFilesController < ApplicationController
  def index
    @data_files = DataFile.all
  end

  def show
    @data_file = DataFile.find(params[:id])
  end

  def new
    @data_file = DataFile.new
  end

  def create
    @data_file = DataFile.new(data_file_params)

    if @data_file.save
      flash[:notice] = "Data File saved successfully"
      redirect_to data_files_path
    else
      flash[:alert] = @data_file.errors.full_messages
      render :new
    end
  end

  def download
    #load the selected CSV file from S3 into the database
    @data_file = DataFile.find(params[:id])
    @url = @data_file.csv_file.url
    @file = CSV.parse(open(@url))
    gon.data = @file.to_json
    check_url = @data_file.csv_file.url
  end

  protected
  def data_file_params
    params.require(:data_file).permit(:name, :category, :description, :user_id, :csv_file)
  end
end
