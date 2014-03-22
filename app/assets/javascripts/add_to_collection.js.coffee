class AddToCollection
  constructor: ->
    @list = $('#add-to-collection')
    @count = $('#collection-count')
    @dataset = @list.data('dataset')

    @list.on 'click', '.collection-link', @add_to_collection


  add_to_collection: (click) =>
    click.preventDefault()
    link = $(click.target)
    url = link.attr('href')
    console.log url
    selected = link.data('selected')
    add = !selected

    $.post url, {'add': add, 'dataset': @dataset}, =>
      @toggle_selected(link)


  toggle_selected: (link) ->
    if link.data('selected')
      link.data('selected', false)
      link.removeClass('selected')
      @decrement_count()
    else
      link.data('selected', true)
      link.addClass('selected')
      @increment_count()

  increment_count: ->
    @count.text(parseInt(@count.text())+1)

  decrement_count: ->
    @count.text(parseInt(@count.text())-1)


$(document).on 'page:change', ->
  if $('#add-to-collection').length > 0
    new AddToCollection()