
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>后台管理</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <!--
    Visual Admin Template
    http://www.templatemo.com/preview/templatemo_455_visual_admin
    -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/templatemo-style.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<!-- Left column -->
<div class="templatemo-flex-row">
    <jsp:include page="sidebar.jsp"></jsp:include>
    <!-- Main content -->
    <div class="templatemo-content col-1 light-gray-bg">
        <div class="templatemo-top-nav-container">
            <div class="row">
                <nav class="templatemo-top-nav col-lg-12 col-md-12">
                    <ul class="text-uppercase">
                        <li><a href="" class="active">Admin panel</a></li>
                        <li><a href="">Dashboard</a></li>
                        <li><a href="">Overview</a></li>
                        <li><a href="login.html">Sign in form</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="templatemo-content-container">
            <div class="templatemo-flex-row flex-content-row">
                <div class="templatemo-content-widget white-bg col-2">
                    <i class="fa fa-times"></i>
                    <div class="square"></div>
                    <h2 class="templatemo-inline-block">Visual Admin Template</h2><hr>
                    <p>Works on all major browsers. IE 10+. Visual Admin is <a href="http://www.templatemo.com/tag/admin" target="_parent">free responsive admin template</a> for everyone. Feel free to use this template for your backend user interfaces. Please tell your friends about <a href="http://www.templatemo.com" target="_parent">templatemo.com</a> website. You may <a href="http://www.templatemo.com/contact" target="_parent">contact us</a> if you have anything to say.</p>
                    <p>Nunc placerat purus eu tincidunt consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dapibus nulla quis risus auctor, non placerat augue consectetur. Fusce mi lacus, semper sit amet mattis eu.</p>
                </div>
                <div class="templatemo-content-widget white-bg col-1 text-center">
                    <i class="fa fa-times"></i>
                    <h2 class="text-uppercase">Maris</h2>
                    <h3 class="text-uppercase margin-bottom-10">Design Project</h3>
                    <%--<img src="${pageContext.request.contextPath}/image/bicycle.jpg" alt="Bicycle" class="img-circle img-thumbnail">--%>
                </div>
                <div class="templatemo-content-widget white-bg col-1">
                    <i class="fa fa-times"></i>
                    <h2 class="text-uppercase">Dictum</h2>
                    <h3 class="text-uppercase">Sedvel Erat Non</h3><hr>
                    <div class="progress">
                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
                    </div>
                    <div class="progress">
                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 50%;"></div>
                    </div>
                    <div class="progress">
                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
                    </div>
                </div>
            </div>
            <div class="templatemo-flex-row flex-content-row">
                <div class="col-1">
                    <div class="templatemo-content-widget orange-bg">
                        <i class="fa fa-times"></i>
                        <div class="media">
                            <div class="media-left">
                                <a href="#">
                                    <%--<img class="media-object img-circle" src="images/sunset.jpg" alt="Sunset">--%>
                                </a>
                            </div>
                            <div class="media-body">
                                <h2 class="media-heading text-uppercase">Consectur Fusce Enim</h2>
                                <p>Phasellus dapibus nulla quis risus auctor, non placerat augue consectetur.</p>
                            </div>
                        </div>
                    </div>
                    <div class="templatemo-content-widget white-bg">
                        <i class="fa fa-times"></i>
                        <div class="media">
                            <div class="media-left">
                                <a href="#">
                                    <%--<img class="media-object img-circle" src="images/sunset.jpg" alt="Sunset">--%>
                                </a>
                            </div>
                            <div class="media-body">
                                <h2 class="media-heading text-uppercase">Consectur Fusce Enim</h2>
                                <p>Phasellus dapibus nulla quis risus auctor, non placerat augue consectetur.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-1">
                    <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                        <i class="fa fa-times"></i>
                        <div class="panel-heading templatemo-position-relative"><h2 class="text-uppercase">User Table</h2></div>
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <td>No.</td>
                                    <td>First Name</td>
                                    <td>Last Name</td>
                                    <td>Username</td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>1.</td>
                                    <td>John</td>
                                    <td>Smith</td>
                                    <td>@jS</td>
                                </tr>
                                <tr>
                                    <td>2.</td>
                                    <td>Bill</td>
                                    <td>Jones</td>
                                    <td>@bJ</td>
                                </tr>
                                <tr>
                                    <td>3.</td>
                                    <td>Mary</td>
                                    <td>James</td>
                                    <td>@mJ</td>
                                </tr>
                                <tr>
                                    <td>4.</td>
                                    <td>Steve</td>
                                    <td>Bride</td>
                                    <td>@sB</td>
                                </tr>
                                <tr>
                                    <td>5.</td>
                                    <td>Paul</td>
                                    <td>Richard</td>
                                    <td>@pR</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div> <!-- Second row ends -->
            <div class="templatemo-flex-row flex-content-row templatemo-overflow-hidden"> <!-- overflow hidden for iPad mini landscape view-->
                <div class="col-1 templatemo-overflow-hidden">
                    <div class="templatemo-content-widget white-bg templatemo-overflow-hidden">
                        <i class="fa fa-times"></i>
                        <div class="templatemo-flex-row flex-content-row">
                            <div class="col-1 col-lg-6 col-md-12">
                                <h2 class="text-center">Modular<span class="badge">new</span></h2>
                                <div id="pie_chart_div" class="templatemo-chart"></div> <!-- Pie chart div -->
                            </div>
                            <div class="col-1 col-lg-6 col-md-12">
                                <h2 class="text-center">Interactive<span class="badge">new</span></h2>
                                <div id="bar_chart_div" class="templatemo-chart"></div> <!-- Bar chart div -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="text-right">
                <div class="button">欢迎报考长沙理工大学</div>
                <p>Copyright &copy; 2019 Company Name
                    | Designed by <a href="http://www.templatemo.com" target="_parent">张鑫</a></p>
            </footer>
        </div>
    </div>
</div>

<!-- JS -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
<script src="${pageContext.request.contextPath}/js/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->
<script src="https://www.google.com/jsapi"></script> <!-- Google Chart -->
<script>
    /* Google Chart
     -------------------------------------------------------------------*/
    // Load the Visualization API and the piechart package.
    google.load('visualization', '1.0', {'packages':['corechart']});

    // Set a callback to run when the Google Visualization API is loaded.
    google.setOnLoadCallback(drawChart);

    // Callback that creates and populates a data table,
    // instantiates the pie chart, passes in the data and
    // draws it.
    function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
            ['Mushrooms', 3],
            ['Onions', 1],
            ['Olives', 1],
            ['Zucchini', 1],
            ['Pepperoni', 2]
        ]);

        // Set chart options
        var options = {'title':'How Much Pizza I Ate Last Night'};

        // Instantiate and draw our chart, passing in some options.
        var pieChart = new google.visualization.PieChart(document.getElementById('pie_chart_div'));
        pieChart.draw(data, options);

        var barChart = new google.visualization.BarChart(document.getElementById('bar_chart_div'));
        barChart.draw(data, options);
    }

    $(document).ready(function(){
        if($.browser.mozilla) {
            //refresh page on browser resize
            // http://www.sitepoint.com/jquery-refresh-page-browser-resize/
            $(window).bind('resize', function(e)
            {
                if (window.RT) clearTimeout(window.RT);
                window.RT = setTimeout(function()
                {
                    this.location.reload(false); /* false to get page from cache */
                }, 200);
            });
        } else {
            $(window).resize(function(){
                drawChart();
            });
        }
    });

</script>
<script type="text/javascript" src="js/templatemo-script.js"></script>      <!-- Templatemo Script -->

</body>
</html>
