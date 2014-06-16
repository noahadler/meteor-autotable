Package.describe({
  summary: "A counterpart to autoform, for working with whole collections in table form."
});

Package.on_use(function(api) {
  api.use('coffeescript', ['client', 'server']);
  api.use(['underscore', 'ui', 'templating', 'jquery', 'spacebars'], 'client');

  api.imply(['simple-schema', 'autoform', 'collection2'], ['client', 'server']);

  api.add_files(['autotable.html', 'autotable.coffee'], ['client']);

});

