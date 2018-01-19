function ajaxSelect(id) {
    var element = document.getElementById(id);
    var mycallback;
    var onLoaded = function (data) {
        element.options[0] = new Option("not selected", -1);
        var i = 0;
        for (; i < data.length; i++) {
            var key = data[i]['key'];
            var value = data[i]['value'];
            element.options[i + 1] = new Option(value, key);
        }
        if(mycallback != null)
            mycallback();
    }

    var onLoadError = function (error) {
        var msg = "Error " + error.errcode;
        if (error.message) msg = msg + ' :' + error.message;
        alert(msg);
    }

    var showLoading = function (on) {
        element.disabled = on;
    }

    var onSuccess = function (data) {
        if (!data.errcode) {
            onLoaded(data);
            showLoading(false);
        } else {
            showLoading(false);
            onLoadError(data);
        }
    }


    var onAjaxError = function (xhr, status) {
        showLoading(false);
        var errinfo = { errcode: status };
        if (xhr.status != 200) {
            // может быть статус 200, а ошибка
            // из-за некорректного JSON
            errinfo.message = xhr.statusText;
        } else {
            errinfo.message = 'Incorrect server data';
        }
        onLoadError(errinfo);
    }


    return {
        element: element,
        clear: function() {
            while (element.firstChild) {
                element.removeChild(element.firstChild);
            }
        },
        load: function (url, id, callback) {
            if (id == -1) {
                while (element.firstChild) {
                    element.removeChild(element.firstChild);
                }
                return;
            }
            showLoading(true);
            mycallback = callback;
            while (element.firstChild) {
                element.removeChild(element.firstChild);
            }
            $.ajax({ // для краткости - jQuery
                url: url,
                contentType: "application/json",
                data: JSON.stringify({
                    "id" : id
                }),
                dataType: "json",
                success: onSuccess,
                error: onAjaxError,
                cache: false,
                method: "post"
            });
        }
    }
}