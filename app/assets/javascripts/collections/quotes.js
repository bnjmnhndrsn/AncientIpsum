App.Collections.Quotes = Backbone.Collection.extend({
	model: App.Models.Quote,
	url: "/api/quotes"
});

App.Collections.quotes = new App.Collections.Quotes();