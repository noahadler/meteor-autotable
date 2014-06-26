@ExampleCollection = new Meteor.Collection 'exampleCollection'
@ExampleCollection.attachSchema new SimpleSchema
  name:
    type: String
    label: 'Name'
  message:
    type: String
    label: 'Message'
  submitted:
    type: Date
    label: 'Submission timestamp'
    defaultValue: new Date()
  tags:
    type: [String]
    label: 'Tags'
    defaultValue: []

if Meteor.isClient
  UI.body.cellTemplates =
    submitted: 'submittedCell'
  
  Template.submittedCell.helpers
    shortDate: (d) ->
      moment(d).format('M/D/YY - h:mm a')