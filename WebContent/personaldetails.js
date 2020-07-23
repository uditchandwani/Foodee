/**
 * 
 */
if(document.readyState == 'loading')
{
	document.addEventListener('DOMContentLoaded', ready);
}
else
{
	ready();
}
function ready()
{
	var pincodeInputs = document.getElementsByClassName('input-pincode')
	for (var i = 0; i < pincodeInputs.length; i++) {
	 var input = pincodeInputs[i]
	 input.addEventListener('change', pincodeChanged)
	}
	
	var phoneInputs = document.getElementsByClassName('input-phone')
	for (var i = 0; i < phoneInputs.length; i++) {
	 var input = phoneInputs[i]
	 input.addEventListener('change', phoneChanged)
	}
	
}

function pincodeChanged(event)
{
	var input = event.target
	if(!(input.value>=452001 && input.value<=452020))
	{
		alert('Enter pincode between 452001 and 452020')
		input.value = 452001
	}
}

function phoneChanged(event)
{
	var input = event.target
	if(!(input.value>=1000000000 && input.value<=9999999999))
	{
		alert('Phone number must be of 10 digits')
	}
}