<%

    // invalidate the current session
    session.invalidate();
    String message = "Logout successful.!";
    %>
            <h1 align="center" id="success-msg" style="background-color: #DFF2BF; border: 1px solid #4F8A10; color: #4F8A10; padding: 10px;">
                <%= message %>
            <br><br>
            Redirecting to Home...
            </h1>
            <script>
                setTimeout(function() {
                    window.location.href = "http://localhost:8080/Footwear/index.html";
                }, 2000); // redirect after 10 seconds
            </script>
