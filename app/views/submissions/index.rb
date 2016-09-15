class Views::Submissions::Index < Views::Layouts::Application
  def main
    h1 'Screendoor Public Gallery'
    p "This is a example of using Screendoor's API to host a public gallery of submissions."

    a 'Add a submission', href: new_submission_path
  end
end
