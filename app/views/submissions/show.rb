class Views::Submissions::Show < Views::Layouts::Application
  def main
    div(class: 'page_header with_back_arrow with_no_context') {
      a(
        class: 'page_header_back_arrow',
        title: 'Back to all submissions',
        'data-toggle' => 'tooltip',
        href: root_path(page: params[:from_page])
      ) {
        i(class: 'fa fa-arrow-circle-o-left')
      }

      h2 submission_title(@submission)
    }

    dl {
      dt 'Submitted by'
      dd submission.dig('responder', 'name')

      dt 'Submitted at'
      dd submission_time(submission)

      screendoor_form['field_data'].each do |field|
        next if field['id'].to_s == Rails.configuration.x.preview_field_id.to_s

        dt field['label']
        dd {
          if (x = submission.dig('responses', field['id'].to_s).presence)
            rawtext x
          else
            span 'No response', class: 'none'
          end
        }
      end
    }

    rawtext %{
      <div id="disqus_thread"></div>
      <script>

      var disqus_config = function () {
        this.page.url = #{submission_url(params[:id]).to_json};
        this.page.identifier = #{params[:id]};
      };

      (function() { // DON'T EDIT BELOW THIS LINE
          var d = document, s = d.createElement('script');
          s.src = '//#{Rails.configuration.x.disqus_domain}.disqus.com/embed.js';
          s.setAttribute('data-timestamp', +new Date());
          (d.head || d.body).appendChild(s);
      })();
      </script>
      <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
    }

  end
end

