class BobansController < ApplicationController
  before_action :set_boban, only: [:show, :edit, :update, :destroy]

  # GET /bobans
  # GET /bobans.json
  def index
    @bobans = Boban.all
  end

  # GET /bobans/1
  # GET /bobans/1.json
  def show
  end

  # GET /bobans/new
  def new
    @boban = Boban.new
  end

  # GET /bobans/1/edit
  def edit
  end

  # POST /bobans
  # POST /bobans.json
  def create
    @boban = Boban.new(boban_params)

    respond_to do |format|
      if @boban.save
        format.html { redirect_to @boban, notice: 'Boban was successfully created.' }
        format.json { render :show, status: :created, location: @boban }
      else
        format.html { render :new }
        format.json { render json: @boban.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bobans/1
  # PATCH/PUT /bobans/1.json
  def update
    respond_to do |format|
      if @boban.update(boban_params)
        format.html { redirect_to @boban, notice: 'Boban was successfully updated.' }
        format.json { render :show, status: :ok, location: @boban }
      else
        format.html { render :edit }
        format.json { render json: @boban.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bobans/1
  # DELETE /bobans/1.json
  def destroy
    @boban.destroy
    respond_to do |format|
      format.html { redirect_to bobans_url, notice: 'Boban was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boban
      @boban = Boban.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boban_params
      params.require(:boban).permit(:title, :content)
    end
end
