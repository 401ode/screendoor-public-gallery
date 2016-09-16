class Views::Submissions::Index < Views::Layouts::Application
  def main
    div(class: 'page_header') {
      h2 'All submissions'
      a 'Add a submission', href: new_submission_path, class: 'button primary'
    }

    div(class: 'grid') {
      @submissions.each do |submission|
        div(class: 'item lap_six_columns') {
          a(class: 'submission_card', href: submission_path(submission['id'], from_page: current_page)) {
            span submission_title(submission), class: 'submission_card_title'
            span submission_meta(submission), class: 'submission_card_meta'
          }
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
