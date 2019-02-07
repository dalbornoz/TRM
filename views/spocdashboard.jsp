<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <meta charset="utf-8"> 
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="resources/stylesheets/spoc.css">
  <link  rel="stylesheet" href="resources/stylesheets/custom.css" >
  <link  rel="stylesheet" href="resources/stylesheets/trm.css" >
  <script src="resources/js/spocJquery.js"></script>
  <script>
  	function submitTT(){
    	$(".toProgress").click(function(){
    	    var trainingRequestId =$(this).find('#ongoingId').val();
    	    var status =$(this).find('#ongoingStatus').val();
    	    console.log(trainingRequestId);
    	    console.log(status);
    		if(status == 1.0)
    		{
    			$("#selectTT").get(0).setAttribute('action', "selectTrainingType/"+trainingRequestId);
    			$( "#selectTT" ).submit();
    		}else
    		{
    			$("#selectTT").get(0).setAttribute('action', "viewspocdashboard");
    			$( "#selectTT" ).submit();
    		}
    	})	
	}
  	
  	function submitTR(){
  		$("#submiTR").submit();
  	}
  </script>
</head>

<body>

  <!-- Top navigation -->
  <div id="topnav" class="navbar navbar-default navbar-fixed-top">
    <div class="header-container">
      <!-- Left-aligned link -->
      <div class="left-header">
        <a class="logo-content" href="#" title="Home">
          <img class="logoimage1" src="resources/img/as-logo.png" alt="Home">
        </a>
      </div>
      <!-- Right-aligned links -->
      <div id="right-header">
        <a href="about.html" class="about">About</a>
        <a href="#" class="logolink" title="Home">
          <img class="logoimage2" src="resources/img/as-logo.png" alt="Home">
        </a>
      </div>
    </div>
  </div>
  <!--End of navigation bar-->

  <!--Some space between navigation bar and actual content-->
  <div class="row* space"></div>


  <div class="row" style="height: 65vh;">
    <!--New Request Box-->
    <div id="newRequestBox" class="border">
    <form action="selectNewRequest">
      <!--Start Button Send selected new requests to be ongoing requests-->
      <button id="startButton" class="row* sticky-top" onclick="submitTR()">
        Start
        <span id="right_arrow" class="glyphicon glyphicon-arrow-right"></span>
      </button>

      <!--New Requests would be added here-->
      <div class="col">
	<c:forEach items="${ntrList}" var="ntr">
      	<c:if test="${ntr.status == 0}">

        <div class="portfolio-item cardSpacing" style="float:left">
          <div class="card h-100" id="card">
            <table>
              <td>
                <h3 align="left" style="margin-top: 0px">${ntr.trainingRequestId}</h3>
              </td>
              <td>
                <!--card Drop down -->
                <div class="dropdown" align="right" style="margin-top: 0px" id="moreInfo">
                  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                    aria-haspopup="true"><span class="glyphicon glyphicon-th-list"></span>
                  </button>
                  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <li><a href="#"><span class="glyphicon glyphicon-pencil"></span>${ntr.requestTrainingModuleScope }</a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-home"></span>${ntr.requestTrainingType }</a></li>
                    <!--internal or vender -->
                    <li><a href="#"> <span class="glyphicon glyphicon-modal-window"></span>${ntr.requestTrainingMode }</a></li>
                    <!--"mode" of training -->
                    <li><a href="#"><span>&#35;</span> ${ntr.approxNumberOfParticipants }</a></li>
                    <!--Edit button 1 popover-->
                    <li> <button type="button" class="center-block" data-toggle="modal" data-target="#myModal">Edit</button></li>
                    </li>

                    <li role="separator" class="divider"></li>
                    <li><a href="#"><span class="glyphicon glyphicon-calendar"></span>${ntr.requestStartTime }</a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-calendar"></span>${ntr.requestEndTime }</a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-time"> </span>${ntr.requestTimeZone }</a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-globe"></span>${ntr.requestLocation }</a></li>
                    <!--Where it is taking place if not online (IF ONLINE DONT SHOW)-->
                    <!--Edit button 1 popover-->
                    <li> <button type="button" class="center-block" data-toggle="modal" data-target="#myModal1">Edit</button></li>
                    </li>

                    <li role="separator" class="divider"></li>
                    <li><a href="#" data-toggle="modal" data-target="#Log" style="color: blue;"><span class="glyphicon glyphicon-list-alt"></span>
                        Log</a></li>

                  </ul>
                </div>
                <!--card Drop down end  -->
              </td>
            </table>
            <!--card body -->
            <div class="blueCard card-body pointer">
              <table id="Info">
                <tr>
                  <td><input type="hidden" id="ntRId" name="trainingRequestId" value="${ntr.trainingRequestId}"></td>
                </tr>
                <tr>
                  <td> <span class="glyphicon glyphicon-pencil"></span>
                   ${ntr.requestTrainingModuleScope} </td>
                </tr>
                <tr>
                  <td> <span class="glyphicon glyphicon-calendar"></span>
                    ${ntr.requestStartTime }</td>
                </tr>
                <tr>
                  <td><span class="glyphicon glyphicon-home"></span>
                    ${ntr.requestTrainingType }</td>
                </tr>
                <tr>
                  <td> <span class="glyphicon glyphicon-check"></span>
                    Approvals</td>
                </tr>
                <tr></tr>
                <tr>
                  <td> <span class="glyphicon glyphicon-asterisk"></span>
                   ${ntr.status}</td>
                  <!--Where the training is in development -->
                </tr>
              </table>
                <input id="select" name = "trainingRequestId" type="checkbox" class="selectBox" />

            </div>
            <!--card body end -->
          </div>
        </div>
        <!--end card -->
        </c:if>
</c:forEach>

      </div>
    </div>
    <!--End of New Request Box-->

    <!--Ongoing Request Box-->
    <div id="ongoingRequestBox" class="border">
      <!-- Insert orange requests here-->

      <div class="" style="margin-left: 7vw;">
       <c:forEach items="${trList}" var="tr">
        <c:if test="${tr.status > 0 && tr.status < 4}">
        <!-- 1 card -->
        <div class="portfolio-item cardSpacing" style="float:left">
          <div class="card h-100" id="card">
            <table>
              <td>
                <h3 align="left" style="margin-top: 0px">${tr.trainingRequestId} </h3>
              </td>
              <td>
                <!--card Drop down -->
                <div class="dropdown" align="right" style="margin-top: 0px" id="moreInfo">
                  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                    aria-haspopup="true"><span class="glyphicon glyphicon-th-list"></span>
                  </button>
                  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <li><a href="#"><span class="glyphicon glyphicon-pencil"></span>${tr.requestTrainingModuleScope }</a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-home"></span>${tr.requestTrainingType }</a></li>
                    <!--internal or vender -->
                    <li><a href="#"> <span class="glyphicon glyphicon-modal-window"></span> Training Mode</a></li>
                    <!--"mode" of training -->
                    <li><a href="#"><span>&#35;</span> Number of participants </a></li>
                    <!--Edit button 1 popover-->
                    <li> <button type="button" class="center-block" data-toggle="modal" data-target="#myModal">Edit</button></li>
                    </li>

                    <li role="separator" class="divider"></li>
                    <li><a href="#"><span class="glyphicon glyphicon-calendar"></span> Start Date and Time</a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-calendar"></span> End Date and Time </a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-time"> </span>Time Zone</a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-globe"></span> location </a></li>
                    <!--Where it is taking place if not online (IF ONLINE DONT SHOW)-->
                    <!--Edit button 1 popover-->
                    <li> <button type="button" class="center-block" data-toggle="modal" data-target="#myModal1">Edit</button></li>
                    </li>

                    <li role="separator" class="divider"></li>
                    <li><a href="#" data-toggle="modal" data-target="#Log" style="color: blue;"><span class="glyphicon glyphicon-list-alt"></span>
                        Log</a></li>

                  </ul>
                </div>
                <!--card Drop down end  -->
              </td>
            </table>

            <!--card body -->
            <div class="card-body pointer toProgress">
              <f:form id="selectTT" action="">
                <div class="card-body pointer toModal" onclick="submitTT()">
                <input type="hidden" id="ongoingId" value="${tr.trainingRequestId}">
               	<input type="hidden" id="ongoingStatus" value="${tr.status}"> 
              <table id="Info">
                <tr>
                  <td> <span class="glyphicon glyphicon-pencil"></span>
                    Training Module </td>
                </tr>
                <tr>
                  <td> <span class="glyphicon glyphicon-calendar"></span>
                    Start Date</td>
                </tr>
                <tr>
                  <td><span class="glyphicon glyphicon-home"></span>
                    Training Type</td>
                </tr>
                <tr>
                  <td> <span class="glyphicon glyphicon-check"></span>
                    Approvals</td>
                </tr>
                <tr></tr>
                <tr>
                  <td> <span class="glyphicon glyphicon-asterisk"></span>
                     ${tr.status}</td>
                  <!--Where the training is in development -->
                </tr>
              </table>
              </f:form>
			</div>
            </div>
            <!--card body end -->
          </div>
        </div>
        <!--end card -->
        </c:if>
		</c:forEach>

      </div>
    </div>
  </div>
  <!--End of ongoing request box-->
  <div style="padding-top: 7vh"></div>
  <footer id="footer">
    <div class="row*">
      <div class="col-xs-12">
        <p class="m-0" style="text-align:center;margin-top:15px;">&copy;Copyright 2017 Syntel INC. All
          rights
          reserved.
        </p>
      </div>
    </div>
  </footer>
  <!--End of whole request secion-->

</body>

</html>