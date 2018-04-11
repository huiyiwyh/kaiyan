<template>
    <div>
        <header>
            <i @click="routerBack()" class="iconfont icon-back pull-left"></i>
            <input type="text" class="form-control" placeholder="搜索好友" />
            <i @click="goTo('searchMain')" class="iconfont icon-search pull-right"></i>
        </header>
        <section class="con-friend">
            <div class="friend-item">
                <img src="http://115.159.59.72/kaiyan/head/879646529.jpg" />
                <span class="ml-10">游学者、墨槿</span>
                <div class="btn btn-default pull-right mt-5">传音</div>
            </div>
            <div class="friend-item">
                <img src="http://115.159.59.72/kaiyan/head/879646529.jpg" />
                <span class="ml-10">游学者、墨槿</span>
                <div class="btn btn-default pull-right mt-5">传音</div>
            </div>
            <div class="friend-item">
                <img src="http://115.159.59.72/kaiyan/head/879646529.jpg" />
                <span class="ml-10">游学者、墨槿</span>
                <div class="btn btn-default pull-right mt-5">传音</div>
            </div>
        </section>
    </div>
</template>

<script type="text/ecmascript-6">
    export default {
        name: "MessSend",
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
        height: 50px;
        padding: 10px;
        border-bottom: 1px solid rgba(0,0,0,0.1);
        background-color: #fff;
        line-height: 30px;

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
        input {
            display: inline-block;
            width: 70%;
            min-width: 240px;
            height: 30px;
            margin-left: 15px;
        }
    }
    .con-friend {

        .friend-item {
            padding: 10px;
            border-bottom: 1px solid rgba(0,0,0,0.1);

            img {
                width: 40px;
                height: 40px;
                border-radius: 20px;
            }
        }
    }
</style>
