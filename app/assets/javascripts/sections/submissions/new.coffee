App['submissions-new'] = ->
  $form = $('[data-formrenderer]')

  FormRenderer.BUTTON_CLASS = 'button primary'

  new FormRenderer
    project_id: $form.data('formrenderer')
    afterSubmit: '/?submitted=t' # Back to homepage
