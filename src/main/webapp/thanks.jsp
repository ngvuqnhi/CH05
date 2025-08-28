<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="murach.business.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Thanks for joining</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/main.css">
</head>
<body>

<header class="site-header">
    <div class="container">
        <h1>Thanks for joining our email list</h1>
    </div>
</header>

<main class="container">
    <div class="card">
        <div class="success">
      <span class="success__icon" aria-hidden="true">
        <svg viewBox="0 0 24 24" width="22" height="22">
          <path d="M9 16.2l-3.5-3.5L4 14.2l5 5 11-11-1.5-1.5L9 16.2z"></path>
        </svg>
      </span>
            <div>
                <h2 class="success__title">You're in!</h2>
                <p class="success__subtitle">Your subscription was submitted successfully.</p>
            </div>
        </div>

        <h3 class="section-title">Here is the information that you entered</h3>

        <%
            // Lấy bean User do servlet setAttribute("user", userBean)
            User u = (User) request.getAttribute("user");
            String first = (u != null && u.getFirstName() != null) ? u.getFirstName() : "";
            String last  = (u != null && u.getLastName()  != null) ? u.getLastName()  : "";
            String email = (u != null && u.getEmail()     != null) ? u.getEmail()     : "";

            // Các lựa chọn thêm lấy từ request params (forward cùng request nên vẫn còn)
            String dob  = request.getParameter("dateOfBirth");
            String pref = request.getParameter("preferredContact");     // both|email|postal
            String hear = request.getParameter("hearAbout");            // search|word|social|other
            boolean a1  = request.getParameter("wantAnnouncements") != null;
            boolean a2  = request.getParameter("wantEmailAnnouncements") != null;
            boolean a3  = request.getParameter("agreeMurach") != null;

            String prefLabel =
                    "email".equals(pref)  ? "Email only" :
                            "postal".equals(pref) ? "Postal mail only" :
                                    "both".equals(pref)   ? "Email or postal mail" : "";

            String hearLabel =
                    "search".equals(hear) ? "Search engine" :
                            "word".equals(hear)   ? "Word of mouth" :
                                    "social".equals(hear) ? "Social Media" :
                                            "other".equals(hear)  ? "Other" : "";

            StringBuilder ann = new StringBuilder();
            if (a1) ann.append("General announcements; ");
            if (a2) ann.append("Email announcements; ");
            if (a3) ann.append("Agreed to receive emails from Murach.");
            if (ann.length() == 0) ann.append("None");
        %>

        <!-- Tóm tắt NGANG -->
        <div class="summary-inline">
            <div class="kv"><span class="k">First Name:</span><span class="v"><%= first %></span></div>
            <div class="kv"><span class="k">Last Name:</span><span class="v"><%= last %></span></div>
            <div class="kv"><span class="k">Email:</span><span class="v"><%= email %></span></div>

            <div class="kv"><span class="k">Date of Birth:</span><span class="v"><%= (dob==null?"":dob) %></span></div>
            <div class="kv"><span class="k">Preferred contact:</span><span class="v"><%= prefLabel %></span></div>
            <div class="kv"><span class="k">Heard via:</span><span class="v"><%= hearLabel %></span></div>

            <div class="kv span-2"><span class="k">Announcements:</span><span class="v"><%= ann.toString() %></span></div>
        </div>

        <form method="post" action="${pageContext.request.contextPath}/emailList" class="inline" style="margin-top:12px">
            <input type="hidden" name="action" value="join"/>
            <button class="btn" type="submit">Return</button>
        </form>
    </div>
</main>

<footer class="site-footer"><div class="container">© ${pageContext.servletContext.serverInfo}</div></footer>
</body>
</html>
