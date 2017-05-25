class PaybacksController < ApplicationController
  before_action :set_payback, only: [:show, :edit, :update, :destroy]

  # GET /paybacks
  # GET /paybacks.json
  def index
    @paybacks = Payback.all
  end

  # GET /paybacks/1
  # GET /paybacks/1.json
  def show
  end

  # GET /paybacks/new
  def new
    @payback = Payback.new
    
  end

  # GET /paybacks/1/edit
  def edit
  end

  # POST /paybacks
  # POST /paybacks.json
  def create
    @payback = Payback.new(payback_params)

    respond_to do |format|
      if @payback.save
        format.html { redirect_to @payback, notice: 'Payback was successfully created.' }
        format.json { render :show, status: :created, location: @payback }
      else
        format.html { render :new }
        format.json { render json: @payback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paybacks/1
  # PATCH/PUT /paybacks/1.json
  def update
    respond_to do |format|
      if @payback.update(payback_params)
        format.html { redirect_to @payback, notice: 'Payback was successfully updated.' }
        format.json { render :show, status: :ok, location: @payback }
      else
        format.html { render :edit }
        format.json { render json: @payback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paybacks/1
  # DELETE /paybacks/1.json
  def destroy
    @payback.destroy
    respond_to do |format|
      format.html { redirect_to paybacks_url, notice: 'Payback was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payback
      @payback = Payback.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payback_params
      params.require(:payback).permit(:payment_id, :date)
    end
end
