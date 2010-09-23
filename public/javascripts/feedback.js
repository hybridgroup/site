function feedback_tab_click(event) {
  var element = event.target;
  $$("#feedback_type_section a.active").each(function(tab) {
    tab.addClassName('inactive');
    tab.removeClassName('active');
  });

  element.addClassName("active");
  element.removeClassName("inactive");

  $("feedback_feedback_type_id").value = element.id;
  $$("label[for='feedback_description']")[0].update("Describe your " + element.textContent.toLowerCase() + ":");
}
