let firstCategory = true
let shoppingCart = []

window.addEventListener('message', function (event) {
    var item = event.data;
    
	if (item.clear == true) {
        $(".lits").empty();
		$(".select-box").empty()
    }
    
	if (item.display == true) {
		firstCategory = true 

        $("body").fadeIn("slow");
    }

    if (item.display == false) {
        $("body").fadeOut(100);
    }

	if(item.categoryName !== undefined) {
		if(firstCategory) {
			$(".select-box").append(`
				<div class="boxselect" category="`+item.categoryName+`" onclick="showProductsFromCategory('`+item.categoryName+`')">
					<div class="min-box">
						<img src="assets/images/`+item.categoryName+`.svg"/>			
					</div>
					<p class="namebox">`+item.categoryName+`</p>			
				</div>
			`)

			showProductsFromCategory(item.categoryName)

			firstCategory = false 
			return;
		} 
		
		$(".select-box").append(`
			<div class="boxselect" category="`+item.categoryName+`"onclick="showProductsFromCategory('`+item.categoryName+`')">
				<div class="min-box">
					<img src="assets/images/`+item.categoryName+`.svg"/>			
				</div>
				<p class="namebox">`+item.categoryName+`</p>			
			</div>
		`)
	}

	if (item.name !== undefined) {
		$(".lits").append(`
			<div class="product" category="`+item.category+`" onclick="addToCart('`+item.name+`', '`+item.type+`', '`+item.label+`', '`+item.price+`', '`+item.category+`')">
				<p class="name-product">`+item.label+`</p>
				<img src="./assets/images/`+item.name+`.png" alt="">
				<p class="cost-product">`+item.price+`<span>€</span></p>
			</div>
		`);
	}
});

document.addEventListener('DOMContentLoaded', function () {
    $("body").hide();
});

function buyItem(item, category, amount, type, payment) {
    $.post('http://cloud_shop/buyItem', JSON.stringify({ item: item, category: category, amount: amount, type: type, payment: payment}));
}

function checkOutCart(payment) {
	for (var key in shoppingCart) {
		const item = key

		if (shoppingCart[key].count > 0 ) {
			buyItem(item, shoppingCart[key].category, shoppingCart[key].count, shoppingCart[key].type, payment)
		}
	}

	shoppingCart = []
}

function showProductsFromCategory(category) {
	$( ".select-box" ).children().each(function( index ) {
		$(this).removeClass("selected")

		if($(this).attr("category") == category) {
			$(this).addClass("selected")
		}
	})

	$( ".lits" ).children().each(function( index ) {
		$(this).hide()

		const att = $(this).attr('category')

		if (att == category) {
			$(this).show()
		}
	});

	updateCart()
}

document.onkeydown = function(event) {
    let data = event || window.event;

	if (data.key == "Escape") {
        $("body").fadeOut(100);
		$.post('http://cloud_shop/exit')
	}
}

function updateCart() {
	let price = 0

	$(".basket-list").empty();

	for (var key in shoppingCart) {
		const item = key

		price += (shoppingCart[key].count * shoppingCart[key].price)

		if (shoppingCart[key].count > 0 ) {
			$(".basket-list").append(`
				<div class="panel-products">
					<div class="box-img">
						<img src="assets/images/`+item+`.png" alt="">
					</div>
						<p class="name-products-panel">`+shoppingCart[key].label+`</p>
						<p class="quantity-products-panel">X<span>`+shoppingCart[key].count+`</span></p>
						<div class="button-plus-minus">
							<button class="button-minus" onclick="RemoveOne('`+item+`')">-</button>
							<button class="button-plus" onclick="PlusOne('`+item+`')">+</button>
						</div>
						<img class="close-button" src="assets/images/close.svg" alt="" onclick="removeFromCart('`+item+`')">
						<div class="button-close">
						</div>
				</div>
			`)
		}
	}

	$(".gemeral-amount").html(price + '<span>€</span>')
}

function removeFromCart(itemName) {
	shoppingCart[itemName].count = 0

	updateCart()
}

function addToCart(itemName, itemType, itemLabel, itemPrice, category) {
	if (shoppingCart[itemName]) {
		shoppingCart[itemName].count += 1
	} else {
		shoppingCart[itemName] = {
			count: 1,
			type: itemType,
			label: itemLabel,
			price: itemPrice,
			category: category
		}
	}

	updateCart()
}


function PlusOne(itemName) {
	if (shoppingCart[itemName]) {
		shoppingCart[itemName].count += 1
		
		updateCart()
	} 
}

function RemoveOne(itemName) {
	if (shoppingCart[itemName]) {
		shoppingCart[itemName].count -= 1
				
		updateCart()
	} 
}