function comment_click(event) {
  var element = event.target;
  $$().each(function(tab) {
              tab.addClassName('inactive');
              tab.removeClassName('active');
            });

  element.addClassName('active');
  element.removeClassName('inactive');
}