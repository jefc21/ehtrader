class ContractsController < ApplicationController
  before_action :set_contract, only: %i[ show edit update destroy ]

  # GET /contracts or /contracts.json
  def index
    @contracts = Contract.all
  end

  # GET /contracts/1 or /contracts/1.json
  def show
  end

  # GET /contracts/new
  def new
    @contract = Contract.new
  end

  # GET /contracts/1/edit
  def edit
  end

  # POST /contracts or /contracts.json
  def create
    respond_to do |format|
      unless params["user_id"].present?
        @user = User.new(email:params[:email], password: params[:password], password_confirmation: params[:password])
        @user.save
        if @user.user_role.nil?
          @investor = @user.build_user_role(role_id: Role.find_by(name:"Investor").id)
          unless @investor.save
            respond_create(format)
          end
        end
      else
        @user = User.find_by(id:params["user_id"])
      end
      unless ((@user.id.nil?)||(@user.user_role.nil?))
        #@investor = @user.build_user_role(role_id: Role.find_by(name:"Investor").id)
        #if @investor.save
          @contract = @user.contract.build(contract_params)
          if @contract.save
            @contract_historic = @contract.contract_historic.build(value:params[:value], num_portion:params[:num_portion], status:true, open_date:params[:open_date])
            if @contract_historic.save
              (1..@contract_historic.num_portion).each do |i|
                @portions=@contract_historic.portion.build(number:i, value:(@contract_historic.value/10), status:false, proof:nil)
                if i == @contract_historic.num_portion
                  if @portions.save
                   format.html { redirect_to user_list_path, notice: "Contract was successfully created." }
                    #format.json { render :show, status: :created, location: @contract }
                  end
                elsif !@portions.save
                  respond_create(format)
                  break
                end
              end
            else
              respond_create(format)
            end
          else
            respond_create(format)
          end
        #end
      else
        respond_create(format)
        #format.html { render :new, status: :unprocessable_entity }
        #format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contracts/1 or /contracts/1.json
  def update
    respond_to do |format|
      if @contract.update(contract_params)
        format.html { redirect_to contract_url(@contract), notice: "Contract was successfully updated." }
        format.json { render :show, status: :ok, location: @contract }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1 or /contracts/1.json
  def destroy
    if @contract.user.contract.size > 1
      @contract.destroy
    else
      @contract.user.destroy
    end

    respond_to do |format|
      format.html { redirect_to user_list_path, notice: "Contract was successfully destroyed." }
      #format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract
      @contract = Contract.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contract_params
      params.require(:contract).permit(:contract_doc, :number, :user_id)
    end

    def respond_create(format)
      if params["user_id"].present?
        @contract.destroy()
      else
        @user.destroy()
      end
      format.html { redirect_to user_list_path, notice: "contract creation failed." }
      #format.json { render json: @contract.errors, status: :unprocessable_entity }
    end
end
