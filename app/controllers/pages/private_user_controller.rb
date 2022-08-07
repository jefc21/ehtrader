class Pages::PrivateUserController < ApplicationController

  def index
  end

  def contract
    @contract = current_user.contract.find_by(number:params[:id])
    if @contract.nil?
      redirect_to user_home_path
    end
  end

  def income
    @meses = ["JAN","FEV","MAR","ABR","MAI","JUN","JUL","AGO","SET","OUT","NOV","DEZ"]
  end

  def user_management
  end

  def income_new
    @income = Income.new
  end

  def income_create
    @income = Income.new(income_params)

    respond_to do |format|
      if @income.save
        format.html { redirect_to income_url(@income), notice: "Income was successfully created." }
        format.json { render :show, status: :created, location: @income }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  def contract_new
    @contract = Contract.new
  end

  def admin_new
    @admin = User.new
  end

  def admin_create
    #byebug
    @user = User.new(admin_params)
    respond_to do |format|
      if @user.save
        @admin = @user.build_user_role(role_id: Role.find_by(name:"Adm").id)
        if @admin.save
          format.html { redirect_to user_admin_new_path, notice: "admin was successfully created." }
          #format.json { render :show, status: :created, location: @income }
        end
      else
        format.html { redirect_to user_admin_new_path, notice: @user.errors}
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def list_user
    @select=0
  end

  def edit_user
    @user = ContractHistoric.find_by(id:params[:id]).contract.user
  end

  def admin_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def manager_portion_user
    #byebug
    @contract_historic = ContractHistoric.find_by(id:params[:id])
    a=1
    b=2
  end

  def insert_extrato_user
    #byebug
    @portion = ContractHistoric.find_by(id:params[:id]).portion
  end
end