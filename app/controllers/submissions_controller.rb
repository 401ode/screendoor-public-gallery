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
      redirect_to root_path, success: 'Your submission has been received! It will appear on this page shortly.'
    end
  end

  def get_submissions
    @submissions, @total_pages = Rails.cache.fetch(
      ['submissions', current_page, rounded_time_for_cache]
    ) do
      resp = HTTP.get(
        "https://screendoor.dobt.co/api/projects/#{Rails.configuration.x.screendoor_project_id}/responses",
        params: {
          v: 0,
          api_key: Rails.configuration.x.screendoor_api_key,
          per_page: PER_PAGE,
          page: current_page,
          response_format: 'html'
        }
      )

      [
        JSON.parse(resp),
        (resp.headers['Total'].to_f / PER_PAGE).ceil
      ]
    end
  end

  def get_submission
    @submission = Rails.cache.fetch(
      ['submission', params[:id], rounded_time_for_cache]
    ) do
      resp = HTTP.get(
        "https://screendoor.dobt.co/api/projects/#{Rails.configuration.x.screendoor_project_id}/responses/#{params[:id]}",
        params: {
          v: 0,
          api_key: Rails.configuration.x.screendoor_api_key,
          response_format: 'html'
        }
      )

      if resp.code == 200
        JSON.parse(resp)
      end
    end

    @submission || not_found
  end

  # Helper to cache every 5 minutes
  def rounded_time_for_cache
    cache_every_num_mins = 5
    time = Time.now
    step = cache_every_num_mins * 60
    Time.at((time.to_r / step).round * step).utc.to_s
  end
end
