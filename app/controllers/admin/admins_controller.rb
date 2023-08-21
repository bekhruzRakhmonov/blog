class Admin::AdminsController < ApplicationController
    before_action :require_admin
    before_action :set_admin, only: [:edit, :show, :update, :destroy]

    def index
        @admins = User.where(admin: true)
    end

    def show

    end

    def edit
        # @admin is already set by set_admin
    end

    def update
        if @admin.update(admin_params)
            redirect_to admin_admin_path(@admin), notice: 'Admin was successfully updated.'
        else
            render :edit
        end
    end

    def destroy
        @admin.destroy
        redirect_to admin_admins_url, notice: 'Admin was successfully deleted.'
    end

    private

    def admin_params
        params.require(:user).permit(:admin, :about)
    end

    def set_admin
        @admin = User.find(params[:id])
    end

    def require_admin
        raise ActiveRecord::RecordNotFound unless current_user&.admin?
    end
end