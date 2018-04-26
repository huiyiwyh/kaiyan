<template>
    <div>
        <header class="normal">
            <i @click="routerBack()" class="iconfont icon-back pull-left"></i>
            <h3 class="font-title pull-left">黑名单管理</h3>
            <h3 class="font-title pull-right ml-15 button btn-submit" @click="deleteMore()">移除</h3>
            <h3 class="font-title pull-right button btn-cancel" @click="cancelDelete()">取消</h3>
        </header>
        <div class="body">
            <section class="con-blacklist">
                <ul class="list-group" @click="deleteOne($event)" @touchstart="startTap($event)" @touchend="endTap()">
                    <li class="list-group-item no-bt clearfix" v-for="item in blacklist.list">
                        <div class="pull-left">
                            <img :src="config.reqUrl + item.head" alt="head" />
                            <span v-text="item.nickname"></span>
                        </div>
                        <div class="pull-right">
                            <div class="btn btn-primary">移除</div>
                            <input :data-bid="item.bid" class="animated" type="radio" />
                        </div>
                    </li>
                </ul>
            </section>
        </div>
    </div>
</template>

<script type="text/ecmascript-6">
    export default {
        name: "Blacklist",
        data() {
            return {
                timer: null,
                config: {
                    reqUrl: ""
                },
                blacklist: {
                    list: [],
                    preDel: []
                },
            }
        },
        created() {
            this.config.reqUrl = this.$config.picUrl;
            this.request('getBlacklist');
        },
        methods: {
            routerBack() {
                this.$router.back();
            },
            request(type) {
                let promise;
                if(type === 'getBlacklist') {
                    promise = this.$request.getBlacklist('879646529', this.blacklist.list.length, '123456');
                    promise.then(data => {
                        const resp = JSON.parse(data);
                        if(Number(resp.code) === 1) {
                            this.blacklist.list = resp.data;
                        } else {
                            console.warn(resp.msg);
                        }
                    }).catch(err => {
                        console.log(err);
                    })
                } else if(type === 'removeBlacklist') {
                    promise = this.$request.removeBlacklist(this.blacklist.preDel, '123456');
                    promise.then(data => {
                        const resp = JSON.parse(data);
                        if(Number(resp.code) === 1) {
                            console.log(resp.msg);
                        } else {
                            console.warn(resp.msg);
                        }
                    }).catch(err => {
                        console.log(err);
                    })
                }
            },
            /**
             * 开始触碰
             */
            startTap(event) {
                if(event.target.tagName === "LI") {
                    const $target = $(event.target);
                    this.timer = setTimeout(function() {
                        $target.find(".btn").fadeOut(200);
                        setTimeout(function() {
                            $target.find("input").css("display", "block").removeClass("slideOutLeft").addClass("slideInLeft");
                            $(".button").fadeIn(200);
                        }, 200);
                    }, 1000);
                }
            },
            /**
             * 结束触碰
             */
            endTap() {
                clearTimeout(this.timer);
            },
            /**
             * 取消删除
             */
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
                $("input:checked").prop("checked", false);
            },
            deleteOne(event) {
                const $target = $(event.target);
                if($target.hasClass('btn-primary')) {
                    this.blacklist.preDel = $target.next().attr('data-bid');
                    this.request('removeBlacklist');
                }
            },
            /**
             * 删除多个
             */
            deleteMore() {
                const $checkd = $("input:checked");
                let bidResult = [];
                $checkd.each((index, item) => {
                    bidResult[index] = item.getAttribute("data-bid");
                });
                this.blacklist.preDel = bidResult.join("|");
                console.log(bidResult.join("|"));
                this.request('removeBlacklist');
            }
        }
    }
</script>

<style scoped lang="scss">
    .con-blacklist {

        .list-group-item {
            height: 62px;
            line-height: 40px;
            border-bottom: 1px solid $colorBorder;
            margin-bottom: 0;

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
