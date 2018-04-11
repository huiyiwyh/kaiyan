<template>
    <div>
        <header-temp :config="config.header"></header-temp>
        <section class="con-comment">
            <div class="comment-item">
                <div class="comment-header">
                    <img :src="'http://115.159.59.72/kaiyan/head/879646529.jpg'" alt="head" />
                    <span class="ml-10">耗子爱骑车</span>
                    <div class="btn btn-default pull-right">回复</div>
                </div>
                <div class="mt-10">
                    在文章&nbsp;
                    <span class="color-main">《前端最简单粗暴的 PS 切图方法》</span>
                    &nbsp;中添加了一条新评论：
                </div>
                <div class="comment-content mt-10">
                    <span class="color-main">@游学者、墨槿</span>&nbsp;好的 谢谢雷锋
                </div>
                <div class="color-intro mt-10">2017-07-13 14:25</div>
            </div>
            <div class="comment-end">-- end --</div>
        </section>
        <section class="con-reply">
            <textarea placeholder="@耗子爱骑车"></textarea>
            <div class="btn btn-default pull-right mt-10">发表评论</div>
        </section>
    </div>
</template>

<script type="text/ecmascript-6">
    import HeaderTemp from "@/components/common/Header"

    export default {
        name: "MessComment",
        components: {
            HeaderTemp
        },
        data() {
            return {
                config: {
                    header: {
                        style: "normal",
                        isBack: true,
                        title: "评论",
                        isSetting: false,
                        isSearch: false
                    }
                }
            }
        }
    }
</script>

<style scoped lang="scss">
    .con-comment {
        padding: 10px;

        .comment-item {
            padding-bottom: 10px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);

            .comment-header {

                img {
                    width: 40px;
                    height: 40px;
                    border-radius: 20px;
                }
            }
            .comment-content {
                padding: 5px;
                background-color: #ddd;
                text-indent: 1em;
            }
        }
        .comment-end {
            margin-top: 20px;
            text-align: center;
            font-size: 16px;
        }
    }
    .con-reply {
        position: fixed;
        bottom: 0;
        width: 100%;
        height: 200px;
        padding: 20px;
        border-top: 1px solid rgba(0,0,0,0.1);
        background-color: #fff;

        textarea {
            width: 100%;
            height: 120px;
            background-color: #ddd;
            padding: 10px 20px;
        }
    }
</style>
