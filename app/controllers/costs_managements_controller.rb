class CostsManagementsController < ApplicationController
  before_action :set_costs_management, only: %i[ show edit update destroy ]

  # GET /costs_managements or /costs_managements.json
  def index
    @costs_managements = CostsManagement.all
  end

  # GET /costs_managements/1 or /costs_managements/1.json
  def show
  end

  # GET /costs_managements/new
  def new
    @costs_management = CostsManagement.new
  end

  # GET /costs_managements/1/edit
  def edit
  end

  # POST /costs_managements or /costs_managements.json
  def create
    @costs_management = CostsManagement.new(costs_management_params)

    respond_to do |format|
      if @costs_management.save
        format.html { redirect_to costs_management_url(@costs_management), notice: "Costs management was successfully created." }
        format.json { render :show, status: :created, location: @costs_management }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @costs_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /costs_managements/1 or /costs_managements/1.json
  def update
    respond_to do |format|
      if @costs_management.update(costs_management_params)
        format.html { redirect_to costs_management_url(@costs_management), notice: "Costs management was successfully updated." }
        format.json { render :show, status: :ok, location: @costs_management }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @costs_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /costs_managements/1 or /costs_managements/1.json
  def destroy
    @costs_management.destroy

    respond_to do |format|
      format.html { redirect_to costs_managements_url, notice: "Costs management was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_costs_management
      @costs_management = CostsManagement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def costs_management_params
      params.fetch(:costs_management, {})
    end
end
