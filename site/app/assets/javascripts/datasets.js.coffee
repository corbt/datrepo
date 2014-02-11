# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class Search
  constructor: ->
    @register $("#dataset-search")

  register: (element) ->
    @element = element
    setTimeout ( =>
      @element.attr('autocomplete', 'off')
    ) ,100


    source = new Bloodhound {
      datumTokenizer: (d) -> Bloodhound.tokenizers.whitespace(d.num)
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      remote: {
        url: '/datasets/autocomplete?query=%QUERY'
        filter: (results) ->
          $.map(results, (result) -> 
            { name: result })
      }
    }

    source.initialize()

    element.typeahead(null, {
      displayKey: 'name'
      source: source.ttAdapter()
    })

    element.on "typeahead:selected", (event, data, dataset) ->
      $(event.target).closest('form').submit()

$(document).on 'page:change', ->
  if $('#dataset-search').length > 0
    new Search()