class Api::V1::ProjectsController < ApplicationController
  def index
    @projects = Project.all
    render json: @projects.to_json(include: { images: { methods: :url }}), status: 200
  end

  def show
    @project = Project.find(params[:id])
    if @project
      render json: @project, status: 200
    else
      render json: {error: "Project not found"}, status: 404
    end
  end
end
