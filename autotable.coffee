
Template.autotable.helpers
  addFieldsToContext: ->
    console.log 'autotable.transformContext', @
    context = _.extend {}, @
    context.fieldTemplates = new ReactiveDict()
    
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
        
  reactiveConfig: ->
    console.log 'reactiveConfig', @, arguments
    return @fieldTemplates
        
  records: ->
    window[@collection].find()
    
  fieldCount: ->
    @fields.length
  
  fieldCellContext: (fieldName, doc, grandparent) ->
    return { fieldName: fieldName, value: doc[fieldName], fieldConfig: grandparent.fieldTemplates }
    
  renderCell: ->
    tpl = @fieldConfig.get @fieldName
    if tpl?
      return Template[tpl]
    else
      return Template.atDefaultColumn
    
Template.autotable.events
  'click button.add': (e,tpl) ->
    console.log 'add!', @, arguments
    $(tpl.find 'div[role="dialog"]').modal('show')

Template.atColumn.helpers
  customTemplateRenderContext: (fieldConfig) ->
    fieldConfig.set @field, @template
    
