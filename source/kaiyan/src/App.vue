<template>
    <div id="app">
        <header>
            <!--<h3 v-text="title">我的</h3>-->
        </header>
        <router-view></router-view>
        <router-view name="footer"></router-view>
    </div>
</template>

<script>
    export default {
        name: 'App',
        data() {
            return {
                title: "我的"
            }
        },
        methods: {
            router(param) {
                this.$router.push({
                    name: param
                })
            }
        }
    }
</script>

<style scoped lang="scss">
    @import "common/scss/common";
    @import "common/fonts/iconfont.css";

    #app {
        font-family: 'Avenir', Helvetica, Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
    }
    header {
        width: 100%;
        height: 40px;
        border-bottom: 1px solid rgba(0,0,0,0.1);
    }
</style>
