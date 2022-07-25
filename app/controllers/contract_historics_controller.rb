class ContractHistoricsController < ApplicationController
  before_action :set_contract_historic, only: %i[ show edit update destroy ]

  # GET /contract_historics or /contract_historics.json
  def index
    @contract_historics = ContractHistoric.all
  end

  # GET /contract_historics/1 or /contract_historics/1.json
  def show
  end

  # GET /contract_historics/new
  def new
    @contract_historic = ContractHistoric.new
  end

  # GET /contract_historics/1/edit
  def edit
  end

  # POST /contract_historics or /contract_historics.json
  def create
    @contract_historic = ContractHistoric.new(contract_historic_params)

    respond_to do |format|
      if @contract_historic.save
        format.html { redirect_to contract_historic_url(@contract_historic), notice: "Contract historic was successfully created." }
        format.json { render :show, status: :created, location: @contract_historic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contract_historic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contract_historics/1 or /contract_historics/1.json
  def update
    respond_to do |format|
      if @contract_historic.update(contract_historic_params)
        format.html { redirect_to contract_historic_url(@contract_historic), notice: "Contract historic was successfully updated." }
        format.json { render :show, status: :ok, location: @contract_historic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contract_historic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contract_historics/1 or /contract_historics/1.json
  def destroy
    @contract_historic.destroy

    respond_to do |format|
      format.html { redirect_to contract_historics_url, notice: "Contract historic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract_historic
      @contract_historic = ContractHistoric.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contract_historic_params
      params.require(:contract_historic).permit(:value, :num_portion, :status, :open_date, :contract_id)
    end
end
