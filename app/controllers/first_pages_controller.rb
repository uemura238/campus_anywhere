class FirstPagesController < ApplicationController
  before_action :logged_in_user, only: %i[edit update destroy]
  def home; end

  def help; end

  def about; end

  def contact; end
end
