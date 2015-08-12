class ConvnetimagesController < ApplicationController
  before_action :set_convnetimage, only: [:show, :edit, :update, :destroy]

#incorporated search to our scaffold
def search
  if params[:search].present?
    @convnets = Convnetimage.search(params[:search])
  else
    @convnets = Convnetimage.all
  end
end
  # GET /convnetimages
   def index
    @convnetimages = Convnetimage.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /convnetimages/1
  # GET /convnetimages/1.json
  def show
    @convnetimages = current_user.results.where(convnetimage: convnetimage)
  end

  # GET /convnetimages/new
  def new
    @convnetimage = Convnetimage.new
  end

  # GET /convnetimages/1/edit
  def edit
    convnetimage
  end

  # POST /convnetimages
  # POST /convnetimages.json
  def create
    @convnetimage = Convnetimage.new(convnetimage_params)

    respond_to do |format|
      if @convnetimage.save
        format.html { redirect_to @convnetimage, notice: 'Convnetimage was successfully created.' }
      else
        flash[:errors] = @convnetimage
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /convnetimages/1
  # PATCH/PUT /convnetimages/1.json
  def update
    respond_to do |format|
      if @convnetimage.update(convnetimage_params)
        format.html { redirect_to @convnetimage, notice: 'Convnetimage was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /convnetimages/1
  # DELETE /convnetimages/1.json
  def destroy
    @convnetimage.destroy
    respond_to do |format|
      format.html { redirect_to convnetimages_url, notice: 'Convnetimage was successfully destroyed.' }
    end
  end

  def generate_result
    deeplearningWorker.perform_async(result_params, model.id, current_user.id)
    respond_to do |format|
      format.html { redirect_to model_path(model), notice: 'Wait while the result is being processed...' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_convnetimage
      @convnetimage = Convnetimage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def convnetimage_params
      params.require(:convnetimage).permit(:name, :api, :modelid, :description)
    end
    #Below function may not be necessary. this function below simply mashed our inputs and outputs together for acceptable format with Azure.
    def result_params
      inputs = params.require(:model).permit(model.inputs.map(&:name))
      model.outputs.reduce(inputs) do |hash, output|
        hash.merge(output.name => output.default_value)
      end
    end
end