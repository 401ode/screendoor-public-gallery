module ApplicationHelper
  def current_page
    page = params[:page].to_i

    if page > 0
      page
    else
      1
    end
  end

  def submission_meta(submission)
    "Submitted by #{submission.dig('responder', 'name')} on " \
    "#{Date.parse(submission['created_at']).to_formatted_s(:long)}"
  end

  def screendoor_response_fields
    @@screendoor_response_fields ||= begin
      resp = HTTP.get(
        "https://screendoor.dobt.co/api/projects/#{ENV.fetch('SCREENDOOR_PROJECT_ID')}/response_fields",
        params: {
          v: 0,
          api_key: ENV.fetch('SCREENDOOR_API_KEY')
        }
      )

      JSON.parse(resp)
    end
  end
end
