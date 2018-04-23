<template>
    <header :class="config.style">
        <i @click="routerBack()" class="iconfont icon-back pull-left" v-if="config.isBack === true"></i>
        <h3 class="font-title pull-left" v-text="config.title"></h3>
        <i @click="goTo('searchMain')" class="iconfont icon-search pull-right" v-show="config.isSearch === true"></i>
        <i @click="goTo('setting')" class="iconfont icon-setting pull-right" v-show="config.isSetting === true"></i>
    </header>
</template>

<script type="text/ecmascript-6">
    export default {
        name: 'Header',
        props: ["config"],
        methods: {
            routerBack() {
                this.$router.back();
            },
            goTo(page) {
                this.$router.push({
                    name: page
                })
            }
        }
    }
</script>

<style scoped lang="scss">
    .normal {
        position: fixed;
        width: 100%;
        height: 40px;
        padding: 10px;
        border-bottom: 1px solid rgba(0,0,0,0.1);
        background-color: #fff;
        line-height: 20px;
        z-index: 999;

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
    }
    .transparent {
        position: absolute;
        top: 0;
        width: 100%;
        height: 40px;
        padding: 10px;
        background-color: transparent;
        line-height: 20px;
        z-index: 100;

        .iconfont {
            font-size: 20px;
            font-weight: bold;
            margin-right: 10px;
            color: #fff;
        }
    }
</style>
