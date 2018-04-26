import Vue from 'vue'
import Router from 'vue-router'
import Footer from '@/components/common/Tabbar'
import Focus from '@/components/focus/Focus'
import FocusMain from '@/components/focus/Main'
import FocusRecommend from '@/components/focus/Recommend'
import More from '@/components/more/More'
import MoreRecommend from '@/components/more/Recommend'
import RankArticle from '@/components/more/RankArticle'
import RankAuthor from '@/components/more/RankAuthor'
import Subject from '@/components/more/Subject'
import Message from '@/components/message/Message'
import MessageMain from '@/components/message/Main'
import MessSend from '@/components/message/MessSend'
import MessContent from '@/components/message/MessContent'
import MessComment from '@/components/message/MessComment'
import MessFocus from '@/components/message/MessFocus'
import MessLike from '@/components/message/MessLike'
import Person from '@/components/person/Person'
import PersonMain from '@/components/person/Main'
import PersonIndex from '@/components/person/Index'
import PersonMyFocusAuthor from '@/components/person/MyFocusAuthor'
import PersonMyFans from '@/components/person/MyFans'
import PersonMyLike from '@/components/person/MyLike'
import PersonMyArticle from '@/components/person/MyArticle'
import PersonMyHistory from '@/components/person/MyHistory'
import PersonMySubject from '@/components/person/MySubject'
import PersonMyFocusSubject from '@/components/person/MyFocusSubject'
import PersonMyNewSubject from '@/components/person/MyNewSubject'
import PersonMyHead from '@/components/person/MyHead'
import Setting from '@/components/person/Setting'
import Blacklist from '@/components/person/Blacklist'
import RecycleBin from '@/components/person/RecycleBin'
import Read from '@/components/article/Read'
import Write from '@/components/article/Write'
import Search from '@/components/search/Search'
import SearchMain from '@/components/search/Main'
import SearchUser from '@/components/search/User'
import SearchSubject from '@/components/search/Subject'

Vue.use(Router);

export default new Router({
    // mode: "history",
    routes: [
        {
            path: '/',
            components: {
                body: FocusMain,
                footer: Footer
            }
        }, {
            path: '/focus',
            name: 'focus',
            component: Focus,
            children: [
                {
                    path: 'main',
                    name: 'focusMain',
                    components: {
                        body: FocusMain,
                        footer: Footer
                    }
                }, {
                    path: 'recommend',
                    name: 'focusRecommend',
                    components: {
                        body: FocusRecommend
                    }
                }
            ]
        }, {
            path: '/more',
            name: 'more',
            component: More,
            children: [
                {
                    path: 'recommend',
                    name: 'moreRecommend',
                    components: {
                        body: MoreRecommend,
                        footer: Footer
                    }
                }, {
                    path: 'rankArticle',
                    name: 'rankArticle',
                    components: {
                        body: RankArticle
                    }
                }, {
                    path: 'rankAuthor',
                    name: 'rankAuthor',
                    components: {
                        body: RankAuthor
                    }
                }, {
                    path: 'subject',
                    name: 'subject',
                    components: {
                        body: Subject
                    }
                }
            ]
        }, {
            path: '/message',
            name: 'message',
            component: Message,
            children: [
                {
                    path: 'main',
                    name: 'messageMain',
                    components: {
                        body: MessageMain,
                        footer: Footer
                    }
                }, {
                    path: 'send',
                    name: 'messSend',
                    components: {
                        body: MessSend
                    }
                }, {
                    path: 'content',
                    name: 'messContent',
                    components: {
                        body: MessContent
                    }
                }, {
                    path: 'comment',
                    name: 'messComment',
                    components: {
                        body: MessComment
                    }
                }, {
                    path: 'focus',
                    name: 'messFocus',
                    components: {
                        body: MessFocus
                    }
                }, {
                    path: 'like',
                    name: 'messLike',
                    components: {
                        body: MessLike
                    }
                }
            ]
        }, {
            path: '/person',
            name: 'person',
            component: Person,
            children: [
                {
                    path: 'main',
                    name: 'personMain',
                    components: {
                        body: PersonMain,
                        footer: Footer
                    }
                }, {
                    path: 'index',
                    name: 'personIndex',
                    components: {
                        body: PersonIndex
                    }
                }, {
                    path: 'myFocusAuthor',
                    name: 'personMyFocusAuthor',
                    components: {
                        body: PersonMyFocusAuthor
                    }
                }, {
                    path: 'myFans',
                    name: 'personMyFans',
                    components: {
                        body: PersonMyFans
                    }
                }, {
                    path: 'myLike',
                    name: 'personMyLike',
                    components: {
                        body: PersonMyLike
                    }
                }, {
                    path: 'myArticle',
                    name: 'personMyArticle',
                    components: {
                        body: PersonMyArticle
                    }
                }, {
                    path: 'myHistory',
                    name: 'personMyHistory',
                    components: {
                        body: PersonMyHistory
                    }
                }, {
                    path: 'mySubject',
                    name: 'personMySubject',
                    components: {
                        body: PersonMySubject
                    }
                }, {
                    path: 'myFocusSubject',
                    name: 'personMyFocusSubject',
                    components: {
                        body: PersonMyFocusSubject
                    }
                }, {
                    path: 'myNewSubject',
                    name: 'personMyNewSubject',
                    components: {
                        body: PersonMyNewSubject
                    }
                }, {
                    path: 'setting',
                    name: 'setting',
                    components: {
                        body: Setting
                    }
                }, {
                    path: 'myHead',
                    name: 'personMyHead',
                    components: {
                        body: PersonMyHead
                    }
                }, {
                    path: 'blacklist',
                    name: 'blacklist',
                    components: {
                        body: Blacklist
                    }
                }, {
                    path: 'recycleBin',
                    name: 'recycleBin',
                    components: {
                        body: RecycleBin
                    }
                }
            ]
        }, {
            path: '/article',
            name: 'article',
            component: Read,
        }, {
            path: '/write',
            name: 'write',
            component: Write
        }, {
            path: '/search',
            name: 'search',
            component: Search,
            children: [
                {
                    path: 'main',
                    name: 'searchMain',
                    component: SearchMain
                }, {
                    path: 'user',
                    name: 'searchUser',
                    component: SearchUser
                }, {
                    path: 'subject',
                    name: 'searchSubject',
                    component: SearchSubject
                }
            ]
        }
    ]
})
