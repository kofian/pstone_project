class AccountsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @user = current_user
    @accounts = @user.accounts

      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts }
    end
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
    @customer = current_user.customer
    @account = @customer.account.build(:customer_id => @customer.id,
                                      :acct_type_id => nil,
                                      :id => SecureRandom.random_number(999999999999),
                                      :balance => 0.00,
                                      :date_opened => Date.today)

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
    # @account = Account.new(account_params)
    @customer = current_user.customer
    @account = @customer.accounts.build(:customer_id => @customer.id,
                                      :acct_type_id => 1,
                                      :id => SecureRandom.random_number(999999999999),
                                      :balance => 0.00,
                                      :date_opened => Date.today)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
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
      params[:account]
    end
end
