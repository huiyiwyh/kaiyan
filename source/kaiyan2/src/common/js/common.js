/**
 * Created by admin on 2018/3/22.
 */
let Module = (function() {
    let modules = {};

    let define = (name, deps, impl) => {
        for(let i = 0, length = deps.length; i < length; i++) {
            deps[i] = modules[deps[i]];
        }
        modules[name] = impl.apply(impl, deps);
    };

    let get = (name) => {
        return modules[name];
    };

    return {
        define: define,
        get: get
    }
})();
Module.define("Dialog", [], function() {
    let open = (container, setting) => {
        let con = null;
        if(typeof container === "string") {
            con = document.querySelector(container);
        } else {
            con = container;
        }
        let width = 0,
            height = 0;
        if(setting.width) {
            if(typeof setting.width === "string" && setting.width.indexOf("%") !== -1) {
                width = screen.availWidth * Number(setting.width.slice(0, setting.width.length - 1)) / 100;
            } else if (typeof setting.width === "string" && setting.width.indexOf("px") !== -1) {
                width = Number(setting.width.slice(0, setting.width.length - 2));
            } else {
                width = setting.width;
            }
        } else {
            width = screen.availWidth;
        }
        if(setting.height) {
            if(typeof setting.height === "string" && setting.height.indexOf("%") !== -1) {
                height = screen.availHeight * Number(setting.height.slice(0, setting.height.length - 1)) / 100;
            } else if (typeof setting.height === "string" && setting.height.indexOf("px") !== -1) {
                height = Number(setting.height.slice(0, setting.height.length - 2));
            } else {
                height = setting.height;
            }
        } else {
            height = screen.availWHeight;
        }
        const marginLeft = Math.round(width / 2);
        const marginTop = Math.round(height / 2);
        con.setAttribute("style",
            "display: block; " +
            "position: fixed; " +
            "top: 50%; " +
            "left: 50%; " +
            "margin-left: -" + marginLeft + "px; " +
            "margin-top: -" + marginTop + "px; " +
            "z-index: 1000;"
        );
        if(setting.isCover) {
            let cover = document.createElement("div");
            cover.onclick = function() {
                close(con);
            };
            cover.id = "DialogCoverSpirit";
            cover.setAttribute("style",
                "width: 100%; " +
                "height: 100%; " +
                "position: fixed; " +
                "top: 0; " +
                "left: 0; " +
                "z-index: 999; " +
                "background-color: rgba(0,0,0,0.5);"
            );
            document.body.append(cover);
        }
    };
    let close = (container) => {
        let con = null;
        if(typeof container === "string") {
            con = document.querySelector(container);
        } else {
            con = container;
        }
        con.style.display = "none";
        let cover = document.getElementById("DialogCoverSpirit");
        if(cover) {
            cover.parentNode.removeChild(cover);
        }
    };

    return {
        open: open,
        close: close
    }
});
Module.define("test2", ['test1'], function() {
    let sayHello = () => {
        console.log(test1.hello().toUpperCase())
    };

    return {
        sayHello: sayHello
    }
});

export {Module};
