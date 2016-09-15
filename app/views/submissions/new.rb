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
    form(
      'This form requires JavaScript to complete.',
      'data-formrenderer' => Rails.configuration.x.screendoor_embed_token
    )
  end
end
