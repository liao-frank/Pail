class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy, :reduce_add_funds, :create_payback]
  
  def create_payback
    info = {payment_id: @payment.id, date: Date.current}
    payee_id = @payment.payee_id
    payer_id = @payment.payer_id
    reduce_add_funds(payee_id, payer_id)
    Payback.create(info)
    redirect_to payments_path
  end

  def reduce_add_funds(payer_id, payee_id)
    payer = User.find(payer_id)
    payer_funds = payer.funds
    payer.update_attribute(:funds, payer_funds - @payment.amount)
    payee = User.find(payee_id)
    payee_funds = payee.funds
    payee.update_attribute(:funds, payee_funds + @payment.amount)
  end

  # GET /payments
  # GET /payments.json
  def index
    @payer_payments = Payment.for_payer(current_user.id).chronological.all
    @payee_payments = Payment.for_payee(current_user.id).chronological.all
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
    @source = params[:source]
    if @source == "fundraiser"
      @fundraiser = Fundraiser.find(params[:fund_id])
      @payee = User.find(@fundraiser.owner_id)
    end
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(payment_params)
    @payment.date = Date.current
    @payment.payer_id = current_user.id
    respond_to do |format|
      if @payment.save
        format.html { 
          reduce_add_funds(@payment.payer_id, @payment.payee_id)
          if @payment.fundraiser_id.nil?
            redirect_to @payment, notice: 'Payment was successfully created.' 
          else
            event = Fundraiser.find(@payment.fundraiser_id)
            redirect_to fundraiser_path(event), notice: 'Payment was successfully created.' 
          end 
        }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:payee_id, :payer_id, :fundraiser_id, :amount, :message)
    end
end
