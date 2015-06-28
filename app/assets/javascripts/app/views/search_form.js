SearchForm = Backbone.View.extend({
  el: jQuery('#searchForm'),
  events: {
    'submit' : 'submit'
  },
  submit: function(e){
    e.preventDefault();
  } 
});

