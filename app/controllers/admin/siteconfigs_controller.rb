class Admin::SiteconfigsController < Admin::BaseController

  before_action :alldata
  before_action :set_siteconfig, only: [:show, :edit, :update, :destroy]

  # GET /siteconfigs
  # GET /siteconfigs.json
  def index
    @siteconfigs = Siteconfig.all
  end

  # GET /siteconfigs/1
  # GET /siteconfigs/1.json
  def show
  end

  # GET /siteconfigs/new
  def new
    @siteconfig = Siteconfig.new
  end

  # GET /siteconfigs/1/edit
  def edit
  end

  # POST /siteconfigs
  # POST /siteconfigs.json
  def create
    @siteconfig = Siteconfig.new(siteconfig_params)

    respond_to do |format|
      if @siteconfig.save
        format.html { redirect_to [:admin, @siteconfig], notice: 'Siteconfig was successfully created.' }
        format.json { render action: 'show', status: :created, location: @siteconfig }
      else
        format.html { render action: 'new' }
        format.json { render json: @siteconfig.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /siteconfigs/1
  # PATCH/PUT /siteconfigs/1.json
  def update
    respond_to do |format|
      if @siteconfig.update(siteconfig_params)
        format.html { redirect_to [:admin, @siteconfig], notice: 'Siteconfig was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @siteconfig.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /siteconfigs/1
  # DELETE /siteconfigs/1.json
  def destroy
    @siteconfig.destroy
    respond_to do |format|
      format.html { redirect_to admin_siteconfigs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_siteconfig
      @siteconfig = Siteconfig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def siteconfig_params
      params.require(:siteconfig).permit(:name, :value)
    end

    def alldata
      @current_page = {model: Siteconfig, title: 'Конфигурация сайта', 
        comment: 'Список параметров сайта, таких как название, заголовок. описание, телефоны и пр...'}
    end
    # Use callbacks to share common setup or constraints between actions.

end
