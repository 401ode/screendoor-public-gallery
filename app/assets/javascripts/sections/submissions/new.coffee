App['submissions-new'] = ->
  $form = $('[data-formrenderer]')

  new FormRenderer
    project_id: $form.data('formrenderer')
    afterSubmit: '/?submitted=t' # Back to homepage
