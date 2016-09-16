class Views::Submissions::New < Views::Layouts::Application
  def javascripts
    super
    script src: '//d3q1ytufopwvkq.cloudfront.net/0/formrenderer.js'
  end

  def stylesheets
    super
    link href: '//d3q1ytufopwvkq.cloudfront.net/0/formrenderer.css', rel: 'stylesheet'
  end

  def main
    div(class: 'page_header with_back_arrow with_no_context') {
      a(
        class: 'page_header_back_arrow',
        title: 'Back to all submissions',
        'data-toggle' => 'tooltip',
        href: root_path
      ) {
        i(class: 'fa fa-arrow-circle-o-left')
      }

      h2 'New submission'
    }

    form(
      'This form requires JavaScript to complete.',
      'data-formrenderer' => Rails.configuration.x.screendoor_embed_token
    )
  end
end
