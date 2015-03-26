<%-- 
    Document   : staffMenu
    Created on : Mar 18, 2015, 9:58:43 PM
    Author     : Kevin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Room"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NyanCat HomeStay</title>

        <!-- Bootstrap -->
        <link rel="icon" href="${pageContext.request.contextPath}/img/logo2.png">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css"  rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/css/custom.css"  rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/css/font-awesome_4.0.3_css_font-awesome.css" rel="stylesheet" type="text/css"/>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <%List<Room> rooms = (List) session.getAttribute("allRoomList");        %> 

        <!-- Header and Navigation Bar-->
        <jsp:useBean id="loginStaff" scope="session" class="Entity.Staff" />
        <div class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">  
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">NyanCat HomeStay</a>
                </div>

                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-left">
                        <li><a href="../ReservationControl">Manage Reservation</a></li>
                        <li><a href="../RoomControl">Manage Room</a></li>
                        <li><a href="../StaffControl">Manage Staff</a></li>
                        <li><a href="managerControlPanel.jsp">Report</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a class="disabled sr-only-focusable">Welcome ${loginStaff.staffname}</a></li>
                        <li><a href="../LoginOut" data-toggle="modal">Logout</a></li>
                    </ul>
                </div><!-- .nav-collapse-->
            </div>
        </div> <!-- Navigation Bar End Here-->

        <div class="container">
            <section>
                <h1 class="page-header">Manage Room</h1>

                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th> ID</th>
                            <th> Room Number</th>
                            <th> Room Type</th>
                            <th> Available</th>

                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Room room : rooms) {%>
                        <tr>
                            <td><%=room.getId()%></td>
                            <td><%=room.getRoomnumber()%></td>
                            <td><%=room.getRoomtype().getDescription()%></td>
                            <td><%=room.getAvailable()%></td>
                            <td style="text-align: left">
                                <form action="updateRoom.jsp?id=<%=room.getId()%>" method="post">
                                    <button name="action" value="Update" class="btn btn-primary">Update</button>
                                    <%if (room.getAvailable()) {%>
                                    <button name="action" value="Delete" class="btn btn-danger">Delete</button>
                                    <%}%>
                                </form>
                            </td>
                        </tr>
                        <% }%>
                    </tbody>

                </table>

                <a href="addRoom.jsp" class="btn btn-primary pull-right">Add Room</a> 
                <h2 class="red" id="h2message"><%= String.valueOf(session.getAttribute("message"))%></h2>
            </section>
        </div>
        <!--Footer-->
        <hr>
        <footer class="container">
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; NyanCat HomeStay 2015</p>
                </div>
            </div>
            <!-- /.row -->
        </footer>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="${pageContext.request.contextPath}/js/jquery_1.11.2_jquery.min.js" type="text/javascript"></script>  
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/formValidation.js"></script>
    </body>
</html>
