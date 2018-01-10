function ajaxSelect(id) {
    var element = document.getElementById(id);

    var onLoaded = function (data) {
        element.options[0] = new Option("не выбрано", 0);
        var i = 0;
        for (; i < data.length; i++) {
            var key = data[i]['key'];
            var value = data[i]['value'];
            element.options[i + 1] = new Option(value, key);
        }
    }

    var onLoadError = function (error) {
        var msg = "Ошибка " + error.errcode;
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
            errinfo.message = 'Некорректные данные с сервера';
        }
        onLoadError(errinfo);
    }


    return {
        load: function (url) {
            showLoading(true);

            while (element.firstChild) {
                element.removeChild(element.firstChild);
            }

            $.ajax({ // для краткости - jQuery
                url: url,
                contentType: "application/json",
                dataType: "json",
                success: onSuccess,
                error: onAjaxError,
                cache: false,
                method: "post"
            });
        },
        loadSpec: function(url, value){
            showLoading(true);

            while (element.firstChild) {
                element.removeChild(element.firstChild);
            }

            $.ajax({ // для краткости - jQuery
                url: url,
                contentType: "application/json",
                data: JSON.stringify({ "value": value }),
                dataType: "json",
                success: onSuccess,
                error: onAjaxError,
                cache: false,
                method: "post"
            });
        }
    }
}