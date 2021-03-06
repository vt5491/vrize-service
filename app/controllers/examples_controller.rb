require 'active_record'

class ExamplesController < ApplicationController
  before_action :set_example, only: [:show, :edit, :update, :destroy]
  #vt add
  # allow_cors :index, :other_methods
  allow_cors :all_lifted
  #vt end

  # GET /examples
  # GET /examples.json
  def index
    p "index: params=#{params}"
    # @examples = Example.all
    # @examples = if params[:name]
    #   Example.where('name LIKE ?', "%#{params[:name]}%")
    # else
    #   Example.all
    # end
    # query = Project.order(:name)
    query = Example
    query = Example.where("name LIKE (?)", "%#{params[:name]}%") if params[:name].present?
    query = query.where("category = (?)", params[:category]) if params[:category].present? && params[:category] != "any"
    # query = query.where("lifted = (?)", (params[:lifted] == 'true' ? 1 : 0)) if params[:lifted].present? && params[:lifted] != "any"
    query = query.where("lift_code >= (?)", (params[:lifted] == 'true' ? 1 : 0)) if params[:lifted].present? && params[:lifted] != "any"
    query = query.where("name in (?)", params[:fns]) if params[:fns].present?

    @examples = if query.class.to_s == "Example::ActiveRecord_Relation"
      query
    else
      Example.all

    end

  end

  # GET /examples/1
  # GET /examples/1.json
  def show
    p "ExamplesController.get params=#{params.inspect}"
    # p "ExamplesController.update example_params=#{example_params.inspect}"
  end

  # GET /examples/new
  def new
    @example = Example.new
  end

  # GET /examples/1/edit
  def edit
  end

  # POST /examples
  # POST /examples.json
  def create
    @example = Example.new(example_params)

    respond_to do |format|
      if @example.save
        format.html { redirect_to @example, notice: 'Example was successfully created.' }
        format.json { render :show, status: :created, location: @example }
      else
        format.html { render :new }
        format.json { render json: @example.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /examples/1
  # PATCH/PUT /examples/1.json
  def update
    respond_to do |format|
      # example_params = {"lifted"=>"1"}
      # p "vt.Patch.update: Time.now=#{Time.now}"
      # example_params['lifted_at'] = Time.now
      # example_params = {:def => 8}
      # example_params = {:lift_code => 8}
      # example_params['lifted_at'] = 'hi'
      # example_params['lift_code'] = 6
      # example_params["abc"] = "bye"
      # example_params["abc"] = "bye"
      p "vt.Patch.update: example_params=#{example_params}"
      # p "vt.Patch.update: example_params[:lifted]=#{example_params[:lifted]}"
      # p "vt.Patch.update: example_params[:lifted_at]=#{example_params[:lifted_at]}"
      # p "vt.Patch.update: example_params[:abc]=#{example_params[:abc]}"
      # @example.reload
      # By touching the record we force udpates even if the value is unchanged.
      # We need this because we have triggers on some fields e.g 'lifted'
      # that causes 'lifted_at' to get updated.  We want 're-lifts' to force
      # 'lifted_at' to get updated, so we need "redundant" updates to actually
      # be performed. Probably not a good idea on a high-performance db, but
      # hopefully not too big a deal on this small db.
      # @example.touch
      if @example.update(example_params)
      # if @example.update(lift_code: 18, lift_score: 20)
        format.html { redirect_to @example, notice: 'Example was successfully updated.' }
        format.json { render :show, status: :ok, location: @example }
      else
        format.html { render :edit }
        format.json { render json: @example.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /examples/1
  # DELETE /examples/1.json
  def destroy
    @example.destroy
    respond_to do |format|
      format.html { redirect_to examples_url, notice: 'Example was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # add some additional rest resources
  def search
    p "search.params=#{params.inspect}"
    # p "params[:in]=#{params[:in]}, params['in']=#{params['in']}"
    # query=nil

    if (params[:col])
      if( params[:in])
        # query = Example.where("? IN (?)", params[:col], params[:in])
        # @examples = Example.find_all_by_id(params[:in])
        # p "now doing where"
        # @examples = Example.where(:id => params[:in])
        @examples = Example.where( params[:col].to_sym => params[:in])
        # @examples = Example.where(:id => JSON.parse(params[:in]))
      elsif (params[:eq])
        @examples = Example.where( params[:col].to_sym => params[:eq])
      end

    end
    # p "query=#{query}"
    # @examples = query.to_a
    p "example.length=#{@examples.length}"
    respond_to do |format|
      format.html { puts "hi from search"}
      # format.json { head :no_content }
      format.json {@examples}
    end
  end

  # Search for examples by tag.  We could attempt to extend 'search' to handle
  # this case, but since the tags are a separate table (but really an auxillary
  # table to to the examples table and thus why we handle it here and not in the
  # tags controller) we'll do it as a separate query.
  def by_tag
    p "ExamplesController.by_tag: entered, tag=#{params[:tag]}"
    # Note: we simply tack on the tag as a virtual column for consistency's sake
    @examples = Example.joins(:tags)
      .where('tags.tag' => params[:tag])
      .select("*,'#{params[:tag]}' as tag")
    respond_to do |format|
      format.html { puts "hi from by_tag"}
      # format.json { head :no_content }
      format.json {@examples}
      # format.json {@results}
    end
  end
  # def import
  #   @example = Example.new
  #   respond_to do |format|
  #     format.html { puts "hi from format"}
  #     # format.json { head :no_content }
  #   end
  # end
  #
  # def import_results
  #   @example = Example.new
  #   respond_to do |format|
  #     format.html { puts "hi from format"}
  #   end
  # end
  # end additional reset resources
  # add some custom queries for threejsVrGallery
  def all_lifted
    query = Example
    # query = query.where("lifted=1 AND lift_score=100 AND lift_failure_code=-1").sort_by(&:name)
    # query = query.where("lift_code>1 AND lift_score=100").sort_by(&:name)
    # query = query.where("lift_code>1 AND lift_score=100")
    # .select('*, id as example_id')
    # .sort_by(&:name)
    #
    # @examples = query
    # @examples = query.select('*, id as example_id')
    # @examples = Example.where("lift_code>1 AND lift_score=100")
    # .select('*, id as example_id')

    @examples = Example.where("lift_code>1 AND lift_score=100")
    .select('*, id as example_id')
    .sort_by(&:name)

    respond_to do |format|
      # format.html { @examples}
      format.html { puts "hi from format.html"}
      # format.json
      # format.json {@examples.to_json}
      # format.json { @examples}
=begin
      format.json {
        render json: @examples
      }
=end
      # format.json { puts "hi from format.json"}
      # format.json {render :partial => "examples/all_lifted.json" }
      # format.json {render :partial => "examples/all_lifted.json" }
      #vtformat.json {render "examples/all_lifted"}
      format.json {@examples}
      # format.json {:partial => "examples/show.json.jbuilder"}
    end
    # render :json => @projects, :include => tasks
  end

  # end custom queries

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_example
      @example = Example.find(params[:id])
      # @stat = @example.stat
      # @lift_reqs = @example.lift_reqs
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def example_params
      # params.require(:example).permit(:name, :category, :keyword_1, :keyword_2, :lifted, :lifted_at)
      params.require(:example).permit(:name, :category, :keyword_1, :keyword_2, :lift_code)
      # params.require(:example).permit(:name, :category, :keyword_1, :keyword_2, :lifted)
      # params.permit(:name, :category)
      # params.permit(:name, :category, :keyword_1, :keyword_2, :lifted)
    end
end
