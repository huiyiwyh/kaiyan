<template>
    <div>
        <header-temp :config="config.header"></header-temp>
        <div class="body">
            <article-temp :article="article"></article-temp>
        </div>
    </div>
</template>

<script type="text/ecmascript-6">
    import HeaderTemp from "../../components/common/Header"
    import ArticleTemp from "../common/ArticleList"

    export default {
        name: "PersonMyLike",
        components: {
            HeaderTemp,
            ArticleTemp
        },
        data() {
            return {
                config: {
                    header: {
                        style: "normal",
                        isBack: true,
                        title: "喜欢的文章",
                        isSearch: false,
                        isSetting: false
                    }
                },
                article: {
                    type: "other",
                    data: []
                }
            }
        },
        created() {
            const promise = this.$request.getArticleLike('879646529', '2018-04-05 14:23', '123456');
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
