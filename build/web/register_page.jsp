
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <style>
            .banner-background{
                  clip-path: polygon(30% 0, 100% 0, 100% 72%, 70.5% 100%, 0 100%, 0 25%);          
            }
        </style>

    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        <main class="d-flex align-items-center primary-background-cl banner-background" style="padding-bottom:5px;">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <br>
                                <p>Register here</p>
                            </div>
                            <div class="card-body">
                                <form id="reg-form" action="RegisterServlet" method="POST">
<!--                                <div class="mb-3">
                                  <label for="exampleInputEmail1" class="form-label">User Name</label>
                                  <input type="text" class="form-control" aria-describedby="emailHelp">
                                  
                                </div>-->
                                    <div class="mb-3">
                                        <label for="exampleInputtext1" class="form-label">User Name</label>
                                        <input name="user_name" type="text" class="form-control" placeholder=" Enter name" aria-label="Username">
                                    </div>

                                <div class="mb-3">
                                  <label for="exampleInputEmail1" class="form-label">Email address</label>
                                  <input name="user_email" type="email" class="form-control" placeholder=" Enter email" id="exampleInputEmail1" aria-describedby="emailHelp">
                                  <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>

                                <div class="mb-3">
                                  <label for="exampleInputPassword1" class="form-label">Password</label>
                                  <input name="user_password" type="password" class="form-control" placeholder=" Password" id="exampleInputPassword1">
                                </div>

                                    <label for="gender">Select Gender</label>
                                    <div class="form-check">
                                        <input class="form-check-input" value="male" type="radio" name="gender" id="flexRadioDefault1">
                                        <label class="form-check-label" for="flexRadioDefault1">
                                          Male
                                        </label>
                                    </div>
                                      <div class="form-check">
                                          <input class="form-check-input" value="female" type="radio" name="gender" id="flexRadioDefault2" checked>
                                        <label class="form-check-label" for="flexRadioDefault2">
                                          Female
                                        </label>
                                      </div>
                                    
                                    <div class="form-group">
                                        <textarea name="about" class="form-control" rows="5" placeholder="Write about yourself.."></textarea>
                                    </div>
                                    
                                <div class="mb-3 form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                  <label class="form-check-label" for="exampleCheck1">Agree terms & conditions</label>
                                </div>
                                    <br>
                                    <div class="container text-center" id="loader" style="display : none;">
                                        <span class="fa fa-refresh fa-spin fa-3x"></span>
                                        <h4>Please wait....</h4>
                                    </div>
                                        
                                    <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                              </form>
                            </div>
                        </div>
                            
                    </div>
                </div>
            </div>
        </main>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function(){
                console.log("loaded...")
                
                $('#reg-form').on('submit',function(event){
                    event.preventDefault();
                    
                    let form=new FormData(this);
                    
                    $('#submit-btn').hide();
                    $('#loader').show();
                    //send data to register servelet
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function(data, textStatus, jqXHR){
                            console.log(data)
                             $('#submit-btn').show();
                             $('#loader').hide();
                             
                             if(data.trim()==='done')
                             {
                             swal({
                                    title: "Good job!",
                                    text: "Registered Successfully!",
                                    icon: "success",
                                    button: "We are redirecting to login page !",
                                })
                                        .then((value) => {
                                        window.location = "login_page.jsp"
                                    });
                                  
                              }else
                                {
                                    swal(data);
                                }
                        },
                        error: function(jqXHR, textStatus, errorThrown){
                            console.log(jqXHR)
                            $('#submit-btn').show();
                             $('#loader').hide();
                             swal({
                                    title: "Error !",
                                    text: "Something went wrong.. try again!",
                                    icon: "warning",
                                    button: "Aww yiss!",
                                  });
                        },
                        processData : false,
                        contentType : false
                    })
                    
                });
                
    });
            
        </script>
 
    </body>
</html>
