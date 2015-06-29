List = Backbone.View.extend({
  el: '#list',
  initialize: function(){
    this.collection.on('add', this.addItem, this);
    this.collection.fetch();
  },
  addItem: function(m){
    var item = new Item({model: m})
    this.$el.append(item.render().el);
    return this;
  }
});

