<template>
    <div>
        <header class="normal">
            <i @click="routerBack()" class="iconfont icon-back pull-left"></i>
            <h3 class="font-title pull-left">黑名单管理</h3>
            <i class="iconfont icon-recycle pull-right"></i>
        </header>
        <section class="con-recycle">
            <ul class="list-group">
                <li class="list-group-item no-bt clearfix">
                    <div class="pull-left">Android：这是一份Handler消息传递机制的使用教程</div>
                    <div class="pull-right">
                        <div class="btn btn-primary">移除</div>
                    </div>
                </li>
            </ul>
        </section>
    </div>
</template>

<script type="text/ecmascript-6">
    export default {
        name: "RecycleBin.vue",
        methods: {
            routerBack() {
                this.$router.back();
            }
        }
    }
</script>

<style scoped lang="scss">
    header {
        width: 100%;
        height: 40px;
        padding: 10px;
        border-bottom: 1px solid rgba(0,0,0,0.1);
        background-color: #fff;
        line-height: 20px;

        h3 {
            margin: 0;
            font-size: 20px;
            font-weight: bold;
        }
        .iconfont {
            font-size: 20px;
            font-weight: bold;
            margin-right: 10px;
        }
        .button {
            color: #0099cc;
            display: none;
        }
    }
    .con-recycle {

        .list-group-item {

            .pull-left {
                width: 70%;
                min-width: 250px;
                @include ellipsis-more-2;
            }
        }
    }
</style>
