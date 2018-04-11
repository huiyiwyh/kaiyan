<template>
    <div>
        <header class="normal">
            <i @click="routerBack()" class="iconfont icon-back pull-left"></i>
            <h3 class="font-title pull-left">黑名单管理</h3>
            <h3 class="font-title pull-right ml-15 button btn-submit" @click="deleteMore()">移除</h3>
            <h3 class="font-title pull-right button btn-cancel" @click="cancelDelete()">取消</h3>
        </header>
        <section class="con-blacklist">
            <ul class="list-group">
                <li class="list-group-item no-bt clearfix" @touchstart="startTap()" @touchend="endTap()">
                    <div class="pull-left">
                        <img src="../../assets/back.jpg" alt="head" />
                        <span>测试一号</span>
                    </div>
                    <div class="pull-right">
                        <div class="btn btn-primary">移除</div>
                        <input class="animated" type="radio" />
                    </div>
                </li>
                <li class="list-group-item clearfix">
                    <div class="pull-left">
                        <img src="../../assets/back.jpg" alt="head" />
                        <span>测试二号</span>
                    </div>
                    <div class="pull-right">
                        <!--<div class="btn btn-primary">移除</div>-->
                        <input class="animated" type="radio"/>
                    </div>
                </li>
            </ul>
        </section>
    </div>
</template>

<script type="text/ecmascript-6">

    export default {
        name: "Blacklist",
        data() {
            return {
                timer: null,
            }
        },
        methods: {
            routerBack() {
                this.$router.back();
            },
            startTap() {
                this.timer = setTimeout(function() {
                    $(".btn").fadeOut(200);
                    let timerInput = setTimeout(function() {
                        $("input").css("display", "block").removeClass("slideOutLeft").addClass("slideInLeft");
                        $(".button").fadeIn(200);
                    }, 200);
                }, 1000);
            },
            endTap() {
                clearTimeout(this.timer);
            },
            cancelDelete() {
                let $input = $("input");
                $input.removeClass("slideInLeft").addClass("slideOutLeft");
                let timerInput = setTimeout(function() {
                    $input.fadeOut(200);
                    $(".button").fadeOut(200);
                }, 1000);
                let timerBtn = setTimeout(function() {
                    $(".btn").fadeIn(200);
                }, 1200);
            },
            deleteMore() {
                console.log($("input:checked"));
            }
        }
    }
</script>

<style scoped lang="scss">
    .normal {
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
    .con-blacklist {

        .list-group-item {
            height: 62px;
            line-height: 40px;

            img {
                width: 40px;
                height: 40px;
                border-radius: 20px;
            }
            span {
                margin-left: 10px;
                font-size: 16px;
            }
            input {
                display: none;
                width: 30px;
                height: 30px;
            }
        }
    }
</style>
