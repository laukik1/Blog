<%@page import="java.util.ArrayList"%>
<%@page import="com.javaProject.entities.Category"%>
<%@page import="com.javaProject.helper.ConnectionProvider"%>
<%@page import="com.javaProject.dao.PostDao"%>
<%@page import="com.javaProject.entities.Message"%>
<%@page import="com.javaProject.entities.User" %>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User)session.getAttribute("currentUser");
    
    if (user==null)
    {
        response.sendRedirect("login_page.jsp");
    }
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!--navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
                <div class="container-fluid">
                    <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span>JavaProject</a>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                      <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#"><span class="fa fa-bank"></span>Home</a>
                      </li>

                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                          <span class="fa fa-bars"></span>  
                          Categories
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                          <li><a class="dropdown-item" href="#">Programming Language</a></li>
                          <li><a class="dropdown-item" href="#">Project Implementation</a></li>
                          <li><hr class="dropdown-divider"></li>
                          <li><a class="dropdown-item" href="#">Data Structure</a></li>
                        </ul>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-address-book"></span>Contact</a>
                      </li>
                      
                      <li class="nav-item">
                        <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#add-post-modal"><span class="fa fa-asterisk"></span>Do Post</a>
                      </li>
                      
                    </ul>
                      <ul class="navbar-nav mr-right"> 
                      <li class="nav-item">
                          <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#profile-modal"><span class="fa fa-user-circle"></span><%= user.getName() %></a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span>Logout</a>
                      </li>
                      </ul>
                  </div>
                </div>
              </nav>
         <!--end of navbar-->
         
                            <%
                            Message m = (Message)session.getAttribute("msg");
                            if(m!=null)
                            {
                            %>
                            
                            <div class="alert <%= m.getCssClass()%> " role="alert">
                                <%= m.getContent() %>
                             </div>
                            
                            <%
                                session.removeAttribute("msg");
                                }
                                %>
        
          <!--main body of the page-->                      
          
          <main>
              <div class="container">
                  <div class="row mt-4">
                      <!--first col-->
                      <div class="col-md-4">
                          <!--categories-->
                          <div class="list-group">
                              <a href="#" onclick="getPosts(0, this)" class="c-link list-group-item list-group-item-action active" aria-current="true">
                              All Posts
                            </a>
                            <%
                                PostDao d = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = d.getAllCategories();
                                for(Category cc : list1)
                                {
                                %>
                                <a href="#" onclick="getPosts(<%= cc.getCid() %>, this)" class="c-link list-group-item list-group-item-action"><%= cc.getName() %></a>
                                <%
                                    }
                                %>
                            </div>
                      </div>
                      <!--second col-->
                      <div class="col-md-8">
                          <!--posts-->
                          <div class="container text-center" id="loader">
                              <i class="fa fa-refresh fa-4x fa-spin"></i>
                              <h3 class="mt-2">Loading...</h3>
                          </div>
                          
                          <div class="container-fluid" id="post-container">
                              
                          </div>
                      </div>
                  </div>
              </div>
          </main>
          
          <!--end of main body-->
                                
         <!--profile modal-->
         
         <!-- Button trigger modal -->
<!--            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#profile-modal">
              Launch demo modal
            </button>-->

            <!-- Modal -->
            <div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header primary-background text-white text-center">
                      
                    <h5 class="modal-title" id="exampleModalLabel">Java Project</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body container text-center">
                      <img src="pics/<%= user.getProfile() %>" class="img-fluid" style="border-radius: 50%; max-width:100px; ">
                      <br>
                   <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName() %></h5>
                   
                   <!--details-->
                   <div id="profile-details">
                   <table class="table table-hover">
                       
                      <tbody>
                        <tr>
                          <th scope="row">ID :</th>
                          <td><%= user.getId() %></td>
                         
                        </tr>
                        <tr>
                          <th scope="row">Email :</th>
                          <td><%= user.getEmail() %></td>
                         
                        </tr>
                        <tr>
                          <th scope="row">Gender :</th>
                          <td><%= user.getGender() %></td>
                        </tr>
                        <tr>
                          <th scope="row">Status :</th>
                          <td><%= user.getAbout() %></td>
                        </tr>
                        <tr>
                          <th scope="row">Registered on :</th>
                          <td><%= user.getDateTime().toString() %></td>
                        </tr>
                      </tbody>
                    </table>
                   </div>
                        <!--profile details-->
                        
                        <div id="profile-edit" style="display: none;">
                            <h4 class="mt-2">Please Edit Carefully</h4>
                            <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                <table class="table table-hover">
                                    <tr>
                                        <td>ID :</td>
                                        <td><%= user.getId() %></td>
                                    </tr>
                                    <tr>
                                        <td>Name :</td>
                                        <td><input type="text" class="form-control" name="user_name" value="<%= user.getName() %>"></td>
                                    </tr>
                                    <tr>
                                        <td>Email :</td>
                                        <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail() %>"></td>
                                    </tr>
                                    <tr>
                                        <td>Password :</td>
                                        <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword() %>"></td>
                                    </tr>
                                    <tr>
                                        <td>Gender :</td>
                                        <td><%= user.getGender().toUpperCase() %></td>
                                      </tr>
                                      <tr>
                                          <td>About :</td>
                                          <td>
                                              <textarea rows="3" class="form-control" name="user_about">
                                                  <%= user.getAbout() %>
                                              </textarea>
                                          </td>
                                      <tr>
                                          <td>Profile Pic :</td>
                                          <td>
                                              <input type="file" name="image" class="form-control">
                                          </td>
                                      </tr>
                                </table>
                                              <div class="container">
                                                  <button type="submit" class="btn btn-outline-primary">Save</button>
                                              </div>
                            </form>
                            
                        </div>
                        
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                  </div>
                </div>
              </div>
            </div>
         
         <!--end of profile modal-->
         
         <!--post modal-->
         
         <!-- Button trigger modal -->
            

            <!-- Modal -->
            <div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Provide the post details..</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                      <form id="add-post-form" action="AddPostServlet" method="post">
                          <div class="form-group">
                              <select class="form-control" name="cid">
                              <option selected disabled>---Select Category---</option>
                              <%
                                  PostDao postd = new PostDao(ConnectionProvider.getConnection()) ;
                                  ArrayList<Category> list = postd.getAllCategories();
                                  for(Category c:list)
                                  {
                              %>
                              <option value="<%= c.getCid() %>"><%= c.getName() %></option>
                              
                              
                              <% 
                                  }
                                %>
                          </select>
                          </div>
                          <br>
                          <div class="form-group">
                              <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control" />
                          </div>
                          <br>
                          <div class="form-group">
                              <textarea name="pContent" class="form-control" placeholder="Enter your content" style=" height: 100px;"></textarea>
                          </div>
                          <br>
                          <div class="form-group">
                              <textarea name="pCode" class="form-control" placeholder="Enter your program (if any)" style=" height: 100px;"></textarea>
                          </div>
                          <div class="form-group">
                              <label>Select pic</label>
                              <br>
                              <input type="file" name="pic" \>
                          </div>
                      
                  </div>
                  <div class="modal-footer">
                    <button type="submit" class="btn btn-outline-primary">Post</button>
                    <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                  </div>
               </form>
                </div>
              </div>
            </div>
         
         <!--end of post modal-->
         
     <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
            
        <script>
            $(document).ready(function(){
                
                let editStatus=false;
                $('#edit-profile-button').click(function(){
//                    alert("button clicked")
                    if(editStatus == false)
                    {
                    $("#profile-details").hide()
                    
                    $("#profile-edit").show();
                    
                    editStatus =true;
                    
                    $(this).text("Back")
                    
                    }else
                    {
                        $("#profile-details").show()
                    
                        $("#profile-edit").hide();
                        
                        editStatus =false;
                        
                        $(this).text("Edit")
                    }
                })
            });
        </script>
        <!--now add post js-->
        <script>
            $(document).ready(function (e){
                $("#add-post-form").on("submit", function(event){
                    //this code gets called when form is submitted
                    event.preventDefault();
                    console.log("you have clicked on submit")
                    let form = new FormData(this);
                    
                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function(data, textStatus, jqXHR){
                            //success
                            console.log(data);
                            if(data.trim() == 'done')
                            {
                                swal("Good job!", "Saved Successfully!", "success");
                            }else
                            {
                                swal("Error!", "Something went wrong, try again!", "error");
                            }
                        },
                        error: function(jqXHR, textStatus, errorThrown){
                            //error
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>
        
        <!--loading post using ajax-->
        <script>
            
            function getPosts(catId, temp){
                $("#loader").show();
                $("#post-container").hide()
                
                $(".c-link").removeClass('active')
                
                $.ajax({
                   url : "load_posts.jsp",
                   data : {cid : catId},
                   success : function(data, textStatus, jqXHR){
                           console.log(data);
                           $("#loader").hide();
                           $("#post-container").show();
                           $('#post-container').html(data);
                           $(temp).addClass('active')
                       }
               })
            }
            $(document).ready(function (e){
                
                let allPostRef = $('.c-link')[0]
               getPosts(0, allPostRef)
               
            })
        </script>
    </body>
</html>
