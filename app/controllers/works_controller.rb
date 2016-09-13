class WorksController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    @works = Work.all
    @user = User.find_by(params[:name])
    @works = Work.paginate(page: params[:page])
  end

  def show
    @work = Work.find(params[:id])
    @user = User.find_by(params[:name])
  end


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

  def edit
      @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    if @work.update_attributes(work_params)
      flash[:success] = 'Work updated'
      redirect_to @work
      # Handle a successful update.
    else
      render 'edit'

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
