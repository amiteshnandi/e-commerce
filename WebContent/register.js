// Registration Form Validation
const form = document.getElementById("form");
const name = document.getElementById("name");
const username = document.getElementById("username");
const phone = document.getElementById("phone");
const email = document.getElementById("email");
const password = document.getElementById("password");

//add event
form.addEventListener("submit", (event) => {
	event.preventDefault();
	if(validate()){
		$.ajax({url: "http://localhost:8085/E-Commerce_Website/register", 
			type: 'post', 
			dataType: 'application/json', 
			data: $("#form").serialize()});
			//sendData();
			swal("Congratulations!", "Registration Successful", "success");
			resetForm();
	}
	
});


const successMsg = () => {
	let formCon = document.getElementsByClassName('form-control');
	for (var i = 0; i < formCon.length; i++) {
		if (formCon[i].className !== "form-control success") {
			return false;
		}
	}
	return true;
}

const resetForm = () => {
	$("#form")[0].reset();
	let formCon = document.getElementsByClassName('form-control');
	for (var i = 0; i < formCon.length; i++) {
		formCon[i].className = "form-control";
	}
	return true;
}



// more email validate
const isEmail = (emailVal) => {
	var atSymbol = emailVal.indexOf("@");
	if (atSymbol < 1) return false;
	var dotSymbol = emailVal.lastIndexOf(".");
	if (dotSymbol <= atSymbol + 3) return false;
	if (dotSymbol === emailVal.length - 1) return false;
	return true;
};

// define the validate function
const validate = () => {
	const nameVal = name1.value.trim();
	const usernameVal = username.value.trim();
	const phoneVal = phone.value.trim();
	const emailVal = email.value.trim();
	const passwordVal = password.value.trim();

	// validate Name
	if (nameVal === "") {
		setErrorMsg(name1, "Name cannot be left blank");
	} else if (nameVal.length <= 4) {
		setErrorMsg(name1, "Name must be of minimum 5 charanters");
	} else {
		setSuccessMsg(name1);
	}

	// validate username
	if (usernameVal === "") {
		setErrorMsg(username, "Username cannot be left blank");
	} else if (usernameVal.length <= 4) {
		setErrorMsg(username, "Username must be of minimum 5 charanters");
	} else {
		setSuccessMsg(username);
	}

	// validate phone
	if (phoneVal === "") {
		setErrorMsg(phone, "Phone number cannot be left blank");
	} else if (phoneVal.length != 10) {
		setErrorMsg(phone, "Not a valid phone number");
	} else {
		setSuccessMsg(phone);
	}

	// validate email
	if (emailVal === "") {
		setErrorMsg(email, "Email ID cannot be left blank");
	} else if (!isEmail(emailVal)) {
		setErrorMsg(email, "Not a valid Email");
	} else {
		setSuccessMsg(email);
	}

	// validate password
	if (passwordVal === "") {
		setErrorMsg(password, "Password cannot be left blank");
	} else if (passwordVal.length <= 5) {
		setErrorMsg(password, "Password must be of minimum 6 characters");
	} else {
		setSuccessMsg(password);
	}

	 return successMsg();
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

// Registration Form Validation
