const Ajax = {
    getJSON:(url) => {
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
    },
    get: (url, data, token) => {
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
    },
    post: (url, data, token) => {
        return new Promise(function(resolve, reject) {
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
            const client = new XMLHttpRequest(),
                postData = data.join("&");
            client.open("POST", url);
            client.onreadystatechange = handler;
            client.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            client.setRequestHeader("Token", token);
            client.send(postData);
        });
    }
};
const Request = {

    /**
     * 获取作者列表
     * @param account 用户账号
     * @param type    检索类型
     * @param number  已获取的作者数
     * @param token   身份凭证
     * @return  {*}   promise 对象
     */
    getAuthorList(account, type, number, token) {
        return Ajax.post('http://115.159.59.72/kaiyan/api/getArticleFocus.php', [
            'geacg=' + account,
            'utydk=' + type,
            'iicje=' + number
        ], token);
    },
    /**
     * 获取作者排行榜
     * @param number  已获取的作者数
     * @param token   身份凭证
     * @returns {*}   promise 对象
     */
    getRankAuthor(number, token) {
        return Ajax.post('http://115.159.59.72/kaiyan/api/getRankAuthor.php', [
            'jvheh=' + number
        ], token);
    },
    /**
     * 获取关注专题列表
     * @param account 用户账号
     * @param number  已获取的作者数
     * @param token   身份凭证
     * @returns {*}   promise 对象
     */
    getSubjectFocus(account, number, token) {
        return Ajax.post('http://115.159.59.72/kaiyan/api/getSubjectFocus.php', [
            'budhs=' + account,
            'tehsc=' + number
        ], token);
    },
    /**
     * 获取专题列表
     * @param type    检索类别
     * @param account 用户账号
     * @param param   检索条件
     * @param token   身份凭证
     * @returns {*}   promise 对象
     */
    getSubjectList(type, account, param, token) {
        return Ajax.post('http://115.159.59.72/kaiyan/api/getSubjectList.php', [
            'vhdes=' + type,
            'kvjed=' + account,
            'wyejs=' + param
        ], token);
    },
    /**
     * 获取专题详情
     * @param sid     专题号
     * @param account 用户账号
     * @param token   身份凭证
     * @returns {*}   promise 对象
     */
    getSubjectInfo(sid, account, token) {
        return Ajax.post('http://115.159.59.72/kaiyan/api/getSubjectInfo.php', [
            'grbfs=' + sid,
            'ckege=' + account
        ], token);
    },
    /**
     * 新建专题
     * @param account   用户账号
     * @param name      专题名称
     * @param brief     专题介绍
     * @param thumbnail 专题封面
     * @returns {*}     promise 对象
     */
    createSubject(account, name, brief, thumbnail) {
        return Ajax.post('http://115.159.59.72/kaiyan/api/createSubject.php', [
            'ythcs=' + account,
            'utyeh=' + name,
            'ertqh=' + brief,
            'oiyhx=' + thumbnail
        ], token);
    },
    /**
     * 删除专题
     * @param sid   专题号
     * @returns {*} promise 对象
     */
    removeSubject(sid) {
        return Ajax.post('http://115.159.59.72/kaiyan/api/removeSubject.php', [
            'rejcs=' + sid
        ], token);
    },
    /**
     * 获取个人信息
     * @param account 用户账号
     * @param token   身份凭证
     * @returns {*}   promise 对象
     */
    getUserInfo(account, token) {
        return Ajax.post('http://115.159.59.72/kaiyan/api/getUserInfo.php', [
            'jchen=' + account
        ], token);
    },
    /**
     * 修改用户头像
     * @param account 用户账号
     * @param picture base64 图片数据
     * @param token   身份凭证
     * @returns {*}   promise 对象
     */
    setUserHead(account, picture, token) {
        return Ajax.post('http://115.159.59.72/kaiyan/api/setUserHead.php', [
            "hcnsg=" + account,
            'yshuc=' + picture
        ], token);
    },
    /**
     * 修改用户昵称
     * @param account  用户账号
     * @param nickname 用户昵称
     * @param token    身份凭证
     * @returns {*}    promise 对象
     */
    setUserNickname(account, nickname, token) {
        return Ajax.post('http://115.159.59.72/kaiyan/api/setUserNickname.php', [
            "ashce=" + account,
            'ytesh=' + nickname
        ], token);
    },
    /**
     * 修改个人简介
     * @param account 用户账号
     * @param brief   个人简介
     * @param token   身份凭证
     * @returns {*}   promise 对象
     */
    setUserBrief(account, brief, token) {
        return Ajax.post('http://115.159.59.72/kaiyan/api/setUserBrief.php', [
            "tehas=" + account,
            'bncjs=' + brief
        ], token);
    },
    setUserPassword(account, oldPwd, newPwd, token) {
        return Ajax.post('http://115.159.59.72/kaiyan/api/setUserPassword.php', [
            "jksnd=" + account,
            'nklsh=' + oldPwd,
            'wrqsd=' + newPwd
        ], token);
    },
    getUserAction(account, earliestDate, token) {
        return Ajax.post('http://115.159.59.72/kaiyan/api/setUserAction.php', [
            "nhcjs=" + account,
            'asxcd=' + earliestDate
        ], token);
    },
    /**
     * 获取热门搜索
     * @param token  身份凭证
     * @returns {*}  promise 对象
     */
    getSearchPopular(token) {
        return Ajax.post('http://115.159.59.72/kaiyan/api/getSearchPopular.php', [], token);
    },
    /**
     * 获取搜索记录
     * @param account 用户账号
     * @param token   身份凭证
     * @returns {*}   promise 对象
     */
    getSearchHistory(account, token) {
        return Ajax.post('http://115.159.59.72/kaiyan/api/getSearchHistory.php', [
            'jehcd=' + account
        ], token)
    },
    /**
     * 清除搜索记录：清除所有记录
     * @param account 用户账号
     * @param token   身份凭证
     * @returns {*}   promise 对象
     */
    removeAllSearchHistory(account, token) {
        return Ajax.post('http://115.159.59.72/kaiyan/api/removeAllSearchHistory.php', [
            'uejsh=' + account
        ], token)
    },
    /**
     * 清除搜索记录：清除指定记录
     * @param id      记录号
     * @param account 用户账号
     * @param token   身份凭证
     * @returns {*}   promise 对象
     */
    removeSearchHistory(id, account, token) {
        return Ajax.post('http://115.159.59.72/kaiyan/api/removeSearchHistory.php', [
            'uejsh=' + account,
            'yehjc=' + id
        ], token)
    },
    /**
     * 初步检索
     * @param content 检索内容
     * @param token   身份凭证
     * @returns {*}   promise 对象
     */
    getSearchContent(content, token) {
        return Ajax.post('http://115.159.59.72/kaiyan/api/getSearchContent.php', [
            'okshc=' + content
        ], token)
    },
    /**
     * 检索相关用户
     * @param content 检索内容
     * @param number  已获取记录数
     * @param token   身份凭证
     * @returns {*}   promise 对象
     */
    getSearchUser(content, number, token) {
        return Ajax.post('http://115.159.59.72/kaiyan/api/getSearchUser.php', [
            'hwjco=' + content,
            'irksh=' + number
        ], token)
    },
    /**
     * 检索相关专题
     * @param content 检索内容
     * @param number  已获取记录数
     * @param token   身份凭证
     * @returns {*}   promise 对象
     */
    getSearchSubject(content, number, token) {
        return Ajax.post('http://115.159.59.72/kaiyan/api/getSearchSubject.php', [
            'iyscf=' + content,
            'wqefs=' + number
        ], token)
    },
    /**
     * 检索相关文章
     * @param content 检索内容
     * @param number  已获取记录数
     * @param token   身份凭证
     * @returns {*}   promise 对象
     */
    getSearchArticle(content, number, token) {
        return Ajax.post('http://115.159.59.72/kaiyan/api/getSearchArticle.php', [
            'abehs=' + content,
            'jwkah=' + number
        ], token)
    }
};
export {Request};
