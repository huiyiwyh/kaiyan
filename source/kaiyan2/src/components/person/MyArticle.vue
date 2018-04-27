<template>
    <div>
        <header-temp :config="config.header"></header-temp>
        <div class="body">
            <article-temp :article="article"></article-temp>
        </div>
        <!--<test></test>-->
    </div>
</template>

<script type="text/ecmascript-6">
    import HeaderTemp from "../../components/common/Header"
    import ArticleTemp from "../common/ArticleList"
    import Test from "../common/Test"

    import article from "../../common/data/person/article"

    export default {
        name: "PersonMyArticle",
        components: {
            HeaderTemp,
            ArticleTemp,
            Test
        },
        data() {
            return {
                config: {
                    header: {
                        style: "normal",
                        isBack: true,
                        title: "我的文章",
                        isSearch: false,
                        isSetting: false
                    }
                },
                article: {
                    type: 'my',
                    data: []
                }
            }
        },
        created() {
            const promise = this.$request.getArticleList(2, '879646529', 1, '2018-03-06 14:54', '123456');
            promise.then(data => {
                const _data = JSON.parse(data);
                if(Number(_data.code) === 1) {
                    this.article.data = _data.data;
                } else {
                    console.warn(_data.msg);
                }
            }).catch(err => {
                console.log(err);
            })
        }
    }
</script>
