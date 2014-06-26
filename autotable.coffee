
Template.autotable.helpers
  addFieldsToContext: ->
    console.log 'autotable.transformContext', @
    context = _.extend {}, @
    
    if @collection? and window[@collection]
      console.log 'Found collection named ' + @collection + ' on window'
      
      # Get the keys, first by checking for presence of a simple-schema
      if window[@collection].simpleSchema?
        console.log 'Collection has a schema attached!'
        schema = window[@collection].simpleSchema()._schema
        fieldKeys = _.filter _.keys(schema), (k) -> k.indexOf('.$') == -1
        context.fields = _.map fieldKeys, (k) ->
          fieldName: k
        
        return context
        
  records: ->
    console.log 'RECORDS REACTIVE HELPER', @, arguments
    window[@collection].find()
    
  fieldCount: ->
    @fields.length
  
  fieldCellContext: (fieldName, doc) ->
    console.log 'setting up context for cell ', doc.name, fieldName #  arguments
    return { fieldName: fieldName, value: doc[fieldName] }
    
Template.autotable.events
  'click button.add': (e,tpl) ->
    console.log 'add!', @, arguments
    $(tpl.find 'div[role="dialog"]').modal('show')

Template.atColumn.helpers
  customTemplateRenderContext: (parent) ->
    _.extend parent, @
  renderCustomTemplate: ->
    #console.log 'Trying to render cell with custom template', @, arguments
    if @fieldName == @field and Template[@template]?
      @cellTemplateFound = true
      console.log '  rendering custom template for ' + @value + '\'s '+@field+' field: ' + @template
      return Template[@template]
    else
      return null #Template.atDefaultColumn
    
Template.atDefaultColumn.helpers
  noTemplateFound: ->
    customTemplate = @cellTemplateFound
    delete @cellTemplateFound
    console.log '  rendering default template for ' + @value + '\'s '+@field+' field? ' + (not customTemplate)
    not customTemplate
