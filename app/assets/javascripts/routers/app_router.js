App.Routers.AppRouter = Backbone.Router.extend({
	routes: {
	  '': 'index',
	},
	index: function () {
		
		App.Collections.quotes.fetch({
			success: function(){
				var indexView = new App.Views.IndexView({
					collection: App.Collections.quotes
				});
		
				$("#app").html(indexView.render().$el);
			}
		});
		
	
	}
});
