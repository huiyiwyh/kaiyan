// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import store from './store'
import $ from "jquery"
import "bootstrap/dist/css/bootstrap.min.css"
import "swiper/dist/css/swiper.min.css"
import {Module} from "@/common/js/common"
import {Config} from "@/common/js/config"

Vue.config.productionTip = false;

new Vue({
    el: '#app',
    router,
    store,
    created() {
        const Ajax = Module.get("Ajax");
        Vue.prototype.$ajax = Ajax;
        Vue.prototype.$module = Module;
        Vue.prototype.$config = Config;
    },
    components: {App},
    template: '<App/>'
});
