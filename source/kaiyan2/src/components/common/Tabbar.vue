<template>
    <footer id="nav">
        <ul class="ft-nav">
            <li @click="goTo('focusMain')" class="ft-nav-item">
                <i class="iconfont icon-home"></i>
                <div>关注</div>
            </li>
            <li @click="goTo('moreRecommend')" class="ft-nav-item">
                <i class="iconfont icon-find"></i>
                <div>发现</div>
            </li>
            <li @click="goTo('write')" class="ft-nav-item">
                <i class="iconfont icon-add icon-big"></i>
            </li>
            <li @click="goTo('messageMain')" class="ft-nav-item">
                <i class="iconfont icon-message"></i>
                <div>消息</div>
            </li>
            <li @click="goTo('personMain')" :to="{name:'person'}" class="ft-nav-item">
                <i class="iconfont icon-user"></i>
                <div>我的</div>
            </li>
        </ul>
    </footer>
</template>

<script type="text/ecmascript-6">
    export default {
        name: "Tabbar",
        methods: {
            goTo(page) {
                this.$router.push({
                    name: page
                })
            }
        }
    }
</script>

<style scoped lang="scss">
    @import "../../common/scss/common";
    @import "../../common/fonts/iconfont.css";

    footer {
        position: fixed;
        bottom: 0;
        z-index: 1000;
        left: 0;
        width: 100%;
        height: 50px;

        .ft-nav {
            display: flex;
            position: relative;
            width: 100%;
            height: 50px;
            padding-left: 0;
            margin-bottom: 0;
            border-top: 1px solid rgba(0,0,0,0.1);
            background-color: #fcfcfc;
        }
        .ft-nav-item {
            width: 20%;
            height: 100%;
            /*float: left;*/
            flex-direction: row;
            text-align: center;

            i {
                font-size: 1.5em;
            }
            div {
                font-size: 0.7em;
                color: #666;
            }
            .icon-big {
                position: relative;
                top: -30px;
                font-size: 4em;
                color: #0099cc;
            }
        }
    }
</style>
