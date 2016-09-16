module ApplicationHelper
  def current_page
    page = params[:page].to_i

    if page > 0
      page
    else
      1
    end
  end

  def submission_title(submission)
    submission.dig('responses', Rails.configuration.x.preview_field_id.to_s)
  end

  def submission_meta(submission)
    "Submitted by #{submission.dig('responder', 'name')} on " \
    "#{submission_time(submission)}"
  end

  def submission_time(submission)
    Date.parse(submission['submitted_at']).to_formatted_s(:long)
  end

  def screendoor_response_fields
    @@screendoor_response_fields ||= begin
      resp = HTTP.get(
        "https://screendoor.dobt.co/api/projects/#{Rails.configuration.x.screendoor_project_id}/response_fields",
        params: {
          v: 0,
          api_key: Rails.configuration.x.screendoor_api_key
        }
      )

      JSON.parse(resp)
    end
  end
end
