import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import Test from '@/components/Test'
import Person from '@/components/person/Main'

Vue.use(Router)

export default new Router({
	routes: [{
			path: '/',
			name: 'HelloWorld',
			component: HelloWorld
		}, {
			path: '/person',
			name: 'Person',
			component: Person
		}, {
			path: '/test',
			name: 'Test',
			component: Test
		}
	]
})
