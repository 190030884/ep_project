function printError(elemId, hintMsg) {
    document.getElementById(elemId).innerHTML = hintMsg;
}
function validateSignup() {
    var name = document.getElementById("name").value;
    var email = document.getElementById("email").value;
    var pass = document.getElementById("pass").value;
    var re_pass = document.getElementById("re_pass").value;
    var signup = document.getElementById("signup").value;
    var isnameErr = true;
    var isemailErr = true;
    var ispassErr = true;
    var isre_passErr = true;
    
    if(!name) {
        printError("nameErr", "Please enter your name");
    } else {
        var regex = /^[a-zA-Z\s]+$/;                
        if(!regex.test(name)) {
            printError("nameErr", "Please enter a valid name");
        } 
    else{
      printError("nameErr", "");
      isnameErr = false;
    }
    }

    if (!email) {
      printError("emailErr", "Please enter email address"); 
    } else {
      var regex = /^\S+@\S+\.\S+$/;
      if(!regex.test(email)) {
         printError("emailErr", "Please enter a valid email address");
      } else{
              printError("emailErr", "");
        isemailErr = false;
          }
    }
    
    if (!pass) {
      printError("passErr", "Please enter password");  
    } else {
      var regex = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/;
      if(!regex.test(pass)) {
        printError("passErr", "Please enter a valid password");
      } else {
        printError("passErr", "");
        ispassErr = false;
      }
        
    }

    if(!re_pass){
        printError("re_passErr", "please re-enter password");
      } else{
        
        if(pass!=re_pass){
          printError("re_passErr", "Password doesn't match");
        } else{
          printError("re_passErr","");
          isre_passErr= false;
        }

        
      }
    }