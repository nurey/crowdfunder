class ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
    @projects = Project.order(ended_at: :desc)
  end

  def show
    # @project = Project.find(params[:id])
    # authorize! :show, @project
  end

  def new
    @project = Project.new
    @project.rewards.build
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to projects_url
    else
      render :new
    end
  end

  def destroy
    @project = Project.find(params[:id])

    @project.destroy
  end

  private
  def project_params 
    params.require(:project).permit(:name, :description, rewards_attributes: [:name, :description, :_destroy])
  end
end
