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
        @toggle_favorite()
        @decrement_count()

    else
      $.post(@url, {'favorite': true}, (response) =>
        @toggle_favorite()
        @increment_count()
        ).fail (request) =>
          if request.status == 401
            window.location = "/users/sign_in"

  increment_count: ->
    @count.text(parseInt(@count.text())+1)

  decrement_count: ->
    @count.text(parseInt(@count.text())-1)

  toggle_favorite: ->
    if @favorited
      @button.text("Favorite")
    else
      @button.text("Unfavorite")
    @favorited = @favorited == false #Switch value



$(document).on 'page:change', ->
  if $('#favorite').length > 0
    new FavoriteItem()