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
	var removeCartItemButtons = document.getElementsByClassName('cart-remove-btn')
	for (var i = 0; i < removeCartItemButtons.length; i++) {
		var button = removeCartItemButtons[i]
		button.addEventListener('click', removeCartItem)
	}

	var addToCartButtons = document.getElementsByClassName('btn-add');
	for(var i=0;i<addToCartButtons.length;i++)
	{
			var button = addToCartButtons[i];
			button.addEventListener('click', addToCartClicked);
	}	

	var quantityInputs = document.getElementsByClassName('cart-quantity-input')
	for (var i = 0; i < quantityInputs.length; i++) {
	 var input = quantityInputs[i]
	 input.addEventListener('change', quantityChanged)
	}

	document.getElementsByClassName('btn-purchase')[0].addEventListener('click',purchaseClicked)
}

function purchaseClicked(event) {
	alert('Please log in first')
}

function removeCartItem(event)
{
	var buttonClicked = event.target
			buttonClicked.parentElement.parentElement.remove()
			updateCartTotal()
}

function quantityChanged(event)
{
	var input = event.target
	if(isNaN(input.value)|| input.value<=0)
	{
		input.value = 1
	}
	updateCartTotal()
}

function addToCartClicked(event) {
	var button=event.target;
	var shopItem = button.parentElement.parentElement.parentElement;
	var title = shopItem.getElementsByClassName('item-title')[0].innerText;
	var price = shopItem.getElementsByClassName('item-price')[0].innerText;
	var imageSrc = shopItem.getElementsByClassName('item-img')[0].src;
	addItemToCart(title, price, imageSrc)
	updateCartTotal()
}
function addItemToCart(title, price, imageSrc)
{
	var cartRow = document.createElement('tr')
	cartRow.classList.add('cart-row')
	var cartItems = document.getElementsByClassName('cart-table')[0]
	var cartItemNames = cartItems.getElementsByClassName('cart-item-title')
	for(var i=0;i<cartItemNames.length;i++)
	{
		if(cartItemNames[i].innerText == title)
		{
			alert('This item is already present in te cart')
			return
		}
	}
	var cartRowContents = `
			<tr class="cart-row">
				<td class="cart-column"><img class="cart-item-img" src="${imageSrc}" width="100" height="100"></td>
				<td class="cart-item-title-1"><span class="cart-item-title">${title}</span></td>
				<td class="cart-item-price">${price}</td>
				<td class="cart-item-quantity"><input type="number" value="1" class="cart-quantity-input">
					<button class="cart-remove-btn">Remove</button></td>
			</tr>`
	cartRow.innerHTML = cartRowContents
	cartItems.append(cartRow)
	cartRow.getElementsByClassName('cart-remove-btn')[0].addEventListener('click', removeCartItem)
	cartRow.getElementsByClassName('cart-quantity-input')[0].addEventListener('change', quantityChanged)	
}

function updateCartTotal()
{
	var cartItemContainer = document.getElementsByClassName('cart-table')[0]
	var cartRows = cartItemContainer.getElementsByClassName('cart-row')
	var total = 0
	for(var i=0;i<cartRows.length;i++)
	{
		var cartRow = cartRows[i]
		var priceElement = cartRow.getElementsByClassName('cart-item-price')[0]
		var quantityElement = cartRow.getElementsByClassName('cart-quantity-input')[0]
		var price = parseFloat(priceElement.innerText.replace(' Rs',''))
		var quantity = quantityElement.value
		total = total + (price*quantity)
	}
	document.getElementsByClassName('cart-total-price')[0].innerText = total+' Rs'
}