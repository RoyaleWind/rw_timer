let running = false;

function convertSeconds(seconds) {
    let hours = Math.floor(seconds / 3600);
    let minutes = Math.floor((seconds % 3600) / 60);
    let remainingSeconds = seconds % 60;
    timeui(hours,minutes,remainingSeconds)
}

function padNumber(num) {
    let numStr = num.toString();

    if (numStr.length < 2) {
        numStr = '0' + numStr;
    }

    return numStr;
}

function timeui(h,m,s)
{
    $("#tx_h").html(padNumber(h));
    $("#tx_m").html(padNumber(m));
    $("#tx_s").html(padNumber(s));
}

$(function () {
    $("#timer").animate({
        "bottom": "-20%"
    }, 1); 
    window.addEventListener('message', function (event) {
        if (event.data.action == 'time') {
            let time = event.data.val;
            if (!running) 
            {
                running = true; 
                $("#timer").animate({
                    "bottom": "-3%"
                }, 1000); 
            }
            convertSeconds(time);
        }
    });
});

