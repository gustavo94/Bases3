class TrayectoriaController < ApplicationController
  before_action :set_trayectorium, only: [:show, :edit, :update, :destroy]



  def MSM
    msm = Trayectorium.MSM(Trayectorium.find(params[:a]), Trayectorium.find(params[:b]))
    render text: msm
  end  
  # GET /trayectoria
  # GET /trayectoria.json
  def index
    @trayectoria = Trayectorium.all
  end

  # GET /trayectoria/1
  # GET /trayectoria/1.json
  def show
  end

  # GET /trayectoria/new
  def new
    @trayectorium = Trayectorium.new
  end

  # GET /trayectoria/1/edit
  def edit
  end

  # POST /trayectoria
  # POST /trayectoria.json
  def create
    @trayectorium = Trayectorium.new(trayectorium_params)

    respond_to do |format|
      if @trayectorium.save
        format.html { redirect_to edit_trayectorium_path(@trayectorium.id), notice: 'Trayectorium was successfully created.' }
        format.json { render :show, status: :created, location: @trayectorium }
      else
        format.html { render :new }
        format.json { render json: @trayectorium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trayectoria/1
  # PATCH/PUT /trayectoria/1.json
  def update
    respond_to do |format|
      if @trayectorium.update(trayectorium_params)
        format.html { redirect_to @trayectorium, notice: 'Trayectorium was successfully updated.' }
        format.json { render :show, status: :ok, location: @trayectorium }
      else
        format.html { render :edit }
        format.json { render json: @trayectorium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trayectoria/1
  # DELETE /trayectoria/1.json
  def destroy
    @trayectorium.destroy
    respond_to do |format|
      format.html { redirect_to trayectoria_url, notice: 'Trayectorium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trayectorium
      @trayectorium = Trayectorium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trayectorium_params
      params.require(:trayectorium).permit(:nombre)
    end
end
