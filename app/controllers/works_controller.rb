class WorksController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @work = current_user.works.build(work_params)
    if @work.save
      flash[:success] = "Work created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @work.destroy
    flash[:success] = "Work deleted"
    redirect_to request.referrer || root_url
  end

  private

    def work_params
      params.require(:work).permit(:content, :title)
    end

    def correct_user
      @work = current_user.works.find_by(id: params[:id])
      redirect_to root_url if @work.nil?
    end
end
