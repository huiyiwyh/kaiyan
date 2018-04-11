<template>
    <div>
        <header-temp :config="config.header"></header-temp>
        <section class="con-like" id="conLike">
            <div class="like-item">
                <div class="like-content">
                    <span class="color-main">游学者、墨槿</span>
                    &nbsp;喜欢了你的文章
                    <span class="color-main">《如何使用 input type="file" 上传文件》</span>
                </div>
                <div class="color-intro">2017-10-02 07:31</div>
            </div>
            <div class="like-item">
                <div class="like-content">
                    <span class="color-main">游学者、墨槿</span>
                    &nbsp;喜欢了你的文章
                    <span class="color-main">《如何使用 input type="file" 上传文件》</span>
                </div>
                <div class="color-intro">2017-10-02 07:31</div>
            </div>
            <div class="like-item">
                <div class="like-content">
                    <span class="color-main">游学者、墨槿</span>
                    &nbsp;喜欢了你的文章
                    <span class="color-main">《如何使用 input type="file" 上传文件》</span>
                </div>
                <div class="color-intro">2017-10-02 07:31</div>
            </div>
            <div class="like-item">
                <div class="like-content">
                    <span class="color-main">游学者、墨槿</span>
                    &nbsp;喜欢了你的文章
                    <span class="color-main">《如何使用 input type="file" 上传文件》</span>
                </div>
                <div class="color-intro">2017-10-02 07:31</div>
            </div>
            <div class="like-item">
                <div class="like-content">
                    <span class="color-main">游学者、墨槿</span>
                    &nbsp;喜欢了你的文章
                    <span class="color-main">《如何使用 input type="file" 上传文件》</span>
                </div>
                <div class="color-intro">2017-10-02 07:31</div>
            </div>
            <div class="like-item">
                <div class="like-content">
                    <span class="color-main">游学者、墨槿</span>
                    &nbsp;喜欢了你的文章
                    <span class="color-main">《如何使用 input type="file" 上传文件》</span>
                </div>
                <div class="color-intro">2017-10-02 07:31</div>
            </div>
            <div class="like-item">
                <div class="like-content">
                    <span class="color-main">游学者、墨槿</span>
                    &nbsp;喜欢了你的文章
                    <span class="color-main">《如何使用 input type="file" 上传文件》</span>
                </div>
                <div class="color-intro">2017-10-02 07:31</div>
            </div>
            <div class="like-item">
                <div class="like-content">
                    <span class="color-main">游学者、墨槿</span>
                    &nbsp;喜欢了你的文章
                    <span class="color-main">《如何使用 input type="file" 上传文件》</span>
                </div>
                <div class="color-intro">2017-10-02 07:31</div>
            </div>
        </section>
    </div>
</template>

<script type="text/ecmascript-6">
    import HeaderTemp from "@/components/common/Header"

    export default {
        name: "MessageMain",
        components: {
            HeaderTemp,
        },
        data() {
            return {
                config: {
                    header: {
                        style: "normal",
                        isBack: true,
                        title: "喜欢",
                        isSearch: false,
                        isSetting: false
                    }
                }
            }
        },
        mounted() {
            this.$nextTick(function() {
                $("#conLike").height($(window).height() - 40);
            })
        }
    }
</script>

<style scoped lang="scss">
    .con-like {
        height: auto;
        margin-top: -1px;
        overflow: auto;

        .like-item {
            padding-bottom: 10px;
            border-bottom: 1px solid rgba(0,0,0,0.1);

            div {
                padding: 0 20px;
            }
            .like-content {
                padding: 10px 20px;
            }
        }
        .like-item:first-child {
            border-top: 1px solid rgba(0,0,0,0.1);
        }
    }
</style>
