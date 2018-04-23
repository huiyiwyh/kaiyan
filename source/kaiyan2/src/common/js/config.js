/**
 * Created by admin on 2018/4/1.
 */
let Config = {
    picUrl: "http://115.159.59.72/",
    url: {
        person: {
            // 关注界面-获取关注作者
            getArticleFocus: 'http://115.159.59.72/kaiyan/api/getArticleFocus.php',
            // 我的界面-获取个人信息
            getMyInfo: 'http://115.159.59.72/kaiyan/api/getMyInfo.php',
            // 个人主页-获取动态信息
            getAction: 'http://115.159.59.72/kaiyan/api/getAction.php',
            // 个人主页-我的文章
            getArticle: 'http://115.159.59.72/kaiyan/api/getArticle.php',
        }
    }
};
export {Config};
