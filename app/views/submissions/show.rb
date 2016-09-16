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

    hr

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

