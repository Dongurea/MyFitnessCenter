<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
   <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
	  border-color: #CEF279;
    }
    
    body,h1,h5 {font-family: "Raleway", sans-serif}
	body, html {height: 100%}
	.bgimg {
	    background-image: url('/w3images/onepage_restaurant.jpg');
	    min-height: 100%;
	    background-position: center;
	    background-size: cover;
	}

	.textcenter{
		margin: auto;
		margin-right: auto;
		margin-left: auto;
	}

	.navbar-inverse{
		background-color: #CEF279;
	}

	.active-in{
		background-color: #F6FFCC;
	}

	.navbar-inverse .navbar-nav > li > a{
		color:black;
	}

	.navbar-inverse .navbar-brand > li > a{
		color:black;
	}

	.navbar-inverse .navbar-brand{
		color:black;
	}

	.col-sm-go{
		height: 30px;
		width:  120px;
		background-color:lightgray;
		margin: 0 auto;
	}

	.sidenav {
      padding-top: 100px;
      background-color: white;
      height: 100%;
    }

   
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }


	@media 
only screen and (max-width: 760px),
(min-device-width: 768px) and (max-device-width: 1024px)  {
    table { 
          width: 100%; 
    }
    /* Force table to not be like tables anymore */
    table, thead, tbody, th, td, tr { 
        display: block; 
    }
    
    /* Hide table headers (but not display: none;, for accessibility) */
    thead tr { 
        position: absolute;
        top: -9999px;
        left: -9999px;
    }
    
    tr { border: 1px solid #ccc; }
    
    td { 
        /* Behave  like a "row" */
        border: none;
        border-bottom: 1px solid #eee; 
        position: relative;
        padding-left: 50%; 
    }
    
    td:before { 
        /* Now like a table header */
        position: absolute;
        /* Top/left values mimic padding */
        top: 6px;
        left: 6px;
        width: 45%; 
        padding-right: 10px; 
        white-space: nowrap;
        /* Label the data */
        content: attr(data-column);
        color: #3498db;
    }
}

.table{
	text-align:right;
}

.w3-modal{
		z-index:3;
		display:none;
		padding-top:10%;
		position:fixed;
		left:0;
		top:0;
		width:100%;
		height:100%;
		overflow:auto;
		background-color:rgb(0,0,0);
		background-color:rgba(0,0,0,0.4);
	}
	
.w3-modal-content{
		margin:auto;
		background-color:#fff;
		position:relative;
		padding:0;
		outline:0;
		width:650px
	}

  </style>
  
  <script type="text/javascript">
  /*!
   * Bootstrap v3.0.2 by @fat and @mdo
   * Copyright 2013 Twitter, Inc.
   * Licensed under http://www.apache.org/licenses/LICENSE-2.0
   *
   * Designed and built with all the love in the world by @mdo and @fat.
   */

  
  $(document).ready(function() {
	    var panels = $('.user-infos');
	    var panelsButton = $('.dropdown-user');
	    panels.hide();

	    //Click dropdown
	    $(document).on("click",panelsButton,function() {
	        //get data-for attribute
	        var dataFor = $(this).attr('data-for');
	        var idFor = $(dataFor);

	        //current button
	        var currentButton = $(this);
	        idFor.slideToggle(400, function() {
	            //Completed slidetoggle
	            if(idFor.is(':visible')){
	                currentButton.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
	            }else{
	                currentButton.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
	            }
	        });
	    });
	    $('[data-toggle="tooltip"]').tooltip();

	    $('button').on("click",function(e) {
	        e.preventDefault();
	        alert("This is a demo.\n :-)");
	    });
  });
	    </script>
</head>

<div id="contact" class="w3-modal-content w3-animate-zoom">  
      <span onclick="document.getElementById('contact').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
      <br><br>
    <div class="w3-container">
      <form class="form-horizontal" action="/action_page.php" target="_blank">
   			<div class="row user-row">
            <div class="col-md-1">
                <img class="img-circle"
                     src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=50"
                     alt="User Pic">
            </div>
            <div class="col-md-10">
                <strong>Cyruxx</strong><br>
                <span class="text-muted">User level: Administrator</span>
            </div>
            <!-- add .rowname class to attribute data-for (Dropdown!)-->
            <div class="col-md-1 dropdown-user" data-for=".cyruxx">
                <i class="glyphicon glyphicon-chevron-down text-muted"></i>
                <input type="button" class="glyphicon glyphicon-chevron-down text-muted" value="32">

            </div>
        </div>
        
        <!-- Add data-for class to this row -->
        <div class="row user-infos cyruxx">
            <div class="col-sm-10 col-md-10 col-md-offset-1">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">User information</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-3">
                                <img class="img-circle"
                                     src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100"
                                     alt="User Pic">
                            </div>
                            <div class="col-md-6">
                                <strong>Cyruxx</strong><br>
                                <table class="table table-condensed table-responsive table-user-information">
                                    <tbody>
                                    <tr>
                                        <td>User level:</td>
                                        <td>Administrator</td>
                                    </tr>
                                    <tr>
                                        <td>Registered since:</td>
                                        <td>11/12/2013</td>
                                    </tr>
                                    <tr>
                                        <td>Topics</td>
                                        <td>15</td>
                                    </tr>
                                    <tr>
                                        <td>Warnings</td>
                                        <td>0</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                        <button class="btn btn-sm btn-primary" type="button"
                                data-toggle="tooltip"
                                data-original-title="Send message to user"><i class="glyphicon glyphicon-envelope"></i></button>
                        <span class="pull-right">
                            <button class="btn btn-sm btn-warning" type="button"
                                    data-toggle="tooltip"
                                    data-original-title="Edit this user"><i class="glyphicon glyphicon-edit"></i></button>
                            <button class="btn btn-sm btn-danger" type="button"
                                    data-toggle="tooltip"
                                    data-original-title="Remove this user"><i class="glyphicon glyphicon-remove"></i></button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
      </form>
    </div>
  </div>

</html>