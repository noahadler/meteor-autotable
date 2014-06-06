
fieldsHelper = ->
  if @collection? and window[@collection]
    console.log 'Found collection named ' + @collection + ' on window'
    # Get the keys, first by checking for presence of a simple-schema
    if window[@collection].simpleSchema?
      console.log 'Collection has a schema attached!'
      schema = window[@collection].simpleSchema()._schema
      fieldKeys = _.filter _.keys(schema), (k) -> k.indexOf('.$') == -1
      return _.map fieldKeys, (k) -> fieldName: k
  return [{fieldName: 'A'}, {fieldName: 'B'}]
  

Template.autotable.helpers
  fields: ->
    console.log 'autotable', @, arguments
    fieldsHelper.apply @, arguments
  record: ->
    if @collection? and window[@collection]
      return window[@collection].find()
  booger: ->
    console.log 'booger'
    console.log @
    console.log arguments
    return 'booger'

Template.autotableRow.helpers
  fields: ->
    console.log 'autotableRow', @, arguments
    fieldsHelper.apply @, arguments
  valueOf: (hash, fieldName) ->
    console.log 'valueOf', @, arguments
    fieldsArg = {}
    fieldsArg[fieldName] = 1
    return window[hash.collection].findOne(hash.recordId, {fields: fieldsArg})[fieldName]
