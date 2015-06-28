List = Backbone.View.extend({
  initialize: function(){
    var items = articles; 
    items.on('add', this.addItem, this);
    items.on('reset', this.reset, this);
  },
  addItem: function(m){
    var item = new Item({model: m})
    this.$el.append(item.render().el);
    return this;
  },
  reset: function(x){
    console.log(x)
    console.log('reset')
    _.each(x, this.addItem, this)
  
  }
});

