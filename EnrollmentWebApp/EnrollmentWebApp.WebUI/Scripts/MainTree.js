function tree(id, url) {
    var element = document.getElementById(id);

    /* вспомогательная функция */
    function hasClass(elem, className) {
        return new RegExp("(^|\\s)" + className + "(\\s|$)").test(elem.className);
    }

    function toggleNode(node) {
        // определить новый класс для узла
        var newClass = hasClass(node, 'ExpandOpen') ? 'ExpandClosed' : 'ExpandOpen';
        // заменить текущий класс на newClass
        // регексп находит отдельно стоящий open|close и меняет на newClass
        var re = /(^|\s)(ExpandOpen|ExpandClosed)(\s|$)/;
        node.className = node.className.replace(re, '$1' + newClass + '$3');
    }

    function load(node) {
        /* ... загрузить узел с сервера, код далее ... */
        function onSuccess(data) {
            if (!data.errcode) {
                onLoaded(data);
                showLoading(false);
            } else {
                showLoading(false);
                onLoadError(data);
            }
        }
        function onAjaxError(xhr, status) {
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
        function onLoadError(error) {
            var msg = "Ошибка " + error.errcode;
            if (error.message)
                msg = msg + ' :' + error.message;
            alert(msg);
        }

        function showLoading(on) {
            var expand = node.getElementsByTagName('DIV')[0];
            expand.className = on ? 'ExpandLoading' : 'Expand';
        }


        function onLoaded(data) {

            for (var i = 0; i < data.length; i++) {
                var child = data[i];
                var li = document.createElement('LI');
                li.setAttribute('data-id', child.Id);

                li.className = "Node Expand" + (child.isFolder ? 'Closed' : 'Leaf');
                if (i == data.length - 1)
                    li.className += ' IsLast';

                var stringHTML = '<div class="Expand"></div>';
                if ($(node).children('input').length !== 0 && $(node).children('input')[0].checked === true) {
                    stringHTML += '<input type="checkbox" checked="true">';
                }
                else {
                    stringHTML += '<input type="checkbox">';
                }

                stringHTML += '<div class="Content">' + child.Title + '</div>';
                if (child.isFolder) {
                    stringHTML += '<ul class="Container"></ul>';
                }
                li.innerHTML = stringHTML;

                node.getElementsByTagName('UL')[0].appendChild(li);
            }

            node.isLoaded = true;
            toggleNode(node);
        }

        showLoading(true);

        $.ajax({
            url: "/Admin/LoadNode",
            data: JSON.stringify({ "id": node.dataset.id }),
            contentType: "application/json",
            dataType: "json",
            success: onSuccess,
            error: onAjaxError,
            cache: false,
            method: "post"
        });

    };

    function checkParent(checkbox) {

        if ($(checkbox).parents('ul').first().parent().data('id') === -1) {
            return;
        }

        var levelState = checkLevel(checkbox);
        var parent_checkbox = $(checkbox).parents('ul').first().siblings('input')[0];
        
        if (levelState == "empty")
        {
            parent_checkbox.checked = false;
            parent_checkbox.indeterminate = false;
        }
        else if (levelState == "full")
        {
            parent_checkbox.checked = true;
            parent_checkbox.indeterminate = false;
        }
        else if (levelState == "some")
        {
            parent_checkbox.checked = false;
            parent_checkbox.indeterminate = true;
        }
        checkParent(parent_checkbox);

    }

    function checkLevel(checkbox) {
        var lis = $(checkbox).parent().siblings('li');
        if (lis.length == 0) {
            if (checkbox.checked == true)
                return "full";
            else
                return "empty";
        }
        var numTrue = 0;
        for (i = 0; i < lis.length; i++) {
            if ($(lis[i]).children('input')[0].checked === true) {
                numTrue++;
            }
            if ($(lis[i]).children('input')[0].indeterminate == true) {
                return "some";
            }
        }

        if (numTrue === lis.length) {
            if (checkbox.checked == true)
                return "full";
            else
                return "some";
        }
        if (numTrue === 0) {
            if (checkbox.indeterminate == true)
                return "some";
            if (checkbox.checked == true)
                return "some";
            else
                return "empty";
        }
        return "some";
    }

    function checkChild(checkbox) {
        var isChecked = checkbox.checked;
        var lis = $(checkbox).siblings('ul').first().children('li');
        for (var i = 0; i < lis.length; i++) {
            var child_checkbox = $(lis[i]).children('input')[0];
            child_checkbox.checked = isChecked;
            child_checkbox.indeterminate = false;
            checkChild(child_checkbox);
        }
    }

    function checkRelations(checkbox) {
        checkParent(checkbox);
        checkChild(checkbox);
    }

    element.onclick = function (event) {
        event = event || window.event;
        var clickedElem = event.target || event.srcElement;

        if (clickedElem.type === "checkbox") {
            checkRelations(clickedElem);
        }

        if (!hasClass(clickedElem, 'Expand')) {
            return; // клик не там
        }

        // Node, на который кликнули
        var node = clickedElem.parentNode;
        if (hasClass(node, 'ExpandLeaf')) {
            return; // клик на листе
        }

        if (node.isLoaded || node.getElementsByTagName('LI').length) {
            // Узел уже загружен через AJAX(возможно он пуст)
            toggleNode(node);
            return;
        }


        if (node.getElementsByTagName('LI').length) {
            // Узел не был загружен при помощи AJAX, но у него почему-то есть потомки
            // Например, эти узлы были в DOM дерева до вызова tree()
            // Как правило, это "структурные" узлы
            // ничего подгружать не надо
            toggleNode(node);
            return;
        }

        // загрузить узел
        load(node);
    }
}

function TreeSearcher() {
    var data = [];
    var name;

    function TreeDFS(LiId, level) {
        var li = $('li[data-id = ' + LiId + ']');
        var input = $(li).children('input')[0];
        if (input.checked == true) {
            var x = {
                "Id": +li[0].dataset.id,
                "Level": level
            }
            data.push(x);
        }
        else if (input.indeterminate == true) {
            var childLies = $(li).children('ul').children('li');
            for (var j = 0; j < childLies.length; j++)
                TreeDFS(childLies[j].dataset.id, level + 1);
        }
    };

    function onSuccess(data) {
        if (!data.errcode) {
            onLoaded(data);
        } else {
            showLoading(false);
            onLoadError(data);
        }
    }
    function onAjaxError(xhr, status) {
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
    function onLoadError(error) {
        var msg = "Ошибка " + error.errcode;
        if (error.message)
            msg = msg + ' :' + error.message;
        alert(msg);
    }

    function onLoaded(data) {
        var div = $('div[name = ' + name + ']');
        div.empty();
        var html = $.parseHTML(data)
        div.append(html);
    }

    return {
        loadData: function (divName) {
            name = divName;
            TreeDFS(0, 0);
            $.ajax({
                url: "/Admin/LoadTreeCheckboxData",
                data: JSON.stringify(data),
                contentType: "application/json",
                dataType: "html",
                success: onSuccess,
                error: onAjaxError,
                cache: false,
                method: "post"
            });
        }
    };
}


