class MicropostsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]
  before_action :correct_user,   only: :destroy

  def new; end

  def index
    @micropost = Micropost.all.search(params[:search]).order(created_at: :desc).page(params[:page]).per(10)
  end

  def create
    micropost = current_user.microposts.build(micropost_params)
    if micropost.save
      flash[:notice] = 'You posted a review!'
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = 'Micropost deleted'
    redirect_back(fallback_location: root_path)
  end

  private

  def micropost_params
    params.permit(:univ, :content)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end
