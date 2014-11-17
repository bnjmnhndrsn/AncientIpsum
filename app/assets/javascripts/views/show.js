App.Views.ShowView = Backbone.View.extend({
 	template: JST["quotes/show"],
	render: function(_models){
		var models = (_models) ? _models : this.collection;
		var text = models.map(function(model){
			return model.get("content");
		}).join(" ");
	    var renderedContent = this.template({ text: text });
	    this.$el.html(renderedContent);
	    return this;		
	}
});