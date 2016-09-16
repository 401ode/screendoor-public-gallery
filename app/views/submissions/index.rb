class Views::Submissions::Index < Views::Layouts::Application
  def main
    h2 'All submissions'
    p "This is a example of using Screendoor's API to host a public gallery of submissions."

    a 'Add a submission', href: new_submission_path, class: 'button info small'

    ul {
      @submissions.each do |submission|
        li {
          a submission.dig('responses', Rails.configuration.x.preview_field_id.to_s),
            href: submission_path(submission['id'])

          div submission_meta(submission)
        }
      end
    }

    if @total_pages > 1
      div(class: 'pagination pagination_centered') {
        ul {
          (1..@total_pages).each do |x|
            li(class: x == current_page ? 'active' : nil) {
              if x == current_page
                span x
              else
                a x, href: root_path(page: x)
              end
            }
          end
        }
      }
    end
  end
end
