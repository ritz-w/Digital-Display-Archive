class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json

  def index
    if params[:q]
      search_term = params[:q]
      @projects = project.where("title LIKE ?", "%#{search_term}%")
      @projects = project.where("author LIKE ?", "%#{search_term}%")
      # return filtered list
    else
      @projects = Project.all
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find_by_id(params[:id])
    @comments = @project.comments.paginate(page: params[:page], per_page: 5)
  end

  # GET /projects/index_by_date

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to "/static_pages/landing_page", notice: 'project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
def create
    @project = Project.find_by_id(params[:id])
    @comment = @project.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @project, notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { redirect_to @project, alert: 'Review was not saved successfully.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :author, :collaborators, :description, :analysis, :website, :image_url, :year_made, :date_ended, :img2_url, :img3_url, :img4_url, :bio)
    end
end
