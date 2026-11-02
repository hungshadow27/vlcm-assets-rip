package com.tgame
{
   import com.tgame.moudels.BeiMingShenGong.BeiMingShenGong_ApplicationFacade;
   import com.tgame.moudels.ChristmasRank.ChristmasRank_ApplicationFacade;
   import com.tgame.moudels.ChuanGongWuXue.ChuanGongWuXue_ApplicationFacade;
   import com.tgame.moudels.Fashion.Fashion_ApplicationFacade;
   import com.tgame.moudels.JiuYangShenGong.JiuYangShenGong_ApplicationFacade;
   import com.tgame.moudels.TaiXuanShenGong.TaiXuanShenGong_ApplicationFacade;
   import com.tgame.moudels.TianJiangXiangRui.TianJiangXiangRui_ApplicationFacade;
   import com.tgame.moudels.VIP.VIP_ApplicationFacade;
   import com.tgame.moudels.WoHuCangLong.WoHuCangLong_ApplicationFacade;
   import com.tgame.moudels.XiSuiJing.XiSuiJing_ApplicationFacade;
   import com.tgame.moudels.XiangLong.XiangLong_ApplicationFacade;
   import com.tgame.moudels.aojianfeisheng.AoJianFeiSheng_ApplicationFacade;
   import com.tgame.moudels.aojianshenjiangji.AoJianShenJiangJi_ApplicationFacade;
   import com.tgame.moudels.aojianzhengba.AojianZhengba_ApplicationFacade;
   import com.tgame.moudels.aojianzhuansheng.AoJianZhuanSheng_ApplicationFacade;
   import com.tgame.moudels.aojianzhuzao.AoJianZhuZao_ApplicationFacade;
   import com.tgame.moudels.baguazhang.BaGuaZhang_ApplicationFacade;
   import com.tgame.moudels.baguazhen.BaGuaZhen_ApplicationFacade;
   import com.tgame.moudels.bangpairongyutarget.BangPaiRongYuTarget_ApplicationFacade;
   import com.tgame.moudels.baoshijianshang.BaoShiJianShang_ApplicationFacade;
   import com.tgame.moudels.bazhentu.BaZhenTu_ApplicationFacade;
   import com.tgame.moudels.beiDouQiXingZhen.BeiDouQiXingZhen_ApplicationFacade;
   import com.tgame.moudels.bihaichaoshengqu.BiHaiChaoShengQu_ApplicationFacade;
   import com.tgame.moudels.biwuCrossP.BiwuCrossP_ApplicationFacade;
   import com.tgame.moudels.biwuzhaoqin.BiWuZhaoQin_ApplicationFacade;
   import com.tgame.moudels.buchangfuben.BuchangFuben_ApplicationFacade;
   import com.tgame.moudels.cangjianxuantian.CangJianXuanTian_ApplicationFacade;
   import com.tgame.moudels.cangjingge.Cangjingge_ApplicationFacade;
   import com.tgame.moudels.canhezhi.CanHeZhi_ApplicationFacade;
   import com.tgame.moudels.changSheZhen.ChangSheZhen_ApplicationFacade;
   import com.tgame.moudels.changshengjue.ChangShengJue_ApplicationFacade;
   import com.tgame.moudels.chaojilaba.ChaoJiLaBa_ApplicationFacade;
   import com.tgame.moudels.chiBang.ChiBang_ApplicationFacade;
   import com.tgame.moudels.chixuemozhen.ChiXueMoZhen_ApplicationFacade;
   import com.tgame.moudels.cisha.CiSha_ApplicationFacade;
   import com.tgame.moudels.cuqiankungfu.CuQianKungFu_ApplicationFacade;
   import com.tgame.moudels.dantiaowang.DanTiaoWang_ApplicationFacade;
   import com.tgame.moudels.dizaizhen.DiZaiZhen_ApplicationFacade;
   import com.tgame.moudels.dongxiao.Dongxiao_ApplicationFacade;
   import com.tgame.moudels.douZhuanXingYi.DouZhuanXingYi_ApplicationFacade;
   import com.tgame.moudels.doudizhu.DouDiZhu_ApplicationFacade;
   import com.tgame.moudels.duanwujie.DuanWuJie_ApplicationFacade;
   import com.tgame.moudels.duanwujie2015.DuanWuJie2015_ApplicationFacade;
   import com.tgame.moudels.dugujiujian.Dugujiujian_ApplicationFacade;
   import com.tgame.moudels.duguqiubai.DuGuQiuBai_ApplicationFacade;
   import com.tgame.moudels.duixueren.DuiXueRen_ApplicationFacade;
   import com.tgame.moudels.duomingshisanjian.DuoMingShiSanJian_ApplicationFacade;
   import com.tgame.moudels.emozhiyi.EMoZhiYi_ApplicationFacade;
   import com.tgame.moudels.fabao.Fabao_ApplicationFacade;
   import com.tgame.moudels.feast.Feast_ApplicationFacade;
   import com.tgame.moudels.feilongtanyunshou.FeiLongTanYunShou_ApplicationFacade;
   import com.tgame.moudels.fengyangzhen.FengYangZhen_ApplicationFacade;
   import com.tgame.moudels.fengzhengjie.FengZhengJie_ApplicationFacade;
   import com.tgame.moudels.fuWenKeHua.FuWenKeHua_ApplicationFacade;
   import com.tgame.moudels.fumozhangfa.FuMoZhangFa_ApplicationFacade;
   import com.tgame.moudels.ganjiangmoye.GanJiangMoYe_ApplicationFacade;
   import com.tgame.moudels.ganjiangmoyezhuzao.GanJiangMoYeZhuZao_ApplicationFacade;
   import com.tgame.moudels.gerenchenghao.GeRenChengHao_ApplicationFacade;
   import com.tgame.moudels.guiliuzhen.GuiLiuZhen_ApplicationFacade;
   import com.tgame.moudels.hamagong.HaMaGong_ApplicationFacade;
   import com.tgame.moudels.hanbingshenzhang.HanBingShenZhang_ApplicationFacade;
   import com.tgame.moudels.heYiZhen.HeYiZhen_ApplicationFacade;
   import com.tgame.moudels.huangjinshu.HuangJinShu_ApplicationFacade;
   import com.tgame.moudels.huangtubaye.HuangTuBaYe_ApplicationFacade;
   import com.tgame.moudels.huashanlunjian.Huashanlunjian_ApplicationFacade;
   import com.tgame.moudels.hutaozhen.HuTaoZhen_ApplicationFacade;
   import com.tgame.moudels.huyijuexing.HuYiJueXing_ApplicationFacade;
   import com.tgame.moudels.jianghun.JiangHun_ApplicationFacade;
   import com.tgame.moudels.jiangshanshejishizhixinxi.JiangShangSheJiShiZHiXinXI_ApplicationFacade;
   import com.tgame.moudels.jinSheJianFa.JinSheJianFa_ApplicationFacade;
   import com.tgame.moudels.jinchantuoqiao.JinChanTuoQiao_ApplicationFacade;
   import com.tgame.moudels.jingangfumoquan.Jingangfumoquan_ApplicationFacade;
   import com.tgame.moudels.jingleiqiang.JingLeiQiang_ApplicationFacade;
   import com.tgame.moudels.jinzhongzhao.Jinzhongzhao_ApplicationFacade;
   import com.tgame.moudels.jiuquhuanghezhen.JiuQuHuangHeZhen_ApplicationFacade;
   import com.tgame.moudels.jiuyinzhenjing.JiuYinZhenJing_ApplicationFacade;
   import com.tgame.moudels.jubaopen.JuBaoPen_ApplicationFacade;
   import com.tgame.moudels.jueZhanGuangMingDing.JueZhanGuangMingDing_ApplicationFacade;
   import com.tgame.moudels.kongmingquan.KongMingQuan_ApplicationFacade;
   import com.tgame.moudels.kuafu3v3.Kuafu3v3_ApplicationFacade;
   import com.tgame.moudels.kuafuLeitai.KuafuLeitai_ApplicationFacade;
   import com.tgame.moudels.kuafuzhan.Kuafuzhan_ApplicationFacade;
   import com.tgame.moudels.langhundun.LangHunDun_ApplicationFacade;
   import com.tgame.moudels.lianQi.LianQi_ApplicationFacade;
   import com.tgame.moudels.lianti.Lianti_ApplicationFacade;
   import com.tgame.moudels.liekongjuexing.LieKongJueXing_ApplicationFacade;
   import com.tgame.moudels.lingxiyizhi.LingXiYiZhi_ApplicationFacade;
   import com.tgame.moudels.liumaishenjian.Liumaishenjian_ApplicationFacade;
   import com.tgame.moudels.longfengdangpu.LongFengDangPu_ApplicationFacade;
   import com.tgame.moudels.longwenkehua.LongWenKeHua_ApplicationFacade;
   import com.tgame.moudels.longyajuexing.LongYaJueXing_ApplicationFacade;
   import com.tgame.moudels.longyinjuexing.LongYinJueXing_ApplicationFacade;
   import com.tgame.moudels.luoyingshenjianzhang.LuoYingShenJianZhang_ApplicationFacade;
   import com.tgame.moudels.meiren.MeiRen_ApplicationFacade;
   import com.tgame.moudels.menpaiequipchange.PartyEquipChange_ApplicationFacade;
   import com.tgame.moudels.menpaijuexue.MenPaiJueXue_ApplicationFacade;
   import com.tgame.moudels.menpaineifa.MenPaiNeiFa_ApplicationFacade;
   import com.tgame.moudels.menpaizhuanhuan.PartyChange_ApplicationFacade;
   import com.tgame.moudels.mingyugong.MingYuGong_ApplicationFacade;
   import com.tgame.moudels.molingzhiyi.MoLingZhiYi_ApplicationFacade;
   import com.tgame.moudels.moshouzhanchang.MoShouZhanChang_ApplicationFacade;
   import com.tgame.moudels.moxuezhanchang.MoXueZhanChang_ApplicationFacade;
   import com.tgame.moudels.newyear.NewYear_ApplicationFacade;
   import com.tgame.moudels.niaoxiangzhen.NiaoXiangZhen_ApplicationFacade;
   import com.tgame.moudels.orangeEquip.OrangeEquip_ApplicationFacade;
   import com.tgame.moudels.pangxiezhen.PangXieZhen_ApplicationFacade;
   import com.tgame.moudels.partyTask.PartyTask_ApplicationFacade;
   import com.tgame.moudels.qimenzhen.QiMenZhen_ApplicationFacade;
   import com.tgame.moudels.qingdieshuangren.QingDieShuangRen_ApplicationFacade;
   import com.tgame.moudels.qinggongyan.QingGongYan_ApplicationFacade;
   import com.tgame.moudels.qingrenjie.QingRenJieSongHua_ApplicationFacade;
   import com.tgame.moudels.qingrenjiesonghuabang.QingRenJieSongHuaBang_ApplicationFacade;
   import com.tgame.moudels.qinlonggong.QinLongGong_ApplicationFacade;
   import com.tgame.moudels.qishangquan.QiShangQuan_ApplicationFacade;
   import com.tgame.moudels.qishazhen.QiShaZhen_ApplicationFacade;
   import com.tgame.moudels.qixi.QiXiJie_ApplicationFacade;
   import com.tgame.moudels.quanshenjuexing.QuanShenJueXing_ApplicationFacade;
   import com.tgame.moudels.reName.Rename_ApplicationFacade;
   import com.tgame.moudels.rijinlun.Rijinlun_ApplicationFacade;
   import com.tgame.moudels.rulaishenzhang.RuLaiShenZhang_ApplicationFacade;
   import com.tgame.moudels.sanshiliushou.SanShiLiuShou_ApplicationFacade;
   import com.tgame.moudels.shangdian.Shangdian_ApplicationFacade;
   import com.tgame.moudels.shendiaoxialv.ShenDiaoXiaLv_ApplicationFacade;
   import com.tgame.moudels.shengsifu.ShengSiFu_ApplicationFacade;
   import com.tgame.moudels.shengxiaotiaozhan.Shengxiao_ApplicationFacade;
   import com.tgame.moudels.shenxingbaibian.ShenXingBaiBian_ApplicationFacade;
   import com.tgame.moudels.shenzhaojing.Shenzhaojing_ApplicationFacade;
   import com.tgame.moudels.shiJieBei.ShiJieBei_ApplicationFacade;
   import com.tgame.moudels.shibatongren.ShiBatongren_ApplicationFacade;
   import com.tgame.moudels.shijianshalou.ShiJianShalou_ApplicationFacade;
   import com.tgame.moudels.shishizhankuang.Shishizhankuang_ApplicationFacade;
   import com.tgame.moudels.shuXingDaZaoKa.ShuXingDaZaoKa_ApplicationFacade;
   import com.tgame.moudels.sijuejianzhen.SiJueJianZhen_ApplicationFacade;
   import com.tgame.moudels.taohuazhen.TaoHuaZhen_ApplicationFacade;
   import com.tgame.moudels.tengtianyi.Tengtianyi_ApplicationFacade;
   import com.tgame.moudels.tianFu.TianFu_ApplicationFacade;
   import com.tgame.moudels.tianMenZhen.TianMenZhen_ApplicationFacade;
   import com.tgame.moudels.tianfuzhen.TianFuZhen_ApplicationFacade;
   import com.tgame.moudels.tianshangzhihun.TianShangZhiHun_ApplicationFacade;
   import com.tgame.moudels.tianshanliuyangzhang.TianShanLiuYangZhang_ApplicationFacade;
   import com.tgame.moudels.tianyuyanmeng.TianYuYanMeng_ApplicationFacade;
   import com.tgame.moudels.timebaozang.TimeBaoZang_ApplicationFacade;
   import com.tgame.moudels.tuTengCard.TuTengCard_ApplicationFacade;
   import com.tgame.moudels.tulongdao.TuLongDao_ApplicationFacade;
   import com.tgame.moudels.tunShiTianDi.TunShiTianDi_ApplicationFacade;
   import com.tgame.moudels.tushidahui.Tushidahui_ApplicationFacade;
   import com.tgame.moudels.wangzhezhibang.Wangzhezhibang_ApplicationFacade;
   import com.tgame.moudels.wanhunzhen.WanHunZhen_ApplicationFacade;
   import com.tgame.moudels.wedding.Wedding_ApplicationFacade;
   import com.tgame.moudels.wishingTree.WishingTree_ApplicationFacade;
   import com.tgame.moudels.woDeMenPai.WoDeMenPai_ApplicationFacade;
   import com.tgame.moudels.woderongyu.WoDeRongYu_ApplicationFacade;
   import com.tgame.moudels.wuduzhen.WuDuZhen_ApplicationFacade;
   import com.tgame.moudels.wuhunxitong.WuHunXiTong_ApplicationFacade;
   import com.tgame.moudels.wuxiakapai.Wuxiakapai_ApplicationFacade;
   import com.tgame.moudels.wuxingquan.Wuxingquan_ApplicationFacade;
   import com.tgame.moudels.wuxingzhen.WuXingZhen_ApplicationFacade;
   import com.tgame.moudels.wuxingzhiren.WuXingZhiRen_ApplicationFacade;
   import com.tgame.moudels.xiakexing.XiaKeXing_ApplicationFacade;
   import com.tgame.moudels.xiangyangzhizhan.XiangYangZhiZhan_ApplicationFacade;
   import com.tgame.moudels.xianmowudaji.XianMoWuDaJi_ApplicationFacade;
   import com.tgame.moudels.xianmozhilu.XianMoZhiLu_ApplicationFacade;
   import com.tgame.moudels.xiantiangong.XianTianGong_ApplicationFacade;
   import com.tgame.moudels.xiaoyaoyufeng.XiaoYaoYuFeng_ApplicationFacade;
   import com.tgame.moudels.xiaozhukuaipao.XiaoZhuKuaiPao_ApplicationFacade;
   import com.tgame.moudels.xingxiuzhen.XingXiuZhen_ApplicationFacade;
   import com.tgame.moudels.xingxiuzhen1.XingXiuZhen1_ApplicationFacade;
   import com.tgame.moudels.xingyunzhuanzhuanle.XingYunZhuanZhuanLe_ApplicationFacade;
   import com.tgame.moudels.xinnianyasuiqian.Xinnianyasuiqian_ApplicationFacade;
   import com.tgame.moudels.xiuwei.XiuWei_ApplicationFacade;
   import com.tgame.moudels.xuanXiangZhen.XuanXiangZhen_ApplicationFacade;
   import com.tgame.moudels.xuantiejianfa.XuanTieJianFa_ApplicationFacade;
   import com.tgame.moudels.xuedaoxinfa.XueDaoXinFa_ApplicationFacade;
   import com.tgame.moudels.xueyinjuexing.XueYinJueXing_ApplicationFacade;
   import com.tgame.moudels.xunzhang.XunZhang_ApplicationFacade;
   import com.tgame.moudels.xunzhangduihuan.XunZhangDuiHuan_ApplicationFacade;
   import com.tgame.moudels.xunzhangyangcheng.XunZhangYangCheng_ApplicationFacade;
   import com.tgame.moudels.xunzhangzhanshi.XunZhangZhanshi_ApplicationFacade;
   import com.tgame.moudels.yanXingZhen.YanXingZhen_ApplicationFacade;
   import com.tgame.moudels.yanYueZhen.YanYueZhen_ApplicationFacade;
   import com.tgame.moudels.yiJinJing.YiJinJing_ApplicationFacade;
   import com.tgame.moudels.yitianjian.YNyitianjian_ApplicationFacade;
   import com.tgame.moudels.yitiantulong.YiTianTuLong_ApplicationFacade;
   import com.tgame.moudels.yn2014zhongqiu.YN2014Zhongqiu_ApplicationFacade;
   import com.tgame.moudels.yn2016newyear.YN2016newyear_ApplicationFacade;
   import com.tgame.moudels.yn2016xingyunzhuanpan.YN2016xingyunzhuanpan_ApplicationFacade;
   import com.tgame.moudels.yn888shop.YN888Shop_ApplicationFacade;
   import com.tgame.moudels.ynAojianzhizao.YNAojianzhizao_ApplicationFacade;
   import com.tgame.moudels.ynChongzhidafa.YNchongzhidafa_ApplicationFacade;
   import com.tgame.moudels.ynHuangdaoZhuanpan.YNhuangdaozhuanpan_ApplicationFacade;
   import com.tgame.moudels.ynJubaopen.YNjubaopen_ApplicationFacade;
   import com.tgame.moudels.ynLianhuanchongzhi.YNlianhuanchongzhi_ApplicationFacade;
   import com.tgame.moudels.ynLiulongzhuangbei.YNliulongzhuangbei_ApplicationFacade;
   import com.tgame.moudels.ynLongwuge.YNlongwuge_ApplicationFacade;
   import com.tgame.moudels.ynLongzhizhufu.YNlongzhizhufu_ApplicationFacade;
   import com.tgame.moudels.ynOnline.YNonline_ApplicationFacade;
   import com.tgame.moudels.ynShijiebei.YNshijiebei_ApplicationFacade;
   import com.tgame.moudels.ynTulongdao.YNtulongdao_ApplicationFacade;
   import com.tgame.moudels.ynZhimengshangcheng.YNzhimengshangcheng_ApplicationFacade;
   import com.tgame.moudels.ynZhuadayu.YNzhuadayu_ApplicationFacade;
   import com.tgame.moudels.ynZongzihuodong.YNzongzi_ApplicationFacade;
   import com.tgame.moudels.yuLiZhen.YuLiZhen_ApplicationFacade;
   import com.tgame.moudels.yuanwu.Yuanwu_Application;
   import com.tgame.moudels.yuejinlun.YueJinLun_ApplicationFacade;
   import com.tgame.moudels.yuncheng.YunCheng_ApplicationFacade;
   import com.tgame.moudels.yunlongzhen.YunLongZhen_ApplicationFacade;
   import com.tgame.moudels.yunvsuxinjianfa.YuNvSuXinJianFa_ApplicationFacade;
   import com.tgame.moudels.yuxiaojianfa.YuXiaoJianFa_ApplicationFacade;
   import com.tgame.moudels.zhanhun.ZhanHun_ApplicationFacade;
   import com.tgame.moudels.zhenlongqiju.ZhenLongQiJu_ApplicationFacade;
   import com.tgame.moudels.zhenwuqijiezhen.ZhenwuQijiezhen_ApplicationFacade;
   import com.tgame.moudels.zhenyanshouyin.Zhenyanshouyin_ApplicationFacade;
   import com.tgame.moudels.zhizhanzhishang.ZhiZhanZhiShang_ApplicationFacade;
   import com.tgame.moudels.zhongQiuJie.ZhongQiuJie_ApplicationFacade;
   import com.tgame.moudels.zhongzhixuanyuanjian.ZhongZhiXuanYuanJian_ApplicationFacade;
   import com.tgame.moudels.zixiashengong.ZiXia_ApplicationFacade;
   import com.tgame.moudels.zunrongwanbaoge.ZunrongWanbaoge_ApplicationFacade;
   
   public class PipeConstants
   {
      
      public static const STARTUP_SHELL:String = "com.tgame.shell.Shell_ApplicationFacade";
      
      public static const STARTUP_MAINUI:String = "com.tgame.moudels.mainui.MainUI_ApplicationFacade";
      
      public static const STARTUP_UI:String = "com.tgame.moudels.ui.UI_ApplicationFacade";
      
      public static const STARTUP_LOADRES:String = "com.tgame.moudels.loadres.LoadRes_ApplicationFacade";
      
      public static const STARTUP_LOGIN:String = "com.tgame.moudels.login.Login_ApplicationFacade";
      
      public static const STARTUP_ENGINE:String = "com.tgame.moudels.engine.Engine_ApplicationFacade";
      
      public static const STARTUP_SCENE:String = "com.tgame.moudels.scene.Scene_ApplicationFacade";
      
      public static const STARTUP_MAINCHAR:String = "com.tgame.moudels.mainchar.MainChar_ApplicationFacade";
      
      public static const STARTUP_CHAR:String = "com.tgame.moudels.char.Char_ApplicationFacade";
      
      public static const STARTUP_FIGHT:String = "com.tgame.moudels.fight.Fight_ApplicationFacade";
      
      public static const STARTUP_BOWARROW:String = "com.tgame.moudels.bowArrow.BowArrow_ApplicationFacade";
      
      public static const STARTUP_NitaCyclone:String = "com.tgame.moudels.nitaCyclone.NitaCyclone_ApplicationFacade";
      
      public static const STARTUP_MINI_MAP:String = "com.tgame.moudels.miniMap.MiniMap_ApplicationFacade";
      
      public static const STARTUP_MOUNT:String = "com.tgame.moudels.mount.Mount_ApplicationFacade";
      
      public static const STARTUP_ITEM:String = "com.tgame.moudels.Item.Item_ApplicationFacade";
      
      public static const STARTUP_EQUIP_PUDDING:String = "com.tgame.moudels.equipPudding.EquipPudding_ApplicationFacade";
      
      public static const STARTUP_ITEM_SYNTHESIZE:String = "com.tgame.moudels.synthesize.Synthesize_ApplicationFacde";
      
      public static const STARTUP_TEAM:String = "com.tgame.moudels.team.Team_ApplicationFacade";
      
      public static const STARTUP_SILINGZHEN:String = "com.tgame.moudels.silingzhen.SiLingZhen_ApplicationFacade";
      
      public static const STARTUP_MALL:String = "com.tgame.moudels.mall.Mall_ApplicationFacade";
      
      public static const STARTUP_FRIEND:String = "com.tgame.moudels.friend.Friend_ApplicationFacade";
      
      public static const STARTUP_SKILL:String = "com.tgame.moudels.skill.Skill_ApplicationFacade";
      
      public static const STARTUP_ATTRIBUTE:String = "com.tgame.moudels.attribute.Attribute_ApplicationFacade";
      
      public static const STARTUP_JINGMAI:String = "com.tgame.moudels.jingmai.Jingmai_ApplicationFacade";
      
      public static const STARTUP_NPC:String = "com.tgame.moudels.npc.Npc_ApplicationFacade";
      
      public static const STARTUP_RANK:String = "com.tgame.moudels.rank.Rank_ApplicationFacade";
      
      public static const STARTUP_TASK:String = "com.tgame.moudels.task.Task_ApplicationFacade";
      
      public static const STARTUP_CHAT:String = "com.tgame.moudels.chat.Chat_ApplicationFacade";
      
      public static const STARTUP_DA_ZUO:String = "com.tgame.moudels.dazuo.DaZuo_ApplicationFacade";
      
      public static const STARTUP_STUDYBTN:String = "com.tgame.moudels.biguan.Biguan_ApplicationFacade";
      
      public static const STARTUP_AFK:String = "com.tgame.moudels.afk.Afk_ApplicationFacade";
      
      public static const STARTUP_GIFT:String = "com.tgame.moudels.gift.Gift_ApplicationFacade";
      
      public static const STARTUP_NEW_PLAYER_GUIDE:String = "com.tgame.moudels.newPlayerGuide.NewPlayerGuide_ApplicationFacade";
      
      public static const STARTUP_PICKUP:String = "com.tgame.moudels.pickup.PickUp_ApplicationFacade";
      
      public static const STARTUP_ACHIEVEMENT:String = "com.tgame.moudels.achievement.Achievement_ApplicationFacade";
      
      public static const STARTUP_TEITCH_GIFT:String = "com.tgame.moudels.twitchGift.TwitchGift_ApplicationFacade";
      
      public static const STARTUP_SETTING:String = "com.tgame.moudels.settings.Setting_ApplicationFacade";
      
      public static const STARTUP_REFRESH_POINT:String = "com.tgame.moudels.refreshPoint.RefreshPoint_ApplicationFacade";
      
      public static const STARTUP_TEAM_INSTANCE:String = "com.tgame.moudels.instance.Instance_ApplicationFacade";
      
      public static const STARTUP_ZHEN_DOLL:String = "com.tgame.moudels.zhenqiDoll.ZhenqiDoll_ApplicationFacade";
      
      public static const STARTUP_SHOUJI:String = "com.tgame.moudels.shouji.Shouji_ApplicationFacade";
      
      public static const STARTUP_BANGHUI:String = "com.tgame.moudels.banghui.Banghui_ApplicationFacade";
      
      public static const STARTUP_STONE:String = "com.tgame.moudels.stone.Stone_ApplicationFacade";
      
      public static const STARTUP_STONE_JIANSHANG:String = "com.tgame.moudels.baoshijianshang.Stone_ApplicationFacade";
      
      public static const STARTUP_MOVING:String = "com.tgame.moudels.moving.Moving_ApplicationFacade";
      
      public static const STARTUP_AMULET:String = "com.tgame.moudels.amulet.Amulet_ApplicationFacade";
      
      public static const STARTUP_WEDDING:String = Wedding_ApplicationFacade.NAME;
      
      public static const STARTUP_FEAST:String = Feast_ApplicationFacade.NAME;
      
      public static const STARTUP_ZHAN_WEN_KE_HUA:String = "com.tgame.moudels.zhanWenKeHua.ZhanWenKeHua_ApplicationFacade";
      
      public static const STARTUP_LIANTI:String = Lianti_ApplicationFacade.NAME;
      
      public static const STARTUP_CANGJINGGE:String = Cangjingge_ApplicationFacade.NAME;
      
      public static const STARTUP_KUAFUZHAN:String = Kuafuzhan_ApplicationFacade.NAME;
      
      public static const STARTUP_KUAFULEITAI:String = KuafuLeitai_ApplicationFacade.NAME;
      
      public static const STARTUP_DUGUJIUJIAN:String = Dugujiujian_ApplicationFacade.NAME;
      
      public static const STARTUP_JIUYANGSHENGONG:String = JiuYangShenGong_ApplicationFacade.NAME;
      
      public static const STARTUP_JIUYINZHENJING:String = JiuYinZhenJing_ApplicationFacade.NAME;
      
      public static const STARTUP_ZIXIASHENGONG:String = ZiXia_ApplicationFacade.NAME;
      
      public static const STARTUP_KUAUF3V3:String = Kuafu3v3_ApplicationFacade.NAME;
      
      public static const STARTUP_SHUXINGDAZAOKA:String = ShuXingDaZaoKa_ApplicationFacade.NAME;
      
      public static const STARTUP_DONGXIAO:String = Dongxiao_ApplicationFacade.NAME;
      
      public static const STARTUP_PARTY_TASK:String = PartyTask_ApplicationFacade.NAME;
      
      public static const STARTUP_TU_TENG_CADE:String = TuTengCard_ApplicationFacade.NAME;
      
      public static const STARTUP_ORANGE_EQUIP:String = OrangeEquip_ApplicationFacade.NAME;
      
      public static const STARTUP_BIWUDAHUI:String = "com.tgame.moudels.biwudahui.Biwudahui_ApplicationFacade";
      
      public static const STARTUP_BIWU_CROSSPLATFORM:String = BiwuCrossP_ApplicationFacade.NAME;
      
      public static const STARTUP_BAOSHIJIANSHANG:String = BaoShiJianShang_ApplicationFacade.NAME;
      
      public static const STARTUP_YIJINJING:String = YiJinJing_ApplicationFacade.NAME;
      
      public static const STARTUP_SHISHIZHANKUANG:String = Shishizhankuang_ApplicationFacade.NAME;
      
      public static const STARTUP_XISUIJING:String = XiSuiJing_ApplicationFacade.NAME;
      
      public static const STARTUP_FEILONGTANYUESHOU:String = FeiLongTanYunShou_ApplicationFacade.NAME;
      
      public static const STARTUP_YUNCHENG:String = YunCheng_ApplicationFacade.NAME;
      
      public static const STARTUP_WUXINGQUAN:String = Wuxingquan_ApplicationFacade.NAME;
      
      public static const STARTUP_XIUWEI:String = XiuWei_ApplicationFacade.NAME;
      
      public static const STARTUP_BEIMINGSHENGONG:String = BeiMingShenGong_ApplicationFacade.NAME;
      
      public static const STARTUP_CISHA:String = CiSha_ApplicationFacade.NAME;
      
      public static const STARTUP_MONTHSIGNIN:String = "com.tgame.moudels.MonthSignIn.MonthSignIn_ApplicationFacade";
      
      public static const STARTUP_TIANSHANGZHIHUN:String = TianShangZhiHun_ApplicationFacade.NAME;
      
      public static const STARTUP_JILEIZHI:String = "com.tgame.moudels.jileizhi.JiLeiZhi_ApplicationFacade";
      
      public static const HIDE_ALL_UI_EXCEPT_MAINUI:String = "HIDE_ALL_UI_EXCEPT_MAINUI";
      
      public static const SHOW_MAINUI:String = "SHOW_MAINUI";
      
      public static const SHOW_MAINCHAR_ATTRIBUTE_PLANE:String = "SHOW_MAINCHAR_ATTRIBUTE_PLANE";
      
      public static const SHOW_MAINCHAR_BACKPACK:String = "SHOW_MAINCHAR_BACKPACK";
      
      public static const SHOW_MAINCHAR_KUNGFU:String = "SHOW_MAINCHAR_KUNGFU";
      
      public static const SHOW_TARGET_CHAR_ATTRIBUTE_PLANE:String = "SHOW_TARGET_CHAR_ATTRIBUTE_PLANE";
      
      public static const SHOW_MAINCHAR_ACCEPT_CYC_TASK_ATTRIBUTE_PLANE:String = "SHOW_MAINCHAR_ACCEPT_CYC_TASK_ATTRIBUTE_PLANE";
      
      public static const SHOW_MAINCHAR_TASK_ATTRIBUTE_PLANE:String = "SHOW_MAINCHAR_TASK_ATTRIBUTE_PLANE";
      
      public static const SHOW_MAINCHAR_TEAM_ATTRIBUTE_PLANE:String = "SHOW_MAINCHAR_TEAM_ATTRIBUTE_PLANE";
      
      public static const SHOW_MAINCHAR_RIDEBTN_PLANE:String = "SHOW_MAINCHAR_RIDEBTN_PLANE";
      
      public static const SHOW_MAINCHAR_RIDE_SKILL_RESET_PLANE:String = "SHOW_MAINCHAR_RIDE_SKILL_RESET_PLANE";
      
      public static const SHOW_MAINCHAR_RIDE_YINCANG_SHUXING_JIHUO_PLANE:String = "SHOW_MAINCHAR_RIDE_YINCANG_SHUXING_JIHUO_PLANE";
      
      public static const SHOW_MAINCHAR_RIDE_QIANNENGDAN_PANEL:String = "SHOW_MAINCHAR_RIDE_QIANNENGDAN_PANEL";
      
      public static const SHOW_EQUIP_PUDDING_PLANE:String = "SHOW_EQUIP_PUDDING_PLANE";
      
      public static const SHOW_RONGXUEDAN_PLANE:String = "SHOW_RONGXUEDAN_PLANE";
      
      public static const SHOW_MENGHUANDAN_PLANE:String = "SHOW_MENGHUANDAN_PLANE";
      
      public static const SHOW_ITEM_SYNTHESIZE_PLANE:String = "SHOW_ITEM_SYNTHESIZE_PLANE";
      
      public static const SHOW_DEPOT_PANEL:String = "SHOW_DEPOT_PANEL";
      
      public static const SHOW_MAINCHAR_SHOP_PANEL:String = "SHOW_MAINCHAR_SHOP_PANEL";
      
      public static const MAIN_SHOW_MAINCHAR_SHOP_PANEL:String = "MAIN_SHOW_MAINCHAR_SHOP_PANEL";
      
      public static const SHOW_OTHERCHAR_SHOP_PANEL:String = "SHOW_OTHERCHAR_SHOP_PANEL";
      
      public static const SHOW_MAINCHAR_SHOP_LIST_PANEL:String = "SHOW_MAINCHAR_SHOP_LIST_PANEL";
      
      public static const UPDATE_AND_SHOW_NPC_DIALOG_PLANE:String = "UPDATE_AND_SHOW_NPC_DIALOG_PLANE";
      
      public static const SHOW_NPC_DIALOG_PLANE:String = "SHOW_NPC_DIALOG_PLANE";
      
      public static const HIDE_NPC_DIALOG_PLANE:String = "HIDE_NPC_DIALOG_PLANE";
      
      public static const CLOSE_EASY_STONE_PLANE:String = "CLOSE_EASY_STONE_PLANE";
      
      public static const SHOW_RANK_PLANE:String = "SHOW_RANK_PLANE";
      
      public static const SHOW_MALL_PLANE:String = "SHOW_MALL_PLANE";
      
      public static const SHOW_FRIEND_PLANE:String = "SHOW_FRIEND_PLANE";
      
      public static const SHOW_RIDE_DEPOT_PANEL:String = "SHOW_RIDE_DEPOT_PANEL";
      
      public static const SHOW_TRADE_PANEL:String = "SHOW_TRADE_PANEL";
      
      public static const SHOW_NPC_SHOP_PANEL:String = "SHOW_NPC_SHOP_PANEL";
      
      public static const SHOW_RIDE_ATTR_PANEL:String = "SHOW_RIDE_ATTR_PANEL";
      
      public static const SHOW_PICK_UP_PLANE:String = "SHOW_PICK_UP_PLANE";
      
      public static const SHOW_BIGUAN_PANEL:String = "SHOW_BIGUAN_PANEL";
      
      public static const HIDE_BIGUAN_PANEL:String = "HIDE_BIGUAN_PANEL";
      
      public static const SHOW_BIWU_CROSSPLATFORM_PANEL:String = "SHOW_BIWU_CROSSPLATFORM_PANEL";
      
      public static const SHOW_GIFT_PLANE:String = "SHOW_GIFT_PLANE";
      
      public static const SHOW_WANJIAHUIKUI:String = "SHOW_WANJIAHUIKUI";
      
      public static const SHOW_SEND_FLOWER_PANEL:String = "SHOW_SEND_FLOWER_PANEL";
      
      public static const SHOW_AFK_PANEL:String = "SHOW_AFK_PANEL";
      
      public static const SHOW_LIAOSHANG_PANEL:String = "SHOW_LIAOSHANG_PANEL";
      
      public static const SHOW_REPAIR_PANEL:String = "SHOW_REPAIR_PANEL";
      
      public static const SHOW_SETTINGS_PANEL_TAB:String = "SHOW_SETTINGS_PANEL_TAB";
      
      public static const SHOW_MAP:String = "SHOW_MAP";
      
      public static const SHOW_EQUIP_UPDATA_TYPE_PANEL:String = "SHOW_EQUIP_UPDATA_TYPE_PANEL";
      
      public static const CHANGE_CHAT_SIZE:String = "CHANGE_CHAT_SIZE";
      
      public static const SHOW_INFOQUERY_PANEL:String = "SHOW_INFOQUERY_PANEL";
      
      public static const SHOW_BOSS_REFURBISH_PANEL:String = "SHOW_BOSS_REFURBISH_PANEL";
      
      public static const SHOW_WAIT_TODO_PANEL:String = "SHOW_WAIT_TODO_PANEL";
      
      public static const SHOW_ACTIVE_PANEL:String = "SHOW_ACTIVE_PANEL";
      
      public static const SHOW_DAZUO_PANEL:String = "SHOW_DAZUO_PANEL";
      
      public static const SHOW_SHUANGXIU_PANEL:String = "SHOW_SHUANGXIU_PANEL";
      
      public static const SHOW_REFRESHPOINT_PLANE:String = "SHOW_REFRESHPOINT_PLANE";
      
      public static const SHOW_MAINCHAR_XINFA_XIULIAN:String = "SHOW_MAINCHAR_XINFA_XIULIAN";
      
      public static const SHOW_CHENGJIU_PANEL:String = "SHOW_CHENGJIU_PANEL";
      
      public static const SHOW_TEAM_INSTANCE_PANEL:String = "SHOW_TEAM_INSTANCE_PANEL";
      
      public static const SHOW_INSTANCE_SELECT_PANEL:String = "SHOW_INSTANCE_SELECT_PANEL";
      
      public static const SHOW_MOUNT_ATTR_PANEL:String = "SHOW_MOUNT_ATTR_PANEL";
      
      public static const SHOW_ZHENQI_DOLL_PANEL:String = "SHOW_ZHENQI_DOLL_PANEL";
      
      public static const SHOW_ZHENQI_DOLL_SUPER_PANEL:String = "SHOW_ZHENQI_DOLL_SUPER_PANEL";
      
      public static const SHOW_SHOUJI_PANEL:String = "SHOW_SHOUJI_PANEL";
      
      public static const SHOW_SQUIRREL_PANEL:String = "SHOW_SQUIRREL_PANEL";
      
      public static const SHOW_BANGHUI_LIST_PANEL:String = "SHOW_BANGHUI_LIST_PANEL";
      
      public static const SHOW_BANGHUI_CREAT_PANEL:String = "SHOW_BANGHUI_CREAT_PANEL";
      
      public static const SHOW_BANGHUI_INFO_PANEL:String = "SHOW_BANGHUI_INFO_PANEL";
      
      public static const SHOW_BANGHUI_MEMBER_LIST_PANEL:String = "SHOW_BANGHUI_MEMBER_LIST_PANEL";
      
      public static const SHOW_BANGHUI_NEWS_PANEL:String = "SHOW_BANGHUI_NEWS_PANEL";
      
      public static const SHOW_BANGQI_INFO_PANEL:String = "SHOW_BANGQI_INFO_PANEL";
      
      public static const SHOW_BANGQI_ANCHA_PANEL:String = "SHOW_BANGQI_ANCHA_PANEL";
      
      public static const SHOW_BANGQI_BANGGONG_PANEL:String = "SHOW_BANGQI_BANGGONG_PANEL";
      
      public static const SHOW_GONGCHENG_XIANGYANGGUISHU_PANEL:String = "SHOW_GONGCHENG_XIANGYANGGUISHU_PANEL";
      
      public static const SHOW_GONGCHENG_GONGCHENGCHE_PANEL:String = "SHOW_GONGCHENG_GONGCHENGCHE_PANEL";
      
      public static const SHOW_STONE_PLANE:String = "SHOW_STONE_PLANE";
      
      public static const SHOW_MOVING_PANEL:String = "SHOW_MOVING_PANEL";
      
      public static const SHOW_EASY_STONE_ADD_TO_EQUIP_PLANE:String = "SHOW_EASY_STONE_ADD_TO_EQUIP_PLANE";
      
      public static const SHOW_FB_RANK_PLANE:String = "SHOW_FB_RANK_PLANE";
      
      public static const SHOW_AMULT:String = "SHOW_AMULT";
      
      public static const SHOW_AMULT_ADD_SHELIZI:String = "SHOW_AMULT_ADD_SHELIZI";
      
      public static const CLOSE_AMULT_ADD_SHELIZI:String = "CLOSE_AMULT_ADD_SHELIZI";
      
      public static const SHOW_SHEN_LONG_AMULT:String = "SHOW_SHEN_LONG_AMULT";
      
      public static const SHOW_PARTY_SKILL:String = "SHOW_PARTY_SKILL";
      
      public static const SHOW_PARTY_TASK:String = "SHOW_PARTY_TASK";
      
      public static const SHOW_ZHAN_WEN_KE_HUA_PANEL:String = "SHOW_ZHAN_WEN_KE_HUA_PANEL";
      
      public static const ZHAN_WEN_KE_HUA_EXPENDGAS_AND_PROBABILITY:String = "ZHAN_WEN_KE_HUA_EXPENDGAS_AND_PROBABILITY";
      
      public static const CLOSE_ZHAN_WEN_KE_HUA_LOAD_BUFF:String = "CLOSE_ZHAN_WEN_KE_HUA_LOAD_BUFF";
      
      public static const SHOW_LAUNCH_PROPOSAL_PANEL:String = "SHOW_LAUNCH_PROPOSAL_PANEL";
      
      public static const SHOW_PROPOSAL_AFFIRM_PANEL:String = "SHOW_PROPOSAL_AFFIRM_PANEL";
      
      public static const SHOW_MARRIAGE_SUCCESS_PANEL:String = "SHOW_MARRIAGE_SUCCESS_PANEL";
      
      public static const SHOW_GOLD_SQUIRREL_GIFT_PLANE:String = "SHOW_GOLD_SQUIRREL_GIFT_PLANE";
      
      public static const SHOW_TA_KUNGFU:String = "SHOW_TA_KUNGFU";
      
      public static const SHOW_TA_JINGMAI_PANEL:String = "SHOW_TA_JINGMAI_PANEL";
      
      public static const SHOW_MARRIAGE_WEDDING_PLANE:String = "SHOW_MARRIAGE_WEDDING_PLANE";
      
      public static const SHOW_MARRIAGE_CASH_GIFT_LIS_PLANE:String = "SHOW_MARRIAGE_CASH_GIFT_LIS_PLANE";
      
      public static const SHOW_MARRIAGE_GIVE_CASH_GIFT_PLANE:String = "SHOW_MARRIAGE_GIVE_CASH_GIFT_PLANE";
      
      public static const SHOW_MARRIAGE_DINE_PLANE:String = "SHOW_MARRIAGE_DINE_PLANE";
      
      public static const SHOW_LABOUR_PANEL:String = "SHOW_LABOUR_PANEL";
      
      public static const SHOW_ANQI_ACTIVE:String = "SHOW_ANQI_ACTIVE";
      
      public static const SHOW_GIFT_CARD_PANEL:String = "SHOW_GIFT_CARD_PANEL";
      
      public static const SHOW_MAINCHAR_KUAFU_BACKPACK:String = "SHOW_MAINCHAR_KUAFU_BACKPACK";
      
      public static const SHOW_WANFASHIYITU_CLICK:String = "SHOW_WANFASHIYITU_CLICK";
      
      public static const SHOW_MAINCHAR_MALL:String = "SHOW_MAINCHAR_MALL";
      
      public static const SHOW_NITA_SKILL:String = "SHOW_NITA_SKILL";
      
      public static const SHOW_SIX_STONE_TO_SEVEN_STONE:String = "SHOW_SIX_STONE_TO_SEVEN_STONE";
      
      public static const SHOW_SILINGZHEN_PANEL:String = "SHOW_SILINGZHEN_PANEL";
      
      public static const SHOW_QIAN_CHUI_BAI_LIAN_PLANE:String = "SHOW_QIAN_CHUI_BAI_LIAN_PLANE";
      
      public static const SHOW_XIAN_TIAN_WU_JING:String = "SHOW_XIAN_TIAN_WU_JING";
      
      public static const SHOW_TEAM_INSTANCE_PANEL_3V3:String = "SHOW_TEAM_INSTANCE_PANEL_3V3";
      
      public static const SHOW_KUAFU3V3_RESULT_PANEL:String = "SHOW_KUAFU3V3_RESULT_PANEL";
      
      public static const SHOW_SHUXINGDAZAOKA_PANEL:String = "SHOW_SHUXINGDAZAOKA_PANEL";
      
      public static const SHOW_WGSJD_PANEL:String = "SHOW_WGSJD_PANEL";
      
      public static const SHOW_PTYHTQK_PANEL:String = "SHOW_PTYHTQK_PANEL";
      
      public static const SHOW_SI_LIN_ZHEN_YIN_CANG_SHU_XING:String = "SHOW_SI_LIN_ZHEN_YIN_CANG_SHU_XING";
      
      public static const SHOW_QIAN_KUN_PU_KE_PANEL:String = "SHOW_QIAN_KUN_PU_KE_PANEL";
      
      public static const SHOW_TU_TENG_CADE:String = "SHOW_TU_TENG_CADE";
      
      public static const SHOW_FREE_MALL_PLANE:String = "SHOW_FREE_MALL_PLANE";
      
      public static const SHOW_ORANGE_EQUIP_PANEL:String = "SHOW_ORANGE_EQUIP_PANEL";
      
      public static const SHOW_CHANGE_SUPER_MOUNT:String = "SHOW_CHANGE_SUPER_MOUNT";
      
      public static const SHOW_JIN_CHUI_ZI_PANEL:String = "SHOW_JIN_CHUI_ZI_PANEL";
      
      public static const SHOW_GUMUMISHI_CHUANSONG_PANEL:String = "SHOW_GUMUMISHI_CHUANSONG_PANEL";
      
      public static const SHOW_RANK_ATTACK_PANEL:String = "SHOW_RANK_ATTACK_PANEL";
      
      public static const SHOW_SHITU_PANEL:String = "SHOW_SHITU_PANEL";
      
      public static const SHOW_JINGYANJIANGLI_PANEL:String = "SHOW_JINGYANJIANGLI_PANEL";
      
      public static const SHOW_WUXIEZHIJING_PANEL:String = "SHOW_WUXIEZHIJING_PANEL";
      
      public static const SHOW_SHEN_LONG_HU_SHEN_FU_DA_KONG:String = "SHOW_SHEN_LONG_HU_SHEN_FU_DA_KONG";
      
      public static const SHOW_BAOSHI_DUANLIAN:String = "SHOW_BAOSHI_DUANLIAN";
      
      public static const SHOW_BAJIGUIYUANHUFU_DA_KONG:String = "SHOW_BAJIGUIYUANHUFU_DA_KONG";
      
      public static const STARTUP_BAGUAZHANG:String = BaGuaZhang_ApplicationFacade.NAME;
      
      public static const SHOW_CHANGE_SUPER_MOUNT_TO_SUPER_MOUNT:String = "SHOW_CHANGE_SUPER_MOUNT_TO_SUPER_MOUNT";
      
      public static const SHOW_MO_SHOU_HU_HUAN:String = "SHOW_MO_SHOU_HU_HUAN";
      
      public static const SHOW_HUYI_KAIGUANG_PANEL:String = "SHOW_HUYI_KAIGUANG_PANEL";
      
      public static const SHOW_HUYI_LINGHUA_PANEL:String = "SHOW_HUYI_LINGHUA_PANEL";
      
      public static const SHOW_HUYI_XILIAN_PANEL:String = "SHOW_HUYI_XILIAN_PANEL";
      
      public static const SHOW_ZHUANGBEI_JIHUO_PANEL:String = "SHOW_ZHUANGBEI_JIHUO_PANEL";
      
      public static const SHOW_BIWUDUIJUE_PANEL:String = "SHOW_BIWUDUIJUE_PANEL";
      
      public static const SHOW_BIWUDUIJUE_CROSSPLATFORM_PANEL:String = "SHOW_BIWUDUIJUE_CROSSPLATFORM_PANEL";
      
      public static const SHOW_BAOSHIJIANSHANG_PANEL:String = "SHOW_BAOSHIJIANSHANG_PANEL";
      
      public static const SHOW_BAOSHIJIANSHANG_GUIZE_PANEL:String = "SHOW_BAOSHIJIANSHANG_GUIZE_PANEL";
      
      public static const SHOW_DAOJUTIQUKA_PANEL:String = "SHOW_DAOJUTIQUKA_PANEL";
      
      public static const USE_ITEM_JIYUAN_UP:String = "USE_ITEM_JIYUAN_UP";
      
      public static const SHOW_HUIZHANG_PANEL:String = "SHOW_HUIZHANG_PANEL";
      
      public static const SHOW_TEAM_INSTANCE_PANEL_XIANGYANGZHANCHANG:String = "SHOW_TEAM_INSTANCE_PANEL_XIANGYANGZHANCHANG";
      
      public static const SHOW_MALL_JI_FEN_PLANE:String = "SHOW_MALL_JI_FEN_PLANE";
      
      public static const SHOW_KUAFU_LEITAI:String = "SHOW_KUAFU_LEITAI";
      
      public static const SHOW_KUAFU_LEITAI_JIEGUO:String = "SHOW_KUAFU_LEITAI_JIEGUO";
      
      public static const LIKAI_KUAFU_LEITAI:String = "LIKAI_KUAFU_LEITAI";
      
      public static const SHOW_XIANSHIDAJIANGDUIHUAN:String = "SHOW_XIANSHIDAJIANGDUIHUAN";
      
      public static const SHOW_ZHANHUNDAI_BAOGUO:String = "SHOW_ZHANHUNDAI_BAOGUO";
      
      public static const ZHANHUNDAI_SHUANGJI_CHUANDAI:String = "ZHANHUNDAI_SHUANGJI_CHUANDAI";
      
      public static const ZHANHUN_XIEXIA:String = "ZHANHUN_XIEXIA";
      
      public static const SHOW_LINE:String = "SHOW_LINE";
      
      public static const CHANGE_LINE:String = "CHANGE_LINE";
      
      public static const ENTER_LINE:String = "ENTER_LINE";
      
      public static const CLIENT_READY:String = "CLIENT_READY";
      
      public static const ENTER_CHAT:String = "ENTER_CHAT";
      
      public static const ENTER_SCENE:String = "ENTER_SCENE";
      
      public static const SHOW_MOXUE_DOLL_PANEL:String = "SHOW_MOXUE_DOLL_PANEL";
      
      public static const LOAD_MAP_CONFIG_COMPLETE:String = "LOAD_MAP_CONFIG_COMPLETE";
      
      public static const LOAD_SMALL_MAP_COMPLETE:String = "SceneEventAction_process.LOAD_SMALL_MAP_COMPLETE";
      
      public static const SET_SMALL_MAP_STATIC_DATA:String = "UPDATA_SMALL_MAP";
      
      public static const TASK_ACCEPT_CMD:String = "TASK_ACCEPT_CMD";
      
      public static const TASK_HANDIN_CMD:String = "TASK_HANDIN_CMD";
      
      public static const TASK_UPDATE_CMD:String = "TASK_UPDATE_CMD";
      
      public static const TASK_UPDATE_TASKLIST:String = "TASK_UPDATE_TASKLIST";
      
      public static const TASK_UPDATE_TASKTRACKER:String = "TASK_UPDATE_TASKTRACKER";
      
      public static const TASK_UPDATE_NPC:String = "TASK_UPDATE_NPC";
      
      public static const TASK_UPDATE_ALL_NPC_STATUS:String = "TASK_UPDATE_ALL_NPC_STATUS";
      
      public static const NPC_REQ_FUNCTION:String = "REQ_NPC_FUNCTION";
      
      public static const SINGLE_CLICK:String = "SINGLE_CLICK";
      
      public static const CHANGED_MAINCHAR_BASE_ATTR:String = "CHANGED_MAINCHAR_BASE_ATTR";
      
      public static const CHANGED_LOCKEDCHAR_BASE_ATTR:String = "CHANGED_LOCKEDCHAR_BASE_ATTR";
      
      public static const UPDATE_MOUNT_DEPOT:String = "UPDATE_MOUNT_DEPOT";
      
      public static const ADD_AND_UPDATE_MOUNT_BAG:String = "ADD_AND_UPDATE_MOUNT_BAG";
      
      public static const UPDATE_MOUNT_BAG:String = "UPDATE_MOUNT_BAG";
      
      public static const UPDATE_MOUNT_SHOP:String = "UPDATE_MOUNT_SHOP";
      
      public static const UPDATA_MOUNT_HP:String = "UPDATA_MOUNT_HP";
      
      public static const UPDATA_MOUNT_SKILL:String = "UPDATA_MOUNT_SKILL";
      
      public static const AFK_START:String = "AFK_START";
      
      public static const KEY_ESC:String = "KEY_ESC";
      
      public static const KEY_0:String = "KEY_0";
      
      public static const KEY_1:String = "KEY_1";
      
      public static const KEY_2:String = "KEY_2";
      
      public static const KEY_3:String = "KEY_3";
      
      public static const KEY_4:String = "KEY_4";
      
      public static const KEY_5:String = "KEY_5";
      
      public static const KEY_6:String = "KEY_6";
      
      public static const KEY_7:String = "KEY_7";
      
      public static const KEY_8:String = "KEY_8";
      
      public static const KEY_9:String = "KEY_9";
      
      public static const CTRL_KEY_0:String = "CTRL_KEY_0";
      
      public static const CTRL_KEY_1:String = "CTRL_KEY_1";
      
      public static const CTRL_KEY_2:String = "CTRL_KEY_2";
      
      public static const CTRL_KEY_3:String = "CTRL_KEY_3";
      
      public static const CTRL_KEY_4:String = "CTRL_KEY_4";
      
      public static const CTRL_KEY_5:String = "CTRL_KEY_5";
      
      public static const CTRL_KEY_6:String = "CTRL_KEY_6";
      
      public static const CTRL_KEY_7:String = "CTRL_KEY_7";
      
      public static const CTRL_KEY_8:String = "CTRL_KEY_8";
      
      public static const CTRL_KEY_9:String = "CTRL_KEY_9";
      
      public static const KEY_SPACE:String = "KEY_SPACE";
      
      public static const MOUSE_ITEM_MOVE:String = "MOUSE_ITEM_MOVE";
      
      public static const ITEM_MOVE:String = "ITEM_MOVE";
      
      public static const USE_SKILL:String = "USE_SKILL";
      
      public static const ADD_BUFF:String = "ADD_BUFF";
      
      public static const REMOVE_BUFF:String = "REMOVE_BUFF";
      
      public static const EXPENDGAS_AND_PROBABILITY:String = "EXPENDGAS_AND_PROBABILITY";
      
      public static const STONE_EXPENDGAS_AND_PROBABILITY:String = "STONE_EXPENDGAS_AND_PROBABILITY";
      
      public static const EASY_EQUIP_ADD_STONE:String = "EASY_EQUIP_ADD_STONE";
      
      public static const SEND_TEAM_INVITE:String = "SEND_TEAM_INVITE";
      
      public static const SEND_ADD_FRIEND:String = "SEND_ADD_FRIEND";
      
      public static const START_TRADE:String = "START_TRADE";
      
      public static const SEND_SHUANGXIU:String = "SEND_SHUANGXIU";
      
      public static const SEND_DAZUO:String = "SEND_DAZUO";
      
      public static const SEND_LIAOSHANG:String = "SEND_LIAOSHANG";
      
      public static const START_WORLD_MAP_GOTO:String = "START_WORLD_MAP_GOTO";
      
      public static const UP_DOWN_HORSE:String = "UP_DOWN_HORSE";
      
      public static const UP_DOWN_FEIXING:String = "UP_DOWN_FEIXING";
      
      public static const PICK_UP:String = "PICK_UP";
      
      public static const HIT_CHAR:String = "HIT_CHAR";
      
      public static const CATCH_HORSE:String = "CATCH_HORSE";
      
      public static const BA_JIAN:String = "BA_JIAN";
      
      public static const HUN_YAN_CHI:String = "HUN_YAN_CHI";
      
      public static const BA_QI:String = "BA_QI";
      
      public static const CHI_SHENFU:String = "CHI_SHENFU";
      
      public static const QIANG_XIUQIU:String = "QIANG_XIUQIU";
      
      public static const XUYUANSHU_WATER:String = "XUYUANSHU_WATER";
      
      public static const MAIN_CHAR_ATTR_TIP:String = "MAIN_CHAR_ATTR_TIP";
      
      public static const MAIN_CHAR_SINGLE_ATTR_TIP:String = "MAIN_CHAR_SINGLE_ATTR_TIP";
      
      public static const USE_BAG:String = "USE_BAG";
      
      public static const UPDATE_MAINCHAR_AVATAR_IN_PLANE:String = "UPDATE_MAINCHAR_AVATAR_IN_PLANE";
      
      public static const CHONGBAI_BISHI:String = "CHONGBAI_BISHI";
      
      public static const SKILL_LEVEL_UPDATE:String = "SKILL_LEVEL_UPDATE";
      
      public static const CLOSE_STONE_LOAD_BUFF:String = "CLOSE_STONE_LOAD_BUFF";
      
      public static const CLOSE_SYNTHESIZE_LOAD_BUFF:String = "CLOSE_SYNTHESIZE_LOAD_BUFF";
      
      public static const SYNTHESIZE_NOT_ITEM:String = "SYNTHESIZE_NOT_ITEM";
      
      public static const EQUIP_QIANGHUA_SUCCESS:String = "EQUIP_QIANGHUA_SUCCESS";
      
      public static const ITEMTIP_CLEAR:String = "ITEMTIP_CLEAR";
      
      public static const NEW_ITEM_TO_BACKPACK:String = "NEW_ITEM_TO_BACKPACK";
      
      public static const GIFT_PANEL_ADDED_TO_STAGE:String = "GIFT_PANEL_ADDED_TO_STAGE";
      
      public static const ITEM_USE:String = "ITEM_USE";
      
      public static const ITEM_USE_SKILLGOODS:String = "ITEM_USE_SKILLGOODS";
      
      public static const SEND_ITEM_USE:String = "SEND_ITEM_USE";
      
      public static const FLOOR_ATTACK:String = "FLOOR_ATTACK";
      
      public static const TAB_SELECT:String = "TAB_SELECT";
      
      public static const SETTING_DATA:String = "SETTING_DATA";
      
      public static const SET_TEAM_PARMS:String = "SET_TEAM_PARMS";
      
      public static const UPDATE_ITEM_BAG:String = "UPDATE_ITEM_BAG";
      
      public static const UPDATE_AFK_CONFIG:String = "UPDATE_AFK_CONFIG";
      
      public static const CHAR_DAZUO_SHUANGXIU_STATUS:String = "CHAR_DAZUO_SHUANGXIU_STATUS";
      
      public static const CHAR_LIAOSHANG_STATUS:String = "CHAR_LIAOSHANG_STATUS";
      
      public static const SHOW_GOODS_PANEL:String = "SHOW_GOODS_PANEL";
      
      public static const SELECT_DOLL:String = "SELECT_DOLL";
      
      public static const SELECT_MOXUE_DOLL:String = "SELECT_MOXUE_DOLL";
      
      public static const SELECT_DOLL_SUPER:String = "SELECT_DOLL_SUPER";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const REQUEST_MALL_GOODS_INFO:String = "REQUEST_MALL_GOODS_INFO";
      
      public static const SHOW_GOODS_BUY:String = "SHOW_GOODS_BUY";
      
      public static const ADD_BANGHUI_CHAT:String = "ADD_BANGHUI_CHAT";
      
      public static const SEND_BANGYAO:String = "SEND_BANGYAO";
      
      public static const ITEM_SWAP_OR_MOVE:String = "ITEM_SWAP_OR_MOVE";
      
      public static const SET_SMALL_MAP_BANGQI:String = "SET_SMALL_MAP_BANGQI";
      
      public static const SET_SMALL_MAP_SHENLONGZHIREN:String = "SET_SMALL_MAP_SHENLONGZHIREN";
      
      public static const SET_SMALL_MAP_XIUQIU:String = "SET_SMALL_MAP_XIUQIU";
      
      public static const SET_SMALL_MAP_NB_ZHUANGBEI:String = "SET_SMALL_MAP_NB_ZHUANGBEI";
      
      public static const SET_SMALL_MAP_NB_ZHUANGBEI3V3:String = "SET_SMALL_MAP_NB_ZHUANGBEI3V3";
      
      public static const LOOK_OTHERCHAR_SHOP_PANEL:String = "LOOK_OTHERCHAR_SHOP_PANEL";
      
      public static const SELECT_YUPEI:String = "SELECT_YUPEI";
      
      public static const SELECT_YUPEI_SWITCH:String = "SELECT_YUPEI_SWITCH";
      
      public static const UPDATE_SKILL:String = "UPDATE_SKILL";
      
      public static const LIHUN_SUCCESS:String = "LIHUN_SUCCESS";
      
      public static const UPDATE_MAINCHAR_YUPEI:String = "UPDATE_MAINCHAR_YUPEI";
      
      public static const UI_CHAR_ATTRIBUTE_MENU_SHOW:String = "UI_CHAR_ATTRIBUTE_MENU_SHOW";
      
      public static const UI_MeiRenPanel_GOUXUAN_CLICK:String = "UI_MeiRenPanel_GOUXUAN_CLICK";
      
      public static const USE_SKILL_BIYISHUANGFEI:String = "USE_SKILL_BIYISHUANGFEI";
      
      public static const EQUIP_STONE_SEND_50125:String = "EQUIP_STONE_SEND_50125";
      
      public static const SWAP_JINGMAI_ZONGLAN:String = "SWAP_JINGMAI_ZONGLAN";
      
      public static const MAINUI_KUAFU_GUIZHE_QUERY:String = "MAINUI_KUAFU_GUIZHE_QUERY";
      
      public static const KUAFU_STATUS:String = "KUAFU_STATUS";
      
      public static const KUA_FU_RANK_DATA_SEND:String = "KUA_FU_RANK_DATA_SEND";
      
      public static const KUA_FU_RANK_DATA_RECEIVED:String = "KUA_FU_RANK_DATA_RECEIVED";
      
      public static const SET_MAINCHAR_MALL:String = "SET_MAINCHAR_MALL";
      
      public static const SIX_STONE_TO_SEVEN_STONE_PROBABILITY:String = "SIX_STONE_TO_SEVEN_STONE_PROBABILITY";
      
      public static const BUY_MALL_SHENGWANG:String = "BUY_MALL_SHENGWANG";
      
      public static const SEND_QIUHUN:String = "SEND_QIUHUN";
      
      public static const RANK_CHONGBAI_BISHI_DATA:String = "RANK_CHONGBAI_BISHI_DATA";
      
      public static const OPEN_JIE_YABIAO_PANEL:String = "OPEN_JIE_YABIAO_PANEL";
      
      public static const OPEN_JIAO_YABIAO_PANEL:String = "OPEN_JIAO_YABIAO_PANEL";
      
      public static const FANGQI_YABIAO_TASK:String = "FANGQI_YABIAO_TASK";
      
      public static const OPEN_PARTY_TASK_INVITE:String = "OPEN_PARTY_TASK_INVITE";
      
      public static const CLICK_EUQIP2BAOSHI:String = "CLICK_EUQIP2BAOSHI";
      
      public static const KUAISU_SHEGNJIE:String = "KUAISU_SHEGNJIE";
      
      public static const ZHUANGBEI_YANGCHENG:String = "ZHUANGBEI_YANGCHENG";
      
      public static const XUNZHANG_DUANZAO:String = "XUNZHANG_DUANZAO";
      
      public static const ZUOQI_DAZAO:String = "ZUOQI_DAZAO";
      
      public static const MENU_XIANGQIAN:String = "MENU_XIANGQIAN";
      
      public static const SUPER_XIANGQIAN:String = "SUPER_XIANGQIAN";
      
      public static const MENU_XUNZHANGXIANGQIAN:String = "MENU_XUNZHANGXIANGQIAN";
      
      public static const MENU_XIANGQIAN_FANHUI:String = "MENU_XIANGQIAN_FANHUI";
      
      public static const HUYI_KAIGUANG:String = "HUYI_KAIGUANG";
      
      public static const HUYI_LINGHUA:String = "HUYI_LINGHUA";
      
      public static const HUYI_XILIAN:String = "HUYI_XILIAN";
      
      public static const ZHUANGBEI_JIHUO:String = "ZHUANGBEI_JIHUO";
      
      public static const LONGYIN_KAIGUANG:String = "LONGYIN_KAIGUANG";
      
      public static const LOOK_PLAYER_ZHAN_DOU_LI:String = "LOOK_PLAYER_ZHAN_DOU_LI";
      
      public static const SEND_TO_WANBAOGE:String = "SEND_TO_WANBAOGE";
      
      public static const BIWUDAHU_ZHUWEI:String = "BIWUDAHU_ZHUWEI";
      
      public static const SHOW_BIWUDAHUI_PANEL:String = "SHOW_BIWUDAHUI_PANEL";
      
      public static const SET_BAOSHI_TIME:String = "SET_BAOSHI_TIME";
      
      public static const UPDATE_BAOSHI_TIME:String = "UPDATE_BAOSHI_TIME";
      
      public static const STARTUP_XIANGLONG:String = XiangLong_ApplicationFacade.NAME;
      
      public static const JIAN_SELECT:String = "JIAN_SELECT";
      
      public static const SAVE_SHOW_JIAN:String = "SAVE_SHOW_JIAN";
      
      public static const SHOW_SHI_SHI_ZHAN_KUANG:String = "SHI_SHI_ZHAN_KUANG";
      
      public static const SHOW_ZHUANGBEI_HUISHOU_PANEL:String = "SHOW_ZHUANGBEI_HUISHOU_PANEL";
      
      public static const DINGJI_JIHUO_SHUXING:String = "DINGJI_JIHUO_SHUXING";
      
      public static const STARTUP_LIUMAISHENJIAN:String = Liumaishenjian_ApplicationFacade.NAME;
      
      public static const STARTUP_SHIBATONGREN:String = ShiBatongren_ApplicationFacade.NAME;
      
      public static const STARTUP_QINGGONGYAN:String = QingGongYan_ApplicationFacade.NAME;
      
      public static const QINGGONGYAN_CHI:String = "QINGGONGYAN_CHI";
      
      public static const SHOW_QINGGONGYAN_OVER:String = "SHOW_QINGGONGYAN_OVER";
      
      public static const STARTUP_WUXINGZHIREN:String = WuXingZhiRen_ApplicationFacade.NAME;
      
      public static const STARTUP_JINZHONGZHAO:String = Jinzhongzhao_ApplicationFacade.NAME;
      
      public static const STARTUP_ZHANHUN:String = ZhanHun_ApplicationFacade.NAME;
      
      public static const LONGYA_KAIGUANG:String = "LONGYA_KAIGUANG";
      
      public static const HUSHENFU_XILIAN:String = "HUSHENFU_XILIAN";
      
      public static const SHOW_HUSHEN_XILIAN_PANEL:String = "SHOW_HUSHEN_XILIAN_PANEL";
      
      public static const GET_CONQUER_HISTORY_DATA:String = "GET_CONQUER_HISTORY_DATA";
      
      public static const STARTUP_ZHANHUNHUODE:String = "com.tgame.moudels.zhanhunhuode.ZhanHunHuoDe_ApplicationFacade";
      
      public static const SHOW_ZHANHUNHUODE:String = "SHOW_ZHANHUNHUODE";
      
      public static const STARTUP_XUNZHANGDUANZAO:String = "com.tgame.moudels.xunzhangduanzao.XunZhangDuanZao_ApplicationFacade";
      
      public static const SHOW_XUNZHANG_DUANZAO:String = "SHOW_XUNZHANG_DUANZAO";
      
      public static const SHOW_LEIJIDENGLU:String = "SHOW_LEIJIDENGLU";
      
      public static const STARTUP_TAIXUANSHENGONG:String = TaiXuanShenGong_ApplicationFacade.NAME;
      
      public static const STARTUP_JIUQUHUANGHEZHEN:String = JiuQuHuangHeZhen_ApplicationFacade.NAME;
      
      public static const STARTUP_ZHENWUQIJIEZHEN:String = ZhenwuQijiezhen_ApplicationFacade.NAME;
      
      public static const STARTUP_DOUZHUANXINGYI:String = DouZhuanXingYi_ApplicationFacade.NAME;
      
      public static const STARTUP_GUILIUZHEN:String = GuiLiuZhen_ApplicationFacade.NAME;
      
      public static const SHOW_SISHENGSHOUKEWEN_PANEL:String = "SHOW_SISHENGSHOUKEWEN_PANEL";
      
      public static const SHOW_SISHENGSHOUKEWEN_PANEL1:String = "SHOW_SISHENGSHOUKEWEN_PANEL1";
      
      public static const SHOW_ZHUNAGBEICOPE_PANEL:String = "SHOW_ZHUNAGBEICOPE_PANEL";
      
      public static const STARTUP_SHENJIGNZHAO:String = Shenzhaojing_ApplicationFacade.NAME;
      
      public static const STARTUP_QISHANGQUAN:String = QiShangQuan_ApplicationFacade.NAME;
      
      public static const SHISHIKAIFENG:String = "SHISHIKAIFENG";
      
      public static const SHOW_SHISHIKAIFENG_PANEL:String = "SHOW_SHISHIKAIFENG_PANEL";
      
      public static const TISHENGPINZHI:String = "TISHENGPINZHI";
      
      public static const SHOW_TISHENGPINZHI_PANEL:String = "SHOW_TISHENGPINZHI_PANEL";
      
      public static const ZUOQI_ZHUANGBEI_DAZAO:String = "ZUOQI_ZHUANGBEI_DAZAO";
      
      public static const DAKAI_ZUOQI_ZHUANGBEI_DAZAO_MIANBAN:String = "DAKAI_ZUOQI_ZHUANGBEI_DAZAO_MIANBAN";
      
      public static const SHOW_FUCHOU_OK_PANEL:String = "SHOW_FUCHOU_OK_PANEL";
      
      public static const SHOW_CISHA_OK_PANEL:String = "SHOW_CISHA_OK_PANEL";
      
      public static const SHOW_CISHAMILING_PLANE:String = "SHOW_CISHAMILING_PLANE";
      
      public static const SHOW_DIXIAQIANZHUANG_PANEL:String = "UI_DIXIAQIANZHUANG_PANEL_DUIHUAN";
      
      public static const DROP_TASK:String = "DROP_TASK";
      
      public static const AOJIAN_BIRTHDAY:String = "AOJIAN_BIRTHDAY";
      
      public static const STARTUP_QIMENZHEN:String = QiMenZhen_ApplicationFacade.NAME;
      
      public static const SHOW_MO_HUA:String = "SHOW_MO_HUA";
      
      public static const SHOW_CISHA_SHUOMING:String = "SHOW_CISHA_SHUOMING";
      
      public static const SHOW_AOJIAN_ZHENGBA:String = "SHOW_AOJIAN_ZHENGBA";
      
      public static const STARTUP_AOJIANZHENGBA:String = AojianZhengba_ApplicationFacade.NAME;
      
      public static const STARTUP_AOJIANZHUZAO:String = AoJianZhuZao_ApplicationFacade.NAME;
      
      public static const SHOW_AOJIAN_ZHUZAO:String = "SHOW_AOJIAN_ZHUZAO";
      
      public static const PACK_SHOW_SHENGDAN_XUNZHANG_SHENGJI:String = "PACK_SHOW_SHENGDAN_XUNZHANG_SHENGJI";
      
      public static const SHOW_SHENGDAN_PANEL_DUANZAO:String = "SHOW_SHENGDAN_PANEL_DUANZAO";
      
      public static const STARTUP_CHRISTMASRANK:String = ChristmasRank_ApplicationFacade.NAME;
      
      public static const SHOW_CHRISTMASRANK:String = "SHOW_CHRISTMASRANK";
      
      public static const STARTUP_HAMAGONG:String = HaMaGong_ApplicationFacade.NAME;
      
      public static const SHOW_YUANPAN_PANEL:String = "SHOW_YUANPAN_PANEL";
      
      public static const STARTUP_TIANFU:String = TianFu_ApplicationFacade.NAME;
      
      public static const SHOW_TIANFU_HECHENG_PLANE:String = "SHOW_TIANFU_HECHENG_PLANE";
      
      public static const GOT_TIANFU_LAST_SUIPIAN:String = "GOT_TIANFU_LAST_SUIPIAN";
      
      public static const SHOW_TIANFU_XIANGQIAN:String = "SHOW_TIANFU_XIANGQIAN";
      
      public static const SHOW_XUNZHANG_HECHENG_PANEL:String = "SHOW_XUNZHANG_HECHENG_PANEL";
      
      public static const STARTUP_MEIREN:String = MeiRen_ApplicationFacade.NAME;
      
      public static const SHOW_MEIREN_PANEL:String = "SHOW_MEIREN_PANEL";
      
      public static const SHOW_MONTHSIGNIN_PANEL:String = "SHOW_MONTHSIGNIN_PANEL";
      
      public static const SHOW_JILEIZHI_PANEL:String = "SHOW_JILEIZHI_PANEL";
      
      public static const STARTUP_LONGWENKEHUA:String = LongWenKeHua_ApplicationFacade.NAME;
      
      public static const SHOW_LONGWENKEHUA_PANEL:String = "SHOW_LONGWENKEHUA_PANEL";
      
      public static const STARTUP_WUXINGZHEN:String = WuXingZhen_ApplicationFacade.NAME;
      
      public static const STARTUP_JUBAOPEN:String = JuBaoPen_ApplicationFacade.NAME;
      
      public static const SHOW_JUBAOPEN_PANEL:String = "SHOW_JUBAOPEN_PANEL";
      
      public static const CLOSE_JUBAOPEN_PANEL:String = "HIDE_JUBAOPEN_PANEL";
      
      public static const SHOW_XUNZHANGDUIHUAN_PANEL:String = "SHOW_XUNZHANGDUIHUAN_PANEL";
      
      public static const STARTUP_XUNZHANGDUIHUAN:String = XunZhangDuiHuan_ApplicationFacade.NAME;
      
      public static const STARTUP_XUNZHANGYANGCHENG:String = XunZhangYangCheng_ApplicationFacade.NAME;
      
      public static const SHOW_XUNZHANG_PANEL:String = "SHOW_XUNZHANG_PANEL";
      
      public static const STARTUP_XUNZHANG:String = XunZhang_ApplicationFacade.NAME;
      
      public static const STARTUP_XUNZHANGZHANSHI:String = XunZhangZhanshi_ApplicationFacade.NAME;
      
      public static const STARTUP_QISHAZHEN:String = QiShaZhen_ApplicationFacade.NAME;
      
      public static const STARTUP_FUWENKEHUA:String = FuWenKeHua_ApplicationFacade.NAME;
      
      public static const STARTUP_XINGXIUZHEN:String = XingXiuZhen_ApplicationFacade.NAME;
      
      public static const STARTUP_XINGXIUZHEN1:String = XingXiuZhen1_ApplicationFacade.NAME;
      
      public static const STARTUP_XINNIANYASUIQIAN:String = Xinnianyasuiqian_ApplicationFacade.NAME;
      
      public static const SHOW_DAN_TIAO_WANG_SHUOMING:String = "SHOW_DAN_TIAO_WANG_SHUOMING";
      
      public static const STARTUP_DANTIAOWANG:String = DanTiaoWang_ApplicationFacade.NAME;
      
      public static const SHOW_CONQUERPANEL_BOSS:String = "SHOW_CONQUERPANEL_BOSS";
      
      public static const STARTUP_MOXUE_DOLL:String = "com.tgame.moudels.moxue.MoXue_ApplicationFacade";
      
      public static const STARTUP_CHIXUEMOZHEN:String = ChiXueMoZhen_ApplicationFacade.NAME;
      
      public static const STARTUP_SANSHILIUSHOU:String = SanShiLiuShou_ApplicationFacade.NAME;
      
      public static const START_BEIDOUQIXINGZHEN:String = BeiDouQiXingZhen_ApplicationFacade.NAME;
      
      public static const STARTUP_JINCHANTUOQIAO:String = JinChanTuoQiao_ApplicationFacade.NAME;
      
      public static const STARTUP_CHIBANG:String = ChiBang_ApplicationFacade.NAME;
      
      public static const STARTUP_TENGTIANYI:String = Tengtianyi_ApplicationFacade.NAME;
      
      public static const SHOW_LOCK_CHAR:String = "SHOW_LOCK_CHAR";
      
      public static const DUOXUAN_QIANGHUA:String = "DUOXUAN_QIANGHUA";
      
      public static const SHENQI_JINHUA:String = "SHENQI_JINHUA";
      
      public static const STARTUP_TIMEBAOZANG:String = TimeBaoZang_ApplicationFacade.NAME;
      
      public static const SHOW_TIMEBAOZANG_PANEL:String = "SHOW_TIMEBAOZANG_PANEL";
      
      public static const LONGYUAN_SKILL_CHOUJIANG:String = "LONGYUAN_SKILL_CHOUJIANG";
      
      public static const HIDE_ALL_UI_TENS:String = "HIDE_ALL_UI_TENS";
      
      public static const SHOW_SHOUYUAN_SKILL:String = "SHOW_SHOUYUAN_SKILL";
      
      public static const SHOW_YUEGUANGBAOHE_PANEL:String = "SHOW_YUEGUANGBAOHE_PANEL";
      
      public static const STARTUP_TIANJIANGXIANGRUI:String = TianJiangXiangRui_ApplicationFacade.NAME;
      
      public static const SHOW_TIANJIANGXIANGRUI:String = "SHOW_TIANJIANGXIANGRUI";
      
      public static const SHOW_BIWUZHAOQIN_PANEL:String = "SHOW_BIWUZHAOQIN_PANEL";
      
      public static const STARTUP_BIWUZHAOQIN:String = BiWuZhaoQin_ApplicationFacade.NAME;
      
      public static const STARTUP_JINGANGFUMOQUAN:String = Jingangfumoquan_ApplicationFacade.NAME;
      
      public static const STARTUP_QINLONGGONG:String = QinLongGong_ApplicationFacade.NAME;
      
      public static const STARTUP_XIAOYAOYUFENG:String = XiaoYaoYuFeng_ApplicationFacade.NAME;
      
      public static const SHOW_XIAOYAOYUFENGJINENGSHEZHI_PANEL:String = "SHOW_XIAOYAOYUFENGJINENGSHEZHI_PANEL";
      
      public static const SHOW_YULING_HECHENG_PANEL:String = "SHOW_YULING_HECHENG_PANEL";
      
      public static const SHOW_XINMO_PANEL:String = "SHOW_XINMO_PANEL";
      
      public static const STARTUP_LIANQI:String = LianQi_ApplicationFacade.NAME;
      
      public static const STARTUP_TIANMENZHEN:String = TianMenZhen_ApplicationFacade.NAME;
      
      public static const SHOW_BUZHEN_PANEL:String = "SHOW_BUZHEN_PANEL";
      
      public static const ZHENFA_BAOFA_BTN:String = "ZHENFA_BAOFA_BTN";
      
      public static const STARTUP_BIHAICHAOSHENGQU:String = BiHaiChaoShengQu_ApplicationFacade.NAME;
      
      public static const STARTUP_HEYIZHEN:String = HeYiZhen_ApplicationFacade.NAME;
      
      public static const STARTUP_YULIZHEN:String = YuLiZhen_ApplicationFacade.NAME;
      
      public static const STARTUP_YUXIAOJIANFA:String = YuXiaoJianFa_ApplicationFacade.NAME;
      
      public static const STARTUP_YANYUEZHEN:String = YanYueZhen_ApplicationFacade.NAME;
      
      public static const STARTUP_CHANGSHEZHEN:String = ChangSheZhen_ApplicationFacade.NAME;
      
      public static const STARTUP_CANHEZHI:String = CanHeZhi_ApplicationFacade.NAME;
      
      public static const SHOW_TIANSHANGZHIHUN_SHENGJIE:String = "SHOW_TIANSHANGZHIHUN_SHENGJIE";
      
      public static const STARTUP_EMOZHIYI:String = EMoZhiYi_ApplicationFacade.NAME;
      
      public static const SHOW_MENPAIZHUANHUAN_PANEL:String = "SHOW_MENPAIZHUANHUAN_PANEL";
      
      public static const STARTUP_JUEZHANGUANGMINGDING:String = JueZhanGuangMingDing_ApplicationFacade.NAME;
      
      public static const STARTUP_XUANXIANGZHEN:String = XuanXiangZhen_ApplicationFacade.NAME;
      
      public static const STARTUP_YANXINGZHEN:String = YanXingZhen_ApplicationFacade.NAME;
      
      public static const STARTUP_MENPAIZHUANGHUAN:String = PartyChange_ApplicationFacade.NAME;
      
      public static const SHOW_PARTYEQUIPCHANGE_PANEL:String = "SHOW_PARTYEQUIPCHANGE_PANEL";
      
      public static const STARTUP_EQUIPMENPAIZHUANGHUAN:String = PartyEquipChange_ApplicationFacade.NAME;
      
      public static const SHOW_BAITUOSHAN_PANEL:String = "SHOW_BAITUOSHAN_PANEL";
      
      public static const STARTUP_GANJIANGMOYE:String = GanJiangMoYe_ApplicationFacade.NAME;
      
      public static const SHOW_SHENDIAO_PLANE:String = "SHOW_SHENDIAO_PLANE";
      
      public static const STARTUP_SHENDIAOXIALV:String = ShenDiaoXiaLv_ApplicationFacade.NAME;
      
      public static const STARTUP_GANJIANGMOYEZHUZAO:String = GanJiangMoYeZhuZao_ApplicationFacade.NAME;
      
      public static const SHOW_GANJIANGMOYEZHUZAO_PLANE:String = "SHOW_GANJIANGMOYEZHUZAO_PLANE";
      
      public static const SHOW_YUENANRANKING_PANEL:String = "SHOW_YUENANRANKING_PANEL";
      
      public static const REQUEST_YUENANRANKING_PANEL:String = "REQUEST_YUENANRANKING_PANEL";
      
      public static const SHOW_FASHION_PANEL:String = "SHOW_FASHION_PANEL";
      
      public static const STARTUP_FASHION:String = Fashion_ApplicationFacade.NAME;
      
      public static const FENGZHENGJIEDUIHUAN_CLICK:String = "FENGZHENGJIEDUIHUAN_CLICK";
      
      public static const REQUEST_YUENANJUBAOPEN_PANEL:String = "REQUEST_YUENANJUBAOPEN_PANEL";
      
      public static const STARTUP_YUENANJUBAOPEN:String = YNjubaopen_ApplicationFacade.NAME;
      
      public static const SHOW_YUENANJUBAOPEN_PANEL:String = "SHOW_YUENANJUBAOPEN_PANEL";
      
      public static const SHOW_RENAME_PANEL:String = "SHOW_RENAME_PANEL";
      
      public static const STARTUP_RENAME:String = Rename_ApplicationFacade.NAME;
      
      public static const SEND_RENAME:String = "SEND_RENAME";
      
      public static const SEND_NPCID:String = "SEND_NPCID";
      
      public static const REQUEST_YUENANSHIJIEBEIRANK_PANEL:String = "REQUEST_YUENANSHIJIEBEIRANK_PANEL";
      
      public static const SHOW_YUENANSHIJIEBEIRANK_PANEL:String = "SHOW_YUENANSHIJIEBEIRANK_PANEL";
      
      public static const STARTUP_YUENANSHIJIEBEIRANK:String = YNshijiebei_ApplicationFacade.NAME;
      
      public static const STARTUP_YUENAN888SHOP:String = YN888Shop_ApplicationFacade.NAME;
      
      public static const SHOW_YUENAN888SHOP:String = "SHOW_YUENAN888SHOP";
      
      public static const REFRESH_YUENAN888SHOP:String = "REFRESH_YUENAN888SHOP";
      
      public static const SEND_YUENANAOJIANHECHENG:String = "SEND_YUENANAOJIANHECHENG";
      
      public static const SHOW_YUENANAOJIANZHIZAOPANEL1:String = "SHOW_YUENANAOJIANZHIZAOPANEL1";
      
      public static const STARTUP_YUENANAOJIANZHIZAO:String = YNAojianzhizao_ApplicationFacade.NAME;
      
      public static const SHOW_YUENANAOJIANZHIZAOPANEL2:String = "SHOW_YUENANAOJIANZHIZAOPANEL2";
      
      public static const STARTUP_YUENANONLINE:String = YNonline_ApplicationFacade.NAME;
      
      public static const SHOW_YUENANONLINEPANEL:String = "SHOW_YUENANONLINEPANEL";
      
      public static const REQUEST_YUENANONLINE_PANEL:String = "REQUEST_YUENANONLINE_PANEL";
      
      public static const STARTUP_YNHUANGDAOZHUANPAN:String = YNhuangdaozhuanpan_ApplicationFacade.NAME;
      
      public static const REQUEST_YNHUANGDAOZHUANPAN:String = "REQUEST_YNHUANGDAOZHUANPAN";
      
      public static const STARTUP_ZHIZHANZHISHANG:String = ZhiZhanZhiShang_ApplicationFacade.NAME;
      
      public static const SHOW_ZHIZHANZHISHANG:String = "SHOW_ZHIZHANZHISHANG";
      
      public static const SHOW_YUENANRICHANGGONGGAO_PANEL:String = "SHOW_YUENANRICHANGGONGGAO_PANEL";
      
      public static const SHOW_YUENANGOODDELETE_PANEL:String = "SHOW_YUENANGOODDELETE_PANEL";
      
      public static const SEND_YUENANGOODDELETE:String = "SEND_YUENANGOODDELETE";
      
      public static const SHOW_YUENAN2014ZHONGQIU_PANEL:String = "SHOW_YUENAN2014ZHONGQIU_PANEL";
      
      public static const REQUEST_YUENAN2014ZHONGQIU_PANEL:String = "REQUEST_YUENAN2014ZHONGQIU_PANEL";
      
      public static const STARTUP_YUENAN2014ZHOGNQIU:String = YN2014Zhongqiu_ApplicationFacade.NAME;
      
      public static const SEND_53095:String = "SEND_53095";
      
      public static const SEND_53099:String = "SEND_53099";
      
      public static const SEND_83205:String = "SEND_83205";
      
      public static const YN_REQUEST_HUODONG_PANEL:String = "YN_REQUEST_HUODONG_PANEL";
      
      public static const YN_WUSHEN_ZHANLIAN_PANEL:String = "YN_WUSHEN_ZHANLIAN_PANEL";
      
      public static const YN_JINQIANSHU_PANEL:String = "YN_JINQIANSHU_PANEL";
      
      public static const STARTUP_HUTAOZHEN:String = HuTaoZhen_ApplicationFacade.NAME;
      
      public static const STARTUP_YUNLONGZHEN:String = YunLongZhen_ApplicationFacade.NAME;
      
      public static const STARTUP_XIANTIANGONG:String = XianTianGong_ApplicationFacade.NAME;
      
      public static const STARTUP_PANGXIEZHEN:String = PangXieZhen_ApplicationFacade.NAME;
      
      public static const STARTUP_XUEDAOXINFA:String = XueDaoXinFa_ApplicationFacade.NAME;
      
      public static const STARTUP_TIANFUZHEN:String = TianFuZhen_ApplicationFacade.NAME;
      
      public static const STARTUP_NIAOXIANGZHEN:String = NiaoXiangZhen_ApplicationFacade.NAME;
      
      public static const STARTUP_TUSHIDAHUI:String = Tushidahui_ApplicationFacade.NAME;
      
      public static const STARTUP_HUYIJUEXING:String = HuYiJueXing_ApplicationFacade.NAME;
      
      public static const SHOW_SHENBINGJUEXINGXIANGQIAN_PANEL:String = "SHOW_SHENBINGJUEXINGXIANGQIAN_PANEL";
      
      public static const STARTUP_DIZAIZHEN:String = DiZaiZhen_ApplicationFacade.NAME;
      
      public static const STARTUP_FENGYANGZHEN:String = FengYangZhen_ApplicationFacade.NAME;
      
      public static const STARTUP_LONGYAJUEXING:String = LongYaJueXing_ApplicationFacade.NAME;
      
      public static const STARTUP_ZUNRONGWANBAOGE:String = ZunrongWanbaoge_ApplicationFacade.NAME;
      
      public static const SHOW_WANBAOGEHUIGUI_PANEL:String = "SHOW_WANBAOGEHUIGUI_PANEL";
      
      public static const SHOW_WANBAOGE_BAOSHIJIANSHANG_PANEL:String = "SHOW_WANBAOGE_BAOSHIJIANSHANG_PANEL";
      
      public static const SHOW_XIANSHIDAJIANGDUIHUAN_TYPE:String = "SHOW_XIANSHIDAJIANGDUIHUAN_TYPE";
      
      public static const STARTUP_QUANSHENJUEXING:String = QuanShenJueXing_ApplicationFacade.NAME;
      
      public static const STARTUP_WUDUZHEN:String = WuDuZhen_ApplicationFacade.NAME;
      
      public static const SEND_JINYAN:String = "SEND_JINYAN";
      
      public static const SEND_XIANJING:String = "SEND_XIANJING";
      
      public static const STARTUP_HUANGTUBAYE:String = HuangTuBaYe_ApplicationFacade.NAME;
      
      public static const SHOW_HUANGTUBAYE_PANEL:String = "SHOW_HUANGTUBAYE_PANEL";
      
      public static const STARTUP_JIANGSHANSHEJISHIZHIXINXI:String = JiangShangSheJiShiZHiXinXI_ApplicationFacade.NAME;
      
      public static const SHOW_JIANGSHANSHEJI_CHAKAN_PLANE:String = "SHOW_JIANGSHANSHEJI_CHAKAN_PLANE";
      
      public static const STARTUP_BANGPAIRONGYUTARGET:String = BangPaiRongYuTarget_ApplicationFacade.NAME;
      
      public static const SHOW_BANGHUI_RONGYU_LIST_PANEL:String = "SHOW_BANGHUI_RONGYU_LIST_PANEL";
      
      public static const STARTUP_WODERONGYU:String = WoDeRongYu_ApplicationFacade.NAME;
      
      public static const QINGQIUJINRU_HANGTUPAYE_ZHANCHANG:String = "QINGQIUJINRU_HANGTUPAYE_ZHANCHANG";
      
      public static const QINGQIUJIANGSHANSHEJI_CHAKANXINXI_FANYE:String = "QINGQIUJIANGSHANSHEJI_CHAKANXINXI_FANYE";
      
      public static const QINGIUCHENGCHISHIZHI_CHAKANXINXI_FANYE:String = "QINGIUCHENGCHISHIZHI_CHAKANXINXI_FANYE";
      
      public static const QINGQIUJIHUO_LONGMAI:String = "QINGQIUJIHUO_LONGMAI";
      
      public static const STARTUP_LONGYINJUEXING:String = LongYinJueXing_ApplicationFacade.NAME;
      
      public static const STARTUP_SHENXINGBAIBIAN:String = ShenXingBaiBian_ApplicationFacade.NAME;
      
      public static const STARTUP_LANGHUNDUN:String = LangHunDun_ApplicationFacade.NAME;
      
      public static const STARTUP_NEWYEAR:String = NewYear_ApplicationFacade.NAME;
      
      public static const SHOW_NEWYEARNEIRONG_PANEL:String = "SHOW_NEWYEARNEIRONG_PANEL";
      
      public static const SHOW_NEWYEAR_PANEL:String = "SHOW_NEWYEAR_PANEL";
      
      public static const SHOW_YURENJIE_PANEL:String = "SHOW_YURENJIE_PANEL";
      
      public static const SHOW_FENGZHENGJIE_PANEL:String = "SHOW_FENGZHENGJIE_PANEL";
      
      public static const SHOW_DOUDIZHU_PANEL:String = "SHOW_DOUDIZHU_PANEL";
      
      public static const SHOW_YURENJIE_RANK_PANEL:String = "SHOW_YURENJIE_RANK_PANEL";
      
      public static const SHOW_FENGZHENGJIE_RANK_PANEL:String = "SHOW_FENGZHENGJIE_RANK_PANEL";
      
      public static const SHOW_DOUDIZHU_RANK_PANEL:String = "SHOW_DOUDIZHU_RANK_PANEL";
      
      public static const GET_YURENJIE_PANEL:String = "GET_YURENJIE_PANEL";
      
      public static const GET_FENGZHENGJIE_PANEL:String = "GET_FENGZHENGJIE_PANEL";
      
      public static const GET_DOUDIZHU_PANEL:String = "GET_DOUDIZHU_PANEL";
      
      public static const NEWYEAR_YASUIQIAN_CLICK:String = "NEWYEAR_YASUIQIAN_CLICK";
      
      public static const STARTUP_QINGRENJIESONGHUA:String = QingRenJieSongHua_ApplicationFacade.NAME;
      
      public static const SHOW_QINGRENJIESONGHUA_PLANE:String = "SHOW_QINGRENJIESONGHUA_PLANE";
      
      public static const STARTUP_QINGRENJIE_SONGHUABANG:String = QingRenJieSongHuaBang_ApplicationFacade.NAME;
      
      public static const SHOW_QINGRENJIE_SONGHUABANG_PLANE:String = "SHOW_QINGRENJIE_SONGHUABANG_PLANE";
      
      public static const STARTUP_RULAISHENZHANG:String = RuLaiShenZhang_ApplicationFacade.NAME;
      
      public static const SHOW_WOHUCANGLONG_PANEL:String = "SHOW_WOHUCANGLONG_PANEL";
      
      public static const STARTUP_WOHUCANGLONG:String = WoHuCangLong_ApplicationFacade.NAME;
      
      public static const STARTUP_LUOYINGSHENJIANZHANG:String = LuoYingShenJianZhang_ApplicationFacade.NAME;
      
      public static const STARTUP_WISHINGTREE:String = WishingTree_ApplicationFacade.NAME;
      
      public static const SHOW_WISHINGTREE_PANEL:String = "SHOW_WISHINGTREE_PANEL";
      
      public static const SHOW_ZHONGXUYUANSHU_PANEL:String = "SHOW_ZHONGXUYUANSHU_PANEL";
      
      public static const PLANTWISHINGTREE:String = "PLANTWISHINGTREE";
      
      public static const STARTUP_BAZHENTU:String = BaZhenTu_ApplicationFacade.NAME;
      
      public static const STARTUP_DUGUQIUBAI:String = DuGuQiuBai_ApplicationFacade.NAME;
      
      public static const STARTUP_XUANTIEJIANFA:String = XuanTieJianFa_ApplicationFacade.NAME;
      
      public static const STARTUP_YURENJIE:String = "com.tgame.moudels.yurenjie.YuRenJie_ApplicationFacade";
      
      public static const STARTUP_FENGZHENGJIE:String = FengZhengJie_ApplicationFacade.NAME;
      
      public static const STARTUP_DOUDIZHU:String = DouDiZhu_ApplicationFacade.NAME;
      
      public static const STARTUP_CHANGSHENGJUE:String = ChangShengJue_ApplicationFacade.NAME;
      
      public static const STARTUP_WANHUNZHEN:String = WanHunZhen_ApplicationFacade.NAME;
      
      public static const SHOW_GERENCHENGHAO_PANEL:String = "SHOW_GERENCHENGHAO_PANEL";
      
      public static const STARTUP_GERENCHENGHAO:String = GeRenChengHao_ApplicationFacade.NAME;
      
      public static const SHOW_XUESHOUTUIBIAN_PANEL:String = "SHOW_XUESHOUTUIBIAN_PANEL";
      
      public static const STARTUP_WODEMENPAI:String = WoDeMenPai_ApplicationFacade.NAME;
      
      public static const CLICK_RIGHT:String = "CLICK_RIGHT";
      
      public static const SHOW_CHUANGONGWUXUE_PANEL:String = "SHOW_CHUANGONGWUXUE_PANEL";
      
      public static const STARTUP_CHUANGONGWUXUE:String = ChuanGongWuXue_ApplicationFacade.NAME;
      
      public static const QINGQIU_CHUANGONGWUXUE_MIANBAN:String = "QINGQIU_CHUANGONGWUXUE_MIANBAN";
      
      public static const STARTUP_ZHENYANSHOUYIN:String = Zhenyanshouyin_ApplicationFacade.NAME;
      
      public static const STARTUP_ZHENLONGQIJU:String = ZhenLongQiJu_ApplicationFacade.NAME;
      
      public static const STARTUP_SHENGSIFU:String = ShengSiFu_ApplicationFacade.NAME;
      
      public static const STARTUP_TAOHUAZHEN:String = TaoHuaZhen_ApplicationFacade.NAME;
      
      public static const STARTUP_XIAKEXING:String = XiaKeXing_ApplicationFacade.NAME;
      
      public static const STARTUP_MOLINGZHIYI:String = MoLingZhiYi_ApplicationFacade.NAME;
      
      public static const QINGQIUHUANZHUANG:String = "QINGQIUHUANZHUANG";
      
      public static const STARTUP_FUMOZHANGFA:String = FuMoZhangFa_ApplicationFacade.NAME;
      
      public static const REQUEST_FABAOPANEL:String = "REQUEST_FABAOPANEL";
      
      public static const SHOW_FABAOPANEL:String = "SHOW_FABAOPANEL";
      
      public static const SHOW_FABAOTUPOPANEL:String = "SHOW_FABAOTUPOPANEL";
      
      public static const SHOW_FABAOLINGLIPANEL:String = "SHOW_FABAOLINGLIPANEL";
      
      public static const REQUEST_FABAOLINGLIPANEL:String = "REQUEST_FABAOLINGLIPANEL";
      
      public static const STARTUP_FABAO:String = Fabao_ApplicationFacade.NAME;
      
      public static const STARTUP_YUNVSUXINJIANFA:String = YuNvSuXinJianFa_ApplicationFacade.NAME;
      
      public static const SHOW_DUANWUJIE_PANEL:String = "SHOW_DUANWUJIE_PANEL";
      
      public static const STARTUP_DUANWUJIE:String = DuanWuJie_ApplicationFacade.NAME;
      
      public static const GET_DUANWUJIE_PANEL:String = "GET_DUANWUJIE_PANEL";
      
      public static const SHOW_CHAOJILABA_PANEL:String = "SHOW_CHAOJILABA_PANEL";
      
      public static const GET_CHAOJILABA_PANEL:String = "GET_CHAOJILABA_PANEL";
      
      public static const STARTUP_CHAOJILABA:String = ChaoJiLaBa_ApplicationFacade.NAME;
      
      public static const SHOW_ZHONGZHIXUANYUANJIAN_PANEL:String = "SHOW_ZHONGZHIXUANYUANJIAN_PANEL";
      
      public static const STARTUP_ZHONGZHIXUANYUANJIAN:String = ZhongZhiXuanYuanJian_ApplicationFacade.NAME;
      
      public static const STARTUP_LIEKONGJUEXING:String = LieKongJueXing_ApplicationFacade.NAME;
      
      public static const STARTUP_SHIJIEBEI:String = ShiJieBei_ApplicationFacade.NAME;
      
      public static const SHOW_SHIJIEBEI_PANEL:String = "SHOW_SHIJIEBEI_PANEL";
      
      public static const STARTUP_TIANYUYANMENG:String = TianYuYanMeng_ApplicationFacade.NAME;
      
      public static const STARTUP_TIANSHANLIUYANGZHANG:String = TianShanLiuYangZhang_ApplicationFacade.NAME;
      
      public static const STARTUP_AOJIANSHENJIANGJI:String = AoJianShenJiangJi_ApplicationFacade.NAME;
      
      public static const SHOW_SHENGXIAO_PANEL:String = "SHOW_SHENGXIAO_PANEL";
      
      public static const STARTUP_SHENGXIAOTIAOZHAN:String = Shengxiao_ApplicationFacade.NAME;
      
      public static const REQUEST_SHENGXIAOTIAOZHANPANEL:String = "REQUEST_SHENGXIAOTIAOZHANPANEL";
      
      public static const SEND_SHENGXIAOFUBENTIAOZHAN_CLICK:String = "SEND_SHENGXIAOFUBENTIAOZHAN_CLICK";
      
      public static const SEND_SHENGXIAOTIAOZHAN_LEAVE:String = "SEND_SHENGXIAOTIAOZHAN_LEAVE";
      
      public static const SHENGXIAOWUQIDUANZAO_CLICK:String = "SHENGXIAOWUQIDUANZAO_CLICK";
      
      public static const SEND_SHENGXIAOTIAOZHAN_RELIVE:String = "SEND_SHENGXIAOTIAOZHAN_RELIVE";
      
      public static const STARTUP_DUOMINGSHISANJIAN:String = DuoMingShiSanJian_ApplicationFacade.NAME;
      
      public static const STARTUP_WUXIAKAPAI:String = Wuxiakapai_ApplicationFacade.NAME;
      
      public static const REQUEST_WUXIAKAPAI:String = "REQUEST_WUXIAKAPAI";
      
      public static const SHOW_WUXIAKAPAI_PANEL:String = "SHOW_WUXIAKAPAI_PANEL";
      
      public static const SHOW_WUXIAKAPAI_XIANGXI_PANEL:String = "SHOW_WUXIAKAPAI_XIANGXI_PANEL";
      
      public static const SHOW_DIANFENGSHOU_PANEL:String = "SHOW_DIANFENGSHOU_PANEL";
      
      public static const STARTUP_RIJINLUN:String = Rijinlun_ApplicationFacade.NAME;
      
      public static const SHOW_QIXIJIE_PANEL:String = "SHOW_QIXIJIE_PANEL";
      
      public static const STARTUP_QIXIJIE:String = QiXiJie_ApplicationFacade.NAME;
      
      public static const GET_QIXIJIE_PANEL:String = "GET_QIXIJIE_PANEL";
      
      public static const STARTUP_TUNSHITIANDI:String = TunShiTianDi_ApplicationFacade.NAME;
      
      public static const SHOW_TUNSHITIANDI_PANEL:String = "SHOW_TUNSHITIANDI_PANEL";
      
      public static const STARTUP_KONGMINGQUAN:String = KongMingQuan_ApplicationFacade.NAME;
      
      public static const STARTUP_BUCHANGFUBEN:String = BuchangFuben_ApplicationFacade.NAME;
      
      public static const SHOW_BUCHANGFUBEN_PANEL:String = "SHOW_BUCHANGFUBEN_PANEL";
      
      public static const STARTUP_XUEYINJUEXING:String = XueYinJueXing_ApplicationFacade.NAME;
      
      public static const STARTUP_HUASHANLUNJIAN:String = Huashanlunjian_ApplicationFacade.NAME;
      
      public static const STARTUP_YUEJINLUN:String = YueJinLun_ApplicationFacade.NAME;
      
      public static const HUANGJINSHU_WATER:String = "HUANGJINSHU_WATER";
      
      public static const STARTUP_HUANGJINSHU:String = HuangJinShu_ApplicationFacade.NAME;
      
      public static const STARTUP_HANBINGSHENZHANG:String = HanBingShenZhang_ApplicationFacade.NAME;
      
      public static const STARTUP_ZHONGQIUJIE:String = ZhongQiuJie_ApplicationFacade.NAME;
      
      public static const SHOW_ZHONGQIUJIE_PANEL:String = "SHOW_ZHONGQIUJIE_PANEL";
      
      public static const CLICK_ZHONGQIUJIE_ZHUOZI:String = "CLICK_ZHONGQIUJIE_ZHUOZI";
      
      public static const TARGET_FUNCTION_QICHENG:String = "TARGET_FUNCTION_QICHENG";
      
      public static const MAINUI_QUEXIAO_QICHENG:String = "MAINUI_QUEXIAO_QICHENG";
      
      public static const STARTUP_LINGXIYIZHI:String = LingXiYiZhi_ApplicationFacade.NAME;
      
      public static const STARTUP_YNLONGZHIZHUFU:String = YNlongzhizhufu_ApplicationFacade.NAME;
      
      public static const YN_REQUEST_LONGZHIZHUFU_PANEL:String = "YN_REQUEST_LONGZHIZHUFU_PANEL";
      
      public static const YN_SHOW_LONGWENZHUFU_PANEL:String = "YN_SHOW_LONGWENZHUFU_PANEL";
      
      public static const YN_YUENANHUODONGYOUHUA_CLICK:String = "YN_YUENANHUODONGYOUHUA_CLICK";
      
      public static const STARTUP_YNZHIZUOZONGZI:String = YNzongzi_ApplicationFacade.NAME;
      
      public static const YN_SHOW_QINGRENJIEHUODONG2015:String = "YN_SHOW_QINGRENJIEHUODONG2015";
      
      public static const YN_SHOW_CHUNJIEHUODONGPANEL:String = "YN_SHOW_CHUNJIEHUODONGPANEL";
      
      public static const YN_REQUEST_XIANGYANGZHANCHANGRANK_DATA:String = "YN_REQUEST_XIANGYANGZHANCHANGRANK_DATA";
      
      public static const STARTUP_WANGZHEZHIBANG:String = Wangzhezhibang_ApplicationFacade.NAME;
      
      public static const SHOW_WANGZHEZHIBANG_PANEL:String = "SHOW_WANGZHEZHIBANG_PANEL";
      
      public static const SHOW_WANGZHEZHIBANG_LINGJIANG_PANEL:String = "SHOW_WANGZHEZHIBANG_LINGJIANG_PANEL";
      
      public static const SHOW_WANGZHEZHIBANG_ZHANCHANG_GUIZE_PANEL:String = "SHOW_WANGZHEZHIBANG_ZHANCHANG_GUIZE_PANEL";
      
      public static const WANGZHEZHIBANG_TIP_CLICK:String = "WANGZHEZHIBANG_TIP_CLICK";
      
      public static const YN_WUPINFENJIE:String = "YN_WUPINFENJIE";
      
      public static const SHOW_YUANXIAOJIE_PANEL:String = "SHOW_YUANXIAOJIE_PANEL";
      
      public static const CLICK_DENGMI:String = "CLICK_DENGMI";
      
      public static const YN_REQUEST_JINXIANG:String = "YN_REQUEST_JINXIANG";
      
      public static const YN_SHOW_MIKRANK_PANEL:String = "YN_SHOW_MIKRANK_PANEL";
      
      public static const YN_SHOW_SHIZI_PANEL:String = "YN_SHOW_SHIZI_PANEL";
      
      public static const YN_REQUEST_MUYUHU_START:String = "YN_REQUEST_MUYUHU_START";
      
      public static const YN_REQUEST_BAOSHU_START:String = "YN_REQUEST_BAOSHU_START";
      
      public static const YN_SHOW_MUYUHU_PANEL:String = "YN_SHOW_MUYUHU_PANEL";
      
      public static const STARTUP_YUENANLIANHUANCHONGZHI:String = YNlianhuanchongzhi_ApplicationFacade.NAME;
      
      public static const YN_REQUEST_LIANHUANCHONGZHI_PANEL:String = "YN_REQUEST_LIANHUANCHONGZHI_PANEL";
      
      public static const STARTUP_XIAOZHUKUAIPAO:String = XiaoZhuKuaiPao_ApplicationFacade.NAME;
      
      public static const GET_XIAOZHUKUAIPAO_PANEL:String = "GET_XIAOZHUKUAIPAO_PANEL";
      
      public static const SEND_YN_BOOK:String = "SEND_YN_BOOK";
      
      public static const REQUEST_YN_BOOKRANKPANEL:String = "REQUEST_YN_BOOKRANKPANEL";
      
      public static const REQUEST_YN_BOOK_PAIHANG:String = "REQUEST_YN_BOOK_PAIHANG";
      
      public static const REQUEST_YN_BOOK_GETRANK_GOODS:String = "REQUEST_YN_BOOK_GETRANK_GOODS";
      
      public static const YN_REQUEST_SHOUCICHONGZHI_PANEL:String = "YN_REQUEST_SHOUCICHONGZHI_PANEL";
      
      public static const YN_REQUEST_SHOUCICHONGZHI2_PANEL:String = "YN_REQUEST_SHOUCICHONGZHI2_PANEL";
      
      public static const STARTUP_YUENANLONGWUGE:String = YNlongwuge_ApplicationFacade.NAME;
      
      public static const YN_REQUEST_YUENAN2015ZHONGQIU:String = "YN_REQUEST_YUENAN2015ZHONGQIU";
      
      public static const YN_SHOW_LONGWUGEPANEL:String = "YN_SHOW_LONGWUGEPANEL";
      
      public static const YN_REQUEST_LONGWUGE:String = "YN_REQUEST_LONGWUGE";
      
      public static const YN_CHONGZHIPANEL:String = "YN_CHONGZHIPANEL";
      
      public static const STARTUP_YNLIULONGZHUANGBEI:String = YNliulongzhuangbei_ApplicationFacade.NAME;
      
      public static const YN_SHOW_CHRISTMAS_2015:String = "YN_SHOW_CHRISTMAS_2015";
      
      public static const STARTUP_DUIXUEREN:String = DuiXueRen_ApplicationFacade.NAME;
      
      public static const GET_DUIXUEREN_PANEL:String = "GET_DUIXUEREN_PANEL";
      
      public static const SHOW_DUIXUEREN:String = "SHOW_DUIXUEREN";
      
      public static const DUIXUEREN_GET:String = "DUIXUEREN_GET";
      
      public static const SHOW_YNQIANGHUAZHISHEN_PANEL:String = "SHOW_YNQIANGHUAZHISHEN_PANEL";
      
      public static const SHOW_YN2016CGPANEL:String = "SHOW_YN2016CGPANEL";
      
      public static const SHOW_YN2016DLPANEL:String = "SHOW_YN2016DLPANEL";
      
      public static const SHOW_YN2016ONLINEPANEL:String = "SHOW_YN2016ONLINEPANEL";
      
      public static const STARTUP_YUENAN2016NEWYEAR:String = YN2016newyear_ApplicationFacade.NAME;
      
      public static const SHOW_YNXINNIANZHUFUPANEL:String = "SHOW_YNXINNIANZHUFUPANEL";
      
      public static const SHOW_YNNEWYEARSHUOMING:String = "SHOW_YNNEWYEARSHUOMING";
      
      public static const SHOW_YN2016TIANDENG:String = "SHOW_YN2016TIANDENG";
      
      public static const SHOW_YN2016SHIERDIZHI:String = "SHOW_YN2016SHIERDIZHI";
      
      public static const SHOW_YNSHANXIAQIJIAN:String = "SHOW_YNSHANXIAQIJIAN";
      
      public static const SHOW_YNLUOHANHUTI:String = "SHOW_YNLUOHANHUTI";
      
      public static const SHOW_YNSHOUYIN:String = "SHOW_YNSHOUYIN";
      
      public static const SHOW_YNNVQUANHUODONG:String = "SHOW_YNNVQUANHUODONG";
      
      public static const STARTUP_YN2016XINGYUNZHUANPAN:String = YN2016xingyunzhuanpan_ApplicationFacade.NAME;
      
      public static const SHOW_YN2016XINGYUNZHUANPAN:String = "SHOW_YN2016XINGYUNZHUANPAN";
      
      public static const SHOW_YNWULINSHENQIPANEL:String = "SHOW_YNWULINSHENQIPANEL";
      
      public static const SHOW_YNCHONGZHIDAFAPANEL:String = "SHOW_YNCHONGZHIDAFAPANEL";
      
      public static const STARTUP_YNCHONGZHIDAFA:String = YNchongzhidafa_ApplicationFacade.NAME;
      
      public static const SHOW_YNHUTISHANGYIPANEL:String = "SHOW_YNHUTISHANGYIPANEL";
      
      public static const SHOW_YNJUEDINGSHENBINGPANEL:String = "SHOW_YNJUEDINGSHENBINGPANEL";
      
      public static const SHOW_YNZHIMENGQIANZHUANGPANEL:String = "SHOW_YNZHIMENGQIANZHUANGPANEL";
      
      public static const SHOW_YNWANGZHEZHIBANGHUODONGPANEL:String = "SHOW_YNWANGZHEZHIBANGHUODONGPANEL";
      
      public static const STARTUP_YNZHIMENGSHANGCHENG:String = YNzhimengshangcheng_ApplicationFacade.NAME;
      
      public static const STARTUP_YNTULONGDAO:String = YNtulongdao_ApplicationFacade.NAME;
      
      public static const SHOW_YNTULONGDAOPANEL:String = "SHOW_YNTULONGDAOPANEL";
      
      public static const SHOW_YNWUSHUANGPUPANEL:String = "SHOW_YNWUSHUANGPUPANEL";
      
      public static const SHOW_YNSHISANJIANHUN:String = "SHOW_YNSHISANJIANHUN";
      
      public static const SHOW_YNZHUADAYUPANEL:String = "SHOW_YNZHUADAYUPANEL";
      
      public static const STARTUP_YNZHUADAYU:String = YNzhuadayu_ApplicationFacade.NAME;
      
      public static const STARTUP_LONGFENGDANGPU:String = LongFengDangPu_ApplicationFacade.NAME;
      
      public static const GET_LONGFENGDANGPU_PANEL:String = "GET_LONGFENGDANGPU_PANEL";
      
      public static const SHOW_LONGFENGDANGPU_PANEL:String = "SHOW_LONGFENGDANGPU_PANEL";
      
      public static const LONGFENGDANGPU_BUY:String = "LONGFENGDANGPU_BUY";
      
      public static const SHOW_YN2016XIAOFEI:String = "SHOW_YN2016XIAOFEI";
      
      public static const SHOW_YN2016HUODONGXIAOFEI:String = "SHOW_YN2016HUODONGXIAOFEI";
      
      public static const SHOW_XUNZHANGZHANSHI_PANEL:String = "SHOW_XUNZHANGZHANSHI_PANEL";
      
      public static const SHOW_YN2016ZHOUQICAILU:String = "SHOW_YN2016ZHOUQICAILU";
      
      public static const SHOW_YN2016QIZIQUANZHENJIAO:String = "SHOW_YN2016QIZIQUANZHENJIAO";
      
      public static const SHOW_YN2016PAIHANGBANG:String = "SHOW_YN2016PAIHANGBANG";
      
      public static const SHOW_YN2016YINGXIONGSHIJIAN:String = "SHOW_YN2016YINGXIONGSHIJIAN";
      
      public static const SHOW_YN2016YUELUNGUJI:String = "SHOW_YN2016YUELUNGUJI";
      
      public static const SHOW_YN2016CHONGJIUZHIYANG:String = "SHOW_YN2016CHONGJIUZHIYANG";
      
      public static const SHOW_YN2016XIUWEIWUXUE:String = "SHOW_YN2016XIUWEIWUXUE";
      
      public static const SHOW_YN2016WANGZHEZHANQI:String = "SHOW_YN2016WANGZHEZHANQI";
      
      public static const SHOW_YN2016QICAIPAIHANGBANG:String = "SHOW_YN2016QICAIPAIHANGBANG";
      
      public static const SHOW_YN2016FANLIPANEL:String = "SHOW_YN2016FANLIPANEL";
      
      public static const SHOW_YN2016FUQITONGXINPANEL:String = "SHOW_YN2016FUQITONGXINPANEL";
      
      public static const SHOW_YN2016SHENGRIZHOUJIPANEL:String = "SHOW_YN2016SHENGRIZHOUJIPANEL";
      
      public static const SHOW_MALL_WO_HU_PLANE:String = "SHOW_MALL_WO_HU_PLANE";
      
      public static const SHOW_YN2016LIUPAIJINJIPLANE:String = "SHOW_YN2016LIUPAIJINJIPLANE";
      
      public static const SHOW_YN2016LIUMAIJIANPLANE:String = "SHOW_YN2016LIUMAIJIANPLANE";
      
      public static const SHOW_YN2016YINGBINZHOULIPLANE:String = "SHOW_YN2016YINGBINZHOULIPLANE";
      
      public static const SHOW_YN2016WUYUEGUANGLIANGPLANE:String = "SHOW_YN2016WUYUEGUANGLIANGPLANE";
      
      public static const SHOW_YN2016DINGFENGZHOUQIPLANE:String = "SHOW_YN2016DINGFENGZHOUQIPLANE";
      
      public static const SHOW_ZHENTIANSHENQIPLANE:String = "SHOW_ZHENTIANSHENQIPLANE";
      
      public static const SHOW_YN2016HUASHANLUNJIANPLANE:String = "SHOW_YN2016HUASHANLUNJIANPLANE";
      
      public static const SHOW_YN2016SHENGDANJIEPLANE:String = "SHOW_YN2016SHENGDANJIEPLANE";
      
      public static const SHOW_YN2016SHENGDANJINPIAOPLANE:String = "SHOW_YN2016SHENGDANJINPIAOPLANE";
      
      public static const SHOW_YN2016ZHENBAOGEPLANE:String = "SHOW_YN2016ZHENBAOGEPLANE";
      
      public static const SHOW_YN2017FANGYANHUAPANEL:String = "SHOW_YN2017FANGYANHUAPANEL";
      
      public static const SHOW_YN2017ZAOWANGPANEL:String = "SHOW_YN2017ZAOWANGPANEL";
      
      public static const YN_SHOW_XINNIANYASUIQIAN:String = "YN_SHOW_XINNIANYASUIQIAN";
      
      public static const SHOW_XINIANYASUIQIANCHAKAN_PLANE:String = "SHOW_XINIANYASUIQIANCHAKAN_PLANE";
      
      public static const SHOW_CHUNJIE123_PLANE:String = "SHOW_CHUNJIE123_PLANE";
      
      public static const SHOW_YUANYANGXISHUI_PLANE:String = "SHOW_YUANYANGXISHUI_PLANE";
      
      public static const STARTUP_XIANGYANGZHIZHAN:String = XiangYangZhiZhan_ApplicationFacade.NAME;
      
      public static const SHOW_MOXUEZHANCHANG:String = "SHOW_MOXUEZHANCHANG";
      
      public static const GET_MOXUEZHANCHANG_PANEL:String = "GET_MOXUEZHANCHANG_PANEL";
      
      public static const STARTUP_MOXUEZHANCHANG:String = MoXueZhanChang_ApplicationFacade.NAME;
      
      public static const GET_FULIHUODONG_PANEL:String = "GET_FULIHUODONG_PANEL";
      
      public static const SHOW_GUOSETIANXIANG_PANEL:String = "GET_GUOSETIANXIANG_PANEL";
      
      public static const STARTUP_JIANGHUN:String = JiangHun_ApplicationFacade.NAME;
      
      public static const GET_JIANGHUN_PANEL:String = "GET_JIANGHUN_PANEL";
      
      public static const SHOW_JIANGHUN:String = "SHOW_JIANGHUN";
      
      public static const UI_JIANGHUN_HUANZHUANG_CLICK:String = "UI_JIANGHUN_HUANZHUANG_CLICK";
      
      public static const GET_JIANGHUN_CN_PANEL:String = "GET_JIANGHUN_CN_PANEL";
      
      public static const GET_CHUNJINGZHUANSHUJIFEN_PANEL:String = "GET_CHUNJINGZHUANSHUJIFEN_PANEL";
      
      public static const SHOW_AIDEHUIBAO_PANEL:String = "SHOW_AIDEHUIBAO_PANEL";
      
      public static const SHOW_YOUHUIZHOUQIO_PANEL:String = "SHOW_YOUHUIZHOUQIO_PANEL";
      
      public static const SHOW_OULE_PANEL:String = "SHOW_OULE_PANEL";
      
      public static const SHOW_2017YURENJIE_PANEL:String = "SHOW_2017YURENJIE_PANEL";
      
      public static const SHOW_2017XIONGWANGDALI_PANEL:String = "SHOW_2017XIONGWANGDALI_PANEL";
      
      public static const SHOW_WANGZHEZHUANGBEI:String = "SHOW_WANGZHEZHUANGBEI";
      
      public static const SHOW_KAIZHAN5_PANEL:String = "SHOW_KAIZHAN5_PANEL";
      
      public static const STARTUP_DUANWUJIE2015:String = DuanWuJie2015_ApplicationFacade.NAME;
      
      public static const GET_DUANWUJIE2015_PANEL:String = "GET_DUANWUJIE2015_PANEL";
      
      public static const SHOW_TIANSHIZHOUQI_PANEL:String = "SHOW_TIANSHIZHOUQI_PANEL";
      
      public static const SHOW_NANTIANHAOQI_PANEL:String = "SHOW_NANTIANHAOQI_PANEL";
      
      public static const SHOW_RONGGUANG_PANEL:String = "SHOW_RONGGUANG_PANEL";
      
      public static const STARTUP_BAGUAZHEN:String = BaGuaZhen_ApplicationFacade.NAME;
      
      public static const GET_BAGUAZHEN_PANEL:String = "GET_BAGUAZHEN_PANEL";
      
      public static const GET_BAGUAZHENMAINUI_SHOW_HIDE:String = "GET_BAGUAZHENMAINUI_SHOW_HIDE";
      
      public static const STARTUP_SHANGDIAN:String = Shangdian_ApplicationFacade.NAME;
      
      public static const SHOW_XIANSHISHANGDIAN_PANEL:String = "SHOW_XIANSHISHANGDIAN_PANEL";
      
      public static const SHOW_FODAN_PANEL:String = "SHOW_FODAN_PANEL";
      
      public static const SHOW_YINGXIONGMINGCHENG_PANEL:String = "SHOW_YINGXIONGMINGCHENG_PANEL";
      
      public static const SHOW_DUIJUEZHOUQI_PANEL:String = "SHOW_DUIJUEZHOUQI_PANEL";
      
      public static const SHOW_0519_PANEL:String = "SHOW_0519_PANEL";
      
      public static const STARTUP_JINGLEIQIANG:String = JingLeiQiang_ApplicationFacade.NAME;
      
      public static const SHOW_LIUYIERTONGJIE_PANEL:String = "SHOW_LIUYIERTONGJIE_PANEL";
      
      public static const SHOW_SHIJIANSHALOU_PANEL:String = "SHOW_SHIJIANSHALOU_PANEL";
      
      public static const GET_SHIJIANSHALOU_PANEL:String = "GET_SHIJIANSHALOU_PANEL";
      
      public static const STARTUP_SHIJIANSHALOU:String = ShiJianShalou_ApplicationFacade.NAME;
      
      public static const SHOW_KUANGBAO_PANEL:String = "SHOW_KUANGBAO_PANEL";
      
      public static const SHOW_DIANFENGZHOUQI_PANEL:String = "SHOW_DIANFENGZHOUQI_PANEL";
      
      public static const SHOW_QINGZHU_PANEL:String = "SHOW_QINGZHU_PANEL";
      
      public static const SHOW_MEITIANYOUHUI_PANEL:String = "SHOW_MEITIANYOUHUI_PANEL";
      
      public static const SHOW_SHENFENG_PANEL:String = "SHOW_SHENFENG_PANEL";
      
      public static const SHOW_SHENGZHEN_PANEL:String = "SHOW_SHENGZHEN_PANEL";
      
      public static const SHOW_JINYE_PANEL:String = "SHOW_JINYE_PANEL";
      
      public static const SHOW_LIUYUEYUANMAN_PANEL:String = "SHOW_LIUYUEYUANMAN_PANEL";
      
      public static const SHOW_LIUYUEQINGZHU_PANEL:String = "SHOW_LIUYUEQINGZHU_PANEL";
      
      public static const SEND_82241:String = "SEND_82241";
      
      public static const SHOW_LIUYUEDI_PANEL:String = "SHOW_LIUYUEDI_PANEL";
      
      public static const SHOW_MEITIANYOUHUIIBAO_PANEL:String = "SHOW_MEITIANYOUHUIIBAO_PANEL";
      
      public static const STARTUP_YNYITIANJIAN:String = YNyitianjian_ApplicationFacade.NAME;
      
      public static const SHOW_YNYITIANJIAN:String = "SHOW_YNYITIANJIAN";
      
      public static const SHOW_DISHI_PANEL:String = "SHOW_DISHI_PANEL";
      
      public static const SHOW_WEI300_PANEL:String = "SHOW_WEI300_PANEL";
      
      public static const SHOW_SHOUCHONGSHIJIAN_PANEL:String = "SHOW_SHOUCHONGSHIJIAN_PANEL";
      
      public static const SHOW_MOSHIZHOUQI_PANEL:String = "SHOW_MOSHIZHOUQI_PANEL";
      
      public static const SHOW_XIATIANZHIEN_PANEL:String = "SHOW_XIATIANZHIEN_PANEL";
      
      public static const SHOW_BAYUETOU_PANEL:String = "SHOW_BAYUETOU_PANEL";
      
      public static const SHOW_TONGLEFEISHENGJINGJIE_PANEL:String = "SHOW_TONGLEFEISHENGJINGJIE_PANEL";
      
      public static const SHOW_ZHOUQIYOUHUI_PANEL:String = "SHOW_ZHOUQIYOUHUI_PANEL";
      
      public static const SHOW_SHENQIZHOUQI_PANEL:String = "SHOW_SHENQIZHOUQI_PANEL";
      
      public static const SHOW_1908_PANEL:String = "SHOW_1908_PANEL";
      
      public static const SHOW_QIXIHUODONG_PANEL:String = "SHOW_QIXIHUODONG_PANEL";
      
      public static const SHOW_LIBAOZHOUQI_PANEL:String = "SHOW_LIBAOZHOUQI_PANEL";
      
      public static const SHOW_SHIJIAN902_PANEL:String = "SHOW_SHIJIAN902_PANEL";
      
      public static const SHOW_YULANJIE_PANEL:String = "SHOW_YULANJIE_PANEL";
      
      public static const SHOW_HUANYINGWEIXI_PANEL:String = "SHOW_HUANYINGWEIXI_PANEL";
      
      public static const SHOW_DAZUO_WAIGUAN:String = "SHOW_DAZUO_WAIGUAN";
      
      public static const STARTUP_MINGYUGONG:String = MingYuGong_ApplicationFacade.NAME;
      
      public static const SHOW_CHONGJIUHUODONG_PANEL:String = "SHOW_CHONGJIUHUODONG_PANEL";
      
      public static const SHOW_WULINZHENYUAN_PANEL:String = "SHOW_WULINZHENYUAN_PANEL";
      
      public static const SHOW_KAIXUEQIQIU_PANEL:String = "SHOW_KAIXUEQIQIU_PANEL";
      
      public static const SHOW_YITIANTULONG_PANEL:String = "SHOW_YITIANTULONG_PANEL";
      
      public static const STARTUP_YITIANTULONG:String = YiTianTuLong_ApplicationFacade.NAME;
      
      public static const STARTUP_TULONGDAO:String = TuLongDao_ApplicationFacade.NAME;
      
      public static const STARTUP_JINSHEJIANFA:String = JinSheJianFa_ApplicationFacade.NAME;
      
      public static const SHOW_HUOZHENJIASHI_PANEL:String = "SHOW_HUOZHENJIASHI_PANEL";
      
      public static const SHOW_XUANWUXINGJUN_PANEL:String = "SHOW_XUANWUXINGJUN_PANEL";
      
      public static const SHOW_WANGZHEZHENGXIONG_PANEL:String = "SHOW_WANGZHEZHENGXIONG_PANEL";
      
      public static const SHOW_WANGZHEHUODONG6_PANEL:String = "SHOW_WANGZHEHUODONG6_PANEL";
      
      public static const SHOW_BAIHUXINGJUN_PANEL:String = "SHOW_BAIHUXINGJUN_PANEL";
      
      public static const SHOW_ZHONGQIU2017_PANEL:String = "SHOW_ZHONGQIU2017_PANEL";
      
      public static const SHOW_QINGLONGXINGJUN_PANEL:String = "SHOW_QINGLONGXINGJUN_PANEL";
      
      public static const SHOW_LIHEJUE_PANEL:String = "SHOW_LIHEJUE_PANEL";
      
      public static const SHOW_10YUEYOUHUIZHOUQI_PANEL:String = "SHOW_10YUEYOUHUIZHOUQI_PANEL";
      
      public static const SHOW_MEITIANYOUHUIIBAO2_PANEL:String = "SHOW_MEITIANYOUHUIIBAO2_PANEL";
      
      public static const SHOW_ZHUQUEXINGJUN_PANEL:String = "SHOW_ZHUQUEXINGJUN_PANEL";
      
      public static const SHOW_20171020_PANEL:String = "SHOW_20171020_PANEL";
      
      public static const SHOW_ZENGSONGNVREN_PANEL:String = "SHOW_ZENGSONGNVREN_PANEL";
      
      public static const SHOW_SUIXINXIAOFEI_PANEL:String = "SHOW_SUIXINXIAOFEI_PANEL";
      
      public static const STARTUP_CUQIANKUNGFU:String = CuQianKungFu_ApplicationFacade.NAME;
      
      public static const STARTUP_QINGDIESHUANGREN:String = QingDieShuangRen_ApplicationFacade.NAME;
      
      public static const ZHANLI_200ZHUANGBEI:String = "ZHANLI_200ZHUANGBEI";
      
      public static const SHOW_LIUNIANHUODONG_PANEL:String = "SHOW_LIUNIANHUODONG_PANEL";
      
      public static const SHOW_LIUNIANPEIBAN_PANEL:String = "SHOW_LIUNIANPEIBAN_PANEL";
      
      public static const SHOW_GANENLIUNIAN_PANEL:String = "SHOW_GANENLIUNIAN_PANEL";
      
      public static const SHOW_SHENGRIZHOUQI_PANEL:String = "SHOW_SHENGRIZHOUQI_PANEL";
      
      public static const SHOW_HUAZHUANGDASAI_PANEL:String = "SHOW_HUAZHUANGDASAI_PANEL";
      
      public static const SHOW_HUAZHUANGLIBAO_PANEL:String = "SHOW_HUAZHUANGLIBAO_PANEL";
      
      public static const SHOW_CHIBANGLIBAO_PANEL:String = "SHOW_CHIBANGLIBAO_PANEL";
      
      public static const SHOW_XUANTIEZHIXINGZHOUQI_PANEL:String = "SHOW_XUANTIEZHIXINGZHOUQI_PANEL";
      
      public static const SHOW_0601SHIJIAN_PANEL:String = "SHOW_0601SHIJIAN_PANEL";
      
      public static const SHOW_QINGLONGXINGJUNFUWEN_PANEL:String = "SHOW_QINGLONGXINGJUNFUWEN_PANEL";
      
      public static const SHOW_NEILIGAISHI_PANEL:String = "SHOW_NEILIGAISHI_PANEL";
      
      public static const SHOW_CHAOJIXIANGLONGZHOUQI_PANEL:String = "SHOW_CHAOJIXIANGLONGZHOUQI_PANEL";
      
      public static const SHOW_2017JIAOSHIJIE_PANEL:String = "SHOW_2017JIAOSHIJIE_PANEL";
      
      public static const SHOW_2017SHUANGLONGZHAN_PANEL:String = "SHOW_2017SHUANGLONGZHAN_PANEL";
      
      public static const SHOW_2017ZHENPINZHOUQI_PANEL:String = "SHOW_2017ZHENPINZHOUQI_PANEL";
      
      public static const SHOW_20171205SHIJIAN_PANEL:String = "SHOW_20171205SHIJIAN_PANEL";
      
      public static const SHOW_20171212SHIJIAN_PANEL:String = "SHOW_20171212SHIJIAN_PANEL";
      
      public static const SHOW_YITIANBAOJINZHOUQI_PANEL:String = "SHOW_YITIANBAOJINZHOUQI_PANEL";
      
      public static const SHOW_20171219SHIJIAN_PANEL:String = "SHOW_20171219SHIJIAN_PANEL";
      
      public static const SHOW_YINSHECHUDONG_PANEL:String = "SHOW_YINSHECHUDONG_PANEL";
      
      public static const SHOW_20171226SHIJIAN_PANEL:String = "SHOW_20171226SHIJIAN_PANEL";
      
      public static const SHOW_SHENGDANCHONGMAN_PANEL:String = "SHOW_SHENGDANCHONGMAN_PANEL";
      
      public static const SHOW_WANSHIXING_PANEL:String = "SHOW_WANSHIXING_PANEL";
      
      public static const SHOW_QIANGHUAJINSHEN_PANEL:String = "SHOW_QIANGHUAJINSHEN_PANEL";
      
      public static const SHOW_PEIYANGDIANFENGSHOU_PANEL:String = "SHOW_PEIYANGDIANFENGSHOU_PANEL";
      
      public static const STARTUP_XINGYUNZHUANZHUANLE:String = XingYunZhuanZhuanLe_ApplicationFacade.NAME;
      
      public static const SHOW_XINGYUNZHUANZHUANLE_PANEL:String = "SHOW_XINGYUNZHUANZHUANLE_PANEL";
      
      public static const SHOW_YITIANTULONGDAO_PANEL:String = "SHOW_YITIANTULONGDAO_PANEL";
      
      public static const SHOW_TIANRENHE_PANEL:String = "SHOW_TIANRENHE_PANEL";
      
      public static const SHOW_RONGQINGAIYI_PANEL:String = "SHOW_RONGQINGAIYI_PANEL";
      
      public static const SHOW_CHAOJIWULINDABAO_PANEL:String = "SHOW_CHAOJIWULINDABAO_PANEL";
      
      public static const SHOW_WUFANGQIANGHUA_PANEL:String = "SHOW_WUFANGQIANGHUA_PANEL";
      
      public static const SHOW_DUANLIAN_PANEL:String = "SHOW_DUANLIAN_PANEL";
      
      public static const SHOW_PILIANGUSE_PANEL:String = "SHOW_PILIANGUSE_PANEL";
      
      public static const SHOW_2018FUNVJIE_PANEL:String = "SHOW_2018FUNVJIE_PANEL";
      
      public static const SHOW_JINSHENZHOUQI_PANEL:String = "SHOW_JINSHENZHOUQI_PANEL";
      
      public static const SHOW_BAIQIAOKELI_PANEL:String = "SHOW_BAIQIAOKELI_PANEL";
      
      public static const SHOW_DAJINSHENZHOUQI_PANEL:String = "SHOW_DAJINSHENZHOUQI_PANEL";
      
      public static const SHOW_TIANRENHE2_PANEL:String = "SHOW_TIANRENHE2_PANEL";
      
      public static const SHOW_QIANGHUAJINSHEN2_PANEL:String = "SHOW_QIANGHUAJINSHEN2_PANEL";
      
      public static const SHOW_QIANGHUAJINSHEN3_PANEL:String = "SHOW_QIANGHUAJINSHEN3_PANEL";
      
      public static const SHOW_YUANBAOYOUHUI_PANEL:String = "SHOW_YUANBAOYOUHUI_PANEL";
      
      public static const SHOW_YURENJIE2018_PANEL:String = "SHOW_YURENJIE2018_PANEL";
      
      public static const SHOW_CHANGNIANCHONGZHI_PANEL:String = "SHOW_CHANGNIANCHONGZHI_PANEL";
      
      public static const SHOW_HANSHIJIE_PANEL:String = "SHOW_HANSHIJIE_PANEL";
      
      public static const SHOW_DASHENGZHOUQI_PANEL:String = "SHOW_DASHENGZHOUQI_PANEL";
      
      public static const SHOW_2018LAODONGJIE_PANEL:String = "SHOW_2018LAODONGJIE_PANEL";
      
      public static const SHOW_BANBENYOUHUI_PANEL:String = "SHOW_BANBENYOUHUI_PANEL";
      
      public static const SHOW_LIXIA2018_PANEL:String = "SHOW_LIXIA2018_PANEL";
      
      public static const SHOW_SHUIGUOLEIJI_PANEL:String = "SHOW_SHUIGUOLEIJI_PANEL";
      
      public static const SHOW_519HUODONG2018_PANEL:String = "SHOW_519HUODONG2018_PANEL";
      
      public static const SHOW_TIANXIAWUGONGCHUSHAOLIN_PANEL:String = "SHOW_TIANXIAWUGONGCHUSHAOLIN_PANEL";
      
      public static const SHOW_CHAOJIZHOUQI_PANEL:String = "SHOW_CHAOJIZHOUQI_PANEL";
      
      public static const SHOW_YUEXIAOFEIYUELINGJIANG_PANEL:String = "SHOW_YUEXIAOFEIYUELINGJIANG_PANEL";
      
      public static const SHOW_ZHIZUNCHENGHAOZHENGDUO_PANEL:String = "SHOW_ZHIZUNCHENGHAOZHENGDUO_PANEL";
      
      public static const SHOW_TAOHUAZHIJING_PANEL:String = "SHOW_TAOHUAZHIJING_PANEL";
      
      public static const SHOW_QUANZHENXIAOYAO_PANEL:String = "SHOW_QUANZHENXIAOYAO_PANEL";
      
      public static const SHOW_LIANXUBAOMING_PANEL:String = "SHOW_LIANXUBAOMING_PANEL";
      
      public static const SHOW_DUANWU2018_PANEL:String = "SHOW_DUANWU2018_PANEL";
      
      public static const SHOW_XIATIANKUAILE_PANEL:String = "SHOW_XIATIANKUAILE_PANEL";
      
      public static const SHOW_HUANQIUKAIMU_PANEL:String = "SHOW_HUANQIUKAIMU_PANEL";
      
      public static const SHOW_MINGJIAOZHIZUN_PANEL:String = "SHOW_MINGJIAOZHIZUN_PANEL";
      
      public static const SHOW_FEISHENGSHENBAO_PANEL:String = "SHOW_FEISHENGSHENBAO_PANEL";
      
      public static const SHOW_ZHENGDUOZHAN_PANEL:String = "SHOW_ZHENGDUOZHAN_PANEL";
      
      public static const SHOW_DAGENGXINHUODONG_PANEL:String = "SHOW_DAGENGXINHUODONG_PANEL";
      
      public static const SHOW_WANGZHEZHOUQI_PANEL:String = "SHOW_WANGZHEZHOUQI_PANEL";
      
      public static const SHOW_WANGZHEZHIBANGHD_PANEL:String = "SHOW_WANGZHEZHIBANGHD_PANEL";
      
      public static const SHOW_YINGJIEFUNVJIE_PANEL:String = "SHOW_YINGJIEFUNVJIE_PANEL";
      
      public static const SHOW_ZHOUYIKUAILE_PANEL:String = "SHOW_ZHOUYIKUAILE_PANEL";
      
      public static const SHOW_ZHOUMORENAO_PANEL:String = "SHOW_ZHOUMORENAO_PANEL";
      
      public static const SHOW_NPCDUIHUAXUNHUA_PANEL:String = "SHOW_NPCDUIHUAXUNHUA_PANEL";
      
      public static const SHOW_SHENGDANZHIZHAN_PANEL:String = "SHOW_SHENGDANZHIZHAN_PANEL";
      
      public static const SHOW_GAISHI_PANEL:String = "SHOW_GAISHI_PANEL";
      
      public static const SHOW_CHONGZHIDAY_PANEL:String = "SHOW_CHONGZHIDAY_PANEL";
      
      public static const STARTUP_MOSHOUZHANCHANG:String = MoShouZhanChang_ApplicationFacade.NAME;
      
      public static const GET_MOSHOUZHANCHANG_PANEL:String = "GET_MOSHOUZHANCHANG_PANEL";
      
      public static const MOSHOUZHANCHANG_FUHUO_CLICK:String = "MOSHOUZHANCHANG_FUHUO_CLICK";
      
      public static const STARTUP_VIP:String = VIP_ApplicationFacade.NAME;
      
      public static const SHOW_VIP_PANEL:String = "SHOW_VIP_PANEL";
      
      public static const STARTUP_XIANMOZHILU:String = XianMoZhiLu_ApplicationFacade.NAME;
      
      public static const GET_XIANMOZHILU_PANEL:String = "GET_XIANMOZHILU_PANEL";
      
      public static const SHOW_XIANMOZHILU:String = "SHOW_XIANMOZHILU";
      
      public static const GET_ZHONGZU_PANEL:String = "GET_ZHONGZU_PANEL";
      
      public static const SHOW_ZHONGZU_PLANE:String = "SHOW_ZHONGZU_PLANE";
      
      public static const SHOW_AOJIANFEISHENG_PANEL:String = "SHOW_AOJIANFEISHENG_PANEL";
      
      public static const STARTUP_AOJIANFEISHENG:String = AoJianFeiSheng_ApplicationFacade.NAME;
      
      public static const GET_AOJIANFEISHENG_PANEL:String = "GET_AOJIANFEISHENG_PANEL";
      
      public static const GET_XIANMOWUDAJI:String = "GET_XIANMOWUDAJI";
      
      public static const STARTUP_XIANMOWUDAJI:String = XianMoWuDaJi_ApplicationFacade.NAME;
      
      public static const STARTUP_AOJIANZHUANSHENG:String = AoJianZhuanSheng_ApplicationFacade.NAME;
      
      public static const SHOW_AOJIANZHUANSHENG:String = "SHOW_AOJIANZHUANSHENG";
      
      public static const UI_ZHONGZUJIEMIAN_WAIXIAN_CLICK:String = "UI_ZHONGZUJIEMIAN_WAIXIAN_CLICK";
      
      public static const UI_ZHONGZUJIEMIAN_YICHU_CLICK:String = "UI_ZHONGZUJIEMIAN_YICHU_CLICK";
      
      public static const UI_ZHONGZUJIEMIAN_SKILL_DRAG:String = "UI_ZHONGZUJIEMIAN_SKILL_DRAG";
      
      public static const STARTUP_MENPAIJUEXUE:String = MenPaiJueXue_ApplicationFacade.NAME;
      
      public static const SHOW_MENPAIJUEXUE_PANEL:String = "SHOW_MENPAIJUEXUE_PANEL";
      
      public static const UI_MENPAIJUEXUE_SKILL_DRAG:String = "UI_MENPAIJUEXUE_SKILL_DRAG";
      
      public static const STARTUP_MENPAINEIFA:String = MenPaiNeiFa_ApplicationFacade.NAME;
      
      public static const SHOW_MENPAINEIFA_PANEL:String = "SHOW_MENPAINEIFA_PANEL";
      
      public static const UI_MENPAINEIFA_SKILL_DRAG:String = "UI_MENPAINEIFA_SKILL_DRAG";
      
      public static const STARTUP_CANGJIANXUANTIAN:String = CangJianXuanTian_ApplicationFacade.NAME;
      
      public static const BUY_GOOD_SUCCESS:String = "BUY_GOOD_SUCCESS";
      
      public static const STARTUP_YUANWU:String = Yuanwu_Application.NAME;
      
      public static const SHOW_YUANWU_PANEL:String = "SHOW_YUANWU_PANEL";
      
      public static const SHOW_YUANWUHEXIN_PANEL:String = "SHOW_YUANWUHEXIN_PANEL";
      
      public static const SHOW_TARGETYUANWU_PANEL:String = "SHOW_TARGETYUANWU_PANEL";
      
      public static const SHOW_YUANWUPEIYANG_PANEL:String = "SHOW_YUANWUPEIYANG_PANEL";
      
      public static const SHOW_YUANWUPEIDAI_PANEL:String = "SHOW_YUANWUPEIDAI_PANEL";
      
      public static const BUY_GOOD:String = "BUY_GOOD";
      
      public static const FIND_BAGGOODS:String = "FIND_BAGGOODS";
      
      public static const LOCK_BACKPACK:String = "LOCK_BACKPACK";
      
      public static const GET_JIUJIEXINGTU_PANEL:String = "GET_JIUJIEXINGTU_PANEL";
      
      public static const GET_JIUJIEXINGTU_BOX_PANEL:String = "GET_JIUJIEXINGTU_BOX_PANEL";
      
      public static var SHOW_SHENGJIEDAHUIKUI_PANEL:String = "SHOW_SHENGJIEDAHUIKUI_PANEL";
      
      public static var SHOW_SHENGJIEDAHUIKUI_GOUMAI_PANEL:String = "SHOW_SHENGJIEDAHUIKUI_GOUMAI_PANEL";
      
      public static const STARTUP_WUHUNXITONG:String = WuHunXiTong_ApplicationFacade.NAME;
      
      public static const GET_WUHUNXITONG_PANEL:String = "GET_WUHUNXITONG_PANEL";
      
      public static const GET_CAIPIAO_PANEL:String = "GET_CAIPIAO_PANEL";
      
      public static const GET_LETOU_PANEL:String = "GET_LETOU_PANEL";
      
      public static const STARTUP_SIJUEJIANZHEN:String = SiJueJianZhen_ApplicationFacade.NAME;
      
      public static const GUIHUN_XUNZHANG:String = "GUIHUN_XUNZHANG";
      
      public function PipeConstants()
      {
         super();
      }
   }
}

