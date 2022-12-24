window.addEventListener('message', function (event) {
    var item = event.data;
    
	if (item.display == true) {
        $("body").fadeIn("slow");
    }

    if (item.display == false) {
        $("body").fadeOut(100);
    }

	if(item.data) {
		let data = JSON.parse(item.data)

		$(".balance").html(new Intl.NumberFormat('de-DE', { currency: 'EUR' }).format(data.bank) + '<span>€</span>')
		$(".iban").html('<span>DEINE IBAN:</span> ' + data.iban)
	}

	if(item.transactions) {
		let transactions = JSON.parse(item.transactions)

		$(".listtrancs").empty()


		transactions.forEach(value => {
			let amount = (value.amount).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');  // 12,345.67
			console.log(value.minus)

			if(value.minus) {
				amount = "<span>-</span>" + amount
			} else {
				amount = "<span>+</span>" + amount
			}

			$(".listtrancs").append(`
				<div class="panel">
					<div class="min-box">
						<svg class="icntrancs" width="21" height="21" viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M7.875 5.25L10.5 2.625L13.125 5.25" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
							<path d="M10.5 11.375L10.5 2.625" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
							<path d="M14.875 8.75H16.625C17.1082 8.75 17.5 9.14175 17.5 9.625V17.5C17.5 17.9832 17.1082 18.375 16.625 18.375H4.375C3.89175 18.375 3.5 17.9832 3.5 17.5V9.625C3.5 9.14175 3.89175 8.75 4.375 8.75H6.125" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
						</svg>								
					</div>
					<div class="text-column-trancs">
						<p class="type">`+value.transactionType+`</p>
						<p class="dateandtime">`+value.date+`</p>
					</div>
					<p class="ammounttrancs">`+ amount + ` <span>€</span></p>
				</div>
			`)
		});
	}
});

document.addEventListener('DOMContentLoaded', function () {
    $("body").hide();
});

function Transfer() {
	const iban = $("#iban").val()
	const amount = $("#amount").val()

	$.post('http://cloud_bank/transfer', JSON.stringify({ iban: iban, amount: amount}));
	Close()

	$("#amount").val("")
	$("#iban").val("")
}

function Close() {
	$("body").fadeOut(100);
	$.post('http://cloud_bank/exit')
}

document.onkeydown = function(event) {
    let data = event || window.event;

	if (data.key == "Escape") {
		Close()
	}
}

function Einzahlen() {
	const amount = $("#einzahlen").val()
    $.post('http://cloud_bank/einzahlen', JSON.stringify({ amount: amount}));
	Close()
	$("#einzahlen").val("")
}

function Auszahlen() {
	const amount = $("#auszahlen").val()
    $.post('http://cloud_bank/auszahlen', JSON.stringify({ amount: amount}));
	Close()
	$("#auszahlen").val("")
}