class UsersController < ApplicationController
  # before_action :logged_in_user, only: [:destroy]
  # before_action :authenticate_users!, only: [:show]
  before_action :set_user, only: [:favorites]
  before_action :logged_in_user, only: %i[destroy following followers]

  def favorites
    favorites = Favorite.where(user_id: @user.id).pluck(:micropost_id)
    @like_posts = Micropost.find(favorites)
    @like_posts = Kaminari.paginate_array(@like_posts).page(params[:page]).per(10)
  end

  def new_guest
    user = User.find_or_create_by(email: 'guest@example.com') do |user|
    user.name = "ゲスト"
    user.password = SecureRandom.alphanumeric(10) + [*'a'..'z'].sample(1).join + [*'0'..'9'].sample(1).join
    end
    log_in user
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc).page(params[:page]).per(10)
    @currentUserEntry = RoomUser.where(user_id: current_user.id)
    @userEntry = RoomUser.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = RoomUser.new
      end
    end
  end

  def index
    @users = User.all.search(params[:search]).page(params[:page]).per(5)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in user
      redirect_to root_url
    else
      flash[:alert] = 'failed. Please try again.'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    # flash[:notice] = 'ユーザーを削除しました。'
    redirect_to root_url # 削除に成功すればrootページに戻る
  end

  def following
    @title = 'Following'
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = 'Followers'
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

  private

  def user_params
    if logged_in?
      params.require(:user).permit(:name, :email, :status_message, :password,
                                   :password_confirmation)
    else
      params.permit(:name, :email, :status_message, :password,
                    :password_confirmation)
    end
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
