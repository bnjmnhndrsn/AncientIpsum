App.Views.RootView = Backbone.View.extend({
 	template: JST["quotes/root"],
	events: {
		"change input#text-length" : "updateText"
	},
	initialize: function(){
		this.length = 100;
		this.showView = new App.Views.ShowView({ collection: this.collection })
	},
	
	render: function(){	
	    this.$el.html(this.template());
	    var container = this.$el.find("#text-container");
		container.html( this.showView.render().$el );
		return this;	
	},
	
	updateText: function(event){
		this.length = +$(event.currentTarget).val();
		this.num = 1;
		
		this.collection.whereOrFetch({
			"length" : this.length
		}, this.num, function(models){
			this.collection.add(models, {merge: true});
			console.log(this);
			console.log(this.collection);
			this.showView.render(models.take(this.num));
		}.bind(this))
	}
});