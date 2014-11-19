class Admin::TagsController < Admin::BaseController
# Тэги наследуем от BaseController

  
  before_action :alldata
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /admin/tags
  # GET /admin/tags.json
  def index
    @tags = Tag.all
  end

  # GET /admin/tags/1
  # GET /admin/tags/1.json
  def show
  end

  # GET /admin/tags/new
  def new
    @tag = Tag.new
  end

  # GET /admin/tags/1/edit
  def edit
  end

  # POST /admin/tags
  # POST /admin/tags.json
  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to [:admin, @tag], notice: 'Tag was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tag }
      else
        format.html { render action: 'new' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/tags/1
  # PATCH/PUT /admin/tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to [:admin, @tag], notice: 'Tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/tags/1
  # DELETE /admin/tags/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to admin_tags_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def alldata
      @current_page = {model: Tag, title: 'Справочник: Тэги', comment: ''}
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      
      params.require(:tag).permit(:name)
    end
end
