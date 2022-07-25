class PortionsController < ApplicationController
  before_action :set_portion, only: %i[ show edit update destroy ]

  # GET /portions or /portions.json
  def index
    @portions = Portion.all
  end

  # GET /portions/1 or /portions/1.json
  def show
  end

  # GET /portions/new
  def new
    @portion = Portion.new
  end

  # GET /portions/1/edit
  def edit
  end

  # POST /portions or /portions.json
  def create
    @portion = Portion.new(portion_params)

    respond_to do |format|
      if @portion.save
        format.html { redirect_to portion_url(@portion), notice: "Portion was successfully created." }
        format.json { render :show, status: :created, location: @portion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @portion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portions/1 or /portions/1.json
  def update
    respond_to do |format|
      if @portion.update(portion_params)
        format.html { redirect_to portion_url(@portion), notice: "Portion was successfully updated." }
        format.json { render :show, status: :ok, location: @portion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @portion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portions/1 or /portions/1.json
  def destroy
    @portion.destroy

    respond_to do |format|
      format.html { redirect_to portions_url, notice: "Portion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portion
      @portion = Portion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def portion_params
      params.require(:portion).permit(:number, :value, :status, :proof, :contract_historic_id)
    end
end
