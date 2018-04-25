require 'active_record'

class StatsController < ApplicationController
  before_action :set_stat, only: [:show, :edit, :update, :destroy]

  # this is needed.  If not there, get a http 422
  allow_cors :put
  # GET /stats
  # GET /stats.json
  def index
    # p "StatsController.index: params=#{params.inspect}"
    # p "params['example_id']=#{params['example_id']}, params[:example_id]=#{params[:example_id]}"
    if (params[:example_id])
      @stats = Stat.where("example_id=?", params[:example_id])
    else
      @stats = Stat.all
    end

    respond_to do |format|
      format.html {}
      format.json {render :json => @stats }
    end

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
      # @stat.update(stat_params) # no work

      # p "StatsController.update my_params=#{my_params}"
      # @stat.update(my_params)
      # Stat.update(my_params)
      # p "StatsController.update: params[:stat]=#{params[:stat]}"
      # @stat.update(params[:stat])
      if @stat.update(stat_params)
        # format.html {p "html-processing"; return "abc-html"}
        format.html { redirect_to @stat, notice: 'Stat was successfully updated.' }
        # format.json {p "json-processing"; return "abc-json"}
        format.json { render :show, status: :ok, location: @stat }
      else
        format.html { render :edit }
        # p "StatsController: error in update"
        format.json { render json: @stat.errors, status: :unprocessable_entity }
      end
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

  def increment
    p "now in increment"
    p "StatsController.increment params=#{params.inspect}"
    # p "increment: parms[likes]=#{params['likes']}"
    p "increment: @stat=#{@stat.inspect}"
    # p "@stat[:impressions]=#{@stat[0]}"
    inc_params = ActionController::Parameters.new

    @stat = Stat.find_or_initialize_by(:example_id => params[:example_id])

    # inc_params[:likes] = 4
    params.each do |col|
      # byebug
      if col.in?(%w(likes impressions clicks code_views))
        # next if col == ('id') || col == 'stat'
        p "col=#{col}, col.to_sym=#{col.to_sym}"
        # p "@stat[:impressions]=#{@stat[:impressions]}"
        p "@stat[metric]=#{@stat[col.to_sym]}"
        inc_params[col.to_sym] = @stat[col.to_sym] + 1
      end
    end
    p "inc_params=#{inc_params.inspect}"

    respond_to do |format|
  #     Student.
  # find_or_initialize_by(:user_id => current_user.id).
  # update_attributes!(:department => 1)
        # .update_attributes!(:department => 1)
      if @stat.update(inc_params.permit(:likes, :impressions, :clicks, :code_views))
        format.html { redirect_to @stat, notice: 'Stat was successfully updated.' }
        format.json { render :show, status: :ok, location: @stat }
      else
        format.html { render :edit }
        format.json { render json: @stat.errors, status: :unprocessable_entity }
      end
    end
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
      # @stat = Stat.find(params[:id])
      if (params[:example_id])
        @stat = Stat.where("example_id=?", params[:example_id]).first
      else
        @stat = Stat.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stat_params
      params.require(:stat).permit(:example_id, :likes, :avg_rating, :impressions, :clicks, :code_views)
      # params.fetch(:stat, {}).permit(:example_id, :likes, :avg_rating, :impressions, :clicks, :code_views)
      # params.require(:example).permit(:name, :category, :keyword_1, :keyword_2, :lifted
      # params.permit(:name, :category)
      # params.permit(:id, :example_id, :likes, :avg_rating, :impressions, :clicks, :code_views)
    end
end
