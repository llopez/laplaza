$(function(){
  articles = new Articles;

  list = new List({el: '#list'});
  search_form = new SearchForm;

  articles.fetch();
});

