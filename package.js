Package.describe({
  summary: "A counterpart to autoform, for working with whole collections in table form."
});

Package.on_use(function(api) {
  api.use('coffeescript', ['client', 'server']);
  api.use(['underscore', 'templating'], 'client');

  api.add_files(['autotable.html', 'autotable.coffee'], ['client']);

});

