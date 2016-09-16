class SubmissionsController < ApplicationController
  PER_PAGE = 25

  before_action :check_for_submitted_param, only: [:index]
  before_action :get_submissions, only: [:index]
  before_action :get_submission, only: [:show]

  def index
  end

  def show
  end

  def new
  end

  private

  def check_for_submitted_param
    if params[:submitted] == 't'
      redirect_to root_path, success: 'Your submission has been received!'
    end
  end

  def get_submissions
    resp = HTTP.get(
      "https://screendoor.dobt.co/api/projects/#{ENV.fetch('SCREENDOOR_PROJECT_ID')}/responses",
      params: {
        v: 0,
        api_key: ENV.fetch('SCREENDOOR_API_KEY'),
        per_page: PER_PAGE,
        page: current_page,
        response_format: 'html'
      }
    )

    @submissions = JSON.parse(resp)
    @total_pages = (resp.headers['Total'].to_f / PER_PAGE).ceil
  end

  def get_submission
    resp = HTTP.get(
      "https://screendoor.dobt.co/api/projects/#{ENV.fetch('SCREENDOOR_PROJECT_ID')}/responses/#{params[:id]}",
      params: {
        v: 0,
        api_key: ENV.fetch('SCREENDOOR_API_KEY'),
        response_format: 'html'
      }
    )

    if resp.code == 200
      @submission = JSON.parse(resp)
    else
      not_found
    end
  end
end
