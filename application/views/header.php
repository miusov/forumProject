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
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

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
                <li><a href="#" data-toggle="modal" id="chat">Чат</a></li>
              </ul>
            </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->
        </nav>
      </div>

      <!-- Modal -->
      <div class="modal fade" role="dialog" id="mymodal">

        <div class="modal-dialog">

          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header" style="padding:10px 20px;">
              <button type="button" class="close" data-dismiss="modal">&times;</button>

            </div>
            <form role="form" method="post">
              <label for="msg">Message </label>
              <input type="text" id="msg" name="msg">
              <input type="submit" value="Отправить" id="send" name="send">
            </form>
            <div class="modal-body" style="padding:40px 50px 10px 50px;">
              <div id="msglist" name="msglist">
              </div>
              <div class="modal-footer">
              </div>
            </div>
          </div>
        </div>
      </div>


      <script>
        $(document).ready(function() {
          $('#chat').click(function(){
            $.ajax({url:"<?php echo base_url(); ?>index.php/Locations/getMessages/",
              type: "post",
              success: function(data) {
                $("#msglist").html(data);
              }
            }); 
            $('#mymodal').modal('show');
          });

          $('#send').click(function() {
            msg=$('#msg').val();
            $.ajax({
              url:"<?php echo base_url(); ?>index.php/Locations/sendMessage/"+msg,
              type:'post',
              success: function(data) {
                $('#mymodal').modal('show');
              },
              error:function() {
                alert('error');
              }
            });
          });
        });
      </script>

