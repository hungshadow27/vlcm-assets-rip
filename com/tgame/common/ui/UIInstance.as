package com.tgame.common.ui
{
   import com.tgame.common.ui.componets.LoadingBar;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.login.view.compoents.LoginUI;
   import com.tgame.shell.view.components.AccomplishmentPanel;
   import com.tgame.shell.view.components.ActivePanel;
   import com.tgame.shell.view.components.AmuletPanel;
   import com.tgame.shell.view.components.AutoFightPanel;
   import com.tgame.shell.view.components.Backpack;
   import com.tgame.shell.view.components.BaoShiJianShangPanel;
   import com.tgame.shell.view.components.BiGuangPanel;
   import com.tgame.shell.view.components.BiWuZhaoQinPanel;
   import com.tgame.shell.view.components.BiwuCrossPlatform_Panel;
   import com.tgame.shell.view.components.BiwuDuijueCrossP_Panel;
   import com.tgame.shell.view.components.BiwuDuijue_Panel;
   import com.tgame.shell.view.components.BossRefurbish.XiangYangZhanChangCanvas;
   import com.tgame.shell.view.components.BossRefurbish.YNXiangyangzhanchangRankPanel;
   import com.tgame.shell.view.components.BuchangFubenPanel;
   import com.tgame.shell.view.components.ButtonContainer;
   import com.tgame.shell.view.components.CardGiftPanel;
   import com.tgame.shell.view.components.ChaoJiLaBaPanel;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.ChristmasRank.ChristmasRankCanvas;
   import com.tgame.shell.view.components.ChuanGongWuXuePanel;
   import com.tgame.shell.view.components.ChuanShuoZhuangBeiDaZaoPanel;
   import com.tgame.shell.view.components.CurioCollectPanel;
   import com.tgame.shell.view.components.CycTaskPanel;
   import com.tgame.shell.view.components.DantianWuxueDanPanel;
   import com.tgame.shell.view.components.DepotPanel;
   import com.tgame.shell.view.components.EquipPuddingPanel;
   import com.tgame.shell.view.components.EquipPuddingTwoPanel;
   import com.tgame.shell.view.components.EquipRepairPanel;
   import com.tgame.shell.view.components.FabaoPanel;
   import com.tgame.shell.view.components.FashionPanel;
   import com.tgame.shell.view.components.FriendPanel;
   import com.tgame.shell.view.components.GeRenChengHao;
   import com.tgame.shell.view.components.GiftCardPanel;
   import com.tgame.shell.view.components.GiftPanel;
   import com.tgame.shell.view.components.GoldSquirrelGiftPanel;
   import com.tgame.shell.view.components.GongchengPaoPanel;
   import com.tgame.shell.view.components.GumuMishiChuansongPanel;
   import com.tgame.shell.view.components.HuangTuBaYeChaKanXinXiPanel;
   import com.tgame.shell.view.components.HuangTuBaYePanel;
   import com.tgame.shell.view.components.HuizhangDazaoHechengPanel;
   import com.tgame.shell.view.components.InfoQueryPanel;
   import com.tgame.shell.view.components.InstanceConvectionPanel;
   import com.tgame.shell.view.components.InstancePortalPanel;
   import com.tgame.shell.view.components.InstanceTimeRankingPanel;
   import com.tgame.shell.view.components.ItemSynthesizePanel;
   import com.tgame.shell.view.components.JiLeiZhiPanel;
   import com.tgame.shell.view.components.JuBaoPenPanel;
   import com.tgame.shell.view.components.KongMingLockPanel;
   import com.tgame.shell.view.components.KuaFuLeiTaiPanel;
   import com.tgame.shell.view.components.KuaFuZhanChangPanel;
   import com.tgame.shell.view.components.KuafuLunjianBackpack;
   import com.tgame.shell.view.components.KungFuPanel;
   import com.tgame.shell.view.components.LaunchProposalPanel;
   import com.tgame.shell.view.components.LeftTopTipsSprite;
   import com.tgame.shell.view.components.Liaoshang_SearchPlayerPanel;
   import com.tgame.shell.view.components.LongWenKeHuaPanel;
   import com.tgame.shell.view.components.MaillJiFenPanel;
   import com.tgame.shell.view.components.MainUI;
   import com.tgame.shell.view.components.MallFestivalPanel;
   import com.tgame.shell.view.components.MallLunjianPanel;
   import com.tgame.shell.view.components.MallPanel;
   import com.tgame.shell.view.components.MarriageCashGiftListPanel;
   import com.tgame.shell.view.components.MarriageDinePanel;
   import com.tgame.shell.view.components.MarriageGiveCashGiftPanel;
   import com.tgame.shell.view.components.MarriageSuccePanel;
   import com.tgame.shell.view.components.MarriageWeddingPanel;
   import com.tgame.shell.view.components.MeiRenPanel;
   import com.tgame.shell.view.components.MenPaiJueXue;
   import com.tgame.shell.view.components.MenPaiNeiFa;
   import com.tgame.shell.view.components.MenghuanShuxingKa;
   import com.tgame.shell.view.components.MoXueBabyPanel;
   import com.tgame.shell.view.components.MoXueZhanChangPanel;
   import com.tgame.shell.view.components.MonthSignIn;
   import com.tgame.shell.view.components.MysteryMallPanel;
   import com.tgame.shell.view.components.NPCShopPanel;
   import com.tgame.shell.view.components.NewYearPanel;
   import com.tgame.shell.view.components.NpcDialogPanel;
   import com.tgame.shell.view.components.OtherPlayerShopPanel;
   import com.tgame.shell.view.components.PartyBoss_InvitePanel;
   import com.tgame.shell.view.components.PartyContributePanel;
   import com.tgame.shell.view.components.PartyFlagInstallPanel;
   import com.tgame.shell.view.components.PartyFlagPanel;
   import com.tgame.shell.view.components.PartyKungfuPanel;
   import com.tgame.shell.view.components.PartyListPanel;
   import com.tgame.shell.view.components.PartyPanel;
   import com.tgame.shell.view.components.Party_createPanel;
   import com.tgame.shell.view.components.Party_infoPanel;
   import com.tgame.shell.view.components.Party_memberManagePanel;
   import com.tgame.shell.view.components.Party_taskPanel;
   import com.tgame.shell.view.components.Party_task_InvitePanel;
   import com.tgame.shell.view.components.Party_task_PrisePanel;
   import com.tgame.shell.view.components.PlayerShopListPanel;
   import com.tgame.shell.view.components.PlayerShopPanel;
   import com.tgame.shell.view.components.PopMapPanel;
   import com.tgame.shell.view.components.ProposalAffirmPanel;
   import com.tgame.shell.view.components.QianchuiBailianPanel;
   import com.tgame.shell.view.components.QingGongYanOverPanel;
   import com.tgame.shell.view.components.QingGongYanPanel;
   import com.tgame.shell.view.components.QingRenJie_ChaXunWanJiaPanel;
   import com.tgame.shell.view.components.QingRenJie_SongHuaBangPanel;
   import com.tgame.shell.view.components.QingZhu.YN2017QingzhuPanel;
   import com.tgame.shell.view.components.RankingListPanel;
   import com.tgame.shell.view.components.RankingYNPanel;
   import com.tgame.shell.view.components.RefreshPointPanel;
   import com.tgame.shell.view.components.RideAttributePanel;
   import com.tgame.shell.view.components.RideDepotPanel;
   import com.tgame.shell.view.components.RideDreamDanPanel;
   import com.tgame.shell.view.components.RideJiaohuanMoshouPanel;
   import com.tgame.shell.view.components.RideJiaohuanShenshouPanel;
   import com.tgame.shell.view.components.RidePanel;
   import com.tgame.shell.view.components.RideQianNengDanPanel;
   import com.tgame.shell.view.components.RideSkillResetPanel;
   import com.tgame.shell.view.components.RideYinCangShuXingJiHuoPanel;
   import com.tgame.shell.view.components.RongXunDanPanel;
   import com.tgame.shell.view.components.SheliziEnchasePanel;
   import com.tgame.shell.view.components.ShenDiaoXiaLv;
   import com.tgame.shell.view.components.ShenQiJinHuaPanel;
   import com.tgame.shell.view.components.ShenbingJuexingXiangqianPanel;
   import com.tgame.shell.view.components.ShengDanXunZhangPanel;
   import com.tgame.shell.view.components.ShiJianShaLou;
   import com.tgame.shell.view.components.ShiTuSystemPanel;
   import com.tgame.shell.view.components.ShishiZhankuangPanel;
   import com.tgame.shell.view.components.ShouYuanChouJiangPanel;
   import com.tgame.shell.view.components.ShuangXiu_SearchPlayerPanel;
   import com.tgame.shell.view.components.ShuxingDazaokaPanel;
   import com.tgame.shell.view.components.SiLingZhenPanel;
   import com.tgame.shell.view.components.SquirrelGiftPanel;
   import com.tgame.shell.view.components.StoneOptionSmallPanel;
   import com.tgame.shell.view.components.StonePanel;
   import com.tgame.shell.view.components.SystemPanel;
   import com.tgame.shell.view.components.TAKungfuPanel;
   import com.tgame.shell.view.components.TAVenationPanel;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.tgame.shell.view.components.TaskPanel;
   import com.tgame.shell.view.components.TeamPanel;
   import com.tgame.shell.view.components.TianFuSuiPianHeChengPanel;
   import com.tgame.shell.view.components.TianJiangXiangRuiPanel;
   import com.tgame.shell.view.components.TianMenBuZhenPanel;
   import com.tgame.shell.view.components.TianShangZhiHunShengJiePanel;
   import com.tgame.shell.view.components.TopStonePanel;
   import com.tgame.shell.view.components.TradingPanel;
   import com.tgame.shell.view.components.TreasureMapPanel;
   import com.tgame.shell.view.components.TuLongFuBenPanel;
   import com.tgame.shell.view.components.VIP;
   import com.tgame.shell.view.components.WanJiaHuiKuiPanel;
   import com.tgame.shell.view.components.WanfaShiyiTuPanel;
   import com.tgame.shell.view.components.WangzhezhibangPanel;
   import com.tgame.shell.view.components.WishingTree;
   import com.tgame.shell.view.components.WuxiakapaiPanel;
   import com.tgame.shell.view.components.WuxiakapaiXiangxiPanel;
   import com.tgame.shell.view.components.XiangQianTianFuPanel;
   import com.tgame.shell.view.components.XiangYangGuiShuPanel;
   import com.tgame.shell.view.components.XianshiDajiangDuihuanPanel;
   import com.tgame.shell.view.components.XiaoYaoYuFengSheZhiFPanel;
   import com.tgame.shell.view.components.XinMo;
   import com.tgame.shell.view.components.XinfaPanel;
   import com.tgame.shell.view.components.XinnianZhufuPanel;
   import com.tgame.shell.view.components.XunZhangAndZhanQiDuanZhaoPanel;
   import com.tgame.shell.view.components.XunZhangHeChengPanel;
   import com.tgame.shell.view.components.XunzhangDuihuanPanel;
   import com.tgame.shell.view.components.XunzhangOptionSmallPanel;
   import com.tgame.shell.view.components.XunzhangShowPanel;
   import com.tgame.shell.view.components.YN2016LiumaijianPanel;
   import com.tgame.shell.view.components.YN2016WangzhezhanqiPanel;
   import com.tgame.shell.view.components.YN2016XiuweiwuxuePanel;
   import com.tgame.shell.view.components.YN2017Wangzhe10zhuangbeiPanel;
   import com.tgame.shell.view.components.YNAojiansuipianhechengPanel;
   import com.tgame.shell.view.components.YNAojianzhizaoPanel1;
   import com.tgame.shell.view.components.YNAojianzhizaoPanel2;
   import com.tgame.shell.view.components.YNGoodDeletePanel;
   import com.tgame.shell.view.components.YNLongzhizhufuPanel;
   import com.tgame.shell.view.components.YNOnLinePanel;
   import com.tgame.shell.view.components.YNRenamePanel;
   import com.tgame.shell.view.components.YNRichangPanel;
   import com.tgame.shell.view.components.YNShijiebeiRankPanel;
   import com.tgame.shell.view.components.YNZhongqiuLingjiangPanel;
   import com.tgame.shell.view.components.YNjinxiangPanel;
   import com.tgame.shell.view.components.YNjubaopenPanel;
   import com.tgame.shell.view.components.YNlianhuanchongzhiPanel;
   import com.tgame.shell.view.components.YNzhizuozongziPanel;
   import com.tgame.shell.view.components.YuanPanGiftPanel;
   import com.tgame.shell.view.components.ZhanHunPanel;
   import com.tgame.shell.view.components.ZhandouliPanel;
   import com.tgame.shell.view.components.ZhanhundaiPanel;
   import com.tgame.shell.view.components.ZhenQiBabyPanel;
   import com.tgame.shell.view.components.ZhenQiBabyPanelTwoPanel;
   import com.tgame.shell.view.components.ZhiZhanZhiShangLingJiangPanel;
   import com.tgame.shell.view.components.ZhiZhanZhiShangPanel;
   import com.tgame.shell.view.components.ZhongZhiXuanYuanJianPanel;
   import com.tgame.shell.view.components.ZunRongWanBaoGePanel;
   import com.tgame.shell.view.components._0519.YN2017_0519Panel;
   import com.tgame.shell.view.components._1908.YN2017_1908Panel;
   import com.tgame.shell.view.components.activityTemp.ConeyGirlPanel;
   import com.tgame.shell.view.components.aidehuibao.YN2017AidehuibaoPanel;
   import com.tgame.shell.view.components.amulet.HushenfuXilianCanvas;
   import com.tgame.shell.view.components.aojianfeisheng.AoJianFeiShengPanel;
   import com.tgame.shell.view.components.aojianzhuansheng.AoJianZhuanShengPanel;
   import com.tgame.shell.view.components.aojianzhuzao.AoJianZhuZaoPanel;
   import com.tgame.shell.view.components.attribute.AnqiActivation;
   import com.tgame.shell.view.components.attribute.Rijinlun;
   import com.tgame.shell.view.components.attribute.WuHunPanel;
   import com.tgame.shell.view.components.attribute.XiantianWujingPanel;
   import com.tgame.shell.view.components.attribute.XiaoZhuKuaiPaoPanel;
   import com.tgame.shell.view.components.attribute.YuLingHeChengPanel;
   import com.tgame.shell.view.components.baguazhen.BaGuaZhenPanel;
   import com.tgame.shell.view.components.baihuxingjun.YN2017BaihuxingjunPanel;
   import com.tgame.shell.view.components.baiqiaokeli.BaiQiaoKeLiPanel;
   import com.tgame.shell.view.components.banbenyouhui.BanBenYouHuiPanel;
   import com.tgame.shell.view.components.baoshijianshang.BaoShiJianShangGuiZeJieShaoPanel;
   import com.tgame.shell.view.components.baoshiyangcheng.BaoShiYangChengPanel;
   import com.tgame.shell.view.components.bayuetou.YN2017BayuetouPanel;
   import com.tgame.shell.view.components.biwudahui.BiwudahuiVSPanel;
   import com.tgame.shell.view.components.changnianchongzhi.ChangNianChongZhiPanel;
   import com.tgame.shell.view.components.chaojixianglongzhouqi.YNChaojixianglongzhouqiPanel;
   import com.tgame.shell.view.components.chaojizhouqi.ChaoJiZhouQiPanel;
   import com.tgame.shell.view.components.chongjiuhuodong.YN2017ChongjiuhuodongPanel;
   import com.tgame.shell.view.components.chongjiuzhiyang.YnChongjiezhiyangPanel;
   import com.tgame.shell.view.components.chunjie123.ChuEr2019Panel;
   import com.tgame.shell.view.components.chunjie123.ChuSan2019Panel;
   import com.tgame.shell.view.components.chunjie123.ChuYi2019Panel;
   import com.tgame.shell.view.components.chunjie123.ChunTianLeiJiPanel;
   import com.tgame.shell.view.components.chunjie123.XinShouLeiJiPanel;
   import com.tgame.shell.view.components.chunjie123.YN2017ChunjiehuodongPanel;
   import com.tgame.shell.view.components.cisha.CiShaQianZhuangPanel;
   import com.tgame.shell.view.components.cisha.CishaJiangliPanel;
   import com.tgame.shell.view.components.cisha.CishaMilingCanvas;
   import com.tgame.shell.view.components.cisha.DiXiaQianZhuangPanel;
   import com.tgame.shell.view.components.cisha.FuChouOKPanel;
   import com.tgame.shell.view.components.conquerPanel;
   import com.tgame.shell.view.components.dagengxinhuodong.DaGengXinHuoDongPanel;
   import com.tgame.shell.view.components.dahuangjinzhouqi.DaHuangJinZhouQiPanel;
   import com.tgame.shell.view.components.dantiaowang.DanTiaoWangShuomingPanel;
   import com.tgame.shell.view.components.dashengzhouqi.DaShengZhouQiPanel;
   import com.tgame.shell.view.components.dianfengzhouqi.YN2017DianfengzhouqiPanel;
   import com.tgame.shell.view.components.dingfngzhouqi.YN2016DingfengzhouqiPanel;
   import com.tgame.shell.view.components.dishi.YN2017DishiPanel;
   import com.tgame.shell.view.components.diwucikaizhan.YN2017DiwucikaizhanPanel;
   import com.tgame.shell.view.components.duanwu2018.YingJieDuanWuJie2018Panel;
   import com.tgame.shell.view.components.duanwujie.DuanWuJiePanel;
   import com.tgame.shell.view.components.duanwujie2015.DuanWuJie2015Panel;
   import com.tgame.shell.view.components.duijuezhouqi.YN2017DuiJueZhouQiPanel;
   import com.tgame.shell.view.components.duixueren.DuiXueRenPanel;
   import com.tgame.shell.view.components.equippudding.EquipKaiFengPanel;
   import com.tgame.shell.view.components.fabao.FabaoGuanzhuDesc;
   import com.tgame.shell.view.components.fabao.FabaoTupoPanel;
   import com.tgame.shell.view.components.fabao.Fabao_LingliPanel;
   import com.tgame.shell.view.components.fabao.Fabao_lingliFullPanel;
   import com.tgame.shell.view.components.fangyanhua.YN2017FangyanhuaPanel;
   import com.tgame.shell.view.components.feishengjingjie.YN2017FeishengjingjiePanel;
   import com.tgame.shell.view.components.feishengshenbao.FeiShengShenBaoPanel;
   import com.tgame.shell.view.components.fengzhengjie.FengZhengJiePanel;
   import com.tgame.shell.view.components.fengzhengjie.FengZhengJieRankPanel;
   import com.tgame.shell.view.components.fengzhengjie.FengzhengjieXunzhangDuihuanPanel;
   import com.tgame.shell.view.components.fodan.YN2017FodanPanel;
   import com.tgame.shell.view.components.fulihuodong.FuLiHuoDongPanel;
   import com.tgame.shell.view.components.funvjie2018.FuNvJie2018Panel;
   import com.tgame.shell.view.components.funvjie2018.FuNvJieHeLiPanel;
   import com.tgame.shell.view.components.funvjie2018.FuNvJiePaiHangPanel;
   import com.tgame.shell.view.components.fuqitongxin.YN2016FuqitongxinPaihangbangPanel;
   import com.tgame.shell.view.components.fuqitongxin.YN2016FuqitongxinPanel;
   import com.tgame.shell.view.components.ganjiangmoyezhuzao.GanJiangMoYeZhuZaoPanel;
   import com.tgame.shell.view.components.gongfayouhui.GongFaYouHuiPanel;
   import com.tgame.shell.view.components.guoqingzengsong.GuoQingZengSongPanel;
   import com.tgame.shell.view.components.guoqingzhouqi.GuoQingZhouQiPanel;
   import com.tgame.shell.view.components.guosetianxiang.YN2017GuoSeTianXiangPanel;
   import com.tgame.shell.view.components.hanshijie.HanShiJiePanel;
   import com.tgame.shell.view.components.huangjinshu.HuangJinShuPanel;
   import com.tgame.shell.view.components.huanqiukaimu.HuanQiuKaiMuPanel;
   import com.tgame.shell.view.components.huanyingbayue.HuanYingBaYuePanel;
   import com.tgame.shell.view.components.huanyingweixi.YN2017HuanyingweixiPanel;
   import com.tgame.shell.view.components.huashanlunjian.YN2016HuashanlunjianPanel;
   import com.tgame.shell.view.components.huazhuangAndChibang.YN2017ChibanglibaoPanel;
   import com.tgame.shell.view.components.huazhuangAndChibang.YN2017HuazhuanglibaoPanel;
   import com.tgame.shell.view.components.huodong.BajiguiyuanhufuDakongPanel;
   import com.tgame.shell.view.components.huodong.DaoJuTiQuKaPanel;
   import com.tgame.shell.view.components.huodong.HuXinYaoTiShengPanel;
   import com.tgame.shell.view.components.huodong.HuyiKaiguangPanel;
   import com.tgame.shell.view.components.huodong.HuyiLingHuaPanel;
   import com.tgame.shell.view.components.huodong.HuyiXiLianPanel;
   import com.tgame.shell.view.components.huodong.LiandanluPanel;
   import com.tgame.shell.view.components.huodong.MallHuodongPanel;
   import com.tgame.shell.view.components.huodong.MenghuanSishengshouPanel;
   import com.tgame.shell.view.components.huodong.QiangHuaPanel;
   import com.tgame.shell.view.components.huodong.ShenlongDakongPanel;
   import com.tgame.shell.view.components.huodong.SiShengShouKeWenPanel;
   import com.tgame.shell.view.components.huodong.TishengZhuangbeiMenghuanPanel;
   import com.tgame.shell.view.components.huodong.TutengShuxingTihuankaPanel;
   import com.tgame.shell.view.components.huodong.WuxieZhijingPanel;
   import com.tgame.shell.view.components.huodong.XunZhangluPanel;
   import com.tgame.shell.view.components.huodong.ZhuangbeiJihuoPanel;
   import com.tgame.shell.view.components.huodong.timeBaozangPanel;
   import com.tgame.shell.view.components.huodong0519.HuoDong0519Panel;
   import com.tgame.shell.view.components.huozhenjiahsi.YN2017HuozhenjiashiPanel;
   import com.tgame.shell.view.components.jianghun.JiangHunPanel_CN;
   import com.tgame.shell.view.components.jianghuzhan.JiangHuZhanPanel;
   import com.tgame.shell.view.components.jingjichang.JingjiChangBaomingPanel;
   import com.tgame.shell.view.components.jingjichang.JingjiResultPanel;
   import com.tgame.shell.view.components.jingjichang.JingjiVSPanel;
   import com.tgame.shell.view.components.jinshenzhouqi.JinShenZhouQiPanel;
   import com.tgame.shell.view.components.jiujiexingtu.JiuJieXingTuPanel;
   import com.tgame.shell.view.components.jiujiexingtu.JiuJieXingTu_BoxView;
   import com.tgame.shell.view.components.kaixuepaihangbang.TijiaowupinPanel;
   import com.tgame.shell.view.components.kaixuepaihangbang.YN2016PaihangbangPanel;
   import com.tgame.shell.view.components.kaixueqiqiu.YN2017KaixueqiqiuPanel;
   import com.tgame.shell.view.components.kuafuleitai.KuafuleitaiResultPanel;
   import com.tgame.shell.view.components.laodongjie2018.LaoDongJie2018Panel;
   import com.tgame.shell.view.components.liangtianleiji.LiangTianLeiJiPanel;
   import com.tgame.shell.view.components.lianxubaoming.LianXuBaoMingPanel;
   import com.tgame.shell.view.components.libaozhouqi.YN2017LibaozhouqiPanel;
   import com.tgame.shell.view.components.lieshouhuodong.LieShouPaiHang2Panel;
   import com.tgame.shell.view.components.lieshouhuodong.LieShouPaiHangPanel;
   import com.tgame.shell.view.components.lihejue.YN2017LihejuePanel;
   import com.tgame.shell.view.components.liunianhuodong.DiWangLiHe2Panel;
   import com.tgame.shell.view.components.liunianhuodong.LianXuDengLu7Tian2022Panel;
   import com.tgame.shell.view.components.liunianhuodong.TeBieLeiChong2022Panel;
   import com.tgame.shell.view.components.liunianhuodong.XinShouQiZhen3Panel;
   import com.tgame.shell.view.components.liunianhuodong.XinShouQiZhen4Panel;
   import com.tgame.shell.view.components.liunianhuodong.YNGanenliunianPanel;
   import com.tgame.shell.view.components.liunianhuodong.YNHuazhuangdasaiPanel;
   import com.tgame.shell.view.components.liunianhuodong.YNLiunianhuodongPanel;
   import com.tgame.shell.view.components.liunianhuodong.YNLiunianpeibanPanel;
   import com.tgame.shell.view.components.liunianhuodong.YNShengrizhouqiPanel;
   import com.tgame.shell.view.components.liupaijingji.DiWangLiHePanel;
   import com.tgame.shell.view.components.liupaijingji.DuanWuSanWangPanel;
   import com.tgame.shell.view.components.liupaijingji.LeiJiZhengXiongPanel;
   import com.tgame.shell.view.components.liupaijingji.QiangGou16Panel;
   import com.tgame.shell.view.components.liupaijingji.TianXiaQiZhen2Panel;
   import com.tgame.shell.view.components.liupaijingji.TianXiaQiZhenPanel;
   import com.tgame.shell.view.components.liupaijingji.XinShouQiZhen1Panel;
   import com.tgame.shell.view.components.liupaijingji.XinShouQiZhen2Panel;
   import com.tgame.shell.view.components.liupaijingji.YN2016LiupaijingjiPanel;
   import com.tgame.shell.view.components.liupaijingji.ZhongQiuWanLuPanel;
   import com.tgame.shell.view.components.liuyiertongjie.BaiSe2020Panel;
   import com.tgame.shell.view.components.liuyiertongjie.ChunJieErPanel;
   import com.tgame.shell.view.components.liuyiertongjie.ChunJieSanPanel;
   import com.tgame.shell.view.components.liuyiertongjie.ChunJieYiPanel;
   import com.tgame.shell.view.components.liuyiertongjie.ChunTuanYuanPanel;
   import com.tgame.shell.view.components.liuyiertongjie.GuangRongDaRiPanel;
   import com.tgame.shell.view.components.liuyiertongjie.QingRenJie2020Panel;
   import com.tgame.shell.view.components.liuyiertongjie.SanBaJie2020Panel;
   import com.tgame.shell.view.components.liuyiertongjie.Shuang12Panel;
   import com.tgame.shell.view.components.liuyiertongjie.XinChunYingLuPanel;
   import com.tgame.shell.view.components.liuyiertongjie.XiongWang2020Panel;
   import com.tgame.shell.view.components.liuyiertongjie.YN2017LiuyiertongjiePanel;
   import com.tgame.shell.view.components.liuyiertongjie.YuanXiaoJie2019Panel;
   import com.tgame.shell.view.components.liuyuedi.BaNianZhiMengPanel;
   import com.tgame.shell.view.components.liuyuedi.BaYueYouHuiPanel;
   import com.tgame.shell.view.components.liuyuedi.ChunJieSiPanel;
   import com.tgame.shell.view.components.liuyuedi.DaZheKouPanel;
   import com.tgame.shell.view.components.liuyuedi.GuoQingJie2019Panel;
   import com.tgame.shell.view.components.liuyuedi.LaYue28Panel;
   import com.tgame.shell.view.components.liuyuedi.LaYue29Panel;
   import com.tgame.shell.view.components.liuyuedi.LaYue30Panel;
   import com.tgame.shell.view.components.liuyuedi.LiuYueDi2019Panel;
   import com.tgame.shell.view.components.liuyuedi.NianDi2019Panel;
   import com.tgame.shell.view.components.liuyuedi.QiXiJie2019Panel;
   import com.tgame.shell.view.components.liuyuedi.QiYueDi2019Panel;
   import com.tgame.shell.view.components.liuyuedi.ShengDanJie2019Panel;
   import com.tgame.shell.view.components.liuyuedi.WanShengJie2019Panel;
   import com.tgame.shell.view.components.liuyuedi.XiaoNianJiePanel;
   import com.tgame.shell.view.components.liuyuedi.XinNianKuaiLe2019Panel;
   import com.tgame.shell.view.components.liuyuedi.XiongZhanBangPanel;
   import com.tgame.shell.view.components.liuyuedi.YN2017LiuyuediPanel;
   import com.tgame.shell.view.components.liuyuedi.YueNanFuNvJiePanel;
   import com.tgame.shell.view.components.liuyuedi.ZhenPinZhiMengVariantPanel;
   import com.tgame.shell.view.components.liuyuedi.ZhongQiuShangYuePanel;
   import com.tgame.shell.view.components.lixia2018.AnKangXingWangPanel;
   import com.tgame.shell.view.components.lixia2018.CaiLuGunGunPanel;
   import com.tgame.shell.view.components.lixia2018.LiXia2018Panel;
   import com.tgame.shell.view.components.lixia2018.WanShiRuYiPanel;
   import com.tgame.shell.view.components.lixia2018.XinNianDaJiPanel;
   import com.tgame.shell.view.components.lixia2018.ZhenPinZhiMengPanel;
   import com.tgame.shell.view.components.lixia2018.ZongLeiJiPanel;
   import com.tgame.shell.view.components.lliuyueqingzhu.CaiPiaoShowPanel;
   import com.tgame.shell.view.components.lliuyueqingzhu.CaoJunPanel;
   import com.tgame.shell.view.components.lliuyueqingzhu.DengLuLingJiangV632Panel;
   import com.tgame.shell.view.components.lliuyueqingzhu.LeTouPanel;
   import com.tgame.shell.view.components.lliuyueqingzhu.LeiChongLiWuPanel;
   import com.tgame.shell.view.components.lliuyueqingzhu.LiDongJie2023Panel;
   import com.tgame.shell.view.components.lliuyueqingzhu.LiDongLeiJi2023Panel;
   import com.tgame.shell.view.components.lliuyueqingzhu.LianXuLeiChongPanel;
   import com.tgame.shell.view.components.lliuyueqingzhu.MeiRiYouHuiPanel;
   import com.tgame.shell.view.components.lliuyueqingzhu.ShiErZhouNianQingZhuPanel;
   import com.tgame.shell.view.components.lliuyueqingzhu.ShuangSiYouHuiPanel;
   import com.tgame.shell.view.components.lliuyueqingzhu.TianJiangBaoXiangPanel;
   import com.tgame.shell.view.components.lliuyueqingzhu.YN2017LiuyueqingzhuPanel;
   import com.tgame.shell.view.components.lliuyueqingzhu.YouHui2888Panel;
   import com.tgame.shell.view.components.lliuyueyuanman.DaYanLiWuPanel;
   import com.tgame.shell.view.components.lliuyueyuanman.MaChaoPanel;
   import com.tgame.shell.view.components.lliuyueyuanman.ShengJieDaHuiKuiPanel;
   import com.tgame.shell.view.components.lliuyueyuanman.TeBieShangDianPanel;
   import com.tgame.shell.view.components.lliuyueyuanman.TeHui2021Panel;
   import com.tgame.shell.view.components.lliuyueyuanman.XinShangXianPanel;
   import com.tgame.shell.view.components.lliuyueyuanman.XueRenBaoZangPanel;
   import com.tgame.shell.view.components.lliuyueyuanman.YN2017LiuyueyuanmanPanel;
   import com.tgame.shell.view.components.lliuyueyuanman.ZheKouShangDian20240116Panel;
   import com.tgame.shell.view.components.lliuyueyuanman.ZhuangBeiHuanYuanPanel;
   import com.tgame.shell.view.components.longfengdangpu.LongFengDangPuPanel;
   import com.tgame.shell.view.components.longfengdangpu.XiaoQiaoPanel;
   import com.tgame.shell.view.components.longfengdangpu.XinShouZhanPanel;
   import com.tgame.shell.view.components.longfengdangpu.ZheKouShangDianPanel;
   import com.tgame.shell.view.components.mainui.AojianZhengbaSelectCanvas;
   import com.tgame.shell.view.components.meijiupaihang.MeiJiuPaiHangPanel;
   import com.tgame.shell.view.components.meirichongzhi.MeiRiChongZhiPanel;
   import com.tgame.shell.view.components.meitianchongzhilibao.YN2017Meitianchongzhilibao2Panel;
   import com.tgame.shell.view.components.meitianchongzhilibao.YN2017MeitianchongzhilibaoPanel;
   import com.tgame.shell.view.components.meitianyouhui.YN2017Meitianyouhui2Panel;
   import com.tgame.shell.view.components.meitianyouhui.YN2017MeitianyouhuiPanel;
   import com.tgame.shell.view.components.mingjiaozhizun.MingJiaoZhiZunPanel;
   import com.tgame.shell.view.components.moshizhouqi.YN2017MoshizhouqiPanel;
   import com.tgame.shell.view.components.moshouzhanchang.DuanLianPanel;
   import com.tgame.shell.view.components.moshouzhanchang.MoShouZhanChang;
   import com.tgame.shell.view.components.moshouzhanchang.PiLiangShiYongPanel;
   import com.tgame.shell.view.components.moxuezhanchang.moxuezhanchangTips;
   import com.tgame.shell.view.components.nantianhaoqi.YN2017NantianhaoqiPanel;
   import com.tgame.shell.view.components.neiligaishi.YNNeiligaishiPanel;
   import com.tgame.shell.view.components.niandi2018.NianDi2018Panel;
   import com.tgame.shell.view.components.niandi2018.XingZhuXinNianPanel;
   import com.tgame.shell.view.components.oule.YN2017OulePanel;
   import com.tgame.shell.view.components.party.BangPaiRongYuTargetPanel;
   import com.tgame.shell.view.components.party.PartyBossPanel;
   import com.tgame.shell.view.components.peiyangdianfengshou.YNPeiyangdianfengshouPanel;
   import com.tgame.shell.view.components.qianghuajinshen.YNQianghuajinshen2Panel;
   import com.tgame.shell.view.components.qianghuajinshen.YNQianghuajinshen3Panel;
   import com.tgame.shell.view.components.qianghuajinshen.YNQianghuajinshenPanel;
   import com.tgame.shell.view.components.qicaipaihangbang.QicaitijiaowupinPanel;
   import com.tgame.shell.view.components.qicaipaihangbang.YN2016QicaiPaihangbangPanel;
   import com.tgame.shell.view.components.qinglongxingjun.YN2017QinglongxingjunPanel;
   import com.tgame.shell.view.components.qinglongxingjunfenwen.YNQinglongxingjunfuwenPanel;
   import com.tgame.shell.view.components.qingrenjie.BaiSeQingRenJiePanel;
   import com.tgame.shell.view.components.qingrenjie.BaoShiDuanLian;
   import com.tgame.shell.view.components.qingrenjie.ErTongJie2019Panel;
   import com.tgame.shell.view.components.qingrenjie.HanShiJie2019Panel;
   import com.tgame.shell.view.components.qingrenjie.LianXuDengLuPanel;
   import com.tgame.shell.view.components.qingrenjie.QingRenJie2019Panel;
   import com.tgame.shell.view.components.qingrenjie.ShengGanHuiPanel;
   import com.tgame.shell.view.components.qingrenjie.TeBieHuoDongPanel;
   import com.tgame.shell.view.components.qingrenjie.XiongWangJiePanel;
   import com.tgame.shell.view.components.qingrenjie.YingJieDaLiPanel;
   import com.tgame.shell.view.components.qingrenjie.YuRenJie2019Panel;
   import com.tgame.shell.view.components.qingrenjie.ZhiZunShenBaoPanel;
   import com.tgame.shell.view.components.qishazhen.HuoDong1120Panel;
   import com.tgame.shell.view.components.qishazhen.JingYingLeiJiPanel;
   import com.tgame.shell.view.components.qishazhen.ShiWuTianYouHuiPanel;
   import com.tgame.shell.view.components.qitianleiji.NPCDialogPanel;
   import com.tgame.shell.view.components.qitianleiji.NPCDialogPanel_ShengDanDaZhan;
   import com.tgame.shell.view.components.qitianleiji.QiTianLeiJiPanel;
   import com.tgame.shell.view.components.qitianleiji.ShuangQuanPanel;
   import com.tgame.shell.view.components.qiutianliwu.QiuTianLiWuPanel;
   import com.tgame.shell.view.components.qiutianliwu.ShuangShiHuoDongPanel;
   import com.tgame.shell.view.components.qixi.QiXiPanel;
   import com.tgame.shell.view.components.qixihuodong.YN2017QixihuodongPanel;
   import com.tgame.shell.view.components.qiziquanzhenjiao.YNQiziquanzhenjiaoPanel;
   import com.tgame.shell.view.components.quanzhenxiaoyao.QuanZhenXiaoYaoPanel;
   import com.tgame.shell.view.components.ride.DianFengShouPanel;
   import com.tgame.shell.view.components.ride.FengLeiShouPanel;
   import com.tgame.shell.view.components.ride.XueShouTuiBianPanel;
   import com.tgame.shell.view.components.ride.YueGuangBaoHePanel;
   import com.tgame.shell.view.components.rongguang.YN2017RongguangPanel;
   import com.tgame.shell.view.components.rongqingaiyi.RongQingAiYiPanel;
   import com.tgame.shell.view.components.shangdian.JuezhanshangdianPanel;
   import com.tgame.shell.view.components.shangdian.ZhenpinShangdianPanel;
   import com.tgame.shell.view.components.shenfeng.YN2017ShenfengPanel;
   import com.tgame.shell.view.components.shengdan2018.ShengDanHuoDongPanel;
   import com.tgame.shell.view.components.shengdan2018.ShengDanKuaiLePanel;
   import com.tgame.shell.view.components.shengdan2018.ShengDanLeiJiPanel;
   import com.tgame.shell.view.components.shengdanchongman.YNShengdanchongmanliwuPanel;
   import com.tgame.shell.view.components.shengdanjie.YN2016ShengdanjiePanel;
   import com.tgame.shell.view.components.shengdanjinpiao.YN2016ShengdanjinpiaoPanel;
   import com.tgame.shell.view.components.shengri.ShengRiYuKuaiPanel;
   import com.tgame.shell.view.components.shengri.ShengRiZhouQiPanel;
   import com.tgame.shell.view.components.shengrizhouji.YN2016ShengrizhoujiPanel;
   import com.tgame.shell.view.components.shengxiaotiaozhan.ShengXiaoTiaoZhanPanel;
   import com.tgame.shell.view.components.shengxiaotiaozhan.ShengxiaotiaozhanFail;
   import com.tgame.shell.view.components.shengxiaotiaozhan.ShengxiaotiaozhanRelive;
   import com.tgame.shell.view.components.shengxiaotiaozhan.ShengxiaotiaozhanRightSprite;
   import com.tgame.shell.view.components.shengxiaotiaozhan.ShengxiaotiaozhanSuccess;
   import com.tgame.shell.view.components.shengxiaotiaozhan.ShengxiaotiaozhanTipPanel;
   import com.tgame.shell.view.components.shenqizhouqi.YN2017ShenqizhouqiPanel;
   import com.tgame.shell.view.components.shiJieBei.ShiJieBeiPanel;
   import com.tgame.shell.view.components.shijian902.YN2017Shijian902Panel;
   import com.tgame.shell.view.components.shitu.getExpJiangLiPanel;
   import com.tgame.shell.view.components.shitulieshou.ShiTuJiePanel;
   import com.tgame.shell.view.components.shitulieshou.ShiTuLieShouPanel;
   import com.tgame.shell.view.components.shiyongwupinshowpanel.YN2017BaguajingshiPanel;
   import com.tgame.shell.view.components.shiyongwupinshowpanel.YN2017LonglishiPanel;
   import com.tgame.shell.view.components.shiyongwupinshowpanel.YN2017QianghuazhishenPanel;
   import com.tgame.shell.view.components.shiyongwupinshowpanel.YN2017WulinwujuedanPanel;
   import com.tgame.shell.view.components.shiyongwupinshowpanel.YN2017XiangyangduijuePanel;
   import com.tgame.shell.view.components.shiyueershi.YN20171020Panel;
   import com.tgame.shell.view.components.shiyueyouhuizhouqi.YN201710YueyouhuizhouqiPanel;
   import com.tgame.shell.view.components.shouchong2.YN2017ShouChong2Panel;
   import com.tgame.shell.view.components.shouchongshijian.YN2017ShouchongshijianPanel;
   import com.tgame.shell.view.components.shuangjiuhuodong.ShuangJiuHuoDongPanel;
   import com.tgame.shell.view.components.shuanglongzhan.YN2017Shuanglongzhan2Panel;
   import com.tgame.shell.view.components.shuanglongzhan.YN2017Shuanglongzhan3Panel;
   import com.tgame.shell.view.components.shuanglongzhan.YN2017ShuanglongzhanPanel;
   import com.tgame.shell.view.components.shuiguoleiji.ShuiGuoLeiJiDuiHuanPanel;
   import com.tgame.shell.view.components.shuiguoleiji.ShuiGuoLeiJiPanel;
   import com.tgame.shell.view.components.suixinxiaofei.YNSuixinxiaofeiPanel;
   import com.tgame.shell.view.components.taohuazhijing.TaoHuaZhiJingPanel;
   import com.tgame.shell.view.components.tebierizi.TeBieRiZiPanel;
   import com.tgame.shell.view.components.temp.ShenLongFuLianZiPanel;
   import com.tgame.shell.view.components.tengtianyu.YN2017Tengtianyu2Panel;
   import com.tgame.shell.view.components.tengtianyu.YN2017Tengtianyu3Panel;
   import com.tgame.shell.view.components.tengtianyu.YNTengtianyuPanel;
   import com.tgame.shell.view.components.teshuleiji.TeShuLeiJiPanel;
   import com.tgame.shell.view.components.tianrenhe.TianRenHe2Panel;
   import com.tgame.shell.view.components.tianrenhe.TianRenHePanel;
   import com.tgame.shell.view.components.tianshizhouqi.YN2017TianshizhouqiPanel;
   import com.tgame.shell.view.components.tianxiawugongchushaolin.TianXiaWuGongChuShaoLinPanel;
   import com.tgame.shell.view.components.todoPanel;
   import com.tgame.shell.view.components.tonglefeishengjingjie.YN2017TonglefeishengjingjiePanel;
   import com.tgame.shell.view.components.tunshitiandi.TunShiTianDi;
   import com.tgame.shell.view.components.tunshitiandi.TunShiTianDi_JieGuo;
   import com.tgame.shell.view.components.tunshitiandi.TunShiTianDi_ZhenRongPanel;
   import com.tgame.shell.view.components.tunshitiandi.TunshiTianDiVSPanel;
   import com.tgame.shell.view.components.v300.YN2017V300Panel;
   import com.tgame.shell.view.components.v303.YNV303Panel;
   import com.tgame.shell.view.components.wangzhehuodong.YN2017WangzhehuodongPanel;
   import com.tgame.shell.view.components.wangzhezhengxiong.YN2017WangzhezhengxiongPanel;
   import com.tgame.shell.view.components.wangzhezhibang.WangzhezhibangLingjiangPanel;
   import com.tgame.shell.view.components.wangzhezhibanghd.WangZheZhiBangHDPanel;
   import com.tgame.shell.view.components.wangzhezhouqi.WangZheZhouQiPanel;
   import com.tgame.shell.view.components.wanshengjie.WanShengJie2018Panel;
   import com.tgame.shell.view.components.wanshixing.YNWanshixingPanel;
   import com.tgame.shell.view.components.woHuCangLong.WoHuCangLong;
   import com.tgame.shell.view.components.woHuCangLong.WoHuCangLongResultPanel;
   import com.tgame.shell.view.components.wudushengzhen.YN2017WudushengzhenPanel;
   import com.tgame.shell.view.components.wulindabaochaoji.ChaoJiWuLinDaBaoPanel;
   import com.tgame.shell.view.components.wulinshendibao.YN2017WulinshendibaoPanel;
   import com.tgame.shell.view.components.wulinzhenyuan.YN2017WulinzhenyuanPanel;
   import com.tgame.shell.view.components.wuyidoudizhu.DouDiZhuPanel;
   import com.tgame.shell.view.components.wuyidoudizhu.DouDiZhuRankPanel;
   import com.tgame.shell.view.components.xianmozhilu.XianMoWuDaJiPanel;
   import com.tgame.shell.view.components.xianmozhilu.XianMoZhiLuPanel;
   import com.tgame.shell.view.components.xianmozhilu.ZhongZuJieMianPanel;
   import com.tgame.shell.view.components.xiaohuishenbing.YN2016XiaohuishenbingPanel;
   import com.tgame.shell.view.components.xiatiankuaile.XiaTianKuaiLePanel;
   import com.tgame.shell.view.components.xiatianzhien.YN2017XiatianzhienPanel;
   import com.tgame.shell.view.components.xidushidai.EquipPartyChangePanel;
   import com.tgame.shell.view.components.xidushidai.PartyChangePanel;
   import com.tgame.shell.view.components.xingxingpaihang.XingXingPaiHangPanel;
   import com.tgame.shell.view.components.xingyunzhuanzhuanle.DingFengYunPanPanel;
   import com.tgame.shell.view.components.xinnianyasuiqian.XinnianyasuiqianPaihangbangPanel;
   import com.tgame.shell.view.components.xinnianyasuiqian.XinnianyasuiqianPanel;
   import com.tgame.shell.view.components.xinnianyasuiqian.Xinnianyasuiqian_ChaXunWanJiaPanel;
   import com.tgame.shell.view.components.xiongwangdali.YN2017XiongwangdaliPanel;
   import com.tgame.shell.view.components.xuantiezhixingzhouqi.YNXuantiezhixingzhouqiPanel;
   import com.tgame.shell.view.components.xuanwuxingjun.YN2017XuanwuxingjunPanel;
   import com.tgame.shell.view.components.xunzhangzhanshi.XunzhangZhanshiShowPanel;
   import com.tgame.shell.view.components.yingbinzhouli.YN2016YingbinzhouliPanel;
   import com.tgame.shell.view.components.yingjiefunvjie.YingjiefunvjiePanel;
   import com.tgame.shell.view.components.yingxiongmingcheng.YN2017YingXiongMingChengPanel;
   import com.tgame.shell.view.components.yingxiongshijian.YN2016YingxiongshijianPanel;
   import com.tgame.shell.view.components.yinshechudong.YNYinshechudongPanel;
   import com.tgame.shell.view.components.yitianbaojinzhouqi.YNYitianbaojinzhouqiPanel;
   import com.tgame.shell.view.components.yitianleiji.YiTianLeiJiPanel;
   import com.tgame.shell.view.components.yitiantulong.YiTianTuLong;
   import com.tgame.shell.view.components.yitiantulongdao.YiTianTuLongDaoPanel;
   import com.tgame.shell.view.components.yn888ShopPanel;
   import com.tgame.shell.view.components.ynLongwuge.YNlongwugePanel;
   import com.tgame.shell.view.components.ynLongwuge.YNlongwuge_AddFarmerPanel;
   import com.tgame.shell.view.components.ynQingrenjie2015.YNqingrenjiePanel;
   import com.tgame.shell.view.components.ynShijiebei.CommitFootball;
   import com.tgame.shell.view.components.ynShijiebei.ShijiebeiJiangliPanel;
   import com.tgame.shell.view.components.ynSpecial.YN2015ChristmasPanel;
   import com.tgame.shell.view.components.ynSpecial.YN2015zhongqiu;
   import com.tgame.shell.view.components.ynSpecial.YN201638HuodongPanel;
   import com.tgame.shell.view.components.ynSpecial.YN2016HuoDongXiaoFeiPanel;
   import com.tgame.shell.view.components.ynSpecial.YN2016HuodongFanliPanel;
   import com.tgame.shell.view.components.ynSpecial.YN2016MengZhuZhuFuPanel;
   import com.tgame.shell.view.components.ynSpecial.YN2016WuShenzhanlianPanel;
   import com.tgame.shell.view.components.ynSpecial.YN2016WushenpaihangPanel;
   import com.tgame.shell.view.components.ynSpecial.YN2016XiaoFeiPanel;
   import com.tgame.shell.view.components.ynSpecial.YN2016ZhouqicailuPanel;
   import com.tgame.shell.view.components.ynSpecial.YN2016cailushuPanel;
   import com.tgame.shell.view.components.ynSpecial.YN2016duilianPanel;
   import com.tgame.shell.view.components.ynSpecial.YN2016jiejiliangcao;
   import com.tgame.shell.view.components.ynSpecial.YN2016newyearPanel;
   import com.tgame.shell.view.components.ynSpecial.YN2016onlinePanle;
   import com.tgame.shell.view.components.ynSpecial.YN2016xingyunzhuanpanPanel;
   import com.tgame.shell.view.components.ynSpecial.YN2017ShouChongPanel;
   import com.tgame.shell.view.components.ynSpecial.YNCommitGoodPanel;
   import com.tgame.shell.view.components.ynSpecial.YNLuohanhutiPanel;
   import com.tgame.shell.view.components.ynSpecial.YNchongzhi;
   import com.tgame.shell.view.components.ynSpecial.YNchongzhidafaPanel;
   import com.tgame.shell.view.components.ynSpecial.YNfangshengliyuPanel;
   import com.tgame.shell.view.components.ynSpecial.YNhesuishuPanel;
   import com.tgame.shell.view.components.ynSpecial.YNhutishangyiPanel;
   import com.tgame.shell.view.components.ynSpecial.YNjinqianshuPanel;
   import com.tgame.shell.view.components.ynSpecial.YNjuedingshenbingPanel;
   import com.tgame.shell.view.components.ynSpecial.YNqianghuazhishenPanel;
   import com.tgame.shell.view.components.ynSpecial.YNshangxiangqifuPanel;
   import com.tgame.shell.view.components.ynSpecial.YNshanxiaqijianPanel;
   import com.tgame.shell.view.components.ynSpecial.YNshiertianzhiPanel;
   import com.tgame.shell.view.components.ynSpecial.YNshisanPanel;
   import com.tgame.shell.view.components.ynSpecial.YNshouyinPanel;
   import com.tgame.shell.view.components.ynSpecial.YNtulongdaoPanel;
   import com.tgame.shell.view.components.ynSpecial.YNwangzhezhibangPanel;
   import com.tgame.shell.view.components.ynSpecial.YNwulinshenqiPanel;
   import com.tgame.shell.view.components.ynSpecial.YNwushuangPanel;
   import com.tgame.shell.view.components.ynSpecial.YNyitianjianPanel;
   import com.tgame.shell.view.components.ynSpecial.YNzhimengqianzhuangPanel;
   import com.tgame.shell.view.components.ynSpecial.YNzhuadayuPanel;
   import com.tgame.shell.view.components.youhuizhouqi.YN2017YouHuiZhouQiPanel;
   import com.tgame.shell.view.components.yuanbaoyouhui.YuanBaoYouHuiPanel;
   import com.tgame.shell.view.components.yuanwu.TargetYuanwuPanel;
   import com.tgame.shell.view.components.yuanwu.YuanwuHeXinPanel;
   import com.tgame.shell.view.components.yuanwu.YuanwuPanel;
   import com.tgame.shell.view.components.yuanyangxishui.YN2017YuanyangxishuiPanel;
   import com.tgame.shell.view.components.yuenan0601.YN0601ShijianPanel;
   import com.tgame.shell.view.components.yuenan1205.YN1205ShijianPanel;
   import com.tgame.shell.view.components.yuenan1212.YN1212ShijianPanel;
   import com.tgame.shell.view.components.yuenan1219.YN1219ShijianPanel;
   import com.tgame.shell.view.components.yuenan1226.YN1226ShijianPanel;
   import com.tgame.shell.view.components.yuenan2017jiaoshijie.YN2017JiaoshijiePanel;
   import com.tgame.shell.view.components.yuenanyurenjie.YN2017YurenjiePanel;
   import com.tgame.shell.view.components.yuexiaofeiyuelingjiang.YueXiaoFeiYueLingJiangPanel;
   import com.tgame.shell.view.components.yulanjie.YN2017YulanjiePanel;
   import com.tgame.shell.view.components.yulanzhien.YuLanZhiEnPanel;
   import com.tgame.shell.view.components.yulanzhouqi.YuLanZhouQiPanel;
   import com.tgame.shell.view.components.yurenjie.YuRenJiePanel;
   import com.tgame.shell.view.components.yurenjie.YuRenJieRankPanel;
   import com.tgame.shell.view.components.yurenjie2018.YuRenJie2018Panel;
   import com.tgame.shell.view.components.zaowang.YN2017ZaowangPanel;
   import com.tgame.shell.view.components.zengsongnvren.YN2017ZengsongnvrenPanel;
   import com.tgame.shell.view.components.zhenbaoge.YN2016ZhenbaogePanel;
   import com.tgame.shell.view.components.zhengduozhan.ZhengDuoZhanPanel;
   import com.tgame.shell.view.components.zhenpinzhouqi.YNZhenpinzhouqiPanel;
   import com.tgame.shell.view.components.zhentianshenqi.YN2016ZhentianshenqiPanel;
   import com.tgame.shell.view.components.zhizunchenghaozhengduo.ZhiZunZhengDuoZhanPanel;
   import com.tgame.shell.view.components.zhongQiuJie.CaiDengMiPanel;
   import com.tgame.shell.view.components.zhongQiuJie.YuanXiaoJiePanel;
   import com.tgame.shell.view.components.zhongQiuJie.ZhongQiuJieDaskPanel;
   import com.tgame.shell.view.components.zhongQiuJie.ZhongQiuJiePanel;
   import com.tgame.shell.view.components.zhongQiuJie.ZhongQiuJieRankPanel;
   import com.tgame.shell.view.components.zhongqiu2017.YN2017Zhongqiu2017Panel;
   import com.tgame.shell.view.components.zhongqiu2018.ZhongQiuJie2018Panel;
   import com.tgame.shell.view.components.zhongqiu2018.ZhongQiuZengSongPanel;
   import com.tgame.shell.view.components.zhongqiu2018.ZhongQiuZhouQiPanel;
   import com.tgame.shell.view.components.zhongqiujie2016.YnYuelungujiPanel;
   import com.tgame.shell.view.components.zhoumorenao.ZhoumorenaoPanel;
   import com.tgame.shell.view.components.zhouwuguangliang.YN2016ZhouwuguangliangPanel;
   import com.tgame.shell.view.components.zhouyikuaile.ZhouyikuailePanel;
   import com.tgame.shell.view.components.zhuangwangguitian.ZhuangWangCiShuPanel;
   import com.tgame.shell.view.components.zhuangwangguitian.ZhuangWangGuiTianPanel;
   import com.tgame.shell.view.components.zhuangwangguitian.ZhuangWangJiePanel;
   import com.tgame.shell.view.components.zhuquexingjun.YN2017ZhuquexingjunPanel;
   import com.tgame.shell.view.components.zunrongwanbaoge.WanbaogeRongyaoHuiguiPanel;
   import com.tgame.shell.view.components.zzzs.ZhiZhanZhiShang_Tips;
   import flash.display.Sprite;
   
   public class UIInstance
   {
      
      public var bloodContainer:Sprite;
      
      public var uiContainer:Sprite;
      
      public var alertContainer:Sprite;
      
      public var toolTipContainer:Sprite;
      
      public var letterContainer:Sprite;
      
      public var csSpr:Sprite;
      
      public var loginUI:LoginUI;
      
      public var _loadingBar:LoadingBar;
      
      public var _mainUI:MainUI;
      
      public var _charAttribute:CharAttribute;
      
      public var _targetAttribute:TargetAttribute;
      
      public var _backpack:Backpack;
      
      public var _depot:DepotPanel;
      
      public var _acceptCycTaskPanel:CycTaskPanel;
      
      public var _teamPanel:TeamPanel;
      
      public var _siLingZhenPanel:SiLingZhenPanel;
      
      public var _mallPanel:MallPanel;
      
      public var _maillJiFenPanel:MaillJiFenPanel;
      
      public var _cishaQianZhuangPanel:CiShaQianZhuangPanel;
      
      public var _mysteryMallPanel:MysteryMallPanel;
      
      public var _friendPanel:FriendPanel;
      
      public var _shiTuSystemPanel:ShiTuSystemPanel;
      
      public var _jingYanJiangLiPanel:getExpJiangLiPanel;
      
      public var _ridePanel:RidePanel;
      
      public var _popMapPanel:PopMapPanel;
      
      public var _equipPuddingPanel:EquipPuddingPanel;
      
      public var _itemSynthesizePanel:ItemSynthesizePanel;
      
      public var _mainCharShop:PlayerShopPanel;
      
      public var _otherCharShop:OtherPlayerShopPanel;
      
      public var _npcDialogPanel:NpcDialogPanel;
      
      public var _rankingListPanel:RankingListPanel;
      
      public var _rankingFBListPanel:InstanceTimeRankingPanel;
      
      public var _giftPanel:GiftPanel;
      
      public var _rideDepotPanel:RideDepotPanel;
      
      public var _walkShopListPanel:PlayerShopListPanel;
      
      public var _tradePanel:TradingPanel;
      
      public var _npcShopPanel:NPCShopPanel;
      
      public var _rideAttrPanel:RideAttributePanel;
      
      public var _rideSkillResetPanel:RideSkillResetPanel;
      
      public var _rideYinCangShuXingJiHuoPanel:RideYinCangShuXingJiHuoPanel;
      
      public var _rideQiannengdanPanel:RideQianNengDanPanel;
      
      public var _rideMenghuandanPanel:RideDreamDanPanel;
      
      public var _buttonContainer:ButtonContainer;
      
      public var _shuangXiu_SearchPlayerPanel:ShuangXiu_SearchPlayerPanel;
      
      private var _liaoshang_SearchPlayerPanel:Liaoshang_SearchPlayerPanel;
      
      public var _biguanPanel:BiGuangPanel;
      
      public var _repair:EquipRepairPanel;
      
      public var _kungFuPanel:KungFuPanel;
      
      public var _kongMingLockPanel1:KongMingLockPanel;
      
      public var _kongMingLockPanel2:KongMingLockPanel;
      
      public var _kongMingLockPanel3:KongMingLockPanel;
      
      public var _kongMingLockPanel4:KongMingLockPanel;
      
      public var _kongMingLockPanel5:KongMingLockPanel;
      
      public var _kongMingLockPanel6:KongMingLockPanel;
      
      public var _treasureMapPanel1:TreasureMapPanel;
      
      public var _treasureMapPanel2:TreasureMapPanel;
      
      public var _settingsPanel:SystemPanel;
      
      public var _infoQueryPanel:InfoQueryPanel;
      
      public var _bossRefurbishPanel:conquerPanel;
      
      public var _todoPanel:todoPanel;
      
      public var _activePanel:ActivePanel;
      
      public var _autoFightPanelPanel:AutoFightPanel;
      
      public var _refreshPointPanel:RefreshPointPanel;
      
      public var _xinfaPanel:XinfaPanel;
      
      public var _achievePanel:AccomplishmentPanel;
      
      public var _teamInstancePanel:InstancePortalPanel;
      
      public var _instanceSelectPanel:InstanceConvectionPanel;
      
      public var _gumuMishiChuansongPanel:GumuMishiChuansongPanel;
      
      public var _zhenqiDollPanel:ZhenQiBabyPanel;
      
      public var _zhenqiSuper:ZhenQiBabyPanelTwoPanel;
      
      public var _shoujiPanel:CurioCollectPanel;
      
      public var _squirrelGiftPanel:SquirrelGiftPanel;
      
      public var _goldSquirrelGiftPanel3011:GoldSquirrelGiftPanel;
      
      public var _goldSquirrelGiftPanel3012:GoldSquirrelGiftPanel;
      
      public var _goldSquirrelGiftPanel3013:GoldSquirrelGiftPanel;
      
      public var _goldSquirrelGiftPanel3014:GoldSquirrelGiftPanel;
      
      public var _goldSquirrelGiftPanel3015:GoldSquirrelGiftPanel;
      
      public var _banghuiListPanel:PartyListPanel;
      
      public var _banghuiCreatPanel:Party_createPanel;
      
      public var _banghuiInfoPanel:PartyPanel;
      
      public var _banghuiMemberListPanel:Party_memberManagePanel;
      
      public var _banghuiNewsPanel:Party_infoPanel;
      
      public var _bangqiInfoPanel:PartyFlagPanel;
      
      public var _bangqiAnchaPanel:PartyFlagInstallPanel;
      
      public var _bangqiBanggongPanel:PartyContributePanel;
      
      public var _gongchengXiangyangguishuSPanel:XiangYangGuiShuPanel;
      
      public var _gongchengGongchengchePanel:GongchengPaoPanel;
      
      public var _stonePanel:StonePanel;
      
      public var _huizhangDazaoHechengPanel:HuizhangDazaoHechengPanel;
      
      public var _coneyGirlPanel:ConeyGirlPanel;
      
      public var _stoneOptionSmallPanel:StoneOptionSmallPanel;
      
      public var _xunzhangStoneOptionSmallPanel:XunzhangOptionSmallPanel;
      
      public var _amuletPanel:AmuletPanel;
      
      public var _sheliziEnchasePanel:SheliziEnchasePanel;
      
      public var _shenLongPanel:ShenLongFuLianZiPanel;
      
      public var _shenLongDaKongPanel:ShenlongDakongPanel;
      
      public var _partyKungfuPanel:PartyKungfuPanel;
      
      public var _equipPuddingTwoPanel:EquipPuddingTwoPanel;
      
      public var _rongXueDanPanel:RongXunDanPanel;
      
      public var _launchProposalPanel:LaunchProposalPanel;
      
      public var _proposalAffirmPanel:ProposalAffirmPanel;
      
      public var _marriageSuccePanel:MarriageSuccePanel;
      
      public var _marriageWeddingPanel:MarriageWeddingPanel;
      
      public var _marriageCashGiftListPanel:MarriageCashGiftListPanel;
      
      public var _marriageDinePanel:MarriageDinePanel;
      
      public var _marriageGiveCashGiftPanel:MarriageGiveCashGiftPanel;
      
      public var _taKungfuPanel:TAKungfuPanel;
      
      public var _taJingmaiPanel:TAVenationPanel;
      
      public var _labourPanel:MallFestivalPanel;
      
      public var _anqiActivePanel:AnqiActivation;
      
      public var _equipUpdataTypePanel:MenghuanShuxingKa;
      
      public var _giftCardPanel:GiftCardPanel;
      
      public var _kuafuLunjianBackpack:KuafuLunjianBackpack;
      
      public var _lunjianMall:MallLunjianPanel;
      
      public var _nitaSkill:DantianWuxueDanPanel;
      
      public var _sixStoneToSevenStonePanel:TopStonePanel;
      
      public var _qianChuiBaiLianPanel:QianchuiBailianPanel;
      
      public var _xianTianWuJingPanel:XiantianWujingPanel;
      
      public var _teamInstancePanel3v3:JingjiChangBaomingPanel;
      
      public var _kuafu3v3ResultPanel:JingjiResultPanel;
      
      public var _kuafu3v3VSResultPanel:JingjiVSPanel;
      
      public var _taskPanel:TaskPanel;
      
      public var _cycTaskPanel:CycTaskPanel;
      
      public var _partyTaskPanel:Party_taskPanel;
      
      public var _partyTaskCompletePanel:Party_task_PrisePanel;
      
      public var _partyTaskInvitePanel:Party_task_InvitePanel;
      
      public var _partyBossPanel:PartyBossPanel;
      
      public var _partyBossInvitePanel:PartyBoss_InvitePanel;
      
      public var _shuXingDaZaoKaPanel:ShuxingDazaokaPanel;
      
      public var _siLingZhenYinCangShuXingPanel:MenghuanSishengshouPanel;
      
      public var _cardGiftPanel:CardGiftPanel;
      
      public var _tutengShuxingTihuankaPanel:TutengShuxingTihuankaPanel;
      
      public var _freeMallCadePanel:MallHuodongPanel;
      
      public var _chuanShuoZhuangBeiDaZaoPanel:ChuanShuoZhuangBeiDaZaoPanel;
      
      public var _changeSuperMount:RideJiaohuanShenshouPanel;
      
      public var _changeSuperMount1:RideJiaohuanShenshouPanel;
      
      public var _changeSuperMount2:RideJiaohuanShenshouPanel;
      
      public var _changeMoshouMount:RideJiaohuanMoshouPanel;
      
      public var _jinChuiZiPanel:TishengZhuangbeiMenghuanPanel;
      
      public var _rankAttackPanel:ZhandouliPanel;
      
      public var _wuxieZhijingPanel:WuxieZhijingPanel;
      
      public var _huyiKaiguangPanel:HuyiKaiguangPanel;
      
      public var _huyiLingHuaPanel:HuyiLingHuaPanel;
      
      public var _huyiXiLianPanel:HuyiXiLianPanel;
      
      public var _zhuangbeiJihuoPanel:ZhuangbeiJihuoPanel;
      
      public var _biwuDuijuePanel:BiwuDuijue_Panel;
      
      public var _biwuCrossPlatformPanel:BiwuCrossPlatform_Panel;
      
      public var _biwuDuijueCrossP_Panel:BiwuDuijueCrossP_Panel;
      
      public var _baoShiJianShangPanel:BaoShiJianShangPanel;
      
      public var _baoShiJianShangGuiZePanel:BaoShiJianShangGuiZeJieShaoPanel;
      
      public var _daoJuTiQuKaPanel:DaoJuTiQuKaPanel;
      
      public var _shiShiZhanKuangPanel:ShishiZhankuangPanel;
      
      public var _wanfaShiyiTu:WanfaShiyiTuPanel;
      
      public var _teamKuaFuZhanChangPanel:KuaFuZhanChangPanel;
      
      public var _xiangyangzhanchang:XiangYangZhanChangCanvas;
      
      public var _liandanluPanel:LiandanluPanel;
      
      public var _cailiaoBaoxiangPanel:LiandanluPanel;
      
      public var _wanjiahuikuiPanel:WanJiaHuiKuiPanel;
      
      public var _kuaFuLeiTaiPanel:KuaFuLeiTaiPanel;
      
      public var _kuafuleitaiResultPanel:KuafuleitaiResultPanel;
      
      public var _xianshiDajiangDuihuanPanel:XianshiDajiangDuihuanPanel;
      
      public var _qinggongyanPanel:QingGongYanPanel;
      
      public var _qinggongyanOverPanel:QingGongYanOverPanel;
      
      public var _hushenfuXiLianPanel:HushenfuXilianCanvas;
      
      public var _biwudahuiVSResultPanel:BiwudahuiVSPanel;
      
      public var _zhanhunhuodePanel:ZhanHunPanel;
      
      public var _zhanhundai:ZhanhundaiPanel;
      
      public var _xunzhangduanzao:XunZhangAndZhanQiDuanZhaoPanel;
      
      public var _diwangjian:ShengDanXunZhangPanel;
      
      public var _sishengshoukewenPanel:SiShengShouKeWenPanel;
      
      public var _shiShiKaiFengPanel:EquipKaiFengPanel;
      
      public var _huXinYaoTiShengPanel:HuXinYaoTiShengPanel;
      
      public var _fuChouOKPanel:FuChouOKPanel;
      
      public var _ciShaJiangliPanel:CishaJiangliPanel;
      
      public var _cishaMilingPanel:CishaMilingCanvas;
      
      public var _dixiaQianZhuangPanel:DiXiaQianZhuangPanel;
      
      public var _aojianZhengba:AojianZhengbaSelectCanvas;
      
      public var _aojianzhuzaoPanel:AoJianZhuZaoPanel;
      
      private var _christmasRankCanvas:ChristmasRankCanvas;
      
      public var _xunzhangluPanel:XunZhangluPanel;
      
      public var _yuanPanGiftPanel:YuanPanGiftPanel;
      
      public var _tianFuSuiPianHeChengPanel:TianFuSuiPianHeChengPanel;
      
      public var _xqTianFuPanel:XiangQianTianFuPanel;
      
      public var _xunZhangHeChengPanel:XunZhangHeChengPanel;
      
      public var _meiren:MeiRenPanel;
      
      public var _monthsignin:MonthSignIn;
      
      public var _jileizhi:JiLeiZhiPanel;
      
      public var _longwenkehua:LongWenKeHuaPanel;
      
      public var _juBaoPenPanel:JuBaoPenPanel;
      
      public var _xunZhangDuihuanPanel:XunzhangDuihuanPanel;
      
      public var _xunZhangPanel:XunzhangShowPanel;
      
      public var _targetXunZhangPanel:XunzhangShowPanel;
      
      public var _leftTopTipsSprite:LeftTopTipsSprite;
      
      public var _danTiaoWang:DanTiaoWangShuomingPanel;
      
      public var _moxueDollPanel:MoXueBabyPanel;
      
      public var _qiangHuaPanel:QiangHuaPanel;
      
      public var _timeBaozangPanel:timeBaozangPanel;
      
      public var _biWuZhaoQinPanel:BiWuZhaoQinPanel;
      
      public var _shouYuanChouJiangPanel:ShouYuanChouJiangPanel;
      
      public var _yueGuangBaoHePanel:YueGuangBaoHePanel;
      
      public var _xueShouTuiBianPanel:XueShouTuiBianPanel;
      
      public var _tianJiangXiangRuiPanel:TianJiangXiangRuiPanel;
      
      public var _yuLingHeChengPanel:YuLingHeChengPanel;
      
      public var _xinMo:XinMo;
      
      public var _xiaoYaoYuFengJiNengSheZhiPanel:XiaoYaoYuFengSheZhiFPanel;
      
      public var _shenQiJinHuaPanel:ShenQiJinHuaPanel;
      
      public var _buZhenPanel:TianMenBuZhenPanel;
      
      public var _tianshangzhihun:TianShangZhiHunShengJiePanel;
      
      public var _partyChangePanel:PartyChangePanel;
      
      public var _partyEquipChangePanel:EquipPartyChangePanel;
      
      public var _shendiaoPanel:ShenDiaoXiaLv;
      
      public var _ganjiangmoyezhuzaoPanel:GanJiangMoYeZhuZaoPanel;
      
      public var _xinnianzhufu:XinnianZhufuPanel;
      
      public var _rankYNPanel:RankingYNPanel;
      
      public var _fashionPanel:FashionPanel;
      
      public var _fengzhengjiexunzhang:FengzhengjieXunzhangDuihuanPanel;
      
      public var _ynjubaopenPanel:YNjubaopenPanel;
      
      public var _renamePanel:YNRenamePanel;
      
      public var _ynshijiebeiPanel:YNShijiebeiRankPanel;
      
      public var _yncommitfootballPanel:CommitFootball;
      
      public var _ynshijiebeijiangliPanel:ShijiebeiJiangliPanel;
      
      public var _yn888shopPanel:yn888ShopPanel;
      
      public var _ynaojianhechengPanel:YNAojiansuipianhechengPanel;
      
      public var _ynaojianzhizaoPanel1:YNAojianzhizaoPanel1;
      
      public var _ynaojianzhizaoPanel2:YNAojianzhizaoPanel2;
      
      public var _ynonlinePanel:YNOnLinePanel;
      
      public var _zhizhanzhishang:ZhiZhanZhiShangPanel;
      
      public var _zhiZhanZhiShangLingJiangPanel:ZhiZhanZhiShangLingJiangPanel;
      
      public var _zhiZhanZhiShang_Tips:ZhiZhanZhiShang_Tips;
      
      public var _ynrichangPanel:YNRichangPanel;
      
      public var _ynGoodDeletePanel:YNGoodDeletePanel;
      
      public var _yn2014zhongqiuPanel:YNZhongqiuLingjiangPanel;
      
      public var _shenbingJuexingXiangqianPanel:ShenbingJuexingXiangqianPanel;
      
      public var _zunrongWanbaogePanel:ZunRongWanBaoGePanel;
      
      public var _zunrongWanbaogeHuiguiPanel:WanbaogeRongyaoHuiguiPanel;
      
      public var _newyearPanel:NewYearPanel;
      
      public var _yurenjiePanel:YuRenJiePanel;
      
      public var _yurenjierankPanel:YuRenJieRankPanel;
      
      public var _fengzhengjiePanel:FengZhengJiePanel;
      
      public var _fengzhengjierankPanel:FengZhengJieRankPanel;
      
      public var _qingrenjieChaXunWanJiaPanel:QingRenJie_ChaXunWanJiaPanel;
      
      public var _qingrenjieSongHuaBangPanel:QingRenJie_SongHuaBangPanel;
      
      public var _woHuCangLongPanel:WoHuCangLong;
      
      public var _woHuCangLongResultPanel:WoHuCangLongResultPanel;
      
      public var _wishingTreePanel:WishingTree;
      
      public var _gerenchenghaoPanel:GeRenChengHao;
      
      public var _chuangongwuxuePanel:ChuanGongWuXuePanel;
      
      public var _huangTuBaYePanel:HuangTuBaYePanel;
      
      public var _huangTuBaYeChaKanXinXiPanel:HuangTuBaYeChaKanXinXiPanel;
      
      public var _rongYuTargetPanel:BangPaiRongYuTargetPanel;
      
      public var _doudizhuPanel:DouDiZhuPanel;
      
      public var _doudizhurankPanel:DouDiZhuRankPanel;
      
      public var _fabaoPanel:FabaoPanel;
      
      public var _fabaolingli:Fabao_LingliPanel;
      
      public var _fabaotupo:FabaoTupoPanel;
      
      public var _fabaoGuanzhuDesc:FabaoGuanzhuDesc;
      
      public var _fabaolinglifull:Fabao_lingliFullPanel;
      
      public var _duanwujiePanel:DuanWuJiePanel;
      
      public var _chaojilabaPanel:ChaoJiLaBaPanel;
      
      public var _zhongzhixuanyuanjianPanel:ZhongZhiXuanYuanJianPanel;
      
      public var _shiJieBeiPanel:ShiJieBeiPanel;
      
      public var _shengxiaotiaozhanPanel:ShengXiaoTiaoZhanPanel;
      
      public var _shengxiaoRightSpr:ShengxiaotiaozhanRightSprite;
      
      public var _shengxiaoTipPanel:ShengxiaotiaozhanTipPanel;
      
      public var _shengxiaoSuccessPanel:ShengxiaotiaozhanSuccess;
      
      public var _shengxiaoFailPanel:ShengxiaotiaozhanFail;
      
      public var _shengxiaoRelivePanel:ShengxiaotiaozhanRelive;
      
      public var _fengLeiShouPanel:FengLeiShouPanel;
      
      public var _dianFengShouPanel:DianFengShouPanel;
      
      public var _wuxiakapaiPanel:WuxiakapaiPanel;
      
      public var _wuxiakapaixxPanel:WuxiakapaiXiangxiPanel;
      
      public var _qixiPanel:QiXiPanel;
      
      public var _tunShiTianDi:TunShiTianDi;
      
      public var _tunShiTianDiXuanZhenRong:TunShiTianDi_ZhenRongPanel;
      
      public var _tunShiTianDiVSResultPanel:TunshiTianDiVSPanel;
      
      public var _tunShiTianDiResultPanel:TunShiTianDi_JieGuo;
      
      public var _buchangfubenPanel:BuchangFubenPanel;
      
      public var _huangjinshuPanel:HuangJinShuPanel;
      
      public var _zhongQiuJiePanel:ZhongQiuJiePanel;
      
      public var _zhongQiuJieDaskPanel:ZhongQiuJieDaskPanel;
      
      public var _ynlongzhizhufuPanel:YNLongzhizhufuPanel;
      
      public var _ynzhizuozongziPanel:YNzhizuozongziPanel;
      
      public var _ynqingrenjiePanel:YNqingrenjiePanel;
      
      public var _ynXiangyangRankPanel:YNXiangyangzhanchangRankPanel;
      
      public var _wangzhezhibangPanel:WangzhezhibangPanel;
      
      public var _wangzhezhibangLingjiangPanel:WangzhezhibangLingjiangPanel;
      
      public var _yuanXiaoJiePanel:YuanXiaoJiePanel;
      
      public var _caiDengMiPanel:CaiDengMiPanel;
      
      public var _ynJinxiangPanel:YNjinxiangPanel;
      
      public var _ynlianhuanchongzhiPanel:YNlianhuanchongzhiPanel;
      
      public var _xiaozhukuaipaoPanel:XiaoZhuKuaiPaoPanel;
      
      public var _ynCommitPanel:YNCommitGoodPanel;
      
      public var _ynQifuPanel:YNshangxiangqifuPanel;
      
      public var _zhongQiuJieRankPanel:ZhongQiuJieRankPanel;
      
      public var _ynshoucichongzhiPanel:YNchongzhi;
      
      public var _ynjinqianshuPanel:YNjinqianshuPanel;
      
      public var _ynkaixuepaihangbangPanel:YN2016PaihangbangPanel;
      
      public var _yntijiaowupinPanel:TijiaowupinPanel;
      
      public var _ynyingxiongshijianPanel:YN2016YingxiongshijianPanel;
      
      public var _ynLongwugePanel:YNlongwugePanel;
      
      public var _yn2015zhongqiuPanel:YN2015zhongqiu;
      
      public var _ynLWGAddFarmerPanel:YNlongwuge_AddFarmerPanel;
      
      public var _ynChristmasPanel:YN2015ChristmasPanel;
      
      public var _duixuerenPanel:DuiXueRenPanel;
      
      public var _ynHesuiPanel:YNhesuishuPanel;
      
      public var _ynQianghuazhishenPanel:YNqianghuazhishenPanel;
      
      public var _ynFangshengliyuPanel:YNfangshengliyuPanel;
      
      public var _yn2016CGPanel:YN2016cailushuPanel;
      
      public var _yn2016DLPanel:YN2016duilianPanel;
      
      public var _yn2016onlinePanel:YN2016onlinePanle;
      
      public var _yn2016newyearPanel:YN2016newyearPanel;
      
      public var _ynShierdizhiPanel:YNshiertianzhiPanel;
      
      public var _ynShanxiaqijianPanel:YNshanxiaqijianPanel;
      
      public var _ynNvquanPanel:YN201638HuodongPanel;
      
      public var _ynLuohanhutiPanel:YNLuohanhutiPanel;
      
      public var _ynShouyinPanel:YNshouyinPanel;
      
      public var _ynQiziquanzhenPanel:YNQiziquanzhenjiaoPanel;
      
      public var _yn2016XingyunzhuanpanPanel:YN2016xingyunzhuanpanPanel;
      
      public var _ynChongzhidafaPanel:YNchongzhidafaPanel;
      
      public var _ynWulinshenqiPanel:YNwulinshenqiPanel;
      
      public var _ynJuedingshenbingPanel:YNjuedingshenbingPanel;
      
      public var _ynHutishangyiPanel:YNhutishangyiPanel;
      
      public var _ynWzzbPanel:YNwangzhezhibangPanel;
      
      public var _ynZhimengqianzhuangPanel:YNzhimengqianzhuangPanel;
      
      public var _ynTulongdaoPanel:YNtulongdaoPanel;
      
      public var _ynWushuangpuPanel:YNwushuangPanel;
      
      public var _ynShisanjianhunPanel:YNshisanPanel;
      
      public var _ynZhuadayuPanel:YNzhuadayuPanel;
      
      public var _longfengdangpuiPanel:LongFengDangPuPanel;
      
      public var _yn2016JieJiLiangCaoPanel:YN2016jiejiliangcao;
      
      public var _yn2016XiaoFeiPanel:YN2016XiaoFeiPanel;
      
      public var _ynWushenzhanlianPanel:YN2016WuShenzhanlianPanel;
      
      public var _yn2016HuoDongXiaoFeiPanel:YN2016HuoDongXiaoFeiPanel;
      
      public var _yn2016zhouqicailuPanel:YN2016ZhouqicailuPanel;
      
      public var _yn2016WuShenZhanLianPaiHangPanel:YN2016WushenpaihangPanel;
      
      public var _xunZhangzhanshiPanel:XunzhangZhanshiShowPanel;
      
      public var _targetXunZhangzhanshiPanel:XunzhangZhanshiShowPanel;
      
      public var _yn2016MengZhuZhuFuPanel:YN2016MengZhuZhuFuPanel;
      
      public var _ynyuelungujiPanel:YnYuelungujiPanel;
      
      public var _ynchongjiuzhiyangPanel:YnChongjiezhiyangPanel;
      
      public var _ynxiuweiwuxuePanel:YN2016XiuweiwuxuePanel;
      
      public var _ynwangzhezhanqiPanel:YN2016WangzhezhanqiPanel;
      
      public var _ynqicaipaihangbangPanel:YN2016QicaiPaihangbangPanel;
      
      public var _ynqicaitijiaowupinPanel:QicaitijiaowupinPanel;
      
      public var _yn2016HuoDongfanliPanel:YN2016HuodongFanliPanel;
      
      public var _ynfuqitongxinpaihangbangPanel:YN2016FuqitongxinPaihangbangPanel;
      
      public var _ynfuqitongxinPanel:YN2016FuqitongxinPanel;
      
      public var _ynshengrizhoujiPanel:YN2016ShengrizhoujiPanel;
      
      public var _ynliupaijingjiPanel:YN2016LiupaijingjiPanel;
      
      public var _ynliumaijianPanel:YN2016LiumaijianPanel;
      
      public var _ynyingbinzhouliPanel:YN2016YingbinzhouliPanel;
      
      public var _ynzhouwuguangliangPanel:YN2016ZhouwuguangliangPanel;
      
      public var _yndingfengzhouqiPanel:YN2016DingfengzhouqiPanel;
      
      public var _ynzhentianshenqiPanel:YN2016ZhentianshenqiPanel;
      
      public var _ynxiaohuishenbingPanel:YN2016XiaohuishenbingPanel;
      
      public var _ynhuashanlunjianPanel:YN2016HuashanlunjianPanel;
      
      public var _ynshengdanjiePanel:YN2016ShengdanjiePanel;
      
      public var _ynshengdanjinpiaoPanel:YN2016ShengdanjinpiaoPanel;
      
      public var _ynzhenbaogePanel:YN2016ZhenbaogePanel;
      
      public var _ynzaowangPanel:YN2017ZaowangPanel;
      
      public var _ynfangyanhuaPanel:YN2017FangyanhuaPanel;
      
      public var _xinnianyasuiquanChaXunWanJiaPanel:Xinnianyasuiqian_ChaXunWanJiaPanel;
      
      public var _xinnianyasuiquanPanel:XinnianyasuiqianPanel;
      
      public var _xinnianyasuiquanpaihangPanel:XinnianyasuiqianPaihangbangPanel;
      
      public var _chunjie123Panel:YN2017ChunjiehuodongPanel;
      
      public var _yuanyangxishuiPanel:YN2017YuanyangxishuiPanel;
      
      public var _moxuezhanchangPanel:MoXueZhanChangPanel;
      
      public var _fuLiHuoDongPanel:FuLiHuoDongPanel;
      
      public var _moxueleftTopTipsSprite:moxuezhanchangTips;
      
      public var _guosetianxiangPanel:YN2017GuoSeTianXiangPanel;
      
      public var _jiangHunCNPanel:JiangHunPanel_CN;
      
      public var _aidehuibaoPanel:YN2017AidehuibaoPanel;
      
      public var _youhuizhouqiPanel:YN2017YouHuiZhouQiPanel;
      
      public var _oulePanel:YN2017OulePanel;
      
      public var _ynyurenjiePanel:YN2017YurenjiePanel;
      
      public var _xiongwangdaliPanel:YN2017XiongwangdaliPanel;
      
      public var _ynwangzhezhuangbeiPanel:YN2017Wangzhe10zhuangbeiPanel;
      
      public var _kaizhan5Panel:YN2017DiwucikaizhanPanel;
      
      public var _duanwujie2015Panel:DuanWuJie2015Panel;
      
      public var _tianshizhouqiPanel:YN2017TianshizhouqiPanel;
      
      public var _nantianhaoqiPanel:YN2017NantianhaoqiPanel;
      
      public var _rongguangPanel:YN2017RongguangPanel;
      
      public var _baGuaZhenPanel:BaGuaZhenPanel;
      
      public var _zhenpinshangdianPanel:ZhenpinShangdianPanel;
      
      public var _juezhanshangdianPanel:JuezhanshangdianPanel;
      
      public var _fodanPanel:YN2017FodanPanel;
      
      public var _yingxiongmingchengPanel:YN2017YingXiongMingChengPanel;
      
      public var _duijuezhouqiPanel:YN2017DuiJueZhouQiPanel;
      
      public var _0519Panel:YN2017_0519Panel;
      
      public var _liuyiertongjiePanel:YN2017LiuyiertongjiePanel;
      
      public var _shijianshalouPanel:ShiJianShaLou;
      
      public var _dianfengzhouqiPanel:YN2017DianfengzhouqiPanel;
      
      public var _qingzhuPanel:YN2017QingzhuPanel;
      
      public var _meitianyouhuiPanel:YN2017MeitianyouhuiPanel;
      
      public var _meitianyouhui2Panel:YN2017Meitianyouhui2Panel;
      
      public var _shenfengPanel:YN2017ShenfengPanel;
      
      public var _tengtianyuPanel:YNTengtianyuPanel;
      
      public var _shengzhenPanel:YN2017WudushengzhenPanel;
      
      public var _shengzhen2Panel:YN2017Tengtianyu2Panel;
      
      public var _shengzhen3Panel:YN2017Tengtianyu3Panel;
      
      public var _liuyueyuanmanPanel:YN2017LiuyueyuanmanPanel;
      
      public var _liuyueqingzhuPanel:YN2017LiuyueqingzhuPanel;
      
      public var _liuyuediPanel:YN2017LiuyuediPanel;
      
      public var _ynshoucichongzhi2Panel:YN2017ShouChongPanel;
      
      public var _ynshoucichongzhi3Panel:YN2017ShouChong2Panel;
      
      public var _meitianchongzhilibaoPanel:YN2017MeitianchongzhilibaoPanel;
      
      public var _ynYitianjianPanel:YNyitianjianPanel;
      
      public var _dishiPanel:YN2017DishiPanel;
      
      public var _v300Panel:YN2017V300Panel;
      
      public var _feishengjingjiePanel:YN2017FeishengjingjiePanel;
      
      public var _shouchongshijianPanel:YN2017ShouchongshijianPanel;
      
      public var _moshizhouqiPanel:YN2017MoshizhouqiPanel;
      
      public var _xiatianzhienPanel:YN2017XiatianzhienPanel;
      
      public var _bayuetouPanel:YN2017BayuetouPanel;
      
      public var _tonglefeishengjingjiePanel:YN2017TonglefeishengjingjiePanel;
      
      public var _V303Panel:YNV303Panel;
      
      public var _shenqizhouqiPanel:YN2017ShenqizhouqiPanel;
      
      public var _baguajingshiPanel:YN2017BaguajingshiPanel;
      
      public var _longlishiPanel:YN2017LonglishiPanel;
      
      public var _qianghuazhishenPanel:YN2017QianghuazhishenPanel;
      
      public var _xiangyangduijuePanel:YN2017XiangyangduijuePanel;
      
      public var _wulinwujuedanPanel:YN2017WulinwujuedanPanel;
      
      public var _wulinshendibaoPanel:YN2017WulinshendibaoPanel;
      
      public var _1908Panel:YN2017_1908Panel;
      
      public var _qixihuodongPanel:YN2017QixihuodongPanel;
      
      public var _libaozhouqiPanel:YN2017LibaozhouqiPanel;
      
      public var _shijian902Panel:YN2017Shijian902Panel;
      
      public var _yulanjiePanel:YN2017YulanjiePanel;
      
      public var _weixiPanel:YN2017HuanyingweixiPanel;
      
      public var _chongjiuhuodongPanel:YN2017ChongjiuhuodongPanel;
      
      public var _wulinzhenyuanPanel:YN2017WulinzhenyuanPanel;
      
      public var _kaixueqiqiuPanel:YN2017KaixueqiqiuPanel;
      
      public var _yitiantulongPanel:YiTianTuLong;
      
      public var _tuLongFuBenPanel:TuLongFuBenPanel;
      
      public var _huozhenjiashiPanel:YN2017HuozhenjiashiPanel;
      
      public var _xuanwuxingjunPanel:YN2017XuanwuxingjunPanel;
      
      public var _wangzhezhengxiongPanel:YN2017WangzhezhengxiongPanel;
      
      public var _wangzhehuodongPanel:YN2017WangzhehuodongPanel;
      
      public var _baihuxingjunPanel:YN2017BaihuxingjunPanel;
      
      public var _zhongqiu2017Panel:YN2017Zhongqiu2017Panel;
      
      public var _rijinlunPanel:Rijinlun;
      
      public var _qinglongxingjunPanel:YN2017QinglongxingjunPanel;
      
      public var _lihejuePanel:YN2017LihejuePanel;
      
      public var _10yueyouhuiPanel:YN201710YueyouhuizhouqiPanel;
      
      public var _meitianchongzhilibao2Panel:YN2017Meitianchongzhilibao2Panel;
      
      public var _zhuquexingjunPanel:YN2017ZhuquexingjunPanel;
      
      public var _20171020Panel:YN20171020Panel;
      
      public var _zengsongnvrenPanel:YN2017ZengsongnvrenPanel;
      
      public var _suixinxiaofeiPanel:YNSuixinxiaofeiPanel;
      
      public var _liunianhuodongPanel:YNLiunianhuodongPanel;
      
      public var _liunianpeibanPanel:YNLiunianpeibanPanel;
      
      public var _ganenliunianPanel:YNGanenliunianPanel;
      
      public var _shengrizhouqiPanel:YNShengrizhouqiPanel;
      
      public var _huazhuangdasaiPanel:YNHuazhuangdasaiPanel;
      
      public var _huazhuanglibaoPanel:YN2017HuazhuanglibaoPanel;
      
      public var _chibanglibaoPanel:YN2017ChibanglibaoPanel;
      
      public var _xuantiezhixingzhouqiPanel:YNXuantiezhixingzhouqiPanel;
      
      public var _yuenan0601Panel:YN0601ShijianPanel;
      
      public var _qinglongxingjunfuwenPanel:YNQinglongxingjunfuwenPanel;
      
      public var _neiligaishiPanel:YNNeiligaishiPanel;
      
      public var _chaojixianglongzhouqiPanel:YNChaojixianglongzhouqiPanel;
      
      public var _yuenan2017jiaoshijiePanel:YN2017JiaoshijiePanel;
      
      public var _shuanglongzhanPanel:YN2017ShuanglongzhanPanel;
      
      public var _zhenpinzhouqiPanel:YNZhenpinzhouqiPanel;
      
      public var _1205shijianPanel:YN1205ShijianPanel;
      
      public var _yitianbaojinzhouqiPanel:YNYitianbaojinzhouqiPanel;
      
      public var _1212shijianPanel:YN1212ShijianPanel;
      
      public var _1219shijianPanel:YN1219ShijianPanel;
      
      public var _1226shijianPanel:YN1226ShijianPanel;
      
      public var _yinshechudongPanel:YNYinshechudongPanel;
      
      public var _shengdanchongmanPanel:YNShengdanchongmanliwuPanel;
      
      public var _wanshixingPanel:YNWanshixingPanel;
      
      public var _qianghuajinshenPanel:YNQianghuajinshenPanel;
      
      public var _peiyangdianfengshouPanel:YNPeiyangdianfengshouPanel;
      
      public var _xingYunZhuanZhuanLePanel:DingFengYunPanPanel;
      
      public var _yiTianTuLongDaoPanel:YiTianTuLongDaoPanel;
      
      public var _tianRenHePanel:TianRenHePanel;
      
      public var _rongQingAiYiPanel:RongQingAiYiPanel;
      
      public var _shuangLongZhan2Panel:YN2017Shuanglongzhan2Panel;
      
      public var _shuangLongZhan3Panel:YN2017Shuanglongzhan3Panel;
      
      public var _chaoJiWuLinDaBaoPanel:ChaoJiWuLinDaBaoPanel;
      
      public var _fuNvJie2018Panel:FuNvJie2018Panel;
      
      public var _jinShenZhouQiPanel:JinShenZhouQiPanel;
      
      public var _baiQiaoKeLiPanel:BaiQiaoKeLiPanel;
      
      public var _huangJinZhouQiPanel:DaHuangJinZhouQiPanel;
      
      public var _tianRenHe2Panel:TianRenHe2Panel;
      
      public var _qiangHuaJinShen2Panel:YNQianghuajinshen2Panel;
      
      public var _qiangHuaJinShen3Panel:YNQianghuajinshen3Panel;
      
      public var _yuanBaoYouHuiPanel:YuanBaoYouHuiPanel;
      
      public var _yurenjie2018Panel:YuRenJie2018Panel;
      
      public var _changNianChongZhiPanel:ChangNianChongZhiPanel;
      
      public var _hanShiJiePanel:HanShiJiePanel;
      
      public var _daShengZhouQi:DaShengZhouQiPanel;
      
      public var _laoDongJie2018:LaoDongJie2018Panel;
      
      public var _banBenYouHui:BanBenYouHuiPanel;
      
      public var _liXia2018:LiXia2018Panel;
      
      public var _shuiGuoLeiJiPanel:ShuiGuoLeiJiPanel;
      
      public var _shuiGuoLeiJiDuiHuanPanel:ShuiGuoLeiJiDuiHuanPanel;
      
      public var _huoDong0519Panel:HuoDong0519Panel;
      
      public var _tianXiaWuGongChuShaoLinPanel:TianXiaWuGongChuShaoLinPanel;
      
      public var _chaoJiZhouQiPanel:ChaoJiZhouQiPanel;
      
      public var _yueXiaoFeiYueLingJiangPanel:YueXiaoFeiYueLingJiangPanel;
      
      public var _zhiZunZhengDuoZhanPanel:ZhiZunZhengDuoZhanPanel;
      
      public var _taoHuaZhiJingPanel:TaoHuaZhiJingPanel;
      
      public var _quanZhenXiaoYaoPanel:QuanZhenXiaoYaoPanel;
      
      public var _lianXuBaoMingPanel:LianXuBaoMingPanel;
      
      public var _yingJieDuanWu2018Panel:YingJieDuanWuJie2018Panel;
      
      public var _xiaTianKuaiLePanel:XiaTianKuaiLePanel;
      
      public var _huanQiuKaiMuPanel:HuanQiuKaiMuPanel;
      
      public var _mingJiaoZhiZunPanel:MingJiaoZhiZunPanel;
      
      public var _feiShengShenBaoPanel:FeiShengShenBaoPanel;
      
      public var _zhengDuoZhanPanel:ZhengDuoZhanPanel;
      
      public var _daGengXinHuoDongPanel:DaGengXinHuoDongPanel;
      
      public var _wangZheZhouQiPanel:WangZheZhouQiPanel;
      
      public var _wangZheZhiBangHDPanel:WangZheZhiBangHDPanel;
      
      public var _moshouzhanchangPanel:MoShouZhanChang;
      
      public var _piLiangShiYongPanel:PiLiangShiYongPanel;
      
      public var _huanYingBaYuePanel:HuanYingBaYuePanel;
      
      public var _meiJiuPaiHangPanel:MeiJiuPaiHangPanel;
      
      public var _yuLanZhouQiPanel:YuLanZhouQiPanel;
      
      public var _yuLanZhiEnPanel:YuLanZhiEnPanel;
      
      public var _guoQingZhouQiPanel:GuoQingZhouQiPanel;
      
      public var _guoQingZengSongPanel:GuoQingZengSongPanel;
      
      public var _shuangJiuHuoDongPanel:ShuangJiuHuoDongPanel;
      
      public var _zhongQiuZengSongPanel:ZhongQiuZengSongPanel;
      
      public var _zhongQiuJie2018Panel:ZhongQiuJie2018Panel;
      
      public var _zhongQiuZhouQiPanel:ZhongQiuZhouQiPanel;
      
      public var _qiuTianLiWuPanel:QiuTianLiWuPanel;
      
      public var _shuangShiHuoDongPanel:ShuangShiHuoDongPanel;
      
      public var _yingjiefunvjiePanel:YingjiefunvjiePanel;
      
      public var _zhouyikuailePanel:ZhouyikuailePanel;
      
      public var _zhoumorenaoPanel:ZhoumorenaoPanel;
      
      public var _bajiguiyuanhufudakongPanel:BajiguiyuanhufuDakongPanel;
      
      public var _gongFaYouHuiPanel:GongFaYouHuiPanel;
      
      public var _2018wanShengYePanel:WanShengJie2018Panel;
      
      public var _baoShiYangChengPanel:BaoShiYangChengPanel;
      
      public var _meiRiChongZhiPanel:MeiRiChongZhiPanel;
      
      public var _xingXingPaiHangPanel:XingXingPaiHangPanel;
      
      public var _shengRiZhouQiPanel2018:ShengRiZhouQiPanel;
      
      public var _shengRiYuKuaiPanel:ShengRiYuKuaiPanel;
      
      public var _shiTuLieShouPanel:ShiTuLieShouPanel;
      
      public var _shiTuJiePanel:ShiTuJiePanel;
      
      public var _teShuLeiJi:TeShuLeiJiPanel;
      
      public var _tebierizi:TeBieRiZiPanel;
      
      public var _shengDanLeiJi:ShengDanLeiJiPanel;
      
      public var _shengDanKuaiLe:ShengDanKuaiLePanel;
      
      public var _shengDanHuoDong:ShengDanHuoDongPanel;
      
      public var _xingZhuXinNian:XingZhuXinNianPanel;
      
      public var _nianDi2018Dong:NianDi2018Panel;
      
      public var _liangTianLeiJi:LiangTianLeiJiPanel;
      
      public var _jiangHuZhanPanel:JiangHuZhanPanel;
      
      public var _qiTianLeiJi:QiTianLeiJiPanel;
      
      public var _zhuangWangGuiTianPanel:ZhuangWangGuiTianPanel;
      
      public var _zhuangWangCiShuPanel:ZhuangWangCiShuPanel;
      
      public var _zhuangWangJiePanel:ZhuangWangJiePanel;
      
      public var _xinShouLeiJiPanel:XinShouLeiJiPanel;
      
      public var _chunTianLeiJiPanel:ChunTianLeiJiPanel;
      
      public var _chuYi2019Panel:ChuYi2019Panel;
      
      public var _chuEr2019Panel:ChuEr2019Panel;
      
      public var _chuSan2019Panel:ChuSan2019Panel;
      
      public var _qingRenJie2019Panel:QingRenJie2019Panel;
      
      public var _lieShouPaiHangPanel:LieShouPaiHangPanel;
      
      public var _yiTianLeiJiPanel:YiTianLeiJiPanel;
      
      public var _fuNvJieHeLi:FuNvJieHeLiPanel;
      
      public var _fuNvJiePaiHang:FuNvJiePaiHangPanel;
      
      public var _baiSeQingRenJiePanel:BaiSeQingRenJiePanel;
      
      public var _baoShiDuanLian:BaoShiDuanLian;
      
      public var _lieShouPaiHang2Panel:LieShouPaiHang2Panel;
      
      public var _yuRenJie2019Panel:YuRenJie2019Panel;
      
      public var _hanShiJie2019Panel:HanShiJie2019Panel;
      
      public var _zhiZunShenBaoPanel:ZhiZunShenBaoPanel;
      
      public var _xiongWangJie2019Panel:XiongWangJiePanel;
      
      public var _yingJieDaLiPanel:YingJieDaLiPanel;
      
      public var _shengGanHuiPanel:ShengGanHuiPanel;
      
      public var _erTongJiePanel:ErTongJie2019Panel;
      
      public var _liuYueDi2019:LiuYueDi2019Panel;
      
      public var _duanlianPanel:DuanLianPanel;
      
      public var _qiYueDi2019:QiYueDi2019Panel;
      
      public var _qixijie2019:QiXiJie2019Panel;
      
      public var _shuangquan:ShuangQuanPanel;
      
      public var _npcDialogXunhua:NPCDialogPanel;
      
      public var _lianXuDengLuPanel:LianXuDengLuPanel;
      
      public var _teBieHuoDong:TeBieHuoDongPanel;
      
      public var _guoqingjie2019:GuoQingJie2019Panel;
      
      public var _bayueyouhui2019:BaYueYouHuiPanel;
      
      public var _xiongzhanbang:XiongZhanBangPanel;
      
      public var _zhongqiushangyue:ZhongQiuShangYuePanel;
      
      public var _shiwutianyouhui:ShiWuTianYouHuiPanel;
      
      public var _yuenanfunvjie:YueNanFuNvJiePanel;
      
      public var _vip:VIP;
      
      public var _xianmozhiluPanel:XianMoZhiLuPanel;
      
      public var _xianmozhilu_zhongzu_Panel:ZhongZuJieMianPanel;
      
      public var _aojianfeishengPanel:AoJianFeiShengPanel;
      
      public var _aojianzhuanshengPanel:AoJianZhuanShengPanel;
      
      public var _xianmowudajiPanel:XianMoWuDaJiPanel;
      
      public var _wanshengjie2019Panel:WanShengJie2019Panel;
      
      public var _huodong1120Panel:HuoDong1120Panel;
      
      public var _daZheKouPanel:DaZheKouPanel;
      
      public var _jingYingLeiJiPanel:JingYingLeiJiPanel;
      
      public var _baNianZhiMengPanel:BaNianZhiMengPanel;
      
      public var _shuang12Panel:Shuang12Panel;
      
      public var _shenDanDaZhanPanel:NPCDialogPanel_ShengDanDaZhan;
      
      public var _shenDanJie2019Panel:ShengDanJie2019Panel;
      
      public var _nianDi2019Panel:NianDi2019Panel;
      
      public var _xinNianKuaiLe2019Panel:XinNianKuaiLe2019Panel;
      
      public var _xiaonianjiePanel:XiaoNianJiePanel;
      
      public var _chuntuanyuanPanel:ChunTuanYuanPanel;
      
      public var _chunjieyi:ChunJieYiPanel;
      
      public var _chunjieer:ChunJieErPanel;
      
      public var _chunjiesan:ChunJieSanPanel;
      
      public var _xinchunyinglu:XinChunYingLuPanel;
      
      public var _yuanxiaojie2019:YuanXiaoJie2019Panel;
      
      public var _qingrenjie2020:QingRenJie2020Panel;
      
      public var _sanbajie2020:SanBaJie2020Panel;
      
      public var _baise2020:BaiSe2020Panel;
      
      public var _xiongwang2020:XiongWang2020Panel;
      
      public var _guangrongdariPanel:GuangRongDaRiPanel;
      
      public var _leijizhengxiongPanel:LeiJiZhengXiongPanel;
      
      public var _qianggou16Panel:QiangGou16Panel;
      
      public var _duanwusanwangPanel:DuanWuSanWangPanel;
      
      public var _diwanglihePanel:DiWangLiHePanel;
      
      public var _diwanglihe2Panel:DiWangLiHe2Panel;
      
      public var _tianxiaqizhenPanel:TianXiaQiZhenPanel;
      
      public var _tianxiaqizhen2Panel:TianXiaQiZhen2Panel;
      
      public var _xinshouqizhen1Panel:XinShouQiZhen1Panel;
      
      public var _xinshouqizhen2Panel:XinShouQiZhen2Panel;
      
      public var _xinshouqizhen3Panel:XinShouQiZhen3Panel;
      
      public var _xinshouqizhen4Panel:XinShouQiZhen4Panel;
      
      public var _zhongqiuwanluPanel:ZhongQiuWanLuPanel;
      
      public var _menpaijuexuePanel:MenPaiJueXue;
      
      public var _menpaineifaPanel:MenPaiNeiFa;
      
      public var _yuanwu:YuanwuPanel;
      
      public var _targetyuanwu:TargetYuanwuPanel;
      
      public var _yuanwuhexin:YuanwuHeXinPanel;
      
      public var _jiuJieXingTuPanel:JiuJieXingTuPanel;
      
      public var _jiuJieXingTuBoxPanel:JiuJieXingTu_BoxView;
      
      public var _xinniandajiPanel:XinNianDaJiPanel;
      
      public var _wanshiruyiPanel:WanShiRuYiPanel;
      
      public var _ankangxingwangPanel:AnKangXingWangPanel;
      
      public var _cailugungunPanel:CaiLuGunGunPanel;
      
      public var _shuangsiyouhuiPanel:ShuangSiYouHuiPanel;
      
      public var _tehui2021Panel:TeHui2021Panel;
      
      public var _xianshouzhanPanel:XinShouZhanPanel;
      
      public var _shengjifuliPanel:ShengJieDaHuiKuiPanel;
      
      public var _qitianlianxudenglu2022Panel:LianXuDengLu7Tian2022Panel;
      
      public var _tebieleichong2022Panel:TeBieLeiChong2022Panel;
      
      public var _wuhunxitongPanel:WuHunPanel;
      
      public var _chunJieSiPanel:ChunJieSiPanel;
      
      public var _laYue28Panel:LaYue28Panel;
      
      public var _laYue29Panel:LaYue29Panel;
      
      public var _laYue30Panel:LaYue30Panel;
      
      public var _zhenPinZhiMengPanel:ZhenPinZhiMengPanel;
      
      public var _caipiaoshowPanel:CaiPiaoShowPanel;
      
      public var _letouPanel:LeTouPanel;
      
      public var _leiChongLiWuPanel:LeiChongLiWuPanel;
      
      public var _lianXuLeiChongPanel:LianXuLeiChongPanel;
      
      public var _tianJiangBaoXiangPanel:TianJiangBaoXiangPanel;
      
      public var _daYanLiWuPanel:DaYanLiWuPanel;
      
      public var _zheKouShangDianPanel:ZheKouShangDianPanel;
      
      public var _xiaoQiaoPanel:XiaoQiaoPanel;
      
      public var _xinShangXianPanel:XinShangXianPanel;
      
      public var _zhuangBeiHuanYuanPanel:ZhuangBeiHuanYuanPanel;
      
      public var _shiErZhouNianQingZhuPanel:ShiErZhouNianQingZhuPanel;
      
      public var _zongLeiJiPanel:ZongLeiJiPanel;
      
      public var _liDongJiePanel:LiDongJie2023Panel;
      
      public var _liDongLeiJiPanel:LiDongLeiJi2023Panel;
      
      public var _dengLuLingJiangPanel:DengLuLingJiangV632Panel;
      
      public var _xueRenBaoZangPanel:XueRenBaoZangPanel;
      
      public var _zheKouShang20240116Dian:ZheKouShangDian20240116Panel;
      
      public var _maChaoPanel:MaChaoPanel;
      
      public var _caoJunPanel:CaoJunPanel;
      
      public var _youHui2888Panel:YouHui2888Panel;
      
      public var _zhenPinZhiMengVariantPanel:ZhenPinZhiMengVariantPanel;
      
      public var _teBieShangDianPanel:TeBieShangDianPanel;
      
      public var _meiriyouhguiPanel:MeiRiYouHuiPanel;
      
      public function UIInstance()
      {
         super();
      }
      
      public function get loadingBar() : LoadingBar
      {
         if(this._loadingBar == null)
         {
            this._loadingBar = new LoadingBar();
            UIEventsRegisterManager.registerUI(this._loadingBar,LoadingBar);
         }
         return this._loadingBar;
      }
      
      public function get mainUI() : MainUI
      {
         if(this._mainUI == null)
         {
            this._mainUI = new MainUI();
            UIEventsRegisterManager.registerUI(this._mainUI,MainUI);
         }
         return this._mainUI;
      }
      
      public function get charAttribute() : CharAttribute
      {
         if(this._charAttribute == null)
         {
            this._charAttribute = new CharAttribute();
            UIEventsRegisterManager.registerUI(this._charAttribute,CharAttribute);
         }
         return this._charAttribute;
      }
      
      public function get targetAttribute() : TargetAttribute
      {
         if(this._targetAttribute == null)
         {
            this._targetAttribute = new TargetAttribute();
            UIEventsRegisterManager.registerUI(this._targetAttribute,TargetAttribute);
         }
         return this._targetAttribute;
      }
      
      public function get backpack() : Backpack
      {
         if(this._backpack == null)
         {
            this._backpack = new Backpack();
            UIEventsRegisterManager.registerUI(this._backpack,Backpack);
         }
         return this._backpack;
      }
      
      public function get depot() : DepotPanel
      {
         if(this._depot == null)
         {
            this._depot = new DepotPanel();
            UIEventsRegisterManager.registerUI(this._depot,DepotPanel);
         }
         return this._depot;
      }
      
      public function get acceptCycTaskPanel() : CycTaskPanel
      {
         if(this._acceptCycTaskPanel == null)
         {
            this._acceptCycTaskPanel = new CycTaskPanel();
            UIEventsRegisterManager.registerUI(this._acceptCycTaskPanel,CycTaskPanel);
         }
         return this._acceptCycTaskPanel;
      }
      
      public function get teamPanel() : TeamPanel
      {
         if(this._teamPanel == null)
         {
            this._teamPanel = new TeamPanel();
            UIEventsRegisterManager.registerUI(this._teamPanel,TeamPanel);
         }
         return this._teamPanel;
      }
      
      public function get siLingZhenPanel() : SiLingZhenPanel
      {
         if(this._siLingZhenPanel == null)
         {
            this._siLingZhenPanel = new SiLingZhenPanel();
            UIEventsRegisterManager.registerUI(this._siLingZhenPanel,SiLingZhenPanel);
         }
         return this._siLingZhenPanel;
      }
      
      public function get mallPanel() : MallPanel
      {
         if(this._mallPanel == null)
         {
            this._mallPanel = new MallPanel();
            UIEventsRegisterManager.registerUI(this._mallPanel,MallPanel);
         }
         return this._mallPanel;
      }
      
      public function get mallJiFenPanel() : MaillJiFenPanel
      {
         if(this._maillJiFenPanel == null)
         {
            this._maillJiFenPanel = new MaillJiFenPanel();
            UIEventsRegisterManager.registerUI(this._maillJiFenPanel,MaillJiFenPanel);
         }
         return this._maillJiFenPanel;
      }
      
      public function get cishaQianZhuangPanel() : CiShaQianZhuangPanel
      {
         if(this._cishaQianZhuangPanel == null)
         {
            this._cishaQianZhuangPanel = new CiShaQianZhuangPanel();
            UIEventsRegisterManager.registerUI(this._cishaQianZhuangPanel,CiShaQianZhuangPanel);
         }
         return this._cishaQianZhuangPanel;
      }
      
      public function get mysteryMallPanel() : MysteryMallPanel
      {
         if(this._mysteryMallPanel == null)
         {
            this._mysteryMallPanel = new MysteryMallPanel();
            UIEventsRegisterManager.registerUI(this._mysteryMallPanel,MysteryMallPanel);
         }
         return this._mysteryMallPanel;
      }
      
      public function get friendPanel() : FriendPanel
      {
         if(this._friendPanel == null)
         {
            this._friendPanel = new FriendPanel();
            UIEventsRegisterManager.registerUI(this._friendPanel,FriendPanel);
         }
         return this._friendPanel;
      }
      
      public function get shiTuSystemPanel() : ShiTuSystemPanel
      {
         if(this._shiTuSystemPanel == null)
         {
            this._shiTuSystemPanel = new ShiTuSystemPanel();
            UIEventsRegisterManager.registerUI(this._shiTuSystemPanel,ShiTuSystemPanel);
         }
         return this._shiTuSystemPanel;
      }
      
      public function get jingYanJiangLiPanel() : getExpJiangLiPanel
      {
         if(this._jingYanJiangLiPanel == null)
         {
            this._jingYanJiangLiPanel = new getExpJiangLiPanel();
            UIEventsRegisterManager.registerUI(this._jingYanJiangLiPanel,getExpJiangLiPanel);
         }
         return this._jingYanJiangLiPanel;
      }
      
      public function get ridePanel() : RidePanel
      {
         if(this._ridePanel == null)
         {
            this._ridePanel = new RidePanel();
            UIEventsRegisterManager.registerUI(this._ridePanel,RidePanel);
         }
         return this._ridePanel;
      }
      
      public function get popMapPanel() : PopMapPanel
      {
         if(this._popMapPanel == null)
         {
            this._popMapPanel = new PopMapPanel();
            UIEventsRegisterManager.registerUI(this._popMapPanel,PopMapPanel);
         }
         return this._popMapPanel;
      }
      
      public function get equipPuddingPanel() : EquipPuddingPanel
      {
         if(this._equipPuddingPanel == null)
         {
            this._equipPuddingPanel = new EquipPuddingPanel();
            UIEventsRegisterManager.registerUI(this._equipPuddingPanel,EquipPuddingPanel);
         }
         return this._equipPuddingPanel;
      }
      
      public function get itemSynthesizePanel() : ItemSynthesizePanel
      {
         if(this._itemSynthesizePanel == null)
         {
            this._itemSynthesizePanel = new ItemSynthesizePanel();
            UIEventsRegisterManager.registerUI(this._itemSynthesizePanel,ItemSynthesizePanel);
         }
         return this._itemSynthesizePanel;
      }
      
      public function get mainCharShop() : PlayerShopPanel
      {
         if(this._mainCharShop == null)
         {
            this._mainCharShop = new PlayerShopPanel();
            this._mainCharShop.type = PlayerShopPanel.CHARSHOPPANEL;
            UIEventsRegisterManager.registerUI(this._mainCharShop,PlayerShopPanel);
         }
         return this._mainCharShop;
      }
      
      public function get otherCharShop() : OtherPlayerShopPanel
      {
         if(this._otherCharShop == null)
         {
            this._otherCharShop = new OtherPlayerShopPanel();
            this._otherCharShop.type = OtherPlayerShopPanel.OTHERPLAYERSHOPPANEL;
            UIEventsRegisterManager.registerUI(this._otherCharShop,OtherPlayerShopPanel);
         }
         return this._otherCharShop;
      }
      
      public function get npcDialogPanel() : NpcDialogPanel
      {
         if(this._npcDialogPanel == null)
         {
            this._npcDialogPanel = new NpcDialogPanel();
            UIEventsRegisterManager.registerUI(this._npcDialogPanel,NpcDialogPanel);
         }
         return this._npcDialogPanel;
      }
      
      public function get rankingListPanel() : RankingListPanel
      {
         if(this._rankingListPanel == null)
         {
            this._rankingListPanel = new RankingListPanel();
            UIEventsRegisterManager.registerUI(this._rankingListPanel,RankingListPanel);
         }
         return this._rankingListPanel;
      }
      
      public function get rankingFBListPanel() : InstanceTimeRankingPanel
      {
         if(this._rankingFBListPanel == null)
         {
            this._rankingFBListPanel = new InstanceTimeRankingPanel();
            UIEventsRegisterManager.registerUI(this._rankingFBListPanel,InstanceTimeRankingPanel);
         }
         return this._rankingFBListPanel;
      }
      
      public function get giftPanel() : GiftPanel
      {
         if(this._giftPanel == null)
         {
            this._giftPanel = new GiftPanel();
            UIEventsRegisterManager.registerUI(this._giftPanel,GiftPanel);
         }
         return this._giftPanel;
      }
      
      public function get rideDepotPanel() : RideDepotPanel
      {
         if(this._rideDepotPanel == null)
         {
            this._rideDepotPanel = new RideDepotPanel();
            UIEventsRegisterManager.registerUI(this._rideDepotPanel,RideDepotPanel);
         }
         return this._rideDepotPanel;
      }
      
      public function get walkShopListPanel() : PlayerShopListPanel
      {
         if(this._walkShopListPanel == null)
         {
            this._walkShopListPanel = new PlayerShopListPanel();
            UIEventsRegisterManager.registerUI(this._walkShopListPanel,PlayerShopListPanel);
         }
         return this._walkShopListPanel;
      }
      
      public function get tradePanel() : TradingPanel
      {
         if(this._tradePanel == null)
         {
            this._tradePanel = new TradingPanel();
            UIEventsRegisterManager.registerUI(this._tradePanel,TradingPanel);
         }
         return this._tradePanel;
      }
      
      public function get npcShopPanel() : NPCShopPanel
      {
         if(this._npcShopPanel == null)
         {
            this._npcShopPanel = new NPCShopPanel();
            UIEventsRegisterManager.registerUI(this._npcShopPanel,NPCShopPanel);
         }
         return this._npcShopPanel;
      }
      
      public function get rideAttrPanel() : RideAttributePanel
      {
         if(this._rideAttrPanel == null)
         {
            this._rideAttrPanel = new RideAttributePanel();
            UIEventsRegisterManager.registerUI(this._rideAttrPanel,RideAttributePanel);
         }
         return this._rideAttrPanel;
      }
      
      public function get rideSkillResetPanel() : RideSkillResetPanel
      {
         if(this._rideSkillResetPanel == null)
         {
            this._rideSkillResetPanel = new RideSkillResetPanel();
            UIEventsRegisterManager.registerUI(this._rideSkillResetPanel,RideSkillResetPanel);
         }
         return this._rideSkillResetPanel;
      }
      
      public function get rideYinCangShuXingJiHuoPanel() : RideYinCangShuXingJiHuoPanel
      {
         if(this._rideYinCangShuXingJiHuoPanel == null)
         {
            this._rideYinCangShuXingJiHuoPanel = new RideYinCangShuXingJiHuoPanel();
            UIEventsRegisterManager.registerUI(this._rideYinCangShuXingJiHuoPanel,RideYinCangShuXingJiHuoPanel);
         }
         return this._rideYinCangShuXingJiHuoPanel;
      }
      
      public function get rideQiannengdanPanel() : RideQianNengDanPanel
      {
         if(this._rideQiannengdanPanel == null)
         {
            this._rideQiannengdanPanel = new RideQianNengDanPanel();
            UIEventsRegisterManager.registerUI(this._rideQiannengdanPanel,RideQianNengDanPanel);
         }
         return this._rideQiannengdanPanel;
      }
      
      public function get rideMenghuandanPanel() : RideDreamDanPanel
      {
         if(this._rideMenghuandanPanel == null)
         {
            this._rideMenghuandanPanel = new RideDreamDanPanel();
            UIEventsRegisterManager.registerUI(this._rideMenghuandanPanel,RideDreamDanPanel);
         }
         return this._rideMenghuandanPanel;
      }
      
      public function get buttonContainer() : ButtonContainer
      {
         if(this._buttonContainer == null)
         {
            this._buttonContainer = new ButtonContainer();
            UIEventsRegisterManager.registerUI(this._buttonContainer,ButtonContainer);
         }
         return this._buttonContainer;
      }
      
      public function get shuangXiu_SearchPlayerPanel() : ShuangXiu_SearchPlayerPanel
      {
         if(this._shuangXiu_SearchPlayerPanel == null)
         {
            this._shuangXiu_SearchPlayerPanel = new ShuangXiu_SearchPlayerPanel();
            UIEventsRegisterManager.registerUI(this._shuangXiu_SearchPlayerPanel,ShuangXiu_SearchPlayerPanel);
         }
         return this._shuangXiu_SearchPlayerPanel;
      }
      
      public function get liaoshang_SearchPlayerPanel() : Liaoshang_SearchPlayerPanel
      {
         if(this._liaoshang_SearchPlayerPanel == null)
         {
            this._liaoshang_SearchPlayerPanel = new Liaoshang_SearchPlayerPanel();
            UIEventsRegisterManager.registerUI(this._liaoshang_SearchPlayerPanel,Liaoshang_SearchPlayerPanel);
         }
         return this._liaoshang_SearchPlayerPanel;
      }
      
      public function get biguanPanel() : BiGuangPanel
      {
         if(this._biguanPanel == null)
         {
            this._biguanPanel = new BiGuangPanel();
            UIEventsRegisterManager.registerUI(this._biguanPanel,BiGuangPanel);
         }
         return this._biguanPanel;
      }
      
      public function get repairPanel() : EquipRepairPanel
      {
         if(this._repair == null)
         {
            this._repair = new EquipRepairPanel();
            UIEventsRegisterManager.registerUI(this._repair,EquipRepairPanel);
         }
         return this._repair;
      }
      
      public function get kungFuPanel() : KungFuPanel
      {
         if(this._kungFuPanel == null)
         {
            this._kungFuPanel = new KungFuPanel();
            UIEventsRegisterManager.registerUI(this._kungFuPanel,KungFuPanel);
         }
         return this._kungFuPanel;
      }
      
      public function get kongMingLockPanel1() : KongMingLockPanel
      {
         if(this._kongMingLockPanel1 == null)
         {
            this._kongMingLockPanel1 = new KongMingLockPanel();
            UIEventsRegisterManager.registerUI(this._kongMingLockPanel1,KongMingLockPanel);
         }
         return this._kongMingLockPanel1;
      }
      
      public function get kongMingLockPanel2() : KongMingLockPanel
      {
         if(this._kongMingLockPanel2 == null)
         {
            this._kongMingLockPanel2 = new KongMingLockPanel();
            UIEventsRegisterManager.registerUI(this._kongMingLockPanel2,KongMingLockPanel);
         }
         return this._kongMingLockPanel2;
      }
      
      public function get kongMingLockPanel3() : KongMingLockPanel
      {
         if(this._kongMingLockPanel3 == null)
         {
            this._kongMingLockPanel3 = new KongMingLockPanel();
            UIEventsRegisterManager.registerUI(this._kongMingLockPanel3,KongMingLockPanel);
         }
         return this._kongMingLockPanel3;
      }
      
      public function get kongMingLockPanel4() : KongMingLockPanel
      {
         if(this._kongMingLockPanel4 == null)
         {
            this._kongMingLockPanel4 = new KongMingLockPanel();
            UIEventsRegisterManager.registerUI(this._kongMingLockPanel4,KongMingLockPanel);
         }
         return this._kongMingLockPanel4;
      }
      
      public function get kongMingLockPanel5() : KongMingLockPanel
      {
         if(this._kongMingLockPanel5 == null)
         {
            this._kongMingLockPanel5 = new KongMingLockPanel();
            UIEventsRegisterManager.registerUI(this._kongMingLockPanel5,KongMingLockPanel);
         }
         return this._kongMingLockPanel5;
      }
      
      public function get kongMingLockPanel6() : KongMingLockPanel
      {
         if(this._kongMingLockPanel6 == null)
         {
            this._kongMingLockPanel6 = new KongMingLockPanel();
            UIEventsRegisterManager.registerUI(this._kongMingLockPanel6,KongMingLockPanel);
         }
         return this._kongMingLockPanel6;
      }
      
      public function get treasureMapPanel1() : TreasureMapPanel
      {
         if(this._treasureMapPanel1 == null)
         {
            this._treasureMapPanel1 = new TreasureMapPanel();
            UIEventsRegisterManager.registerUI(this._treasureMapPanel1,TreasureMapPanel);
         }
         return this._treasureMapPanel1;
      }
      
      public function get treasureMapPanel2() : TreasureMapPanel
      {
         if(this._treasureMapPanel2 == null)
         {
            this._treasureMapPanel2 = new TreasureMapPanel();
            UIEventsRegisterManager.registerUI(this._treasureMapPanel2,TreasureMapPanel);
         }
         return this._treasureMapPanel2;
      }
      
      public function get settingsPanel() : SystemPanel
      {
         if(this._settingsPanel == null)
         {
            this._settingsPanel = new SystemPanel();
            UIEventsRegisterManager.registerUI(this._settingsPanel,SystemPanel);
         }
         return this._settingsPanel;
      }
      
      public function get infoQueryPanel() : InfoQueryPanel
      {
         if(this._infoQueryPanel == null)
         {
            this._infoQueryPanel = new InfoQueryPanel();
            UIEventsRegisterManager.registerUI(this._infoQueryPanel,InfoQueryPanel);
         }
         return this._infoQueryPanel;
      }
      
      public function get bossRefurbishPanel() : conquerPanel
      {
         if(this._bossRefurbishPanel == null)
         {
            this._bossRefurbishPanel = new conquerPanel();
            UIEventsRegisterManager.registerUI(this._bossRefurbishPanel,conquerPanel);
         }
         return this._bossRefurbishPanel;
      }
      
      public function get waitTodoPanel() : todoPanel
      {
         if(this._todoPanel == null)
         {
            this._todoPanel = new todoPanel();
            UIEventsRegisterManager.registerUI(this._todoPanel,todoPanel);
         }
         return this._todoPanel;
      }
      
      public function get activePanel() : ActivePanel
      {
         if(this._activePanel == null)
         {
            this._activePanel = new ActivePanel();
            UIEventsRegisterManager.registerUI(this._activePanel,ActivePanel);
         }
         return this._activePanel;
      }
      
      public function get autoFightPanelPanel() : AutoFightPanel
      {
         if(this._autoFightPanelPanel == null)
         {
            this._autoFightPanelPanel = new AutoFightPanel();
            UIEventsRegisterManager.registerUI(this._autoFightPanelPanel,AutoFightPanel);
         }
         return this._autoFightPanelPanel;
      }
      
      public function get refreshPointPanel() : RefreshPointPanel
      {
         if(this._refreshPointPanel == null)
         {
            this._refreshPointPanel = new RefreshPointPanel();
            UIEventsRegisterManager.registerUI(this._refreshPointPanel,RefreshPointPanel);
         }
         return this._refreshPointPanel;
      }
      
      public function get xinfaPanel() : XinfaPanel
      {
         if(this._xinfaPanel == null)
         {
            this._xinfaPanel = new XinfaPanel();
            UIEventsRegisterManager.registerUI(this._xinfaPanel,XinfaPanel);
         }
         return this._xinfaPanel;
      }
      
      public function get achievePanel() : AccomplishmentPanel
      {
         if(this._achievePanel == null)
         {
            this._achievePanel = new AccomplishmentPanel();
            UIEventsRegisterManager.registerUI(this._achievePanel,AccomplishmentPanel);
         }
         return this._achievePanel;
      }
      
      public function get teamInstancePanel() : InstancePortalPanel
      {
         if(this._teamInstancePanel == null)
         {
            this._teamInstancePanel = new InstancePortalPanel();
            UIEventsRegisterManager.registerUI(this._teamInstancePanel,InstancePortalPanel);
         }
         return this._teamInstancePanel;
      }
      
      public function get instanceSelectPanel() : InstanceConvectionPanel
      {
         if(this._instanceSelectPanel == null)
         {
            this._instanceSelectPanel = new InstanceConvectionPanel();
            UIEventsRegisterManager.registerUI(this._instanceSelectPanel,InstanceConvectionPanel);
         }
         return this._instanceSelectPanel;
      }
      
      public function get gumuMishiChuansongPanel() : GumuMishiChuansongPanel
      {
         if(this._gumuMishiChuansongPanel == null)
         {
            this._gumuMishiChuansongPanel = new GumuMishiChuansongPanel();
            UIEventsRegisterManager.registerUI(this._gumuMishiChuansongPanel,GumuMishiChuansongPanel);
         }
         return this._gumuMishiChuansongPanel;
      }
      
      public function get zhenqiDollPanel() : ZhenQiBabyPanel
      {
         if(this._zhenqiDollPanel == null)
         {
            this._zhenqiDollPanel = new ZhenQiBabyPanel();
            UIEventsRegisterManager.registerUI(this._zhenqiDollPanel,ZhenQiBabyPanel);
         }
         return this._zhenqiDollPanel;
      }
      
      public function get zhenqiSuperPanel() : ZhenQiBabyPanelTwoPanel
      {
         if(this._zhenqiSuper == null)
         {
            this._zhenqiSuper = new ZhenQiBabyPanelTwoPanel();
            UIEventsRegisterManager.registerUI(this._zhenqiSuper,ZhenQiBabyPanelTwoPanel);
         }
         return this._zhenqiSuper;
      }
      
      public function get shoujiPanel() : CurioCollectPanel
      {
         if(this._shoujiPanel == null)
         {
            this._shoujiPanel = new CurioCollectPanel();
            UIEventsRegisterManager.registerUI(this._shoujiPanel,CurioCollectPanel);
         }
         return this._shoujiPanel;
      }
      
      public function get squirrelGiftPanel() : SquirrelGiftPanel
      {
         if(this._squirrelGiftPanel == null)
         {
            this._squirrelGiftPanel = new SquirrelGiftPanel();
            UIEventsRegisterManager.registerUI(this._squirrelGiftPanel,SquirrelGiftPanel);
         }
         return this._squirrelGiftPanel;
      }
      
      public function get goldSquirrelGiftPanel3011() : GoldSquirrelGiftPanel
      {
         if(this._goldSquirrelGiftPanel3011 == null)
         {
            this._goldSquirrelGiftPanel3011 = new GoldSquirrelGiftPanel();
            UIEventsRegisterManager.registerUI(this._goldSquirrelGiftPanel3011,GoldSquirrelGiftPanel);
         }
         return this._goldSquirrelGiftPanel3011;
      }
      
      public function get goldSquirrelGiftPanel3012() : GoldSquirrelGiftPanel
      {
         if(this._goldSquirrelGiftPanel3012 == null)
         {
            this._goldSquirrelGiftPanel3012 = new GoldSquirrelGiftPanel();
            UIEventsRegisterManager.registerUI(this._goldSquirrelGiftPanel3012,GoldSquirrelGiftPanel);
         }
         return this._goldSquirrelGiftPanel3012;
      }
      
      public function get goldSquirrelGiftPanel3013() : GoldSquirrelGiftPanel
      {
         if(this._goldSquirrelGiftPanel3013 == null)
         {
            this._goldSquirrelGiftPanel3013 = new GoldSquirrelGiftPanel();
            UIEventsRegisterManager.registerUI(this._goldSquirrelGiftPanel3013,GoldSquirrelGiftPanel);
         }
         return this._goldSquirrelGiftPanel3013;
      }
      
      public function get goldSquirrelGiftPanel3014() : GoldSquirrelGiftPanel
      {
         if(this._goldSquirrelGiftPanel3014 == null)
         {
            this._goldSquirrelGiftPanel3014 = new GoldSquirrelGiftPanel();
            UIEventsRegisterManager.registerUI(this._goldSquirrelGiftPanel3014,GoldSquirrelGiftPanel);
         }
         return this._goldSquirrelGiftPanel3014;
      }
      
      public function get goldSquirrelGiftPanel3015() : GoldSquirrelGiftPanel
      {
         if(this._goldSquirrelGiftPanel3015 == null)
         {
            this._goldSquirrelGiftPanel3015 = new GoldSquirrelGiftPanel();
            UIEventsRegisterManager.registerUI(this._goldSquirrelGiftPanel3015,GoldSquirrelGiftPanel);
         }
         return this._goldSquirrelGiftPanel3015;
      }
      
      public function get banghuiListPanel() : PartyListPanel
      {
         if(this._banghuiListPanel == null)
         {
            this._banghuiListPanel = new PartyListPanel();
            UIEventsRegisterManager.registerUI(this._banghuiListPanel,PartyListPanel);
         }
         return this._banghuiListPanel;
      }
      
      public function get banghuiCreatPanel() : Party_createPanel
      {
         if(this._banghuiCreatPanel == null)
         {
            this._banghuiCreatPanel = new Party_createPanel();
            UIEventsRegisterManager.registerUI(this._banghuiCreatPanel,Party_createPanel);
         }
         return this._banghuiCreatPanel;
      }
      
      public function get banghuiInfoPanel() : PartyPanel
      {
         if(this._banghuiInfoPanel == null)
         {
            this._banghuiInfoPanel = new PartyPanel();
            UIEventsRegisterManager.registerUI(this._banghuiInfoPanel,PartyPanel);
         }
         return this._banghuiInfoPanel;
      }
      
      public function get banghuiMemberListPanel() : Party_memberManagePanel
      {
         if(this._banghuiMemberListPanel == null)
         {
            this._banghuiMemberListPanel = new Party_memberManagePanel();
            UIEventsRegisterManager.registerUI(this._banghuiMemberListPanel,Party_memberManagePanel);
         }
         return this._banghuiMemberListPanel;
      }
      
      public function get banghuiNewsPanel() : Party_infoPanel
      {
         if(this._banghuiNewsPanel == null)
         {
            this._banghuiNewsPanel = new Party_infoPanel();
            UIEventsRegisterManager.registerUI(this._banghuiNewsPanel,Party_infoPanel);
         }
         return this._banghuiNewsPanel;
      }
      
      public function get bangqiInfoPanel() : PartyFlagPanel
      {
         if(this._bangqiInfoPanel == null)
         {
            this._bangqiInfoPanel = new PartyFlagPanel();
            UIEventsRegisterManager.registerUI(this._bangqiInfoPanel,PartyFlagPanel);
         }
         return this._bangqiInfoPanel;
      }
      
      public function get bangqiAnchaPanel() : PartyFlagInstallPanel
      {
         if(this._bangqiAnchaPanel == null)
         {
            this._bangqiAnchaPanel = new PartyFlagInstallPanel();
            UIEventsRegisterManager.registerUI(this._bangqiAnchaPanel,PartyFlagInstallPanel);
         }
         return this._bangqiAnchaPanel;
      }
      
      public function get bangqiBanggongPanel() : PartyContributePanel
      {
         if(this._bangqiBanggongPanel == null)
         {
            this._bangqiBanggongPanel = new PartyContributePanel();
            UIEventsRegisterManager.registerUI(this._bangqiBanggongPanel,PartyContributePanel);
         }
         return this._bangqiBanggongPanel;
      }
      
      public function get gongchengXiangyangguishuSPanel() : XiangYangGuiShuPanel
      {
         if(this._gongchengXiangyangguishuSPanel == null)
         {
            this._gongchengXiangyangguishuSPanel = new XiangYangGuiShuPanel();
            UIEventsRegisterManager.registerUI(this._gongchengXiangyangguishuSPanel,XiangYangGuiShuPanel);
         }
         return this._gongchengXiangyangguishuSPanel;
      }
      
      public function get gongchengGongchengchePanel() : GongchengPaoPanel
      {
         if(this._gongchengGongchengchePanel == null)
         {
            this._gongchengGongchengchePanel = new GongchengPaoPanel();
            UIEventsRegisterManager.registerUI(this._gongchengGongchengchePanel,GongchengPaoPanel);
         }
         return this._gongchengGongchengchePanel;
      }
      
      public function get stonePanel() : StonePanel
      {
         if(this._stonePanel == null)
         {
            this._stonePanel = new StonePanel();
            UIEventsRegisterManager.registerUI(this._stonePanel,StonePanel);
         }
         return this._stonePanel;
      }
      
      public function get huizhangDazaoHechengPanel() : HuizhangDazaoHechengPanel
      {
         if(this._huizhangDazaoHechengPanel == null)
         {
            this._huizhangDazaoHechengPanel = new HuizhangDazaoHechengPanel();
            UIEventsRegisterManager.registerUI(this._huizhangDazaoHechengPanel,HuizhangDazaoHechengPanel);
         }
         return this._huizhangDazaoHechengPanel;
      }
      
      public function get coneyGirlPanel() : ConeyGirlPanel
      {
         if(this._coneyGirlPanel == null)
         {
            this._coneyGirlPanel = new ConeyGirlPanel();
            UIEventsRegisterManager.registerUI(this._coneyGirlPanel,ConeyGirlPanel);
         }
         return this._coneyGirlPanel;
      }
      
      public function get stoneOptionSmallPanel() : StoneOptionSmallPanel
      {
         if(this._stoneOptionSmallPanel == null)
         {
            this._stoneOptionSmallPanel = new StoneOptionSmallPanel();
            UIEventsRegisterManager.registerUI(this._stoneOptionSmallPanel,StoneOptionSmallPanel);
         }
         return this._stoneOptionSmallPanel;
      }
      
      public function get xunzhangStoneOptionSmallPanel() : XunzhangOptionSmallPanel
      {
         if(this._xunzhangStoneOptionSmallPanel == null)
         {
            this._xunzhangStoneOptionSmallPanel = new XunzhangOptionSmallPanel();
            UIEventsRegisterManager.registerUI(this._xunzhangStoneOptionSmallPanel,XunzhangOptionSmallPanel);
         }
         return this._xunzhangStoneOptionSmallPanel;
      }
      
      public function get amuletPanel() : AmuletPanel
      {
         if(this._amuletPanel == null)
         {
            this._amuletPanel = new AmuletPanel();
            UIEventsRegisterManager.registerUI(this._amuletPanel,AmuletPanel);
         }
         return this._amuletPanel;
      }
      
      public function get sheliziEnchasePanel() : SheliziEnchasePanel
      {
         if(this._sheliziEnchasePanel == null)
         {
            this._sheliziEnchasePanel = new SheliziEnchasePanel();
            UIEventsRegisterManager.registerUI(this._sheliziEnchasePanel,SheliziEnchasePanel);
         }
         return this._sheliziEnchasePanel;
      }
      
      public function get shenLongPanel() : ShenLongFuLianZiPanel
      {
         if(this._shenLongPanel == null)
         {
            this._shenLongPanel = new ShenLongFuLianZiPanel();
            UIEventsRegisterManager.registerUI(this._shenLongPanel,ShenLongFuLianZiPanel);
         }
         return this._shenLongPanel;
      }
      
      public function get shenLongDaKongPanel() : ShenlongDakongPanel
      {
         if(this._shenLongDaKongPanel == null)
         {
            this._shenLongDaKongPanel = new ShenlongDakongPanel();
            UIEventsRegisterManager.registerUI(this._shenLongDaKongPanel,ShenlongDakongPanel);
         }
         return this._shenLongDaKongPanel;
      }
      
      public function get partyKungfuPanel() : PartyKungfuPanel
      {
         if(this._partyKungfuPanel == null)
         {
            this._partyKungfuPanel = new PartyKungfuPanel();
            UIEventsRegisterManager.registerUI(this._partyKungfuPanel,PartyKungfuPanel);
         }
         return this._partyKungfuPanel;
      }
      
      public function get equipPuddingTwoPanel() : EquipPuddingTwoPanel
      {
         if(this._equipPuddingTwoPanel == null)
         {
            this._equipPuddingTwoPanel = new EquipPuddingTwoPanel();
            UIEventsRegisterManager.registerUI(this._equipPuddingTwoPanel,EquipPuddingTwoPanel);
         }
         return this._equipPuddingTwoPanel;
      }
      
      public function get rongXueDanPanel() : RongXunDanPanel
      {
         if(this._rongXueDanPanel == null)
         {
            this._rongXueDanPanel = new RongXunDanPanel();
            UIEventsRegisterManager.registerUI(this._rongXueDanPanel,RongXunDanPanel);
         }
         return this._rongXueDanPanel;
      }
      
      public function get launchProposalPanel() : LaunchProposalPanel
      {
         if(this._launchProposalPanel == null)
         {
            this._launchProposalPanel = new LaunchProposalPanel();
            UIEventsRegisterManager.registerUI(this._launchProposalPanel,LaunchProposalPanel);
         }
         return this._launchProposalPanel;
      }
      
      public function get proposalAffirmPanel() : ProposalAffirmPanel
      {
         if(this._proposalAffirmPanel == null)
         {
            this._proposalAffirmPanel = new ProposalAffirmPanel();
            UIEventsRegisterManager.registerUI(this._proposalAffirmPanel,ProposalAffirmPanel);
         }
         return this._proposalAffirmPanel;
      }
      
      public function get marriageSuccePanel() : MarriageSuccePanel
      {
         if(this._marriageSuccePanel == null)
         {
            this._marriageSuccePanel = new MarriageSuccePanel();
            UIEventsRegisterManager.registerUI(this._marriageSuccePanel,MarriageSuccePanel);
         }
         return this._marriageSuccePanel;
      }
      
      public function get marriageWeddingPanel() : MarriageWeddingPanel
      {
         if(this._marriageWeddingPanel == null)
         {
            this._marriageWeddingPanel = new MarriageWeddingPanel();
            UIEventsRegisterManager.registerUI(this._marriageWeddingPanel,MarriageWeddingPanel);
         }
         return this._marriageWeddingPanel;
      }
      
      public function get marriageCashGiftListPanel() : MarriageCashGiftListPanel
      {
         if(this._marriageCashGiftListPanel == null)
         {
            this._marriageCashGiftListPanel = new MarriageCashGiftListPanel();
            UIEventsRegisterManager.registerUI(this._marriageCashGiftListPanel,MarriageCashGiftListPanel);
         }
         return this._marriageCashGiftListPanel;
      }
      
      public function get marriageDinePanel() : MarriageDinePanel
      {
         if(this._marriageDinePanel == null)
         {
            this._marriageDinePanel = new MarriageDinePanel();
            UIEventsRegisterManager.registerUI(this._marriageDinePanel,MarriageDinePanel);
         }
         return this._marriageDinePanel;
      }
      
      public function get marriageGiveCashGiftPanel() : MarriageGiveCashGiftPanel
      {
         if(this._marriageGiveCashGiftPanel == null)
         {
            this._marriageGiveCashGiftPanel = new MarriageGiveCashGiftPanel();
            UIEventsRegisterManager.registerUI(this._marriageGiveCashGiftPanel,MarriageGiveCashGiftPanel);
         }
         return this._marriageGiveCashGiftPanel;
      }
      
      public function get taKungfuPanel() : TAKungfuPanel
      {
         if(this._taKungfuPanel == null)
         {
            this._taKungfuPanel = new TAKungfuPanel();
            UIEventsRegisterManager.registerUI(this._taKungfuPanel,TAKungfuPanel);
         }
         return this._taKungfuPanel;
      }
      
      public function get taJingmaiPanel() : TAVenationPanel
      {
         if(this._taJingmaiPanel == null)
         {
            this._taJingmaiPanel = new TAVenationPanel();
            UIEventsRegisterManager.registerUI(this._taJingmaiPanel,TAVenationPanel);
         }
         return this._taJingmaiPanel;
      }
      
      public function get labourPanel() : MallFestivalPanel
      {
         if(this._labourPanel == null)
         {
            this._labourPanel = new MallFestivalPanel();
            UIEventsRegisterManager.registerUI(this._labourPanel,MallFestivalPanel);
         }
         return this._labourPanel;
      }
      
      public function get anqiActivePanel() : AnqiActivation
      {
         if(this._anqiActivePanel == null)
         {
            this._anqiActivePanel = new AnqiActivation();
            UIEventsRegisterManager.registerUI(this._anqiActivePanel,AnqiActivation);
         }
         return this._anqiActivePanel;
      }
      
      public function get equipUpdataTypePanel() : MenghuanShuxingKa
      {
         if(this._equipUpdataTypePanel == null)
         {
            this._equipUpdataTypePanel = new MenghuanShuxingKa();
            UIEventsRegisterManager.registerUI(this._equipUpdataTypePanel,MenghuanShuxingKa);
         }
         return this._equipUpdataTypePanel;
      }
      
      public function get giftCardPanel() : GiftCardPanel
      {
         if(this._giftCardPanel == null)
         {
            this._giftCardPanel = new GiftCardPanel();
            UIEventsRegisterManager.registerUI(this._giftCardPanel,GiftCardPanel);
         }
         return this._giftCardPanel;
      }
      
      public function get kuafuLunjianBackpack() : KuafuLunjianBackpack
      {
         if(this._kuafuLunjianBackpack == null)
         {
            this._kuafuLunjianBackpack = new KuafuLunjianBackpack();
            UIEventsRegisterManager.registerUI(this._kuafuLunjianBackpack,KuafuLunjianBackpack);
         }
         return this._kuafuLunjianBackpack;
      }
      
      public function get lunjianMall() : MallLunjianPanel
      {
         if(this._lunjianMall == null)
         {
            this._lunjianMall = new MallLunjianPanel();
            UIEventsRegisterManager.registerUI(this._lunjianMall,MallLunjianPanel);
         }
         return this._lunjianMall;
      }
      
      public function get nitaSkill() : DantianWuxueDanPanel
      {
         if(this._nitaSkill == null)
         {
            this._nitaSkill = new DantianWuxueDanPanel();
            UIEventsRegisterManager.registerUI(this._nitaSkill,DantianWuxueDanPanel);
         }
         return this._nitaSkill;
      }
      
      public function get sixStoneToSevenStonePanel() : TopStonePanel
      {
         if(this._sixStoneToSevenStonePanel == null)
         {
            this._sixStoneToSevenStonePanel = new TopStonePanel();
            UIEventsRegisterManager.registerUI(this._sixStoneToSevenStonePanel,TopStonePanel);
         }
         return this._sixStoneToSevenStonePanel;
      }
      
      public function get qianChuiBaiLianPanel() : QianchuiBailianPanel
      {
         if(this._qianChuiBaiLianPanel == null)
         {
            this._qianChuiBaiLianPanel = new QianchuiBailianPanel();
            UIEventsRegisterManager.registerUI(this._qianChuiBaiLianPanel,QianchuiBailianPanel);
         }
         return this._qianChuiBaiLianPanel;
      }
      
      public function get xianTianWuJingPanel() : XiantianWujingPanel
      {
         if(this._xianTianWuJingPanel == null)
         {
            this._xianTianWuJingPanel = new XiantianWujingPanel();
            UIEventsRegisterManager.registerUI(this._xianTianWuJingPanel,XiantianWujingPanel);
         }
         return this._xianTianWuJingPanel;
      }
      
      public function get teamInstancePanel3v3() : JingjiChangBaomingPanel
      {
         if(this._teamInstancePanel3v3 == null)
         {
            this._teamInstancePanel3v3 = new JingjiChangBaomingPanel();
            UIEventsRegisterManager.registerUI(this._teamInstancePanel3v3,JingjiChangBaomingPanel);
         }
         return this._teamInstancePanel3v3;
      }
      
      public function get kuafu3v3ResultPanel() : JingjiResultPanel
      {
         if(this._kuafu3v3ResultPanel == null)
         {
            this._kuafu3v3ResultPanel = new JingjiResultPanel();
            UIEventsRegisterManager.registerUI(this._kuafu3v3ResultPanel,JingjiResultPanel);
         }
         return this._kuafu3v3ResultPanel;
      }
      
      public function get kuafu3v3VSResultPanel() : JingjiVSPanel
      {
         if(this._kuafu3v3VSResultPanel == null)
         {
            this._kuafu3v3VSResultPanel = new JingjiVSPanel();
            UIEventsRegisterManager.registerUI(this._kuafu3v3VSResultPanel,JingjiVSPanel);
         }
         return this._kuafu3v3VSResultPanel;
      }
      
      public function get taskPanel() : TaskPanel
      {
         if(this._taskPanel == null)
         {
            this._taskPanel = new TaskPanel();
            UIEventsRegisterManager.registerUI(this._taskPanel,TaskPanel);
         }
         return this._taskPanel;
      }
      
      public function get cycTaskPanel() : CycTaskPanel
      {
         if(this._cycTaskPanel == null)
         {
            this._cycTaskPanel = new CycTaskPanel();
            UIEventsRegisterManager.registerUI(this._cycTaskPanel,CycTaskPanel);
         }
         return this._cycTaskPanel;
      }
      
      public function get partyTaskPanel() : Party_taskPanel
      {
         if(this._partyTaskPanel == null)
         {
            this._partyTaskPanel = new Party_taskPanel();
            UIEventsRegisterManager.registerUI(this._partyTaskPanel,Party_taskPanel);
         }
         return this._partyTaskPanel;
      }
      
      public function get partyTaskCompletePanel() : Party_task_PrisePanel
      {
         if(this._partyTaskCompletePanel == null)
         {
            this._partyTaskCompletePanel = new Party_task_PrisePanel();
            UIEventsRegisterManager.registerUI(this._partyTaskCompletePanel,Party_task_PrisePanel);
         }
         return this._partyTaskCompletePanel;
      }
      
      public function get partyTaskInvitePanel() : Party_task_InvitePanel
      {
         if(this._partyTaskInvitePanel == null)
         {
            this._partyTaskInvitePanel = new Party_task_InvitePanel();
            UIEventsRegisterManager.registerUI(this._partyTaskInvitePanel,Party_task_InvitePanel);
         }
         return this._partyTaskInvitePanel;
      }
      
      public function get partyBossPanel() : PartyBossPanel
      {
         if(this._partyBossPanel == null)
         {
            this._partyBossPanel = new PartyBossPanel();
            UIEventsRegisterManager.registerUI(this._partyBossPanel,PartyBossPanel);
         }
         return this._partyBossPanel;
      }
      
      public function get partyBossInvitePanel() : PartyBoss_InvitePanel
      {
         if(this._partyBossInvitePanel == null)
         {
            this._partyBossInvitePanel = new PartyBoss_InvitePanel();
            UIEventsRegisterManager.registerUI(this._partyBossInvitePanel,PartyBoss_InvitePanel);
         }
         return this._partyBossInvitePanel;
      }
      
      public function get shuXingDaZaoKaPanel() : ShuxingDazaokaPanel
      {
         if(this._shuXingDaZaoKaPanel == null)
         {
            this._shuXingDaZaoKaPanel = new ShuxingDazaokaPanel();
            UIEventsRegisterManager.registerUI(this._shuXingDaZaoKaPanel,ShuxingDazaokaPanel);
         }
         return this._shuXingDaZaoKaPanel;
      }
      
      public function get siLingZhenYinCangShuXingPanel() : MenghuanSishengshouPanel
      {
         if(this._siLingZhenYinCangShuXingPanel == null)
         {
            this._siLingZhenYinCangShuXingPanel = new MenghuanSishengshouPanel();
            UIEventsRegisterManager.registerUI(this._siLingZhenYinCangShuXingPanel,MenghuanSishengshouPanel);
         }
         return this._siLingZhenYinCangShuXingPanel;
      }
      
      public function get cardGiftPanel() : CardGiftPanel
      {
         if(this._cardGiftPanel == null)
         {
            this._cardGiftPanel = new CardGiftPanel();
            UIEventsRegisterManager.registerUI(this._cardGiftPanel,CardGiftPanel);
         }
         return this._cardGiftPanel;
      }
      
      public function get tutengShuxingTihuankaPanel() : TutengShuxingTihuankaPanel
      {
         if(this._tutengShuxingTihuankaPanel == null)
         {
            this._tutengShuxingTihuankaPanel = new TutengShuxingTihuankaPanel();
            UIEventsRegisterManager.registerUI(this._tutengShuxingTihuankaPanel,TutengShuxingTihuankaPanel);
         }
         return this._tutengShuxingTihuankaPanel;
      }
      
      public function get freeMallCadePanel() : MallHuodongPanel
      {
         if(this._freeMallCadePanel == null)
         {
            this._freeMallCadePanel = new MallHuodongPanel();
            UIEventsRegisterManager.registerUI(this._freeMallCadePanel,MallHuodongPanel);
         }
         return this._freeMallCadePanel;
      }
      
      public function get chuanShuoZhuangBeiDaZaoPanel() : ChuanShuoZhuangBeiDaZaoPanel
      {
         if(this._chuanShuoZhuangBeiDaZaoPanel == null)
         {
            this._chuanShuoZhuangBeiDaZaoPanel = new ChuanShuoZhuangBeiDaZaoPanel();
            UIEventsRegisterManager.registerUI(this._chuanShuoZhuangBeiDaZaoPanel,ChuanShuoZhuangBeiDaZaoPanel);
         }
         return this._chuanShuoZhuangBeiDaZaoPanel;
      }
      
      public function get changeSuperMount() : RideJiaohuanShenshouPanel
      {
         if(this._changeSuperMount == null)
         {
            this._changeSuperMount = new RideJiaohuanShenshouPanel();
            UIEventsRegisterManager.registerUI(this._changeSuperMount,RideJiaohuanShenshouPanel);
         }
         return this._changeSuperMount;
      }
      
      public function get changeSuperMount1() : RideJiaohuanShenshouPanel
      {
         if(this._changeSuperMount1 == null)
         {
            this._changeSuperMount1 = new RideJiaohuanShenshouPanel();
            this._changeSuperMount1.panelID = RideJiaohuanShenshouPanel.PANEL_TYPE_ID_DICT.shengshouJiaohuan;
            UIEventsRegisterManager.registerUI(this._changeSuperMount1,RideJiaohuanShenshouPanel);
         }
         return this._changeSuperMount1;
      }
      
      public function get changeSuperMount2() : RideJiaohuanShenshouPanel
      {
         if(this._changeSuperMount2 == null)
         {
            this._changeSuperMount2 = new RideJiaohuanShenshouPanel();
            this._changeSuperMount2.panelID = RideJiaohuanShenshouPanel.PANEL_TYPE_ID_DICT.moshouJiaohuan;
            UIEventsRegisterManager.registerUI(this._changeSuperMount2,RideJiaohuanShenshouPanel);
         }
         return this._changeSuperMount2;
      }
      
      public function get changeMoshouMount() : RideJiaohuanMoshouPanel
      {
         if(this._changeMoshouMount == null)
         {
            this._changeMoshouMount = new RideJiaohuanMoshouPanel();
            UIEventsRegisterManager.registerUI(this._changeMoshouMount,RideJiaohuanMoshouPanel);
         }
         return this._changeMoshouMount;
      }
      
      public function get jinChuiZiPanel() : TishengZhuangbeiMenghuanPanel
      {
         if(this._jinChuiZiPanel == null)
         {
            this._jinChuiZiPanel = new TishengZhuangbeiMenghuanPanel();
            UIEventsRegisterManager.registerUI(this._jinChuiZiPanel,TishengZhuangbeiMenghuanPanel);
         }
         return this._jinChuiZiPanel;
      }
      
      public function get rankAttackPanel() : ZhandouliPanel
      {
         if(this._rankAttackPanel == null)
         {
            this._rankAttackPanel = new ZhandouliPanel();
            UIEventsRegisterManager.registerUI(this._rankAttackPanel,ZhandouliPanel);
         }
         return this._rankAttackPanel;
      }
      
      public function get wuxieZhijingPanel() : WuxieZhijingPanel
      {
         if(this._wuxieZhijingPanel == null)
         {
            this._wuxieZhijingPanel = new WuxieZhijingPanel();
            UIEventsRegisterManager.registerUI(this._wuxieZhijingPanel,WuxieZhijingPanel);
         }
         return this._wuxieZhijingPanel;
      }
      
      public function get huyiKaiguangPanel() : HuyiKaiguangPanel
      {
         if(this._huyiKaiguangPanel == null)
         {
            this._huyiKaiguangPanel = new HuyiKaiguangPanel();
            UIEventsRegisterManager.registerUI(this._huyiKaiguangPanel,HuyiKaiguangPanel);
         }
         return this._huyiKaiguangPanel;
      }
      
      public function get huyiLingHuaPanel() : HuyiLingHuaPanel
      {
         if(this._huyiLingHuaPanel == null)
         {
            this._huyiLingHuaPanel = new HuyiLingHuaPanel();
            UIEventsRegisterManager.registerUI(this._huyiLingHuaPanel,HuyiLingHuaPanel);
         }
         return this._huyiLingHuaPanel;
      }
      
      public function get huyiXiLianPanel() : HuyiXiLianPanel
      {
         if(this._huyiXiLianPanel == null)
         {
            this._huyiXiLianPanel = new HuyiXiLianPanel();
            UIEventsRegisterManager.registerUI(this._huyiXiLianPanel,HuyiXiLianPanel);
         }
         return this._huyiXiLianPanel;
      }
      
      public function get zhuangbeiJihuoPanel() : ZhuangbeiJihuoPanel
      {
         if(this._zhuangbeiJihuoPanel == null)
         {
            this._zhuangbeiJihuoPanel = new ZhuangbeiJihuoPanel();
            UIEventsRegisterManager.registerUI(this._zhuangbeiJihuoPanel,ZhuangbeiJihuoPanel);
         }
         return this._zhuangbeiJihuoPanel;
      }
      
      public function get biwuDuijuePanel() : BiwuDuijue_Panel
      {
         if(this._biwuDuijuePanel == null)
         {
            this._biwuDuijuePanel = new BiwuDuijue_Panel();
            UIEventsRegisterManager.registerUI(this._biwuDuijuePanel,BiwuDuijue_Panel);
         }
         return this._biwuDuijuePanel;
      }
      
      public function get biwuCrossPlatformPanel() : BiwuCrossPlatform_Panel
      {
         if(this._biwuCrossPlatformPanel == null)
         {
            this._biwuCrossPlatformPanel = new BiwuCrossPlatform_Panel();
            UIEventsRegisterManager.registerUI(this._biwuCrossPlatformPanel,BiwuCrossPlatform_Panel);
         }
         return this._biwuCrossPlatformPanel;
      }
      
      public function get biwuDuijueCrossP_Panel() : BiwuDuijueCrossP_Panel
      {
         if(this._biwuDuijueCrossP_Panel == null)
         {
            this._biwuDuijueCrossP_Panel = new BiwuDuijueCrossP_Panel();
            UIEventsRegisterManager.registerUI(this._biwuDuijueCrossP_Panel,BiwuDuijueCrossP_Panel);
         }
         return this._biwuDuijueCrossP_Panel;
      }
      
      public function get baoShiJianShangPanel() : BaoShiJianShangPanel
      {
         if(this._baoShiJianShangPanel == null)
         {
            this._baoShiJianShangPanel = new BaoShiJianShangPanel();
            UIEventsRegisterManager.registerUI(this._baoShiJianShangPanel,BaoShiJianShangPanel);
         }
         return this._baoShiJianShangPanel;
      }
      
      public function get baoShiJianShangGuiZePanel() : BaoShiJianShangGuiZeJieShaoPanel
      {
         if(this._baoShiJianShangGuiZePanel == null)
         {
            this._baoShiJianShangGuiZePanel = new BaoShiJianShangGuiZeJieShaoPanel();
            UIEventsRegisterManager.registerUI(this._baoShiJianShangGuiZePanel,BaoShiJianShangGuiZeJieShaoPanel);
         }
         return this._baoShiJianShangGuiZePanel;
      }
      
      public function get daoJuTiQuKaPanel() : DaoJuTiQuKaPanel
      {
         if(this._daoJuTiQuKaPanel == null)
         {
            this._daoJuTiQuKaPanel = new DaoJuTiQuKaPanel();
            UIEventsRegisterManager.registerUI(this._daoJuTiQuKaPanel,DaoJuTiQuKaPanel);
         }
         return this._daoJuTiQuKaPanel;
      }
      
      public function get shiShiZhanKuangPanel() : ShishiZhankuangPanel
      {
         if(this._shiShiZhanKuangPanel == null)
         {
            this._shiShiZhanKuangPanel = new ShishiZhankuangPanel();
            UIEventsRegisterManager.registerUI(this._shiShiZhanKuangPanel,ShishiZhankuangPanel);
         }
         return this._shiShiZhanKuangPanel;
      }
      
      public function get wanfaShiyiTu() : WanfaShiyiTuPanel
      {
         if(this._wanfaShiyiTu == null)
         {
            this._wanfaShiyiTu = new WanfaShiyiTuPanel();
            UIEventsRegisterManager.registerUI(this._wanfaShiyiTu,WanfaShiyiTuPanel);
         }
         return this._wanfaShiyiTu;
      }
      
      public function get teamKuaFuZhanChangPanel() : KuaFuZhanChangPanel
      {
         if(this._teamKuaFuZhanChangPanel == null)
         {
            this._teamKuaFuZhanChangPanel = new KuaFuZhanChangPanel();
            UIEventsRegisterManager.registerUI(this._teamKuaFuZhanChangPanel,KuaFuZhanChangPanel);
         }
         return this._teamKuaFuZhanChangPanel;
      }
      
      public function get xiangyangzhanchang() : XiangYangZhanChangCanvas
      {
         if(this._xiangyangzhanchang == null)
         {
            this._xiangyangzhanchang = new XiangYangZhanChangCanvas();
            UIEventsRegisterManager.registerUI(this._xiangyangzhanchang,XiangYangZhanChangCanvas);
         }
         return this._xiangyangzhanchang;
      }
      
      public function get liandanluPanel() : LiandanluPanel
      {
         if(this._liandanluPanel == null)
         {
            this._liandanluPanel = new LiandanluPanel();
            UIEventsRegisterManager.registerUI(this._liandanluPanel,LiandanluPanel);
         }
         return this._liandanluPanel;
      }
      
      public function get cailiaoBaoxiangPanel() : LiandanluPanel
      {
         if(this._cailiaoBaoxiangPanel == null)
         {
            this._cailiaoBaoxiangPanel = new LiandanluPanel();
            UIEventsRegisterManager.registerUI(this._cailiaoBaoxiangPanel,LiandanluPanel);
         }
         return this._cailiaoBaoxiangPanel;
      }
      
      public function get wanjiahuikuiPanel() : WanJiaHuiKuiPanel
      {
         if(this._wanjiahuikuiPanel == null)
         {
            this._wanjiahuikuiPanel = new WanJiaHuiKuiPanel();
            UIEventsRegisterManager.registerUI(this._wanjiahuikuiPanel,WanJiaHuiKuiPanel);
         }
         return this._wanjiahuikuiPanel;
      }
      
      public function get kuaFuLeiTaiPanel() : KuaFuLeiTaiPanel
      {
         if(this._kuaFuLeiTaiPanel == null)
         {
            this._kuaFuLeiTaiPanel = new KuaFuLeiTaiPanel();
            UIEventsRegisterManager.registerUI(this._kuaFuLeiTaiPanel,KuaFuLeiTaiPanel);
         }
         return this._kuaFuLeiTaiPanel;
      }
      
      public function get kuafuleitaiResultPanel() : KuafuleitaiResultPanel
      {
         if(this._kuafuleitaiResultPanel == null)
         {
            this._kuafuleitaiResultPanel = new KuafuleitaiResultPanel();
            UIEventsRegisterManager.registerUI(this._kuafuleitaiResultPanel,KuafuleitaiResultPanel);
         }
         return this._kuafuleitaiResultPanel;
      }
      
      public function get xianshiDajiangDuihuanPanel() : XianshiDajiangDuihuanPanel
      {
         if(this._xianshiDajiangDuihuanPanel == null)
         {
            this._xianshiDajiangDuihuanPanel = new XianshiDajiangDuihuanPanel();
            UIEventsRegisterManager.registerUI(this._xianshiDajiangDuihuanPanel,XianshiDajiangDuihuanPanel);
         }
         return this._xianshiDajiangDuihuanPanel;
      }
      
      public function get qinggongyanPanel() : QingGongYanPanel
      {
         if(this._qinggongyanPanel == null)
         {
            this._qinggongyanPanel = new QingGongYanPanel();
            UIEventsRegisterManager.registerUI(this._qinggongyanPanel,QingGongYanPanel);
         }
         return this._qinggongyanPanel;
      }
      
      public function get qinggongyanOverPanel() : QingGongYanOverPanel
      {
         if(this._qinggongyanOverPanel == null)
         {
            this._qinggongyanOverPanel = new QingGongYanOverPanel();
            UIEventsRegisterManager.registerUI(this._qinggongyanOverPanel,QingGongYanOverPanel);
         }
         return this._qinggongyanOverPanel;
      }
      
      public function get hushenfuXiLianPanel() : HushenfuXilianCanvas
      {
         if(this._hushenfuXiLianPanel == null)
         {
            this._hushenfuXiLianPanel = new HushenfuXilianCanvas();
            UIEventsRegisterManager.registerUI(this._hushenfuXiLianPanel,HushenfuXilianCanvas);
         }
         return this._hushenfuXiLianPanel;
      }
      
      public function get biwudahuiVSResultPanel() : BiwudahuiVSPanel
      {
         if(this._biwudahuiVSResultPanel == null)
         {
            this._biwudahuiVSResultPanel = new BiwudahuiVSPanel();
            this._biwudahuiVSResultPanel.x = 260;
            this._biwudahuiVSResultPanel.y = 70;
            UIEventsRegisterManager.registerUI(this._biwudahuiVSResultPanel,BiwudahuiVSPanel);
         }
         return this._biwudahuiVSResultPanel;
      }
      
      public function get zhanhunhuodePanel() : ZhanHunPanel
      {
         if(!this._zhanhunhuodePanel)
         {
            this._zhanhunhuodePanel = new ZhanHunPanel();
            UIEventsRegisterManager.registerUI(this._zhanhunhuodePanel,ZhanHunPanel);
         }
         return this._zhanhunhuodePanel;
      }
      
      public function get zhanhundai() : ZhanhundaiPanel
      {
         if(this._zhanhundai == null)
         {
            this._zhanhundai = new ZhanhundaiPanel();
            UIEventsRegisterManager.registerUI(this._zhanhundai,ZhanhundaiPanel);
         }
         return this._zhanhundai;
      }
      
      public function get xunzhangDuanzao() : XunZhangAndZhanQiDuanZhaoPanel
      {
         if(this._xunzhangduanzao == null)
         {
            this._xunzhangduanzao = new XunZhangAndZhanQiDuanZhaoPanel();
            UIEventsRegisterManager.registerUI(this._xunzhangduanzao,XunZhangAndZhanQiDuanZhaoPanel);
         }
         return this._xunzhangduanzao;
      }
      
      public function get diwangjian() : ShengDanXunZhangPanel
      {
         if(this._diwangjian == null)
         {
            this._diwangjian = new ShengDanXunZhangPanel();
            UIEventsRegisterManager.registerUI(this._diwangjian,ShengDanXunZhangPanel);
         }
         return this._diwangjian;
      }
      
      public function get sishengshouKeWenPanel() : SiShengShouKeWenPanel
      {
         if(this._sishengshoukewenPanel == null)
         {
            this._sishengshoukewenPanel = new SiShengShouKeWenPanel();
            UIEventsRegisterManager.registerUI(this._sishengshoukewenPanel,SiShengShouKeWenPanel);
         }
         return this._sishengshoukewenPanel;
      }
      
      public function get shiShiKaiFengPanel() : EquipKaiFengPanel
      {
         if(this._shiShiKaiFengPanel == null)
         {
            this._shiShiKaiFengPanel = new EquipKaiFengPanel();
            UIEventsRegisterManager.registerUI(this._shiShiKaiFengPanel,EquipKaiFengPanel);
         }
         return this._shiShiKaiFengPanel;
      }
      
      public function get huXinYaoTiShengPanel() : HuXinYaoTiShengPanel
      {
         if(this._huXinYaoTiShengPanel == null)
         {
            this._huXinYaoTiShengPanel = new HuXinYaoTiShengPanel();
            UIEventsRegisterManager.registerUI(this._huXinYaoTiShengPanel,HuXinYaoTiShengPanel);
         }
         return this._huXinYaoTiShengPanel;
      }
      
      public function get fuChouOKPanel() : FuChouOKPanel
      {
         if(this._fuChouOKPanel == null)
         {
            this._fuChouOKPanel = new FuChouOKPanel();
            UIEventsRegisterManager.registerUI(this._fuChouOKPanel,FuChouOKPanel);
         }
         return this._fuChouOKPanel;
      }
      
      public function get ciShaJiangliPanel() : CishaJiangliPanel
      {
         if(this._ciShaJiangliPanel == null)
         {
            this._ciShaJiangliPanel = new CishaJiangliPanel();
            UIEventsRegisterManager.registerUI(this._ciShaJiangliPanel,CishaJiangliPanel);
         }
         return this._ciShaJiangliPanel;
      }
      
      public function get cishaMilingPanel() : CishaMilingCanvas
      {
         if(this._cishaMilingPanel == null)
         {
            this._cishaMilingPanel = new CishaMilingCanvas();
            UIEventsRegisterManager.registerUI(this._cishaMilingPanel,CishaMilingCanvas);
         }
         return this._cishaMilingPanel;
      }
      
      public function get dixiaQianZhuangPanel() : DiXiaQianZhuangPanel
      {
         if(this._dixiaQianZhuangPanel == null)
         {
            this._dixiaQianZhuangPanel = new DiXiaQianZhuangPanel();
            UIEventsRegisterManager.registerUI(this._dixiaQianZhuangPanel,DiXiaQianZhuangPanel);
         }
         return this._dixiaQianZhuangPanel;
      }
      
      public function get aojianZhengba() : AojianZhengbaSelectCanvas
      {
         if(this._aojianZhengba == null)
         {
            this._aojianZhengba = new AojianZhengbaSelectCanvas();
            UIEventsRegisterManager.registerUI(this._aojianZhengba,AojianZhengbaSelectCanvas);
         }
         return this._aojianZhengba;
      }
      
      public function get aoJianZhuZaoPanel() : AoJianZhuZaoPanel
      {
         if(this._aojianzhuzaoPanel == null)
         {
            this._aojianzhuzaoPanel = new AoJianZhuZaoPanel();
            UIEventsRegisterManager.registerUI(this._aojianzhuzaoPanel,AoJianZhuZaoPanel);
         }
         return this._aojianzhuzaoPanel;
      }
      
      public function get christmasRankCanvas() : ChristmasRankCanvas
      {
         if(this._christmasRankCanvas == null)
         {
            this._christmasRankCanvas = new ChristmasRankCanvas();
            UIEventsRegisterManager.registerUI(this._christmasRankCanvas,ChristmasRankCanvas);
         }
         return this._christmasRankCanvas;
      }
      
      public function get xunzhangluPanel() : XunZhangluPanel
      {
         if(this._xunzhangluPanel == null)
         {
            this._xunzhangluPanel = new XunZhangluPanel();
            UIEventsRegisterManager.registerUI(this._xunzhangluPanel,XunZhangluPanel);
         }
         return this._xunzhangluPanel;
      }
      
      public function get yuanPanGiftPanel() : YuanPanGiftPanel
      {
         if(this._yuanPanGiftPanel == null)
         {
            this._yuanPanGiftPanel = new YuanPanGiftPanel();
            UIEventsRegisterManager.registerUI(this._yuanPanGiftPanel,YuanPanGiftPanel);
         }
         return this._yuanPanGiftPanel;
      }
      
      public function get tianFuSuiPianHeChengPanel() : TianFuSuiPianHeChengPanel
      {
         if(this._tianFuSuiPianHeChengPanel == null)
         {
            this._tianFuSuiPianHeChengPanel = new TianFuSuiPianHeChengPanel();
            UIEventsRegisterManager.registerUI(this._tianFuSuiPianHeChengPanel,TianFuSuiPianHeChengPanel);
         }
         return this._tianFuSuiPianHeChengPanel;
      }
      
      public function get xqTianFuPanel() : XiangQianTianFuPanel
      {
         if(this._xqTianFuPanel == null)
         {
            this._xqTianFuPanel = new XiangQianTianFuPanel();
            UIEventsRegisterManager.registerUI(this._xqTianFuPanel,XiangQianTianFuPanel);
         }
         return this._xqTianFuPanel;
      }
      
      public function get xunZhangHeChengPanel() : XunZhangHeChengPanel
      {
         if(this._xunZhangHeChengPanel == null)
         {
            this._xunZhangHeChengPanel = new XunZhangHeChengPanel();
            UIEventsRegisterManager.registerUI(this._xunZhangHeChengPanel,XunZhangHeChengPanel);
         }
         return this._xunZhangHeChengPanel;
      }
      
      public function get meiren() : MeiRenPanel
      {
         if(this._meiren == null)
         {
            this._meiren = new MeiRenPanel();
            UIEventsRegisterManager.registerUI(this._meiren,MeiRenPanel);
         }
         return this._meiren;
      }
      
      public function get monthsignin() : MonthSignIn
      {
         if(this._monthsignin == null)
         {
            this._monthsignin = new MonthSignIn();
            UIEventsRegisterManager.registerUI(this._monthsignin,MonthSignIn);
         }
         return this._monthsignin;
      }
      
      public function get jileizhi() : JiLeiZhiPanel
      {
         if(this._jileizhi == null)
         {
            this._jileizhi = new JiLeiZhiPanel();
            UIEventsRegisterManager.registerUI(this._jileizhi,JiLeiZhiPanel);
         }
         return this._jileizhi;
      }
      
      public function get longwenkehua() : LongWenKeHuaPanel
      {
         if(this._longwenkehua == null)
         {
            this._longwenkehua = new LongWenKeHuaPanel();
            UIEventsRegisterManager.registerUI(this._longwenkehua,LongWenKeHuaPanel);
         }
         return this._longwenkehua;
      }
      
      public function get juBaoPenPanel() : JuBaoPenPanel
      {
         if(this._juBaoPenPanel == null)
         {
            this._juBaoPenPanel = new JuBaoPenPanel();
            UIEventsRegisterManager.registerUI(this._juBaoPenPanel,JuBaoPenPanel);
         }
         return this._juBaoPenPanel;
      }
      
      public function get xunZhangDuihuanPanel() : XunzhangDuihuanPanel
      {
         if(this._xunZhangDuihuanPanel == null)
         {
            this._xunZhangDuihuanPanel = new XunzhangDuihuanPanel();
            UIEventsRegisterManager.registerUI(this._xunZhangDuihuanPanel,XunzhangDuihuanPanel);
         }
         return this._xunZhangDuihuanPanel;
      }
      
      public function get xunZhangPanel() : XunzhangShowPanel
      {
         if(this._xunZhangPanel == null)
         {
            this._xunZhangPanel = new XunzhangShowPanel();
            UIEventsRegisterManager.registerUI(this._xunZhangPanel,XunzhangShowPanel);
         }
         return this._xunZhangPanel;
      }
      
      public function get targetXunZhangPanel() : XunzhangShowPanel
      {
         if(this._targetXunZhangPanel == null)
         {
            this._targetXunZhangPanel = new XunzhangShowPanel();
            UIEventsRegisterManager.registerUI(this._targetXunZhangPanel,XunzhangShowPanel);
         }
         return this._targetXunZhangPanel;
      }
      
      public function get leftTopTipsSprite() : LeftTopTipsSprite
      {
         if(this._leftTopTipsSprite == null)
         {
            this._leftTopTipsSprite = new LeftTopTipsSprite();
            UIEventsRegisterManager.registerUI(this._leftTopTipsSprite,LeftTopTipsSprite);
         }
         return this._leftTopTipsSprite;
      }
      
      public function get danTiaoWang() : DanTiaoWangShuomingPanel
      {
         if(this._danTiaoWang == null)
         {
            this._danTiaoWang = new DanTiaoWangShuomingPanel();
            UIEventsRegisterManager.registerUI(this._danTiaoWang,DanTiaoWangShuomingPanel);
         }
         return this._danTiaoWang;
      }
      
      public function get moxueDollPanel() : MoXueBabyPanel
      {
         if(this._moxueDollPanel == null)
         {
            this._moxueDollPanel = new MoXueBabyPanel();
            UIEventsRegisterManager.registerUI(this._moxueDollPanel,MoXueBabyPanel);
         }
         return this._moxueDollPanel;
      }
      
      public function get qiangHuaPanel() : QiangHuaPanel
      {
         if(this._qiangHuaPanel == null)
         {
            this._qiangHuaPanel = new QiangHuaPanel();
            UIEventsRegisterManager.registerUI(this._qiangHuaPanel,QiangHuaPanel);
         }
         return this._qiangHuaPanel;
      }
      
      public function get timeBaozhang() : timeBaozangPanel
      {
         if(this._timeBaozangPanel == null)
         {
            this._timeBaozangPanel = new timeBaozangPanel();
            UIEventsRegisterManager.registerUI(this._timeBaozangPanel,timeBaozangPanel);
         }
         return this._timeBaozangPanel;
      }
      
      public function get biWuZhaoQin() : BiWuZhaoQinPanel
      {
         if(this._biWuZhaoQinPanel == null)
         {
            this._biWuZhaoQinPanel = new BiWuZhaoQinPanel();
            UIEventsRegisterManager.registerUI(this._biWuZhaoQinPanel,BiWuZhaoQinPanel);
         }
         return this._biWuZhaoQinPanel;
      }
      
      public function get shouYuanChouJiangPanel() : ShouYuanChouJiangPanel
      {
         if(this._shouYuanChouJiangPanel == null)
         {
            this._shouYuanChouJiangPanel = new ShouYuanChouJiangPanel();
            UIEventsRegisterManager.registerUI(this._shouYuanChouJiangPanel,ShouYuanChouJiangPanel);
         }
         return this._shouYuanChouJiangPanel;
      }
      
      public function get yueGuangBaoHePanel() : YueGuangBaoHePanel
      {
         if(this._yueGuangBaoHePanel == null)
         {
            this._yueGuangBaoHePanel = new YueGuangBaoHePanel();
            UIEventsRegisterManager.registerUI(this._yueGuangBaoHePanel,YueGuangBaoHePanel);
         }
         return this._yueGuangBaoHePanel;
      }
      
      public function get xueShouTuiBianPanel() : XueShouTuiBianPanel
      {
         if(this._xueShouTuiBianPanel == null)
         {
            this._xueShouTuiBianPanel = new XueShouTuiBianPanel();
            UIEventsRegisterManager.registerUI(this._xueShouTuiBianPanel,XueShouTuiBianPanel);
         }
         return this._xueShouTuiBianPanel;
      }
      
      public function get tianJiangXiangRuiPanel() : TianJiangXiangRuiPanel
      {
         if(this._tianJiangXiangRuiPanel == null)
         {
            this._tianJiangXiangRuiPanel = new TianJiangXiangRuiPanel();
            UIEventsRegisterManager.registerUI(this._tianJiangXiangRuiPanel,TianJiangXiangRuiPanel);
         }
         return this._tianJiangXiangRuiPanel;
      }
      
      public function get yuLingHeChengPanel() : YuLingHeChengPanel
      {
         if(this._yuLingHeChengPanel == null)
         {
            this._yuLingHeChengPanel = new YuLingHeChengPanel();
            UIEventsRegisterManager.registerUI(this._yuLingHeChengPanel,YuLingHeChengPanel);
         }
         return this._yuLingHeChengPanel;
      }
      
      public function get xinMo() : XinMo
      {
         if(this._xinMo == null)
         {
            this._xinMo = new XinMo();
            UIEventsRegisterManager.registerUI(this._xinMo,XinMo);
         }
         return this._xinMo;
      }
      
      public function get xiaoYaoYuFengJiNengSheZhiPanel() : XiaoYaoYuFengSheZhiFPanel
      {
         if(this._xiaoYaoYuFengJiNengSheZhiPanel == null)
         {
            this._xiaoYaoYuFengJiNengSheZhiPanel = new XiaoYaoYuFengSheZhiFPanel();
            UIEventsRegisterManager.registerUI(this._xiaoYaoYuFengJiNengSheZhiPanel,XiaoYaoYuFengSheZhiFPanel);
         }
         return this._xiaoYaoYuFengJiNengSheZhiPanel;
      }
      
      public function get shenQiJinHuaPanel() : ShenQiJinHuaPanel
      {
         if(this._shenQiJinHuaPanel == null)
         {
            this._shenQiJinHuaPanel = new ShenQiJinHuaPanel();
            UIEventsRegisterManager.registerUI(this._shenQiJinHuaPanel,ShenQiJinHuaPanel);
         }
         return this._shenQiJinHuaPanel;
      }
      
      public function get buZhenPanel() : TianMenBuZhenPanel
      {
         if(this._buZhenPanel == null)
         {
            this._buZhenPanel = new TianMenBuZhenPanel();
            UIEventsRegisterManager.registerUI(this._buZhenPanel,TianMenBuZhenPanel);
         }
         return this._buZhenPanel;
      }
      
      public function get tianshangzhihun() : TianShangZhiHunShengJiePanel
      {
         if(this._tianshangzhihun == null)
         {
            this._tianshangzhihun = new TianShangZhiHunShengJiePanel();
            UIEventsRegisterManager.registerUI(this._tianshangzhihun,TianShangZhiHunShengJiePanel);
         }
         return this._tianshangzhihun;
      }
      
      public function get partyChangePanel() : PartyChangePanel
      {
         if(this._partyChangePanel == null)
         {
            this._partyChangePanel = new PartyChangePanel();
            UIEventsRegisterManager.registerUI(this._partyChangePanel,PartyChangePanel);
         }
         return this._partyChangePanel;
      }
      
      public function get partyEquipChangePanel() : EquipPartyChangePanel
      {
         if(this._partyEquipChangePanel == null)
         {
            this._partyEquipChangePanel = new EquipPartyChangePanel();
            UIEventsRegisterManager.registerUI(this._partyEquipChangePanel,EquipPartyChangePanel);
         }
         return this._partyEquipChangePanel;
      }
      
      public function get shendiaoPanel() : ShenDiaoXiaLv
      {
         if(this._shendiaoPanel == null)
         {
            this._shendiaoPanel = new ShenDiaoXiaLv();
            UIEventsRegisterManager.registerUI(this._shendiaoPanel,ShenDiaoXiaLv);
         }
         return this._shendiaoPanel;
      }
      
      public function get ganjiangmoyeZhuZaoPanel() : GanJiangMoYeZhuZaoPanel
      {
         if(this._ganjiangmoyezhuzaoPanel == null)
         {
            this._ganjiangmoyezhuzaoPanel = new GanJiangMoYeZhuZaoPanel();
            UIEventsRegisterManager.registerUI(this._ganjiangmoyezhuzaoPanel,GanJiangMoYeZhuZaoPanel);
         }
         return this._ganjiangmoyezhuzaoPanel;
      }
      
      public function get xinnianzhufu() : XinnianZhufuPanel
      {
         if(this._xinnianzhufu == null)
         {
            this._xinnianzhufu = new XinnianZhufuPanel();
            UIEventsRegisterManager.registerUI(this._xinnianzhufu,XinnianZhufuPanel);
         }
         return this._xinnianzhufu;
      }
      
      public function get rankYNPanel() : RankingYNPanel
      {
         if(this._rankYNPanel == null)
         {
            this._rankYNPanel = new RankingYNPanel();
            UIEventsRegisterManager.registerUI(this._rankYNPanel,RankingYNPanel);
         }
         return this._rankYNPanel;
      }
      
      public function get fashionPanel() : FashionPanel
      {
         if(this._fashionPanel == null)
         {
            this._fashionPanel = new FashionPanel();
            UIEventsRegisterManager.registerUI(this._fashionPanel,FashionPanel);
         }
         return this._fashionPanel;
      }
      
      public function get fengzhengjiexunzhang() : FengzhengjieXunzhangDuihuanPanel
      {
         if(this._fengzhengjiexunzhang == null)
         {
            this._fengzhengjiexunzhang = new FengzhengjieXunzhangDuihuanPanel();
            UIEventsRegisterManager.registerUI(this._fengzhengjiexunzhang,FengzhengjieXunzhangDuihuanPanel);
         }
         return this._fengzhengjiexunzhang;
      }
      
      public function get ynjubaopenPanel() : YNjubaopenPanel
      {
         if(this._ynjubaopenPanel == null)
         {
            this._ynjubaopenPanel = new YNjubaopenPanel();
            UIEventsRegisterManager.registerUI(this._ynjubaopenPanel,YNjubaopenPanel);
         }
         return this._ynjubaopenPanel;
      }
      
      public function get renamePanel() : YNRenamePanel
      {
         if(this._renamePanel == null)
         {
            this._renamePanel = new YNRenamePanel();
            UIEventsRegisterManager.registerUI(this._renamePanel,YNRenamePanel);
         }
         return this._renamePanel;
      }
      
      public function get ynshijiebeiPanel() : YNShijiebeiRankPanel
      {
         if(this._ynshijiebeiPanel == null)
         {
            this._ynshijiebeiPanel = new YNShijiebeiRankPanel();
            UIEventsRegisterManager.registerUI(this._ynshijiebeiPanel,YNShijiebeiRankPanel);
         }
         return this._ynshijiebeiPanel;
      }
      
      public function get yncommitfootballPanel() : CommitFootball
      {
         if(this._yncommitfootballPanel == null)
         {
            this._yncommitfootballPanel = new CommitFootball();
            UIEventsRegisterManager.registerUI(this._yncommitfootballPanel,CommitFootball);
         }
         return this._yncommitfootballPanel;
      }
      
      public function get ynshijiebeijiangliPanel() : ShijiebeiJiangliPanel
      {
         if(this._ynshijiebeijiangliPanel == null)
         {
            this._ynshijiebeijiangliPanel = new ShijiebeiJiangliPanel();
            UIEventsRegisterManager.registerUI(this._ynshijiebeijiangliPanel,ShijiebeiJiangliPanel);
         }
         return this._ynshijiebeijiangliPanel;
      }
      
      public function get yn888shopPanel() : yn888ShopPanel
      {
         if(this._yn888shopPanel == null)
         {
            this._yn888shopPanel = new yn888ShopPanel();
            UIEventsRegisterManager.registerUI(this._yn888shopPanel,yn888ShopPanel);
         }
         return this._yn888shopPanel;
      }
      
      public function get ynaojianhechengPanel() : YNAojiansuipianhechengPanel
      {
         if(this._ynaojianhechengPanel == null)
         {
            this._ynaojianhechengPanel = new YNAojiansuipianhechengPanel();
            UIEventsRegisterManager.registerUI(this._ynaojianhechengPanel,YNAojiansuipianhechengPanel);
         }
         return this._ynaojianhechengPanel;
      }
      
      public function get ynaojianzhizaoPanel1() : YNAojianzhizaoPanel1
      {
         if(this._ynaojianzhizaoPanel1 == null)
         {
            this._ynaojianzhizaoPanel1 = new YNAojianzhizaoPanel1();
            UIEventsRegisterManager.registerUI(this._ynaojianzhizaoPanel1,YNAojianzhizaoPanel1);
         }
         return this._ynaojianzhizaoPanel1;
      }
      
      public function get ynaojianzhizaoPanel2() : YNAojianzhizaoPanel2
      {
         if(this._ynaojianzhizaoPanel2 == null)
         {
            this._ynaojianzhizaoPanel2 = new YNAojianzhizaoPanel2();
            UIEventsRegisterManager.registerUI(this._ynaojianzhizaoPanel2,YNAojianzhizaoPanel2);
         }
         return this._ynaojianzhizaoPanel2;
      }
      
      public function get ynonlinePanel() : YNOnLinePanel
      {
         if(this._ynonlinePanel == null)
         {
            this._ynonlinePanel = new YNOnLinePanel();
            UIEventsRegisterManager.registerUI(this._ynonlinePanel,YNOnLinePanel);
         }
         return this._ynonlinePanel;
      }
      
      public function get zhizhanzhishang() : ZhiZhanZhiShangPanel
      {
         if(this._zhizhanzhishang == null)
         {
            this._zhizhanzhishang = new ZhiZhanZhiShangPanel();
            UIEventsRegisterManager.registerUI(this._zhizhanzhishang,ZhiZhanZhiShangPanel);
         }
         return this._zhizhanzhishang;
      }
      
      public function get zhiZhanZhiShangLingJiangPanel() : ZhiZhanZhiShangLingJiangPanel
      {
         if(this._zhiZhanZhiShangLingJiangPanel == null)
         {
            this._zhiZhanZhiShangLingJiangPanel = new ZhiZhanZhiShangLingJiangPanel();
            UIEventsRegisterManager.registerUI(this._zhiZhanZhiShangLingJiangPanel,ZhiZhanZhiShangLingJiangPanel);
         }
         return this._zhiZhanZhiShangLingJiangPanel;
      }
      
      public function get zhiZhanZhiShang_Tips() : ZhiZhanZhiShang_Tips
      {
         if(this._zhiZhanZhiShang_Tips == null)
         {
            this._zhiZhanZhiShang_Tips = new ZhiZhanZhiShang_Tips();
            UIEventsRegisterManager.registerUI(this._zhiZhanZhiShang_Tips,ZhiZhanZhiShang_Tips);
         }
         return this._zhiZhanZhiShang_Tips;
      }
      
      public function get ynrichangPanel() : YNRichangPanel
      {
         if(this._ynrichangPanel == null)
         {
            this._ynrichangPanel = new YNRichangPanel();
            UIEventsRegisterManager.registerUI(this._ynrichangPanel,YNRichangPanel);
         }
         return this._ynrichangPanel;
      }
      
      public function get ynGoodDeletePanel() : YNGoodDeletePanel
      {
         if(this._ynGoodDeletePanel == null)
         {
            this._ynGoodDeletePanel = new YNGoodDeletePanel();
            UIEventsRegisterManager.registerUI(this._ynGoodDeletePanel,YNGoodDeletePanel);
         }
         return this._ynGoodDeletePanel;
      }
      
      public function get yn2014zhongqiuPanel() : YNZhongqiuLingjiangPanel
      {
         if(this._yn2014zhongqiuPanel == null)
         {
            this._yn2014zhongqiuPanel = new YNZhongqiuLingjiangPanel();
            UIEventsRegisterManager.registerUI(this._yn2014zhongqiuPanel,YNZhongqiuLingjiangPanel);
         }
         return this._yn2014zhongqiuPanel;
      }
      
      public function get shenbingJuexingXiangqianPanel() : ShenbingJuexingXiangqianPanel
      {
         if(this._shenbingJuexingXiangqianPanel == null)
         {
            this._shenbingJuexingXiangqianPanel = new ShenbingJuexingXiangqianPanel();
            UIEventsRegisterManager.registerUI(this._shenbingJuexingXiangqianPanel,ShenbingJuexingXiangqianPanel);
         }
         return this._shenbingJuexingXiangqianPanel;
      }
      
      public function get zunrongWanbaogePanel() : ZunRongWanBaoGePanel
      {
         if(this._zunrongWanbaogePanel == null)
         {
            this._zunrongWanbaogePanel = new ZunRongWanBaoGePanel();
            UIEventsRegisterManager.registerUI(this._zunrongWanbaogePanel,ZunRongWanBaoGePanel);
         }
         return this._zunrongWanbaogePanel;
      }
      
      public function get zunrongWanbaogeHuiguiPanel() : WanbaogeRongyaoHuiguiPanel
      {
         if(this._zunrongWanbaogeHuiguiPanel == null)
         {
            this._zunrongWanbaogeHuiguiPanel = new WanbaogeRongyaoHuiguiPanel();
            UIEventsRegisterManager.registerUI(this._zunrongWanbaogeHuiguiPanel,WanbaogeRongyaoHuiguiPanel);
         }
         return this._zunrongWanbaogeHuiguiPanel;
      }
      
      public function get newyearPanel() : NewYearPanel
      {
         if(this._newyearPanel == null)
         {
            this._newyearPanel = new NewYearPanel();
            UIEventsRegisterManager.registerUI(this._newyearPanel,NewYearPanel);
         }
         return this._newyearPanel;
      }
      
      public function get yurenjiePanel() : YuRenJiePanel
      {
         if(this._yurenjiePanel == null)
         {
            this._yurenjiePanel = new YuRenJiePanel();
            UIEventsRegisterManager.registerUI(this._yurenjiePanel,YuRenJiePanel);
         }
         return this._yurenjiePanel;
      }
      
      public function get yurenjierankPanel() : YuRenJieRankPanel
      {
         if(this._yurenjierankPanel == null)
         {
            this._yurenjierankPanel = new YuRenJieRankPanel();
            UIEventsRegisterManager.registerUI(this._yurenjierankPanel,YuRenJieRankPanel);
         }
         return this._yurenjierankPanel;
      }
      
      public function get fengzhengjiePanel() : FengZhengJiePanel
      {
         if(this._fengzhengjiePanel == null)
         {
            this._fengzhengjiePanel = new FengZhengJiePanel();
            UIEventsRegisterManager.registerUI(this._fengzhengjiePanel,FengZhengJiePanel);
         }
         return this._fengzhengjiePanel;
      }
      
      public function get fengzhengjierankPanel() : FengZhengJieRankPanel
      {
         if(this._fengzhengjierankPanel == null)
         {
            this._fengzhengjierankPanel = new FengZhengJieRankPanel();
            UIEventsRegisterManager.registerUI(this._fengzhengjierankPanel,FengZhengJieRankPanel);
         }
         return this._fengzhengjierankPanel;
      }
      
      public function get qingrenjieChaXunWanJiaPanel() : QingRenJie_ChaXunWanJiaPanel
      {
         if(this._qingrenjieChaXunWanJiaPanel == null)
         {
            this._qingrenjieChaXunWanJiaPanel = new QingRenJie_ChaXunWanJiaPanel();
            UIEventsRegisterManager.registerUI(this._qingrenjieChaXunWanJiaPanel,QingRenJie_ChaXunWanJiaPanel);
         }
         return this._qingrenjieChaXunWanJiaPanel;
      }
      
      public function get qingrenjieSongHuaBangPanel() : QingRenJie_SongHuaBangPanel
      {
         if(this._qingrenjieSongHuaBangPanel == null)
         {
            this._qingrenjieSongHuaBangPanel = new QingRenJie_SongHuaBangPanel();
            UIEventsRegisterManager.registerUI(this._qingrenjieSongHuaBangPanel,QingRenJie_SongHuaBangPanel);
         }
         return this._qingrenjieSongHuaBangPanel;
      }
      
      public function get woHuCangLongPanel() : WoHuCangLong
      {
         if(this._woHuCangLongPanel == null)
         {
            this._woHuCangLongPanel = new WoHuCangLong();
            UIEventsRegisterManager.registerUI(this._woHuCangLongPanel,WoHuCangLong);
         }
         return this._woHuCangLongPanel;
      }
      
      public function get woHuCangLongResultPanel() : WoHuCangLongResultPanel
      {
         if(this._woHuCangLongResultPanel == null)
         {
            this._woHuCangLongResultPanel = new WoHuCangLongResultPanel();
            UIEventsRegisterManager.registerUI(this._woHuCangLongResultPanel,WoHuCangLongResultPanel);
         }
         return this._woHuCangLongResultPanel;
      }
      
      public function get wishingTreePanel() : WishingTree
      {
         if(this._wishingTreePanel == null)
         {
            this._wishingTreePanel = new WishingTree();
            UIEventsRegisterManager.registerUI(this._wishingTreePanel,WishingTree);
         }
         return this._wishingTreePanel;
      }
      
      public function get gerenchenghaoPanel() : GeRenChengHao
      {
         if(this._gerenchenghaoPanel == null)
         {
            this._gerenchenghaoPanel = new GeRenChengHao();
            UIEventsRegisterManager.registerUI(this._gerenchenghaoPanel,GeRenChengHao);
         }
         return this._gerenchenghaoPanel;
      }
      
      public function get chuangongwuxuePanel() : ChuanGongWuXuePanel
      {
         if(this._chuangongwuxuePanel == null)
         {
            this._chuangongwuxuePanel = new ChuanGongWuXuePanel();
            UIEventsRegisterManager.registerUI(this._chuangongwuxuePanel,ChuanGongWuXuePanel);
         }
         return this._chuangongwuxuePanel;
      }
      
      public function get huangTuBaYePanel() : HuangTuBaYePanel
      {
         if(this._huangTuBaYePanel == null)
         {
            this._huangTuBaYePanel = new HuangTuBaYePanel();
            UIEventsRegisterManager.registerUI(this._huangTuBaYePanel,HuangTuBaYePanel);
         }
         return this._huangTuBaYePanel;
      }
      
      public function get huangTuBaYeChaKanXinXiPanel() : HuangTuBaYeChaKanXinXiPanel
      {
         if(this._huangTuBaYeChaKanXinXiPanel == null)
         {
            this._huangTuBaYeChaKanXinXiPanel = new HuangTuBaYeChaKanXinXiPanel();
            UIEventsRegisterManager.registerUI(this._huangTuBaYeChaKanXinXiPanel,HuangTuBaYeChaKanXinXiPanel);
         }
         return this._huangTuBaYeChaKanXinXiPanel;
      }
      
      public function get rongYuTargetPanel() : BangPaiRongYuTargetPanel
      {
         if(this._rongYuTargetPanel == null)
         {
            this._rongYuTargetPanel = new BangPaiRongYuTargetPanel();
            UIEventsRegisterManager.registerUI(this._rongYuTargetPanel,BangPaiRongYuTargetPanel);
         }
         return this._rongYuTargetPanel;
      }
      
      public function get doudizhuPanel() : DouDiZhuPanel
      {
         if(this._doudizhuPanel == null)
         {
            this._doudizhuPanel = new DouDiZhuPanel();
            UIEventsRegisterManager.registerUI(this._doudizhuPanel,DouDiZhuPanel);
         }
         return this._doudizhuPanel;
      }
      
      public function get doudizhurankPanel() : DouDiZhuRankPanel
      {
         if(this._doudizhurankPanel == null)
         {
            this._doudizhurankPanel = new DouDiZhuRankPanel();
            UIEventsRegisterManager.registerUI(this._doudizhurankPanel,DouDiZhuRankPanel);
         }
         return this._doudizhurankPanel;
      }
      
      public function get fabaoPanel() : FabaoPanel
      {
         if(this._fabaoPanel == null)
         {
            this._fabaoPanel = new FabaoPanel();
            UIEventsRegisterManager.registerUI(this._fabaoPanel,FabaoPanel);
         }
         return this._fabaoPanel;
      }
      
      public function get fabaolingli() : Fabao_LingliPanel
      {
         if(this._fabaolingli == null)
         {
            this._fabaolingli = new Fabao_LingliPanel();
            UIEventsRegisterManager.registerUI(this._fabaolingli,Fabao_LingliPanel);
         }
         return this._fabaolingli;
      }
      
      public function get fabaotupo() : FabaoTupoPanel
      {
         if(this._fabaotupo == null)
         {
            this._fabaotupo = new FabaoTupoPanel();
            UIEventsRegisterManager.registerUI(this._fabaotupo,FabaoTupoPanel);
         }
         return this._fabaotupo;
      }
      
      public function get fabaoGuanzhuDesc() : FabaoGuanzhuDesc
      {
         if(this._fabaoGuanzhuDesc == null)
         {
            this._fabaoGuanzhuDesc = new FabaoGuanzhuDesc();
            UIEventsRegisterManager.registerUI(this._fabaoGuanzhuDesc,FabaoGuanzhuDesc);
         }
         return this._fabaoGuanzhuDesc;
      }
      
      public function get fabaolinglifull() : Fabao_lingliFullPanel
      {
         if(this._fabaolinglifull == null)
         {
            this._fabaolinglifull = new Fabao_lingliFullPanel();
            UIEventsRegisterManager.registerUI(this._fabaolinglifull,Fabao_lingliFullPanel);
         }
         return this._fabaolinglifull;
      }
      
      public function get duanwujiePanel() : DuanWuJiePanel
      {
         if(this._duanwujiePanel == null)
         {
            this._duanwujiePanel = new DuanWuJiePanel();
            UIEventsRegisterManager.registerUI(this._duanwujiePanel,DuanWuJiePanel);
         }
         return this._duanwujiePanel;
      }
      
      public function get chaojilabaPanel() : ChaoJiLaBaPanel
      {
         if(this._chaojilabaPanel == null)
         {
            this._chaojilabaPanel = new ChaoJiLaBaPanel();
            UIEventsRegisterManager.registerUI(this._chaojilabaPanel,ChaoJiLaBaPanel);
         }
         return this._chaojilabaPanel;
      }
      
      public function get zhongzhixuanyuanjianPanel() : ZhongZhiXuanYuanJianPanel
      {
         if(this._zhongzhixuanyuanjianPanel == null)
         {
            this._zhongzhixuanyuanjianPanel = new ZhongZhiXuanYuanJianPanel();
            UIEventsRegisterManager.registerUI(this._zhongzhixuanyuanjianPanel,ZhongZhiXuanYuanJianPanel);
         }
         return this._zhongzhixuanyuanjianPanel;
      }
      
      public function get shiJieBeiPanel() : ShiJieBeiPanel
      {
         if(this._shiJieBeiPanel == null)
         {
            this._shiJieBeiPanel = new ShiJieBeiPanel();
            UIEventsRegisterManager.registerUI(this._shiJieBeiPanel,ShiJieBeiPanel);
         }
         return this._shiJieBeiPanel;
      }
      
      public function get shengxiaotiaozhanPanel() : ShengXiaoTiaoZhanPanel
      {
         if(this._shengxiaotiaozhanPanel == null)
         {
            this._shengxiaotiaozhanPanel = new ShengXiaoTiaoZhanPanel();
            UIEventsRegisterManager.registerUI(this._shengxiaotiaozhanPanel,ShengXiaoTiaoZhanPanel);
         }
         return this._shengxiaotiaozhanPanel;
      }
      
      public function get shengxiaoRightSpr() : ShengxiaotiaozhanRightSprite
      {
         if(this._shengxiaoRightSpr == null)
         {
            this._shengxiaoRightSpr = new ShengxiaotiaozhanRightSprite();
            UIEventsRegisterManager.registerUI(this._shengxiaoRightSpr,ShengxiaotiaozhanRightSprite);
         }
         return this._shengxiaoRightSpr;
      }
      
      public function get shengxiaoTipPanel() : ShengxiaotiaozhanTipPanel
      {
         if(this._shengxiaoTipPanel == null)
         {
            this._shengxiaoTipPanel = new ShengxiaotiaozhanTipPanel();
            UIEventsRegisterManager.registerUI(this._shengxiaoTipPanel,ShengxiaotiaozhanTipPanel);
         }
         return this._shengxiaoTipPanel;
      }
      
      public function get shengxiaoSuccessPanel() : ShengxiaotiaozhanSuccess
      {
         if(this._shengxiaoSuccessPanel == null)
         {
            this._shengxiaoSuccessPanel = new ShengxiaotiaozhanSuccess();
            UIEventsRegisterManager.registerUI(this._shengxiaoSuccessPanel,ShengxiaotiaozhanSuccess);
         }
         return this._shengxiaoSuccessPanel;
      }
      
      public function get shengxiaoFailPanel() : ShengxiaotiaozhanFail
      {
         if(this._shengxiaoFailPanel == null)
         {
            this._shengxiaoFailPanel = new ShengxiaotiaozhanFail();
            UIEventsRegisterManager.registerUI(this._shengxiaoFailPanel,ShengxiaotiaozhanFail);
         }
         return this._shengxiaoFailPanel;
      }
      
      public function get shengxiaoRelivePanel() : ShengxiaotiaozhanRelive
      {
         if(this._shengxiaoFailPanel == null)
         {
            this._shengxiaoRelivePanel = new ShengxiaotiaozhanRelive();
            UIEventsRegisterManager.registerUI(this._shengxiaoRelivePanel,ShengxiaotiaozhanRelive);
         }
         return this._shengxiaoRelivePanel;
      }
      
      public function get fengLeiShouPanel() : FengLeiShouPanel
      {
         if(this._fengLeiShouPanel == null)
         {
            this._fengLeiShouPanel = new FengLeiShouPanel();
            UIEventsRegisterManager.registerUI(this._fengLeiShouPanel,FengLeiShouPanel);
         }
         return this._fengLeiShouPanel;
      }
      
      public function get dianFengShouPanel() : DianFengShouPanel
      {
         if(this._dianFengShouPanel == null)
         {
            this._dianFengShouPanel = new DianFengShouPanel();
            UIEventsRegisterManager.registerUI(this._dianFengShouPanel,DianFengShouPanel);
         }
         return this._dianFengShouPanel;
      }
      
      public function get wuxiakapaiPanel() : WuxiakapaiPanel
      {
         if(this._wuxiakapaiPanel == null)
         {
            this._wuxiakapaiPanel = new WuxiakapaiPanel();
            UIEventsRegisterManager.registerUI(this._wuxiakapaiPanel,WuxiakapaiPanel);
         }
         return this._wuxiakapaiPanel;
      }
      
      public function get wuxiakapaixxPanel() : WuxiakapaiXiangxiPanel
      {
         if(this._wuxiakapaixxPanel == null)
         {
            this._wuxiakapaixxPanel = new WuxiakapaiXiangxiPanel();
            UIEventsRegisterManager.registerUI(this._wuxiakapaixxPanel,WuxiakapaiXiangxiPanel);
         }
         return this._wuxiakapaixxPanel;
      }
      
      public function get qixiPanel() : QiXiPanel
      {
         if(this._qixiPanel == null)
         {
            this._qixiPanel = new QiXiPanel();
            UIEventsRegisterManager.registerUI(this._qixiPanel,QiXiPanel);
         }
         return this._qixiPanel;
      }
      
      public function get tunShiTianDi() : TunShiTianDi
      {
         if(this._tunShiTianDi == null)
         {
            this._tunShiTianDi = new TunShiTianDi();
            UIEventsRegisterManager.registerUI(this._tunShiTianDi,TunShiTianDi);
         }
         return this._tunShiTianDi;
      }
      
      public function get tunShiTianDiXuanZhenRong() : TunShiTianDi_ZhenRongPanel
      {
         if(this._tunShiTianDiXuanZhenRong == null)
         {
            this._tunShiTianDiXuanZhenRong = new TunShiTianDi_ZhenRongPanel();
            UIEventsRegisterManager.registerUI(this._tunShiTianDiXuanZhenRong,TunShiTianDi_ZhenRongPanel);
         }
         return this._tunShiTianDiXuanZhenRong;
      }
      
      public function get tunShiTianDiVSResultPanel() : TunshiTianDiVSPanel
      {
         if(this._tunShiTianDiVSResultPanel == null)
         {
            this._tunShiTianDiVSResultPanel = new TunshiTianDiVSPanel();
            UIEventsRegisterManager.registerUI(this._tunShiTianDiVSResultPanel,TunshiTianDiVSPanel);
         }
         return this._tunShiTianDiVSResultPanel;
      }
      
      public function get tunShiTianDiResultPanel() : TunShiTianDi_JieGuo
      {
         if(this._tunShiTianDiResultPanel == null)
         {
            this._tunShiTianDiResultPanel = new TunShiTianDi_JieGuo();
            UIEventsRegisterManager.registerUI(this._tunShiTianDiResultPanel,TunShiTianDi_JieGuo);
         }
         return this._tunShiTianDiResultPanel;
      }
      
      public function get buchangfubenPanel() : BuchangFubenPanel
      {
         if(this._buchangfubenPanel == null)
         {
            this._buchangfubenPanel = new BuchangFubenPanel();
            UIEventsRegisterManager.registerUI(this._buchangfubenPanel,BuchangFubenPanel);
         }
         return this._buchangfubenPanel;
      }
      
      public function get huangjinshuPanel() : HuangJinShuPanel
      {
         if(this._huangjinshuPanel == null)
         {
            this._huangjinshuPanel = new HuangJinShuPanel();
            UIEventsRegisterManager.registerUI(this._huangjinshuPanel,HuangJinShuPanel);
         }
         return this._huangjinshuPanel;
      }
      
      public function get zhongQiuJiePanel() : ZhongQiuJiePanel
      {
         if(this._zhongQiuJiePanel == null)
         {
            this._zhongQiuJiePanel = new ZhongQiuJiePanel();
            UIEventsRegisterManager.registerUI(this._zhongQiuJiePanel,ZhongQiuJiePanel);
         }
         return this._zhongQiuJiePanel;
      }
      
      public function get zhongQiuJieDaskPanel() : ZhongQiuJieDaskPanel
      {
         if(this._zhongQiuJieDaskPanel == null)
         {
            this._zhongQiuJieDaskPanel = new ZhongQiuJieDaskPanel();
            UIEventsRegisterManager.registerUI(this._zhongQiuJieDaskPanel,ZhongQiuJieDaskPanel);
         }
         return this._zhongQiuJieDaskPanel;
      }
      
      public function get ynlongzhizhufuPanel() : YNLongzhizhufuPanel
      {
         if(this._ynlongzhizhufuPanel == null)
         {
            this._ynlongzhizhufuPanel = new YNLongzhizhufuPanel();
            UIEventsRegisterManager.registerUI(this._ynlongzhizhufuPanel,YNLongzhizhufuPanel);
         }
         return this._ynlongzhizhufuPanel;
      }
      
      public function get ynzhizuozongziPanel() : YNzhizuozongziPanel
      {
         if(this._ynzhizuozongziPanel == null)
         {
            this._ynzhizuozongziPanel = new YNzhizuozongziPanel();
            UIEventsRegisterManager.registerUI(this._ynzhizuozongziPanel,YNzhizuozongziPanel);
         }
         return this._ynzhizuozongziPanel;
      }
      
      public function get ynqingrenjiePanel() : YNqingrenjiePanel
      {
         if(this._ynqingrenjiePanel == null)
         {
            this._ynqingrenjiePanel = new YNqingrenjiePanel();
            UIEventsRegisterManager.registerUI(this._ynqingrenjiePanel,YNqingrenjiePanel);
         }
         return this._ynqingrenjiePanel;
      }
      
      public function get ynXiangyangRankPanel() : YNXiangyangzhanchangRankPanel
      {
         if(this._ynXiangyangRankPanel == null)
         {
            this._ynXiangyangRankPanel = new YNXiangyangzhanchangRankPanel();
            UIEventsRegisterManager.registerUI(this._ynXiangyangRankPanel,YNXiangyangzhanchangRankPanel);
         }
         return this._ynXiangyangRankPanel;
      }
      
      public function get wangzhezhibangPanel() : WangzhezhibangPanel
      {
         if(this._wangzhezhibangPanel == null)
         {
            this._wangzhezhibangPanel = new WangzhezhibangPanel();
            UIEventsRegisterManager.registerUI(this._wangzhezhibangPanel,WangzhezhibangPanel);
         }
         return this._wangzhezhibangPanel;
      }
      
      public function get wangzhezhibangLingjiangPanel() : WangzhezhibangLingjiangPanel
      {
         if(this._wangzhezhibangLingjiangPanel == null)
         {
            this._wangzhezhibangLingjiangPanel = new WangzhezhibangLingjiangPanel();
            UIEventsRegisterManager.registerUI(this._wangzhezhibangLingjiangPanel,WangzhezhibangLingjiangPanel);
         }
         return this._wangzhezhibangLingjiangPanel;
      }
      
      public function get yuanXiaoJiePanel() : YuanXiaoJiePanel
      {
         if(this._yuanXiaoJiePanel == null)
         {
            this._yuanXiaoJiePanel = new YuanXiaoJiePanel();
            UIEventsRegisterManager.registerUI(this._yuanXiaoJiePanel,YuanXiaoJiePanel);
         }
         return this._yuanXiaoJiePanel;
      }
      
      public function get caiDengMiPanel() : CaiDengMiPanel
      {
         if(this._caiDengMiPanel == null)
         {
            this._caiDengMiPanel = new CaiDengMiPanel();
            UIEventsRegisterManager.registerUI(this._caiDengMiPanel,CaiDengMiPanel);
         }
         return this._caiDengMiPanel;
      }
      
      public function get ynJinxiangPanel() : YNjinxiangPanel
      {
         if(this._ynJinxiangPanel == null)
         {
            this._ynJinxiangPanel = new YNjinxiangPanel();
            UIEventsRegisterManager.registerUI(this._ynJinxiangPanel,YNjinxiangPanel);
         }
         return this._ynJinxiangPanel;
      }
      
      public function get ynlianhuanchongzhiPanel() : YNlianhuanchongzhiPanel
      {
         if(this._ynlianhuanchongzhiPanel == null)
         {
            this._ynlianhuanchongzhiPanel = new YNlianhuanchongzhiPanel();
            UIEventsRegisterManager.registerUI(this._ynlianhuanchongzhiPanel,YNlianhuanchongzhiPanel);
         }
         return this._ynlianhuanchongzhiPanel;
      }
      
      public function get xiaozhukuaipaoPanel() : XiaoZhuKuaiPaoPanel
      {
         if(this._xiaozhukuaipaoPanel == null)
         {
            this._xiaozhukuaipaoPanel = new XiaoZhuKuaiPaoPanel();
            UIEventsRegisterManager.registerUI(this._xiaozhukuaipaoPanel,XiaoZhuKuaiPaoPanel);
         }
         return this._xiaozhukuaipaoPanel;
      }
      
      public function get ynCommitPanel() : YNCommitGoodPanel
      {
         if(this._ynCommitPanel == null)
         {
            this._ynCommitPanel = new YNCommitGoodPanel();
            UIEventsRegisterManager.registerUI(this._ynCommitPanel,YNCommitGoodPanel);
         }
         return this._ynCommitPanel;
      }
      
      public function get ynQifuPanel() : YNshangxiangqifuPanel
      {
         if(this._ynQifuPanel == null)
         {
            this._ynQifuPanel = new YNshangxiangqifuPanel();
            UIEventsRegisterManager.registerUI(this._ynQifuPanel,YNshangxiangqifuPanel);
         }
         return this._ynQifuPanel;
      }
      
      public function get zhongQiuJieRankPanel() : ZhongQiuJieRankPanel
      {
         if(this._zhongQiuJieRankPanel == null)
         {
            this._zhongQiuJieRankPanel = new ZhongQiuJieRankPanel();
            UIEventsRegisterManager.registerUI(this._zhongQiuJieRankPanel,ZhongQiuJieRankPanel);
         }
         return this._zhongQiuJieRankPanel;
      }
      
      public function get ynshoucichongzhiPanel() : YNchongzhi
      {
         if(this._ynshoucichongzhiPanel == null)
         {
            this._ynshoucichongzhiPanel = new YNchongzhi();
            UIEventsRegisterManager.registerUI(this._ynshoucichongzhiPanel,YNchongzhi);
         }
         return this._ynshoucichongzhiPanel;
      }
      
      public function get ynjinqianshuPanel() : YNjinqianshuPanel
      {
         if(this._ynjinqianshuPanel == null)
         {
            this._ynjinqianshuPanel = new YNjinqianshuPanel();
            UIEventsRegisterManager.registerUI(this._ynjinqianshuPanel,YNjinqianshuPanel);
         }
         return this._ynjinqianshuPanel;
      }
      
      public function get ynkaixuepaihangbangPanel() : YN2016PaihangbangPanel
      {
         if(this._ynkaixuepaihangbangPanel == null)
         {
            this._ynkaixuepaihangbangPanel = new YN2016PaihangbangPanel();
            UIEventsRegisterManager.registerUI(this._ynkaixuepaihangbangPanel,YN2016PaihangbangPanel);
         }
         return this._ynkaixuepaihangbangPanel;
      }
      
      public function get yntijiaowupinPanel() : TijiaowupinPanel
      {
         if(this._yntijiaowupinPanel == null)
         {
            this._yntijiaowupinPanel = new TijiaowupinPanel();
            UIEventsRegisterManager.registerUI(this._yntijiaowupinPanel,TijiaowupinPanel);
         }
         return this._yntijiaowupinPanel;
      }
      
      public function get ynyingxiongshijianPanel() : YN2016YingxiongshijianPanel
      {
         if(this._ynyingxiongshijianPanel == null)
         {
            this._ynyingxiongshijianPanel = new YN2016YingxiongshijianPanel();
            UIEventsRegisterManager.registerUI(this._ynyingxiongshijianPanel,YN2016YingxiongshijianPanel);
         }
         return this._ynyingxiongshijianPanel;
      }
      
      public function get ynLongwugePanel() : YNlongwugePanel
      {
         if(this._ynLongwugePanel == null)
         {
            this._ynLongwugePanel = new YNlongwugePanel();
            UIEventsRegisterManager.registerUI(this._ynLongwugePanel,YNlongwugePanel);
         }
         return this._ynLongwugePanel;
      }
      
      public function get yn2015zhongqiuPanel() : YN2015zhongqiu
      {
         if(this._yn2015zhongqiuPanel == null)
         {
            this._yn2015zhongqiuPanel = new YN2015zhongqiu();
            UIEventsRegisterManager.registerUI(this._yn2015zhongqiuPanel,YN2015zhongqiu);
         }
         return this._yn2015zhongqiuPanel;
      }
      
      public function get ynLWGAddFarmerPanel() : YNlongwuge_AddFarmerPanel
      {
         if(this._ynLWGAddFarmerPanel == null)
         {
            this._ynLWGAddFarmerPanel = new YNlongwuge_AddFarmerPanel();
            UIEventsRegisterManager.registerUI(this._ynLWGAddFarmerPanel,YNlongwuge_AddFarmerPanel);
         }
         return this._ynLWGAddFarmerPanel;
      }
      
      public function get ynChristmasPanel() : YN2015ChristmasPanel
      {
         if(this._ynChristmasPanel == null)
         {
            this._ynChristmasPanel = new YN2015ChristmasPanel();
            UIEventsRegisterManager.registerUI(this._ynChristmasPanel,YN2015ChristmasPanel);
         }
         return this._ynChristmasPanel;
      }
      
      public function get duixuerenPanel() : DuiXueRenPanel
      {
         if(this._duixuerenPanel == null)
         {
            this._duixuerenPanel = new DuiXueRenPanel();
            UIEventsRegisterManager.registerUI(this._duixuerenPanel,DuiXueRenPanel);
         }
         return this._duixuerenPanel;
      }
      
      public function get ynHesuiPanel() : YNhesuishuPanel
      {
         if(this._ynHesuiPanel == null)
         {
            this._ynHesuiPanel = new YNhesuishuPanel();
            UIEventsRegisterManager.registerUI(this._ynHesuiPanel,YNhesuishuPanel);
         }
         return this._ynHesuiPanel;
      }
      
      public function get ynQianghuazhishenPanel() : YNqianghuazhishenPanel
      {
         if(this._ynQianghuazhishenPanel == null)
         {
            this._ynQianghuazhishenPanel = new YNqianghuazhishenPanel();
            UIEventsRegisterManager.registerUI(this._ynQianghuazhishenPanel,YNqianghuazhishenPanel);
         }
         return this._ynQianghuazhishenPanel;
      }
      
      public function get ynFangshengliyuPanel() : YNfangshengliyuPanel
      {
         if(this._ynFangshengliyuPanel == null)
         {
            this._ynFangshengliyuPanel = new YNfangshengliyuPanel();
            UIEventsRegisterManager.registerUI(this._ynFangshengliyuPanel,YNfangshengliyuPanel);
         }
         return this._ynFangshengliyuPanel;
      }
      
      public function get yn2016CGPanel() : YN2016cailushuPanel
      {
         if(this._yn2016CGPanel == null)
         {
            this._yn2016CGPanel = new YN2016cailushuPanel();
            UIEventsRegisterManager.registerUI(this._yn2016CGPanel,YN2016cailushuPanel);
         }
         return this._yn2016CGPanel;
      }
      
      public function get yn2016DLPanel() : YN2016duilianPanel
      {
         if(this._yn2016DLPanel == null)
         {
            this._yn2016DLPanel = new YN2016duilianPanel();
            UIEventsRegisterManager.registerUI(this._yn2016DLPanel,YN2016duilianPanel);
         }
         return this._yn2016DLPanel;
      }
      
      public function get yn2016onlinePanel() : YN2016onlinePanle
      {
         if(this._yn2016onlinePanel == null)
         {
            this._yn2016onlinePanel = new YN2016onlinePanle();
            UIEventsRegisterManager.registerUI(this._yn2016onlinePanel,YN2016onlinePanle);
         }
         return this._yn2016onlinePanel;
      }
      
      public function get yn2016newyearPanel() : YN2016newyearPanel
      {
         if(this._yn2016newyearPanel == null)
         {
            this._yn2016newyearPanel = new YN2016newyearPanel();
            UIEventsRegisterManager.registerUI(this._yn2016newyearPanel,YN2016newyearPanel);
         }
         return this._yn2016newyearPanel;
      }
      
      public function get ynShierdizhiPanel() : YNshiertianzhiPanel
      {
         if(this._ynShierdizhiPanel == null)
         {
            this._ynShierdizhiPanel = new YNshiertianzhiPanel();
            UIEventsRegisterManager.registerUI(this._ynShierdizhiPanel,YNshiertianzhiPanel);
         }
         return this._ynShierdizhiPanel;
      }
      
      public function get ynShanxiaqijianPanel() : YNshanxiaqijianPanel
      {
         if(this._ynShanxiaqijianPanel == null)
         {
            this._ynShanxiaqijianPanel = new YNshanxiaqijianPanel();
            UIEventsRegisterManager.registerUI(this._ynShanxiaqijianPanel,YNshanxiaqijianPanel);
         }
         return this._ynShanxiaqijianPanel;
      }
      
      public function get ynNvquanPanel() : YN201638HuodongPanel
      {
         if(this._ynNvquanPanel == null)
         {
            this._ynNvquanPanel = new YN201638HuodongPanel();
            UIEventsRegisterManager.registerUI(this._ynNvquanPanel,YN201638HuodongPanel);
         }
         return this._ynNvquanPanel;
      }
      
      public function get ynLuohanhutiPanel() : YNLuohanhutiPanel
      {
         if(this._ynLuohanhutiPanel == null)
         {
            this._ynLuohanhutiPanel = new YNLuohanhutiPanel();
            UIEventsRegisterManager.registerUI(this._ynLuohanhutiPanel,YNLuohanhutiPanel);
         }
         return this._ynLuohanhutiPanel;
      }
      
      public function get ynShouyinPanel() : YNshouyinPanel
      {
         if(this._ynShouyinPanel == null)
         {
            this._ynShouyinPanel = new YNshouyinPanel();
            UIEventsRegisterManager.registerUI(this._ynShouyinPanel,YNshouyinPanel);
         }
         return this._ynShouyinPanel;
      }
      
      public function get ynQiziquanzhenPanel() : YNQiziquanzhenjiaoPanel
      {
         if(this._ynQiziquanzhenPanel == null)
         {
            this._ynQiziquanzhenPanel = new YNQiziquanzhenjiaoPanel();
            UIEventsRegisterManager.registerUI(this._ynQiziquanzhenPanel,YNQiziquanzhenjiaoPanel);
         }
         return this._ynQiziquanzhenPanel;
      }
      
      public function get yn2016XingyunzhuanpanPanel() : YN2016xingyunzhuanpanPanel
      {
         if(this._yn2016XingyunzhuanpanPanel == null)
         {
            this._yn2016XingyunzhuanpanPanel = new YN2016xingyunzhuanpanPanel();
            UIEventsRegisterManager.registerUI(this._yn2016XingyunzhuanpanPanel,YN2016xingyunzhuanpanPanel);
         }
         return this._yn2016XingyunzhuanpanPanel;
      }
      
      public function get ynChongzhidafaPanel() : YNchongzhidafaPanel
      {
         if(this._ynChongzhidafaPanel == null)
         {
            this._ynChongzhidafaPanel = new YNchongzhidafaPanel();
            UIEventsRegisterManager.registerUI(this._ynChongzhidafaPanel,YNchongzhidafaPanel);
         }
         return this._ynChongzhidafaPanel;
      }
      
      public function get ynWulinshenqiPanel() : YNwulinshenqiPanel
      {
         if(this._ynWulinshenqiPanel == null)
         {
            this._ynWulinshenqiPanel = new YNwulinshenqiPanel();
            UIEventsRegisterManager.registerUI(this._ynWulinshenqiPanel,YNwulinshenqiPanel);
         }
         return this._ynWulinshenqiPanel;
      }
      
      public function get ynJuedingshenbingPanel() : YNjuedingshenbingPanel
      {
         if(this._ynJuedingshenbingPanel == null)
         {
            this._ynJuedingshenbingPanel = new YNjuedingshenbingPanel();
            UIEventsRegisterManager.registerUI(this._ynJuedingshenbingPanel,YNjuedingshenbingPanel);
         }
         return this._ynJuedingshenbingPanel;
      }
      
      public function get ynHutishangyiPanel() : YNhutishangyiPanel
      {
         if(this._ynHutishangyiPanel == null)
         {
            this._ynHutishangyiPanel = new YNhutishangyiPanel();
            UIEventsRegisterManager.registerUI(this._ynHutishangyiPanel,YNhutishangyiPanel);
         }
         return this._ynHutishangyiPanel;
      }
      
      public function get ynWzzbPanel() : YNwangzhezhibangPanel
      {
         if(this._ynWzzbPanel == null)
         {
            this._ynWzzbPanel = new YNwangzhezhibangPanel();
            UIEventsRegisterManager.registerUI(this._ynWzzbPanel,YNwangzhezhibangPanel);
         }
         return this._ynWzzbPanel;
      }
      
      public function get ynZhimengqianzhuangPanel() : YNzhimengqianzhuangPanel
      {
         if(this._ynZhimengqianzhuangPanel == null)
         {
            this._ynZhimengqianzhuangPanel = new YNzhimengqianzhuangPanel();
            UIEventsRegisterManager.registerUI(this._ynZhimengqianzhuangPanel,YNzhimengqianzhuangPanel);
         }
         return this._ynZhimengqianzhuangPanel;
      }
      
      public function get ynTulongdaoPanel() : YNtulongdaoPanel
      {
         if(this._ynTulongdaoPanel == null)
         {
            this._ynTulongdaoPanel = new YNtulongdaoPanel();
            UIEventsRegisterManager.registerUI(this._ynTulongdaoPanel,YNtulongdaoPanel);
         }
         return this._ynTulongdaoPanel;
      }
      
      public function get ynWushuangPanel() : YNwushuangPanel
      {
         if(this._ynWushuangpuPanel == null)
         {
            this._ynWushuangpuPanel = new YNwushuangPanel();
            UIEventsRegisterManager.registerUI(this._ynWushuangpuPanel,YNwushuangPanel);
         }
         return this._ynWushuangpuPanel;
      }
      
      public function get ynShisanjianhunPanel() : YNshisanPanel
      {
         if(this._ynShisanjianhunPanel == null)
         {
            this._ynShisanjianhunPanel = new YNshisanPanel();
            UIEventsRegisterManager.registerUI(this._ynShisanjianhunPanel,YNshisanPanel);
         }
         return this._ynShisanjianhunPanel;
      }
      
      public function get ynZhuadayuPanel() : YNzhuadayuPanel
      {
         if(this._ynZhuadayuPanel == null)
         {
            this._ynZhuadayuPanel = new YNzhuadayuPanel();
            UIEventsRegisterManager.registerUI(this._ynZhuadayuPanel,YNzhuadayuPanel);
         }
         return this._ynZhuadayuPanel;
      }
      
      public function get longfengdangpuiPanel() : LongFengDangPuPanel
      {
         if(this._longfengdangpuiPanel == null)
         {
            this._longfengdangpuiPanel = new LongFengDangPuPanel();
            UIEventsRegisterManager.registerUI(this._longfengdangpuiPanel,LongFengDangPuPanel);
         }
         return this._longfengdangpuiPanel;
      }
      
      public function get yn2016JieJiLiangCaoPanel() : YN2016jiejiliangcao
      {
         if(this._yn2016JieJiLiangCaoPanel == null)
         {
            this._yn2016JieJiLiangCaoPanel = new YN2016jiejiliangcao();
            UIEventsRegisterManager.registerUI(this._yn2016JieJiLiangCaoPanel,YN2016jiejiliangcao);
         }
         return this._yn2016JieJiLiangCaoPanel;
      }
      
      public function get yn2016XiaoFeiPanel() : YN2016XiaoFeiPanel
      {
         if(this._yn2016XiaoFeiPanel == null)
         {
            this._yn2016XiaoFeiPanel = new YN2016XiaoFeiPanel();
            UIEventsRegisterManager.registerUI(this._yn2016XiaoFeiPanel,YN2016XiaoFeiPanel);
         }
         return this._yn2016XiaoFeiPanel;
      }
      
      public function get yn2016WushenzhanlianPanel() : YN2016WuShenzhanlianPanel
      {
         if(this._ynWushenzhanlianPanel == null)
         {
            this._ynWushenzhanlianPanel = new YN2016WuShenzhanlianPanel();
            UIEventsRegisterManager.registerUI(this._ynWushenzhanlianPanel,YN2016WuShenzhanlianPanel);
         }
         return this._ynWushenzhanlianPanel;
      }
      
      public function get yn2016HuoDongXiaoFeiPanel() : YN2016HuoDongXiaoFeiPanel
      {
         if(this._yn2016HuoDongXiaoFeiPanel == null)
         {
            this._yn2016HuoDongXiaoFeiPanel = new YN2016HuoDongXiaoFeiPanel();
            UIEventsRegisterManager.registerUI(this._yn2016HuoDongXiaoFeiPanel,YN2016HuoDongXiaoFeiPanel);
         }
         return this._yn2016HuoDongXiaoFeiPanel;
      }
      
      public function get yn2016ZhouqicailuPanel() : YN2016ZhouqicailuPanel
      {
         if(this._yn2016zhouqicailuPanel == null)
         {
            this._yn2016zhouqicailuPanel = new YN2016ZhouqicailuPanel();
            UIEventsRegisterManager.registerUI(this._yn2016zhouqicailuPanel,YN2016ZhouqicailuPanel);
         }
         return this._yn2016zhouqicailuPanel;
      }
      
      public function get yn2016WuShenZhanLianPaiHangPanel() : YN2016WushenpaihangPanel
      {
         if(this._yn2016WuShenZhanLianPaiHangPanel == null)
         {
            this._yn2016WuShenZhanLianPaiHangPanel = new YN2016WushenpaihangPanel();
            UIEventsRegisterManager.registerUI(this._yn2016WuShenZhanLianPaiHangPanel,YN2016WushenpaihangPanel);
         }
         return this._yn2016WuShenZhanLianPaiHangPanel;
      }
      
      public function get xunZhangzhanshiPanel() : XunzhangZhanshiShowPanel
      {
         if(this._xunZhangzhanshiPanel == null)
         {
            this._xunZhangzhanshiPanel = new XunzhangZhanshiShowPanel();
            UIEventsRegisterManager.registerUI(this._xunZhangzhanshiPanel,XunzhangZhanshiShowPanel);
         }
         return this._xunZhangzhanshiPanel;
      }
      
      public function get targetXunZhangzhanshiPanel() : XunzhangZhanshiShowPanel
      {
         if(this._targetXunZhangzhanshiPanel == null)
         {
            this._targetXunZhangzhanshiPanel = new XunzhangZhanshiShowPanel();
            UIEventsRegisterManager.registerUI(this._targetXunZhangzhanshiPanel,XunzhangZhanshiShowPanel);
         }
         return this._targetXunZhangzhanshiPanel;
      }
      
      public function get yn2016MengZhuZhuFuPanel() : YN2016MengZhuZhuFuPanel
      {
         if(this._yn2016MengZhuZhuFuPanel == null)
         {
            this._yn2016MengZhuZhuFuPanel = new YN2016MengZhuZhuFuPanel();
            UIEventsRegisterManager.registerUI(this._yn2016MengZhuZhuFuPanel,YN2016MengZhuZhuFuPanel);
         }
         return this._yn2016MengZhuZhuFuPanel;
      }
      
      public function get ynyuelungujiPanel() : YnYuelungujiPanel
      {
         if(this._ynyuelungujiPanel == null)
         {
            this._ynyuelungujiPanel = new YnYuelungujiPanel();
            UIEventsRegisterManager.registerUI(this._ynyuelungujiPanel,YnYuelungujiPanel);
         }
         return this._ynyuelungujiPanel;
      }
      
      public function get ynchongjiuzhiyangPanel() : YnChongjiezhiyangPanel
      {
         if(this._ynchongjiuzhiyangPanel == null)
         {
            this._ynchongjiuzhiyangPanel = new YnChongjiezhiyangPanel();
            UIEventsRegisterManager.registerUI(this._ynchongjiuzhiyangPanel,YnChongjiezhiyangPanel);
         }
         return this._ynchongjiuzhiyangPanel;
      }
      
      public function get ynxiuweiwuxuePanel() : YN2016XiuweiwuxuePanel
      {
         if(this._ynxiuweiwuxuePanel == null)
         {
            this._ynxiuweiwuxuePanel = new YN2016XiuweiwuxuePanel();
            UIEventsRegisterManager.registerUI(this._ynxiuweiwuxuePanel,YN2016XiuweiwuxuePanel);
         }
         return this._ynxiuweiwuxuePanel;
      }
      
      public function get ynwangzhezhanqiPanel() : YN2016WangzhezhanqiPanel
      {
         if(this._ynwangzhezhanqiPanel == null)
         {
            this._ynwangzhezhanqiPanel = new YN2016WangzhezhanqiPanel();
            UIEventsRegisterManager.registerUI(this._ynwangzhezhanqiPanel,YN2016WangzhezhanqiPanel);
         }
         return this._ynwangzhezhanqiPanel;
      }
      
      public function get ynqicaipaihangbangPanel() : YN2016QicaiPaihangbangPanel
      {
         if(this._ynqicaipaihangbangPanel == null)
         {
            this._ynqicaipaihangbangPanel = new YN2016QicaiPaihangbangPanel();
            UIEventsRegisterManager.registerUI(this._ynqicaipaihangbangPanel,YN2016QicaiPaihangbangPanel);
         }
         return this._ynqicaipaihangbangPanel;
      }
      
      public function get ynqicaitijiaowupinPanel() : QicaitijiaowupinPanel
      {
         if(this._ynqicaitijiaowupinPanel == null)
         {
            this._ynqicaitijiaowupinPanel = new QicaitijiaowupinPanel();
            UIEventsRegisterManager.registerUI(this._ynqicaitijiaowupinPanel,QicaitijiaowupinPanel);
         }
         return this._ynqicaitijiaowupinPanel;
      }
      
      public function get yn2016HuoDongfanliPanel() : YN2016HuodongFanliPanel
      {
         if(this._yn2016HuoDongfanliPanel == null)
         {
            this._yn2016HuoDongfanliPanel = new YN2016HuodongFanliPanel();
            UIEventsRegisterManager.registerUI(this._yn2016HuoDongfanliPanel,YN2016HuodongFanliPanel);
         }
         return this._yn2016HuoDongfanliPanel;
      }
      
      public function get ynfuqitongxinpaihangbangPanel() : YN2016FuqitongxinPaihangbangPanel
      {
         if(this._ynfuqitongxinpaihangbangPanel == null)
         {
            this._ynfuqitongxinpaihangbangPanel = new YN2016FuqitongxinPaihangbangPanel();
            UIEventsRegisterManager.registerUI(this._ynfuqitongxinpaihangbangPanel,YN2016FuqitongxinPaihangbangPanel);
         }
         return this._ynfuqitongxinpaihangbangPanel;
      }
      
      public function get ynfuqitongxinPanel() : YN2016FuqitongxinPanel
      {
         if(this._ynfuqitongxinPanel == null)
         {
            this._ynfuqitongxinPanel = new YN2016FuqitongxinPanel();
            UIEventsRegisterManager.registerUI(this._ynfuqitongxinPanel,YN2016FuqitongxinPanel);
         }
         return this._ynfuqitongxinPanel;
      }
      
      public function get ynshengrizhoujiPanel() : YN2016ShengrizhoujiPanel
      {
         if(this._ynshengrizhoujiPanel == null)
         {
            this._ynshengrizhoujiPanel = new YN2016ShengrizhoujiPanel();
            UIEventsRegisterManager.registerUI(this._ynshengrizhoujiPanel,YN2016ShengrizhoujiPanel);
         }
         return this._ynshengrizhoujiPanel;
      }
      
      public function get ynliupaijingjiPanel() : YN2016LiupaijingjiPanel
      {
         if(this._ynliupaijingjiPanel == null)
         {
            this._ynliupaijingjiPanel = new YN2016LiupaijingjiPanel();
            UIEventsRegisterManager.registerUI(this._ynliupaijingjiPanel,YN2016LiupaijingjiPanel);
         }
         return this._ynliupaijingjiPanel;
      }
      
      public function get ynliumaijianPanel() : YN2016LiumaijianPanel
      {
         if(this._ynliumaijianPanel == null)
         {
            this._ynliumaijianPanel = new YN2016LiumaijianPanel();
            UIEventsRegisterManager.registerUI(this._ynliumaijianPanel,YN2016LiumaijianPanel);
         }
         return this._ynliumaijianPanel;
      }
      
      public function get ynyingbinzhouliPanel() : YN2016YingbinzhouliPanel
      {
         if(this._ynyingbinzhouliPanel == null)
         {
            this._ynyingbinzhouliPanel = new YN2016YingbinzhouliPanel();
            UIEventsRegisterManager.registerUI(this._ynyingbinzhouliPanel,YN2016YingbinzhouliPanel);
         }
         return this._ynyingbinzhouliPanel;
      }
      
      public function get ynzhouwuguangliangPanel() : YN2016ZhouwuguangliangPanel
      {
         if(this._ynzhouwuguangliangPanel == null)
         {
            this._ynzhouwuguangliangPanel = new YN2016ZhouwuguangliangPanel();
            UIEventsRegisterManager.registerUI(this._ynzhouwuguangliangPanel,YN2016ZhouwuguangliangPanel);
         }
         return this._ynzhouwuguangliangPanel;
      }
      
      public function get yndingfengzhouqiPanel() : YN2016DingfengzhouqiPanel
      {
         if(this._yndingfengzhouqiPanel == null)
         {
            this._yndingfengzhouqiPanel = new YN2016DingfengzhouqiPanel();
            UIEventsRegisterManager.registerUI(this._yndingfengzhouqiPanel,YN2016DingfengzhouqiPanel);
         }
         return this._yndingfengzhouqiPanel;
      }
      
      public function get ynzhentianshenqiPanel() : YN2016ZhentianshenqiPanel
      {
         if(this._ynzhentianshenqiPanel == null)
         {
            this._ynzhentianshenqiPanel = new YN2016ZhentianshenqiPanel();
            UIEventsRegisterManager.registerUI(this._ynzhentianshenqiPanel,YN2016ZhentianshenqiPanel);
         }
         return this._ynzhentianshenqiPanel;
      }
      
      public function get ynxiaohuishenbingPanel() : YN2016XiaohuishenbingPanel
      {
         if(this._ynxiaohuishenbingPanel == null)
         {
            this._ynxiaohuishenbingPanel = new YN2016XiaohuishenbingPanel();
            UIEventsRegisterManager.registerUI(this._ynxiaohuishenbingPanel,YN2016XiaohuishenbingPanel);
         }
         return this._ynxiaohuishenbingPanel;
      }
      
      public function get ynhuashanlunjianPanel() : YN2016HuashanlunjianPanel
      {
         if(this._ynhuashanlunjianPanel == null)
         {
            this._ynhuashanlunjianPanel = new YN2016HuashanlunjianPanel();
            UIEventsRegisterManager.registerUI(this._ynhuashanlunjianPanel,YN2016HuashanlunjianPanel);
         }
         return this._ynhuashanlunjianPanel;
      }
      
      public function get ynshengdanjiePanel() : YN2016ShengdanjiePanel
      {
         if(this._ynshengdanjiePanel == null)
         {
            this._ynshengdanjiePanel = new YN2016ShengdanjiePanel();
            UIEventsRegisterManager.registerUI(this._ynshengdanjiePanel,YN2016ShengdanjiePanel);
         }
         return this._ynshengdanjiePanel;
      }
      
      public function get ynshengdanjinpiaoPanel() : YN2016ShengdanjinpiaoPanel
      {
         if(this._ynshengdanjinpiaoPanel == null)
         {
            this._ynshengdanjinpiaoPanel = new YN2016ShengdanjinpiaoPanel();
            UIEventsRegisterManager.registerUI(this._ynshengdanjinpiaoPanel,YN2016ShengdanjinpiaoPanel);
         }
         return this._ynshengdanjinpiaoPanel;
      }
      
      public function get ynzhenbaogePanel() : YN2016ZhenbaogePanel
      {
         if(this._ynzhenbaogePanel == null)
         {
            this._ynzhenbaogePanel = new YN2016ZhenbaogePanel();
            UIEventsRegisterManager.registerUI(this._ynzhenbaogePanel,YN2016ZhenbaogePanel);
         }
         return this._ynzhenbaogePanel;
      }
      
      public function get ynzaowangPanel() : YN2017ZaowangPanel
      {
         if(this._ynzaowangPanel == null)
         {
            this._ynzaowangPanel = new YN2017ZaowangPanel();
            UIEventsRegisterManager.registerUI(this._ynzaowangPanel,YN2017ZaowangPanel);
         }
         return this._ynzaowangPanel;
      }
      
      public function get ynfangyanhuaPanel() : YN2017FangyanhuaPanel
      {
         if(this._ynfangyanhuaPanel == null)
         {
            this._ynfangyanhuaPanel = new YN2017FangyanhuaPanel();
            UIEventsRegisterManager.registerUI(this._ynfangyanhuaPanel,YN2017FangyanhuaPanel);
         }
         return this._ynfangyanhuaPanel;
      }
      
      public function get xinnianyasuiqianChaXunWanJiaPanel() : Xinnianyasuiqian_ChaXunWanJiaPanel
      {
         if(this._xinnianyasuiquanChaXunWanJiaPanel == null)
         {
            this._xinnianyasuiquanChaXunWanJiaPanel = new Xinnianyasuiqian_ChaXunWanJiaPanel();
            UIEventsRegisterManager.registerUI(this._xinnianyasuiquanChaXunWanJiaPanel,Xinnianyasuiqian_ChaXunWanJiaPanel);
         }
         return this._xinnianyasuiquanChaXunWanJiaPanel;
      }
      
      public function get xinnianyasuiqianPanel() : XinnianyasuiqianPanel
      {
         if(this._xinnianyasuiquanPanel == null)
         {
            this._xinnianyasuiquanPanel = new XinnianyasuiqianPanel();
            UIEventsRegisterManager.registerUI(this._xinnianyasuiquanPanel,XinnianyasuiqianPanel);
         }
         return this._xinnianyasuiquanPanel;
      }
      
      public function get xinnianyasuiqianpaihangbangPanel() : XinnianyasuiqianPaihangbangPanel
      {
         if(this._xinnianyasuiquanpaihangPanel == null)
         {
            this._xinnianyasuiquanpaihangPanel = new XinnianyasuiqianPaihangbangPanel();
            UIEventsRegisterManager.registerUI(this._xinnianyasuiquanpaihangPanel,XinnianyasuiqianPaihangbangPanel);
         }
         return this._xinnianyasuiquanpaihangPanel;
      }
      
      public function get chunjie123Panel() : YN2017ChunjiehuodongPanel
      {
         if(this._chunjie123Panel == null)
         {
            this._chunjie123Panel = new YN2017ChunjiehuodongPanel();
            UIEventsRegisterManager.registerUI(this._chunjie123Panel,YN2017ChunjiehuodongPanel);
         }
         return this._chunjie123Panel;
      }
      
      public function get yuanyangxishuiPanel() : YN2017YuanyangxishuiPanel
      {
         if(this._yuanyangxishuiPanel == null)
         {
            this._yuanyangxishuiPanel = new YN2017YuanyangxishuiPanel();
            UIEventsRegisterManager.registerUI(this._yuanyangxishuiPanel,YN2017YuanyangxishuiPanel);
         }
         return this._yuanyangxishuiPanel;
      }
      
      public function get moxuezhanchangPanel() : MoXueZhanChangPanel
      {
         if(this._moxuezhanchangPanel == null)
         {
            this._moxuezhanchangPanel = new MoXueZhanChangPanel();
            UIEventsRegisterManager.registerUI(this._moxuezhanchangPanel,MoXueZhanChangPanel);
         }
         return this._moxuezhanchangPanel;
      }
      
      public function get fuLiHuoDongPanel() : FuLiHuoDongPanel
      {
         if(this._fuLiHuoDongPanel == null)
         {
            this._fuLiHuoDongPanel = new FuLiHuoDongPanel();
            UIEventsRegisterManager.registerUI(this._fuLiHuoDongPanel,FuLiHuoDongPanel);
         }
         return this._fuLiHuoDongPanel;
      }
      
      public function get moxueleftTopTipsSprite() : moxuezhanchangTips
      {
         if(this._moxueleftTopTipsSprite == null)
         {
            this._moxueleftTopTipsSprite = new moxuezhanchangTips();
            UIEventsRegisterManager.registerUI(this._moxueleftTopTipsSprite,moxuezhanchangTips);
         }
         return this._moxueleftTopTipsSprite;
      }
      
      public function get guosetianxiangPanel() : YN2017GuoSeTianXiangPanel
      {
         if(this._guosetianxiangPanel == null)
         {
            this._guosetianxiangPanel = new YN2017GuoSeTianXiangPanel();
            UIEventsRegisterManager.registerUI(this._guosetianxiangPanel,YN2017GuoSeTianXiangPanel);
         }
         return this._guosetianxiangPanel;
      }
      
      public function get jiangHunCNPanel() : JiangHunPanel_CN
      {
         if(this._jiangHunCNPanel == null)
         {
            this._jiangHunCNPanel = new JiangHunPanel_CN();
            UIEventsRegisterManager.registerUI(this._jiangHunCNPanel,JiangHunPanel_CN);
         }
         return this._jiangHunCNPanel;
      }
      
      public function get aidehuibaoPanel() : YN2017AidehuibaoPanel
      {
         if(this._aidehuibaoPanel == null)
         {
            this._aidehuibaoPanel = new YN2017AidehuibaoPanel();
            UIEventsRegisterManager.registerUI(this._aidehuibaoPanel,YN2017AidehuibaoPanel);
         }
         return this._aidehuibaoPanel;
      }
      
      public function get youhuizhouqiPanel() : YN2017YouHuiZhouQiPanel
      {
         if(this._youhuizhouqiPanel == null)
         {
            this._youhuizhouqiPanel = new YN2017YouHuiZhouQiPanel();
            UIEventsRegisterManager.registerUI(this._youhuizhouqiPanel,YN2017YouHuiZhouQiPanel);
         }
         return this._youhuizhouqiPanel;
      }
      
      public function get oulePanel() : YN2017OulePanel
      {
         if(this._oulePanel == null)
         {
            this._oulePanel = new YN2017OulePanel();
            UIEventsRegisterManager.registerUI(this._oulePanel,YN2017OulePanel);
         }
         return this._oulePanel;
      }
      
      public function get ynyurenjiePanel() : YN2017YurenjiePanel
      {
         if(this._ynyurenjiePanel == null)
         {
            this._ynyurenjiePanel = new YN2017YurenjiePanel();
            UIEventsRegisterManager.registerUI(this._ynyurenjiePanel,YN2017YurenjiePanel);
         }
         return this._ynyurenjiePanel;
      }
      
      public function get xiongwangdaliPanel() : YN2017XiongwangdaliPanel
      {
         if(this._xiongwangdaliPanel == null)
         {
            this._xiongwangdaliPanel = new YN2017XiongwangdaliPanel();
            UIEventsRegisterManager.registerUI(this._xiongwangdaliPanel,YN2017XiongwangdaliPanel);
         }
         return this._xiongwangdaliPanel;
      }
      
      public function get ynwangzhezhuangbeiPanel() : YN2017Wangzhe10zhuangbeiPanel
      {
         if(this._ynwangzhezhuangbeiPanel == null)
         {
            this._ynwangzhezhuangbeiPanel = new YN2017Wangzhe10zhuangbeiPanel();
            UIEventsRegisterManager.registerUI(this._ynwangzhezhuangbeiPanel,YN2017Wangzhe10zhuangbeiPanel);
         }
         return this._ynwangzhezhuangbeiPanel;
      }
      
      public function get kaizhan5Panel() : YN2017DiwucikaizhanPanel
      {
         if(this._kaizhan5Panel == null)
         {
            this._kaizhan5Panel = new YN2017DiwucikaizhanPanel();
            UIEventsRegisterManager.registerUI(this._kaizhan5Panel,YN2017DiwucikaizhanPanel);
         }
         return this._kaizhan5Panel;
      }
      
      public function get duanwujie2015Panel() : DuanWuJie2015Panel
      {
         if(this._duanwujie2015Panel == null)
         {
            this._duanwujie2015Panel = new DuanWuJie2015Panel();
            UIEventsRegisterManager.registerUI(this._duanwujie2015Panel,DuanWuJie2015Panel);
         }
         return this._duanwujie2015Panel;
      }
      
      public function get tianshizhouqiPanel() : YN2017TianshizhouqiPanel
      {
         if(this._tianshizhouqiPanel == null)
         {
            this._tianshizhouqiPanel = new YN2017TianshizhouqiPanel();
            UIEventsRegisterManager.registerUI(this._tianshizhouqiPanel,YN2017TianshizhouqiPanel);
         }
         return this._tianshizhouqiPanel;
      }
      
      public function get nantianhaoqiPanel() : YN2017NantianhaoqiPanel
      {
         if(this._nantianhaoqiPanel == null)
         {
            this._nantianhaoqiPanel = new YN2017NantianhaoqiPanel();
            UIEventsRegisterManager.registerUI(this._nantianhaoqiPanel,YN2017NantianhaoqiPanel);
         }
         return this._nantianhaoqiPanel;
      }
      
      public function get rongguangPanel() : YN2017RongguangPanel
      {
         if(this._rongguangPanel == null)
         {
            this._rongguangPanel = new YN2017RongguangPanel();
            UIEventsRegisterManager.registerUI(this._rongguangPanel,YN2017RongguangPanel);
         }
         return this._rongguangPanel;
      }
      
      public function get baGuaZhenPanel() : BaGuaZhenPanel
      {
         if(this._baGuaZhenPanel == null)
         {
            this._baGuaZhenPanel = new BaGuaZhenPanel();
            UIEventsRegisterManager.registerUI(this._baGuaZhenPanel,BaGuaZhenPanel);
         }
         return this._baGuaZhenPanel;
      }
      
      public function get zhenpinshangdianPanel() : ZhenpinShangdianPanel
      {
         if(this._zhenpinshangdianPanel == null)
         {
            this._zhenpinshangdianPanel = new ZhenpinShangdianPanel();
            UIEventsRegisterManager.registerUI(this._zhenpinshangdianPanel,ZhenpinShangdianPanel);
         }
         return this._zhenpinshangdianPanel;
      }
      
      public function get juezhanshangdianPanel() : JuezhanshangdianPanel
      {
         if(this._juezhanshangdianPanel == null)
         {
            this._juezhanshangdianPanel = new JuezhanshangdianPanel();
            UIEventsRegisterManager.registerUI(this._juezhanshangdianPanel,JuezhanshangdianPanel);
         }
         return this._juezhanshangdianPanel;
      }
      
      public function get fodanPanel() : YN2017FodanPanel
      {
         if(this._fodanPanel == null)
         {
            this._fodanPanel = new YN2017FodanPanel();
            UIEventsRegisterManager.registerUI(this._fodanPanel,YN2017FodanPanel);
         }
         return this._fodanPanel;
      }
      
      public function get yingxiongmingchengPanel() : YN2017YingXiongMingChengPanel
      {
         if(this._yingxiongmingchengPanel == null)
         {
            this._yingxiongmingchengPanel = new YN2017YingXiongMingChengPanel();
            UIEventsRegisterManager.registerUI(this._yingxiongmingchengPanel,YN2017YingXiongMingChengPanel);
         }
         return this._yingxiongmingchengPanel;
      }
      
      public function get duijuezhouqiPanel() : YN2017DuiJueZhouQiPanel
      {
         if(this._duijuezhouqiPanel == null)
         {
            this._duijuezhouqiPanel = new YN2017DuiJueZhouQiPanel();
            UIEventsRegisterManager.registerUI(this._duijuezhouqiPanel,YN2017DuiJueZhouQiPanel);
         }
         return this._duijuezhouqiPanel;
      }
      
      public function get $0519Panel() : YN2017_0519Panel
      {
         if(this._0519Panel == null)
         {
            this._0519Panel = new YN2017_0519Panel();
            UIEventsRegisterManager.registerUI(this._0519Panel,YN2017_0519Panel);
         }
         return this._0519Panel;
      }
      
      public function get liuyiertongjiePanel() : YN2017LiuyiertongjiePanel
      {
         if(this._liuyiertongjiePanel == null)
         {
            this._liuyiertongjiePanel = new YN2017LiuyiertongjiePanel();
            UIEventsRegisterManager.registerUI(this._liuyiertongjiePanel,YN2017LiuyiertongjiePanel);
         }
         return this._liuyiertongjiePanel;
      }
      
      public function get shijianshalouPanel() : ShiJianShaLou
      {
         if(this._shijianshalouPanel == null)
         {
            this._shijianshalouPanel = new ShiJianShaLou();
            UIEventsRegisterManager.registerUI(this._shijianshalouPanel,ShiJianShaLou);
         }
         return this._shijianshalouPanel;
      }
      
      public function get $dianfengzhouqiPanel() : YN2017DianfengzhouqiPanel
      {
         if(this._dianfengzhouqiPanel == null)
         {
            this._dianfengzhouqiPanel = new YN2017DianfengzhouqiPanel();
            UIEventsRegisterManager.registerUI(this._dianfengzhouqiPanel,YN2017DianfengzhouqiPanel);
         }
         return this._dianfengzhouqiPanel;
      }
      
      public function get $qingzhuPanel() : YN2017QingzhuPanel
      {
         if(this._qingzhuPanel == null)
         {
            this._qingzhuPanel = new YN2017QingzhuPanel();
            UIEventsRegisterManager.registerUI(this._qingzhuPanel,YN2017QingzhuPanel);
         }
         return this._qingzhuPanel;
      }
      
      public function get $meitianyouhuiPanel() : YN2017MeitianyouhuiPanel
      {
         if(this._meitianyouhuiPanel == null)
         {
            this._meitianyouhuiPanel = new YN2017MeitianyouhuiPanel();
            UIEventsRegisterManager.registerUI(this._meitianyouhuiPanel,YN2017MeitianyouhuiPanel);
         }
         return this._meitianyouhuiPanel;
      }
      
      public function get $meitianyouhui2Panel() : YN2017Meitianyouhui2Panel
      {
         if(this._meitianyouhui2Panel == null)
         {
            this._meitianyouhui2Panel = new YN2017Meitianyouhui2Panel();
            UIEventsRegisterManager.registerUI(this._meitianyouhui2Panel,YN2017Meitianyouhui2Panel);
         }
         return this._meitianyouhui2Panel;
      }
      
      public function get $shenfengPanel() : YN2017ShenfengPanel
      {
         if(this._shenfengPanel == null)
         {
            this._shenfengPanel = new YN2017ShenfengPanel();
            UIEventsRegisterManager.registerUI(this._shenfengPanel,YN2017ShenfengPanel);
         }
         return this._shenfengPanel;
      }
      
      public function get $tengtianyuPanel() : YNTengtianyuPanel
      {
         if(this._tengtianyuPanel == null)
         {
            this._tengtianyuPanel = new YNTengtianyuPanel();
            UIEventsRegisterManager.registerUI(this._tengtianyuPanel,YNTengtianyuPanel);
         }
         return this._tengtianyuPanel;
      }
      
      public function get $shengzhenPanel() : YN2017WudushengzhenPanel
      {
         if(this._shengzhenPanel == null)
         {
            this._shengzhenPanel = new YN2017WudushengzhenPanel();
            UIEventsRegisterManager.registerUI(this._shengzhenPanel,YN2017WudushengzhenPanel);
         }
         return this._shengzhenPanel;
      }
      
      public function get $shengzhen2Panel() : YN2017Tengtianyu2Panel
      {
         if(this._shengzhen2Panel == null)
         {
            this._shengzhen2Panel = new YN2017Tengtianyu2Panel();
            UIEventsRegisterManager.registerUI(this._shengzhen2Panel,YN2017Tengtianyu2Panel);
         }
         return this._shengzhen2Panel;
      }
      
      public function get $shengzhen3Panel() : YN2017Tengtianyu3Panel
      {
         if(this._shengzhen3Panel == null)
         {
            this._shengzhen3Panel = new YN2017Tengtianyu3Panel();
            UIEventsRegisterManager.registerUI(this._shengzhen3Panel,YN2017Tengtianyu3Panel);
         }
         return this._shengzhen3Panel;
      }
      
      public function get $liuyueyuanmanPanel() : YN2017LiuyueyuanmanPanel
      {
         if(this._liuyueyuanmanPanel == null)
         {
            this._liuyueyuanmanPanel = new YN2017LiuyueyuanmanPanel();
            UIEventsRegisterManager.registerUI(this._liuyueyuanmanPanel,YN2017LiuyueyuanmanPanel);
         }
         return this._liuyueyuanmanPanel;
      }
      
      public function get $liuyueqingzhuPanel() : YN2017LiuyueqingzhuPanel
      {
         if(this._liuyueqingzhuPanel == null)
         {
            this._liuyueqingzhuPanel = new YN2017LiuyueqingzhuPanel();
            UIEventsRegisterManager.registerUI(this._liuyueqingzhuPanel,YN2017LiuyueqingzhuPanel);
         }
         return this._liuyueqingzhuPanel;
      }
      
      public function get $liuyuediPanel() : YN2017LiuyuediPanel
      {
         if(this._liuyuediPanel == null)
         {
            this._liuyuediPanel = new YN2017LiuyuediPanel();
            UIEventsRegisterManager.registerUI(this._liuyuediPanel,YN2017LiuyuediPanel);
         }
         return this._liuyuediPanel;
      }
      
      public function get ynshoucichongzhi2Panel() : YN2017ShouChongPanel
      {
         if(this._ynshoucichongzhi2Panel == null)
         {
            this._ynshoucichongzhi2Panel = new YN2017ShouChongPanel();
            UIEventsRegisterManager.registerUI(this._ynshoucichongzhi2Panel,YN2017ShouChongPanel);
         }
         return this._ynshoucichongzhi2Panel;
      }
      
      public function get ynshoucichongzhi3Panel() : YN2017ShouChong2Panel
      {
         if(this._ynshoucichongzhi3Panel == null)
         {
            this._ynshoucichongzhi3Panel = new YN2017ShouChong2Panel();
            UIEventsRegisterManager.registerUI(this._ynshoucichongzhi3Panel,YN2017ShouChong2Panel);
         }
         return this._ynshoucichongzhi3Panel;
      }
      
      public function get $meitianchongzhilibaoPanel() : YN2017MeitianchongzhilibaoPanel
      {
         if(this._meitianchongzhilibaoPanel == null)
         {
            this._meitianchongzhilibaoPanel = new YN2017MeitianchongzhilibaoPanel();
            UIEventsRegisterManager.registerUI(this._meitianchongzhilibaoPanel,YN2017MeitianchongzhilibaoPanel);
         }
         return this._meitianchongzhilibaoPanel;
      }
      
      public function get ynYitianjianPanel() : YNyitianjianPanel
      {
         if(this._ynYitianjianPanel == null)
         {
            this._ynYitianjianPanel = new YNyitianjianPanel();
            UIEventsRegisterManager.registerUI(this._ynYitianjianPanel,YNyitianjianPanel);
         }
         return this._ynYitianjianPanel;
      }
      
      public function get $dishiPanel() : YN2017DishiPanel
      {
         if(this._dishiPanel == null)
         {
            this._dishiPanel = new YN2017DishiPanel();
            UIEventsRegisterManager.registerUI(this._dishiPanel,YN2017DishiPanel);
         }
         return this._dishiPanel;
      }
      
      public function get $v300Panel() : YN2017V300Panel
      {
         if(this._v300Panel == null)
         {
            this._v300Panel = new YN2017V300Panel();
            UIEventsRegisterManager.registerUI(this._v300Panel,YN2017V300Panel);
         }
         return this._v300Panel;
      }
      
      public function get $feishengjingjiePanel() : YN2017FeishengjingjiePanel
      {
         if(this._feishengjingjiePanel == null)
         {
            this._feishengjingjiePanel = new YN2017FeishengjingjiePanel();
            UIEventsRegisterManager.registerUI(this._feishengjingjiePanel,YN2017FeishengjingjiePanel);
         }
         return this._feishengjingjiePanel;
      }
      
      public function get $shouchongshijianPanel() : YN2017ShouchongshijianPanel
      {
         if(this._shouchongshijianPanel == null)
         {
            this._shouchongshijianPanel = new YN2017ShouchongshijianPanel();
            UIEventsRegisterManager.registerUI(this._shouchongshijianPanel,YN2017ShouchongshijianPanel);
         }
         return this._shouchongshijianPanel;
      }
      
      public function get $moshizhouqiPanel() : YN2017MoshizhouqiPanel
      {
         if(this._moshizhouqiPanel == null)
         {
            this._moshizhouqiPanel = new YN2017MoshizhouqiPanel();
            UIEventsRegisterManager.registerUI(this._moshizhouqiPanel,YN2017MoshizhouqiPanel);
         }
         return this._moshizhouqiPanel;
      }
      
      public function get $xiatianzhienPanel() : YN2017XiatianzhienPanel
      {
         if(this._xiatianzhienPanel == null)
         {
            this._xiatianzhienPanel = new YN2017XiatianzhienPanel();
            UIEventsRegisterManager.registerUI(this._xiatianzhienPanel,YN2017XiatianzhienPanel);
         }
         return this._xiatianzhienPanel;
      }
      
      public function get $bayuetouPanel() : YN2017BayuetouPanel
      {
         if(this._bayuetouPanel == null)
         {
            this._bayuetouPanel = new YN2017BayuetouPanel();
            UIEventsRegisterManager.registerUI(this._bayuetouPanel,YN2017BayuetouPanel);
         }
         return this._bayuetouPanel;
      }
      
      public function get $tonglefeishengjingjie() : YN2017TonglefeishengjingjiePanel
      {
         if(this._tonglefeishengjingjiePanel == null)
         {
            this._tonglefeishengjingjiePanel = new YN2017TonglefeishengjingjiePanel();
            UIEventsRegisterManager.registerUI(this._tonglefeishengjingjiePanel,YN2017TonglefeishengjingjiePanel);
         }
         return this._tonglefeishengjingjiePanel;
      }
      
      public function get $V303Panel() : YNV303Panel
      {
         if(this._V303Panel == null)
         {
            this._V303Panel = new YNV303Panel();
            UIEventsRegisterManager.registerUI(this._V303Panel,YNV303Panel);
         }
         return this._V303Panel;
      }
      
      public function get $shenqizhouqiPanel() : YN2017ShenqizhouqiPanel
      {
         if(this._shenqizhouqiPanel == null)
         {
            this._shenqizhouqiPanel = new YN2017ShenqizhouqiPanel();
            UIEventsRegisterManager.registerUI(this._shenqizhouqiPanel,YN2017ShenqizhouqiPanel);
         }
         return this._shenqizhouqiPanel;
      }
      
      public function get $baguajingshiPanel() : YN2017BaguajingshiPanel
      {
         if(this._baguajingshiPanel == null)
         {
            this._baguajingshiPanel = new YN2017BaguajingshiPanel();
            UIEventsRegisterManager.registerUI(this._baguajingshiPanel,YN2017BaguajingshiPanel);
         }
         return this._baguajingshiPanel;
      }
      
      public function get $longlishiPanel() : YN2017LonglishiPanel
      {
         if(this._longlishiPanel == null)
         {
            this._longlishiPanel = new YN2017LonglishiPanel();
            UIEventsRegisterManager.registerUI(this._longlishiPanel,YN2017LonglishiPanel);
         }
         return this._longlishiPanel;
      }
      
      public function get $qianghuazhishenPanel() : YN2017QianghuazhishenPanel
      {
         if(this._qianghuazhishenPanel == null)
         {
            this._qianghuazhishenPanel = new YN2017QianghuazhishenPanel();
            UIEventsRegisterManager.registerUI(this._qianghuazhishenPanel,YN2017QianghuazhishenPanel);
         }
         return this._qianghuazhishenPanel;
      }
      
      public function get $xiangyangduijuePanel() : YN2017XiangyangduijuePanel
      {
         if(this._xiangyangduijuePanel == null)
         {
            this._xiangyangduijuePanel = new YN2017XiangyangduijuePanel();
            UIEventsRegisterManager.registerUI(this._xiangyangduijuePanel,YN2017XiangyangduijuePanel);
         }
         return this._xiangyangduijuePanel;
      }
      
      public function get $wulinwujuedanPanel() : YN2017WulinwujuedanPanel
      {
         if(this._wulinwujuedanPanel == null)
         {
            this._wulinwujuedanPanel = new YN2017WulinwujuedanPanel();
            UIEventsRegisterManager.registerUI(this._wulinwujuedanPanel,YN2017WulinwujuedanPanel);
         }
         return this._wulinwujuedanPanel;
      }
      
      public function get $wulinshendibaoPanel() : YN2017WulinshendibaoPanel
      {
         if(this._wulinshendibaoPanel == null)
         {
            this._wulinshendibaoPanel = new YN2017WulinshendibaoPanel();
            UIEventsRegisterManager.registerUI(this._wulinshendibaoPanel,YN2017WulinshendibaoPanel);
         }
         return this._wulinshendibaoPanel;
      }
      
      public function get $1908Panel() : YN2017_1908Panel
      {
         if(this._1908Panel == null)
         {
            this._1908Panel = new YN2017_1908Panel();
            UIEventsRegisterManager.registerUI(this._1908Panel,YN2017_1908Panel);
         }
         return this._1908Panel;
      }
      
      public function get $qixihuodongPanel() : YN2017QixihuodongPanel
      {
         if(this._qixihuodongPanel == null)
         {
            this._qixihuodongPanel = new YN2017QixihuodongPanel();
            UIEventsRegisterManager.registerUI(this._qixihuodongPanel,YN2017QixihuodongPanel);
         }
         return this._qixihuodongPanel;
      }
      
      public function get $libaozhouqiPanel() : YN2017LibaozhouqiPanel
      {
         if(this._libaozhouqiPanel == null)
         {
            this._libaozhouqiPanel = new YN2017LibaozhouqiPanel();
            UIEventsRegisterManager.registerUI(this._libaozhouqiPanel,YN2017LibaozhouqiPanel);
         }
         return this._libaozhouqiPanel;
      }
      
      public function get $shijian902Panel() : YN2017Shijian902Panel
      {
         if(this._shijian902Panel == null)
         {
            this._shijian902Panel = new YN2017Shijian902Panel();
            UIEventsRegisterManager.registerUI(this._shijian902Panel,YN2017Shijian902Panel);
         }
         return this._shijian902Panel;
      }
      
      public function get $yulanjiePanel() : YN2017YulanjiePanel
      {
         if(this._yulanjiePanel == null)
         {
            this._yulanjiePanel = new YN2017YulanjiePanel();
            UIEventsRegisterManager.registerUI(this._yulanjiePanel,YN2017YulanjiePanel);
         }
         return this._yulanjiePanel;
      }
      
      public function get $weixiPanel() : YN2017HuanyingweixiPanel
      {
         if(this._weixiPanel == null)
         {
            this._weixiPanel = new YN2017HuanyingweixiPanel();
            UIEventsRegisterManager.registerUI(this._weixiPanel,YN2017HuanyingweixiPanel);
         }
         return this._weixiPanel;
      }
      
      public function get $chongjiuhuodongPanel() : YN2017ChongjiuhuodongPanel
      {
         if(this._chongjiuhuodongPanel == null)
         {
            this._chongjiuhuodongPanel = new YN2017ChongjiuhuodongPanel();
            UIEventsRegisterManager.registerUI(this._chongjiuhuodongPanel,YN2017ChongjiuhuodongPanel);
         }
         return this._chongjiuhuodongPanel;
      }
      
      public function get $wulinzhenyuanPanel() : YN2017WulinzhenyuanPanel
      {
         if(this._wulinzhenyuanPanel == null)
         {
            this._wulinzhenyuanPanel = new YN2017WulinzhenyuanPanel();
            UIEventsRegisterManager.registerUI(this._wulinzhenyuanPanel,YN2017WulinzhenyuanPanel);
         }
         return this._wulinzhenyuanPanel;
      }
      
      public function get $kaixueqiqiuPanel() : YN2017KaixueqiqiuPanel
      {
         if(this._kaixueqiqiuPanel == null)
         {
            this._kaixueqiqiuPanel = new YN2017KaixueqiqiuPanel();
            UIEventsRegisterManager.registerUI(this._kaixueqiqiuPanel,YN2017KaixueqiqiuPanel);
         }
         return this._kaixueqiqiuPanel;
      }
      
      public function get yitiantulongPanel() : YiTianTuLong
      {
         if(this._yitiantulongPanel == null)
         {
            this._yitiantulongPanel = new YiTianTuLong();
            UIEventsRegisterManager.registerUI(this._yitiantulongPanel,YiTianTuLong);
         }
         return this._yitiantulongPanel;
      }
      
      public function get tuLongFuBenPanel() : TuLongFuBenPanel
      {
         if(this._tuLongFuBenPanel == null)
         {
            this._tuLongFuBenPanel = new TuLongFuBenPanel();
            UIEventsRegisterManager.registerUI(this._tuLongFuBenPanel,TuLongFuBenPanel);
         }
         return this._tuLongFuBenPanel;
      }
      
      public function get $huozhenjiashiPanel() : YN2017HuozhenjiashiPanel
      {
         if(this._huozhenjiashiPanel == null)
         {
            this._huozhenjiashiPanel = new YN2017HuozhenjiashiPanel();
            UIEventsRegisterManager.registerUI(this._huozhenjiashiPanel,YN2017HuozhenjiashiPanel);
         }
         return this._huozhenjiashiPanel;
      }
      
      public function get $xuanwuxingjunPanel() : YN2017XuanwuxingjunPanel
      {
         if(this._xuanwuxingjunPanel == null)
         {
            this._xuanwuxingjunPanel = new YN2017XuanwuxingjunPanel();
            UIEventsRegisterManager.registerUI(this._xuanwuxingjunPanel,YN2017XuanwuxingjunPanel);
         }
         return this._xuanwuxingjunPanel;
      }
      
      public function get $wangzhezhengxiongPanel() : YN2017WangzhezhengxiongPanel
      {
         if(this._wangzhezhengxiongPanel == null)
         {
            this._wangzhezhengxiongPanel = new YN2017WangzhezhengxiongPanel();
            UIEventsRegisterManager.registerUI(this._wangzhezhengxiongPanel,YN2017WangzhezhengxiongPanel);
         }
         return this._wangzhezhengxiongPanel;
      }
      
      public function get $wangzhehuodongPanel() : YN2017WangzhehuodongPanel
      {
         if(this._wangzhehuodongPanel == null)
         {
            this._wangzhehuodongPanel = new YN2017WangzhehuodongPanel();
            UIEventsRegisterManager.registerUI(this._wangzhehuodongPanel,YN2017WangzhehuodongPanel);
         }
         return this._wangzhehuodongPanel;
      }
      
      public function get $baihuxingjunPanel() : YN2017BaihuxingjunPanel
      {
         if(this._baihuxingjunPanel == null)
         {
            this._baihuxingjunPanel = new YN2017BaihuxingjunPanel();
            UIEventsRegisterManager.registerUI(this._baihuxingjunPanel,YN2017BaihuxingjunPanel);
         }
         return this._baihuxingjunPanel;
      }
      
      public function get $zhongqiu2017Panel() : YN2017Zhongqiu2017Panel
      {
         if(this._zhongqiu2017Panel == null)
         {
            this._zhongqiu2017Panel = new YN2017Zhongqiu2017Panel();
            UIEventsRegisterManager.registerUI(this._zhongqiu2017Panel,YN2017Zhongqiu2017Panel);
         }
         return this._zhongqiu2017Panel;
      }
      
      public function get $rijinlunPanel() : Rijinlun
      {
         if(this._rijinlunPanel == null)
         {
            this._rijinlunPanel = new Rijinlun();
            UIEventsRegisterManager.registerUI(this._rijinlunPanel,Rijinlun);
         }
         return this._rijinlunPanel;
      }
      
      public function get $qinglongxingjunPanel() : YN2017QinglongxingjunPanel
      {
         if(this._qinglongxingjunPanel == null)
         {
            this._qinglongxingjunPanel = new YN2017QinglongxingjunPanel();
            UIEventsRegisterManager.registerUI(this._qinglongxingjunPanel,YN2017QinglongxingjunPanel);
         }
         return this._qinglongxingjunPanel;
      }
      
      public function get $lihejuePanel() : YN2017LihejuePanel
      {
         if(this._lihejuePanel == null)
         {
            this._lihejuePanel = new YN2017LihejuePanel();
            UIEventsRegisterManager.registerUI(this._lihejuePanel,YN2017LihejuePanel);
         }
         return this._lihejuePanel;
      }
      
      public function get $10yueyouhuiPanel() : YN201710YueyouhuizhouqiPanel
      {
         if(this._10yueyouhuiPanel == null)
         {
            this._10yueyouhuiPanel = new YN201710YueyouhuizhouqiPanel();
            UIEventsRegisterManager.registerUI(this._10yueyouhuiPanel,YN201710YueyouhuizhouqiPanel);
         }
         return this._10yueyouhuiPanel;
      }
      
      public function get $meitianchongzhilibao2Panel() : YN2017Meitianchongzhilibao2Panel
      {
         if(this._meitianchongzhilibao2Panel == null)
         {
            this._meitianchongzhilibao2Panel = new YN2017Meitianchongzhilibao2Panel();
            UIEventsRegisterManager.registerUI(this._meitianchongzhilibao2Panel,YN2017Meitianchongzhilibao2Panel);
         }
         return this._meitianchongzhilibao2Panel;
      }
      
      public function get $zhuquexingjunPanel() : YN2017ZhuquexingjunPanel
      {
         if(this._zhuquexingjunPanel == null)
         {
            this._zhuquexingjunPanel = new YN2017ZhuquexingjunPanel();
            UIEventsRegisterManager.registerUI(this._zhuquexingjunPanel,YN2017ZhuquexingjunPanel);
         }
         return this._zhuquexingjunPanel;
      }
      
      public function get $20171020Panel() : YN20171020Panel
      {
         if(this._20171020Panel == null)
         {
            this._20171020Panel = new YN20171020Panel();
            UIEventsRegisterManager.registerUI(this._20171020Panel,YN20171020Panel);
         }
         return this._20171020Panel;
      }
      
      public function get $zengsongnvrenPanel() : YN2017ZengsongnvrenPanel
      {
         if(this._zengsongnvrenPanel == null)
         {
            this._zengsongnvrenPanel = new YN2017ZengsongnvrenPanel();
            UIEventsRegisterManager.registerUI(this._zengsongnvrenPanel,YN2017ZengsongnvrenPanel);
         }
         return this._zengsongnvrenPanel;
      }
      
      public function get $suixinxiaofeiPanel() : YNSuixinxiaofeiPanel
      {
         if(this._suixinxiaofeiPanel == null)
         {
            this._suixinxiaofeiPanel = new YNSuixinxiaofeiPanel();
            UIEventsRegisterManager.registerUI(this._suixinxiaofeiPanel,YNSuixinxiaofeiPanel);
         }
         return this._suixinxiaofeiPanel;
      }
      
      public function get $liunianhuodongPanel() : YNLiunianhuodongPanel
      {
         if(this._liunianhuodongPanel == null)
         {
            this._liunianhuodongPanel = new YNLiunianhuodongPanel();
            UIEventsRegisterManager.registerUI(this._liunianhuodongPanel,YNLiunianhuodongPanel);
         }
         return this._liunianhuodongPanel;
      }
      
      public function get $liunianpeibanPanel() : YNLiunianpeibanPanel
      {
         if(this._liunianpeibanPanel == null)
         {
            this._liunianpeibanPanel = new YNLiunianpeibanPanel();
            UIEventsRegisterManager.registerUI(this._liunianpeibanPanel,YNLiunianpeibanPanel);
         }
         return this._liunianpeibanPanel;
      }
      
      public function get $ganenliunianPanel() : YNGanenliunianPanel
      {
         if(this._ganenliunianPanel == null)
         {
            this._ganenliunianPanel = new YNGanenliunianPanel();
            UIEventsRegisterManager.registerUI(this._ganenliunianPanel,YNGanenliunianPanel);
         }
         return this._ganenliunianPanel;
      }
      
      public function get $shengrizhouqiPanel() : YNShengrizhouqiPanel
      {
         if(this._shengrizhouqiPanel == null)
         {
            this._shengrizhouqiPanel = new YNShengrizhouqiPanel();
            UIEventsRegisterManager.registerUI(this._shengrizhouqiPanel,YNShengrizhouqiPanel);
         }
         return this._shengrizhouqiPanel;
      }
      
      public function get $huazhuangdasaiPanel() : YNHuazhuangdasaiPanel
      {
         if(this._huazhuangdasaiPanel == null)
         {
            this._huazhuangdasaiPanel = new YNHuazhuangdasaiPanel();
            UIEventsRegisterManager.registerUI(this._huazhuangdasaiPanel,YNHuazhuangdasaiPanel);
         }
         return this._huazhuangdasaiPanel;
      }
      
      public function get $huazhuanglibaoPanel() : YN2017HuazhuanglibaoPanel
      {
         if(this._huazhuanglibaoPanel == null)
         {
            this._huazhuanglibaoPanel = new YN2017HuazhuanglibaoPanel();
            UIEventsRegisterManager.registerUI(this._huazhuanglibaoPanel,YN2017HuazhuanglibaoPanel);
         }
         return this._huazhuanglibaoPanel;
      }
      
      public function get $chibanglibaoPanel() : YN2017ChibanglibaoPanel
      {
         if(this._chibanglibaoPanel == null)
         {
            this._chibanglibaoPanel = new YN2017ChibanglibaoPanel();
            UIEventsRegisterManager.registerUI(this._chibanglibaoPanel,YN2017ChibanglibaoPanel);
         }
         return this._chibanglibaoPanel;
      }
      
      public function get $xuantiezhixingzhouqiPanel() : YNXuantiezhixingzhouqiPanel
      {
         if(this._xuantiezhixingzhouqiPanel == null)
         {
            this._xuantiezhixingzhouqiPanel = new YNXuantiezhixingzhouqiPanel();
            UIEventsRegisterManager.registerUI(this._xuantiezhixingzhouqiPanel,YNXuantiezhixingzhouqiPanel);
         }
         return this._xuantiezhixingzhouqiPanel;
      }
      
      public function get $0601Panel() : YN0601ShijianPanel
      {
         if(this._yuenan0601Panel == null)
         {
            this._yuenan0601Panel = new YN0601ShijianPanel();
            UIEventsRegisterManager.registerUI(this._yuenan0601Panel,YN0601ShijianPanel);
         }
         return this._yuenan0601Panel;
      }
      
      public function get $qinglongxingjunfuwenPanel() : YNQinglongxingjunfuwenPanel
      {
         if(this._qinglongxingjunfuwenPanel == null)
         {
            this._qinglongxingjunfuwenPanel = new YNQinglongxingjunfuwenPanel();
            UIEventsRegisterManager.registerUI(this._qinglongxingjunfuwenPanel,YNQinglongxingjunfuwenPanel);
         }
         return this._qinglongxingjunfuwenPanel;
      }
      
      public function get $neiligaishiPanel() : YNNeiligaishiPanel
      {
         if(this._neiligaishiPanel == null)
         {
            this._neiligaishiPanel = new YNNeiligaishiPanel();
            UIEventsRegisterManager.registerUI(this._neiligaishiPanel,YNNeiligaishiPanel);
         }
         return this._neiligaishiPanel;
      }
      
      public function get $chaojixianglongzhouqiPanel() : YNChaojixianglongzhouqiPanel
      {
         if(this._chaojixianglongzhouqiPanel == null)
         {
            this._chaojixianglongzhouqiPanel = new YNChaojixianglongzhouqiPanel();
            UIEventsRegisterManager.registerUI(this._chaojixianglongzhouqiPanel,YNChaojixianglongzhouqiPanel);
         }
         return this._chaojixianglongzhouqiPanel;
      }
      
      public function get $yuenan2017jiaoshijiePanel() : YN2017JiaoshijiePanel
      {
         if(this._yuenan2017jiaoshijiePanel == null)
         {
            this._yuenan2017jiaoshijiePanel = new YN2017JiaoshijiePanel();
            UIEventsRegisterManager.registerUI(this._yuenan2017jiaoshijiePanel,YN2017JiaoshijiePanel);
         }
         return this._yuenan2017jiaoshijiePanel;
      }
      
      public function get $shuanglongzhanPanel() : YN2017ShuanglongzhanPanel
      {
         if(this._shuanglongzhanPanel == null)
         {
            this._shuanglongzhanPanel = new YN2017ShuanglongzhanPanel();
            UIEventsRegisterManager.registerUI(this._shuanglongzhanPanel,YN2017ShuanglongzhanPanel);
         }
         return this._shuanglongzhanPanel;
      }
      
      public function get $zhenpinzhouqiPanel() : YNZhenpinzhouqiPanel
      {
         if(this._zhenpinzhouqiPanel == null)
         {
            this._zhenpinzhouqiPanel = new YNZhenpinzhouqiPanel();
            UIEventsRegisterManager.registerUI(this._zhenpinzhouqiPanel,YNZhenpinzhouqiPanel);
         }
         return this._zhenpinzhouqiPanel;
      }
      
      public function get $1205shijianPanel() : YN1205ShijianPanel
      {
         if(this._1205shijianPanel == null)
         {
            this._1205shijianPanel = new YN1205ShijianPanel();
            UIEventsRegisterManager.registerUI(this._1205shijianPanel,YN1205ShijianPanel);
         }
         return this._1205shijianPanel;
      }
      
      public function get $yitianbaojinzhouqiPanel() : YNYitianbaojinzhouqiPanel
      {
         if(this._yitianbaojinzhouqiPanel == null)
         {
            this._yitianbaojinzhouqiPanel = new YNYitianbaojinzhouqiPanel();
            UIEventsRegisterManager.registerUI(this._yitianbaojinzhouqiPanel,YNYitianbaojinzhouqiPanel);
         }
         return this._yitianbaojinzhouqiPanel;
      }
      
      public function get $1212shijianPanel() : YN1212ShijianPanel
      {
         if(this._1212shijianPanel == null)
         {
            this._1212shijianPanel = new YN1212ShijianPanel();
            UIEventsRegisterManager.registerUI(this._1212shijianPanel,YN1212ShijianPanel);
         }
         return this._1212shijianPanel;
      }
      
      public function get $1219shijianPanel() : YN1219ShijianPanel
      {
         if(this._1219shijianPanel == null)
         {
            this._1219shijianPanel = new YN1219ShijianPanel();
            UIEventsRegisterManager.registerUI(this._1219shijianPanel,YN1219ShijianPanel);
         }
         return this._1219shijianPanel;
      }
      
      public function get $1226shijianPanel() : YN1226ShijianPanel
      {
         if(this._1226shijianPanel == null)
         {
            this._1226shijianPanel = new YN1226ShijianPanel();
            UIEventsRegisterManager.registerUI(this._1226shijianPanel,YN1226ShijianPanel);
         }
         return this._1226shijianPanel;
      }
      
      public function get $yinshechudongPanel() : YNYinshechudongPanel
      {
         if(this._yinshechudongPanel == null)
         {
            this._yinshechudongPanel = new YNYinshechudongPanel();
            UIEventsRegisterManager.registerUI(this._yinshechudongPanel,YNYinshechudongPanel);
         }
         return this._yinshechudongPanel;
      }
      
      public function get $shengdanchongmanPanel() : YNShengdanchongmanliwuPanel
      {
         if(this._shengdanchongmanPanel == null)
         {
            this._shengdanchongmanPanel = new YNShengdanchongmanliwuPanel();
            UIEventsRegisterManager.registerUI(this._shengdanchongmanPanel,YNShengdanchongmanliwuPanel);
         }
         return this._shengdanchongmanPanel;
      }
      
      public function get $wanshixingPanel() : YNWanshixingPanel
      {
         if(this._wanshixingPanel == null)
         {
            this._wanshixingPanel = new YNWanshixingPanel();
            UIEventsRegisterManager.registerUI(this._wanshixingPanel,YNWanshixingPanel);
         }
         return this._wanshixingPanel;
      }
      
      public function get $qianghuajinshenPanel() : YNQianghuajinshenPanel
      {
         if(this._qianghuajinshenPanel == null)
         {
            this._qianghuajinshenPanel = new YNQianghuajinshenPanel();
            UIEventsRegisterManager.registerUI(this._qianghuajinshenPanel,YNQianghuajinshenPanel);
         }
         return this._qianghuajinshenPanel;
      }
      
      public function get $peiyangdianfengshouPanel() : YNPeiyangdianfengshouPanel
      {
         if(this._peiyangdianfengshouPanel == null)
         {
            this._peiyangdianfengshouPanel = new YNPeiyangdianfengshouPanel();
            UIEventsRegisterManager.registerUI(this._peiyangdianfengshouPanel,YNPeiyangdianfengshouPanel);
         }
         return this._peiyangdianfengshouPanel;
      }
      
      public function get xingYunZhuanZhuanLePanel() : DingFengYunPanPanel
      {
         if(this._xingYunZhuanZhuanLePanel == null)
         {
            this._xingYunZhuanZhuanLePanel = new DingFengYunPanPanel();
            UIEventsRegisterManager.registerUI(this._xingYunZhuanZhuanLePanel,DingFengYunPanPanel);
         }
         return this._xingYunZhuanZhuanLePanel;
      }
      
      public function get yiTianTuLongDaoPanel() : YiTianTuLongDaoPanel
      {
         if(this._yiTianTuLongDaoPanel == null)
         {
            this._yiTianTuLongDaoPanel = new YiTianTuLongDaoPanel();
            UIEventsRegisterManager.registerUI(this._yiTianTuLongDaoPanel,YiTianTuLongDaoPanel);
         }
         return this._yiTianTuLongDaoPanel;
      }
      
      public function get tianRenHePanel() : TianRenHePanel
      {
         if(this._tianRenHePanel == null)
         {
            this._tianRenHePanel = new TianRenHePanel();
            UIEventsRegisterManager.registerUI(this._tianRenHePanel,TianRenHePanel);
         }
         return this._tianRenHePanel;
      }
      
      public function get rongQingAiYiPanel() : RongQingAiYiPanel
      {
         if(this._rongQingAiYiPanel == null)
         {
            this._rongQingAiYiPanel = new RongQingAiYiPanel();
            UIEventsRegisterManager.registerUI(this._rongQingAiYiPanel,RongQingAiYiPanel);
         }
         return this._rongQingAiYiPanel;
      }
      
      public function get shuangLongZhan2Panel() : YN2017Shuanglongzhan2Panel
      {
         if(this._shuangLongZhan2Panel == null)
         {
            this._shuangLongZhan2Panel = new YN2017Shuanglongzhan2Panel();
            UIEventsRegisterManager.registerUI(this._shuangLongZhan2Panel,YN2017Shuanglongzhan2Panel);
         }
         return this._shuangLongZhan2Panel;
      }
      
      public function get shuangLongZhan3Panel() : YN2017Shuanglongzhan3Panel
      {
         if(this._shuangLongZhan3Panel == null)
         {
            this._shuangLongZhan3Panel = new YN2017Shuanglongzhan3Panel();
            UIEventsRegisterManager.registerUI(this._shuangLongZhan3Panel,YN2017Shuanglongzhan3Panel);
         }
         return this._shuangLongZhan3Panel;
      }
      
      public function get chaoJiWuLinDaBaoPanel() : ChaoJiWuLinDaBaoPanel
      {
         if(this._chaoJiWuLinDaBaoPanel == null)
         {
            this._chaoJiWuLinDaBaoPanel = new ChaoJiWuLinDaBaoPanel();
            UIEventsRegisterManager.registerUI(this._chaoJiWuLinDaBaoPanel,ChaoJiWuLinDaBaoPanel);
         }
         return this._chaoJiWuLinDaBaoPanel;
      }
      
      public function get fuNvJie2018Panel() : FuNvJie2018Panel
      {
         if(this._fuNvJie2018Panel == null)
         {
            this._fuNvJie2018Panel = new FuNvJie2018Panel();
            UIEventsRegisterManager.registerUI(this._fuNvJie2018Panel,FuNvJie2018Panel);
         }
         return this._fuNvJie2018Panel;
      }
      
      public function get jinShenZhouQiPanel() : JinShenZhouQiPanel
      {
         if(this._jinShenZhouQiPanel == null)
         {
            this._jinShenZhouQiPanel = new JinShenZhouQiPanel();
            UIEventsRegisterManager.registerUI(this._jinShenZhouQiPanel,JinShenZhouQiPanel);
         }
         return this._jinShenZhouQiPanel;
      }
      
      public function get baiQiaoKeLiPanel() : BaiQiaoKeLiPanel
      {
         if(this._baiQiaoKeLiPanel == null)
         {
            this._baiQiaoKeLiPanel = new BaiQiaoKeLiPanel();
            UIEventsRegisterManager.registerUI(this._baiQiaoKeLiPanel,BaiQiaoKeLiPanel);
         }
         return this._baiQiaoKeLiPanel;
      }
      
      public function get huangJinZhouQiPanel() : DaHuangJinZhouQiPanel
      {
         if(this._huangJinZhouQiPanel == null)
         {
            this._huangJinZhouQiPanel = new DaHuangJinZhouQiPanel();
            UIEventsRegisterManager.registerUI(this._huangJinZhouQiPanel,DaHuangJinZhouQiPanel);
         }
         return this._huangJinZhouQiPanel;
      }
      
      public function get tianRenHe2Panel() : TianRenHe2Panel
      {
         if(this._tianRenHe2Panel == null)
         {
            this._tianRenHe2Panel = new TianRenHe2Panel();
            UIEventsRegisterManager.registerUI(this._tianRenHe2Panel,TianRenHe2Panel);
         }
         return this._tianRenHe2Panel;
      }
      
      public function get qiangHuaJinShen2Panel() : YNQianghuajinshen2Panel
      {
         if(this._qiangHuaJinShen2Panel == null)
         {
            this._qiangHuaJinShen2Panel = new YNQianghuajinshen2Panel();
            UIEventsRegisterManager.registerUI(this._qiangHuaJinShen2Panel,YNQianghuajinshen2Panel);
         }
         return this._qiangHuaJinShen2Panel;
      }
      
      public function get qiangHuaJinShen3Panel() : YNQianghuajinshen3Panel
      {
         if(this._qiangHuaJinShen3Panel == null)
         {
            this._qiangHuaJinShen3Panel = new YNQianghuajinshen3Panel();
            UIEventsRegisterManager.registerUI(this._qiangHuaJinShen3Panel,YNQianghuajinshen3Panel);
         }
         return this._qiangHuaJinShen3Panel;
      }
      
      public function get yuanBaoYouHuiPanel() : YuanBaoYouHuiPanel
      {
         if(this._yuanBaoYouHuiPanel == null)
         {
            this._yuanBaoYouHuiPanel = new YuanBaoYouHuiPanel();
            UIEventsRegisterManager.registerUI(this._yuanBaoYouHuiPanel,YuanBaoYouHuiPanel);
         }
         return this._yuanBaoYouHuiPanel;
      }
      
      public function get yurenjie2018Panel() : YuRenJie2018Panel
      {
         if(this._yurenjie2018Panel == null)
         {
            this._yurenjie2018Panel = new YuRenJie2018Panel();
            UIEventsRegisterManager.registerUI(this._yurenjie2018Panel,YuRenJie2018Panel);
         }
         return this._yurenjie2018Panel;
      }
      
      public function get changNianChongZhiPanel() : ChangNianChongZhiPanel
      {
         if(this._changNianChongZhiPanel == null)
         {
            this._changNianChongZhiPanel = new ChangNianChongZhiPanel();
            UIEventsRegisterManager.registerUI(this._changNianChongZhiPanel,ChangNianChongZhiPanel);
         }
         return this._changNianChongZhiPanel;
      }
      
      public function get hanShiJiePanel() : HanShiJiePanel
      {
         if(this._hanShiJiePanel == null)
         {
            this._hanShiJiePanel = new HanShiJiePanel();
            UIEventsRegisterManager.registerUI(this._hanShiJiePanel,HanShiJiePanel);
         }
         return this._hanShiJiePanel;
      }
      
      public function get daShengZhouQi() : DaShengZhouQiPanel
      {
         if(this._daShengZhouQi == null)
         {
            this._daShengZhouQi = new DaShengZhouQiPanel();
            UIEventsRegisterManager.registerUI(this._daShengZhouQi,DaShengZhouQiPanel);
         }
         return this._daShengZhouQi;
      }
      
      public function get laoDongJie2018() : LaoDongJie2018Panel
      {
         if(this._laoDongJie2018 == null)
         {
            this._laoDongJie2018 = new LaoDongJie2018Panel();
            UIEventsRegisterManager.registerUI(this._laoDongJie2018,LaoDongJie2018Panel);
         }
         return this._laoDongJie2018;
      }
      
      public function get banBenYouHui() : BanBenYouHuiPanel
      {
         if(this._banBenYouHui == null)
         {
            this._banBenYouHui = new BanBenYouHuiPanel();
            UIEventsRegisterManager.registerUI(this._banBenYouHui,BanBenYouHuiPanel);
         }
         return this._banBenYouHui;
      }
      
      public function get liXia2018() : LiXia2018Panel
      {
         if(this._liXia2018 == null)
         {
            this._liXia2018 = new LiXia2018Panel();
            UIEventsRegisterManager.registerUI(this._liXia2018,LiXia2018Panel);
         }
         return this._liXia2018;
      }
      
      public function get shuiGuoLeiJiPanel() : ShuiGuoLeiJiPanel
      {
         if(this._shuiGuoLeiJiPanel == null)
         {
            this._shuiGuoLeiJiPanel = new ShuiGuoLeiJiPanel();
            UIEventsRegisterManager.registerUI(this._shuiGuoLeiJiPanel,ShuiGuoLeiJiPanel);
         }
         return this._shuiGuoLeiJiPanel;
      }
      
      public function get shuiGuoLeiJiDuiHuanPanel() : ShuiGuoLeiJiDuiHuanPanel
      {
         if(this._shuiGuoLeiJiDuiHuanPanel == null)
         {
            this._shuiGuoLeiJiDuiHuanPanel = new ShuiGuoLeiJiDuiHuanPanel();
            UIEventsRegisterManager.registerUI(this._shuiGuoLeiJiDuiHuanPanel,ShuiGuoLeiJiDuiHuanPanel);
         }
         return this._shuiGuoLeiJiDuiHuanPanel;
      }
      
      public function get huoDong0519Panel() : HuoDong0519Panel
      {
         if(this._huoDong0519Panel == null)
         {
            this._huoDong0519Panel = new HuoDong0519Panel();
            UIEventsRegisterManager.registerUI(this._huoDong0519Panel,HuoDong0519Panel);
         }
         return this._huoDong0519Panel;
      }
      
      public function get tianXiaWuGongChuShaoLinPanel() : TianXiaWuGongChuShaoLinPanel
      {
         if(this._tianXiaWuGongChuShaoLinPanel == null)
         {
            this._tianXiaWuGongChuShaoLinPanel = new TianXiaWuGongChuShaoLinPanel();
            UIEventsRegisterManager.registerUI(this._tianXiaWuGongChuShaoLinPanel,TianXiaWuGongChuShaoLinPanel);
         }
         return this._tianXiaWuGongChuShaoLinPanel;
      }
      
      public function get chaoJiZhouQiPanel() : ChaoJiZhouQiPanel
      {
         if(this._chaoJiZhouQiPanel == null)
         {
            this._chaoJiZhouQiPanel = new ChaoJiZhouQiPanel();
            UIEventsRegisterManager.registerUI(this._chaoJiZhouQiPanel,ChaoJiZhouQiPanel);
         }
         return this._chaoJiZhouQiPanel;
      }
      
      public function get yueXiaoFeiYueLingJiangPanel() : YueXiaoFeiYueLingJiangPanel
      {
         if(this._yueXiaoFeiYueLingJiangPanel == null)
         {
            this._yueXiaoFeiYueLingJiangPanel = new YueXiaoFeiYueLingJiangPanel();
            UIEventsRegisterManager.registerUI(this._yueXiaoFeiYueLingJiangPanel,YueXiaoFeiYueLingJiangPanel);
         }
         return this._yueXiaoFeiYueLingJiangPanel;
      }
      
      public function get zhiZunZhengDuoZhanPanel() : ZhiZunZhengDuoZhanPanel
      {
         if(this._zhiZunZhengDuoZhanPanel == null)
         {
            this._zhiZunZhengDuoZhanPanel = new ZhiZunZhengDuoZhanPanel();
            UIEventsRegisterManager.registerUI(this._zhiZunZhengDuoZhanPanel,ZhiZunZhengDuoZhanPanel);
         }
         return this._zhiZunZhengDuoZhanPanel;
      }
      
      public function get taoHuaZhiJingPanel() : TaoHuaZhiJingPanel
      {
         if(this._taoHuaZhiJingPanel == null)
         {
            this._taoHuaZhiJingPanel = new TaoHuaZhiJingPanel();
            UIEventsRegisterManager.registerUI(this._taoHuaZhiJingPanel,TaoHuaZhiJingPanel);
         }
         return this._taoHuaZhiJingPanel;
      }
      
      public function get quanZhenXiaoYaoPanel() : QuanZhenXiaoYaoPanel
      {
         if(this._quanZhenXiaoYaoPanel == null)
         {
            this._quanZhenXiaoYaoPanel = new QuanZhenXiaoYaoPanel();
            UIEventsRegisterManager.registerUI(this._quanZhenXiaoYaoPanel,QuanZhenXiaoYaoPanel);
         }
         return this._quanZhenXiaoYaoPanel;
      }
      
      public function get lianXuBaoMingPanel() : LianXuBaoMingPanel
      {
         if(this._lianXuBaoMingPanel == null)
         {
            this._lianXuBaoMingPanel = new LianXuBaoMingPanel();
            UIEventsRegisterManager.registerUI(this._lianXuBaoMingPanel,LianXuBaoMingPanel);
         }
         return this._lianXuBaoMingPanel;
      }
      
      public function get yingJieDuanWu2018Panel() : YingJieDuanWuJie2018Panel
      {
         if(this._yingJieDuanWu2018Panel == null)
         {
            this._yingJieDuanWu2018Panel = new YingJieDuanWuJie2018Panel();
            UIEventsRegisterManager.registerUI(this._yingJieDuanWu2018Panel,YingJieDuanWuJie2018Panel);
         }
         return this._yingJieDuanWu2018Panel;
      }
      
      public function get xiaTianKuaiLePanel() : XiaTianKuaiLePanel
      {
         if(this._xiaTianKuaiLePanel == null)
         {
            this._xiaTianKuaiLePanel = new XiaTianKuaiLePanel();
            UIEventsRegisterManager.registerUI(this._xiaTianKuaiLePanel,XiaTianKuaiLePanel);
         }
         return this._xiaTianKuaiLePanel;
      }
      
      public function get huanQiuKaiMuPanel() : HuanQiuKaiMuPanel
      {
         if(this._huanQiuKaiMuPanel == null)
         {
            this._huanQiuKaiMuPanel = new HuanQiuKaiMuPanel();
            UIEventsRegisterManager.registerUI(this._huanQiuKaiMuPanel,HuanQiuKaiMuPanel);
         }
         return this._huanQiuKaiMuPanel;
      }
      
      public function get mingJiaoZhiZunPanel() : MingJiaoZhiZunPanel
      {
         if(this._mingJiaoZhiZunPanel == null)
         {
            this._mingJiaoZhiZunPanel = new MingJiaoZhiZunPanel();
            UIEventsRegisterManager.registerUI(this._mingJiaoZhiZunPanel,MingJiaoZhiZunPanel);
         }
         return this._mingJiaoZhiZunPanel;
      }
      
      public function get feiShengShenBaoPanel() : FeiShengShenBaoPanel
      {
         if(this._feiShengShenBaoPanel == null)
         {
            this._feiShengShenBaoPanel = new FeiShengShenBaoPanel();
            UIEventsRegisterManager.registerUI(this._feiShengShenBaoPanel,FeiShengShenBaoPanel);
         }
         return this._feiShengShenBaoPanel;
      }
      
      public function get zhengDuoZhanPanel() : ZhengDuoZhanPanel
      {
         if(this._zhengDuoZhanPanel == null)
         {
            this._zhengDuoZhanPanel = new ZhengDuoZhanPanel();
            UIEventsRegisterManager.registerUI(this._zhengDuoZhanPanel,ZhengDuoZhanPanel);
         }
         return this._zhengDuoZhanPanel;
      }
      
      public function get daGengXinHuoDongPanel() : DaGengXinHuoDongPanel
      {
         if(this._daGengXinHuoDongPanel == null)
         {
            this._daGengXinHuoDongPanel = new DaGengXinHuoDongPanel();
            UIEventsRegisterManager.registerUI(this._daGengXinHuoDongPanel,DaGengXinHuoDongPanel);
         }
         return this._daGengXinHuoDongPanel;
      }
      
      public function get wangZheZhouQiPanel() : WangZheZhouQiPanel
      {
         if(this._wangZheZhouQiPanel == null)
         {
            this._wangZheZhouQiPanel = new WangZheZhouQiPanel();
            UIEventsRegisterManager.registerUI(this._wangZheZhouQiPanel,WangZheZhouQiPanel);
         }
         return this._wangZheZhouQiPanel;
      }
      
      public function get wangZheZhiBangHDPanel() : WangZheZhiBangHDPanel
      {
         if(this._wangZheZhiBangHDPanel == null)
         {
            this._wangZheZhiBangHDPanel = new WangZheZhiBangHDPanel();
            UIEventsRegisterManager.registerUI(this._wangZheZhiBangHDPanel,WangZheZhiBangHDPanel);
         }
         return this._wangZheZhiBangHDPanel;
      }
      
      public function get moshouzhanchangPanel() : MoShouZhanChang
      {
         if(this._moshouzhanchangPanel == null)
         {
            this._moshouzhanchangPanel = new MoShouZhanChang();
            UIEventsRegisterManager.registerUI(this._moshouzhanchangPanel,MoShouZhanChang);
         }
         return this._moshouzhanchangPanel;
      }
      
      public function get piLiangShiYongPanel() : PiLiangShiYongPanel
      {
         if(this._piLiangShiYongPanel == null)
         {
            this._piLiangShiYongPanel = new PiLiangShiYongPanel();
            UIEventsRegisterManager.registerUI(this._piLiangShiYongPanel,PiLiangShiYongPanel);
         }
         return this._piLiangShiYongPanel;
      }
      
      public function get huanYingBaYuePanel() : HuanYingBaYuePanel
      {
         if(this._huanYingBaYuePanel == null)
         {
            this._huanYingBaYuePanel = new HuanYingBaYuePanel();
            UIEventsRegisterManager.registerUI(this._huanYingBaYuePanel,HuanYingBaYuePanel);
         }
         return this._huanYingBaYuePanel;
      }
      
      public function get meiJiuPaiHangPanel() : MeiJiuPaiHangPanel
      {
         if(this._meiJiuPaiHangPanel == null)
         {
            this._meiJiuPaiHangPanel = new MeiJiuPaiHangPanel();
            UIEventsRegisterManager.registerUI(this._meiJiuPaiHangPanel,MeiJiuPaiHangPanel);
         }
         return this._meiJiuPaiHangPanel;
      }
      
      public function get yuLanZhouQiPanel() : YuLanZhouQiPanel
      {
         if(this._yuLanZhouQiPanel == null)
         {
            this._yuLanZhouQiPanel = new YuLanZhouQiPanel();
            UIEventsRegisterManager.registerUI(this._yuLanZhouQiPanel,YuLanZhouQiPanel);
         }
         return this._yuLanZhouQiPanel;
      }
      
      public function get yuLanZhiEnPanel() : YuLanZhiEnPanel
      {
         if(this._yuLanZhiEnPanel == null)
         {
            this._yuLanZhiEnPanel = new YuLanZhiEnPanel();
            UIEventsRegisterManager.registerUI(this._yuLanZhiEnPanel,YuLanZhiEnPanel);
         }
         return this._yuLanZhiEnPanel;
      }
      
      public function get guoQingZhouQiPanel() : GuoQingZhouQiPanel
      {
         if(this._guoQingZhouQiPanel == null)
         {
            this._guoQingZhouQiPanel = new GuoQingZhouQiPanel();
            UIEventsRegisterManager.registerUI(this._guoQingZhouQiPanel,GuoQingZhouQiPanel);
         }
         return this._guoQingZhouQiPanel;
      }
      
      public function get guoQingZengSongPanel() : GuoQingZengSongPanel
      {
         if(this._guoQingZengSongPanel == null)
         {
            this._guoQingZengSongPanel = new GuoQingZengSongPanel();
            UIEventsRegisterManager.registerUI(this._guoQingZengSongPanel,GuoQingZengSongPanel);
         }
         return this._guoQingZengSongPanel;
      }
      
      public function get shuangJiuHuoDongPanel() : ShuangJiuHuoDongPanel
      {
         if(this._shuangJiuHuoDongPanel == null)
         {
            this._shuangJiuHuoDongPanel = new ShuangJiuHuoDongPanel();
            UIEventsRegisterManager.registerUI(this._shuangJiuHuoDongPanel,ShuangJiuHuoDongPanel);
         }
         return this._shuangJiuHuoDongPanel;
      }
      
      public function get zhongQiuZengSongPanel() : ZhongQiuZengSongPanel
      {
         if(this._zhongQiuZengSongPanel == null)
         {
            this._zhongQiuZengSongPanel = new ZhongQiuZengSongPanel();
            UIEventsRegisterManager.registerUI(this._zhongQiuZengSongPanel,ZhongQiuZengSongPanel);
         }
         return this._zhongQiuZengSongPanel;
      }
      
      public function get zhongQiuJie2018Panel() : ZhongQiuJie2018Panel
      {
         if(this._zhongQiuJie2018Panel == null)
         {
            this._zhongQiuJie2018Panel = new ZhongQiuJie2018Panel();
            UIEventsRegisterManager.registerUI(this._zhongQiuJie2018Panel,ZhongQiuJie2018Panel);
         }
         return this._zhongQiuJie2018Panel;
      }
      
      public function get zhongQiuZhouQiPanel() : ZhongQiuZhouQiPanel
      {
         if(this._zhongQiuZhouQiPanel == null)
         {
            this._zhongQiuZhouQiPanel = new ZhongQiuZhouQiPanel();
            UIEventsRegisterManager.registerUI(this._zhongQiuZhouQiPanel,ZhongQiuZhouQiPanel);
         }
         return this._zhongQiuZhouQiPanel;
      }
      
      public function get qiuTianLiWuPanel() : QiuTianLiWuPanel
      {
         if(this._qiuTianLiWuPanel == null)
         {
            this._qiuTianLiWuPanel = new QiuTianLiWuPanel();
            UIEventsRegisterManager.registerUI(this._qiuTianLiWuPanel,QiuTianLiWuPanel);
         }
         return this._qiuTianLiWuPanel;
      }
      
      public function get shuangShiHuoDongPanel() : ShuangShiHuoDongPanel
      {
         if(this._shuangShiHuoDongPanel == null)
         {
            this._shuangShiHuoDongPanel = new ShuangShiHuoDongPanel();
            UIEventsRegisterManager.registerUI(this._shuangShiHuoDongPanel,ShuangShiHuoDongPanel);
         }
         return this._shuangShiHuoDongPanel;
      }
      
      public function get yingjiefunvjiePanel() : YingjiefunvjiePanel
      {
         if(this._yingjiefunvjiePanel == null)
         {
            this._yingjiefunvjiePanel = new YingjiefunvjiePanel();
            UIEventsRegisterManager.registerUI(this._yingjiefunvjiePanel,YingjiefunvjiePanel);
         }
         return this._yingjiefunvjiePanel;
      }
      
      public function get zhouyikuailePanel() : ZhouyikuailePanel
      {
         if(this._zhouyikuailePanel == null)
         {
            this._zhouyikuailePanel = new ZhouyikuailePanel();
            UIEventsRegisterManager.registerUI(this._zhouyikuailePanel,ZhouyikuailePanel);
         }
         return this._zhouyikuailePanel;
      }
      
      public function get zhoumorenaoPanel() : ZhoumorenaoPanel
      {
         if(this._zhoumorenaoPanel == null)
         {
            this._zhoumorenaoPanel = new ZhoumorenaoPanel();
            UIEventsRegisterManager.registerUI(this._zhoumorenaoPanel,ZhoumorenaoPanel);
         }
         return this._zhoumorenaoPanel;
      }
      
      public function get bajiguiyuanhufudakongPanel() : BajiguiyuanhufuDakongPanel
      {
         if(this._bajiguiyuanhufudakongPanel == null)
         {
            this._bajiguiyuanhufudakongPanel = new BajiguiyuanhufuDakongPanel();
            UIEventsRegisterManager.registerUI(this._bajiguiyuanhufudakongPanel,BajiguiyuanhufuDakongPanel);
         }
         return this._bajiguiyuanhufudakongPanel;
      }
      
      public function get gongFaYouHuiPanel() : GongFaYouHuiPanel
      {
         if(this._gongFaYouHuiPanel == null)
         {
            this._gongFaYouHuiPanel = new GongFaYouHuiPanel();
            UIEventsRegisterManager.registerUI(this._gongFaYouHuiPanel,GongFaYouHuiPanel);
         }
         return this._gongFaYouHuiPanel;
      }
      
      public function get wanShengYePanel() : WanShengJie2018Panel
      {
         if(this._2018wanShengYePanel == null)
         {
            this._2018wanShengYePanel = new WanShengJie2018Panel();
            UIEventsRegisterManager.registerUI(this._2018wanShengYePanel,WanShengJie2018Panel);
         }
         return this._2018wanShengYePanel;
      }
      
      public function get baoShiYangChengPanel() : BaoShiYangChengPanel
      {
         if(this._baoShiYangChengPanel == null)
         {
            this._baoShiYangChengPanel = new BaoShiYangChengPanel();
            UIEventsRegisterManager.registerUI(this._baoShiYangChengPanel,BaoShiYangChengPanel);
         }
         return this._baoShiYangChengPanel;
      }
      
      public function get meiRiChongZhiPanel() : MeiRiChongZhiPanel
      {
         if(this._meiRiChongZhiPanel == null)
         {
            this._meiRiChongZhiPanel = new MeiRiChongZhiPanel();
            UIEventsRegisterManager.registerUI(this._meiRiChongZhiPanel,MeiRiChongZhiPanel);
         }
         return this._meiRiChongZhiPanel;
      }
      
      public function get xingXingPaiHangPanel() : XingXingPaiHangPanel
      {
         if(this._xingXingPaiHangPanel == null)
         {
            this._xingXingPaiHangPanel = new XingXingPaiHangPanel();
            UIEventsRegisterManager.registerUI(this._xingXingPaiHangPanel,XingXingPaiHangPanel);
         }
         return this._xingXingPaiHangPanel;
      }
      
      public function get shengRiZhouQiPanel2018() : ShengRiZhouQiPanel
      {
         if(this._shengRiZhouQiPanel2018 == null)
         {
            this._shengRiZhouQiPanel2018 = new ShengRiZhouQiPanel();
            UIEventsRegisterManager.registerUI(this._shengRiZhouQiPanel2018,ShengRiZhouQiPanel);
         }
         return this._shengRiZhouQiPanel2018;
      }
      
      public function get shengRiYuKuaiPanel() : ShengRiYuKuaiPanel
      {
         if(this._shengRiYuKuaiPanel == null)
         {
            this._shengRiYuKuaiPanel = new ShengRiYuKuaiPanel();
            UIEventsRegisterManager.registerUI(this._shengRiYuKuaiPanel,ShengRiYuKuaiPanel);
         }
         return this._shengRiYuKuaiPanel;
      }
      
      public function get shiTuLieShouPanel() : ShiTuLieShouPanel
      {
         if(this._shiTuLieShouPanel == null)
         {
            this._shiTuLieShouPanel = new ShiTuLieShouPanel();
            UIEventsRegisterManager.registerUI(this._shiTuLieShouPanel,ShiTuLieShouPanel);
         }
         return this._shiTuLieShouPanel;
      }
      
      public function get shiTuJiePanel() : ShiTuJiePanel
      {
         if(this._shiTuJiePanel == null)
         {
            this._shiTuJiePanel = new ShiTuJiePanel();
            UIEventsRegisterManager.registerUI(this._shiTuJiePanel,ShiTuJiePanel);
         }
         return this._shiTuJiePanel;
      }
      
      public function get teShuLeiJi() : TeShuLeiJiPanel
      {
         if(this._teShuLeiJi == null)
         {
            this._teShuLeiJi = new TeShuLeiJiPanel();
            UIEventsRegisterManager.registerUI(this._teShuLeiJi,TeShuLeiJiPanel);
         }
         return this._teShuLeiJi;
      }
      
      public function get tebierizi() : TeBieRiZiPanel
      {
         if(this._tebierizi == null)
         {
            this._tebierizi = new TeBieRiZiPanel();
            UIEventsRegisterManager.registerUI(this._tebierizi,TeBieRiZiPanel);
         }
         return this._tebierizi;
      }
      
      public function get shengDanLeiJi() : ShengDanLeiJiPanel
      {
         if(this._shengDanLeiJi == null)
         {
            this._shengDanLeiJi = new ShengDanLeiJiPanel();
            UIEventsRegisterManager.registerUI(this._shengDanLeiJi,ShengDanLeiJiPanel);
         }
         return this._shengDanLeiJi;
      }
      
      public function get shengDanKuaiLe() : ShengDanKuaiLePanel
      {
         if(this._shengDanKuaiLe == null)
         {
            this._shengDanKuaiLe = new ShengDanKuaiLePanel();
            UIEventsRegisterManager.registerUI(this._shengDanKuaiLe,ShengDanKuaiLePanel);
         }
         return this._shengDanKuaiLe;
      }
      
      public function get shengDanHuoDong() : ShengDanHuoDongPanel
      {
         if(this._shengDanHuoDong == null)
         {
            this._shengDanHuoDong = new ShengDanHuoDongPanel();
            UIEventsRegisterManager.registerUI(this._shengDanHuoDong,ShengDanHuoDongPanel);
         }
         return this._shengDanHuoDong;
      }
      
      public function get xingZhuXinNian() : XingZhuXinNianPanel
      {
         if(this._xingZhuXinNian == null)
         {
            this._xingZhuXinNian = new XingZhuXinNianPanel();
            UIEventsRegisterManager.registerUI(this._xingZhuXinNian,XingZhuXinNianPanel);
         }
         return this._xingZhuXinNian;
      }
      
      public function get nianDi2018Dong() : NianDi2018Panel
      {
         if(this._nianDi2018Dong == null)
         {
            this._nianDi2018Dong = new NianDi2018Panel();
            UIEventsRegisterManager.registerUI(this._nianDi2018Dong,NianDi2018Panel);
         }
         return this._nianDi2018Dong;
      }
      
      public function get liangTianLeiJi() : LiangTianLeiJiPanel
      {
         if(this._liangTianLeiJi == null)
         {
            this._liangTianLeiJi = new LiangTianLeiJiPanel();
            UIEventsRegisterManager.registerUI(this._liangTianLeiJi,LiangTianLeiJiPanel);
         }
         return this._liangTianLeiJi;
      }
      
      public function get jiangHuZhanPanel() : JiangHuZhanPanel
      {
         if(this._jiangHuZhanPanel == null)
         {
            this._jiangHuZhanPanel = new JiangHuZhanPanel();
            UIEventsRegisterManager.registerUI(this._jiangHuZhanPanel,JiangHuZhanPanel);
         }
         return this._jiangHuZhanPanel;
      }
      
      public function get qiTianLeiJi() : QiTianLeiJiPanel
      {
         if(this._qiTianLeiJi == null)
         {
            this._qiTianLeiJi = new QiTianLeiJiPanel();
            UIEventsRegisterManager.registerUI(this._qiTianLeiJi,QiTianLeiJiPanel);
         }
         return this._qiTianLeiJi;
      }
      
      public function get zhuangWangGuiTianPanel() : ZhuangWangGuiTianPanel
      {
         if(this._zhuangWangGuiTianPanel == null)
         {
            this._zhuangWangGuiTianPanel = new ZhuangWangGuiTianPanel();
            UIEventsRegisterManager.registerUI(this._zhuangWangGuiTianPanel,ZhuangWangGuiTianPanel);
         }
         return this._zhuangWangGuiTianPanel;
      }
      
      public function get zhuangWangCiShuPanel() : ZhuangWangCiShuPanel
      {
         if(this._zhuangWangCiShuPanel == null)
         {
            this._zhuangWangCiShuPanel = new ZhuangWangCiShuPanel();
            UIEventsRegisterManager.registerUI(this._zhuangWangCiShuPanel,ZhuangWangCiShuPanel);
         }
         return this._zhuangWangCiShuPanel;
      }
      
      public function get zhuangWangJiePanel() : ZhuangWangJiePanel
      {
         if(this._zhuangWangJiePanel == null)
         {
            this._zhuangWangJiePanel = new ZhuangWangJiePanel();
            UIEventsRegisterManager.registerUI(this._zhuangWangJiePanel,ZhuangWangJiePanel);
         }
         return this._zhuangWangJiePanel;
      }
      
      public function get xinShouLeiJiPanel() : XinShouLeiJiPanel
      {
         if(this._xinShouLeiJiPanel == null)
         {
            this._xinShouLeiJiPanel = new XinShouLeiJiPanel();
            UIEventsRegisterManager.registerUI(this._xinShouLeiJiPanel,XinShouLeiJiPanel);
         }
         return this._xinShouLeiJiPanel;
      }
      
      public function get chunTianLeiJiPanel() : ChunTianLeiJiPanel
      {
         if(this._chunTianLeiJiPanel == null)
         {
            this._chunTianLeiJiPanel = new ChunTianLeiJiPanel();
            UIEventsRegisterManager.registerUI(this._chunTianLeiJiPanel,ChunTianLeiJiPanel);
         }
         return this._chunTianLeiJiPanel;
      }
      
      public function get chuYi2019Panel() : ChuYi2019Panel
      {
         if(this._chuYi2019Panel == null)
         {
            this._chuYi2019Panel = new ChuYi2019Panel();
            UIEventsRegisterManager.registerUI(this._chuYi2019Panel,ChuYi2019Panel);
         }
         return this._chuYi2019Panel;
      }
      
      public function get chuEr2019Panel() : ChuEr2019Panel
      {
         if(this._chuEr2019Panel == null)
         {
            this._chuEr2019Panel = new ChuEr2019Panel();
            UIEventsRegisterManager.registerUI(this._chuEr2019Panel,ChuEr2019Panel);
         }
         return this._chuEr2019Panel;
      }
      
      public function get chuSan2019Panel() : ChuSan2019Panel
      {
         if(this._chuSan2019Panel == null)
         {
            this._chuSan2019Panel = new ChuSan2019Panel();
            UIEventsRegisterManager.registerUI(this._chuSan2019Panel,ChuSan2019Panel);
         }
         return this._chuSan2019Panel;
      }
      
      public function get qingRenJie2019Panel() : QingRenJie2019Panel
      {
         if(this._qingRenJie2019Panel == null)
         {
            this._qingRenJie2019Panel = new QingRenJie2019Panel();
            UIEventsRegisterManager.registerUI(this._qingRenJie2019Panel,QingRenJie2019Panel);
         }
         return this._qingRenJie2019Panel;
      }
      
      public function get lieShouPaiHangPanel() : LieShouPaiHangPanel
      {
         if(this._lieShouPaiHangPanel == null)
         {
            this._lieShouPaiHangPanel = new LieShouPaiHangPanel();
            UIEventsRegisterManager.registerUI(this._lieShouPaiHangPanel,LieShouPaiHangPanel);
         }
         return this._lieShouPaiHangPanel;
      }
      
      public function get yiTianLeiJiPanel() : YiTianLeiJiPanel
      {
         if(this._yiTianLeiJiPanel == null)
         {
            this._yiTianLeiJiPanel = new YiTianLeiJiPanel();
            UIEventsRegisterManager.registerUI(this._yiTianLeiJiPanel,YiTianLeiJiPanel);
         }
         return this._yiTianLeiJiPanel;
      }
      
      public function get fuNvJieHeLi() : FuNvJieHeLiPanel
      {
         if(this._fuNvJieHeLi == null)
         {
            this._fuNvJieHeLi = new FuNvJieHeLiPanel();
            UIEventsRegisterManager.registerUI(this._fuNvJieHeLi,FuNvJieHeLiPanel);
         }
         return this._fuNvJieHeLi;
      }
      
      public function get fuNvJiePaiHang() : FuNvJiePaiHangPanel
      {
         if(this._fuNvJiePaiHang == null)
         {
            this._fuNvJiePaiHang = new FuNvJiePaiHangPanel();
            UIEventsRegisterManager.registerUI(this._fuNvJiePaiHang,FuNvJiePaiHangPanel);
         }
         return this._fuNvJiePaiHang;
      }
      
      public function get baiSeQingRenJiePanel() : BaiSeQingRenJiePanel
      {
         if(this._baiSeQingRenJiePanel == null)
         {
            this._baiSeQingRenJiePanel = new BaiSeQingRenJiePanel();
            UIEventsRegisterManager.registerUI(this._baiSeQingRenJiePanel,BaiSeQingRenJiePanel);
         }
         return this._baiSeQingRenJiePanel;
      }
      
      public function get baoShiDuanLian() : BaoShiDuanLian
      {
         if(this._baoShiDuanLian == null)
         {
            this._baoShiDuanLian = new BaoShiDuanLian();
            UIEventsRegisterManager.registerUI(this._baoShiDuanLian,BaoShiDuanLian);
         }
         return this._baoShiDuanLian;
      }
      
      public function get lieShouPaiHang2Panel() : LieShouPaiHang2Panel
      {
         if(this._lieShouPaiHang2Panel == null)
         {
            this._lieShouPaiHang2Panel = new LieShouPaiHang2Panel();
            UIEventsRegisterManager.registerUI(this._lieShouPaiHang2Panel,LieShouPaiHang2Panel);
         }
         return this._lieShouPaiHang2Panel;
      }
      
      public function get yuRenJie2019Panel() : YuRenJie2019Panel
      {
         if(this._yuRenJie2019Panel == null)
         {
            this._yuRenJie2019Panel = new YuRenJie2019Panel();
            UIEventsRegisterManager.registerUI(this._yuRenJie2019Panel,YuRenJie2019Panel);
         }
         return this._yuRenJie2019Panel;
      }
      
      public function get hanShiJie2019Panel() : HanShiJie2019Panel
      {
         if(this._hanShiJie2019Panel == null)
         {
            this._hanShiJie2019Panel = new HanShiJie2019Panel();
            UIEventsRegisterManager.registerUI(this._hanShiJie2019Panel,HanShiJie2019Panel);
         }
         return this._hanShiJie2019Panel;
      }
      
      public function get zhiZunShenBaoPanel() : ZhiZunShenBaoPanel
      {
         if(this._zhiZunShenBaoPanel == null)
         {
            this._zhiZunShenBaoPanel = new ZhiZunShenBaoPanel();
            UIEventsRegisterManager.registerUI(this._zhiZunShenBaoPanel,ZhiZunShenBaoPanel);
         }
         return this._zhiZunShenBaoPanel;
      }
      
      public function get xiongWangJie2019Panel() : XiongWangJiePanel
      {
         if(this._xiongWangJie2019Panel == null)
         {
            this._xiongWangJie2019Panel = new XiongWangJiePanel();
            UIEventsRegisterManager.registerUI(this._xiongWangJie2019Panel,XiongWangJiePanel);
         }
         return this._xiongWangJie2019Panel;
      }
      
      public function get yingJieDaLiPanel() : YingJieDaLiPanel
      {
         if(this._yingJieDaLiPanel == null)
         {
            this._yingJieDaLiPanel = new YingJieDaLiPanel();
            UIEventsRegisterManager.registerUI(this._yingJieDaLiPanel,YingJieDaLiPanel);
         }
         return this._yingJieDaLiPanel;
      }
      
      public function get shengGanHuiPanel() : ShengGanHuiPanel
      {
         if(this._shengGanHuiPanel == null)
         {
            this._shengGanHuiPanel = new ShengGanHuiPanel();
            UIEventsRegisterManager.registerUI(this._shengGanHuiPanel,ShengGanHuiPanel);
         }
         return this._shengGanHuiPanel;
      }
      
      public function get erTongJiePanel() : ErTongJie2019Panel
      {
         if(this._erTongJiePanel == null)
         {
            this._erTongJiePanel = new ErTongJie2019Panel();
            UIEventsRegisterManager.registerUI(this._erTongJiePanel,ErTongJie2019Panel);
         }
         return this._erTongJiePanel;
      }
      
      public function get liuYueDi2019() : LiuYueDi2019Panel
      {
         if(this._liuYueDi2019 == null)
         {
            this._liuYueDi2019 = new LiuYueDi2019Panel();
            UIEventsRegisterManager.registerUI(this._liuYueDi2019,LiuYueDi2019Panel);
         }
         return this._liuYueDi2019;
      }
      
      public function get duanlianPanel() : DuanLianPanel
      {
         if(this._duanlianPanel == null)
         {
            this._duanlianPanel = new DuanLianPanel();
            UIEventsRegisterManager.registerUI(this._duanlianPanel,DuanLianPanel);
         }
         return this._duanlianPanel;
      }
      
      public function get qiYueDi2019() : QiYueDi2019Panel
      {
         if(this._qiYueDi2019 == null)
         {
            this._qiYueDi2019 = new QiYueDi2019Panel();
            UIEventsRegisterManager.registerUI(this._qiYueDi2019,QiYueDi2019Panel);
         }
         return this._qiYueDi2019;
      }
      
      public function get qixijie2019() : QiXiJie2019Panel
      {
         if(this._qixijie2019 == null)
         {
            this._qixijie2019 = new QiXiJie2019Panel();
            UIEventsRegisterManager.registerUI(this._qixijie2019,QiXiJie2019Panel);
         }
         return this._qixijie2019;
      }
      
      public function get shuangquan() : ShuangQuanPanel
      {
         if(this._shuangquan == null)
         {
            this._shuangquan = new ShuangQuanPanel();
            UIEventsRegisterManager.registerUI(this._shuangquan,ShuangQuanPanel);
         }
         return this._shuangquan;
      }
      
      public function get npcDialogXunhua() : NPCDialogPanel
      {
         if(this._npcDialogXunhua == null)
         {
            this._npcDialogXunhua = new NPCDialogPanel();
            UIEventsRegisterManager.registerUI(this._npcDialogXunhua,NPCDialogPanel);
         }
         return this._npcDialogXunhua;
      }
      
      public function get lianXuDengLuPanel() : LianXuDengLuPanel
      {
         if(this._lianXuDengLuPanel == null)
         {
            this._lianXuDengLuPanel = new LianXuDengLuPanel();
            UIEventsRegisterManager.registerUI(this._lianXuDengLuPanel,LianXuDengLuPanel);
         }
         return this._lianXuDengLuPanel;
      }
      
      public function get teBieHuoDong() : TeBieHuoDongPanel
      {
         if(this._teBieHuoDong == null)
         {
            this._teBieHuoDong = new TeBieHuoDongPanel();
            UIEventsRegisterManager.registerUI(this._teBieHuoDong,TeBieHuoDongPanel);
         }
         return this._teBieHuoDong;
      }
      
      public function get guoqingjie2019() : GuoQingJie2019Panel
      {
         if(this._guoqingjie2019 == null)
         {
            this._guoqingjie2019 = new GuoQingJie2019Panel();
            UIEventsRegisterManager.registerUI(this._guoqingjie2019,GuoQingJie2019Panel);
         }
         return this._guoqingjie2019;
      }
      
      public function get bayueyouhui2019() : BaYueYouHuiPanel
      {
         if(this._bayueyouhui2019 == null)
         {
            this._bayueyouhui2019 = new BaYueYouHuiPanel();
            UIEventsRegisterManager.registerUI(this._bayueyouhui2019,BaYueYouHuiPanel);
         }
         return this._bayueyouhui2019;
      }
      
      public function get xiongzhanbang() : XiongZhanBangPanel
      {
         if(this._xiongzhanbang == null)
         {
            this._xiongzhanbang = new XiongZhanBangPanel();
            UIEventsRegisterManager.registerUI(this._xiongzhanbang,XiongZhanBangPanel);
         }
         return this._xiongzhanbang;
      }
      
      public function get zhongqiushangyue() : ZhongQiuShangYuePanel
      {
         if(this._zhongqiushangyue == null)
         {
            this._zhongqiushangyue = new ZhongQiuShangYuePanel();
            UIEventsRegisterManager.registerUI(this._zhongqiushangyue,ZhongQiuShangYuePanel);
         }
         return this._zhongqiushangyue;
      }
      
      public function get shiwutianyouhui() : ShiWuTianYouHuiPanel
      {
         if(this._shiwutianyouhui == null)
         {
            this._shiwutianyouhui = new ShiWuTianYouHuiPanel();
            UIEventsRegisterManager.registerUI(this._shiwutianyouhui,ShiWuTianYouHuiPanel);
         }
         return this._shiwutianyouhui;
      }
      
      public function get yuenanfunvjie() : YueNanFuNvJiePanel
      {
         if(this._yuenanfunvjie == null)
         {
            this._yuenanfunvjie = new YueNanFuNvJiePanel();
            UIEventsRegisterManager.registerUI(this._yuenanfunvjie,YueNanFuNvJiePanel);
         }
         return this._yuenanfunvjie;
      }
      
      public function get vip() : VIP
      {
         if(this._vip == null)
         {
            this._vip = new VIP();
            UIEventsRegisterManager.registerUI(this._vip,VIP);
         }
         return this._vip;
      }
      
      public function get xianmozhiluPanel() : XianMoZhiLuPanel
      {
         if(this._xianmozhiluPanel == null)
         {
            this._xianmozhiluPanel = new XianMoZhiLuPanel();
            UIEventsRegisterManager.registerUI(this._xianmozhiluPanel,XianMoZhiLuPanel);
         }
         return this._xianmozhiluPanel;
      }
      
      public function get xianmozhilu_zhongzu_Panel() : ZhongZuJieMianPanel
      {
         if(this._xianmozhilu_zhongzu_Panel == null)
         {
            this._xianmozhilu_zhongzu_Panel = new ZhongZuJieMianPanel();
            UIEventsRegisterManager.registerUI(this._xianmozhilu_zhongzu_Panel,ZhongZuJieMianPanel);
         }
         return this._xianmozhilu_zhongzu_Panel;
      }
      
      public function get aojianfeishengPanel() : AoJianFeiShengPanel
      {
         if(this._aojianfeishengPanel == null)
         {
            this._aojianfeishengPanel = new AoJianFeiShengPanel();
            UIEventsRegisterManager.registerUI(this._aojianfeishengPanel,AoJianFeiShengPanel);
         }
         return this._aojianfeishengPanel;
      }
      
      public function get aojianzhuanshengPanel() : AoJianZhuanShengPanel
      {
         if(this._aojianzhuanshengPanel == null)
         {
            this._aojianzhuanshengPanel = new AoJianZhuanShengPanel();
            UIEventsRegisterManager.registerUI(this._aojianzhuanshengPanel,AoJianZhuanShengPanel);
         }
         return this._aojianzhuanshengPanel;
      }
      
      public function get xianmowudajiPanel() : XianMoWuDaJiPanel
      {
         if(this._xianmowudajiPanel == null)
         {
            this._xianmowudajiPanel = new XianMoWuDaJiPanel();
            UIEventsRegisterManager.registerUI(this._xianmowudajiPanel,XianMoWuDaJiPanel);
         }
         return this._xianmowudajiPanel;
      }
      
      public function get wanshengjie2019Panel() : WanShengJie2019Panel
      {
         if(this._wanshengjie2019Panel == null)
         {
            this._wanshengjie2019Panel = new WanShengJie2019Panel();
            UIEventsRegisterManager.registerUI(this._wanshengjie2019Panel,WanShengJie2019Panel);
         }
         return this._wanshengjie2019Panel;
      }
      
      public function get huodong1120Panel() : HuoDong1120Panel
      {
         if(this._huodong1120Panel == null)
         {
            this._huodong1120Panel = new HuoDong1120Panel();
            UIEventsRegisterManager.registerUI(this._huodong1120Panel,HuoDong1120Panel);
         }
         return this._huodong1120Panel;
      }
      
      public function get daZheKouPanel() : DaZheKouPanel
      {
         if(this._daZheKouPanel == null)
         {
            this._daZheKouPanel = new DaZheKouPanel();
            UIEventsRegisterManager.registerUI(this._daZheKouPanel,DaZheKouPanel);
         }
         return this._daZheKouPanel;
      }
      
      public function get jingYingLeiJiPanel() : JingYingLeiJiPanel
      {
         if(this._jingYingLeiJiPanel == null)
         {
            this._jingYingLeiJiPanel = new JingYingLeiJiPanel();
            UIEventsRegisterManager.registerUI(this._jingYingLeiJiPanel,JingYingLeiJiPanel);
         }
         return this._jingYingLeiJiPanel;
      }
      
      public function get baNianZhiMengPanel() : BaNianZhiMengPanel
      {
         if(this._baNianZhiMengPanel == null)
         {
            this._baNianZhiMengPanel = new BaNianZhiMengPanel();
            UIEventsRegisterManager.registerUI(this._baNianZhiMengPanel,BaNianZhiMengPanel);
         }
         return this._baNianZhiMengPanel;
      }
      
      public function get shuang12Panel() : Shuang12Panel
      {
         if(this._shuang12Panel == null)
         {
            this._shuang12Panel = new Shuang12Panel();
            UIEventsRegisterManager.registerUI(this._shuang12Panel,Shuang12Panel);
         }
         return this._shuang12Panel;
      }
      
      public function get shenDanDaZhanPanel() : NPCDialogPanel_ShengDanDaZhan
      {
         if(this._shenDanDaZhanPanel == null)
         {
            this._shenDanDaZhanPanel = new NPCDialogPanel_ShengDanDaZhan();
            UIEventsRegisterManager.registerUI(this._shenDanDaZhanPanel,NPCDialogPanel_ShengDanDaZhan);
         }
         return this._shenDanDaZhanPanel;
      }
      
      public function get shenDanJie2019Panel() : ShengDanJie2019Panel
      {
         if(this._shenDanJie2019Panel == null)
         {
            this._shenDanJie2019Panel = new ShengDanJie2019Panel();
            UIEventsRegisterManager.registerUI(this._shenDanJie2019Panel,ShengDanJie2019Panel);
         }
         return this._shenDanJie2019Panel;
      }
      
      public function get nianDi2019Panel() : NianDi2019Panel
      {
         if(this._nianDi2019Panel == null)
         {
            this._nianDi2019Panel = new NianDi2019Panel();
            UIEventsRegisterManager.registerUI(this._nianDi2019Panel,NianDi2019Panel);
         }
         return this._nianDi2019Panel;
      }
      
      public function get xinNianKuaiLe2019Panel() : XinNianKuaiLe2019Panel
      {
         if(this._xinNianKuaiLe2019Panel == null)
         {
            this._xinNianKuaiLe2019Panel = new XinNianKuaiLe2019Panel();
            UIEventsRegisterManager.registerUI(this._xinNianKuaiLe2019Panel,XinNianKuaiLe2019Panel);
         }
         return this._xinNianKuaiLe2019Panel;
      }
      
      public function get xiaonianjiePanel() : XiaoNianJiePanel
      {
         if(this._xiaonianjiePanel == null)
         {
            this._xiaonianjiePanel = new XiaoNianJiePanel();
            UIEventsRegisterManager.registerUI(this._xiaonianjiePanel,XiaoNianJiePanel);
         }
         return this._xiaonianjiePanel;
      }
      
      public function get chuntuanyuanPanel() : ChunTuanYuanPanel
      {
         if(this._chuntuanyuanPanel == null)
         {
            this._chuntuanyuanPanel = new ChunTuanYuanPanel();
            UIEventsRegisterManager.registerUI(this._chuntuanyuanPanel,ChunTuanYuanPanel);
         }
         return this._chuntuanyuanPanel;
      }
      
      public function get chunjieyi() : ChunJieYiPanel
      {
         if(this._chunjieyi == null)
         {
            this._chunjieyi = new ChunJieYiPanel();
            UIEventsRegisterManager.registerUI(this._chunjieyi,ChunJieYiPanel);
         }
         return this._chunjieyi;
      }
      
      public function get chunjieer() : ChunJieErPanel
      {
         if(this._chunjieer == null)
         {
            this._chunjieer = new ChunJieErPanel();
            UIEventsRegisterManager.registerUI(this._chunjieer,ChunJieErPanel);
         }
         return this._chunjieer;
      }
      
      public function get chunjiesan() : ChunJieSanPanel
      {
         if(this._chunjiesan == null)
         {
            this._chunjiesan = new ChunJieSanPanel();
            UIEventsRegisterManager.registerUI(this._chunjiesan,ChunJieSanPanel);
         }
         return this._chunjiesan;
      }
      
      public function get xinchunyinglu() : XinChunYingLuPanel
      {
         if(this._xinchunyinglu == null)
         {
            this._xinchunyinglu = new XinChunYingLuPanel();
            UIEventsRegisterManager.registerUI(this._xinchunyinglu,XinChunYingLuPanel);
         }
         return this._xinchunyinglu;
      }
      
      public function get yuanxiaojie2019() : YuanXiaoJie2019Panel
      {
         if(this._yuanxiaojie2019 == null)
         {
            this._yuanxiaojie2019 = new YuanXiaoJie2019Panel();
            UIEventsRegisterManager.registerUI(this._yuanxiaojie2019,YuanXiaoJie2019Panel);
         }
         return this._yuanxiaojie2019;
      }
      
      public function get qingrenjie2020() : QingRenJie2020Panel
      {
         if(this._qingrenjie2020 == null)
         {
            this._qingrenjie2020 = new QingRenJie2020Panel();
            UIEventsRegisterManager.registerUI(this._qingrenjie2020,QingRenJie2020Panel);
         }
         return this._qingrenjie2020;
      }
      
      public function get sanbajie2020() : SanBaJie2020Panel
      {
         if(this._sanbajie2020 == null)
         {
            this._sanbajie2020 = new SanBaJie2020Panel();
            UIEventsRegisterManager.registerUI(this._sanbajie2020,SanBaJie2020Panel);
         }
         return this._sanbajie2020;
      }
      
      public function get baise2020() : BaiSe2020Panel
      {
         if(this._baise2020 == null)
         {
            this._baise2020 = new BaiSe2020Panel();
            UIEventsRegisterManager.registerUI(this._baise2020,BaiSe2020Panel);
         }
         return this._baise2020;
      }
      
      public function get xiongwang2020() : XiongWang2020Panel
      {
         if(this._xiongwang2020 == null)
         {
            this._xiongwang2020 = new XiongWang2020Panel();
            UIEventsRegisterManager.registerUI(this._xiongwang2020,XiongWang2020Panel);
         }
         return this._xiongwang2020;
      }
      
      public function get guangrongdariPanel() : GuangRongDaRiPanel
      {
         if(this._guangrongdariPanel == null)
         {
            this._guangrongdariPanel = new GuangRongDaRiPanel();
            UIEventsRegisterManager.registerUI(this._guangrongdariPanel,GuangRongDaRiPanel);
         }
         return this._guangrongdariPanel;
      }
      
      public function get leijizhengxiongPanel() : LeiJiZhengXiongPanel
      {
         if(this._leijizhengxiongPanel == null)
         {
            this._leijizhengxiongPanel = new LeiJiZhengXiongPanel();
            UIEventsRegisterManager.registerUI(this._leijizhengxiongPanel,LeiJiZhengXiongPanel);
         }
         return this._leijizhengxiongPanel;
      }
      
      public function get qianggou16Panel() : QiangGou16Panel
      {
         if(this._qianggou16Panel == null)
         {
            this._qianggou16Panel = new QiangGou16Panel();
            UIEventsRegisterManager.registerUI(this._qianggou16Panel,QiangGou16Panel);
         }
         return this._qianggou16Panel;
      }
      
      public function get duanwusanwangPanel() : DuanWuSanWangPanel
      {
         if(this._duanwusanwangPanel == null)
         {
            this._duanwusanwangPanel = new DuanWuSanWangPanel();
            UIEventsRegisterManager.registerUI(this._duanwusanwangPanel,DuanWuSanWangPanel);
         }
         return this._duanwusanwangPanel;
      }
      
      public function get diwanglihePanel() : DiWangLiHePanel
      {
         if(this._diwanglihePanel == null)
         {
            this._diwanglihePanel = new DiWangLiHePanel();
            UIEventsRegisterManager.registerUI(this._diwanglihePanel,DiWangLiHePanel);
         }
         return this._diwanglihePanel;
      }
      
      public function get diwanglihe2Panel() : DiWangLiHe2Panel
      {
         if(this._diwanglihe2Panel == null)
         {
            this._diwanglihe2Panel = new DiWangLiHe2Panel();
            UIEventsRegisterManager.registerUI(this._diwanglihe2Panel,DiWangLiHe2Panel);
         }
         return this._diwanglihe2Panel;
      }
      
      public function get tianxiaqizhenPanel() : TianXiaQiZhenPanel
      {
         if(this._tianxiaqizhenPanel == null)
         {
            this._tianxiaqizhenPanel = new TianXiaQiZhenPanel();
            UIEventsRegisterManager.registerUI(this._tianxiaqizhenPanel,TianXiaQiZhenPanel);
         }
         return this._tianxiaqizhenPanel;
      }
      
      public function get tianxiaqizhen2Panel() : TianXiaQiZhen2Panel
      {
         if(this._tianxiaqizhen2Panel == null)
         {
            this._tianxiaqizhen2Panel = new TianXiaQiZhen2Panel();
            UIEventsRegisterManager.registerUI(this._tianxiaqizhen2Panel,TianXiaQiZhen2Panel);
         }
         return this._tianxiaqizhen2Panel;
      }
      
      public function get xinshouqizhen1Panel() : XinShouQiZhen1Panel
      {
         if(this._xinshouqizhen1Panel == null)
         {
            this._xinshouqizhen1Panel = new XinShouQiZhen1Panel();
            UIEventsRegisterManager.registerUI(this._xinshouqizhen1Panel,XinShouQiZhen1Panel);
         }
         return this._xinshouqizhen1Panel;
      }
      
      public function get xinshouqizhen2Panel() : XinShouQiZhen2Panel
      {
         if(this._xinshouqizhen2Panel == null)
         {
            this._xinshouqizhen2Panel = new XinShouQiZhen2Panel();
            UIEventsRegisterManager.registerUI(this._xinshouqizhen2Panel,XinShouQiZhen2Panel);
         }
         return this._xinshouqizhen2Panel;
      }
      
      public function get xinshouqizhen3Panel() : XinShouQiZhen3Panel
      {
         if(this._xinshouqizhen3Panel == null)
         {
            this._xinshouqizhen3Panel = new XinShouQiZhen3Panel();
            UIEventsRegisterManager.registerUI(this._xinshouqizhen3Panel,XinShouQiZhen3Panel);
         }
         return this._xinshouqizhen3Panel;
      }
      
      public function get xinshouqizhen4Panel() : XinShouQiZhen4Panel
      {
         if(this._xinshouqizhen4Panel == null)
         {
            this._xinshouqizhen4Panel = new XinShouQiZhen4Panel();
            UIEventsRegisterManager.registerUI(this._xinshouqizhen4Panel,XinShouQiZhen4Panel);
         }
         return this._xinshouqizhen4Panel;
      }
      
      public function get zhongqiuwanluPanel() : ZhongQiuWanLuPanel
      {
         if(this._zhongqiuwanluPanel == null)
         {
            this._zhongqiuwanluPanel = new ZhongQiuWanLuPanel();
            UIEventsRegisterManager.registerUI(this._zhongqiuwanluPanel,ZhongQiuWanLuPanel);
         }
         return this._zhongqiuwanluPanel;
      }
      
      public function get menpaijuexuePanel() : MenPaiJueXue
      {
         if(this._menpaijuexuePanel == null)
         {
            this._menpaijuexuePanel = new MenPaiJueXue();
            UIEventsRegisterManager.registerUI(this._menpaijuexuePanel,MenPaiJueXue);
         }
         return this._menpaijuexuePanel;
      }
      
      public function get menpaineifaPanel() : MenPaiNeiFa
      {
         if(this._menpaineifaPanel == null)
         {
            this._menpaineifaPanel = new MenPaiNeiFa();
            UIEventsRegisterManager.registerUI(this._menpaineifaPanel,MenPaiNeiFa);
         }
         return this._menpaineifaPanel;
      }
      
      public function get yuanwu() : YuanwuPanel
      {
         if(this._yuanwu == null)
         {
            this._yuanwu = new YuanwuPanel();
            UIEventsRegisterManager.registerUI(this._yuanwu,YuanwuPanel);
         }
         return this._yuanwu;
      }
      
      public function get targetyuanwu() : TargetYuanwuPanel
      {
         if(this._targetyuanwu == null)
         {
            this._targetyuanwu = new TargetYuanwuPanel();
            UIEventsRegisterManager.registerUI(this._targetyuanwu,TargetYuanwuPanel);
         }
         return this._targetyuanwu;
      }
      
      public function get yuanwuhexin() : YuanwuHeXinPanel
      {
         if(this._yuanwuhexin == null)
         {
            this._yuanwuhexin = new YuanwuHeXinPanel();
            UIEventsRegisterManager.registerUI(this._yuanwuhexin,YuanwuHeXinPanel);
         }
         return this._yuanwuhexin;
      }
      
      public function get jiuJieXingTuPanel() : JiuJieXingTuPanel
      {
         if(this._jiuJieXingTuPanel == null)
         {
            this._jiuJieXingTuPanel = new JiuJieXingTuPanel();
            UIEventsRegisterManager.registerUI(this._jiuJieXingTuPanel,JiuJieXingTuPanel);
         }
         return this._jiuJieXingTuPanel;
      }
      
      public function get jiuJieXingTuBoxPanel() : JiuJieXingTu_BoxView
      {
         if(this._jiuJieXingTuBoxPanel == null)
         {
            this._jiuJieXingTuBoxPanel = new JiuJieXingTu_BoxView();
            UIEventsRegisterManager.registerUI(this._jiuJieXingTuBoxPanel,JiuJieXingTu_BoxView);
         }
         return this._jiuJieXingTuBoxPanel;
      }
      
      public function get xinniandajiPanel() : XinNianDaJiPanel
      {
         if(this._xinniandajiPanel == null)
         {
            this._xinniandajiPanel = new XinNianDaJiPanel();
            UIEventsRegisterManager.registerUI(this._xinniandajiPanel,XinNianDaJiPanel);
         }
         return this._xinniandajiPanel;
      }
      
      public function get wanshiruyiPanel() : WanShiRuYiPanel
      {
         if(this._wanshiruyiPanel == null)
         {
            this._wanshiruyiPanel = new WanShiRuYiPanel();
            UIEventsRegisterManager.registerUI(this._wanshiruyiPanel,WanShiRuYiPanel);
         }
         return this._wanshiruyiPanel;
      }
      
      public function get ankangxingwangPanel() : AnKangXingWangPanel
      {
         if(this._ankangxingwangPanel == null)
         {
            this._ankangxingwangPanel = new AnKangXingWangPanel();
            UIEventsRegisterManager.registerUI(this._ankangxingwangPanel,AnKangXingWangPanel);
         }
         return this._ankangxingwangPanel;
      }
      
      public function get cailugungunPanel() : CaiLuGunGunPanel
      {
         if(this._cailugungunPanel == null)
         {
            this._cailugungunPanel = new CaiLuGunGunPanel();
            UIEventsRegisterManager.registerUI(this._cailugungunPanel,CaiLuGunGunPanel);
         }
         return this._cailugungunPanel;
      }
      
      public function get shuangsiyouhuiPanel() : ShuangSiYouHuiPanel
      {
         if(this._shuangsiyouhuiPanel == null)
         {
            this._shuangsiyouhuiPanel = new ShuangSiYouHuiPanel();
            UIEventsRegisterManager.registerUI(this._shuangsiyouhuiPanel,ShuangSiYouHuiPanel);
         }
         return this._shuangsiyouhuiPanel;
      }
      
      public function get tehui2021Panel() : TeHui2021Panel
      {
         if(this._tehui2021Panel == null)
         {
            this._tehui2021Panel = new TeHui2021Panel();
            UIEventsRegisterManager.registerUI(this._tehui2021Panel,TeHui2021Panel);
         }
         return this._tehui2021Panel;
      }
      
      public function get xinshouzhanPanel() : XinShouZhanPanel
      {
         if(this._xianshouzhanPanel == null)
         {
            this._xianshouzhanPanel = new XinShouZhanPanel();
            UIEventsRegisterManager.registerUI(this._xianshouzhanPanel,XinShouZhanPanel);
         }
         return this._xianshouzhanPanel;
      }
      
      public function get shengjifuliPanel() : ShengJieDaHuiKuiPanel
      {
         if(this._shengjifuliPanel == null)
         {
            this._shengjifuliPanel = new ShengJieDaHuiKuiPanel();
            UIEventsRegisterManager.registerUI(this._shengjifuliPanel,ShengJieDaHuiKuiPanel);
         }
         return this._shengjifuliPanel;
      }
      
      public function get qitianlianxudenglu2022Panel() : LianXuDengLu7Tian2022Panel
      {
         if(this._qitianlianxudenglu2022Panel == null)
         {
            this._qitianlianxudenglu2022Panel = new LianXuDengLu7Tian2022Panel();
            UIEventsRegisterManager.registerUI(this._qitianlianxudenglu2022Panel,LianXuDengLu7Tian2022Panel);
         }
         return this._qitianlianxudenglu2022Panel;
      }
      
      public function get tebieleichong2022Panel() : TeBieLeiChong2022Panel
      {
         if(this._tebieleichong2022Panel == null)
         {
            this._tebieleichong2022Panel = new TeBieLeiChong2022Panel();
            UIEventsRegisterManager.registerUI(this._tebieleichong2022Panel,TeBieLeiChong2022Panel);
         }
         return this._tebieleichong2022Panel;
      }
      
      public function get wuhunxitongPanel() : WuHunPanel
      {
         if(this._wuhunxitongPanel == null)
         {
            this._wuhunxitongPanel = new WuHunPanel();
            UIEventsRegisterManager.registerUI(this._wuhunxitongPanel,WuHunPanel);
         }
         return this._wuhunxitongPanel;
      }
      
      public function get chunJieSiPanel() : ChunJieSiPanel
      {
         if(this._chunJieSiPanel == null)
         {
            this._chunJieSiPanel = new ChunJieSiPanel();
            UIEventsRegisterManager.registerUI(this._chunJieSiPanel,ChunJieSiPanel);
         }
         return this._chunJieSiPanel;
      }
      
      public function get laYue28Panel() : LaYue28Panel
      {
         if(this._laYue28Panel == null)
         {
            this._laYue28Panel = new LaYue28Panel();
            UIEventsRegisterManager.registerUI(this._laYue28Panel,LaYue28Panel);
         }
         return this._laYue28Panel;
      }
      
      public function get laYue29Panel() : LaYue29Panel
      {
         if(this._laYue29Panel == null)
         {
            this._laYue29Panel = new LaYue29Panel();
            UIEventsRegisterManager.registerUI(this._laYue29Panel,LaYue29Panel);
         }
         return this._laYue29Panel;
      }
      
      public function get laYue30Panel() : LaYue30Panel
      {
         if(this._laYue30Panel == null)
         {
            this._laYue30Panel = new LaYue30Panel();
            UIEventsRegisterManager.registerUI(this._laYue30Panel,LaYue30Panel);
         }
         return this._laYue30Panel;
      }
      
      public function get zhenPinZhiMengPanel() : ZhenPinZhiMengPanel
      {
         if(this._zhenPinZhiMengPanel == null)
         {
            this._zhenPinZhiMengPanel = new ZhenPinZhiMengPanel();
            UIEventsRegisterManager.registerUI(this._zhenPinZhiMengPanel,ZhenPinZhiMengPanel);
         }
         return this._zhenPinZhiMengPanel;
      }
      
      public function get caipiaoshowPanel() : CaiPiaoShowPanel
      {
         if(this._caipiaoshowPanel == null)
         {
            this._caipiaoshowPanel = new CaiPiaoShowPanel();
            UIEventsRegisterManager.registerUI(this._caipiaoshowPanel,CaiPiaoShowPanel);
         }
         return this._caipiaoshowPanel;
      }
      
      public function get letouPanel() : LeTouPanel
      {
         if(this._letouPanel == null)
         {
            this._letouPanel = new LeTouPanel();
            UIEventsRegisterManager.registerUI(this._letouPanel,LeTouPanel);
         }
         return this._letouPanel;
      }
      
      public function get leiChongLiWuPanel() : LeiChongLiWuPanel
      {
         if(this._leiChongLiWuPanel == null)
         {
            this._leiChongLiWuPanel = new LeiChongLiWuPanel();
            UIEventsRegisterManager.registerUI(this._leiChongLiWuPanel,LeiChongLiWuPanel);
         }
         return this._leiChongLiWuPanel;
      }
      
      public function get lianXuLeiChongPanel() : LianXuLeiChongPanel
      {
         if(this._lianXuLeiChongPanel == null)
         {
            this._lianXuLeiChongPanel = new LianXuLeiChongPanel();
            UIEventsRegisterManager.registerUI(this._lianXuLeiChongPanel,LianXuLeiChongPanel);
         }
         return this._lianXuLeiChongPanel;
      }
      
      public function get tianJiangBaoXiangPanel() : TianJiangBaoXiangPanel
      {
         if(this._tianJiangBaoXiangPanel == null)
         {
            this._tianJiangBaoXiangPanel = new TianJiangBaoXiangPanel();
            UIEventsRegisterManager.registerUI(this._tianJiangBaoXiangPanel,TianJiangBaoXiangPanel);
         }
         return this._tianJiangBaoXiangPanel;
      }
      
      public function get daYanLiWuPanel() : DaYanLiWuPanel
      {
         if(this._daYanLiWuPanel == null)
         {
            this._daYanLiWuPanel = new DaYanLiWuPanel();
            UIEventsRegisterManager.registerUI(this._daYanLiWuPanel,DaYanLiWuPanel);
         }
         return this._daYanLiWuPanel;
      }
      
      public function get zheKouShangDianPanel() : ZheKouShangDianPanel
      {
         if(this._zheKouShangDianPanel == null)
         {
            this._zheKouShangDianPanel = new ZheKouShangDianPanel();
            UIEventsRegisterManager.registerUI(this._zheKouShangDianPanel,ZheKouShangDianPanel);
         }
         return this._zheKouShangDianPanel;
      }
      
      public function get xiaoQiaoPanel() : XiaoQiaoPanel
      {
         if(this._xiaoQiaoPanel == null)
         {
            this._xiaoQiaoPanel = new XiaoQiaoPanel();
            UIEventsRegisterManager.registerUI(this._xiaoQiaoPanel,XiaoQiaoPanel);
         }
         return this._xiaoQiaoPanel;
      }
      
      public function get xinShangXianPanel() : XinShangXianPanel
      {
         if(this._xinShangXianPanel == null)
         {
            this._xinShangXianPanel = new XinShangXianPanel();
            UIEventsRegisterManager.registerUI(this._xinShangXianPanel,XinShangXianPanel);
         }
         return this._xinShangXianPanel;
      }
      
      public function get zhuangBeiHuanYuanPanel() : ZhuangBeiHuanYuanPanel
      {
         if(this._zhuangBeiHuanYuanPanel == null)
         {
            this._zhuangBeiHuanYuanPanel = new ZhuangBeiHuanYuanPanel();
            UIEventsRegisterManager.registerUI(this._zhuangBeiHuanYuanPanel,ZhuangBeiHuanYuanPanel);
         }
         return this._zhuangBeiHuanYuanPanel;
      }
      
      public function get shiErZhouNianQingZhuPanel() : ShiErZhouNianQingZhuPanel
      {
         if(this._shiErZhouNianQingZhuPanel == null)
         {
            this._shiErZhouNianQingZhuPanel = new ShiErZhouNianQingZhuPanel();
            UIEventsRegisterManager.registerUI(this._shiErZhouNianQingZhuPanel,ShiErZhouNianQingZhuPanel);
         }
         return this._shiErZhouNianQingZhuPanel;
      }
      
      public function get zongLeiJiPanel() : ZongLeiJiPanel
      {
         if(this._zongLeiJiPanel == null)
         {
            this._zongLeiJiPanel = new ZongLeiJiPanel();
            UIEventsRegisterManager.registerUI(this._zongLeiJiPanel,ZongLeiJiPanel);
         }
         return this._zongLeiJiPanel;
      }
      
      public function get liDongJiePanel() : LiDongJie2023Panel
      {
         if(this._liDongJiePanel == null)
         {
            this._liDongJiePanel = new LiDongJie2023Panel();
            UIEventsRegisterManager.registerUI(this._liDongJiePanel,LiDongJie2023Panel);
         }
         return this._liDongJiePanel;
      }
      
      public function get liDongLeiJiPanel() : LiDongLeiJi2023Panel
      {
         if(this._liDongLeiJiPanel == null)
         {
            this._liDongLeiJiPanel = new LiDongLeiJi2023Panel();
            UIEventsRegisterManager.registerUI(this._liDongLeiJiPanel,LiDongLeiJi2023Panel);
         }
         return this._liDongLeiJiPanel;
      }
      
      public function get dengLuLingJiangPanel() : DengLuLingJiangV632Panel
      {
         if(this._dengLuLingJiangPanel == null)
         {
            this._dengLuLingJiangPanel = new DengLuLingJiangV632Panel();
            UIEventsRegisterManager.registerUI(this._dengLuLingJiangPanel,DengLuLingJiangV632Panel);
         }
         return this._dengLuLingJiangPanel;
      }
      
      public function get xueRenBaoZangPanel() : XueRenBaoZangPanel
      {
         if(this._xueRenBaoZangPanel == null)
         {
            this._xueRenBaoZangPanel = new XueRenBaoZangPanel();
            UIEventsRegisterManager.registerUI(this._xueRenBaoZangPanel,XueRenBaoZangPanel);
         }
         return this._xueRenBaoZangPanel;
      }
      
      public function get zheKouShang20240116Dian() : ZheKouShangDian20240116Panel
      {
         if(this._zheKouShang20240116Dian == null)
         {
            this._zheKouShang20240116Dian = new ZheKouShangDian20240116Panel();
            UIEventsRegisterManager.registerUI(this._zheKouShang20240116Dian,ZheKouShangDian20240116Panel);
         }
         return this._zheKouShang20240116Dian;
      }
      
      public function get maChaoPanel() : MaChaoPanel
      {
         if(this._maChaoPanel == null)
         {
            this._maChaoPanel = new MaChaoPanel();
            UIEventsRegisterManager.registerUI(this._maChaoPanel,MaChaoPanel);
         }
         return this._maChaoPanel;
      }
      
      public function get caoJunPanel() : CaoJunPanel
      {
         if(this._caoJunPanel == null)
         {
            this._caoJunPanel = new CaoJunPanel();
            UIEventsRegisterManager.registerUI(this._caoJunPanel,CaoJunPanel);
         }
         return this._caoJunPanel;
      }
      
      public function get youHui2888Panel() : YouHui2888Panel
      {
         if(this._youHui2888Panel == null)
         {
            this._youHui2888Panel = new YouHui2888Panel();
            UIEventsRegisterManager.registerUI(this._youHui2888Panel,YouHui2888Panel);
         }
         return this._youHui2888Panel;
      }
      
      public function get zhenPinZhiMengVariantPanel() : ZhenPinZhiMengVariantPanel
      {
         if(this._zhenPinZhiMengVariantPanel == null)
         {
            this._zhenPinZhiMengVariantPanel = new ZhenPinZhiMengVariantPanel();
            UIEventsRegisterManager.registerUI(this._zhenPinZhiMengVariantPanel,ZhenPinZhiMengVariantPanel);
         }
         return this._zhenPinZhiMengVariantPanel;
      }
      
      public function get teBieShangDianPanel() : TeBieShangDianPanel
      {
         if(this._teBieShangDianPanel == null)
         {
            this._teBieShangDianPanel = new TeBieShangDianPanel();
            UIEventsRegisterManager.registerUI(this._teBieShangDianPanel,TeBieShangDianPanel);
         }
         return this._teBieShangDianPanel;
      }
      
      public function get meiriyouhguiPanel() : MeiRiYouHuiPanel
      {
         if(this._meiriyouhguiPanel == null)
         {
            this._meiriyouhguiPanel = new MeiRiYouHuiPanel();
            UIEventsRegisterManager.registerUI(this._meiriyouhguiPanel,MeiRiYouHuiPanel);
         }
         return this._meiriyouhguiPanel;
      }
   }
}

