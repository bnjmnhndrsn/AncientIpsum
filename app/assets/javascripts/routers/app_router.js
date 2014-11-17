App.Routers.AppRouter = Backbone.Router.extend({
	routes: {
	  '': 'root',
	},
	root: function() {
		var rootView = new App.Views.RootView({
			collection: App.Collections.quotes
		});
		
		$("#app").html(rootView.render().$el);
	}
});

