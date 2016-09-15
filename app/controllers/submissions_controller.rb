class SubmissionsController < ApplicationController
  before_action :check_for_submitted_param, only: [:index]

  def index
  end

  def new
  end

  private

  def check_for_submitted_param
    if params[:submitted] == 't'
      redirect_to root_path, success: 'Your submission has been received!'
    end
  end
end
