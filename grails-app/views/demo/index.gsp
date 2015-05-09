<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
   
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">

    <title>Message Publisher</title>

    <!-- Bootstrap core CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  </head>

  <body>

    <div class="container">

      <form class="form-signin">
        <div class="row">
            <h2 class="form-signin-heading">Message Publisher</h2>
        </div>
        
        <div class="row">
          <label for="message" class="sr-only">Enter Message</label>
          <textarea rows="10" id="message" class="form-control" placeholder="Enter Message" required autofocus></textarea>
        </div>

        <div class="row">                
          <button id="submit" class="btn btn-lg btn-primary btn-block" type="submit">Send</button>
        </div>  
      </form>

    </div> <!-- /container -->

    <script>
      $("#submit").click(function (event) {
          event.preventDefault(); 
          var message = $("#message").val();
          var isJson = true

          try {
               var json = jQuery.parseJSON(message)         
          } catch(err) {
               isJson = false;
          } 
          
          if(!isJson || typeof jQuery.parseJSON(message) != 'object') {
              alert ('Error: Message must be a valid JSON. Validate at http://jsonlint.com/');
              return;
          }
          
          $.ajax({
              url: "demo/postMessage",
              type:"post",
              dataType: 'json',
              data: message,
              success: function(data) {
                console.log(data); 
               },
               error: function(xhr){
                alert(xhr.responseText); 
               }
          });
       }); 
      
    
    </script>
    
    <style>
        body {
          padding-top: 40px;
          padding-bottom: 40px;
          background-color: #eee;
        }

        .form-signin {
          max-width: 330px;
          padding: 15px;
          margin: 0 auto;
        }
        .form-signin .form-signin-heading,
        .form-signin {
          margin-bottom: 30px;
          text-align: center;
        }
        
        .form-signin .form-control {
          position: relative;
          height: auto;
          -webkit-box-sizing: border-box;
             -moz-box-sizing: border-box;
                  box-sizing: border-box;
          padding: 10px;
          font-size: 16px;
        }
        .form-signin .form-control:focus {
          z-index: 2;
        }
        .form-signin textarea {
          margin-bottom: 30px;
          border-bottom-right-radius: 0;
          border-bottom-left-radius: 0;
        }
        
    </style>
  </body>
</html>
