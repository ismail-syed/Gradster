class ComponentsController < ApplicationController
  before_action :set_component, only: [:show, :edit, :update, :destroy]

  # GET /components
  # GET /components.json
  def index
    @course = Course.find(params[:course_id])
    @components = @course.components.all
  end

  # GET /components/1
  # GET /components/1.json
  def show
  end

  # GET /components/new
  def new
    @course = Course.find(params[:course_id])
    # @component = Component.new
  end

  # GET /components/1/edit
  def edit
    @course = Course.find(params[:course_id])
  end

  # POST /components
  # POST /components.json
  def create
    @course = Course.find(params[:course_id])
    @component = @course.components.new(component_params)

    respond_to do |format|
      if @component.save
        format.html { redirect_to @course, notice: 'Component was successfully created.' }
        format.json { render action: 'show', status: :created, location: @component }
        format.js  # create.js.erb
      else
        format.html { render action: 'new' }
        format.json { render json: @component.errors, status: :unprocessable_entity }
        format.js {render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /components/1
  # PATCH/PUT /components/1.json
  def update
    @course = Course.find(params[:course_id])

    respond_to do |format|
      if @component.update(component_params)
        format.html { redirect_to @course, notice: 'Component was successfully updated.' }
        format.json { head :no_content }
        format.js 
      else
        format.html { render action: 'edit' }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /components/1
  # DELETE /components/1.json
  def destroy
    @course = Course.find(params[:course_id])

    @component.destroy
    respond_to do |format|
      format.html { redirect_to @course }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_component
      @course = Course.find(params[:course_id])
      @component = @course.components.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def component_params
      params.require(:component).permit(:name, :component_weight)
    end
end
