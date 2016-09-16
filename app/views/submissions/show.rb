class Views::Submissions::Show < Views::Layouts::Application
  def main
    h2 submission_meta(@submission)

    dl {
      screendoor_response_fields.each do |rf|
        dt rf['label']
        dd {
          if (x = submission.dig('responses', rf['id'].to_s).presence)
            rawtext x
          else
            span 'No response', class: 'none'
          end
        }
      end
    }
  end
end
