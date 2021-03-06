<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="resources/stylesheets/logintrm.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <title>My home page</title>
</head>

<body>
    <!-- Top navigation -->
    <div id="topnav" class="navbar navbar-default navbar-fixed-top">
        <div class="header-container">
            <!-- Left-aligned link -->
            <div class="left-header">
                <a class="logo-content" href="#" title="Home">
                    <img class="logoimage1" src="resources/images/as-logo.png" alt="Home">
                </a>
            </div>
        </div>
    </div>
    <!-- main body content starts here -->
    <div class="container-fluid">
        <div class="row">
        	<div class="col-sm-6" >
        		<img style="margin-top: 15%; width: 40%; margin-left: 30%" src="resources/images/MdBlueLogo.png">
        	</div>
            <div class="col-sm-6">
                <form style ="margin-left:0px; width: 60%;" class="login" action="login" align="center">
                    <div class="modal-header">
                        <h3 class="modal-title">Login</h3>
                    </div>
                    <div class="modal-body">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input id="id" type="text" class="form-control" name="id" placeholder="ID" />
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input id="password" type="password" class="form-control" name="password" placeholder="Password" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">
                            <span class="glyphicon glyphicon-log-in"></span> Log in
                        </button>
                    </div>
                </form>
                
            </div>
        </div>
    </div>
    <!-- main body content ends here -->
    <footer id="footer">
                <p class="para">&copy;Copyright 2017 Syntel INC. All
                    rights
                    reserved.
                </p>
    </footer>
</body>
</html>