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

    @file[0][0] = 'x'

    @x_time = []
    @data1 = []
    @data2 = []
    @data3 = []
    @data4 = []
    @data5 = []
    @data6 = []
    @data7 = []
    @data8 = []
    @data9 = []

    @file.each do |array|
      @x_time << array[0]
      @data1 << array[1]
      @data2 << array[2]
      @data3 << array[3]
      @data4 << array[4]
      @data5 << array[5]
      @data6 << array[6]
      @data7 << array[7]
      @data8 << array[8]
    end

    # gon.data = @file.to_json
    # check_url = @data_file.csv_file.url

    # Code from Christina
    # respond_to do |format|
    #   format.html
    #   format.json {
    #     render :json => @file.to_json
    #   }
    # end
    gon.x_time = @x_time
    gon.data1 = @data1
    gon.data2 = @data2
    gon.data3 = @data3
    gon.data4 = @data4
    gon.data5 = @data5
    gon.data6 = @data6
    gon.data7 = @data7
    gon.data8 = @data8

  end

  protected
  def data_file_params
    params.require(:data_file).permit(:name, :category, :description, :user_id, :csv_file)
  end
end
