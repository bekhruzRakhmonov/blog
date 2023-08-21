class Admin::ProjectsController < ApplicationController
    include ActiveStorage::SetCurrent

    before_action :require_admin
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
        @projects = Project.all
    end

    def show
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)
        if @project.save
            redirect_to admin_project_path(@project), notice: 'Project was successfully created.'
        else
            render :new
        end
    end

    def edit
        # @project is already set by set_project
    end

    def update
        # Handle image removal
        if params[:project][:remove_images]
          params[:project][:remove_images].each do |image_id|
            image = @project.images.find_by(id: image_id)
            image.purge if image
          end
        end
      
        @project.title = project_params[:title]
        @project.description = project_params[:description]
        @project.images.attach(project_params[:images])
      
        if @project.save
            redirect_to admin_project_path(@project), notice: 'Project was successfully updated.'
        else
          render :edit
        end
    end

    def destroy
        @project.destroy
        redirect_to admin_projects_url, notice: 'Project was successfully deleted.'
    end
      

    private

    def project_params
        params.require(:project).permit(:title, :description, images: [], remove_images: [])
    end

    def set_project
        @project = Project.find(params[:id])
    end

    def require_admin
        raise ActiveRecord::RecordNotFound unless current_user&.admin?
    end
end