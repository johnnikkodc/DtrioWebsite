var npass = document.getElementById("password");
var strengthbar = document.getElementById("meter");
//var butn = document.getElementById("subtn").disabled = true;
var html = "";
var a, b, c, d, e;
var number = document.getElementById("number");
var email_add = document.getElementById("email");
var names = document.getElementById("iname");
var names2 = document.getElementById("pname");
var display = document.getElementsByClassName("textbox")[0];
var display2 = document.getElementsByClassName("numbox")[0];
var display3 = document.getElementsByClassName("embox")[0];
var display4 = document.getElementsByClassName("nabox")[0];
var display5 = document.getElementsByClassName("nabox2")[0];


//Check Password
npass.addEventListener("keyup", function() {
	checkpassword(npass.value);
});

function checkpassword(password) {
	var strength = 0;


	if (password.length < 8) {
		a = "Minimum 8 characters is required";

	}
	else {
		a = ""
	}
	if (password.match(/[a-z]+/)) {
		strength += 1;
		b = "";

	} else {
		b = "Password must contain  a lowercase character";
	}
	if (password.match(/[A-Z]+/)) {
		strength += 1;
		c = "";
	} else {
		c = "Password must contain  uppercase character";
	}
	if (password.match(/[0-9]+/)) {
		strength += 1;
		d = "";
	} else {
		d = "Password must contain a number";
	}
	if (password.match(/[$@#&!]+/)) {
		strength += 1;
		e = "";

	} else {
		e = "Password must contain a special character";
	}
	var out = a + "<br>" + b + "<br>" + c + "<br>" + d + "<br>" + e;
	display.innerHTML = out;





	switch (strength) {
		case 0:
			$strengthbar.style.width="0";
			break;

		case 1:
			strengthbar.style.width="50";
			break;

		case 2:
			strengthbar.style.width="50";
			break;

		case 3:
			strengthbar.style.width="75";
			break;

		case 4:
			strengthbar.style.width="1000";
			display.innerHTML = "<span style='color: green;'>Password Strength: Strong</span>";
			document.getElementById("subtn").disabled = false;
			break;
	}
}
function removepass(password) {
	npass.value = "";
	display.innerHTML = "";
}

//Check Number
number.addEventListener("focusout", function() {
	checknumber(number.value);
});

function checknumber(num) {
	var front = num.substring(0, 2);
	if (num.length == 11 && !num.match(/[a-z]+/) && front == "09") {
		display2.innerHTML = "";



	} else {
		number.value = "";
		number.focus();
		display2.innerHTML = "<span style='color: #F04747;'>Please enter a valid phone number</span>";


	}

}

//Check Email
email_add.addEventListener("focusout", function() {
	checkemail(email_add.value);
});
function checkemail(em) {
	var regexEmail = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if (regexEmail.test(em)) {
		display3.innerHTML = "";



	} else {
		email_add.value = ""
		email_add.focus();
		display3.innerHTML = "<span style='color: #F04747;'>Invalid Email Address!</span>";

	}

}

//Check Name
names.addEventListener("focusout", function() {
	checkname(names.value);
});
names2.addEventListener("focusout", function() {
	checkname2(names2.value);
});
function checkname(n) {
	var regexName = /^[A-Za-z\s]+$/;
	if (regexName.test(n)) {
		display4.innerHTML = "";
		



	} else {
		names.value = ""
		names.focus();
		display4.innerHTML = "<span style='color: #F04747;'>Numerical and special characters are not allowed!</span>";

	}

}
function checkname2(n) {
	var regexName = /^[A-Za-z\s]+$/;
	if (regexName.test(n)) {
		display5.innerHTML = "";
		



	} else {
		names2.value = ""
		names2.focus();
		display5.innerHTML = "<span style='color: #F04747;'>Numerical and special characters are not allowed!</span>";

	}

}



