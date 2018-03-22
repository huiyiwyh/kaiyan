import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import FocusMain from '@/components/focus/Main'
import PersonMain from '@/components/person/Main'
import Footer from '@/components/common/Tabbar'

Vue.use(Router);

export default new Router({
    // mode: "history",
    routes: [
        {
            path: '/',
            name: 'person',
            components: {
                default: PersonMain,
                footer: Footer
            }
        }, {
            path: '/person',
            name: 'person',
            components: {
                default: PersonMain,
                footer: Footer
            }
        }, {
            path: '/focus',
            name: 'focus',
            components: {
                default: FocusMain,
                footer: Footer
            }
        }
    ]
})
