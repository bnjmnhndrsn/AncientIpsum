App.Views.IndexView = Backbone.View.extend({
  template: JST["quotes/index"],
  tagName: "div",

  render: function () {
    var renderedContent = this.template({ quotes: this.collection });
    this.$el.html(renderedContent);

    return this;
  }
});