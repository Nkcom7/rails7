class CostsManagementsController < ApplicationController
  before_action :set_costs_management, only: %i[ show edit update destroy ]

  # GET /costs_managements or /costs_managements.json
  def index
    @costs = Cost.all.order(date: :desc)
    # raise
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
    if @costs_management.save
      register_xlsx
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

  def change_graph
    if params[:graph_type] === "day"
      costs = Cost.all.order(date: :desc)
    elsif params[:graph_type] === "week"
      costs = Cost.all.order(date: :desc).select { |m| m.date.wday === 1 }
    end
    render turbo_stream: turbo_stream.replace(
      'graph',
      partial: 'costs_managements/graph',
      locals: { 
        costs: costs,
        graph_type: params[:graph_type] === "day" ? "day" : "week"
      }, content_type: "text/vnd.turbo-stream.html"
    )
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_costs_management
      @costs_management = CostsManagement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def costs_management_params
      params.require(:costs_management).permit(:cost_file)
    end

    def register_xlsx
      @xlsx_data = Roo::Excelx.new("./public/uploads/costs_management/cost_file/#{@costs_management.id}/#{@costs_management[:cost_file]}").sheet(0)
      # costsのデータを保存、それに紐づくcosts_detailのデータも保存をカラムごとに試みる。だが、costsデータを保存後に保存したcost_idの取得が困難。
      2.upto(@xlsx_data.last_row) do |row|
        # costs用のデータ
        cost_row_data = {}
        cost_detail_row_data = {}
        1.upto(@xlsx_data.last_column) do |column|
          if @xlsx_data.first[column - 1] === "date" && Cost.exists?(date: @xlsx_data.cell(row, column)) === false # xlsxのカラムのデータが"date"だった場合
            # dateのデータを保存/dateのデータをcost_dateに格納
            cost_row_data.merge!({ "#{@xlsx_data.first[column - 1]}" => "#{@xlsx_data.cell(row, column)}"})
            @cost_date = @xlsx_data.cell(row, column)
            cost_row_data.merge!({ "costs_management_id" => "#{@costs_management.id}" })
            Cost.new(cost_row_data).save!
          elsif @xlsx_data.first[column - 1] === "name" || @xlsx_data.first[column - 1] === "price" || @xlsx_data.first[column - 1] === "remark" # "date"以外のデータをオブジェクトへ格納
            cost_detail_row_data.merge!({ "#{@xlsx_data.first[column - 1]}" => "#{@xlsx_data.cell(row, column)}"})
          end
        end
        # associateで紐づくcost_idを対象のオブジェクトに格納
        cost_detail_row_data.merge!({ "cost_id" => "#{Cost.find_by(date: @cost_date).id}" })
        CostDetail.new(cost_detail_row_data).save!
      end
    end
end
