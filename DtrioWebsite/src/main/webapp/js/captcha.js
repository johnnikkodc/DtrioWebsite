const captcha = document.querySelector(".captcha"),
	reloadBtn = document.querySelector(".reload-btn"),
	inputField = document.querySelector(".input-area input"),
	checkBtn = document.querySelector(".check-btns"),
	statusTxt = document.querySelector(".status");
var btn = document.getElementById("sbutton");
//storing all captcha characters in array
let allCharacters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
	'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd',
	'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
	't', 'u', 'v', 'w', 'x', 'y', 'z', 0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

function getCaptcha() {
	for (let i = 0; i < 6; i++) { //getting 6 random characters from the array
		let randomCharacter = allCharacters[Math.floor(Math.random() * allCharacters.length)];
		captcha.innerText += ` ${randomCharacter}`; //passing 6 random characters inside captcha innerText
	}

}

getCaptcha(); //calling getCaptcha when the page open
//calling getCaptcha & removeContent on the reload btn click


reloadBtn.addEventListener("click", () => {
	removeContent();
	getCaptcha();
});
checkBtn.addEventListener("click", e => {

	statusTxt.style.display = "block";
	let inputVal = inputField.value.split('').join(' ');
	if (inputVal == captcha.innerText) { //if captcha matched
		statusTxt.style.color = "#4db2ec";
		statusTxt.innerText = "Successful!";
		document.getElementById("login").action='../actions/LoginAction.jsp';
		document.getElementById("login").method='post';
		document.getElementById("login").submit();

	}
	else {
		statusTxt.style.color = "#ff0000";
		statusTxt.innerText = "Captcha not matched. Please try again!";


	}
});
function removeContent() {
	inputField.value = "";
	captcha.innerText = "";
	statusTxt.style.display = "none";

}


var input = document.getElementById("captchatext");

// Execute a function when the user presses a key on the keyboard
input.addEventListener("keypress", function(event) {
	// If the user presses the "Enter" key on the keyboard
	if (event.key === "Enter") {
		// Cancel the default action, if needed
		event.preventDefault();
		// Trigger the button element with a click
		document.getElementById("subtn").click();
	}
});