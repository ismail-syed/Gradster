class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]

  def new
 	@course = Course.find(params[:course_id])
  @evaluation = Evaluation.new
  @evaluation.component = Component.find(params[:component_id]) 
  end

  def create
  	@course = Course.find(params[:course_id])
    @evaluation = Evaluation.new(component_params)
    @evaluation.component = Component.find(params[:component_id]) 

    respond_to do |format|
      if @evaluation.save
        format.html { redirect_to @course, notice: 'evaluation was successfully created.' }
        format.json { render action: 'courses/show', status: :created, location: @course }
        format.js {}  # create.js.erb in views/evaluations
      else
        format.html { render action: 'new' }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def destroy
    @course = Course.find(params[:course_id])

    @evaluation.destroy
    respond_to do |format|
      format.html { redirect_to @course }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def component_params
      params.require(:evaluation).permit(:mark)
    end
end


