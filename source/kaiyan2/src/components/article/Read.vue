<template>
    <div>
        <header>
            <i @click="routerBack()" class="iconfont icon-back pull-left"></i>
            <i class="iconfont icon-list pull-right"></i>
            <ul class="con-option sr-only">
                <li class="option-item">
                    <i class="iconfont icon-setting"></i>
                    <span>显示模式</span>
                </li>
                <li class="option-item">
                    <i class="iconfont icon-alert"></i>
                    <span>举报用户</span>
                </li>
            </ul>
        </header>
        <section class="con-header">
            <h3>Android：这是一份Handler消息传递机制的使用教程</h3>
            <div class="header-author">
                <img src="http://115.159.59.72/kaiyan/head/879646529.jpg" alt="head" />
                <span class="ml-10 font-16 font-bold">游学者、墨槿</span>
            </div>
            <div class="header-date">
                <span>2018-03-05 18:18</span>
                <div class="btn btn-default pull-right mt-5">移动互联网</div>
            </div>
        </section>
        <section class="con-article">
            <p>（原标题：“天呐！”特朗普让白宫医生任内阁部长）</p><p>当地时间28日，美国总统特朗普突然宣布退伍军人事务部部长舒尔金将离任，接替他的人是白宫医生罗尼·杰克逊。上周，杰克逊刚刚晋升为海军少将。不少美国媒体认为，替换舒尔金是特朗普高级幕僚团的又一次重大变革，提名杰克逊更是“令人震惊”。外界普遍质疑其缺乏管理经验，会给退伍军人事务部造成“管理真空”。</p><p>据《纽约时报》29日报道，在28日的声明中，特朗普对杰克逊不吝赞美之词：“杰克逊少将训练有素，他本人就是高素质的服役人员。他亲眼见证过老兵作出的巨大牺牲，对这些人为我们国家的付出怀抱着深深的谢意。” 报道说，现年50岁的杰克逊学医出身，于1995年加入美国海军，成为一名军医，多次在海外轮驻。2006年，杰克逊被任命为白宫医生，先后服务过小布什、奥巴马和特朗普三位总统。</p><p>据美国有线电视新闻网（CNN）29日报道，特朗普上台后，杰克逊迅速与总统打得火热。今年1月杰克逊陪同特朗普进行了任内首次体检。在上个月的一次募捐宴会上，特朗普大赞杰克逊“举止就像好莱坞巨星”。美国彭博新闻社29日称，特朗普经常在朋友面前表示，“我喜欢这个人”。去年9月，舒尔金曾举荐杰克逊当退伍军人部副部长。消息人士透露，特朗普认为杰克逊对退伍军人事务很了解，此外他还有一个优势：因为是三任总统的医生，杰克逊已经通过安全检查（这是担任退伍军人事务部部长必须的条件），而且他熟知特朗普的健康情况。</p><p>杰克逊为外界所熟知，还是在今年1月16日一次白宫简报会上。当时外界对特朗普的精神状态是否适合担任总统充满疑问，杰克逊在简报会上事无巨细地回答了记者有关特朗普健康的提问。他开门见山地宣布，“总统的整体健康状况非常好。他很容易通过了旨在测试他精神状态的认知评估。没有任何理由认为总统的精神有问题”。杰克逊说，特朗普不碰烟酒，这是他身体健康的原因，他肯定能干完第一个总统任期。</p><p>作为职业军医，杰克逊并没有管理行政机构的经历。这也成为外界质疑他的主要原因。美国“政治”网站28日引述一名前退伍军人事务部高官的话说，“我的第一反应是：‘我的天呐’。杰克逊一点经验都没有，而退伍军人事务部又是个最难管理的部门，因为那里充满了政治争斗。” 美国《大西洋月刊》28日称，已经下台的舒尔金上任前就是退伍军人事务部副部长，而舒尔金的前任麦克唐纳则是宝洁公司首席执行官，他们的经验显然要更丰富。文章调侃说，至少杰克逊在谈论特朗普健康状况时表现不错。毕竟从过去到现在，“公开场合像演员的良好表现”一直是特朗普挑选人才的重要标准。《纽约时报》29日称，作为一国元首，特朗普喜欢自己的圈子里是熟悉的面孔，只要对胃口，特朗普就给他们封个官。实际上，白宫还将迎来一名真正的演员——卡洛琳·桑恩。《华盛顿邮报》28日报道说，这位曾演过《舞动青春》的童星今年22岁，将担任白宫新闻助理。报道称，卡洛琳曾在白宫做过实习生，还在众议院多数党领袖麦卡锡办公室实习过。</p><p>在被辞掉后，舒尔金29日在《纽约时报》撰文炮轰华盛顿的政治氛围，称“那里变得有毒、混乱、礼仪丧失、充满破坏性，已经让我无法完成本职工作”。他表示，在即将离开华盛顿之际，“我不停思考：服务国家不应该如此艰难”。舒尔金称自己行事正直，却“被错误指责，指责者希望我别挡道”。</p><p>美国国会议员也大都对杰克逊的任命不以为然。美国参议院退伍军人委员会主席艾萨克森28日称，参议院需要知道杰克逊的更多信息才能决定是否确认这一提名。美国残废退伍军人组织和美国退伍军人协会则警告称，退伍军人事务部可能出现“管理真空”。众议院退伍军人委员会主席罗伊28日则表示，虽然他尊重特朗普的决定，但是“到头来，内阁成员都根据总统好恶遴选”。</p><p>美国退伍军人事务部要为2000万名退伍军人的健康和福利负责。《纽约时报》认为，杰克逊无疑会面临一系列挑战，退伍军人事务部是美国政府的第二大部门，雇员36万之多，多年来一直面临办公设备老化和机构臃肿的诟病。民主党、部分温和共和党人以及退伍军人协会都担心，辞掉舒尔金是特朗普政府为进一步对退伍军人事务部进行激进改革铺路，让退伍军人的服务更多来自私有部门，而不是靠国家财政支出。而这是退伍军人组织极力反对的。美国沃克斯新闻网28日称，特朗普可能要与支持他的老兵们展开一场“政治战斗”。</p><p>本文来源：环球时报-环球网 。更多精彩，请登录环球网http://www.huanqiu.com责任编辑：姬雪莹_NN6784</p>
        </section>
        <section class="con-comment">
            <div class="comment-header">
                <div class="header-article">
                    评论数&nbsp;
                    <span v-text="'518'"></span>
                </div>
                <div class="dropdown" id="menu">
                    <button class="btn btn-default dropdown-toggle">
                        <span v-text="choice.title"></span>
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li @click="choose(0)"><a href="javascript:;">按时间正序</a></li>
                        <li role="separator" class="divider"></li>
                        <li @click="choose(1)"><a href="javascript:;">按时间倒序</a></li>
                    </ul>
                </div>
            </div>
            <ul class="comment-list">
                <li class="comment-item">
                    <div class="comment-author">
                        <img src="http://115.159.59.72/kaiyan/head/879646529.jpg" alt="head" />
                        <span class="ml-5 font-16 font-bold">游学者、墨槿</span>
                        <i class="iconfont icon-comment pull-right ml-10"></i>
                        <span class="color-intro pull-right font-12">2018-03-05 18:18</span>
                    </div>
                    <div class="comment-content">人生若只如初见</div>
                    <ul class="comment-reply">
                        <li class="reply-item">
                            <span class="color-main">耗子爱骑车：@</span>
                            <span class="color-main">游学者、墨槿</span>&nbsp;
                            <span>同意</span>
                        </li>
                        <li class="reply-item">
                            <span class="color-main">耗子爱骑车：@</span>
                            <span class="color-main">游学者、墨槿</span>&nbsp;
                            <span>同意</span>
                        </li>
                        <li class="reply-item">
                            <span class="color-main">耗子爱骑车：@</span>
                            <span class="color-main">游学者、墨槿</span>&nbsp;
                            <span>同意</span>
                        </li>
                    </ul>
                </li>
                <li class="comment-item">
                    <div class="comment-author">
                        <img src="http://115.159.59.72/kaiyan/head/879646529.jpg" alt="head" />
                        <span class="ml-5 font-16 font-bold">游学者、墨槿</span>
                        <i class="iconfont icon-comment pull-right ml-10"></i>
                        <span class="color-intro pull-right font-12">2018-03-05 18:18</span>
                    </div>
                    <div class="comment-content">人生若只如初见</div>
                    <ul class="comment-reply">
                        <li class="reply-item">
                            <span class="color-main">耗子爱骑车：@</span>
                            <span class="color-main">游学者、墨槿</span>&nbsp;
                            <span>同意</span>
                        </li>
                        <li class="reply-item">
                            <span class="color-main">耗子爱骑车：@</span>
                            <span class="color-main">游学者、墨槿</span>&nbsp;
                            <span>同意</span>
                        </li>
                        <li class="reply-item">
                            <span class="color-main">耗子爱骑车：@</span>
                            <span class="color-main">游学者、墨槿</span>&nbsp;
                            <span>同意</span>
                        </li>
                    </ul>
                </li>
                <li class="comment-item">
                    <div class="comment-author">
                        <img src="http://115.159.59.72/kaiyan/head/879646529.jpg" alt="head" />
                        <span class="ml-5 font-16 font-bold">游学者、墨槿</span>
                        <i class="iconfont icon-comment pull-right ml-10"></i>
                        <span class="color-intro pull-right font-12">2018-03-05 18:18</span>
                    </div>
                    <div class="comment-content">人生若只如初见</div>
                    <ul class="comment-reply">
                        <li class="reply-item">
                            <span class="color-main">耗子爱骑车：@</span>
                            <span class="color-main">游学者、墨槿</span>&nbsp;
                            <span>同意</span>
                        </li>
                        <li class="reply-item">
                            <span class="color-main">耗子爱骑车：@</span>
                            <span class="color-main">游学者、墨槿</span>&nbsp;
                            <span>同意</span>
                        </li>
                        <li class="reply-item">
                            <span class="color-main">耗子爱骑车：@</span>
                            <span class="color-main">游学者、墨槿</span>&nbsp;
                            <span>同意</span>
                        </li>
                    </ul>
                </li>
            </ul>
        </section>
        <section class="con-oper">
            <div class="oper-item">
                <i class="iconfont icon-comment"></i>
                <div>评论&nbsp;<span>815</span></div>
            </div>
            <div class="oper-item">
                <i class="iconfont icon-unlike"></i>
                <div>喜欢&nbsp;<span>1000</span></div>
            </div>
            <div class="oper-item">
                <i class="iconfont icon-book"></i>
                <div>阅读&nbsp;<span>2534</span></div>
            </div>
        </section>
        <section class="con-reply">
            <textarea placeholder="@耗子爱骑车"></textarea>
            <div class="btn btn-default pull-right mt-10">发表评论</div>
        </section>
    </div>
</template>

<script type="text/ecmascript-6">
    export default {
        name: "Read",
        data() {
            return {
                choice: {
                    title: '按时间正序',
                    option: 0
                },
            }
        },
        mounted() {
            this.$nextTick(function () {
                $("#menu").on("click", function (e) {
                    let target = e.target;
                    if (target.tagName === "SPAN" || target.tagName === "BUTTON") {
                        $(this).find(".dropdown-menu").slideDown(500);
                    } else if (target.tagName === "A") {
                        $(this).find(".dropdown-menu").slideUp(500);
                    }
                });
                console.log(this.$route.params.aid);
            });
        },
        methods: {
            routerBack() {
                this.$router.back();
            },
            choose(option) {
                if (Number(option) === 0) {
                    this.choice.title = "最新文章";
                } else {
                    this.choice.title = "热门文章";
                }

                this.choice.option = option;
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

                span {
                    position: relative;
                    top: -2px;
                }
            }
        }
    }
    .con-header {
        height: 150px;
        padding: 10px;
        border-bottom: 1px solid rgba(0,0,0,0.1);

        h3 {
            margin: 0;
            font-size: 18px;
            font-weight: bold;
        }
        .header-author,
        .header-date {
            margin-top: 5px;
            height: 40px;
            line-height: 40px;

            img {
                width: 40px;
                height: 40px;
                border-radius: 20px;
            }
        }
    }
    .con-article {
        height: auto;
        padding: 20px;
        overflow: auto;

        p {
            text-indent: 2em;
        }
    }
    .con-comment {
        padding-bottom: 60px;
        border-top: 1px solid rgba(0,0,0,0.1);
        border-bottom: 1px solid rgba(0,0,0,0.1);

        .comment-header {
            height: 40px;
            padding: 0 10px;
            border-bottom: 1px solid rgba(0,0,0,0.1);

            .header-article {
                height: 100%;
                line-height: 40px;
                color: #0099cc;
                float: left;
            }
            .dropdown {
                width: 100px;
                margin-top: 5px;
                float: right;

                .dropdown-toggle {
                    width: 100px;
                }
                .dropdown-menu {
                    width: 100px;
                    min-width: 100px;

                    a {
                        height: 30px;
                        line-height: 30px;
                        padding: 0;
                        text-align: center;
                    }
                    .divider {
                        height: 1px;
                        line-height: 1px;
                        margin: 0;
                    }
                }
            }
        }
        .comment-list {
            padding: 10px;
            margin-bottom: -1px;

            .comment-item {
                padding-top: 10px;
                border-bottom: 1px solid rgba(0,0,0,0.1);

                .comment-author {
                    height: 40px;
                    line-height: 40px;

                    img {
                        width: 40px;
                        height: 40px;
                        border-radius: 20px;
                    }
                    i {
                        font-size: 24px;
                    }
                }
                .comment-content {
                    margin-top: 10px;
                    padding-bottom: 10px;
                    border-bottom: 1px dashed rgba(0,0,0,0.1);
                }
                .comment-reply {
                    margin: 10px 0;

                    .reply-item {
                        margin-bottom: 10px;
                    }
                }
            }
        }
    }
    .con-oper {
        display: flex;
        position: fixed;
        bottom: 0;
        z-index: 1000;
        width: 100%;
        height: 50px;
        border-top: 1px solid rgba(0,0,0,0.1);
        background-color: #fff;

        .oper-item {
            width: 33%;
            height: 100%;
            text-align: center;
            flex-direction: row;
            /*line-height: 50px;*/

            i {
                font-size: 1.5em;
            }
            div {
                font-size: 0.7em;
                color: #666;
            }
        }
    }
    .con-reply {
        position: fixed;
        bottom: 50px;
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
