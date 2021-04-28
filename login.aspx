<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="StayBeautifulSMS.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>How to Design Login & Registration Form Transition</title>
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" type="text/css" href="../Content/login.css"/>
  <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800&display=swap" rel="stylesheet"/>
</head>
<body>
    
  <div class="cont">
    <div class="form sign-in">
      <h2>Sign In</h2>
        <form id="login_form" runat="server">
      <label>
        <span>Username</span>
        <input id="txtemail" runat="server" type="text" name="txtemail" required="required"/>
      </label>
      <label>
        <span>Password</span>
        <input id="txtPassword" runat="server" type="password" name="password" required="required"/>
      </label>
      <button class="submit" runat="server" id="loginBtn" onServerClick="loginBtn_ServerClick" type="button">sign in</button>
        </form>
      <p class="forgot-pass">Forgot Password ?</p>

      <div class="social-media">
        <ul>
          <li><img src="Assets/facebook.png"/></li>
          <li><img src="Assets/twitter.png"/></li>
          <li><img src="Assets/linkedin.png"/></li>
          <li><img src="Assets/instagram.png"/></li>
        </ul>
      </div>
    </div>

    <div class="sub-cont">
      <div class="img">
        <div class="img-text m-up">
          <h2>New here?</h2>
          <p>Sign up and discover great amount of new opportunities!</p>
        </div>
        <div class="img-text m-in">
          <h2>One of us?</h2>
          <p>If you already has an account, just sign in. We've missed you!</p>
        </div>
 <%--       <div class="img-btn">
          <%--<span class="m-up">Sign Up</span>--%>
          <span class="m-in">Sign In</span>
        <%--</div>--%>
      </div>
     <%-- <div class="form sign-up">
        <h2>Sign Up</h2>
        <label>
          <span>Name</span>
          <input runat="server" type="text"/>
        </label>
        <label>
          <span>Email</span>
          <input runat="server" type="email"/>
        </label>
        <label>
          <span>Password</span>
          <input runat="server" type="password"/>
        </label>

        <label>
          <span>Confirm Password</span>
          <input runat="server" type="password"/>
        </label>
        <%--<button type="button" runat="server" id="submitBtn" class="submit" onServerClick="Unnamed_ServerClick">Sign Up Now</button>--%>
     <%-- </div>--%>
    </div>
  </div>
<script type="text/javascript" src="Scripts/login.js"></script>
<script>  
function validateform(){  
var name=document.myform.name.value;  
var password=document.myform.password.value;  
  
if (name==null || name==""){  
  alert("Name can't be blank");  
  return false;  
}else if(password.length<6){  
  alert("Password must be at least 6 characters long.");  
  return false;  
  }  
}  
</script> 
        
</body>
</html>
