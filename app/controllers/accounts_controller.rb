class AccountsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @user = current_user
    @accounts = @user.accounts
  end

  def adminview
    @accounts = Account.all

    respond_to do |format|
      format.html # adminview.html.erb
      format.json { render json: @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    # @user = User.find(params[:user_id])
    @account = Account.new
    @account.id = SecureRandom.random_number(999999999999)
    @account.customer_id = current_user.customer.id
    @account.balance = 0
    @account.date_opened = Time.now.to_date

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account }
    end
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)
    @account.id = SecureRandom.random_number(999999999999)
    @account.customer_id = current_user.customer.id
    @account.balance = 0
    @account.date_opened = Time.now.to_date

    respond_to do |format|
      if @account.save
        if current_user.accounts.count > 1
          format.html { redirect_to accounts_path(current_user), notice: 'CONGRATULATIONS, your new account was successfully created!' }
          format.json { render :show, status: :created, location: @account }
        else
        format.html { redirect_to new_user_addresses_path(current_user), notice: 'Great! Just one more step..' }
        format.json { render :show, status: :created, location: @account }
        end
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:acct_type_id)
    end
end
