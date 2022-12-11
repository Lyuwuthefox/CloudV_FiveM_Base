var inCar = false;

window.addEventListener('message', function(event) {
    var data = event.data;
    
    if(data.action == "setState") {
        if(data.state) {
            $(".Wheel-Core").addClass("Active-Core");
        } else {
            $(".Wheel-Core").removeClass("Active-Core");
        };
        return;
    };

    if(data.action == "toggleEngine") {
        inCar = data.state;
        if(data.state) {
            $(".fa-heart-pulse").hide();
            $(".fa-engine").show();
            $(".engineText").text("Motor")
        } else {
            $(".fa-engine").hide();
            $(".fa-heart-pulse").show();
            $(".engineText").text("Stabilisieren")
        };
        return;
    };
});

$(document).keyup(function(e) {
    if (e.key === "Escape") {
        onClick('close')
    }
});

function onClick(action) {
    if(action == "stabilize-engine") {
        if(inCar) {
            action = "engine";
        } else {
            action = "stabilizePlayer"
        }
    }
    $.post('http://cloud_menu/' + action, JSON.stringify({}));
};