

Template.autotable.helpers
  fields: ->
    if @collection? and window[@collection]
      console.log 'Found collection named ' + @collection + ' on window'
      # Get the keys, first by checking for presence of a simple-schema
      if window[@collection].simpleSchema?
        console.log 'Collection has a schema attached!'
        schema = window[@collection].simpleSchema()._schema
        fieldKeys = _.filter _.keys(schema), (k) -> k.indexOf('.$') == -1
        return _.map fieldKeys, (k) -> fieldName: k
    return [{fieldName: 'A'}, {fieldName: 'B'}]

Template.autotableInner.helpers
  record: ->
    if @collection? and window[@collection]
      return window[@collection].find().fetch()
  fieldCount: ->
    return @fields.length

Template.autotableInner.events
  'click button.add': (e,tpl) ->
    console.log 'add!', @, arguments
    $(tpl.find 'div[role="dialog"]').modal('show')

Template.autotableInner.rendered = ->
  console.log 'autotableInner', @data

Template.autotableRow.helpers
  valueOf: (fieldName, record) ->
    if record[fieldName]? then record[fieldName]

Template.autotableRow.rendered = ->
  console.log 'autotableRow', @data