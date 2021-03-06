function printError(elemId, hintMsg) {
    document.getElementById(elemId).innerHTML = hintMsg;
}
function validateSignin() {
    var name = document.getElementById("name").value;
    var pass = document.getElementById("pass").value;
    var signin = document.getElementById("signin").value;
    var isnameErr = true;
    var ispassErr = true;
    
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

    }