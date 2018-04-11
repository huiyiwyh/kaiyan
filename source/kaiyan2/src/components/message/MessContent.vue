<template>
    <div>
        <header>
            <i @click="routerBack()" class="iconfont icon-back pull-left"></i>
            <h3 class="font-title pull-left" v-text="config.header"></h3>
            <i class="iconfont icon-list pull-right"></i>
            <ul class="con-option">
                <li class="option-item">举报用户</li>
                <li class="option-item">加入黑名单</li>
            </ul>
        </header>
        <section class="con-mess">
            <div class="mess-item">
                <div class="mess-date">- 2018.03.12 18:00 -</div>
                <div class="mess-body">
                    <img src="http://115.159.59.72/kaiyan/head/879646529.jpg" alt="head" />
                    <div class="mess-content">
                        前言 在Android开发的多线程应用场景中，有任何问题都可能会造成
                    </div>
                </div>
            </div>
            <div class="mess-item me">
                <div class="mess-date">- 2018.03.12 18:00 -</div>
                <div class="mess-body">
                    <img src="http://115.159.59.72/kaiyan/head/879646529.jpg" alt="head" />
                    <div class="mess-content">
                        前言 在Android开发的多线程应用场景中，有任何问题都可能会造成
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script type="text/ecmascript-6">
    import HeaderTemp from "@/components/common/Header"

    export default {
        name: "MessContent",
        components: {
            HeaderTemp,
        },
        data() {
            return {
                config: {
                    header: "游学者、墨槿",
                }
            }
        },
        methods: {
            routerBack() {
                this.$router.back();
            }
        }
    }
</script>

<style scoped lang="scss">
    header {
        position: relative;
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
        .con-option {
            width: 120px;
            height: 80px;
            position: absolute;
            top: 40px;
            right: 0;
            margin-bottom: -1px;
            background-color: #fff;
            border: 1px solid rgba(0,0,0,0.1);
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            box-shadow: -2px 2px 3px 1px #333;

            .option-item {
                height: 40px;
                line-height: 40px;
                padding-left: 10px;
                border-bottom: 1px solid rgba(0,0,0,0.1);
            }
        }
    }
    .con-mess {

        .mess-item {
            padding: 10px 0;

            .mess-date {
                text-align: center;
            }
            .mess-body {
                height: auto;
                padding: 10px;
                overflow: hidden;

                img {
                    float: left;
                    width: 40px;
                    height: 40px;
                    border-radius: 20px;
                }
                .mess-content {
                    float: left;
                    width: 75%;
                    min-width: 280px;
                    margin-left: 15px;
                    padding: 5px 10px;
                    background-color: #0099cc;
                    color: #fff;
                    border-radius: 10px;
                }
            }
        }
        .mess-item:first-child {
            padding-top: 20px;
        }
        .me {

            .mess-body {

                img {
                    float: right;
                }
                .mess-content {
                    float: right;
                    margin-left: 0;
                    margin-right: 15px;
                    background-color: #eeff1b;
                    color: #000;
                }
            }
        }
    }
</style>
