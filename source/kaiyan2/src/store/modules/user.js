/**
 * Created by admin on 2018/4/8.
 */

const state = {
    // account: "879646529",
    // nickname: "游学者、墨槿",
    // head: "kaiyan/head/879646529.jpg",
    // indexback: "kaiyan/back/879646529.jpg",
    // brief: "人生不是戏剧，而我亦非主角",
    // countFocus: 10,
    // countFans: 5,
    // countLike: 7,
    // countArticle: 10,
    // countSubject: 2,
    // countWords: 12785,
    // countLiked: 5
};

const mutations = {
    getAll() {
        return {
            account: state.account,
            nickname: state.nickname,
            head: state.head,
            brief: state.brief,
            countFocus: state.countFocus,
            countFans: state.countFans,
            countLike: state.countLike,
            countArticle: state.countArticle,
            countSubject: state.countSubject
        }
    },
    test(state) {
        return state;
    }
};

export default {
    state,
    mutations
}
