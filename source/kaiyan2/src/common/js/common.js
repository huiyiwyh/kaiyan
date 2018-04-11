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

Module.define("Ajax", [], function() {
    const getJSON = (url) => {
        const promise = new Promise(function(resolve, reject) {
            const handler = function() {
                if(this.readyState !== 4) {
                    return;
                }
                if(this.status === 200) {
                    resolve(this.response);
                } else {
                    reject(new Error(this.statusText));
                }
            };
            const client = new XMLHttpRequest();
            client.open("GET", url);
            client.onreadystatechange = handler;
            client.responseType = "json";
            client.setRequestHeader("Accept", "application/json");
            client.send();
        });
        return promise;
    };
    const get = (url, data, token) => {
        const promise = new Promise(function(resolve, reject) {
            const handler = function() {
                if(this.readyState !== 4) {
                    return;
                }
                if(this.status === 200) {
                    resolve(this.response);
                } else {
                    reject(new Error(this.statusText));
                }
            };
            const client = new XMLHttpRequest();
            client.open("GET", url + "?" + data.join("&"));
            client.onreadystatechange = handler;
            client.setRequestHeader("Token", token);
            client.send();
        });
        return promise;
    };
    const post = (url, data, token) => {
        const promise = new Promise(function(resolve, reject) {
            const handler = function() {
                if(this.readyState !== 4) {
                    return;
                }
                if(this.status === 200) {
                    resolve(this.response);
                } else {
                    reject(new Error(tjos.statusText));
                }
            };
            const client = new XMLHttpRequest();
            client.open("POST", url);
            client.onreadystatechange = handler;
            client.setRequestHeader("Token", token);
            client.send(data);
        })
    };

    return {
        getJSON: getJSON,
        get: get,
        post: post
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
