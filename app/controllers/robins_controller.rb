class RobinsController < ApplicationController
  before_action :set_robin, only: [:show, :edit, :update, :destroy]

  # GET /robins
  # GET /robins.json
  def index
    @robins = Robin.all
  end

  # GET /robins/1
  # GET /robins/1.json
  def show
  end

  # GET /robins/new
  def new
    @robin = Robin.new
  end

  # GET /robins/1/edit
  def edit
  end

  # POST /robins
  # POST /robins.json
  def create
    @robin = Robin.new(robin_params)

    respond_to do |format|
      if @robin.save
        format.html { redirect_to @robin, notice: 'Robin was successfully created.' }
        format.json { render :show, status: :created, location: @robin }
      else
        format.html { render :new }
        format.json { render json: @robin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /robins/1
  # PATCH/PUT /robins/1.json
  def update
    respond_to do |format|
      if @robin.update(robin_params)
        format.html { redirect_to @robin, notice: 'Robin was successfully updated.' }
        format.json { render :show, status: :ok, location: @robin }
      else
        format.html { render :edit }
        format.json { render json: @robin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /robins/1
  # DELETE /robins/1.json
  def destroy
    @robin.destroy
    respond_to do |format|
      format.html { redirect_to robins_url, notice: 'Robin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_robin
      @robin = Robin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def robin_params
      params.require(:robin).permit(:title, :content)
    end
end
