<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="com.google.appinventor.server.util.UriBuilder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<%
   String error = request.getParameter("error");
   String useGoogleLabel = (String) request.getAttribute("useGoogleLabel");
   String locale = request.getParameter("locale");
   String redirect = request.getParameter("redirect");
   String repo = (String) request.getAttribute("repo");
   String galleryId = (String) request.getAttribute("galleryId");
   if (locale == null) {
       locale = "pt_BR";
   }

%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta HTTP-EQUIV="pragma" CONTENT="no-cache"/>
    <meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"/>
    <meta HTTP-EQUIV="expires" CONTENT="0"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <title>MIT App Inventor</title>
  </head>
<body>
  <div class="container">
    <div class="row">
      <h1 style="margin: 20px; text-align: center; width: 100%;">Bem vindo ao App Inventor - UFRGS</h1>
    </div>
    <% if (error != null) {
      out.println("<div class=\"alert alert-danger\" role=\"alert\"><b>" + error + "</div>");
    } %>
    <form method=POST action="/login">
      <div class="form-group row">
        <label for="email" class="col-sm-2 col-form-label">Email</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="email" name="email" placeholder="Email de acesso">
        </div>
      </div>
      <div class="form-group row">
        <label for="inputPassword" class="col-sm-2 col-form-label">Senha</label>
        <div class="col-sm-10">
          <input type="password" class="form-control" id="inputPassword" name="password" placeholder="Senha de acesso">
        </div>
      </div>
      <div class="form-group row">
        <button type="submit" class="btn btn-success">Login</button>&nbsp;&nbsp;
        <div class="btn-group" role="group">
          <a href="<%= new UriBuilder("/login").add("locale", "pt_BR").add("repo", repo).add("galleryId", galleryId).add("redirect", redirect).build() %>" class="btn btn-secondary">Português</a>
          <a href="<%= new UriBuilder("/login").add("locale", "en").add("repo", repo).add("galleryId", galleryId).add("redirect", redirect).build() %>" class="btn btn-secondary">English</a>
        </div>&nbsp;&nbsp;
        <a class="btn btn-primary" href="/login/sendlink" role="button">${passwordclickhereLabel}</a>
      </div>
      <div class="form-group row fixed-bottom">
        <div class="col-4"></div>
        <div class="col-2">
          <a href="http://www.appinventor.mit.edu" target="_blank"><img class="img-scale" src="/images/login-app-inventor.jpg" width="50" height="30" title="MIT App Inventor"></a></center>
        </div>
        <div class="col-2">
          <p style="text-align: center; clear:both;">
            <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/" target="_blank"><img alt="Creative Commons License" src="/images/cc3.png"></a>
            <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/" target="_blank"></a>
          </p>
        </div>
        <div class="col-4"></div>
      </div>
      <% if (locale != null && !locale.equals("")) { %>
        <input type=hidden name=locale value="<%= locale %>">
      <% } if (repo != null && !repo.equals("")) { %>
        <input type=hidden name=repo value="<%= repo %>">
      <% } if (galleryId != null && !galleryId.equals("")) { %>
        <input type=hidden name=galleryId value="<%= galleryId %>">
      <% } %>
      <% if (redirect != null && !redirect.equals("")) { %>
        <input type=hidden name=redirect value="<%= redirect %>">
      <% } %>
    </form>
  </div>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>

