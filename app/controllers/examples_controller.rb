class ExamplesController < ApplicationController
  before_action :set_example, only: [:show, :edit, :update, :destroy]

  # GET /examples
  # GET /examples.json
  def index
    p "index: params=#{params}"
    @examples = Example.all
    # @examples = if params[:name]
    #   Example.where('name LIKE ?', "%#{params[:name]}%")
    # else
    #   Example.all
    # end
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_example
      @example = Example.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def example_params
      # params.require(:example).permit(:name, :path)
      # params.require(:example).permit(:name, :category)
      params.permit(:name, :category)
    end
end
