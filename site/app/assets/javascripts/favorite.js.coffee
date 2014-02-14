class FavoriteItem
  constructor: ->
    @button = $('#favorite-button')
    @count = $('#favorite-count')
    @favorited = @button.data('favorited')
    @url = @button.data('url')

    @button.on 'click', @toggle_favoriting

  toggle_favoriting: =>
    if @favorited
      $.post @url, {'favorite': false}, =>
        @button.text("Favorite")
        @decrement_count()
        @favorited = false

    else
      $.post(@url, {'favorite': true}, =>
        @button.text("Unfavorite")
        @increment_count()
        @favorited = true
        ).fail (request) =>
          if request.status == 401
            window.location = "/users/sign_in"
          # console.log request.status


  increment_count: ->
    @count.text(parseInt(@count.text())+1)

  decrement_count: ->
    @count.text(parseInt(@count.text())-1)



$(document).on 'page:change', ->
  if $('#favorite').length > 0
    new FavoriteItem()