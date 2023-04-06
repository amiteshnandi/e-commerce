/*
var status = document.getElementById("status").value;
console.log(status);
if(status == "invalid"){
    swal("Sorry", "Wrong Username or Password", "error");
    $("#form")[0].reset();
}

/*
// Login Form Validation
const username = document.getElementById("username");
const password = document.getElementById("password");

//add event
form.addEventListener("submit", (event) => {
  // event.preventDefault();
  validate();
});
*/

/* 
const sendData = (usernameVal, sRate, count) => {
    if (sRate === count) {
        // alert("Registration Successful!");
        swal("Welcome! " + usernameVal, "Login Successful!", "success");
    }
};

const successMsg = (usernameVal) => {
    let formCon = document.getElementsByClassName('form-control');
    var count = formCon.length - 1;
    for (var i = 0; i < formCon.length; i++){
        if (formCon[i].className === "form-control success") {
            var sRate = 0 + i;
            console.log(sRate);
            sendData(usernameVal, sRate, count);
        } else {
            return false;
        }
    }
}



// define the validate function
const validate = () => {
  const usernameVal = username.value.trim();
  const passwordVal = password.value.trim();

  // validate username
  if (usernameVal === "") {
    setErrorMsg(username, "Username cannot be left blank");
  } else if (usernameVal.length <= 4) {
    setErrorMsg(username, "Username must be of minimum 5 charanters");
  } else {
    setSuccessMsg(username);
  }

  // validate password
  if (passwordVal === "") {
    setErrorMsg(password, "Password cannot be left blank");
  } else if (passwordVal.length <= 5) {
    setErrorMsg(password, "Password must be of minimum 6 characters");
  } else {
    setSuccessMsg(password);
  }
    
    // successMsg(usernameVal);
};

function setErrorMsg(input, errormsgs) {
  const formControl = input.parentElement;
  const small = formControl.querySelector("small");
  formControl.className = "form-control error";
  small.innerText = errormsgs;
}

function setSuccessMsg(input) {
  const formControl = input.parentElement;
  formControl.className = "form-control success";
}

// Login Form Validation
*/
