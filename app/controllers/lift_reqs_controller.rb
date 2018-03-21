class LiftReqsController < ApplicationController
  before_action :set_lift_req, only: [:show, :edit, :update, :destroy]

  # GET /lift_reqs
  # GET /lift_reqs.json
  def index
    @lift_reqs = LiftReq.all
    p "index: lift_reqs[0]=#{@lift_reqs[0].example.name}"
    # @lift_reqs[0].id = "hi"
    # @lift_reqs[0].id = 17
    # json = @lift_reqs[0].as_json
    # json[0]['abc'] = true
    # json['abc'] = 'hi'
    # render json: json
    @lift_reqs.each do |lr|
      # lr['example'] = 'hi'
      # lr.example.name = 'hi'
      lr.id = lr.id + 1
    end
  end

  # GET /lift_reqs/1
  # GET /lift_reqs/1.json
  def show
  end

  # GET /lift_reqs/new
  def new
    @lift_req = LiftReq.new
  end

  # GET /lift_reqs/1/edit
  def edit
  end

  # POST /lift_reqs
  # POST /lift_reqs.json
  def create
    @lift_req = LiftReq.new(lift_req_params)

    respond_to do |format|
      if @lift_req.save
        format.html { redirect_to @lift_req, notice: 'Lift req was successfully created.' }
        format.json { render :show, status: :created, location: @lift_req }
      else
        format.html { render :new }
        format.json { render json: @lift_req.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lift_reqs/1
  # PATCH/PUT /lift_reqs/1.json
  def update
    respond_to do |format|
      if @lift_req.update(lift_req_params)
        format.html { redirect_to @lift_req, notice: 'Lift req was successfully updated.' }
        format.json { render :show, status: :ok, location: @lift_req }
      else
        format.html { render :edit }
        format.json { render json: @lift_req.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lift_reqs/1
  # DELETE /lift_reqs/1.json
  def destroy
    @lift_req.destroy
    respond_to do |format|
      format.html { redirect_to lift_reqs_url, notice: 'Lift req was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lift_req
      @lift_req = LiftReq.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lift_req_params
      params.require(:lift_req).permit(:example_id)
    end
end
