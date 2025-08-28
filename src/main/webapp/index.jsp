<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Join our email list</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/main.css" type="text/css"/>
</head>
<body>

<header class="site-header">
    <div class="logo">
        <img src="images/murachlogo.jpg" alt="Murach">
    </div>
    <div class="container">
        <h1>Join our email list</h1>
        <p>To join our email list, enter your information below.</p>
    </div>
</header>

<main class="container">
    <!-- thông báo validate từ server -->
    <div class="alert" style="${empty message ? 'display:none;' : ''}">${message}</div>

    <!-- FORM: chỉ các trường như ảnh + 1 nút Submit -->
    <form id="joinForm" class="card" action="${pageContext.request.contextPath}/emailList" method="post" novalidate>
        <input type="hidden" name="action" value="add">

        <h2 class="section-title fancy">Your information</h2>
        <div class="grid">
            <!-- Row 1 -->
            <div class="field">
                <label for="firstName">First Name</label>
                <input id="firstName" type="text" name="firstName" value="${user.firstName}">
            </div>
            <div class="field">
                <label for="lastName">Last Name</label>
                <input id="lastName" type="text" name="lastName" value="${user.lastName}">
            </div>
            <!-- Row 2 -->
            <div class="field">
                <label for="email">Email</label>
                <input id="email" type="email" name="email" value="${user.email}">
            </div>
            <div class="field">
                <label for="preferred">Preferred contact</label>
                <select id="preferred" name="preferredContact">
                    <option value="both"  ${user.preferredContact == 'both'  ? 'selected' : ''}>Email or postal mail</option>
                    <option value="email" ${user.preferredContact == 'email' ? 'selected' : ''}>Email only</option>
                    <option value="postal" ${user.preferredContact == 'postal' ? 'selected' : ''}>Postal mail only</option>
                </select>
            </div>
            <!-- Row 3 -->
            <div class="field">
                <label for="dob">Date of Birth</label>
                <input id="dob" type="date" name="dateOfBirth" value="${user.dateOfBirth}">
            </div>
            <div class="field"></div>
        </div>

        <h2 class="section-title fancy">How did you hear about us?</h2>
        <div class="choice-pills">
            <label class="pill">
                <input type="radio" name="hearAbout" value="search" ${user.hearAbout == 'search' || empty user.hearAbout ? 'checked' : ''}>
                <span>Search engine</span>
            </label>
            <label class="pill">
                <input type="radio" name="hearAbout" value="word" ${user.hearAbout == 'word' ? 'checked' : ''}>
                <span>Word of mouth</span>
            </label>
            <label class="pill">
                <input type="radio" name="hearAbout" value="social" ${user.hearAbout == 'social' ? 'checked' : ''}>
                <span>Social Media</span>
            </label>
            <label class="pill">
                <input type="radio" name="hearAbout" value="other" ${user.hearAbout == 'other' ? 'checked' : ''}>
                <span>Other</span>
            </label>
        </div>

        <h2 class="section-title fancy">Announcements</h2>
        <div class="check-blocks">
            <label class="checkline">
                <input type="checkbox" name="wantAnnouncements" value="yes" ${user.wantAnnouncements ? 'checked' : ''}>
                <span>YES, I'd like that.</span>
            </label>
            <label class="checkline">
                <input type="checkbox" name="wantEmailAnnouncements" value="yes" ${user.wantEmailAnnouncements ? 'checked' : ''}>
                <span>YES, please send me email announcements.</span>
            </label>
            <label class="checkline">
                <input type="checkbox" name="agreeMurach" value="yes" ${user.agreeMurach ? 'checked' : ''}>
                <span>I agree to receive emails from Murach.</span>
            </label>
        </div>

        <!-- Nút duy nhất -->
        <button class="btn primary block" type="submit">Submit</button>
    </form>
</main>

<footer class="site-footer"><div class="container">© ${pageContext.servletContext.serverInfo}</div></footer>
</body>
</html>
