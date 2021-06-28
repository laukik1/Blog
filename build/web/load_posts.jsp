<%@page import="com.javaProject.entities.User"%>
<%@page import="com.javaProject.dao.UserDao"%>
<%@page import="com.javaProject.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.javaProject.entities.Post"%>
<%@page import="com.javaProject.dao.PostDao"%>
<%@page import="com.javaProject.helper.ConnectionProvider"%>

<div class="row">

<%
    
    User u =(User)session.getAttribute("currentUser");
    
    Thread.sleep(1000);
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    
    int cid = Integer.parseInt(request.getParameter("cid"));
    List<Post> posts = null;
    if (cid == 0){
    posts = d.getAllPosts();
    }else{
        posts = d.getPostByCatId(cid);
    }
    
    if(posts.size()==0)
    {
        out.println("<h3 class='display-3 text-center'>No Posts in this category...</h3>");
        return;
    }
for(Post p : posts){

%>

<div class="col-md-6 mt-2">
    <div class="card">
        <img src="blog_pics/<%= p.getpPic() %>" class="card-img-top" alt="...">
        <div class="card-body">
            
            <b><%= p.getpTitle() %></b>
            <p><%= p.getpContent() %></p>
            <!--<pre>< %= p.getpCode() % ></pre>-->
            
        </div>
            <div class="card-footer text-center">
                <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-primary btn-sm">Read More...</a>
<%
                                 LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                                                             
                             %>
                             <a href="#!" onclick="doLike(<%= p.getPid() %>,<%= u.getId() %>)" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countLikeOnPost(p.getPid()) %></span></a>
                             <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i><span>3</span></a>
            </div>
    </div>
</div>

<%
    }
    %>
    
</div>