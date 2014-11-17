App.Collections.Quotes = Backbone.Collection.extend({
	model: App.Models.Quote,
	url: "/api/quotes",
	whereOrFetch: function(options, num, callback){
		var models = options ? this.findWhere(options) : this.models;
		var dataObj = $.extend({}, options, { "num" : num });
		console.log(dataObj);
		if (models && models.length > num){
			callback(models);
		}
		else {
			this.fetch({
				data: $.param(dataObj),
				success: callback
			});
		}
	}
});

App.Collections.quotes = new App.Collections.Quotes();