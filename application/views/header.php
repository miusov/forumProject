<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>forumProject</title>

  <!-- Bootstrap -->
  <link href="<?php echo base_url();?>css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="<?php echo base_url();?>css/bootstrap-theme.min.css">
  <link rel="stylesheet" href="<?php echo base_url();?>css/style.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
      <style>
        .modal form{
          display: flex;
          -webkit-justify-content: center; /* Safari */
          justify-content: center;
          margin-top: 50px;
        }
      </style>
    </head>
    <body>
      <div class="container-fluid">
        <nav class="navbar navbar-default" role="navigation">
          <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#">forumProject</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav">
                <li><a href="#">Рестораны</a></li>
                <li><a href="#">Кинотеатры</a></li>
                <li><a href="#" data-toggle="modal" data-target="#myModal" id="chat">Чат</a></li>
              </ul>
            </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->
        </nav>
      </div>

      <div class="modal fade" role="dialog" id="myModal">
        <div id="msglist" name="msglist">

        </div>
        <form>
          <label for="msg">Message</label>
          <input type="text" id="msg" name="msg">
          <input type="submit" name="send" value="Send" id="send">
        </form>
      </div>




      <script>
        $(document).ready(function() {

          $('#chat').click(function(){

           $.ajax({url:"locations/getMessages",
            type: "post",
            succees: function(data) {
              $("#msglist").html(data);
            }
            
          }); 
         })

        });
      </script>

