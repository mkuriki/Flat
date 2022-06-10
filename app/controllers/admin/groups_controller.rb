class Admin::GroupsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end
  
  def edit
    @group = Group.find(params[:id])
  end

  def destroy
    @group = Group.find(params[:id])
    @group.delete
    redirect_to request.referer
  end

  def update
    if @group.update(group_params)
      redirect_to :show
    else
      render "edit"
    end
  end
  
end