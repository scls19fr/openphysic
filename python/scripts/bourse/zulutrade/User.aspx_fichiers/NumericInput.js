function TestKeyPress( obj, e, max_length ) { 
    var selected;
    var keynum;
    var keychar;
    var numcheck;
    if(window.event) {// IE
        keynum = e.keyCode
        selected = document.selection.createRange().text != "";
    } else if(e.which) {// Netscape/Firefox/Opera
        keynum = e.which
        selected = (obj.selectionEnd - obj.selectionStart) > 0;
    }
    keychar = String.fromCharCode(keynum)
    numcheck = /\d/
    var result = numcheck.test(keychar) 
    var isDot = (keychar == '.') && (obj.value.indexOf(".") == -1)
    var isDelete = keynum == 8
    if ((obj.value.length > (max_length-1)) && (result || isDot) && !selected) {
        return false
    }
    return result || isDot || isDelete || (keynum == undefined)
}

function TestNumber(obj, max_value) {
    var error = isNaN(obj.value);
    if (!error) {
        var n = parseFloat(obj.value);
        if (n > max_value) {
            error = true
        }
    }
    if (error && (obj.value == "*")) {
       error = false
    }
    if (error) {
        obj.style.backgroundColor = 'red';
        obj.value = '0';
    } else {
        obj.style.backgroundColor = '';
    }
}

function isN(n) {
    return isNaN(n) || (n == 0)
}

function TestSignal(buy_sell_id, market_id, rate_id, stop_id, limit_id) {
    var buy = document.getElementById(buy_sell_id).value == "BUY";
    var market = document.getElementById(market_id) != null && document.getElementById(market_id).checked;
    var rate = parseFloat(document.getElementById(rate_id).value);
    var stop = parseFloat(document.getElementById(stop_id).value);
    var limit = parseFloat(document.getElementById(limit_id).value);
    
    //alert("buy: " + buy + ", m: " + market + ", r: " + rate + ", s: " + stop + ", l: " + limit);

    if (!market && isN(rate)) {
        alert("Rate cannot be empty for non-market orders.")
        return false
    }

    /*if (!isN(rate)) {
        if (buy) {
            if (!isN(stop) && ( stop > rate)) {
                alert("stop must be less than rate")
                return false
            }
            if (!isN(limit) && ( limit < rate)) {
                alert("limit must be greater than rate")
                return false
            }        
        } else {
            if (!isN(stop) && ( stop < rate)) {
                alert("stop must be greater than rate")
                return false
            }
            if (!isN(limit) && ( limit > rate)) {
                alert("limit must be less than rate")
                return false
            }        
        }
    } else {
        if (!isN(limit) && !isN(stop)) {
            if (buy) {
                if (limit < stop) {
                    alert("limit must be greater than stop")
                    return false
                }
            } else {
                if (limit > stop) {
                    alert("limit must be less than stop")
                    return false
                }
            }
        }
    }*/
    
    document.getElementById('signal_box_id').style.display = 'none';
    return true
}