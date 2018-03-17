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
    query = query.where("lifted = (?)", (params[:lifted] == 'true' ? 1 : 0)) if params[:lifted].present? && params[:lifted] != "any"
    query = query.where("name in (?)", params[:fns]) if params[:fns].present?

    @examples = if query.class.to_s == "Example::ActiveRecord_Relation"
      query
    else
      Example.all
=begin
    p "params[:name]=#{params[:name]}"

    cat_q = nil
    if params[:category] && params[:category] != 'any'
      # cat_q = 'category = ?', "%#{params[:category]}%"
      # cat_q = "category = #{params[:category]}"
      # cat_q = sanitize_sql_array(["category=?", params[:category]])
      clean_category = ActionController::Base.helpers.sanitize(params[:category])
      cat_q = "category = '#{clean_category}'"
    end

    name_q = nil
    if params[:name]
      # name_q += 'category = ?', "%#{params[:category]}%"
      # name_q = "name LIKE #{params[:name]}"
      # name_q = "name LIKE " +  params[:name]
      # name_q = ActiveRecord::Sanitizaion::sanitize_sql_array(["name LIKE ?", params[:name]])
      # name_q = ActionController::Base.helpers.sanitize([ "name LIKE ?", params[:name] ])
      clean_name = ActionController::Base.helpers.sanitize(params[:name])
      name_q = "name LIKE '%#{clean_name}%'"
    end

    q = nil
    if cat_q && name_q
      q = name_q + " AND " + cat_q
    elsif cat_q
      q = cat_q
    elsif name_q
      q = name_q
    end

    p "q=#{q}"

    @examples = if q
      Example.where(q)
    else
      Example.all
=end
    end

  end

  # GET /examples/1
  # GET /examples/1.json
  def show
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
      # example_params['lifted_at'] = 'hi'
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
      @example.touch
      if @example.update(example_params)
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
    respond_to do |format|
      format.html { puts "hi from search"}
      # format.json { head :no_content }
    end
  end

  def import
    @example = Example.new
    respond_to do |format|
      format.html { puts "hi from format"}
      # format.json { head :no_content }
    end
  end

  def import_results
    @example = Example.new
    respond_to do |format|
      format.html { puts "hi from format"}
    end

  end
  # end additional reset resources
  # add some custom queries for threejsVrGallery
  def all_lifted
    query = Example
    query = query.where("lifted=1")

    @examples = query
    respond_to do |format|
      # format.html { @examples}
      format.html { puts "hi from format.html"}
      # format.json
      # format.json {@examples.to_json}
      # format.json { @examples}
      format.json {
        render json: @examples
      }
      # format.json { puts "hi from format.json"}
      # format.json render :partial => "examples/show.json"
      # format.json {:partial => "examples/show.json.jbuilder"}
    end
    # render :json => @projects, :include => tasks
  end

  # end custom queries

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_example
      @example = Example.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def example_params
      params.require(:example).permit(:name, :category, :keyword_1, :keyword_2, :lifted, :lifted_at)
      # params.require(:example).permit(:name, :category, :keyword_1, :keyword_2, :lifted)
      # params.permit(:name, :category)
      # params.permit(:name, :category, :keyword_1, :keyword_2, :lifted)
    end
end
