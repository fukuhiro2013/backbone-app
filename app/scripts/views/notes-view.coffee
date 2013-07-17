###
  (c) 2013-2014 albatrosary
  Notepad may be freely distributed under the MIT license.
  For all details and documentation:
  https://github.com/albatrosary/backbone-app
###
define [
  "jquery"
  "underscore"
  "backbone"
  "templates"
], ($, _, Backbone, JST) ->
  "use strict"
  class NotesView extends Backbone.View

  	# TODO #notesとしたところ eventsハンドラーが取得できなかった
    el: $("#main")

    template: JST["app/scripts/templates/notes.ejs"]

    events:
      'click #update': '_onClickUpdate'
      'click #added': '_onClickAdded'
    
    # ここでレンダリングしない
    #initialize: () ->
    #  this.render()

    render: () ->
      $("#notes").html @template

    _onClickUpdate: () ->
      model = @collection.get {id: $("#notes-id").val()}
      model.set { title: $("#notes-text").val(), contents: $("#notes-contents").val() }, { silent: false }, { validate: true }

    _onClickAdded: () ->
      ids = _.uniqueId "notes_"
      @collection.add { id: ids, title: $("#notes-text").val(), contents: $("#notes-contents").val() }, { validate: true }
      $("#notes-id").val ids
      