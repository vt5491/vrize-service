class ExampleLiftReqsController < ApplicationController
  before_action :set_example_lift_req, only: [:show, :edit, :update, :destroy]

  # before_action to_pt(@example_lift_req.updated_at)

  # def to_pt(time)
  #   pt = Time.parse(@example_lift_req.updated_at)
  #   pt.in_time_zone("Pacific Time (US & Canada)")
  #   @example_lift_req.updated_at_pt = pt
  # end

  # around_action :user_time_zone, :if => :current_user
  # def user_time_zone(&block)
  #   Time.use_zone(current_user.timezone_name, &block)
  # end

  # GET /example_lift_reqs
  # GET /example_lift_reqs.json
  def index
    @example_lift_reqs = ExampleLiftReq.all
  end

  # GET /example_lift_reqs/1
  # GET /example_lift_reqs/1.json
  def show
  end

  # GET /example_lift_reqs/new
  def new
    @example_lift_req = ExampleLiftReq.new
  end

  # GET /example_lift_reqs/1/edit
  def edit
  end

  # POST /example_lift_reqs
  # POST /example_lift_reqs.json
  def create
    @example_lift_req = ExampleLiftReq.new(example_lift_req_params)

    respond_to do |format|
      if @example_lift_req.save
        format.html { redirect_to @example_lift_req, notice: 'Example lift req was successfully created.' }
        format.json { render :show, status: :created, location: @example_lift_req }
      else
        format.html { render :new }
        format.json { render json: @example_lift_req.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /example_lift_reqs/1
  # PATCH/PUT /example_lift_reqs/1.json
  def update
    respond_to do |format|
      if @example_lift_req.update(example_lift_req_params)
        format.html { redirect_to @example_lift_req, notice: 'Example lift req was successfully updated.' }
        format.json { render :show, status: :ok, location: @example_lift_req }
      else
        format.html { render :edit }
        format.json { render json: @example_lift_req.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /example_lift_reqs/1
  # DELETE /example_lift_reqs/1.json
  def destroy
    @example_lift_req.destroy
    respond_to do |format|
      format.html { redirect_to example_lift_reqs_url, notice: 'Example lift req was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_example_lift_req
      @example_lift_req = ExampleLiftReq.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def example_lift_req_params
      params.require(:example_lift_req).permit(:examples_id)
    end
end
