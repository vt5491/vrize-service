require 'active_record'

class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /stats
  # GET /stats.json
  def index #   p "TagsController.index: params=#{params.inspect}"
    # p "params['example_id']=#{params['example_id']}, params[:example_id]=#{params[:example_id]}"
    if (params[:example_id])
      @tags = Tag.where("example_id=?", params[:example_id])
    else
      @tags = Tag.all
    end

    p "@tags=#{@tags.inspect}"

    respond_to do |format|
      format.html {}
      format.json {render :json => @tags }
    end
  end

  # def index
  # end

  # GET /tags/1
  # GET /tags/1.json
  def show
    p "TagsController.show: entered"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      # @stat = Stat.find(params[:id])
      if (params[:example_id])
        @tag = Tag.where("example_id=?", params[:example_id]).first
      else
        @tag = Tag.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag
      params.require(:tag).permit(:example_id, :tag)
    end
end
