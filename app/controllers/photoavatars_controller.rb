class PhotoavatarsController < ApplicationController
  before_action :set_photoavatar, only: [:show, :edit, :update, :destroy]

  # GET /photoavatars
  # GET /photoavatars.json
  def index
    @photoavatars = Photoavatar.all
  end

  # GET /photoavatars/1
  # GET /photoavatars/1.json
  def show
  end

  # GET /photoavatars/new
  def new
    @photoavatar = Photoavatar.new
  end

  # GET /photoavatars/1/edit
  def edit
  end

  # POST /photoavatars
  # POST /photoavatars.json
  def create
    @photoavatar = Photoavatar.new(photoavatar_params)

    respond_to do |format|
      if @photoavatar.save
        format.html { redirect_to @photoavatar, notice: 'Photoavatar was successfully created.' }
        format.json { render :show, status: :created, location: @photoavatar }
      else
        format.html { render :new }
        format.json { render json: @photoavatar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photoavatars/1
  # PATCH/PUT /photoavatars/1.json
  def update
    respond_to do |format|
      if @photoavatar.update(photoavatar_params)
        format.html { redirect_to @photoavatar, notice: 'Photoavatar was successfully updated.' }
        format.json { render :show, status: :ok, location: @photoavatar }
      else
        format.html { render :edit }
        format.json { render json: @photoavatar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photoavatars/1
  # DELETE /photoavatars/1.json
  def destroy
    @photoavatar.destroy
    respond_to do |format|
      format.html { redirect_to photoavatars_url, notice: 'Photoavatar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photoavatar
      @photoavatar = Photoavatar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photoavatar_params
      params.require(:photoavatar).permit(:title, :content)
    end
end
