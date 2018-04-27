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

    import article from "../../common/data/article"

    export default {
        name: "PersonMyHistory",
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
                        title: "历史记录",
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
            this.getData();
        },
        methods: {
            getData() {
                const promise = this.$request.getUserHistory('879646529', 0, '123456');
                promise.then(data => {
                    const resp = JSON.parse(data);
                    if(Number(resp.code) === 1) {
                        this.article.data = resp.data;
                    } else {
                        console.warn(resp.msg);
                    }
                }).catch(err => {
                    console.log(err);
                })
            },
        }
    }
</script>
