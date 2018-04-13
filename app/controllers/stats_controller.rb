require 'active_record'

class StatsController < ApplicationController
  before_action :set_stat, only: [:show, :edit, :update, :destroy]

  # this is needed.  If not there, get a http 422
  allow_cors :put
  # GET /stats
  # GET /stats.json
  def index
    @stats = Stat.all
  end

  # GET /stats/1
  # GET /stats/1.json
  def show
    p "StatsController.show: entered"
    # @stat = Stat.where("id=(?)", params[:id])
    # @stat = Stat.find(params[:id])
    # @stat = Stat.where("id=1")
    # p "stat=#{@stat.inspect}"
    # p "stat.id=#{@stat.id}"
  end

  # GET /examples/new
  def new
    p "index: params=#{params}"
    @stat = Stat.new
  end

  # GET /stats/1/edit
  def edit
  end

  # POST /stats
  # POST /stats.json
  def create
    p "StatsController.create entered"
    createOrUpdate()
  end

  # PATCH/PUT /examples/1
  # PATCH/PUT /examples/1.json
  def update
    p "StatsController.update @stat=#{@stat.inspect}"
    p "StatsController.update params=#{params.inspect}"
    p "StatsController.update request.body.read=#{request.body.read.inspect}"
    p "StatsController.update stat_params=#{stat_params.inspect}"
    # p "StatsController.update request.envt=#{Rails.logger.info(request.env)}"

    respond_to do |format|
      # @stat.update(stat_params)
      # @stat.update(params.id, {:likes => 3})
      # Stat.update(params['id'], {:likes => 4}) # work
      # @stat.update({:likes => 3}) # work
      # @stat.update({ request.body.read}) # no work
      # @stat.update(stat_params) # no work
      # following works if you send the body with 'application/json' but
      # do *not* jsonify it yourself on the client.
      # my_params = JSON.parse(request.body.read)
      @stat.update(stat_params) # no work

      p "StatsController.update my_params=#{my_params}"
      @stat.update(my_params)
      # if @stat.update(stat_params)
      #   format.html {p "html-processing"; return "abc-html"}
      #   format.json {p "json-processing"; return "abc-json"}
      # else
      #   p "StatsController: error in update"
      # end
    # tmp_params = {params.id, request.body.read}
    end
      # if @stat.update(stat_params)
      # # if @stat.update(params.id, request.body.read)
      #   format.html { redirect_to @stat, notice: 'Stat was successfully updated.' }
      #   format.json { render :show, status: :ok, location: @stat }
      # else
      #   format.html { render :edit }
      #   format.json { render json: @example.errors, status: :unprocessable_entity }
      # end
    # end
  end

  # Since the client won't necessarily know if the stat record already exists,
  # we just make the client do POST requests and the server distinguishes between
  # a create or update.
  # def createOrUpdate
  #   p "StatsController.createOrUpdate entered"
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stat
      @stat = Stat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stat_params
      # params.require(:stat).permit(:example_id, :likes, :avg_rating, :impressions, :clicks, :code_views)
      # params.fetch(:stat, {}).permit(:example_id, :likes, :avg_rating, :impressions, :clicks, :code_views)
      # params.require(:example).permit(:name, :category, :keyword_1, :keyword_2, :lifted
      # params.permit(:name, :category)
      params.permit(:id, :example_id, :likes, :avg_rating, :impressions, :clicks, :code_views)
    end
end
