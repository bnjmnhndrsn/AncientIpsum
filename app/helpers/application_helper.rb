module ApplicationHelper
  def logout_link
    form = "<form class=\"navbar-form navbar-left\" action=\"signout\" method=\"POST\">"
    form += "<input type=\"hidden\" name=\"authenticity_token\" value=\"#{form_authenticity_token}\">"
    form += "<input type=\"hidden\" name=\"_method\" value=\"DELETE\">"
    form += "<input class=\"btn btn-default\" type=\"submit\" value=\"Log out\">"
    form += "</form>"
    form.html_safe
  end
end
