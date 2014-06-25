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
