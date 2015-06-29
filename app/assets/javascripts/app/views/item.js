Item = Backbone.View.extend({
  tagName: 'tr',
  template: _.template($('#item-template').html()),
  initialize: function(){
    this.listenTo(this.model, 'change', this.render);
    this.listenTo(this.model, 'destroy', this.remove);
  },
  render: function(){
    this.$el.html(this.template(this.model.toJSON()));
    this.$el.find('a.edit-item').attr('href', "/articles/" + this.model.get('id') + "/edit");
    this.$el.find('a.show-item').attr('href', "/articles/" + this.model.get('id'));
    this.$el.find('a.destroy-item').attr('href', "/articles/" + this.model.get('id'));
    return this;
  }
})

