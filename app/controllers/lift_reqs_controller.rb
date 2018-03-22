class LiftReqsController < ApplicationController
  before_action :set_lift_req, only: [:show, :edit, :update, :destroy]

  # GET /lift_reqs
  # GET /lift_reqs.json
  def index
    # @lift_reqs = LiftReq.all
    # @lift_reqs = LiftReq.all.select('lift_reqs.*, NULL as name, "bye" as def')
    # return 'lift_req' plus all the info from a joined 'examples'
    @lift_reqs = LiftReq.all.select('lift_reqs.*, NULL as example')
    # @lift_reqs = LiftReq.all.select('lift_reqs.*, examples.* ')
    # p "index: lift_reqs[0]=#{@lift_reqs[0].example.name}"
    # @lift_reqs[0].id = "hi"
    # @lift_reqs[0].abc = "hi"
    # p "index: lift_reqs[0].abc=#{@lift_reqs[0].abc}"
    # @lift_reqs[0].id = 17
    # json = @lift_reqs[0].as_json
    # json[0]['abc'] = true
    # json['abc'] = 'hi'
    # render json: json
    # lift_reqs_xtra has some additional fields from examples added
    # @lift_reqs_xtra = []
    # @lift_reqs.each do |lr|
    #   # lr['example'] = 'hi'
    #   # lr.example.name = 'hi'
    #   # lr.id = lr.id + 1
    #   # lr.abc = "hello"
    #   lr[:example] = {}
    #   lr[:example][:name] = lr.example.name
    #   # @lift_reqs_tmp << {lr => lr, :xyz => "xy"}
    #   @lift_reqs_xtra << lr
    # end
    # p "index: lift_reqs[0].abc pt2=#{@lift_reqs[0].abc}"
    # @lift_reqs.each do |lr|
    #   lr.xyz = "gum"
    #   @lift_reqs_tmp << lr
    #   # @lift_reqs_tmp << {:lr => lr, :newatt => 'added string'}
    # end
    # @lift_reqs
    # render json: {lift_reqs: @lift_reqs, example: {}finished: finished, unfinished: unfinished}
    # p "respon_to=#{respond_to}"
    respond_to do |format|
      # format.html {render html: @lift_reqs}
      # format.html { @lift_reqs}
      # format.html { render @lift_reqs }
      format.html
      format.json {render json: @lift_reqs}
    end
    # render json: @lift_reqs_xtra
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
