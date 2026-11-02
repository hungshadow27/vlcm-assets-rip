package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.NewButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.McBaseItem;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.BeiMingShenGong.model.info.BeiMingShenGongVO;
   import com.tgame.moudels.TaiXuanShenGong.model.info.TaiXuanShenGongVO;
   import com.tgame.moudels.XiSuiJing.model.info.XiSuiJingVO;
   import com.tgame.moudels.XiangLong.info.XiangLongMainPanelVO;
   import com.tgame.moudels.aojianshenjiangji.model.info.AoJianShenJiangJiVO;
   import com.tgame.moudels.bazhentu.model.info.BaZhenTuVO;
   import com.tgame.moudels.bihaichaoshengqu.model.info.BiHaiChaoShengQuVo;
   import com.tgame.moudels.cangjianxuantian.model.info.CangJianXuanTianVO;
   import com.tgame.moudels.canhezhi.model.info.CanHeZhiVo;
   import com.tgame.moudels.changSheZhen.model.info.ChangSheZhenVO;
   import com.tgame.moudels.changshengjue.model.info.ChangShengJueVO;
   import com.tgame.moudels.chiBang.model.info.ChiBangVo;
   import com.tgame.moudels.cuqiankungfu.model.info.CuQianKungFuVO;
   import com.tgame.moudels.dizaizhen.model.info.DiZaiZhenVO;
   import com.tgame.moudels.douZhuanXingYi.model.info.DouZhuanXingYiVO;
   import com.tgame.moudels.duguqiubai.model.info.DuGuQiuBaiVO;
   import com.tgame.moudels.duomingshisanjian.model.info.DuoMingShiSanJianVo;
   import com.tgame.moudels.emozhiyi.model.info.EMoZhiYiVo;
   import com.tgame.moudels.feilongtanyunshou.model.info.FeiLongTanYunShouVO;
   import com.tgame.moudels.fengyangzhen.model.info.FengYangZhenVO;
   import com.tgame.moudels.fumozhangfa.model.info.FuMoZhangFaVO;
   import com.tgame.moudels.guiliuzhen.model.info.GuiLiuZhenVO;
   import com.tgame.moudels.hamagong.info.HaMaGongVO;
   import com.tgame.moudels.hanbingshenzhang.model.info.HanBingShenZhangVo;
   import com.tgame.moudels.heYiZhen.model.info.HeYiZhenVO;
   import com.tgame.moudels.hutaozhen.model.info.HuTaoZhenVO;
   import com.tgame.moudels.huyijuexing.model.info.HuYiJueXingVO;
   import com.tgame.moudels.jinSheJianFa.model.info.JinSheJianFaVO;
   import com.tgame.moudels.jingangfumoquan.model.info.JingangfumoquanVo;
   import com.tgame.moudels.jingleiqiang.model.info.JingLeiQiangVo;
   import com.tgame.moudels.jiuquhuanghezhen.model.info.JiuQuHuangHeZhenVO;
   import com.tgame.moudels.kongmingquan.model.info.KongMingQuanVo;
   import com.tgame.moudels.langhundun.model.info.LangHunDunVO;
   import com.tgame.moudels.lianQi.model.info.LianQiVO;
   import com.tgame.moudels.liangyiweichenzhen.model.info.LiangYiWeiChenZhenVo;
   import com.tgame.moudels.liekongjuexing.model.info.LieKongJueXingVO;
   import com.tgame.moudels.lingxiyizhi.model.info.LingXiYiZhiVo;
   import com.tgame.moudels.longyajuexing.model.info.LongYaJueXingVO;
   import com.tgame.moudels.longyinjuexing.model.info.LongYinJueXingVO;
   import com.tgame.moudels.luoyingshenjianzhang.model.info.LuoYingShenJianZhangVO;
   import com.tgame.moudels.molingzhiyi.model.info.MoLingZhiYiVO;
   import com.tgame.moudels.pangxiezhen.model.info.PangXieZhenVO;
   import com.tgame.moudels.qingdieshuangren.model.info.QingDieShuangRenVO;
   import com.tgame.moudels.qinlonggong.model.info.QinLongGongVo;
   import com.tgame.moudels.qishangquan.model.info.QiShangQuanVo;
   import com.tgame.moudels.qishazhen.model.info.QiShaZhenVo;
   import com.tgame.moudels.quanshenjuexing.model.info.QuanShenJueXingVO;
   import com.tgame.moudels.rulaishenzhang.model.info.RuLaiShenZhangVO;
   import com.tgame.moudels.shengsifu.model.info.ShengSiFuVO;
   import com.tgame.moudels.shenxingbaibian.model.info.ShenXingBaiBianVO;
   import com.tgame.moudels.shenzhaojing.info.ShenzhaojingVO;
   import com.tgame.moudels.shibatongren.model.info.ShiBaTongRenMainPanelVO;
   import com.tgame.moudels.sijuejianzhen.model.info.SiJueJianZhenVo;
   import com.tgame.moudels.taohuazhen.model.info.TaoHuaZhenVO;
   import com.tgame.moudels.tengtianyi.model.info.TengtianyiVo;
   import com.tgame.moudels.tianMenZhen.model.info.TianMenZhenVO;
   import com.tgame.moudels.tianshanliuyangzhang.model.info.TianShanLiuYangZhangVo;
   import com.tgame.moudels.tianyuyanmeng.model.info.TianYuYanMengVO;
   import com.tgame.moudels.tulongdao.model.info.TuLongDaoVO;
   import com.tgame.moudels.wanhunzhen.model.info.WanHunZhenVO;
   import com.tgame.moudels.woDeMenPai.view.MenPai;
   import com.tgame.moudels.xiakexing.model.info.XiaKeXingVO;
   import com.tgame.moudels.xiantiangong.model.info.XianTianGongVo;
   import com.tgame.moudels.xiaoyaoyufeng.model.info.XiaoYaoYuFengVO;
   import com.tgame.moudels.xingxiuzhen.model.info.XingXiuZhenVo;
   import com.tgame.moudels.xingxiuzhen1.model.info.XingXiuZhen1Vo;
   import com.tgame.moudels.xuanXiangZhen.model.info.XuanXiangZhenVO;
   import com.tgame.moudels.xuantiejianfa.model.info.XuanTieJianFaVO;
   import com.tgame.moudels.xuedaoxinfa.model.info.XueDaoXinFaVO;
   import com.tgame.moudels.xueyinjuexing.model.info.XueYinJueXingVO;
   import com.tgame.moudels.yanXingZhen.model.info.YanXingZhenVO;
   import com.tgame.moudels.yanYueZhen.model.info.YanYueZhenVO;
   import com.tgame.moudels.yiJinJing.model.info.YiJinJingVO;
   import com.tgame.moudels.yuLiZhen.model.info.YuLiZhenVO;
   import com.tgame.moudels.yunlongzhen.model.info.YunLongZhenVO;
   import com.tgame.moudels.yunvsuxinjianfa.model.info.YuNvSuXinJianFaVO;
   import com.tgame.moudels.yuxiaojianfa.model.info.YuXiaoJianFaVo;
   import com.tgame.moudels.zhenlongqiju.model.info.ZhenLongQiJuVO;
   import com.tgame.moudels.zhenwuqijiezhen.model.info.ZhenWuQiJieZhenVO;
   import com.tgame.shell.view.components.attribute.Anqi;
   import com.tgame.shell.view.components.attribute.AoJianShenJiangJi;
   import com.tgame.shell.view.components.attribute.BaZhenTu;
   import com.tgame.shell.view.components.attribute.Baguazhang;
   import com.tgame.shell.view.components.attribute.BeiDouQiXingZhen;
   import com.tgame.shell.view.components.attribute.BeiMingShenGongPanel;
   import com.tgame.shell.view.components.attribute.BiHaiChaoShengQu;
   import com.tgame.shell.view.components.attribute.Bow;
   import com.tgame.shell.view.components.attribute.CanHeZhi;
   import com.tgame.shell.view.components.attribute.CangJianXuanTianPanel;
   import com.tgame.shell.view.components.attribute.ChangSheZhen;
   import com.tgame.shell.view.components.attribute.ChangShengJue;
   import com.tgame.shell.view.components.attribute.ChiBang;
   import com.tgame.shell.view.components.attribute.ChiXueMoZhen;
   import com.tgame.shell.view.components.attribute.CuQianKungFu;
   import com.tgame.shell.view.components.attribute.Dantian;
   import com.tgame.shell.view.components.attribute.DiZaiZhen;
   import com.tgame.shell.view.components.attribute.Dongxiao;
   import com.tgame.shell.view.components.attribute.DouZhuanXingYi;
   import com.tgame.shell.view.components.attribute.DuGuQiuBai;
   import com.tgame.shell.view.components.attribute.DuguJiujian;
   import com.tgame.shell.view.components.attribute.DuoMingShiSanJian;
   import com.tgame.shell.view.components.attribute.EMoZhiYi;
   import com.tgame.shell.view.components.attribute.Feilongtanyunshou;
   import com.tgame.shell.view.components.attribute.FengYangZhen;
   import com.tgame.shell.view.components.attribute.FuMoZhangFa;
   import com.tgame.shell.view.components.attribute.FuWenKeHua;
   import com.tgame.shell.view.components.attribute.GanJiangMoYe;
   import com.tgame.shell.view.components.attribute.GuiLiuZhen;
   import com.tgame.shell.view.components.attribute.HaMaGong;
   import com.tgame.shell.view.components.attribute.HanBingZhang;
   import com.tgame.shell.view.components.attribute.HeYiZhen;
   import com.tgame.shell.view.components.attribute.HuTaoZhen;
   import com.tgame.shell.view.components.attribute.Huashanlunjian;
   import com.tgame.shell.view.components.attribute.HuyiJuexing;
   import com.tgame.shell.view.components.attribute.JinChanTuoQiao;
   import com.tgame.shell.view.components.attribute.JinGangFuMoQuan;
   import com.tgame.shell.view.components.attribute.JinSheJianFaPanel;
   import com.tgame.shell.view.components.attribute.JinZhongZhao;
   import com.tgame.shell.view.components.attribute.JingJie;
   import com.tgame.shell.view.components.attribute.JiuQuHuangHeZhen;
   import com.tgame.shell.view.components.attribute.Jiuyang;
   import com.tgame.shell.view.components.attribute.Jiuyinzhenjing;
   import com.tgame.shell.view.components.attribute.JueZhanGuangMingDing;
   import com.tgame.shell.view.components.attribute.KongMingQuan;
   import com.tgame.shell.view.components.attribute.LangHunDun;
   import com.tgame.shell.view.components.attribute.LianQi;
   import com.tgame.shell.view.components.attribute.LieKongJueXing;
   import com.tgame.shell.view.components.attribute.LingXiYiZhi;
   import com.tgame.shell.view.components.attribute.Liumaishenjian;
   import com.tgame.shell.view.components.attribute.LongYaJueXing;
   import com.tgame.shell.view.components.attribute.LongYinJueXing;
   import com.tgame.shell.view.components.attribute.LuoYingShenJianZhang;
   import com.tgame.shell.view.components.attribute.Mingyugong;
   import com.tgame.shell.view.components.attribute.MoLingZhiYi;
   import com.tgame.shell.view.components.attribute.OtherPlayerAttributeCanvas;
   import com.tgame.shell.view.components.attribute.PangXieZhen;
   import com.tgame.shell.view.components.attribute.QiMenZhen;
   import com.tgame.shell.view.components.attribute.QiShangQuanPanel;
   import com.tgame.shell.view.components.attribute.QinLongGong;
   import com.tgame.shell.view.components.attribute.QingDieShuangRenPanel;
   import com.tgame.shell.view.components.attribute.QuanShenJueXing;
   import com.tgame.shell.view.components.attribute.Rijinlun;
   import com.tgame.shell.view.components.attribute.RuLaiShenZhang;
   import com.tgame.shell.view.components.attribute.SanShiLiuShouDianXueShu;
   import com.tgame.shell.view.components.attribute.ShenXingBaiBian;
   import com.tgame.shell.view.components.attribute.ShenZhaoJing;
   import com.tgame.shell.view.components.attribute.ShengSiFu;
   import com.tgame.shell.view.components.attribute.ShiBaTongRen;
   import com.tgame.shell.view.components.attribute.SiJueJianZhen;
   import com.tgame.shell.view.components.attribute.SmithingBody;
   import com.tgame.shell.view.components.attribute.TaiXuanShenGong;
   import com.tgame.shell.view.components.attribute.TaoHuaZhen;
   import com.tgame.shell.view.components.attribute.TianFu;
   import com.tgame.shell.view.components.attribute.TianMenZhen;
   import com.tgame.shell.view.components.attribute.TianShanLiuYangZhang;
   import com.tgame.shell.view.components.attribute.TianYuYanMeng;
   import com.tgame.shell.view.components.attribute.TuLongDao;
   import com.tgame.shell.view.components.attribute.WanHunZhen;
   import com.tgame.shell.view.components.attribute.WoDeMenPai;
   import com.tgame.shell.view.components.attribute.WoDeRongYu;
   import com.tgame.shell.view.components.attribute.WuDuZhen;
   import com.tgame.shell.view.components.attribute.WuXingQuan;
   import com.tgame.shell.view.components.attribute.WuXingZhen;
   import com.tgame.shell.view.components.attribute.WuXingZhiRen;
   import com.tgame.shell.view.components.attribute.Wulizhi;
   import com.tgame.shell.view.components.attribute.XiaKeXing;
   import com.tgame.shell.view.components.attribute.XianTianGong;
   import com.tgame.shell.view.components.attribute.XiangLongSHiBaZhang;
   import com.tgame.shell.view.components.attribute.XiangYangZhiZhan;
   import com.tgame.shell.view.components.attribute.XiaoYaoYuFeng;
   import com.tgame.shell.view.components.attribute.Xisuijing;
   import com.tgame.shell.view.components.attribute.XiuweiPanel;
   import com.tgame.shell.view.components.attribute.XuanTieJianFa;
   import com.tgame.shell.view.components.attribute.XuanXiangZhen;
   import com.tgame.shell.view.components.attribute.XueDaoXinFa;
   import com.tgame.shell.view.components.attribute.XueYinJueXing;
   import com.tgame.shell.view.components.attribute.XunZhangYangCheng;
   import com.tgame.shell.view.components.attribute.YanXingZhen;
   import com.tgame.shell.view.components.attribute.YanYueZhen;
   import com.tgame.shell.view.components.attribute.Yijinjing;
   import com.tgame.shell.view.components.attribute.YuLiZhen;
   import com.tgame.shell.view.components.attribute.YuNvSuXinJianFa;
   import com.tgame.shell.view.components.attribute.YuXiaoJianFa;
   import com.tgame.shell.view.components.attribute.Yuejinlun;
   import com.tgame.shell.view.components.attribute.YunCheng;
   import com.tgame.shell.view.components.attribute.YunLongZhen;
   import com.tgame.shell.view.components.attribute.ZhanQi;
   import com.tgame.shell.view.components.attribute.ZhanhunCanvas;
   import com.tgame.shell.view.components.attribute.ZhenLongQiJu;
   import com.tgame.shell.view.components.attribute.ZhenWuQiJieZhen;
   import com.tgame.shell.view.components.attribute.ZhenYanShouYin;
   import com.tgame.shell.view.components.attribute.ZiXiaShenGong;
   import com.tgame.shell.view.components.attribute.niaoxiangzhen.NiaoXiangZhen;
   import com.tgame.shell.view.components.attribute.niaoxiangzhen.NiaoXiangZhenConst;
   import com.tgame.shell.view.components.attribute.niaoxiangzhen.NiaoXiangZhenTargetController;
   import com.tgame.shell.view.components.attribute.tengtianyi.TengtianyiPanel;
   import com.tgame.shell.view.components.attribute.tianfuzhen.TianFuZhen;
   import com.tgame.shell.view.components.attribute.tianfuzhen.TianFuZhenConst;
   import com.tgame.shell.view.components.attribute.tianfuzhen.TianFuZhenTargetController;
   import com.tgame.shell.view.components.attribute.tushidahui.Tushidahui;
   import com.tgame.shell.view.components.attribute.tushidahui.TushidahuiConst;
   import com.tgame.shell.view.components.attribute.tushidahui.TushidahuiTargetController;
   import com.tgame.shell.view.components.jingleiqiang.JingLeiQiang;
   import com.tgame.shell.view.components.liangyiweichenzhen.LiangYiWeiChenZhen;
   import com.tgame.shell.view.components.qishazhen.QiShaZhen;
   import com.tgame.shell.view.components.ride.Ride;
   import com.tgame.shell.view.components.siLingZhen.SiLingZhenCanvas;
   import com.tgame.shell.view.components.ta.TAVenation;
   import com.tgame.shell.view.components.xingxiuzhen.XingXiuZhen;
   import com.tgame.shell.view.components.xingxiuzhen1.XingXiuZhen1;
   import com.tgame.shell.view.components.ynSpecial.YNGuiHun;
   import com.tgame.shell.view.components.ynSpecial.YNJingLing;
   import com.tgame.shell.view.components.ynSpecial.YNjinfengdiao;
   import com.tgame.shell.view.components.ynSpecial.YNliulongzhuangbei;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class TargetAttribute extends FPanel
   {
      
      public static const UI_TARGETATTRIBUTE_ATTRIBUTE_SHOW:String = "UI_TARGETATTRIBUTE_ATTRIBUTE_SHOW";
      
      public static const UI_TARGETATTRIBUTE_RIDE_SHOW:String = "UI_TARGETATTRIBUTE_RIDE_SHOW";
      
      public static const UI_TARGETATTRIBUTE_ANQI_SHOW:String = "UI_TARGETATTRIBUTE_ANQI_SHOW";
      
      public static const GET_OTHERPLAYER_PRIVATECHAT:String = "GET_OTHERPLAYER_PRIVATECHAT";
      
      public static const GET_OTHERPLAYER_TRADING:String = "GET_OTHERPLAYER_TRADING";
      
      public static const GET_OTHERPLAYER_CHEER:String = "GET_OTHERPLAYER_CHEER";
      
      public static const GET_OTHERPLAYER_TEAM:String = "GET_OTHERPLAYER_TEAM";
      
      public static const GET_OTHERPLAYER_ADORE:String = "GET_OTHERPLAYER_ADORE";
      
      public static const GET_OTHERPLAYER_DESPISE:String = "GET_OTHERPLAYER_DESPISE";
      
      public static const GET_OTHERPLAYER_ZHANDOULI:String = "GET_OTHERPLAYER_ZHANDOULI";
      
      public static const GET_OTHERPLAYER_CHENGJIUJINDU:String = "GET_OTHERPLAYER_CHENGJIUJINDU";
      
      public static const GETDUANZAOROUSHEN:String = "GETDUANZAOROUSHEN";
      
      public static const GETVENATION:String = "GETVENATION";
      
      public static const UI_TARGETRIDETIPS_SHOW:String = "UI_TARGETRIDETIPS_SHOW";
      
      public static const UI_TARGETRIDE_DIANFENGSHOU_SHOW:String = "UI_TARGETRIDE_DIANFENGSHOU_SHOW";
      
      public static const UI_TA_VENATION_EVENT_CLICK:String = "UI_TA_VENATION_EVENT_CLICK";
      
      public static const UI_TA_VENATION_GET_POINT_ATTRIBUTE:String = "UI_TA_VENATION_GET_POINT_ATTRIBUTE";
      
      public static const GETRIDEINTBYID:String = "ui.targetAttribute.get.rideinfobyid";
      
      public static const GETGONGJIAN:String = "GETGONGJIAN";
      
      public static const GETDANTIAN:String = "GETDANTIAN";
      
      public static const DUGUJIUJIAN:String = "DUGUJIUJIAN";
      
      public static const DONGXIAO:String = "DONGXIAO";
      
      public static const GETDUANZAOROUSHENB:String = "GETDUANZAOROUSHENB";
      
      public static const DUGUJIUJIANJ:String = "DUGUJIUJIANJ";
      
      public static const XIANGLONGSHIBAZHANGJ:String = "XIANGLONGSHIBAZHANGJ";
      
      public static const YIJINJING:String = "YIJINJING";
      
      public static const JINGJIE:String = "JINGJIE";
      
      public static const YIJINJING_X:String = "YIJINJING_X";
      
      public static const FEILONGTANYUNSHOU:String = "FEILONGTANYUNSHOU";
      
      public static const JIUYINZHENJING:String = "JIUYINZHENJING";
      
      public static const GETYUNCHENG:String = "GETYUNCHENG";
      
      public static const GETWULIZHI:String = "GETWULIZHI";
      
      public static const WUXINGQUAN:String = "WUXINGQUAN";
      
      public static const SHIBATONGREN:String = "SHIBATONGREN";
      
      public static const GETZHANQI:String = "GETZHANQI";
      
      public static const LIUMAISHENJIAN:String = "LIUMAISHENJIAN";
      
      public static const UI_SHENJIAN_EVENT_CLICK:String = "UI_SHENJIAN_EVENT_CLICK";
      
      public static const WUXINGZHIREN:String = "WUXINGZHIREN";
      
      public static const JINZHONGZHAO:String = "JINZHONGZHAO";
      
      public static const GETZHANHUN:String = "GETZHANHUN";
      
      public static const UI_ZHUANGBEI_CLICK:String = "UI_ZHUANGBEI_CLICK";
      
      public static const XIUWEI:String = "XIUWEI";
      
      public static const TAIXUANSHENGONG:String = "TAIXUANSHENGONG";
      
      public static const BEIMINGSHENGONG:String = "BEIMINGSHENGONG";
      
      public static const QISHANGQUAN:String = "QISHANGQUAN";
      
      public static const ZIXIASHENGONG:String = "ZIXIASHENGONG";
      
      public static const HAMAGONG:String = "HAMAGONG";
      
      public static const GETSILINGZHEN:String = "GETSILINGZHEN";
      
      public static const SHENZHAOJING:String = "SHENZHAOJING";
      
      public static const QIMENZHEN:String = "QIMENZHEN";
      
      public static const GETTIANFU:String = "GETTIANFU";
      
      public static const TIANFU_XIANGQIAN_CLICK:String = "TIANFU_XIANGQIAN_CLICK";
      
      public static const WUXINGZHEN:String = "WUXINGZHEN";
      
      public static const CHIXUEMOZHEN:String = "CHIXUEMOZHEN";
      
      public static const SANSHILIUSHOU:String = "SANSHILIUSHOU";
      
      public static const BEIDOUQIXINGZHEN:String = "BEIDOUQIXINGZHEN";
      
      public static const JINCHANTUOQIAO:String = "JINCHANTUOQIAO";
      
      public static const JIUQUHUANGHEZHEN:String = "JIUQUHUANGHEZHEN";
      
      public static const ZHENWUQIJIEZHEN:String = "ZHENWUQIJIEZHEN";
      
      public static const DOUZHUANXINGYI:String = "DOUZHUANXINGYI";
      
      public static const JINGANGFUMOQUAN:String = "JINGANGFUMOQUAN";
      
      public static const XUNZHANGYANGCHENG:String = "XUNZHANGYANGCHENG";
      
      public static const GUILIUZHEN:String = "GUILIUZHEN";
      
      public static const QINLONGGONG:String = "QINLONGGONG";
      
      public static const CHIBANG:String = "CHIBANG";
      
      public static const TENGTIANYI:String = "TENGTIANYI";
      
      public static const XIAOYAOYUFENG:String = "XIAOYAOYUFENG";
      
      public static const LIANQI:String = "LIANQI";
      
      public static const TIANMENZHEN:String = "TIANMENZHEN";
      
      public static const BIHAICHAOSHENGQU:String = "BIHAICHAOSHENGQU";
      
      public static const HEYIZHEN:String = "HEYIZHEN";
      
      public static const YULIZHEN:String = "YULIZHEN";
      
      public static const YUXIAOJIANFA:String = "YUXIAOJIANFA";
      
      public static const YANYUEZHEN:String = "YANYUEZHEN";
      
      public static const CHANGSHEZHEN:String = "CHANGSHEZHEN";
      
      public static const CANHEZHI:String = "CANHEZHI";
      
      public static const EMOZHIYI:String = "EMOZHIYI";
      
      public static const YANXINGZHEN:String = "YANXINGZHEN";
      
      public static const XUANXIANGZHEN:String = "XUANXIANGZHEN";
      
      public static const JUEZHANGUANGMINGDING:String = "JUEZHANGUANGMINGDING";
      
      public static const GANJIANGMOYE:String = "GANJIANGMOYE";
      
      public static const HUTAOZHEN:String = "HUTAOZHEN";
      
      public static const YUNLONGZHEN:String = "YUNLONGZHEN";
      
      public static const XIANTIANGONG:String = "XIANTIANGONG";
      
      public static const WODERONGYU:String = "WODERONGYU";
      
      public static const REQUEST_YNHUANGDAO:String = "REQUEST_YNHUANGDAO";
      
      public static const REQUEST_ZHUANPAN:String = "REQUEST_ZHUANPAN";
      
      public static const REQUEST_WZZB:String = "REQUEST_WZZB";
      
      public static const REQUEST_FSZB:String = "REQUEST_FSZB";
      
      public static const PANGXIEZHEN:String = "PANGXIEZHEN";
      
      public static const XUEDAOXINFA:String = "XUEDAOXINFA";
      
      public static const HUYIJUEXING:String = "HUYIJUEXING";
      
      public static const DIZAIZHEN:String = "DIZAIZHEN";
      
      public static const FENGYANGZHEN:String = "FENGYANGZHEN";
      
      public static const LONGYAJUEXING:String = "LONGYAJUEXING";
      
      public static const QUANSHENJUEXING:String = "QUANSHENJUEXING";
      
      public static const WUDUZHEN:String = "WUDUZHEN";
      
      public static const LONGYINJUEXING:String = "LONGYINJUEXING";
      
      public static const SHENXINGBAIBIAN:String = "SHENXINGBAIBIAN";
      
      public static const LANGHUNDUN:String = "LANGHUNDUN";
      
      public static const WODEMENPAI:String = "WODEMENPAI";
      
      public static const RULAISHENZHANG:String = "RULAISHENZHANG";
      
      public static const DUGUQIUBAI:String = "DUGUQIUBAI";
      
      public static const LUOYINGSHENJIANZHANG:String = "LUOYINGSHENJIANZHANG";
      
      public static const BAZHENTU:String = "BAZHENTU";
      
      public static const XUANTIEJIANFA:String = "XUANTIEJIANFA";
      
      public static const CHANGSHENGJUE:String = "CHANGSHENGJUE";
      
      public static const WANHUNZHEN:String = "WANHUNZHEN";
      
      public static const ZHENYANSHOUYIN:String = "ZHENYANSHOUYIN";
      
      public static const ZHENLONGQIJU:String = "ZHENLONGQIJU";
      
      public static const SHENGSIFU:String = "SHENGSIFU";
      
      public static const TAOHUAZHEN:String = "TAOHUAZHEN";
      
      public static const XIAKEXING:String = "XIAKEXING";
      
      public static const MOLINGZHIYI:String = "MOLINGZHIYI";
      
      public static const FUMOZHANGFA:String = "FUMOZHANGFA";
      
      public static const YUNVSUXINJIANFA:String = "YUNVSUXINJIANFA";
      
      public static const TIANYUYANMENG:String = "TIANYUYANMENG";
      
      public static const LIEKONGJUEXING:String = "LIEKONGJUEXING";
      
      public static const TIANSHANLIUYANGZHANG:String = "TIANSHANLIUYANGZHANG";
      
      public static const AOJIANSHENJIANGJI:String = "AOJIANSHENJIANGJI";
      
      public static const UI_AOJIANSHENJIANGJI_QIEHUAN_CLICK:String = "UI_AOJIANSHENJIANGJI_QIEHUAN_CLICK";
      
      public static const DUOMINGSHISANJIAN:String = "DUOMINGSHISANJIAN";
      
      public static const RIJINLUN:String = "RIJINLUN";
      
      public static const KONGMINGQUAN:String = "KONGMINGQUAN";
      
      public static const XUEYINJUEXING:String = "XUEYINJUEXING";
      
      public static const YUEJINLUN:String = "YUEJINLUN";
      
      public static const HUASHANLUNJIAN:String = "HUASHANLUNJIAN";
      
      public static const HANBINGSHENZHANG:String = "HANBINGSHENZHANG";
      
      public static const LINGXIYIZHI:String = "LINGXIYIZHI";
      
      public static const LIULONGZHUANGBEI:String = "LIULONGZHUANGBEI";
      
      public static const JINGLINGQIXUAN:String = "JINGLINGQIXUAN";
      
      public static const GUIHUN:String = "GUIHUN";
      
      public static const XINGXIUZHEN:String = "XINGXIUZHEN";
      
      public static const XINGXIUZHEN1:String = "XINGXIUZHEN1";
      
      public static const QISHAZHEN:String = "QISHAZHEN";
      
      public static const FUWENKEHUA:String = "FUWENKEHUA";
      
      public static const UI_FUWENKEHUA_PAGE_CLICK:String = "UI_FUWENKEHUA_PAGE_CLICK";
      
      public static const UI_FUWENKEHUA_FUWENXINXI_CLICK:String = "UI_FUWENKEHUA_FUWENXINXI_CLICK";
      
      public static const LIANGYIWEICHENZHEN:String = "LIANGYIWEICHENZHEN";
      
      public static const SIJUEJIANZHEN:String = "SIJUEJIANZHEN";
      
      public static const XIANGYANGZHIZHAN:String = "XIANGYANGZHIZHAN";
      
      public static const JINGLEIQIANG:String = "JINGLEIQIANG";
      
      public static const MINGYUGONG:String = "MINGYUGONG";
      
      public static const TULONGDAO:String = "TULONGDAO";
      
      public static const JINSHEJIANFA:String = "JINSHEJIANFA";
      
      public static const CUQIANKUNGFU:String = "CUQIANKUNGFU";
      
      public static const QINGDIESHUANGREN:String = "QINGDIESHUANGREN";
      
      public static const CANGJIANXUANTIAN:String = "QINGDIESHUANGREN";
      
      public const MAX_VISIBLE_BTN_COUNT:int = 17;
      
      public var tabBar:FTabBar;
      
      public var tabBarRide:FTabBar;
      
      private var charContainer:OtherPlayerAttributeCanvas;
      
      private var venationContainer:TAVenation;
      
      private var smithingbodyContainer:SmithingBody;
      
      private var jingmaiButton:NewButton;
      
      private var roushenButton:NewButton;
      
      public var rideContainer:Ride;
      
      private var anqiContainer:Anqi;
      
      private var bow:Bow;
      
      private var dantian:Dantian;
      
      private var dugujiujian:DuguJiujian;
      
      private var dongxiao:Dongxiao;
      
      private var bagua:Baguazhang;
      
      private var jiuyang:Jiuyang;
      
      private var xiangLongShiBaZahang:XiangLongSHiBaZhang;
      
      private var yiJinJing:Yijinjing;
      
      private var xisuiJing:Xisuijing;
      
      private var taiXuanShenGong:TaiXuanShenGong;
      
      private var jingjie:JingJie;
      
      private var feilongtanyunshou:Feilongtanyunshou;
      
      private var jiuyin:Jiuyinzhenjing;
      
      private var yuncheng:YunCheng;
      
      private var wulizhi:Wulizhi;
      
      private var wuxingquan:WuXingQuan;
      
      private var shibatongren:ShiBaTongRen;
      
      private var zhanqi:ZhanQi;
      
      private var liumaishenjian:Liumaishenjian;
      
      private var jinzhongzhao:JinZhongZhao;
      
      private var xiuwei:XiuweiPanel;
      
      private var zhanhun:ZhanhunCanvas;
      
      private var beiMingShenGong:BeiMingShenGongPanel;
      
      private var shenzhaojing:ShenZhaoJing;
      
      private var qiShangQuan:QiShangQuanPanel;
      
      private var zixiashengong:ZiXiaShenGong;
      
      private var qimenzhen:QiMenZhen;
      
      private var hamagong:HaMaGong;
      
      private var wuXingZhiRen:WuXingZhiRen;
      
      private var siLingZhen:SiLingZhenCanvas;
      
      private var tianFu:TianFu;
      
      private var wuXingZhen:WuXingZhen;
      
      private var chiXueMoZhen:ChiXueMoZhen;
      
      private var beidouqixing:BeiDouQiXingZhen;
      
      private var sanShiLiuShou:SanShiLiuShouDianXueShu;
      
      private var jinchantuoqiao:JinChanTuoQiao;
      
      private var jiuquhuanghezhen:JiuQuHuangHeZhen;
      
      private var zhenwuqijiezhen:ZhenWuQiJieZhen;
      
      private var douzhuanxingyi:DouZhuanXingYi;
      
      private var xunzhangyangcheng:XunZhangYangCheng;
      
      private var guiliuzhen:GuiLiuZhen;
      
      private var jingangfumoquan:JinGangFuMoQuan;
      
      private var qinlonggong:QinLongGong;
      
      private var xiaoyaoyufeng:XiaoYaoYuFeng;
      
      private var tianmenzhen:TianMenZhen;
      
      private var bihaichaoshengqu:BiHaiChaoShengQu;
      
      private var heyizhen:HeYiZhen;
      
      private var yulizhen:YuLiZhen;
      
      private var yuxiaojianfa:YuXiaoJianFa;
      
      private var yanyuezhen:YanYueZhen;
      
      private var changshezhen:ChangSheZhen;
      
      private var canhezhi:CanHeZhi;
      
      private var _tianFuZhenPanel:TianFuZhen;
      
      private var _niaoXiangZhenPanel:NiaoXiangZhen;
      
      private var _tushidahuiPanel:Tushidahui;
      
      private var chibang:ChiBang;
      
      private var tengtianyi:TengtianyiPanel;
      
      private var lianqi:LianQi;
      
      private var emozhiyi:EMoZhiYi;
      
      private var juezhanguangmingding:JueZhanGuangMingDing;
      
      private var ganjiangmoye:GanJiangMoYe;
      
      private var yanxingzhen:YanXingZhen;
      
      private var xuanxiangzhen:XuanXiangZhen;
      
      private var hutaozhen:HuTaoZhen;
      
      private var yunlongzhen:YunLongZhen;
      
      private var ynHuangdao:YNXunzhang;
      
      private var ynZhuanpan:YNXunzhang;
      
      private var ynWZZB:YNXunzhang;
      
      private var ynFSZB:YNXunzhang;
      
      private var xiantiangong:XianTianGong;
      
      private var pangxiezhen:PangXieZhen;
      
      private var xuedaoxinfa:XueDaoXinFa;
      
      private var huyijuexing:HuyiJuexing;
      
      private var dizaizhen:DiZaiZhen;
      
      private var fengyangzhen:FengYangZhen;
      
      private var longyajuexing:LongYaJueXing;
      
      private var quanshenjuexing:QuanShenJueXing;
      
      private var wuduzhen:WuDuZhen;
      
      private var longyinjuexing:LongYinJueXing;
      
      private var shenxingbaibian:ShenXingBaiBian;
      
      private var langhundun:LangHunDun;
      
      private var rulaishenzhang:RuLaiShenZhang;
      
      private var luoyingshenjianzhang:LuoYingShenJianZhang;
      
      private var bazhentu:BaZhenTu;
      
      private var duguqiubai:DuGuQiuBai;
      
      private var xuantiejianfa:XuanTieJianFa;
      
      private var changshengjue:ChangShengJue;
      
      private var wanhunzhen:WanHunZhen;
      
      private var woDeMenPai:WoDeMenPai;
      
      private var zhenyanshouyin:ZhenYanShouYin;
      
      private var zhenlongqiju:ZhenLongQiJu;
      
      private var shengsifu:ShengSiFu;
      
      private var taohuazhen:TaoHuaZhen;
      
      private var xiakexing:XiaKeXing;
      
      private var molingzhiyi:MoLingZhiYi;
      
      private var fumozhangfa:FuMoZhangFa;
      
      private var yunvsuxinjianfa:YuNvSuXinJianFa;
      
      private var liekongjuexing:LieKongJueXing;
      
      private var tianyuyanmeng:TianYuYanMeng;
      
      private var tianshanliuyangzhang:TianShanLiuYangZhang;
      
      private var aojianshenjiangji:AoJianShenJiangJi;
      
      private var woderongyu:WoDeRongYu;
      
      private var duomingshisanjian:DuoMingShiSanJian;
      
      private var rijinlun:Rijinlun;
      
      private var kongmingquan:KongMingQuan;
      
      private var xueyinjuexing:XueYinJueXing;
      
      private var huashanlunjian:Huashanlunjian;
      
      private var yuejinlun:Yuejinlun;
      
      private var hanbingshenzhang:HanBingZhang;
      
      private var lingxiyizhi:LingXiYiZhi;
      
      private var ynliulongzhuangbei:YNliulongzhuangbei;
      
      private var ynJingLing:YNJingLing;
      
      private var ynGuiHun:YNGuiHun;
      
      private var xingxiuzhen:XingXiuZhen;
      
      private var xingxiuzhen1:XingXiuZhen1;
      
      private var qishazhen:QiShaZhen;
      
      private var fuWenKeHua:FuWenKeHua;
      
      private var liangyiweichenzhen:LiangYiWeiChenZhen;
      
      private var sijuejianzhen:SiJueJianZhen;
      
      private var jingleiqiang:JingLeiQiang;
      
      private var mingyugong:Mingyugong;
      
      private var cuqiankungfu:CuQianKungFu;
      
      private var qingdieshuangren:QingDieShuangRenPanel;
      
      private var LeftButtonContainer1:Sprite;
      
      private var LeftButtonContainer2:Sprite;
      
      private var LeftButtonContainer3:Sprite;
      
      private var LeftButtonContainer4:Sprite;
      
      private var LeftButtonContainer5:Sprite;
      
      private var LeftButtonContainer6:Sprite;
      
      private var LeftButtonContainer7:Sprite;
      
      public const BUTTON_CONTAINER_NUM:int = 7;
      
      private var jichuButton:NewButton;
      
      private var dantianButton:NewButton;
      
      private var zuoqiButton:NewButton;
      
      private var baguazhangButton:NewButton;
      
      private var dugujiujianButton:NewButton;
      
      private var jiuyangshengongButton:NewButton;
      
      private var shibazhangButton:NewButton;
      
      private var yijinjingButton:NewButton;
      
      private var anqiButton:NewButton;
      
      private var gongjianButton:NewButton;
      
      private var dongxiaoButton:NewButton;
      
      private var jingjieButton:NewButton;
      
      private var xisuijingButton:NewButton;
      
      private var feilongtanyunshouButton:NewButton;
      
      private var jiuyinzhenjingButton:NewButton;
      
      private var yunchengButton:NewButton;
      
      private var wulizhiButton:NewButton;
      
      private var wuxingquanButton:NewButton;
      
      private var shibatongrenButton:NewButton;
      
      private var zhanqiButton:NewButton;
      
      private var liumaishenjianButton:NewButton;
      
      private var jinzhongzhaoButton:NewButton;
      
      private var xiuweiButton:NewButton;
      
      private var zhanhunButton:NewButton;
      
      private var taiXuanShenGongButton:NewButton;
      
      private var beiMingShenGongButton:NewButton;
      
      private var wuXingZhiRenButton:NewButton;
      
      private var siLingZhenButton:NewButton;
      
      private var shenzhaojingButton:NewButton;
      
      private var qiShangQuanButton:NewButton;
      
      private var zixiashengongButton:NewButton;
      
      private var qimenzhenButton:NewButton;
      
      private var hamagongButton:NewButton;
      
      private var tianFuButton:NewButton;
      
      private var wuXingZhenButton:NewButton;
      
      private var chiXueMoZhenButton:NewButton;
      
      private var sanShiLiuShouButton:NewButton;
      
      private var beidouqixingButton:NewButton;
      
      private var jinchantuoqiaoButton:NewButton;
      
      private var jiuquhuanghezhenButton:NewButton;
      
      private var zhenwuqijiezhenButton:NewButton;
      
      private var douzhuanxingyiButton:NewButton;
      
      private var xunzhangyangchengButton:NewButton;
      
      private var qinlonggongButton:NewButton;
      
      private var xiaoyaoyufengButton:NewButton;
      
      private var guiliuzhenButton:NewButton;
      
      private var jingangfumoquanButton:NewButton;
      
      private var tianmenzhenButton:NewButton;
      
      private var chibangButton:NewButton;
      
      private var tengtianyiButton:NewButton;
      
      private var lianqiButton:NewButton;
      
      private var ganjiangmoyeButton:NewButton;
      
      private var bihaichaoshengquButton:NewButton;
      
      private var heyizhenButton:NewButton;
      
      private var yulizhenButton:NewButton;
      
      private var yuxiaojianfaButton:NewButton;
      
      private var yanyuezhenButton:NewButton;
      
      private var changshezhenButton:NewButton;
      
      private var canhezhiButton:NewButton;
      
      private var juezhanguangmingdingButton:NewButton;
      
      private var _tianFuZhenBtn:NewButton;
      
      private var _niaoXiangZhenBtn:NewButton;
      
      private var _tushidahuiBtn:NewButton;
      
      private var emozhiyiButton:NewButton;
      
      private var yanxingzhenButton:NewButton;
      
      private var xuanxiangzhenButton:NewButton;
      
      private var hutaozhenButton:NewButton;
      
      private var yunlongzhenButton:NewButton;
      
      private var woderongyuButton:NewButton;
      
      private var ynHuangdaoButton:NewButton;
      
      private var ynZhuanpanButton:NewButton;
      
      private var ynWZZButton:NewButton;
      
      private var ynFSZButton:NewButton;
      
      private var rijinlunButton:NewButton;
      
      private var xiantiangongButton:NewButton;
      
      private var xuedaoxinfaButton:NewButton;
      
      private var pangxiezhenButton:NewButton;
      
      private var huyijuexingButton:NewButton;
      
      private var dizaizhenButton:NewButton;
      
      private var fengyangzhenButton:NewButton;
      
      private var longyajuexingButton:NewButton;
      
      private var quanshenjuexingButton:NewButton;
      
      private var wuduzhenButton:NewButton;
      
      private var longyinjuexingButton:NewButton;
      
      private var shenxingbaibianButton:NewButton;
      
      private var langhundunButton:NewButton;
      
      private var rulaishenzhangButton:NewButton;
      
      private var luoyingshenjianzhangButton:NewButton;
      
      private var bazhentuButton:NewButton;
      
      private var duguqiubaiButton:NewButton;
      
      private var xuantiejianfaButton:NewButton;
      
      private var changshengjueButton:NewButton;
      
      private var wanhunzhenButton:NewButton;
      
      private var woDeMenPaiButton:NewButton;
      
      private var zhenyanshouyinButton:NewButton;
      
      private var zhenlongqijuButton:NewButton;
      
      private var shengsifuButton:NewButton;
      
      private var taohuazhenButton:NewButton;
      
      private var xiakexingButton:NewButton;
      
      private var molingzhiyiButton:NewButton;
      
      private var fumozhangfaButton:NewButton;
      
      private var yunvsuxinjianfaButton:NewButton;
      
      private var liekongjuexingButton:NewButton;
      
      private var tianyuyanmengButton:NewButton;
      
      private var tianshanliuyangzhangButton:NewButton;
      
      private var aojianshenjiangjiButton:NewButton;
      
      private var duomingshisanjianButton:NewButton;
      
      private var wuxiakapaiButton:NewButton;
      
      private var kongmingquanButton:NewButton;
      
      private var xueyinjuexingButton:NewButton;
      
      private var huashanlunjianButton:NewButton;
      
      private var yuejinlunButton:NewButton;
      
      private var hanbingshenzhangButton:NewButton;
      
      private var lingxiyizhiButton:NewButton;
      
      private var cangbaogeButton:NewButton;
      
      private var ynliulongzhuangbeiButton:NewButton;
      
      private var ynJingLingButton:NewButton;
      
      private var ynGuiHunButton:NewButton;
      
      private var xunzhangzhanshiButton:NewButton;
      
      private var xingxiuzhenButton:NewButton;
      
      private var xingxiuzhen1Button:NewButton;
      
      private var qishazhenButton:NewButton;
      
      private var fuWenKeHuaButton:NewButton;
      
      private var liangyiweichenzhenButton:NewButton;
      
      private var sijuejianzhenButton:NewButton;
      
      private var jingleiqiangButton:NewButton;
      
      private var mingyugongButton:NewButton;
      
      private var cuqiankungfuButton:NewButton;
      
      private var qingdieshuangrenButton:NewButton;
      
      private var btnArray1:Array = [];
      
      private var btnArray2:Array = [];
      
      private var btnArray3:Array = [];
      
      private var btnArray4:Array = [];
      
      private var btnArray5:Array = [];
      
      private var btnArray6:Array = [];
      
      private var btnArray7:Array = [];
      
      private var preBtn1:FSimpleButton;
      
      private var nextBtn1:FSimpleButton;
      
      private var preBtn2:FSimpleButton;
      
      private var nextBtn2:FSimpleButton;
      
      private var preBtn3:FSimpleButton;
      
      private var nextBtn3:FSimpleButton;
      
      private var preBtn4:FSimpleButton;
      
      private var nextBtn4:FSimpleButton;
      
      private var preBtn5:FSimpleButton;
      
      private var nextBtn5:FSimpleButton;
      
      private var preBtn6:FSimpleButton;
      
      private var nextBtn6:FSimpleButton;
      
      private var preBtn7:FSimpleButton;
      
      private var nextBtn7:FSimpleButton;
      
      private var curPage1:int = 0;
      
      private var curPage2:int = 0;
      
      private var curPage3:int = 0;
      
      private var curPage4:int = 0;
      
      private var curPage5:int = 0;
      
      private var curPage6:int = 0;
      
      private var curPage7:int = 0;
      
      private var lb:int;
      
      private var bitmap:Bitmap;
      
      private var objTianFu:Object;
      
      private var objYunCheng:Object;
      
      private var objHaMaGong:Object;
      
      private var xunZhangObj:Object;
      
      private var zhanQiObj:Object;
      
      private var xiuWeiObj:Object;
      
      private var zhanHunObj:Object;
      
      private var jingJieObj:Object;
      
      private var xunZhangYangChengObj:Object;
      
      private var objBaGua:Object;
      
      private var qiShangQuanObj:Object;
      
      private var shenzhaojingObj:Object;
      
      private var ziXiaObj:Object;
      
      private var yiJinJingObj:Object;
      
      private var objJiuJian:Object;
      
      private var objJiuYang:Object;
      
      private var xiSuiJingObj:Object;
      
      private var jiuYinObj:Object;
      
      private var feiLongObj:Object;
      
      private var wuXingQuanObj:Object;
      
      private var liuMaiObj:Object;
      
      private var objXiangLong:Object;
      
      private var taiXuanObj:Object;
      
      private var beiMingObj:Object;
      
      private var objAnQi:Object;
      
      private var bowObj:Object;
      
      private var dongXiaoObj:Object;
      
      private var wuXingZhiRenObj:Object;
      
      private var qiMenZhenObj:Object;
      
      private var wuXingZhenObj:Object;
      
      private var siLingZhenObj:Object;
      
      private var shiBaTongRenObj:Object;
      
      private var jinZhongZhaoObj:Object;
      
      private var zuoQiObj:Object;
      
      private var danTianObj:Object;
      
      private var wuxiakapaiObj:Object;
      
      private var objRijinlun:Object;
      
      private var huashanlunjianObj:Object;
      
      private var objYuejinlun:Object;
      
      private var ynZhuanpanObj:Object;
      
      private var ynHuangdaoObj:Object;
      
      private var ynWZZBObj:Object;
      
      private var ynFSZBObj:Object;
      
      private var ynliulongzhuangbeiObj:Object;
      
      private var ynJingLingObj:Object;
      
      private var ynGuiHunObj:Object;
      
      private var cangbaogeObj:Object;
      
      private var xunzhangzhanshiObj:Object;
      
      private var xiangyangzhizhan:XiangYangZhiZhan;
      
      private var xiangyangzhizhanButton:NewButton;
      
      private var xiangyangzhizhanObj:Object;
      
      private var fengdiao:YNjinfengdiao;
      
      private var fengdiaoButton:NewButton;
      
      private var fengdiaoObj:Object;
      
      private var tulongdao:TuLongDao;
      
      private var tulongdaoButton:NewButton;
      
      private var jinSheJianFa:JinSheJianFaPanel;
      
      private var jinSheJianFaButton:NewButton;
      
      private var cangjianxuantian:CangJianXuanTianPanel;
      
      private var cangjianxuantianButton:NewButton;
      
      internal var objChiXueMoZhen:Object;
      
      internal var objSanShiLiuShou:Object;
      
      internal var objBeiDouQiXing:Object;
      
      internal var objJinChanTuoQiao:Object;
      
      internal var objJiuQuHuangHeZhen:Object;
      
      internal var objZhenWuQiJieZhen:Object;
      
      internal var objDouZhuanXingYi:Object;
      
      internal var objGuiLiuZhen:Object;
      
      internal var objJinGangFuMoQuan:Object;
      
      internal var objQinLongGong:Object;
      
      internal var objChiBang:Object;
      
      internal var objTengtianyi:Object;
      
      internal var objXiaoYaoYuFeng:Object;
      
      internal var objLianQi:Object;
      
      internal var objTianMenZhen:Object;
      
      internal var objBiHaiChaoShengQu:Object;
      
      internal var objHeYiZhen:Object;
      
      internal var objYuLiZhen:Object;
      
      internal var objYuXiaoJianFa:Object;
      
      internal var objYanYueZhen:Object;
      
      internal var objChangSheZhen:Object;
      
      internal var objTianFuZhen:Object;
      
      internal var niaoXiangZhenObj:Object;
      
      internal var objCanHeZhi:Object;
      
      internal var objEMoZhiYi:Object;
      
      internal var objYanXingZhen:Object;
      
      internal var objXuanXiangZhen:Object;
      
      internal var objJueZhanGuangMingDing:Object;
      
      private var tushidahuiObj:*;
      
      internal var objGanJiangMoYe:Object;
      
      internal var objHuTaoZhen:Object;
      
      internal var objYunLongZhen:Object;
      
      internal var objXianTianGong:Object;
      
      internal var objPangXieZhen:Object;
      
      internal var objXueDaoXinFa:Object;
      
      internal var objHuYiJueXing:Object;
      
      internal var objDiZaiZhen:Object;
      
      internal var objFengYangZhen:Object;
      
      internal var objLongYaJueXing:Object;
      
      internal var objQuanShenJueXing:Object;
      
      internal var objWuDuZhen:Object;
      
      internal var objLongYinJueXing:Object;
      
      internal var objShenXingBaiBian:Object;
      
      internal var objLangHunDun:Object;
      
      internal var objRulaishenzhang:Object;
      
      internal var objLuoYingShenJianZhang:Object;
      
      internal var objBaZhenTu:Object;
      
      internal var objDuGuQiuBai:Object;
      
      internal var objXuanTieJianFa:Object;
      
      internal var objChangShengJue:Object;
      
      internal var objWanHunZhen:Object;
      
      private var zhenyanshouyinObj:Object;
      
      internal var objZhenLongQiJu:Object;
      
      internal var objShengSiFu:Object;
      
      internal var objTaoHuaZhen:Object;
      
      internal var objXiaKeXing:Object;
      
      internal var objMoLingZhiYi:Object;
      
      internal var objFuMoZhangFa:Object;
      
      internal var objYuNvSuXinJianFa:Object;
      
      internal var objLieKongJueXing:Object;
      
      internal var objTianYuYanMeng:Object;
      
      internal var objTianShanLiuYangZhang:Object;
      
      internal var objAoJianShenJiangJi:Object;
      
      internal var objDuoMingShiSanJian:Object;
      
      internal var objKongMingQuan:Object;
      
      internal var objXueYinJueXing:Object;
      
      internal var objHanBingShenZhang:Object;
      
      internal var objLingXiYiZhi:Object;
      
      internal var objXingXiuZhen:Object;
      
      internal var objXingXiuZhen1:Object;
      
      internal var objQiShaZhen:Object;
      
      internal var objFuWenKeHua:Object;
      
      internal var objLiangYiWeiChenZhen:Object;
      
      internal var objSiJueJianZhen:Object;
      
      internal var objJingLeiQiang:Object;
      
      internal var objMingYuGong:Object;
      
      internal var objTuLongDao:Object;
      
      internal var objJinSheJianFa:Object;
      
      internal var objCuQianKungFu:Object;
      
      internal var objQingDieShuangRen:Object;
      
      internal var objCangJianXuanTian:Object;
      
      public function TargetAttribute()
      {
         var _loc1_:Object = null;
         var _loc2_:Vector.<Bitmap> = null;
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 502;
         height = 433;
         this.titleText = LanResManager.getLanCommonTextWords("人物属性");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bitmap = new Bitmap();
         this.bitmap.name = "ui.char.menu.tiao";
         this.bitmap.x = 10;
         this.bitmap.y = 24;
         this.addChild(this.bitmap);
         this.LeftButtonContainer1 = new Sprite();
         this.LeftButtonContainer1.x = 10;
         this.LeftButtonContainer1.y = 25;
         this.addChild(this.LeftButtonContainer1);
         this.charContainer = new OtherPlayerAttributeCanvas();
         addChildAt(this.charContainer,0);
         this.charContainer.x = 90;
         this.charContainer.visible = false;
         this.charContainer.y = 22;
         this.charContainer.$parent = this;
         this.charContainer.zanwenValue.$parent = this;
         this.jichuButton = new NewButton();
         this.jichuButton.label = LanResManager.getLanCommonTextWords("基础");
         this.jichuButton.width = 80;
         this.jichuButton.height = 20;
         this.jichuButton.align = "center";
         this.jichuButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
         this.LeftButtonContainer1.addChild(this.jichuButton);
         _loc1_ = new Object();
         _loc1_.neirong = this.charContainer;
         _loc1_.biaoqian = this.jichuButton;
         _loc1_.name = "1";
         _loc1_.isShow = true;
         _loc1_.dengji = -10;
         this.btnArray1.push(_loc1_);
         this.rideContainer = new Ride();
         this.rideContainer.type = Ride.UI_RIDE_TYPE_TARGET;
         this.rideContainer.$parent = this;
         this.rideContainer.visible = false;
         this.rideContainer.x = 90;
         this.rideContainer.y = 22;
         this.rideContainer.hideBtn();
         this.zuoqiButton = new NewButton();
         this.zuoqiButton.label = LanResManager.getLanCommonTextWords("坐骑");
         this.zuoqiButton.width = 80;
         this.zuoqiButton.height = 20;
         this.zuoqiButton.align = "center";
         this.zuoqiButton.y = 20;
         this.zuoQiObj = new Object();
         this.zuoQiObj.neirong = this.rideContainer;
         this.zuoQiObj.biaoqian = this.zuoqiButton;
         this.zuoQiObj.name = "2";
         this.zuoQiObj.isShow = true;
         this.zuoQiObj.dengji = -9;
         this.venationContainer = new TAVenation();
         this.venationContainer.$parent = this;
         this.venationContainer.x = 90;
         this.venationContainer.y = 22;
         this.venationContainer.visible = false;
         this.jingmaiButton = new NewButton();
         this.jingmaiButton.label = LanResManager.getLanCommonTextWords("经脉");
         this.jingmaiButton.width = 80;
         this.jingmaiButton.height = 20;
         this.jingmaiButton.align = "center";
         this.jingmaiButton.y = 40;
         this.jingmaiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
         this.LeftButtonContainer1.addChild(this.jingmaiButton);
         _loc1_ = new Object();
         _loc1_.neirong = this.venationContainer;
         _loc1_.biaoqian = this.jingmaiButton;
         _loc1_.name = "3";
         _loc1_.isShow = true;
         _loc1_.dengji = -8;
         this.btnArray1.push(_loc1_);
         this.smithingbodyContainer = new SmithingBody();
         this.smithingbodyContainer.$parent = this;
         addChildAt(this.smithingbodyContainer,0);
         this.smithingbodyContainer.x = 89;
         this.smithingbodyContainer.y = 21;
         this.smithingbodyContainer.visible = false;
         this.roushenButton = new NewButton();
         this.roushenButton.label = LanResManager.getLanCommonTextWords("肉身");
         this.roushenButton.width = 80;
         this.roushenButton.height = 20;
         this.roushenButton.align = "center";
         this.roushenButton.y = 60;
         this.roushenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
         this.LeftButtonContainer1.addChild(this.roushenButton);
         _loc1_ = new Object();
         _loc1_.neirong = this.smithingbodyContainer;
         _loc1_.biaoqian = this.roushenButton;
         _loc1_.name = "4";
         _loc1_.isShow = true;
         _loc1_.dengji = -7;
         this.btnArray1.push(_loc1_);
         this.yuncheng = new YunCheng();
         this.yuncheng.setParent = this;
         this.yuncheng.x = 90;
         this.yuncheng.y = 22;
         this.yuncheng.visible = false;
         this.yunchengButton = new NewButton();
         this.yunchengButton.label = LanResManager.getLanCommonTextWords("运程");
         this.yunchengButton.width = 80;
         this.yunchengButton.height = 20;
         this.yunchengButton.align = "center";
         this.yunchengButton.y = 80;
         this.objYunCheng = new Object();
         this.objYunCheng.neirong = this.yuncheng;
         this.objYunCheng.biaoqian = this.yunchengButton;
         this.objYunCheng.name = "5";
         this.objYunCheng.isShow = true;
         this.objYunCheng.dengji = -1;
         this.wulizhi = new Wulizhi();
         this.wulizhi.setParent = this;
         this.wulizhi.x = 90;
         this.wulizhi.y = 22;
         this.wulizhi.visible = false;
         this.wulizhiButton = new NewButton();
         this.wulizhiButton.label = LanResManager.getLanCommonTextWords("勋章");
         this.wulizhiButton.width = 80;
         this.wulizhiButton.height = 20;
         this.wulizhiButton.align = "center";
         this.wulizhiButton.y = 100;
         this.xunZhangObj = new Object();
         this.xunZhangObj.neirong = this.wulizhi;
         this.xunZhangObj.biaoqian = this.wulizhiButton;
         this.xunZhangObj.name = "6";
         this.xunZhangObj.isShow = true;
         this.xunZhangObj.dengji = -1;
         this.zhanqi = new ZhanQi();
         this.zhanqi.setParent = this;
         this.zhanqi.x = 90;
         this.zhanqi.y = 22;
         this.zhanqi.visible = false;
         this.zhanqiButton = new NewButton();
         this.zhanqiButton.label = LanResManager.getLanCommonTextWords("战旗");
         this.zhanqiButton.width = 80;
         this.zhanqiButton.height = 20;
         this.zhanqiButton.align = "center";
         this.zhanqiButton.y = 120;
         this.zhanQiObj = new Object();
         this.zhanQiObj.neirong = this.zhanqi;
         this.zhanQiObj.biaoqian = this.zhanqiButton;
         this.zhanQiObj.name = "7";
         this.zhanQiObj.isShow = true;
         this.zhanQiObj.dengji = -1;
         this.xiuwei = new XiuweiPanel();
         this.xiuwei._$parent = this;
         this.xiuwei.x = 90;
         this.xiuwei.y = 22;
         this.xiuwei.visible = false;
         this.xiuweiButton = new NewButton();
         this.xiuweiButton.label = LanResManager.getLanCommonTextWords("修行");
         this.xiuweiButton.width = 80;
         this.xiuweiButton.height = 20;
         this.xiuweiButton.align = "center";
         this.xiuweiButton.y = 140;
         this.xiuWeiObj = new Object();
         this.xiuWeiObj.neirong = this.xiuwei;
         this.xiuWeiObj.biaoqian = this.xiuweiButton;
         this.xiuWeiObj.name = "8";
         this.xiuWeiObj.isShow = true;
         this.xiuWeiObj.dengji = -1;
         this.zhanhun = new ZhanhunCanvas();
         this.zhanhun.$parent = this;
         this.zhanhun.x = 90;
         this.zhanhun.y = 22;
         this.zhanhun.visible = false;
         this.zhanhunButton = new NewButton();
         this.zhanhunButton.label = LanResManager.getLanCommonTextWords("战魂");
         this.zhanhunButton.width = 80;
         this.zhanhunButton.height = 20;
         this.zhanhunButton.align = "center";
         this.zhanhunButton.y = 160;
         this.zhanHunObj = new Object();
         this.zhanHunObj.neirong = this.zhanhun;
         this.zhanHunObj.biaoqian = this.zhanhunButton;
         this.zhanHunObj.name = "9";
         this.zhanHunObj.isShow = true;
         this.zhanHunObj.dengji = -1;
         this.jingjie = new JingJie();
         this.jingjie.setParent = this;
         this.jingjie.x = 90;
         this.jingjie.y = 22;
         this.jingjie.visible = false;
         this.jingjieButton = new NewButton();
         this.jingjieButton.label = LanResManager.getLanTextWords(this,"境界");
         this.jingjieButton.width = 80;
         this.jingjieButton.height = 20;
         this.jingjieButton.align = "center";
         this.jingjieButton.y = 180;
         this.jingJieObj = new Object();
         this.jingJieObj.neirong = this.jingjie;
         this.jingJieObj.biaoqian = this.jingjieButton;
         this.jingJieObj.name = "10";
         this.jingJieObj.isShow = true;
         this.jingJieObj.dengji = 60;
         this.dantian = new Dantian();
         this.dantian.$parent = this;
         this.dantian.visible = false;
         this.dantian.x = 90;
         this.dantian.y = 22;
         this.dantianButton = new NewButton();
         this.dantianButton.label = LanResManager.getLanCommonTextWords("丹田");
         this.dantianButton.width = 80;
         this.dantianButton.height = 20;
         this.dantianButton.align = "center";
         this.dantianButton.y = 200;
         this.danTianObj = new Object();
         this.danTianObj.neirong = this.dantian;
         this.danTianObj.biaoqian = this.dantianButton;
         this.danTianObj.name = "11";
         this.danTianObj.isShow = true;
         this.danTianObj.dengji = 65;
         this.tianFu = new TianFu();
         this.tianFu.$parent = this;
         this.tianFu.x = 90;
         this.tianFu.y = 22;
         this.tianFuButton = new NewButton();
         this.tianFuButton.label = LanResManager.getLanCommonTextWords("天赋");
         this.tianFuButton.width = 80;
         this.tianFuButton.height = 20;
         this.tianFuButton.align = "center";
         this.tianFuButton.y = 220;
         this.xunzhangyangcheng = new XunZhangYangCheng();
         this.xunzhangyangcheng.$parent = this;
         this.xunzhangyangcheng.x = 90;
         this.xunzhangyangcheng.y = 22;
         this.xunzhangyangchengButton = new NewButton();
         this.xunzhangyangchengButton.label = LanResManager.getLanCommonTextWords("勋章养成");
         this.xunzhangyangchengButton.width = 80;
         this.xunzhangyangchengButton.height = 20;
         this.xunzhangyangchengButton.align = "center";
         this.xunZhangYangChengObj = new Object();
         this.xunZhangYangChengObj.neirong = this.xunzhangyangcheng;
         this.xunZhangYangChengObj.biaoqian = this.xunzhangyangchengButton;
         this.xunZhangYangChengObj.name = "13";
         this.xunZhangYangChengObj.isShow = true;
         this.xunZhangYangChengObj.dengji = -1;
         this.lianqi = new LianQi();
         this.lianqi.$parent = this;
         this.lianqi.setParent = this;
         this.lianqi.x = 90;
         this.lianqi.y = 22;
         this.lianqiButton = new NewButton();
         this.lianqiButton.label = LanResManager.getLanCommonTextWords("炼气");
         this.lianqiButton.width = 80;
         this.lianqiButton.height = 20;
         this.lianqiButton.align = "center";
         this.lianqiButton.y = 240;
         this.ynHuangdao = new YNXunzhang();
         this.ynHuangdao.x = 90;
         this.ynHuangdao.y = 22;
         this.ynHuangdaoButton = new NewButton();
         this.ynHuangdaoButton.label = LanResManager.getLanCommonTextWords("黄道");
         this.ynHuangdaoButton.width = 80;
         this.ynHuangdaoButton.height = 20;
         this.ynHuangdaoButton.align = "center";
         this.ynHuangdaoObj = new Object();
         this.ynHuangdaoObj.neirong = this.ynHuangdao;
         this.ynHuangdaoObj.biaoqian = this.ynHuangdaoButton;
         this.ynHuangdaoObj.name = "14";
         this.ynHuangdaoObj.isShow = true;
         this.ynHuangdaoObj.dengji = -1;
         this.ynZhuanpan = new YNXunzhang();
         this.ynZhuanpan.x = 90;
         this.ynZhuanpan.y = 22;
         this.ynZhuanpanButton = new NewButton();
         this.ynZhuanpanButton.label = LanResManager.getLanCommonTextWords("转盘");
         this.ynZhuanpanButton.width = 80;
         this.ynZhuanpanButton.height = 20;
         this.ynZhuanpanButton.align = "center";
         this.ynZhuanpanObj = new Object();
         this.ynZhuanpanObj.neirong = this.ynZhuanpan;
         this.ynZhuanpanObj.biaoqian = this.ynZhuanpanButton;
         this.ynZhuanpanObj.name = "15";
         this.ynZhuanpanObj.isShow = true;
         this.ynZhuanpanObj.dengji = -1;
         this.ynWZZB = new YNXunzhang();
         this.ynWZZB.x = 90;
         this.ynWZZB.y = 22;
         this.ynWZZButton = new NewButton();
         this.ynWZZButton.label = LanResManager.getLanCommonTextWords("王者装备");
         this.ynWZZButton.width = 80;
         this.ynWZZButton.height = 20;
         this.ynWZZButton.align = "center";
         this.ynWZZBObj = new Object();
         this.ynWZZBObj.neirong = this.ynWZZB;
         this.ynWZZBObj.biaoqian = this.ynWZZButton;
         this.ynWZZBObj.name = "19";
         this.ynWZZBObj.isShow = true;
         this.ynWZZBObj.dengji = -1;
         this.ynFSZB = new YNXunzhang();
         this.ynFSZB.x = 90;
         this.ynFSZB.y = 22;
         this.ynFSZButton = new NewButton();
         this.ynFSZButton.label = LanResManager.getLanCommonTextWords("飞升装备");
         this.ynFSZButton.width = 80;
         this.ynFSZButton.height = 20;
         this.ynFSZButton.align = "center";
         this.ynFSZBObj = new Object();
         this.ynFSZBObj.eventType = REQUEST_FSZB;
         this.ynFSZBObj.neirong = this.ynFSZB;
         this.ynFSZBObj.biaoqian = this.ynFSZButton;
         this.ynFSZBObj.name = "6";
         this.ynFSZBObj.isShow = true;
         this.ynFSZBObj.dengji = -1;
         this.wuxiakapaiButton = new NewButton();
         this.wuxiakapaiButton.label = LanResManager.getLanCommonTextWords("武侠卡牌");
         this.wuxiakapaiButton.width = 80;
         this.wuxiakapaiButton.height = 20;
         this.wuxiakapaiButton.align = "center";
         this.cangbaogeButton = new NewButton();
         this.cangbaogeButton.label = LanResManager.getLanCommonTextWords("藏宝阁");
         this.cangbaogeButton.width = 80;
         this.cangbaogeButton.height = 20;
         this.cangbaogeButton.align = "center";
         this.xunzhangzhanshiButton = new NewButton();
         this.xunzhangzhanshiButton.label = LanResManager.getLanCommonTextWords("勋章展示");
         this.xunzhangzhanshiButton.width = 80;
         this.xunzhangzhanshiButton.height = 20;
         this.xunzhangzhanshiButton.align = "center";
         this.ynliulongzhuangbei = new YNliulongzhuangbei();
         this.ynliulongzhuangbei.$parent = this;
         this.ynliulongzhuangbei.x = 90;
         this.ynliulongzhuangbei.y = 22;
         this.ynliulongzhuangbeiButton = new NewButton();
         this.ynliulongzhuangbeiButton.label = LanResManager.getLanCommonTextWords("六龙装备");
         this.ynliulongzhuangbeiButton.width = 80;
         this.ynliulongzhuangbeiButton.height = 20;
         this.ynliulongzhuangbeiButton.align = "center";
         this.ynliulongzhuangbeiButton.visible = false;
         this.ynJingLing = new YNJingLing();
         this.ynJingLing.$parent = this;
         this.ynJingLing.x = 90;
         this.ynJingLing.y = 22;
         this.ynJingLingButton = new NewButton();
         this.ynJingLingButton.label = LanResManager.getLanCommonTextWords("精灵气旋");
         this.ynJingLingButton.width = 80;
         this.ynJingLingButton.height = 20;
         this.ynJingLingButton.align = "center";
         this.ynJingLingButton.visible = false;
         this.ynGuiHun = new YNGuiHun();
         this.ynGuiHun.$parent = this;
         this.ynGuiHun.x = 90;
         this.ynGuiHun.y = 22;
         this.ynGuiHunButton = new NewButton();
         this.ynGuiHunButton.label = "Hồn Hoàn";
         this.ynGuiHunButton.width = 80;
         this.ynGuiHunButton.height = 20;
         this.ynGuiHunButton.align = "center";
         this.ynGuiHunButton.visible = false;
         this.xiangyangzhizhan = new XiangYangZhiZhan();
         this.xiangyangzhizhan.setParent = this;
         this.xiangyangzhizhan.x = 90;
         this.xiangyangzhizhan.y = 22;
         this.xiangyangzhizhanButton = new NewButton();
         this.xiangyangzhizhanButton.label = LanResManager.getLanCommonTextWords("襄阳之战");
         this.xiangyangzhizhanButton.width = 80;
         this.xiangyangzhizhanButton.height = 20;
         this.xiangyangzhizhanButton.align = "center";
         this.fengdiao = new YNjinfengdiao();
         this.fengdiao.$parent = this;
         this.fengdiao.x = 90;
         this.fengdiao.y = 22;
         this.fengdiaoButton = new NewButton();
         this.fengdiaoButton.label = LanResManager.getLanCommonTextWords("金凤雕");
         this.fengdiaoButton.width = 80;
         this.fengdiaoButton.height = 20;
         this.fengdiaoButton.align = "center";
         this.LeftButtonContainer2 = new Sprite();
         this.LeftButtonContainer2.x = 10;
         this.LeftButtonContainer2.y = 25;
         this.addChild(this.LeftButtonContainer2);
         this.bagua = new Baguazhang();
         this.bagua.$parent = this;
         this.bagua.x = 90;
         this.bagua.y = 22;
         this.bagua.visible = false;
         this.baguazhangButton = new NewButton();
         this.baguazhangButton.label = LanResManager.getLanCommonTextWords("八卦掌");
         this.baguazhangButton.width = 80;
         this.baguazhangButton.height = 20;
         this.baguazhangButton.align = "center";
         this.baguazhangButton.y = 0;
         this.objBaGua = new Object();
         this.objBaGua.neirong = this.bagua;
         this.objBaGua.biaoqian = this.baguazhangButton;
         this.objBaGua.name = "1";
         this.objBaGua.isShow = true;
         this.objBaGua.dengji = -2;
         this.qiShangQuan = new QiShangQuanPanel();
         this.qiShangQuan._$parent = this;
         this.qiShangQuan.x = 90;
         this.qiShangQuan.y = 22;
         this.qiShangQuanButton = new NewButton();
         this.qiShangQuanButton.label = LanResManager.getLanCommonTextWords("七伤拳");
         this.qiShangQuanButton.width = 80;
         this.qiShangQuanButton.height = 20;
         this.qiShangQuanButton.align = "center";
         this.qiShangQuanButton.y = 20;
         this.qiShangQuanObj = new Object();
         this.qiShangQuanObj.neirong = this.qiShangQuan;
         this.qiShangQuanObj.biaoqian = this.qiShangQuanButton;
         this.qiShangQuanObj.name = "15";
         this.qiShangQuanObj.isShow = true;
         this.qiShangQuanObj.dengji = 20;
         this.shenzhaojing = new ShenZhaoJing();
         this.shenzhaojing.setParent = this;
         this.shenzhaojing.x = 90;
         this.shenzhaojing.y = 22;
         this.shenzhaojing.visible = false;
         this.shenzhaojingButton = new NewButton();
         this.shenzhaojingButton.label = LanResManager.getLanCommonTextWords("神照经");
         this.shenzhaojingButton.width = 80;
         this.shenzhaojingButton.height = 20;
         this.shenzhaojingButton.align = "center";
         this.shenzhaojingButton.y = 40;
         this.shenzhaojingObj = new Object();
         this.shenzhaojingObj.neirong = this.shenzhaojing;
         this.shenzhaojingObj.biaoqian = this.shenzhaojingButton;
         this.shenzhaojingObj.name = "2";
         this.shenzhaojingObj.isShow = true;
         this.shenzhaojingObj.dengji = 30;
         this.zixiashengong = new ZiXiaShenGong();
         this.zixiashengong.setParent = this;
         this.zixiashengong.x = 90;
         this.zixiashengong.y = 22;
         this.zixiashengongButton = new NewButton();
         this.zixiashengongButton.label = LanResManager.getLanCommonTextWords("紫霞神功");
         this.zixiashengongButton.width = 80;
         this.zixiashengongButton.height = 20;
         this.zixiashengongButton.align = "center";
         this.zixiashengongButton.y = 60;
         this.ziXiaObj = new Object();
         this.ziXiaObj.neirong = this.zixiashengong;
         this.ziXiaObj.biaoqian = this.zixiashengongButton;
         this.ziXiaObj.name = "16";
         this.ziXiaObj.isShow = true;
         this.ziXiaObj.dengji = 50;
         this.yiJinJing = new Yijinjing();
         this.yiJinJing.setParent = this;
         this.yiJinJing.x = 90;
         this.yiJinJing.y = 22;
         this.yijinjingButton = new NewButton();
         this.yijinjingButton.label = LanResManager.getLanCommonTextWords("易筋经");
         this.yijinjingButton.width = 80;
         this.yijinjingButton.height = 20;
         this.yijinjingButton.align = "center";
         this.yijinjingButton.y = 80;
         this.yiJinJingObj = new Object();
         this.yiJinJingObj.neirong = this.yiJinJing;
         this.yiJinJingObj.biaoqian = this.yijinjingButton;
         this.yiJinJingObj.name = "3";
         this.yiJinJingObj.isShow = true;
         this.yiJinJingObj.dengji = 61;
         this.dugujiujian = new DuguJiujian();
         this.dugujiujian.$parent = this;
         this.dugujiujian.visible = false;
         this.dugujiujian.x = 90;
         this.dugujiujian.y = 22;
         this.dugujiujian.visible = false;
         this.dugujiujianButton = new NewButton();
         this.dugujiujianButton.label = LanResManager.getLanCommonTextWords("独孤九剑");
         this.dugujiujianButton.width = 80;
         this.dugujiujianButton.height = 20;
         this.dugujiujianButton.align = "center";
         this.dugujiujianButton.y = 100;
         this.objJiuJian = new Object();
         this.objJiuJian.neirong = this.dugujiujian;
         this.objJiuJian.biaoqian = this.dugujiujianButton;
         this.objJiuJian.name = "4";
         this.objJiuJian.isShow = true;
         this.objJiuJian.dengji = 62;
         this.jiuyang = new Jiuyang();
         this.jiuyang.$parent = this;
         this.jiuyang.x = 89;
         this.jiuyang.y = 22;
         this.jiuyang.visible = false;
         this.jiuyangshengongButton = new NewButton();
         this.jiuyangshengongButton.label = LanResManager.getLanCommonTextWords("九阳神功");
         this.jiuyangshengongButton.width = 80;
         this.jiuyangshengongButton.height = 20;
         this.jiuyangshengongButton.align = "center";
         this.jiuyangshengongButton.y = 120;
         this.objJiuYang = new Object();
         this.objJiuYang.neirong = this.jiuyang;
         this.objJiuYang.biaoqian = this.jiuyangshengongButton;
         this.objJiuYang.name = "5";
         this.objJiuYang.isShow = true;
         this.objJiuYang.dengji = 62;
         this.xisuiJing = new Xisuijing();
         this.xisuiJing.setParent = this;
         this.xisuiJing.x = 90;
         this.xisuiJing.y = 22;
         this.xisuiJing.visible = false;
         this.xisuijingButton = new NewButton();
         this.xisuijingButton.label = LanResManager.getLanCommonTextWords("洗髓经");
         this.xisuijingButton.width = 80;
         this.xisuijingButton.height = 20;
         this.xisuijingButton.align = "center";
         this.xisuijingButton.y = 140;
         this.xiSuiJingObj = new Object();
         this.xiSuiJingObj.neirong = this.xisuiJing;
         this.xiSuiJingObj.biaoqian = this.xisuijingButton;
         this.xiSuiJingObj.name = "6";
         this.xiSuiJingObj.isShow = true;
         this.xiSuiJingObj.dengji = 63;
         this.jiuyin = new Jiuyinzhenjing();
         this.jiuyin.$parent = this;
         this.jiuyin.x = 90;
         this.jiuyin.y = 22;
         this.jiuyin.visible = false;
         this.jiuyinzhenjingButton = new NewButton();
         this.jiuyinzhenjingButton.label = LanResManager.getLanCommonTextWords("九阴真经");
         this.jiuyinzhenjingButton.width = 80;
         this.jiuyinzhenjingButton.height = 20;
         this.jiuyinzhenjingButton.align = "center";
         this.jiuyinzhenjingButton.y = 160;
         this.jiuYinObj = new Object();
         this.jiuYinObj.neirong = this.jiuyin;
         this.jiuYinObj.biaoqian = this.jiuyinzhenjingButton;
         this.jiuYinObj.name = "7";
         this.jiuYinObj.isShow = true;
         this.jiuYinObj.dengji = 64;
         this.feilongtanyunshou = new Feilongtanyunshou();
         this.feilongtanyunshou.setParent = this;
         this.feilongtanyunshou.x = 90;
         this.feilongtanyunshou.y = 22;
         this.feilongtanyunshou.visible = false;
         this.feilongtanyunshouButton = new NewButton();
         this.feilongtanyunshouButton.label = LanResManager.getLanCommonTextWords("飞龙探云手");
         this.feilongtanyunshouButton.width = 80;
         this.feilongtanyunshouButton.height = 20;
         this.feilongtanyunshouButton.align = "center";
         this.feilongtanyunshouButton.y = 180;
         this.feiLongObj = new Object();
         this.feiLongObj.neirong = this.feilongtanyunshou;
         this.feiLongObj.biaoqian = this.feilongtanyunshouButton;
         this.feiLongObj.name = "8";
         this.feiLongObj.isShow = true;
         this.feiLongObj.dengji = 66;
         this.wuxingquan = new WuXingQuan();
         this.wuxingquan.$parent = this;
         this.wuxingquan.x = 90;
         this.wuxingquan.y = 22;
         this.wuxingquan.visible = false;
         this.wuxingquanButton = new NewButton();
         this.wuxingquanButton.label = LanResManager.getLanCommonTextWords("五形拳");
         this.wuxingquanButton.width = 80;
         this.wuxingquanButton.height = 20;
         this.wuxingquanButton.align = "center";
         this.wuxingquanButton.y = 200;
         this.wuXingQuanObj = new Object();
         this.wuXingQuanObj.neirong = this.wuxingquan;
         this.wuXingQuanObj.biaoqian = this.wuxingquanButton;
         this.wuXingQuanObj.name = "9";
         this.wuXingQuanObj.isShow = true;
         this.wuXingQuanObj.dengji = 67;
         this.liumaishenjian = new Liumaishenjian();
         this.liumaishenjian.setParent = this;
         this.liumaishenjian.x = 90;
         this.liumaishenjian.y = 22;
         this.liumaishenjian.visible = false;
         this.liumaishenjianButton = new NewButton();
         this.liumaishenjianButton.label = LanResManager.getLanCommonTextWords("六脉神剑");
         this.liumaishenjianButton.width = 80;
         this.liumaishenjianButton.height = 20;
         this.liumaishenjianButton.align = "center";
         this.liumaishenjianButton.y = 220;
         this.liuMaiObj = new Object();
         this.liuMaiObj.neirong = this.liumaishenjian;
         this.liuMaiObj.biaoqian = this.liumaishenjianButton;
         this.liuMaiObj.name = "10";
         this.liuMaiObj.isShow = true;
         this.liuMaiObj.dengji = 69;
         this.xiangLongShiBaZahang = new XiangLongSHiBaZhang();
         this.xiangLongShiBaZahang.$parent = this;
         this.xiangLongShiBaZahang.x = 90;
         this.xiangLongShiBaZahang.y = 22;
         this.xiangLongShiBaZahang.visible = false;
         this.shibazhangButton = new NewButton();
         this.shibazhangButton.label = LanResManager.getLanCommonTextWords("降龙十八掌");
         this.shibazhangButton.width = 80;
         this.shibazhangButton.height = 20;
         this.shibazhangButton.align = "center";
         this.shibazhangButton.y = 240;
         this.objXiangLong = new Object();
         this.objXiangLong.neirong = this.xiangLongShiBaZahang;
         this.objXiangLong.biaoqian = this.shibazhangButton;
         this.objXiangLong.name = "11";
         this.objXiangLong.isShow = true;
         this.objXiangLong.dengji = 70;
         this.jinzhongzhao = new JinZhongZhao();
         this.jinzhongzhao.$parent = this;
         this.jinzhongzhao.x = 90;
         this.jinzhongzhao.y = 22;
         this.jinzhongzhao.visible = false;
         this.jinzhongzhaoButton = new NewButton();
         this.jinzhongzhaoButton.label = LanResManager.getLanCommonTextWords("金钟罩");
         this.jinzhongzhaoButton.width = 80;
         this.jinzhongzhaoButton.height = 20;
         this.jinzhongzhaoButton.align = "center";
         this.jinzhongzhaoButton.y = 260;
         this.jinZhongZhaoObj = new Object();
         this.jinZhongZhaoObj.neirong = this.jinzhongzhao;
         this.jinZhongZhaoObj.biaoqian = this.jinzhongzhaoButton;
         this.jinZhongZhaoObj.name = "12";
         this.jinZhongZhaoObj.isShow = true;
         this.jinZhongZhaoObj.dengji = 70;
         this.taiXuanShenGong = new TaiXuanShenGong();
         this.taiXuanShenGong.setParent = this;
         this.taiXuanShenGong.x = 90;
         this.taiXuanShenGong.y = 22;
         this.taiXuanShenGong.visible = false;
         this.taiXuanShenGongButton = new NewButton();
         this.taiXuanShenGongButton.label = LanResManager.getLanCommonTextWords("太玄神功");
         this.taiXuanShenGongButton.width = 80;
         this.taiXuanShenGongButton.height = 20;
         this.taiXuanShenGongButton.align = "center";
         this.taiXuanShenGongButton.y = 280;
         this.taiXuanObj = new Object();
         this.taiXuanObj.neirong = this.taiXuanShenGong;
         this.taiXuanObj.biaoqian = this.taiXuanShenGongButton;
         this.taiXuanObj.name = "13";
         this.taiXuanObj.isShow = true;
         this.taiXuanObj.dengji = 71;
         this.beiMingShenGong = new BeiMingShenGongPanel();
         this.beiMingShenGong.setParent = this;
         this.beiMingShenGong.x = 90;
         this.beiMingShenGong.y = 22;
         this.beiMingShenGong.visible = false;
         this.beiMingShenGongButton = new NewButton();
         this.beiMingShenGongButton.label = LanResManager.getLanCommonTextWords("北冥神功");
         this.beiMingShenGongButton.width = 80;
         this.beiMingShenGongButton.height = 20;
         this.beiMingShenGongButton.align = "center";
         this.beiMingShenGongButton.y = 300;
         this.beiMingObj = new Object();
         this.beiMingObj.neirong = this.beiMingShenGong;
         this.beiMingObj.biaoqian = this.beiMingShenGongButton;
         this.beiMingObj.name = "14";
         this.beiMingObj.isShow = true;
         this.beiMingObj.dengji = 72;
         this.hamagong = new HaMaGong();
         this.hamagong.setParent = this;
         this.hamagong.x = 90;
         this.hamagong.y = 22;
         this.hamagongButton = new NewButton();
         this.hamagongButton.label = LanResManager.getLanCommonTextWords("蛤蟆功");
         this.hamagongButton.width = 80;
         this.hamagongButton.height = 20;
         this.hamagongButton.align = "center";
         this.hamagongButton.y = 280;
         this.objHaMaGong = new Object();
         this.objHaMaGong.neirong = this.hamagong;
         this.objHaMaGong.biaoqian = this.hamagongButton;
         this.objHaMaGong.name = "17";
         this.objHaMaGong.isShow = true;
         this.objHaMaGong.dengji = -1;
         this.sanShiLiuShou = new SanShiLiuShouDianXueShu();
         this.sanShiLiuShou.setParent = this;
         this.sanShiLiuShou.x = 90;
         this.sanShiLiuShou.y = 22;
         this.sanShiLiuShouButton = new NewButton();
         this.sanShiLiuShouButton.label = LanResManager.getLanCommonTextWords("擒拿点穴术");
         this.sanShiLiuShouButton.width = 80;
         this.sanShiLiuShouButton.height = 20;
         this.sanShiLiuShouButton.align = "center";
         this.objSanShiLiuShou = new Object();
         this.objSanShiLiuShou.neirong = this.sanShiLiuShou;
         this.objSanShiLiuShou.biaoqian = this.sanShiLiuShouButton;
         this.objSanShiLiuShou.name = "18";
         this.objSanShiLiuShou.isShow = true;
         this.objSanShiLiuShou.dengji = -1;
         this.jinchantuoqiao = new JinChanTuoQiao();
         this.jinchantuoqiao.setParent = this;
         this.jinchantuoqiao.x = 90;
         this.jinchantuoqiao.y = 22;
         this.jinchantuoqiaoButton = new NewButton();
         this.jinchantuoqiaoButton.label = LanResManager.getLanCommonTextWords("金蝉脱壳");
         this.jinchantuoqiaoButton.width = 80;
         this.jinchantuoqiaoButton.height = 20;
         this.jinchantuoqiaoButton.align = "center";
         this.objJinChanTuoQiao = new Object();
         this.objJinChanTuoQiao.neirong = this.jinchantuoqiao;
         this.objJinChanTuoQiao.biaoqian = this.jinchantuoqiaoButton;
         this.objJinChanTuoQiao.name = "19";
         this.objJinChanTuoQiao.isShow = true;
         this.objJinChanTuoQiao.dengji = -1;
         this.douzhuanxingyi = new DouZhuanXingYi();
         this.douzhuanxingyi.setParent = this;
         this.douzhuanxingyi.x = 90;
         this.douzhuanxingyi.y = 22;
         this.douzhuanxingyiButton = new NewButton();
         this.douzhuanxingyiButton.label = LanResManager.getLanCommonTextWords("斗转星移");
         this.douzhuanxingyiButton.width = 80;
         this.douzhuanxingyiButton.height = 20;
         this.douzhuanxingyiButton.align = "center";
         this.qinlonggong = new QinLongGong();
         this.qinlonggong.setParent = this;
         this.qinlonggong.x = 90;
         this.qinlonggong.y = 22;
         this.qinlonggongButton = new NewButton();
         this.qinlonggongButton.label = LanResManager.getLanCommonTextWords("擒龙功");
         this.qinlonggongButton.width = 80;
         this.qinlonggongButton.height = 20;
         this.qinlonggongButton.align = "center";
         this.xiaoyaoyufeng = new XiaoYaoYuFeng();
         this.xiaoyaoyufeng.setParent = this;
         this.xiaoyaoyufeng.x = 90;
         this.xiaoyaoyufeng.y = 22;
         this.xiaoyaoyufengButton = new NewButton();
         this.xiaoyaoyufengButton.label = LanResManager.getLanCommonTextWords("逍遥御风");
         this.xiaoyaoyufengButton.width = 80;
         this.xiaoyaoyufengButton.height = 20;
         this.xiaoyaoyufengButton.align = "center";
         this.bihaichaoshengqu = new BiHaiChaoShengQu();
         this.bihaichaoshengqu.setParent = this;
         this.bihaichaoshengqu.x = 90;
         this.bihaichaoshengqu.y = 22;
         this.bihaichaoshengquButton = new NewButton();
         this.bihaichaoshengquButton.label = LanResManager.getLanCommonTextWords("碧海潮生曲");
         this.bihaichaoshengquButton.width = 80;
         this.bihaichaoshengquButton.height = 20;
         this.bihaichaoshengquButton.align = "center";
         this.yuxiaojianfa = new YuXiaoJianFa();
         this.yuxiaojianfa.setParent = this;
         this.yuxiaojianfa.x = 90;
         this.yuxiaojianfa.y = 22;
         this.yuxiaojianfaButton = new NewButton();
         this.yuxiaojianfaButton.label = LanResManager.getLanCommonTextWords("玉箫剑法");
         this.yuxiaojianfaButton.width = 80;
         this.yuxiaojianfaButton.height = 20;
         this.yuxiaojianfaButton.align = "center";
         this.canhezhi = new CanHeZhi();
         this.canhezhi.setParent = this;
         this.canhezhi.x = 90;
         this.canhezhi.y = 22;
         this.canhezhiButton = new NewButton();
         this.canhezhiButton.label = LanResManager.getLanCommonTextWords("参合指");
         this.canhezhiButton.width = 80;
         this.canhezhiButton.height = 20;
         this.canhezhiButton.align = "center";
         this.xiantiangong = new XianTianGong();
         this.xiantiangong.setParent = this;
         this.xiantiangong.x = 90;
         this.xiantiangong.y = 22;
         this.xiantiangongButton = new NewButton();
         this.xiantiangongButton.label = LanResManager.getLanCommonTextWords("先天功");
         this.xiantiangongButton.width = 80;
         this.xiantiangongButton.height = 20;
         this.xiantiangongButton.align = "center";
         this.xuedaoxinfa = new XueDaoXinFa();
         this.xuedaoxinfa.setParent = this;
         this.xuedaoxinfa.x = 90;
         this.xuedaoxinfa.y = 22;
         this.xuedaoxinfaButton = new NewButton();
         this.xuedaoxinfaButton.label = LanResManager.getLanCommonTextWords("血刀心法");
         this.xuedaoxinfaButton.width = 80;
         this.xuedaoxinfaButton.height = 20;
         this.xuedaoxinfaButton.align = "center";
         this.shenxingbaibian = new ShenXingBaiBian();
         this.shenxingbaibian.setParent = this;
         this.shenxingbaibian.x = 90;
         this.shenxingbaibian.y = 22;
         this.shenxingbaibianButton = new NewButton();
         this.shenxingbaibianButton.label = LanResManager.getLanCommonTextWords("神行百变");
         this.shenxingbaibianButton.width = 80;
         this.shenxingbaibianButton.height = 20;
         this.shenxingbaibianButton.align = "center";
         this.rulaishenzhang = new RuLaiShenZhang();
         this.rulaishenzhang.setParent = this;
         this.rulaishenzhang.x = 90;
         this.rulaishenzhang.y = 22;
         this.rulaishenzhangButton = new NewButton();
         this.rulaishenzhangButton.label = LanResManager.getLanCommonTextWords("如来神掌");
         this.rulaishenzhangButton.width = 80;
         this.rulaishenzhangButton.height = 20;
         this.rulaishenzhangButton.align = "center";
         this.luoyingshenjianzhang = new LuoYingShenJianZhang();
         this.luoyingshenjianzhang.setParent = this;
         this.luoyingshenjianzhang.x = 90;
         this.luoyingshenjianzhang.y = 22;
         this.luoyingshenjianzhangButton = new NewButton();
         this.luoyingshenjianzhangButton.label = LanResManager.getLanCommonTextWords("落英神剑掌");
         this.luoyingshenjianzhangButton.width = 80;
         this.luoyingshenjianzhangButton.height = 20;
         this.luoyingshenjianzhangButton.align = "center";
         this.xuantiejianfa = new XuanTieJianFa();
         this.xuantiejianfa.setParent = this;
         this.xuantiejianfa.x = 90;
         this.xuantiejianfa.y = 22;
         this.xuantiejianfaButton = new NewButton();
         this.xuantiejianfaButton.label = LanResManager.getLanCommonTextWords("玄铁剑法");
         this.xuantiejianfaButton.width = 80;
         this.xuantiejianfaButton.height = 20;
         this.xuantiejianfaButton.align = "center";
         this.changshengjue = new ChangShengJue();
         this.changshengjue.setParent = this;
         this.changshengjue.x = 90;
         this.changshengjue.y = 22;
         this.changshengjueButton = new NewButton();
         this.changshengjueButton.label = LanResManager.getLanCommonTextWords("长生诀");
         this.changshengjueButton.width = 80;
         this.changshengjueButton.height = 20;
         this.changshengjueButton.align = "center";
         this.shengsifu = new ShengSiFu();
         this.shengsifu.setParent = this;
         this.shengsifu.x = 90;
         this.shengsifu.y = 22;
         this.shengsifuButton = new NewButton();
         this.shengsifuButton.label = LanResManager.getLanCommonTextWords("生死符");
         this.shengsifuButton.width = 80;
         this.shengsifuButton.height = 20;
         this.shengsifuButton.align = "center";
         this.fumozhangfa = new FuMoZhangFa();
         this.fumozhangfa.setParent = this;
         this.fumozhangfa.x = 90;
         this.fumozhangfa.y = 22;
         this.fumozhangfaButton = new NewButton();
         this.fumozhangfaButton.label = LanResManager.getLanCommonTextWords("伏魔杖法");
         this.fumozhangfaButton.width = 80;
         this.fumozhangfaButton.height = 20;
         this.fumozhangfaButton.align = "center";
         this.yunvsuxinjianfa = new YuNvSuXinJianFa();
         this.yunvsuxinjianfa.setParent = this;
         this.yunvsuxinjianfa.x = 90;
         this.yunvsuxinjianfa.y = 22;
         this.yunvsuxinjianfaButton = new NewButton();
         this.yunvsuxinjianfaButton.label = LanResManager.getLanCommonTextWords("玉女素心剑");
         this.yunvsuxinjianfaButton.width = 80;
         this.yunvsuxinjianfaButton.height = 20;
         this.yunvsuxinjianfaButton.align = "center";
         this.tianshanliuyangzhang = new TianShanLiuYangZhang();
         this.tianshanliuyangzhang.setParent = this;
         this.tianshanliuyangzhang.x = 90;
         this.tianshanliuyangzhang.y = 22;
         this.tianshanliuyangzhangButton = new NewButton();
         this.tianshanliuyangzhangButton.label = LanResManager.getLanCommonTextWords("天山六阳掌");
         this.tianshanliuyangzhangButton.width = 80;
         this.tianshanliuyangzhangButton.height = 20;
         this.tianshanliuyangzhangButton.align = "center";
         this.duomingshisanjian = new DuoMingShiSanJian();
         this.duomingshisanjian.setParent = this;
         this.duomingshisanjian.x = 90;
         this.duomingshisanjian.y = 22;
         this.duomingshisanjianButton = new NewButton();
         this.duomingshisanjianButton.label = LanResManager.getLanCommonTextWords("夺命十三剑");
         this.duomingshisanjianButton.width = 80;
         this.duomingshisanjianButton.height = 20;
         this.duomingshisanjianButton.align = "center";
         this.kongmingquan = new KongMingQuan();
         this.kongmingquan.setParent = this;
         this.kongmingquan.x = 90;
         this.kongmingquan.y = 22;
         this.kongmingquanButton = new NewButton();
         this.kongmingquanButton.label = LanResManager.getLanCommonTextWords("空明拳");
         this.kongmingquanButton.width = 80;
         this.kongmingquanButton.height = 20;
         this.kongmingquanButton.align = "center";
         this.hanbingshenzhang = new HanBingZhang();
         this.hanbingshenzhang.setParent = this;
         this.hanbingshenzhang.x = 90;
         this.hanbingshenzhang.y = 22;
         this.hanbingshenzhangButton = new NewButton();
         this.hanbingshenzhangButton.label = LanResManager.getLanCommonTextWords("寒冰神掌");
         this.hanbingshenzhangButton.width = 80;
         this.hanbingshenzhangButton.height = 20;
         this.hanbingshenzhangButton.align = "center";
         this.lingxiyizhi = new LingXiYiZhi();
         this.lingxiyizhi.setParent = this;
         this.lingxiyizhi.x = 90;
         this.lingxiyizhi.y = 22;
         this.lingxiyizhiButton = new NewButton();
         this.lingxiyizhiButton.label = LanResManager.getLanCommonTextWords("灵犀一指");
         this.lingxiyizhiButton.width = 80;
         this.lingxiyizhiButton.height = 20;
         this.lingxiyizhiButton.align = "center";
         this.mingyugong = new Mingyugong();
         this.mingyugong.setParent = this;
         this.mingyugong.x = 90;
         this.mingyugong.y = 22;
         this.mingyugong.visible = false;
         this.mingyugongButton = new NewButton();
         this.mingyugongButton.label = LanResManager.getLanCommonTextWords("明玉功");
         this.mingyugongButton.width = 80;
         this.mingyugongButton.height = 20;
         this.mingyugongButton.align = "center";
         this.mingyugongButton.y = 180;
         this.cuqiankungfu = new CuQianKungFu();
         this.cuqiankungfu.setParent = this;
         addChildAt(this.cuqiankungfu,0);
         this.cuqiankungfu.x = 90;
         this.cuqiankungfu.y = 22;
         this.cuqiankungfu.visible = false;
         this.cuqiankungfuButton = new NewButton();
         this.cuqiankungfuButton.label = LanResManager.getLanCommonTextWords("粗浅功夫");
         this.cuqiankungfuButton.width = 80;
         this.cuqiankungfuButton.height = 20;
         this.cuqiankungfuButton.align = "center";
         this.cuqiankungfuButton.y = 300;
         this.cuqiankungfuButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
         this.LeftButtonContainer2.addChild(this.cuqiankungfuButton);
         _loc1_ = new Object();
         _loc1_.neirong = this.cuqiankungfu;
         _loc1_.biaoqian = this.cuqiankungfuButton;
         _loc1_.name = "44";
         _loc1_.isShow = true;
         _loc1_.dengji = 60;
         this.btnArray2.push(_loc1_);
         this.LeftButtonContainer3 = new Sprite();
         this.LeftButtonContainer3.x = 10;
         this.LeftButtonContainer3.y = 25;
         this.addChild(this.LeftButtonContainer3);
         this.anqiContainer = new Anqi();
         this.anqiContainer.$parent = this;
         this.anqiContainer.visible = false;
         this.anqiContainer.x = 90;
         this.anqiContainer.y = 22;
         this.anqiButton = new NewButton();
         this.anqiButton.label = LanResManager.getLanCommonTextWords("暗器");
         this.anqiButton.width = 80;
         this.anqiButton.height = 20;
         this.anqiButton.align = "center";
         this.objAnQi = new Object();
         this.objAnQi.neirong = this.anqiContainer;
         this.objAnQi.biaoqian = this.anqiButton;
         this.objAnQi.name = "1";
         this.objAnQi.isShow = true;
         this.objAnQi.dengji = 14;
         this.bow = new Bow();
         this.bow.$parent = this;
         this.bow.visible = false;
         this.bow.x = 90;
         this.bow.y = 22;
         this.gongjianButton = new NewButton();
         this.gongjianButton.label = LanResManager.getLanCommonTextWords("弓箭");
         this.gongjianButton.width = 80;
         this.gongjianButton.height = 20;
         this.gongjianButton.align = "center";
         this.gongjianButton.y = 20;
         this.bowObj = new Object();
         this.bowObj.neirong = this.bow;
         this.bowObj.biaoqian = this.gongjianButton;
         this.bowObj.name = "2";
         this.bowObj.isShow = true;
         this.bowObj.dengji = 60;
         this.dongxiao = new Dongxiao();
         this.dongxiao.$parent = this;
         this.dongxiao.x = 90;
         this.dongxiao.y = 22;
         this.dongxiao.visible = false;
         this.dongxiaoButton = new NewButton();
         this.dongxiaoButton.label = LanResManager.getLanCommonTextWords("洞箫");
         this.dongxiaoButton.width = 80;
         this.dongxiaoButton.height = 20;
         this.dongxiaoButton.align = "center";
         this.dongxiaoButton.y = 40;
         this.dongXiaoObj = new Object();
         this.dongXiaoObj.neirong = this.dongxiao;
         this.dongXiaoObj.biaoqian = this.dongxiaoButton;
         this.dongXiaoObj.name = "3";
         this.dongXiaoObj.isShow = true;
         this.dongXiaoObj.dengji = 68;
         this.wuXingZhiRen = new WuXingZhiRen();
         this.wuXingZhiRen.$parent = this;
         this.wuXingZhiRen.x = 90;
         this.wuXingZhiRen.y = 22;
         this.wuXingZhiRen.visible = false;
         this.wuXingZhiRenButton = new NewButton();
         this.wuXingZhiRenButton.label = LanResManager.getLanCommonTextWords("五行之刃");
         this.wuXingZhiRenButton.width = 80;
         this.wuXingZhiRenButton.height = 20;
         this.wuXingZhiRenButton.align = "center";
         this.wuXingZhiRenButton.y = 60;
         this.wuXingZhiRenObj = new Object();
         this.wuXingZhiRenObj.neirong = this.wuXingZhiRen;
         this.wuXingZhiRenObj.biaoqian = this.wuXingZhiRenButton;
         this.wuXingZhiRenObj.name = "4";
         this.wuXingZhiRenObj.isShow = true;
         this.wuXingZhiRenObj.dengji = 70;
         this.chibang = new ChiBang();
         this.chibang._$parent = this;
         this.chibang.x = 90;
         this.chibang.y = 22;
         this.chibang.visible = false;
         this.chibangButton = new NewButton();
         this.chibangButton.label = LanResManager.getLanCommonTextWords("天使之翼");
         this.chibangButton.width = 80;
         this.chibangButton.height = 20;
         this.chibangButton.align = "center";
         this.chibangButton.y = 80;
         this.tengtianyi = new TengtianyiPanel();
         this.tengtianyi._$parent = this;
         this.tengtianyi.x = 90;
         this.tengtianyi.y = 22;
         this.tengtianyi.visible = false;
         this.tengtianyiButton = new NewButton();
         this.tengtianyiButton.label = LanResManager.getLanCommonTextWords("腾天翼");
         this.tengtianyiButton.width = 80;
         this.tengtianyiButton.height = 20;
         this.tengtianyiButton.align = "center";
         this.tengtianyiButton.y = 80;
         this.emozhiyi = new EMoZhiYi();
         this.emozhiyi._$parent = this;
         this.emozhiyi.x = 90;
         this.emozhiyi.y = 22;
         this.emozhiyi.visible = false;
         this.emozhiyiButton = new NewButton();
         this.emozhiyiButton.label = LanResManager.getLanCommonTextWords("恶魔之翼");
         this.emozhiyiButton.width = 80;
         this.emozhiyiButton.height = 20;
         this.emozhiyiButton.align = "center";
         this.emozhiyiButton.y = 80;
         this.molingzhiyi = new MoLingZhiYi();
         this.molingzhiyi._$parent = this;
         this.molingzhiyi.x = 90;
         this.molingzhiyi.y = 22;
         this.molingzhiyi.visible = false;
         this.molingzhiyiButton = new NewButton();
         this.molingzhiyiButton.label = LanResManager.getLanCommonTextWords("魔灵之翼");
         this.molingzhiyiButton.width = 80;
         this.molingzhiyiButton.height = 20;
         this.molingzhiyiButton.align = "center";
         this.molingzhiyiButton.y = 80;
         this.ganjiangmoye = new GanJiangMoYe();
         this.ganjiangmoye._$parent = this;
         this.ganjiangmoye.x = 90;
         this.ganjiangmoye.y = 22;
         this.ganjiangmoye.visible = false;
         this.ganjiangmoyeButton = new NewButton();
         this.ganjiangmoyeButton.label = LanResManager.getLanCommonTextWords("干将莫邪");
         this.ganjiangmoyeButton.width = 80;
         this.ganjiangmoyeButton.height = 20;
         this.ganjiangmoyeButton.align = "center";
         this.ganjiangmoyeButton.y = 80;
         this.huyijuexing = new HuyiJuexing();
         this.huyijuexing.setParent = this;
         this.huyijuexing.x = 90;
         this.huyijuexing.y = 22;
         this.huyijuexing.visible = false;
         this.huyijuexingButton = new NewButton();
         this.huyijuexingButton.label = LanResManager.getLanCommonTextWords("虎翼觉醒");
         this.huyijuexingButton.width = 80;
         this.huyijuexingButton.height = 20;
         this.huyijuexingButton.align = "center";
         this.huyijuexingButton.y = 80;
         this.longyajuexing = new LongYaJueXing();
         this.longyajuexing.setParent = this;
         this.longyajuexing.x = 90;
         this.longyajuexing.y = 22;
         this.longyajuexing.visible = false;
         this.longyajuexingButton = new NewButton();
         this.longyajuexingButton.label = LanResManager.getLanCommonTextWords("龙牙觉醒");
         this.longyajuexingButton.width = 80;
         this.longyajuexingButton.height = 20;
         this.longyajuexingButton.align = "center";
         this.longyajuexingButton.y = 80;
         this.quanshenjuexing = new QuanShenJueXing();
         this.quanshenjuexing.setParent = this;
         this.quanshenjuexing.x = 90;
         this.quanshenjuexing.y = 22;
         this.quanshenjuexing.visible = false;
         this.quanshenjuexingButton = new NewButton();
         this.quanshenjuexingButton.label = LanResManager.getLanCommonTextWords("犬神觉醒");
         this.quanshenjuexingButton.width = 80;
         this.quanshenjuexingButton.height = 20;
         this.quanshenjuexingButton.align = "center";
         this.quanshenjuexingButton.y = 80;
         this.longyinjuexing = new LongYinJueXing();
         this.longyinjuexing.setParent = this;
         addChildAt(this.longyinjuexing,0);
         this.longyinjuexing.x = 90;
         this.longyinjuexing.y = 22;
         this.longyinjuexing.visible = false;
         this.longyinjuexingButton = new NewButton();
         this.longyinjuexingButton.label = LanResManager.getLanCommonTextWords("龙吟觉醒");
         this.longyinjuexingButton.width = 80;
         this.longyinjuexingButton.height = 20;
         this.longyinjuexingButton.align = "center";
         this.longyinjuexingButton.y = 80;
         this.langhundun = new LangHunDun();
         this.langhundun.setParent = this;
         addChildAt(this.langhundun,0);
         this.langhundun.x = 90;
         this.langhundun.y = 22;
         this.langhundun.visible = false;
         this.langhundunButton = new NewButton();
         this.langhundunButton.label = LanResManager.getLanCommonTextWords("狼魂盾");
         this.langhundunButton.width = 80;
         this.langhundunButton.height = 20;
         this.langhundunButton.align = "center";
         this.langhundunButton.y = 80;
         this.liekongjuexing = new LieKongJueXing();
         this.liekongjuexing.setParent = this;
         addChildAt(this.liekongjuexing,0);
         this.liekongjuexing.x = 90;
         this.liekongjuexing.y = 22;
         this.liekongjuexing.visible = false;
         this.liekongjuexingButton = new NewButton();
         this.liekongjuexingButton.label = LanResManager.getLanCommonTextWords("裂空觉醒");
         this.liekongjuexingButton.width = 80;
         this.liekongjuexingButton.height = 20;
         this.liekongjuexingButton.align = "center";
         this.liekongjuexingButton.y = 80;
         this.xueyinjuexing = new XueYinJueXing();
         this.xueyinjuexing.setParent = this;
         addChildAt(this.xueyinjuexing,0);
         this.xueyinjuexing.x = 90;
         this.xueyinjuexing.y = 22;
         this.xueyinjuexing.visible = false;
         this.xueyinjuexingButton = new NewButton();
         this.xueyinjuexingButton.label = LanResManager.getLanCommonTextWords("血饮觉醒");
         this.xueyinjuexingButton.width = 80;
         this.xueyinjuexingButton.height = 20;
         this.xueyinjuexingButton.align = "center";
         this.xueyinjuexingButton.y = 80;
         this.aojianshenjiangji = new AoJianShenJiangJi();
         this.aojianshenjiangji.setParent = this;
         addChildAt(this.aojianshenjiangji,0);
         this.aojianshenjiangji.x = 90;
         this.aojianshenjiangji.y = 22;
         this.aojianshenjiangji.visible = false;
         this.aojianshenjiangjiButton = new NewButton();
         this.aojianshenjiangjiButton.label = LanResManager.getLanCommonTextWords("傲剑神将技");
         this.aojianshenjiangjiButton.width = 80;
         this.aojianshenjiangjiButton.height = 20;
         this.aojianshenjiangjiButton.align = "center";
         this.aojianshenjiangjiButton.y = 80;
         this.jingleiqiang = new JingLeiQiang();
         this.jingleiqiang.setParent = this;
         this.jingleiqiang.x = 90;
         this.jingleiqiang.y = 22;
         this.jingleiqiangButton = new NewButton();
         this.jingleiqiangButton.label = LanResManager.getLanCommonTextWords("惊雷枪");
         this.jingleiqiangButton.width = 80;
         this.jingleiqiangButton.height = 20;
         this.jingleiqiangButton.align = "center";
         this.qingdieshuangren = new QingDieShuangRenPanel();
         this.qingdieshuangren.setParent = this;
         this.qingdieshuangren.x = 90;
         this.qingdieshuangren.y = 22;
         this.qingdieshuangrenButton = new NewButton();
         this.qingdieshuangrenButton.label = LanResManager.getLanCommonTextWords("双龙斩");
         this.qingdieshuangrenButton.width = 80;
         this.qingdieshuangrenButton.height = 20;
         this.qingdieshuangrenButton.align = "center";
         this.qingdieshuangrenButton.y = 260;
         this.LeftButtonContainer4 = new Sprite();
         this.LeftButtonContainer4.x = 10;
         this.LeftButtonContainer4.y = 25;
         this.addChild(this.LeftButtonContainer4);
         this.qimenzhen = new QiMenZhen();
         this.qimenzhen._$parent = this;
         this.qimenzhen.visible = false;
         this.qimenzhen.x = 90;
         this.qimenzhen.y = 22;
         this.qimenzhenButton = new NewButton();
         this.qimenzhenButton.label = LanResManager.getLanCommonTextWords("奇门阵");
         this.qimenzhenButton.width = 80;
         this.qimenzhenButton.height = 20;
         this.qimenzhenButton.align = "center";
         this.qiMenZhenObj = new Object();
         this.qiMenZhenObj.neirong = this.qimenzhen;
         this.qiMenZhenObj.biaoqian = this.qimenzhenButton;
         this.qiMenZhenObj.name = "1";
         this.qiMenZhenObj.isShow = true;
         this.qiMenZhenObj.dengji = 0;
         this.wuXingZhen = new WuXingZhen();
         this.wuXingZhen.$parent = this;
         this.wuXingZhen.x = 90;
         this.wuXingZhen.y = 22;
         this.wuXingZhenButton = new NewButton();
         this.wuXingZhenButton.label = LanResManager.getLanCommonTextWords("五行阵");
         this.wuXingZhenButton.width = 80;
         this.wuXingZhenButton.height = 20;
         this.wuXingZhenButton.align = "center";
         this.wuXingZhenObj = new Object();
         this.wuXingZhenObj.neirong = this.wuXingZhen;
         this.wuXingZhenObj.biaoqian = this.wuXingZhenButton;
         this.wuXingZhenObj.name = "4";
         this.wuXingZhenObj.isShow = true;
         this.wuXingZhenObj.dengji = 35;
         this.siLingZhen = new SiLingZhenCanvas();
         this.siLingZhen.$parent = this;
         this.siLingZhen.visible = false;
         this.siLingZhen.x = 90;
         this.siLingZhen.y = 22;
         this.siLingZhenButton = new NewButton();
         this.siLingZhenButton.label = LanResManager.getLanCommonTextWords("四灵阵法");
         this.siLingZhenButton.width = 80;
         this.siLingZhenButton.height = 20;
         this.siLingZhenButton.y = 0;
         this.siLingZhenButton.align = "center";
         this.siLingZhenObj = new Object();
         this.siLingZhenObj.neirong = this.siLingZhen;
         this.siLingZhenObj.biaoqian = this.siLingZhenButton;
         this.siLingZhenObj.name = "2";
         this.siLingZhenObj.isShow = true;
         this.siLingZhenObj.dengji = 70;
         this.shibatongren = new ShiBaTongRen();
         this.shibatongren.$parent = this;
         this.shibatongren.visible = false;
         this.shibatongren.x = 90;
         this.shibatongren.y = 22;
         this.shibatongrenButton = new NewButton();
         this.shibatongrenButton.label = LanResManager.getLanCommonTextWords("十八铜人阵");
         this.shibatongrenButton.width = 80;
         this.shibatongrenButton.height = 20;
         this.shibatongrenButton.align = "center";
         this.shibatongrenButton.y = 20;
         this.shiBaTongRenObj = new Object();
         this.shiBaTongRenObj.neirong = this.shibatongren;
         this.shiBaTongRenObj.biaoqian = this.shibatongrenButton;
         this.shiBaTongRenObj.name = "3";
         this.shiBaTongRenObj.isShow = true;
         this.shiBaTongRenObj.dengji = 75;
         this.chiXueMoZhen = new ChiXueMoZhen();
         this.chiXueMoZhen.$parent = this;
         this.chiXueMoZhen.x = 90;
         this.chiXueMoZhen.y = 22;
         this.chiXueMoZhenButton = new NewButton();
         this.chiXueMoZhenButton.label = LanResManager.getLanCommonTextWords("赤血魔阵");
         this.chiXueMoZhenButton.width = 80;
         this.chiXueMoZhenButton.height = 20;
         this.chiXueMoZhenButton.align = "center";
         this.objChiXueMoZhen = new Object();
         this.objChiXueMoZhen.neirong = this.chiXueMoZhen;
         this.objChiXueMoZhen.biaoqian = this.chiXueMoZhenButton;
         this.objChiXueMoZhen.name = "5";
         this.objChiXueMoZhen.isShow = true;
         this.objChiXueMoZhen.dengji = -1;
         this.beidouqixing = new BeiDouQiXingZhen();
         this.beidouqixing.setParent = this;
         this.beidouqixing.x = 90;
         this.beidouqixing.y = 22;
         this.beidouqixingButton = new NewButton();
         this.beidouqixingButton.label = LanResManager.getLanCommonTextWords("北斗七星阵");
         this.beidouqixingButton.width = 80;
         this.beidouqixingButton.height = 20;
         this.beidouqixingButton.align = "center";
         this.objBeiDouQiXing = new Object();
         this.objBeiDouQiXing.neirong = this.beidouqixing;
         this.objBeiDouQiXing.biaoqian = this.beidouqixingButton;
         this.objBeiDouQiXing.name = "6";
         this.objBeiDouQiXing.isShow = true;
         this.objBeiDouQiXing.dengji = -1;
         this.jiuquhuanghezhen = new JiuQuHuangHeZhen();
         this.jiuquhuanghezhen.setParent = this;
         this.jiuquhuanghezhen.x = 90;
         this.jiuquhuanghezhen.y = 22;
         this.jiuquhuanghezhenButton = new NewButton();
         this.jiuquhuanghezhenButton.label = LanResManager.getLanCommonTextWords("九曲黄河阵");
         this.jiuquhuanghezhenButton.width = 80;
         this.jiuquhuanghezhenButton.height = 20;
         this.jiuquhuanghezhenButton.align = "center";
         this.objJiuQuHuangHeZhen = new Object();
         this.objJiuQuHuangHeZhen.neirong = this.jiuquhuanghezhen;
         this.objJiuQuHuangHeZhen.biaoqian = this.jiuquhuanghezhenButton;
         this.objJiuQuHuangHeZhen.name = "7";
         this.objJiuQuHuangHeZhen.isShow = true;
         this.objJiuQuHuangHeZhen.dengji = -1;
         this.zhenwuqijiezhen = new ZhenWuQiJieZhen();
         this.zhenwuqijiezhen.setParent = this;
         this.zhenwuqijiezhen.x = 90;
         this.zhenwuqijiezhen.y = 22;
         this.zhenwuqijiezhenButton = new NewButton();
         this.zhenwuqijiezhenButton.label = LanResManager.getLanCommonTextWords("真武七截阵");
         this.zhenwuqijiezhenButton.width = 80;
         this.zhenwuqijiezhenButton.height = 20;
         this.zhenwuqijiezhenButton.align = "center";
         this.objZhenWuQiJieZhen = new Object();
         this.objZhenWuQiJieZhen.neirong = this.zhenwuqijiezhen;
         this.objZhenWuQiJieZhen.biaoqian = this.zhenwuqijiezhenButton;
         this.objZhenWuQiJieZhen.name = "8";
         this.objZhenWuQiJieZhen.isShow = true;
         this.objZhenWuQiJieZhen.dengji = -1;
         this.guiliuzhen = new GuiLiuZhen();
         this.guiliuzhen.$parent = this;
         this.guiliuzhen.setParent = this;
         this.guiliuzhen.x = 90;
         this.guiliuzhen.y = 22;
         this.guiliuzhenButton = new NewButton();
         this.guiliuzhenButton.label = LanResManager.getLanCommonTextWords("归流阵");
         this.guiliuzhenButton.width = 80;
         this.guiliuzhenButton.height = 20;
         this.guiliuzhenButton.align = "center";
         this.jingangfumoquan = new JinGangFuMoQuan();
         this.jingangfumoquan.setParent = this;
         this.jingangfumoquan.x = 90;
         this.jingangfumoquan.y = 22;
         this.jingangfumoquanButton = new NewButton();
         this.jingangfumoquanButton.label = LanResManager.getLanCommonTextWords("金刚伏魔圈");
         this.jingangfumoquanButton.width = 80;
         this.jingangfumoquanButton.height = 20;
         this.jingangfumoquanButton.align = "center";
         this.tianmenzhen = new TianMenZhen();
         this.tianmenzhen.setParent = this;
         this.tianmenzhen.x = 90;
         this.tianmenzhen.y = 22;
         this.tianmenzhenButton = new NewButton();
         this.tianmenzhenButton.label = LanResManager.getLanCommonTextWords("天门阵");
         this.tianmenzhenButton.width = 80;
         this.tianmenzhenButton.height = 20;
         this.tianmenzhenButton.align = "center";
         this.heyizhen = new HeYiZhen();
         this.heyizhen.setParent = this;
         this.heyizhen.x = 90;
         this.heyizhen.y = 22;
         this.heyizhenButton = new NewButton();
         this.heyizhenButton.label = LanResManager.getLanCommonTextWords("鹤翼阵");
         this.heyizhenButton.width = 80;
         this.heyizhenButton.height = 20;
         this.heyizhenButton.align = "center";
         this.yulizhen = new YuLiZhen();
         this.yulizhen.setParent = this;
         this.yulizhen.x = 90;
         this.yulizhen.y = 22;
         this.yulizhenButton = new NewButton();
         this.yulizhenButton.label = LanResManager.getLanCommonTextWords("鱼丽阵");
         this.yulizhenButton.width = 80;
         this.yulizhenButton.height = 20;
         this.yulizhenButton.align = "center";
         this.yanyuezhen = new YanYueZhen();
         this.yanyuezhen.setParent = this;
         this.yanyuezhen.x = 90;
         this.yanyuezhen.y = 22;
         this.yanyuezhenButton = new NewButton();
         this.yanyuezhenButton.label = LanResManager.getLanCommonTextWords("偃月阵");
         this.yanyuezhenButton.width = 80;
         this.yanyuezhenButton.height = 20;
         this.yanyuezhenButton.align = "center";
         this.changshezhen = new ChangSheZhen();
         this.changshezhen.setParent = this;
         this.changshezhen.x = 90;
         this.changshezhen.y = 22;
         this.changshezhenButton = new NewButton();
         this.changshezhenButton.label = LanResManager.getLanCommonTextWords("长蛇阵");
         this.changshezhenButton.width = 80;
         this.changshezhenButton.height = 20;
         this.changshezhenButton.align = "center";
         this.yanxingzhen = new YanXingZhen();
         this.yanxingzhen.setParent = this;
         this.yanxingzhen.x = 90;
         this.yanxingzhen.y = 22;
         this.yanxingzhenButton = new NewButton();
         this.yanxingzhenButton.label = LanResManager.getLanCommonTextWords("雁行阵");
         this.yanxingzhenButton.width = 80;
         this.yanxingzhenButton.height = 20;
         this.yanxingzhenButton.align = "center";
         this.xuanxiangzhen = new XuanXiangZhen();
         this.xuanxiangzhen.setParent = this;
         this.xuanxiangzhen.x = 90;
         this.xuanxiangzhen.y = 22;
         this.xuanxiangzhenButton = new NewButton();
         this.xuanxiangzhenButton.label = LanResManager.getLanCommonTextWords("玄襄阵");
         this.xuanxiangzhenButton.width = 80;
         this.xuanxiangzhenButton.height = 20;
         this.xuanxiangzhenButton.align = "center";
         this.hutaozhen = new HuTaoZhen();
         this.hutaozhen.setParent = this;
         this.hutaozhen.x = 90;
         this.hutaozhen.y = 22;
         this.hutaozhenButton = new NewButton();
         this.hutaozhenButton.label = LanResManager.getLanCommonTextWords("虎韬阵");
         this.hutaozhenButton.width = 80;
         this.hutaozhenButton.height = 20;
         this.hutaozhenButton.align = "center";
         this.yunlongzhen = new YunLongZhen();
         this.yunlongzhen.setParent = this;
         this.yunlongzhen.x = 90;
         this.yunlongzhen.y = 22;
         this.yunlongzhenButton = new NewButton();
         this.yunlongzhenButton.label = LanResManager.getLanCommonTextWords("云龙阵");
         this.yunlongzhenButton.width = 80;
         this.yunlongzhenButton.height = 20;
         this.yunlongzhenButton.align = "center";
         this.pangxiezhen = new PangXieZhen();
         this.pangxiezhen.setParent = this;
         this.pangxiezhen.x = 90;
         this.pangxiezhen.y = 22;
         this.pangxiezhenButton = new NewButton();
         this.pangxiezhenButton.label = LanResManager.getLanCommonTextWords("螃蟹阵");
         this.pangxiezhenButton.width = 80;
         this.pangxiezhenButton.height = 20;
         this.pangxiezhenButton.align = "center";
         this._tianFuZhenPanel = new TianFuZhen();
         this._tianFuZhenPanel.setParent = this;
         this._tianFuZhenPanel.x = 90;
         this._tianFuZhenPanel.y = 22;
         this._tianFuZhenBtn = new NewButton();
         this._tianFuZhenBtn.label = LanResManager.getLanCommonTextWords("天覆阵");
         this._tianFuZhenBtn.width = 80;
         this._tianFuZhenBtn.height = 20;
         this._tianFuZhenBtn.align = "center";
         TianFuZhenTargetController.instance.setup(this,this._tianFuZhenPanel);
         this._niaoXiangZhenPanel = new NiaoXiangZhen();
         this._niaoXiangZhenPanel.setParent = this;
         this._niaoXiangZhenPanel.x = 90;
         this._niaoXiangZhenPanel.y = 22;
         this._niaoXiangZhenBtn = new NewButton();
         this._niaoXiangZhenBtn.label = LanResManager.getLanCommonTextWords("鸟翔阵");
         this._niaoXiangZhenBtn.width = 80;
         this._niaoXiangZhenBtn.height = 20;
         this._niaoXiangZhenBtn.align = "center";
         NiaoXiangZhenTargetController.instance.setup(this,this._niaoXiangZhenPanel);
         this.dizaizhen = new DiZaiZhen();
         this.dizaizhen.setParent = this;
         this.dizaizhen.x = 90;
         this.dizaizhen.y = 22;
         this.dizaizhenButton = new NewButton();
         this.dizaizhenButton.label = LanResManager.getLanCommonTextWords("地载阵");
         this.dizaizhenButton.width = 80;
         this.dizaizhenButton.height = 20;
         this.dizaizhenButton.align = "center";
         this.fengyangzhen = new FengYangZhen();
         this.fengyangzhen.setParent = this;
         this.fengyangzhen.x = 90;
         this.fengyangzhen.y = 22;
         this.fengyangzhenButton = new NewButton();
         this.fengyangzhenButton.label = LanResManager.getLanCommonTextWords("风扬阵");
         this.fengyangzhenButton.width = 80;
         this.fengyangzhenButton.height = 20;
         this.fengyangzhenButton.align = "center";
         this.wuduzhen = new WuDuZhen();
         this.wuduzhen.$parent = this;
         this.wuduzhen.x = 90;
         this.wuduzhen.y = 22;
         this.wuduzhenButton = new NewButton();
         this.wuduzhenButton.label = LanResManager.getLanCommonTextWords("五毒阵");
         this.wuduzhenButton.width = 80;
         this.wuduzhenButton.height = 20;
         this.wuduzhenButton.align = "center";
         this.bazhentu = new BaZhenTu();
         this.bazhentu.setParent = this;
         this.bazhentu.x = 90;
         this.bazhentu.y = 22;
         this.bazhentuButton = new NewButton();
         this.bazhentuButton.label = LanResManager.getLanCommonTextWords("八阵图");
         this.bazhentuButton.width = 80;
         this.bazhentuButton.height = 20;
         this.bazhentuButton.align = "center";
         this.wanhunzhen = new WanHunZhen();
         this.wanhunzhen.setParent = this;
         this.wanhunzhen.x = 90;
         this.wanhunzhen.y = 22;
         this.wanhunzhenButton = new NewButton();
         this.wanhunzhenButton.label = LanResManager.getLanCommonTextWords("万魂阵");
         this.wanhunzhenButton.width = 80;
         this.wanhunzhenButton.height = 20;
         this.wanhunzhenButton.align = "center";
         this.tianyuyanmeng = new TianYuYanMeng();
         this.tianyuyanmeng.setParent = this;
         this.tianyuyanmeng.x = 90;
         this.tianyuyanmeng.y = 22;
         this.tianyuyanmengButton = new NewButton();
         this.tianyuyanmengButton.label = LanResManager.getLanCommonTextWords("天欲烟梦");
         this.tianyuyanmengButton.width = 80;
         this.tianyuyanmengButton.height = 20;
         this.tianyuyanmengButton.align = "center";
         this.zhenyanshouyin = new ZhenYanShouYin();
         this.zhenyanshouyin.$parent = this;
         this.zhenyanshouyin.x = 90;
         this.zhenyanshouyin.y = 22;
         this.zhenyanshouyinButton = new NewButton();
         this.zhenyanshouyinButton.label = LanResManager.getLanCommonTextWords("真言手印");
         this.zhenyanshouyinButton.width = 80;
         this.zhenyanshouyinButton.height = 20;
         this.zhenyanshouyinButton.align = "center";
         this.zhenlongqiju = new ZhenLongQiJu();
         this.zhenlongqiju.setParent = this;
         this.zhenlongqiju.x = 90;
         this.zhenlongqiju.y = 22;
         this.zhenlongqijuButton = new NewButton();
         this.zhenlongqijuButton.label = LanResManager.getLanCommonTextWords("珍珑棋局");
         this.zhenlongqijuButton.width = 80;
         this.zhenlongqijuButton.height = 20;
         this.zhenlongqijuButton.align = "center";
         this.taohuazhen = new TaoHuaZhen();
         this.taohuazhen.setParent = this;
         this.taohuazhen.x = 90;
         this.taohuazhen.y = 22;
         this.taohuazhenButton = new NewButton();
         this.taohuazhenButton.label = LanResManager.getLanCommonTextWords("桃花阵");
         this.taohuazhenButton.width = 80;
         this.taohuazhenButton.height = 20;
         this.taohuazhenButton.align = "center";
         this.xingxiuzhen = new XingXiuZhen();
         this.xingxiuzhen.setParent = this;
         this.xingxiuzhen.x = 90;
         this.xingxiuzhen.y = 22;
         this.xingxiuzhenButton = new NewButton();
         this.xingxiuzhenButton.label = LanResManager.getLanCommonTextWords("二十八星宿阵");
         this.xingxiuzhenButton.width = 80;
         this.xingxiuzhenButton.height = 20;
         this.xingxiuzhenButton.align = "center";
         this.xingxiuzhen1 = new XingXiuZhen1();
         this.xingxiuzhen1.setParent = this;
         this.xingxiuzhen1.x = 90;
         this.xingxiuzhen1.y = 22;
         this.xingxiuzhen1Button = new NewButton();
         this.xingxiuzhen1Button.label = LanResManager.getLanCommonTextWords("新二十八星宿阵");
         this.xingxiuzhen1Button.width = 80;
         this.xingxiuzhen1Button.height = 20;
         this.xingxiuzhen1Button.align = "center";
         this.qishazhen = new QiShaZhen();
         this.qishazhen.setParent = this;
         this.qishazhen.x = 90;
         this.qishazhen.y = 22;
         this.qishazhenButton = new NewButton();
         this.qishazhenButton.label = LanResManager.getLanCommonTextWords("七杀阵");
         this.qishazhenButton.width = 80;
         this.qishazhenButton.height = 20;
         this.qishazhenButton.align = "center";
         this.fuWenKeHuaButton = new NewButton();
         this.fuWenKeHuaButton.label = LanResManager.getLanCommonTextWords("符文刻画1");
         this.fuWenKeHuaButton.width = 80;
         this.fuWenKeHuaButton.height = 20;
         this.fuWenKeHuaButton.align = "center";
         this.fuWenKeHua = new FuWenKeHua();
         this.fuWenKeHua.setParent = this;
         this.fuWenKeHua.x = 90;
         this.fuWenKeHua.y = 22;
         this.liangyiweichenzhen = new LiangYiWeiChenZhen();
         this.liangyiweichenzhen.setParent = this;
         this.liangyiweichenzhen.x = 90;
         this.liangyiweichenzhen.y = 22;
         this.liangyiweichenzhenButton = new NewButton();
         this.liangyiweichenzhenButton.label = LanResManager.getLanCommonTextWords("两仪微尘阵");
         this.liangyiweichenzhenButton.width = 80;
         this.liangyiweichenzhenButton.height = 20;
         this.liangyiweichenzhenButton.align = "center";
         this.sijuejianzhen = new SiJueJianZhen();
         this.sijuejianzhen.setParent = this;
         this.sijuejianzhen.x = 90;
         this.sijuejianzhen.y = 22;
         this.sijuejianzhenButton = new NewButton();
         this.sijuejianzhenButton.label = LanResManager.getLanCommonTextWords("四绝剑阵");
         this.sijuejianzhenButton.width = 80;
         this.sijuejianzhenButton.height = 20;
         this.sijuejianzhenButton.align = "center";
         this.LeftButtonContainer5 = new Sprite();
         this.LeftButtonContainer5.x = 10;
         this.LeftButtonContainer5.y = 25;
         this.addChild(this.LeftButtonContainer5);
         this.juezhanguangmingding = new JueZhanGuangMingDing();
         this.juezhanguangmingding.setParent = this;
         this.juezhanguangmingding.x = 90;
         this.juezhanguangmingding.y = 22;
         this.juezhanguangmingdingButton = new NewButton();
         this.juezhanguangmingdingButton.label = LanResManager.getLanCommonTextWords("决战光明顶");
         this.juezhanguangmingdingButton.width = 80;
         this.juezhanguangmingdingButton.height = 20;
         this.juezhanguangmingdingButton.align = "center";
         this.LeftButtonContainer6 = new Sprite();
         this.LeftButtonContainer6.x = 10;
         this.LeftButtonContainer6.y = 25;
         this.addChild(this.LeftButtonContainer6);
         this._tushidahuiPanel = new Tushidahui();
         this._tushidahuiPanel.setParent = this;
         this._tushidahuiPanel.x = 90;
         this._tushidahuiPanel.y = 22;
         this._tushidahuiBtn = new NewButton();
         this._tushidahuiBtn.label = LanResManager.getLanCommonTextWords("屠狮大会");
         this._tushidahuiBtn.width = 80;
         this._tushidahuiBtn.height = 20;
         this._tushidahuiBtn.align = "center";
         this.huashanlunjian = new Huashanlunjian();
         this.huashanlunjian.setParent = this;
         this.huashanlunjian.x = 90;
         this.huashanlunjian.y = 22;
         this.huashanlunjianButton = new NewButton();
         this.huashanlunjianButton.label = LanResManager.getLanCommonTextWords("华山论剑");
         this.huashanlunjianButton.width = 80;
         this.huashanlunjianButton.height = 20;
         this.huashanlunjianButton.align = "center";
         TushidahuiTargetController.instance.setup(this,this._tushidahuiPanel);
         this.duguqiubai = new DuGuQiuBai();
         this.duguqiubai.setParent = this;
         addChildAt(this.duguqiubai,0);
         this.duguqiubai.x = 90;
         this.duguqiubai.y = 22;
         this.duguqiubai.visible = false;
         this.duguqiubaiButton = new NewButton();
         this.duguqiubaiButton.label = LanResManager.getLanCommonTextWords("独孤求败");
         this.duguqiubaiButton.width = 80;
         this.duguqiubaiButton.height = 20;
         this.duguqiubaiButton.align = "center";
         this.duguqiubaiButton.y = 80;
         this.xiakexing = new XiaKeXing();
         this.xiakexing.setParent = this;
         addChildAt(this.xiakexing,0);
         this.xiakexing.x = 90;
         this.xiakexing.y = 22;
         this.xiakexing.visible = false;
         this.xiakexingButton = new NewButton();
         this.xiakexingButton.label = LanResManager.getLanCommonTextWords("侠客行");
         this.xiakexingButton.width = 80;
         this.xiakexingButton.height = 20;
         this.xiakexingButton.align = "center";
         this.xiakexingButton.y = 80;
         this.LeftButtonContainer6 = new Sprite();
         this.LeftButtonContainer6.x = 10;
         this.LeftButtonContainer6.y = 25;
         this.addChildAt(this.LeftButtonContainer6,0);
         this.woDeMenPai = new WoDeMenPai();
         this.woDeMenPai.x = 10;
         this.woDeMenPai.y = 22;
         this.woDeMenPai.visible = false;
         addChildAt(this.woDeMenPai,1);
         this.woDeMenPaiButton = new NewButton();
         this.woDeMenPaiButton.label = LanResManager.getLanCommonTextWords("门派");
         this.woDeMenPaiButton.width = 80;
         this.woDeMenPaiButton.height = 20;
         this.woDeMenPaiButton.align = "center";
         this.woDeMenPaiButton.visible = false;
         this.woDeMenPaiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
         this.LeftButtonContainer6.addChild(this.woDeMenPaiButton);
         _loc1_ = new Object();
         _loc1_.neirong = this.woDeMenPai;
         _loc1_.biaoqian = this.woDeMenPaiButton;
         _loc1_.name = "1";
         _loc1_.isShow = false;
         _loc1_.dengji = 0;
         this.btnArray6.push(_loc1_);
         this.addChildAt(this.LeftButtonContainer6,0);
         this.LeftButtonContainer7 = new Sprite();
         this.LeftButtonContainer7.x = 10;
         this.LeftButtonContainer7.y = 25;
         this.addChildAt(this.LeftButtonContainer7,0);
         this.woderongyu = new WoDeRongYu();
         this.woderongyu.setParent = this;
         this.woderongyu.x = 10;
         this.woderongyu.y = 22;
         this.woderongyuButton = new NewButton();
         this.woderongyuButton.label = LanResManager.getLanCommonTextWords("我的荣誉");
         this.woderongyuButton.width = 80;
         this.woderongyuButton.height = 20;
         this.woderongyuButton.align = "center";
         this.woderongyuButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
         this.LeftButtonContainer7.addChild(this.woderongyuButton);
         _loc1_ = new Object();
         _loc1_.neirong = this.woderongyu;
         _loc1_.biaoqian = this.woderongyuButton;
         _loc1_.name = "1";
         _loc1_.isShow = true;
         _loc1_.dengji = 0;
         this.btnArray7.push(_loc1_);
         this.addChildAt(this.LeftButtonContainer7,0);
         addChildAt(this.woderongyu,1);
         this.rijinlun = new Rijinlun();
         this.rijinlun.setParent = this;
         this.rijinlun.x = 90;
         this.rijinlun.y = 22;
         this.rijinlunButton = new NewButton();
         this.rijinlunButton.label = LanResManager.getLanCommonTextWords("日金轮");
         this.rijinlunButton.width = 80;
         this.rijinlunButton.height = 20;
         this.rijinlunButton.align = "center";
         this.rijinlunButton.y = 60;
         this.yuejinlun = new Yuejinlun();
         this.yuejinlun.setParent = this;
         this.yuejinlun.x = 90;
         this.yuejinlun.y = 22;
         this.yuejinlunButton = new NewButton();
         this.yuejinlunButton.label = LanResManager.getLanCommonTextWords("月金轮");
         this.yuejinlunButton.width = 80;
         this.yuejinlunButton.height = 20;
         this.yuejinlunButton.align = "center";
         this.yuejinlunButton.y = 60;
         this.preBtn1 = new FSimpleButton();
         this.preBtn1.skin = "mainPanelUpBtn";
         this.preBtn1.y = 342;
         this.preBtn1.x = 18;
         this.preBtn1.addEventListener(MouseEvent.CLICK,this.onPreNextClick);
         this.LeftButtonContainer1.addChild(this.preBtn1);
         this.nextBtn1 = new FSimpleButton();
         this.nextBtn1.skin = "mainPanelDownBtn";
         this.nextBtn1.y = 342;
         this.nextBtn1.x = this.preBtn1.x + this.preBtn1.width + 5;
         this.nextBtn1.addEventListener(MouseEvent.CLICK,this.onPreNextClick);
         this.LeftButtonContainer1.addChild(this.nextBtn1);
         this.preBtn2 = new FSimpleButton();
         this.preBtn2.skin = "mainPanelUpBtn";
         this.preBtn2.y = 342;
         this.preBtn2.x = 18;
         this.preBtn2.addEventListener(MouseEvent.CLICK,this.onPreNextClick);
         this.LeftButtonContainer2.addChild(this.preBtn2);
         this.nextBtn2 = new FSimpleButton();
         this.nextBtn2.skin = "mainPanelDownBtn";
         this.nextBtn2.y = 342;
         this.nextBtn2.x = this.preBtn2.x + this.preBtn2.width + 5;
         this.nextBtn2.addEventListener(MouseEvent.CLICK,this.onPreNextClick);
         this.LeftButtonContainer2.addChild(this.nextBtn2);
         this.preBtn3 = new FSimpleButton();
         this.preBtn3.skin = "mainPanelUpBtn";
         this.preBtn3.y = 342;
         this.preBtn3.x = 18;
         this.preBtn3.addEventListener(MouseEvent.CLICK,this.onPreNextClick);
         this.LeftButtonContainer3.addChild(this.preBtn3);
         this.nextBtn3 = new FSimpleButton();
         this.nextBtn3.skin = "mainPanelDownBtn";
         this.nextBtn3.y = 342;
         this.nextBtn3.x = this.preBtn3.x + this.preBtn3.width + 5;
         this.nextBtn3.addEventListener(MouseEvent.CLICK,this.onPreNextClick);
         this.LeftButtonContainer3.addChild(this.nextBtn3);
         this.preBtn4 = new FSimpleButton();
         this.preBtn4.skin = "mainPanelUpBtn";
         this.preBtn4.y = 342;
         this.preBtn4.x = 18;
         this.preBtn4.addEventListener(MouseEvent.CLICK,this.onPreNextClick);
         this.LeftButtonContainer4.addChild(this.preBtn4);
         this.nextBtn4 = new FSimpleButton();
         this.nextBtn4.skin = "mainPanelDownBtn";
         this.nextBtn4.y = 342;
         this.nextBtn4.x = this.preBtn4.x + this.preBtn4.width + 5;
         this.nextBtn4.addEventListener(MouseEvent.CLICK,this.onPreNextClick);
         this.LeftButtonContainer4.addChild(this.nextBtn4);
         this.preBtn5 = new FSimpleButton();
         this.preBtn5.skin = "mainPanelUpBtn";
         this.preBtn5.y = 342;
         this.preBtn5.x = 18;
         this.preBtn5.addEventListener(MouseEvent.CLICK,this.onPreNextClick);
         this.LeftButtonContainer5.addChild(this.preBtn5);
         this.nextBtn5 = new FSimpleButton();
         this.nextBtn5.skin = "mainPanelDownBtn";
         this.nextBtn5.y = 342;
         this.nextBtn5.x = this.preBtn5.x + this.preBtn5.width + 5;
         this.nextBtn5.addEventListener(MouseEvent.CLICK,this.onPreNextClick);
         this.LeftButtonContainer5.addChild(this.nextBtn5);
         this.preBtn6 = new FSimpleButton();
         this.preBtn6.skin = "mainPanelUpBtn";
         this.preBtn6.y = 342;
         this.preBtn6.x = 18;
         this.preBtn6.addEventListener(MouseEvent.CLICK,this.onPreNextClick);
         this.LeftButtonContainer6.addChild(this.preBtn6);
         this.nextBtn6 = new FSimpleButton();
         this.nextBtn6.skin = "mainPanelDownBtn";
         this.nextBtn6.y = 342;
         this.nextBtn6.x = this.preBtn6.x + this.preBtn6.width + 5;
         this.nextBtn6.addEventListener(MouseEvent.CLICK,this.onPreNextClick);
         this.LeftButtonContainer6.addChild(this.nextBtn6);
         this.preBtn7 = new FSimpleButton();
         this.preBtn7.skin = "mainPanelUpBtn";
         this.preBtn7.y = 342;
         this.preBtn7.x = 18;
         this.preBtn7.addEventListener(MouseEvent.CLICK,this.onPreNextClick);
         this.LeftButtonContainer7.addChild(this.preBtn7);
         this.nextBtn7 = new FSimpleButton();
         this.nextBtn7.skin = "mainPanelDownBtn";
         this.nextBtn7.y = 342;
         this.nextBtn7.x = this.preBtn7.x + this.preBtn7.width + 5;
         this.nextBtn7.addEventListener(MouseEvent.CLICK,this.onPreNextClick);
         this.LeftButtonContainer7.addChild(this.nextBtn7);
         _loc2_ = new Vector.<Bitmap>();
         _loc2_.push(this.charContainer.bgImg);
         _loc2_.push(this.anqiContainer.img);
         _loc2_.push(this.rideContainer.bgImg);
         _loc2_.push(this.venationContainer.bgImg1);
         _loc2_.push(this.smithingbodyContainer.bgImg);
         _loc2_.push(this.dantian.bgImg);
         _loc2_.push(this.dugujiujian.bgImg);
         _loc2_.push(this.dongxiao.img);
         _loc2_.push(this.bagua.bgImg);
         _loc2_.push(this.jiuyang.bgImg);
         _loc2_.push(this.bitmap);
         _loc2_.push(this.xiangLongShiBaZahang.bgImg);
         _loc2_.push(this.yiJinJing.bg);
         _loc2_.push(this.xisuiJing.bg);
         _loc2_.push(this.yuncheng.bgImg);
         _loc2_.push(this.wulizhi.bgImg);
         _loc2_.push(this.wuXingZhiRen.bgImg);
         _loc2_.push(this.liumaishenjian.bgImg);
         _loc2_.push(this.zhanhun.bgImg);
         _loc2_.push(this.siLingZhen.bg);
         _loc2_.push(this.zixiashengong.bgImg);
         _loc2_.push(this.qiShangQuan.bgImg);
         this.DynamicManageImages = _loc2_;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("角色"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("功法"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("兵器"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("阵法"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("门派"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("我的荣誉"),this.onTabClick);
         addChild(this.tabBar);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
         this.tulongdao = new TuLongDao();
         this.tulongdao.setParent = this;
         this.tulongdao.x = 90;
         this.tulongdao.y = 22;
         this.tulongdaoButton = new NewButton();
         this.tulongdaoButton.label = LanResManager.getLanCommonTextWords("屠龙刀");
         this.tulongdaoButton.width = 80;
         this.tulongdaoButton.height = 20;
         this.tulongdaoButton.align = "center";
         this.tulongdaoButton.y = 260;
         this.tulongdaoButton.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("屠龙刀") + "</font>";
         this.jinSheJianFa = new JinSheJianFaPanel();
         this.jinSheJianFa.setParent = this;
         this.jinSheJianFa.x = 90;
         this.jinSheJianFa.y = 22;
         this.jinSheJianFaButton = new NewButton();
         this.jinSheJianFaButton.label = LanResManager.getLanCommonTextWords("金蛇剑法");
         this.jinSheJianFaButton.width = 80;
         this.jinSheJianFaButton.height = 20;
         this.jinSheJianFaButton.align = "center";
         this.jinSheJianFaButton.y = 260;
         this.jinSheJianFaButton.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "" + "</font>";
         this.cangjianxuantian = new CangJianXuanTianPanel();
         this.cangjianxuantian.setParent = this;
         this.cangjianxuantian.x = 90;
         this.cangjianxuantian.y = 22;
         this.cangjianxuantianButton = new NewButton();
         this.cangjianxuantianButton.label = LanResManager.getLanCommonTextWords("藏剑玄天");
         this.cangjianxuantianButton.width = 80;
         this.cangjianxuantianButton.height = 20;
         this.cangjianxuantianButton.align = "center";
         this.cangjianxuantianButton.y = 260;
      }
      
      private function onPreNextClick(param1:MouseEvent = null) : void
      {
         switch(param1.target)
         {
            case this.preBtn1:
               this.showBtnByPage(1,this.curPage1 - 1,true);
               break;
            case this.nextBtn1:
               this.showBtnByPage(1,this.curPage1 + 1,true);
               break;
            case this.preBtn2:
               this.showBtnByPage(2,this.curPage2 - 1,true);
               break;
            case this.nextBtn2:
               this.showBtnByPage(2,this.curPage2 + 1,true);
               break;
            case this.preBtn3:
               this.showBtnByPage(3,this.curPage3 - 1,true);
               break;
            case this.nextBtn3:
               this.showBtnByPage(3,this.curPage3 + 1,true);
               break;
            case this.preBtn4:
               this.showBtnByPage(4,this.curPage4 - 1,true);
               break;
            case this.nextBtn4:
               this.showBtnByPage(4,this.curPage4 + 1,true);
               break;
            case this.preBtn5:
               this.showBtnByPage(5,this.curPage5 - 1,true);
               break;
            case this.nextBtn5:
               this.showBtnByPage(5,this.curPage5 + 1,true);
               break;
            case this.preBtn6:
               this.showBtnByPage(6,this.curPage6 - 1,true);
               break;
            case this.nextBtn6:
               this.showBtnByPage(6,this.curPage6 + 1,true);
         }
      }
      
      public function showBtnByPage(param1:int, param2:int = -1, param3:Boolean = false) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param2 != -1)
         {
            this["curPage" + param1] = param2;
         }
         _loc4_ = 0;
         _loc5_ = 0;
         _loc6_ = 0;
         while(_loc6_ < this["btnArray" + param1].length)
         {
            if(this["btnArray" + param1][_loc6_].dengji <= GameInstance.lookPlayerData.attributeInfo.lv)
            {
               _loc5_++;
            }
            if(this["btnArray" + param1][_loc6_].dengji <= GameInstance.lookPlayerData.attributeInfo.lv && _loc5_ > this["curPage" + param1] * this.MAX_VISIBLE_BTN_COUNT && _loc5_ <= (this["curPage" + param1] + 1) * this.MAX_VISIBLE_BTN_COUNT)
            {
               this["btnArray" + param1][_loc6_].biaoqian.visible = true;
               this["btnArray" + param1][_loc6_].biaoqian.y = _loc4_ * 20;
               _loc4_++;
               if(param3)
               {
                  this["btnArray" + param1][_loc6_].biaoqian.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                  param3 = false;
               }
            }
            else
            {
               this["btnArray" + param1][_loc6_].biaoqian.visible = false;
            }
            _loc6_++;
         }
         _loc7_ = (_loc5_ - 1) / this.MAX_VISIBLE_BTN_COUNT;
         if(_loc7_ > 0)
         {
            if(this["curPage" + param1] == 0)
            {
               this["preBtn" + param1].visible = true;
               this["nextBtn" + param1].visible = true;
               this["preBtn" + param1].enabled = false;
               this["nextBtn" + param1].enabled = true;
            }
            else if(this["curPage" + param1] == _loc7_)
            {
               this["preBtn" + param1].visible = true;
               this["nextBtn" + param1].visible = true;
               this["preBtn" + param1].enabled = true;
               this["nextBtn" + param1].enabled = false;
            }
            else
            {
               this["preBtn" + param1].visible = true;
               this["nextBtn" + param1].visible = true;
               this["preBtn" + param1].enabled = true;
               this["nextBtn" + param1].enabled = true;
            }
         }
         else
         {
            this["preBtn" + param1].visible = false;
            this["nextBtn" + param1].visible = false;
            this["preBtn" + param1].enabled = false;
            this["nextBtn" + param1].enabled = false;
         }
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("角色"):
               dispatchEvent(new BaseEvent(UI_TARGETATTRIBUTE_ATTRIBUTE_SHOW));
               this.lb = 1;
               this.showBtnByPage(1,0,false);
               this.bitmap.visible = true;
               break;
            case LanResManager.getLanCommonTextWords("功法"):
               if(this.btnArray2.length)
               {
                  this.btnArray2[0].biaoqian.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
               }
               else
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉，未开启功能"));
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("很抱歉，未开启功能"));
               }
               this.lb = 2;
               this.showBtnByPage(2,0,false);
               this.bitmap.visible = true;
               break;
            case LanResManager.getLanCommonTextWords("兵器"):
               if(this.btnArray3.length)
               {
                  this.btnArray3[0].biaoqian.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
               }
               else
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉，未开启功能"));
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("很抱歉，未开启功能"));
               }
               this.lb = 3;
               this.showBtnByPage(3,0,false);
               this.bitmap.visible = true;
               break;
            case LanResManager.getLanCommonTextWords("阵法"):
               if(this.btnArray4.length)
               {
                  this.btnArray4[0].biaoqian.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
               }
               else
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉，未开启功能"));
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("很抱歉，未开启功能"));
               }
               this.lb = 4;
               this.showBtnByPage(4,0,false);
               this.bitmap.visible = true;
               break;
            case LanResManager.getLanCommonTextWords("传奇"):
               if(this.btnArray5.length)
               {
                  dispatchEvent(new BaseEvent(this.btnArray5[0].eventType));
               }
               this.lb = 5;
               this.bitmap.visible = true;
               this.showBtnByPage(5,0,false);
               break;
            case LanResManager.getLanCommonTextWords("侍从"):
               PipeManager.sendMsg(PipeConstants.SHOW_MEIREN_PANEL,GameInstance.lookPlayerID);
               this.setTabBar(this.lb);
               return;
            case LanResManager.getLanCommonTextWords("门派"):
               dispatchEvent(new BaseEvent(WODEMENPAI));
               this.showBtnByPage(6,0,false);
               this.LeftButtonContainer6.visible = false;
               this.lb = 6;
               this.bitmap.visible = false;
               this.setTabBar(this.lb);
               break;
            case LanResManager.getLanCommonTextWords("我的荣誉"):
               dispatchEvent(new BaseEvent(WODERONGYU));
               this.lb = 7;
               this.bitmap.visible = false;
               this.showBtnByPage(7,0,false);
               break;
            case "龙武阁":
               PipeManager.sendMsg(PipeConstants.YN_REQUEST_LONGWUGE,GameInstance.lookPlayerID);
               this.setTabBar(this.lb);
               return;
         }
      }
      
      private function onButtonClick(param1:MouseEvent) : void
      {
         var _loc2_:NewButton = param1.target as NewButton;
         switch((param1.target as NewButton).label)
         {
            case LanResManager.getLanCommonTextWords("基础"):
               dispatchEvent(new BaseEvent(UI_TARGETATTRIBUTE_ATTRIBUTE_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("经脉"):
               NoticeManager.notify(NoticeManager.FOOT,"Hiện không hỗ trợ tính năng này");
               break;
            case LanResManager.getLanCommonTextWords("肉身"):
               dispatchEvent(new BaseEvent(GETDUANZAOROUSHEN));
               break;
            case LanResManager.getLanCommonTextWords("弓箭"):
               this.showBow();
               this.setBowEnabledFun();
               dispatchEvent(new BaseEvent(GETGONGJIAN));
               break;
            case LanResManager.getLanCommonTextWords("丹田"):
               dispatchEvent(new BaseEvent(GETDANTIAN));
               break;
            case LanResManager.getLanCommonTextWords("暗器"):
               dispatchEvent(new BaseEvent(UI_TARGETATTRIBUTE_ANQI_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("独孤九剑"):
               dispatchEvent(new BaseEvent(DUGUJIUJIAN));
               break;
            case LanResManager.getLanCommonTextWords("九阳神功"):
               dispatchEvent(new BaseEvent(DUGUJIUJIANJ));
               break;
            case LanResManager.getLanCommonTextWords("坐骑"):
               dispatchEvent(new BaseEvent(UI_TARGETATTRIBUTE_RIDE_SHOW));
               break;
            case LanResManager.getLanTextWords(this,"境界"):
               dispatchEvent(new BaseEvent(JINGJIE));
               break;
            case LanResManager.getLanCommonTextWords("运程"):
               dispatchEvent(new BaseEvent(GETYUNCHENG));
               break;
            case LanResManager.getLanCommonTextWords("勋章"):
               dispatchEvent(new BaseEvent(GETWULIZHI));
               break;
            case LanResManager.getLanCommonTextWords("洞箫"):
               dispatchEvent(new BaseEvent(DONGXIAO));
               break;
            case LanResManager.getLanCommonTextWords("八卦掌"):
               dispatchEvent(new BaseEvent(GETDUANZAOROUSHENB));
               break;
            case LanResManager.getLanCommonTextWords("降龙十八掌"):
               dispatchEvent(new BaseEvent(XIANGLONGSHIBAZHANGJ));
               break;
            case LanResManager.getLanCommonTextWords("易筋经"):
               dispatchEvent(new BaseEvent(YIJINJING));
               break;
            case LanResManager.getLanCommonTextWords("洗髓经"):
               dispatchEvent(new BaseEvent(YIJINJING_X));
               break;
            case LanResManager.getLanCommonTextWords("飞龙探云手"):
               dispatchEvent(new BaseEvent(FEILONGTANYUNSHOU));
               break;
            case LanResManager.getLanCommonTextWords("九阴真经"):
               dispatchEvent(new BaseEvent(JIUYINZHENJING));
               break;
            case LanResManager.getLanCommonTextWords("五形拳"):
               dispatchEvent(new BaseEvent(WUXINGQUAN));
               break;
            case LanResManager.getLanCommonTextWords("十八铜人阵"):
               dispatchEvent(new BaseEvent(SHIBATONGREN));
               break;
            case LanResManager.getLanCommonTextWords("战旗"):
               dispatchEvent(new BaseEvent(GETZHANQI));
               break;
            case LanResManager.getLanCommonTextWords("六脉神剑"):
               dispatchEvent(new BaseEvent(LIUMAISHENJIAN));
               break;
            case LanResManager.getLanCommonTextWords("五行之刃"):
               dispatchEvent(new BaseEvent(WUXINGZHIREN));
               break;
            case LanResManager.getLanCommonTextWords("金钟罩"):
               dispatchEvent(new BaseEvent(JINZHONGZHAO));
               break;
            case LanResManager.getLanCommonTextWords("修行"):
               dispatchEvent(new BaseEvent(XIUWEI));
               break;
            case LanResManager.getLanCommonTextWords("战魂"):
               dispatchEvent(new BaseEvent(GETZHANHUN));
               break;
            case LanResManager.getLanCommonTextWords("太玄神功"):
               dispatchEvent(new BaseEvent(TAIXUANSHENGONG));
               break;
            case LanResManager.getLanCommonTextWords("北冥神功"):
               dispatchEvent(new BaseEvent(BEIMINGSHENGONG));
               this.showBeiMingShenGong();
               break;
            case LanResManager.getLanCommonTextWords("四灵阵法"):
               dispatchEvent(new BaseEvent(GETSILINGZHEN));
               break;
            case LanResManager.getLanCommonTextWords("神照经"):
               dispatchEvent(new BaseEvent(SHENZHAOJING));
               break;
            case LanResManager.getLanCommonTextWords("七伤拳"):
               dispatchEvent(new BaseEvent(QISHANGQUAN));
               break;
            case LanResManager.getLanCommonTextWords("紫霞神功"):
               dispatchEvent(new BaseEvent(ZIXIASHENGONG));
               break;
            case LanResManager.getLanCommonTextWords("奇门阵"):
               dispatchEvent(new BaseEvent(QIMENZHEN));
               break;
            case LanResManager.getLanCommonTextWords("蛤蟆功"):
               dispatchEvent(new BaseEvent(HAMAGONG));
               break;
            case LanResManager.getLanCommonTextWords("天赋"):
               dispatchEvent(new BaseEvent(GETTIANFU));
               break;
            case LanResManager.getLanCommonTextWords("五行阵"):
               dispatchEvent(new BaseEvent(WUXINGZHEN));
               break;
            case LanResManager.getLanCommonTextWords("赤血魔阵"):
               dispatchEvent(new BaseEvent(CHIXUEMOZHEN));
               break;
            case LanResManager.getLanCommonTextWords("擒拿点穴术"):
               dispatchEvent(new BaseEvent(SANSHILIUSHOU));
               break;
            case LanResManager.getLanCommonTextWords("北斗七星阵"):
               dispatchEvent(new BaseEvent(BEIDOUQIXINGZHEN));
               break;
            case LanResManager.getLanCommonTextWords("金蝉脱壳"):
               dispatchEvent(new BaseEvent(JINCHANTUOQIAO));
               break;
            case LanResManager.getLanCommonTextWords("九曲黄河阵"):
               dispatchEvent(new BaseEvent(JIUQUHUANGHEZHEN));
               break;
            case LanResManager.getLanCommonTextWords("真武七截阵"):
               dispatchEvent(new BaseEvent(ZHENWUQIJIEZHEN));
               break;
            case LanResManager.getLanCommonTextWords("斗转星移"):
               dispatchEvent(new BaseEvent(DOUZHUANXINGYI));
               break;
            case LanResManager.getLanCommonTextWords("勋章养成"):
               dispatchEvent(new BaseEvent(XUNZHANGYANGCHENG));
               break;
            case LanResManager.getLanCommonTextWords("归流阵"):
               dispatchEvent(new BaseEvent(GUILIUZHEN));
               break;
            case LanResManager.getLanCommonTextWords("金刚伏魔圈"):
               dispatchEvent(new BaseEvent(JINGANGFUMOQUAN));
               break;
            case LanResManager.getLanCommonTextWords("擒龙功"):
               dispatchEvent(new BaseEvent(QINLONGGONG));
               break;
            case LanResManager.getLanCommonTextWords("天使之翼"):
               dispatchEvent(new BaseEvent(CHIBANG));
               break;
            case LanResManager.getLanCommonTextWords("腾天翼"):
               dispatchEvent(new BaseEvent(TENGTIANYI));
               break;
            case LanResManager.getLanCommonTextWords("逍遥御风"):
               dispatchEvent(new BaseEvent(XIAOYAOYUFENG));
               break;
            case LanResManager.getLanCommonTextWords("炼气"):
               dispatchEvent(new BaseEvent(LIANQI));
               break;
            case LanResManager.getLanCommonTextWords("天门阵"):
               dispatchEvent(new BaseEvent(TIANMENZHEN));
               break;
            case LanResManager.getLanCommonTextWords("碧海潮生曲"):
               dispatchEvent(new BaseEvent(BIHAICHAOSHENGQU));
               break;
            case LanResManager.getLanCommonTextWords("鹤翼阵"):
               dispatchEvent(new BaseEvent(HEYIZHEN));
               break;
            case LanResManager.getLanCommonTextWords("鱼丽阵"):
               dispatchEvent(new BaseEvent(YULIZHEN));
               break;
            case LanResManager.getLanCommonTextWords("玉箫剑法"):
               this.showYuXiaoJianFa();
               dispatchEvent(new BaseEvent(YUXIAOJIANFA));
               break;
            case LanResManager.getLanCommonTextWords("偃月阵"):
               dispatchEvent(new BaseEvent(YANYUEZHEN));
               break;
            case LanResManager.getLanCommonTextWords("长蛇阵"):
               dispatchEvent(new BaseEvent(CHANGSHEZHEN));
               break;
            case LanResManager.getLanCommonTextWords("参合指"):
               dispatchEvent(new BaseEvent(CANHEZHI));
               break;
            case LanResManager.getLanCommonTextWords("恶魔之翼"):
               dispatchEvent(new BaseEvent(EMOZHIYI));
               break;
            case LanResManager.getLanCommonTextWords("雁行阵"):
               dispatchEvent(new BaseEvent(YANXINGZHEN));
               break;
            case LanResManager.getLanCommonTextWords("玄襄阵"):
               dispatchEvent(new BaseEvent(XUANXIANGZHEN));
               break;
            case LanResManager.getLanCommonTextWords("决战光明顶"):
               dispatchEvent(new BaseEvent(JUEZHANGUANGMINGDING));
               break;
            case LanResManager.getLanCommonTextWords("干将莫邪"):
               dispatchEvent(new BaseEvent(GANJIANGMOYE));
               break;
            case LanResManager.getLanCommonTextWords("黄道"):
               dispatchEvent(new BaseEvent(REQUEST_YNHUANGDAO));
               break;
            case LanResManager.getLanCommonTextWords("转盘"):
               dispatchEvent(new BaseEvent(REQUEST_ZHUANPAN));
               break;
            case LanResManager.getLanCommonTextWords("王者装备"):
               dispatchEvent(new BaseEvent(REQUEST_WZZB));
               break;
            case LanResManager.getLanCommonTextWords("飞升装备"):
               dispatchEvent(new BaseEvent(REQUEST_FSZB));
               break;
            case LanResManager.getLanCommonTextWords("虎韬阵"):
               dispatchEvent(new BaseEvent(HUTAOZHEN));
               break;
            case LanResManager.getLanCommonTextWords("云龙阵"):
               dispatchEvent(new BaseEvent(YUNLONGZHEN));
               break;
            case LanResManager.getLanCommonTextWords("先天功"):
               dispatchEvent(new BaseEvent(XIANTIANGONG));
               break;
            case LanResManager.getLanCommonTextWords("螃蟹阵"):
               dispatchEvent(new BaseEvent(PANGXIEZHEN));
               break;
            case LanResManager.getLanCommonTextWords("血刀心法"):
               dispatchEvent(new BaseEvent(XUEDAOXINFA));
               break;
            case LanResManager.getLanCommonTextWords("天覆阵"):
               dispatchEvent(new BaseEvent(TianFuZhenConst.TARGET_TIANFUZHEN));
               break;
            case LanResManager.getLanCommonTextWords("鸟翔阵"):
               dispatchEvent(new BaseEvent(NiaoXiangZhenConst.TARGET_NIAOXIANGZHEN));
               break;
            case LanResManager.getLanCommonTextWords("虎翼觉醒"):
               dispatchEvent(new BaseEvent(HUYIJUEXING));
               break;
            case LanResManager.getLanCommonTextWords("屠狮大会"):
               dispatchEvent(new BaseEvent(TushidahuiConst.TARGET_TUSHIDAHUI));
               break;
            case LanResManager.getLanCommonTextWords("地载阵"):
               dispatchEvent(new BaseEvent(DIZAIZHEN));
               break;
            case LanResManager.getLanCommonTextWords("风扬阵"):
               dispatchEvent(new BaseEvent(FENGYANGZHEN));
               break;
            case LanResManager.getLanCommonTextWords("龙牙觉醒"):
               dispatchEvent(new BaseEvent(LONGYAJUEXING));
               break;
            case LanResManager.getLanCommonTextWords("犬神觉醒"):
               dispatchEvent(new BaseEvent(QUANSHENJUEXING));
               break;
            case LanResManager.getLanCommonTextWords("五毒阵"):
               dispatchEvent(new BaseEvent(WUDUZHEN));
               break;
            case LanResManager.getLanCommonTextWords("龙吟觉醒"):
               dispatchEvent(new BaseEvent(LONGYINJUEXING));
               break;
            case LanResManager.getLanCommonTextWords("神行百变"):
               dispatchEvent(new BaseEvent(SHENXINGBAIBIAN));
               break;
            case LanResManager.getLanCommonTextWords("狼魂盾"):
               dispatchEvent(new BaseEvent(LANGHUNDUN));
               break;
            case LanResManager.getLanCommonTextWords("如来神掌"):
               dispatchEvent(new BaseEvent(RULAISHENZHANG));
               break;
            case LanResManager.getLanCommonTextWords("落英神剑掌"):
               dispatchEvent(new BaseEvent(LUOYINGSHENJIANZHANG));
               break;
            case LanResManager.getLanCommonTextWords("八阵图"):
               dispatchEvent(new BaseEvent(BAZHENTU));
               break;
            case LanResManager.getLanCommonTextWords("独孤求败"):
               dispatchEvent(new BaseEvent(DUGUQIUBAI));
               break;
            case LanResManager.getLanCommonTextWords("玄铁剑法"):
               dispatchEvent(new BaseEvent(XUANTIEJIANFA));
               break;
            case LanResManager.getLanCommonTextWords("长生诀"):
               dispatchEvent(new BaseEvent(CHANGSHENGJUE));
               break;
            case LanResManager.getLanCommonTextWords("万魂阵"):
               dispatchEvent(new BaseEvent(WANHUNZHEN));
               break;
            case LanResManager.getLanCommonTextWords("门派"):
               dispatchEvent(new BaseEvent(WODEMENPAI));
               break;
            case LanResManager.getLanCommonTextWords("真言手印"):
               dispatchEvent(new BaseEvent(ZHENYANSHOUYIN));
               break;
            case LanResManager.getLanCommonTextWords("我的荣誉"):
               dispatchEvent(new BaseEvent(WODERONGYU));
               break;
            case LanResManager.getLanCommonTextWords("珍珑棋局"):
               dispatchEvent(new BaseEvent(ZHENLONGQIJU));
               break;
            case LanResManager.getLanCommonTextWords("生死符"):
               dispatchEvent(new BaseEvent(SHENGSIFU));
               break;
            case LanResManager.getLanCommonTextWords("桃花阵"):
               dispatchEvent(new BaseEvent(TAOHUAZHEN));
               break;
            case LanResManager.getLanCommonTextWords("侠客行"):
               dispatchEvent(new BaseEvent(XIAKEXING));
               break;
            case LanResManager.getLanCommonTextWords("魔灵之翼"):
               dispatchEvent(new BaseEvent(MOLINGZHIYI));
               break;
            case LanResManager.getLanCommonTextWords("伏魔杖法"):
               dispatchEvent(new BaseEvent(FUMOZHANGFA));
               break;
            case LanResManager.getLanCommonTextWords("玉女素心剑"):
               dispatchEvent(new BaseEvent(YUNVSUXINJIANFA));
               break;
            case LanResManager.getLanCommonTextWords("裂空觉醒"):
               dispatchEvent(new BaseEvent(LIEKONGJUEXING));
               break;
            case LanResManager.getLanCommonTextWords("天欲烟梦"):
               dispatchEvent(new BaseEvent(TIANYUYANMENG));
               break;
            case LanResManager.getLanCommonTextWords("天山六阳掌"):
               dispatchEvent(new BaseEvent(TIANSHANLIUYANGZHANG));
               break;
            case LanResManager.getLanCommonTextWords("傲剑神将技"):
               dispatchEvent(new BaseEvent(AOJIANSHENJIANGJI));
               break;
            case LanResManager.getLanCommonTextWords("夺命十三剑"):
               dispatchEvent(new BaseEvent(DUOMINGSHISANJIAN));
               break;
            case LanResManager.getLanCommonTextWords("武侠卡牌"):
               PipeManager.sendMsg(PipeConstants.REQUEST_WUXIAKAPAI,GameInstance.lookPlayerID);
               break;
            case LanResManager.getLanCommonTextWords("日金轮"):
               dispatchEvent(new BaseEvent(RIJINLUN));
               break;
            case LanResManager.getLanCommonTextWords("空明拳"):
               dispatchEvent(new BaseEvent(KONGMINGQUAN));
               break;
            case LanResManager.getLanCommonTextWords("血饮觉醒"):
               dispatchEvent(new BaseEvent(XUEYINJUEXING));
               break;
            case LanResManager.getLanCommonTextWords("华山论剑"):
               dispatchEvent(new BaseEvent(HUASHANLUNJIAN));
               break;
            case LanResManager.getLanCommonTextWords("月金轮"):
               dispatchEvent(new BaseEvent(YUEJINLUN));
               break;
            case LanResManager.getLanCommonTextWords("寒冰神掌"):
               dispatchEvent(new BaseEvent(HANBINGSHENZHANG));
               break;
            case LanResManager.getLanCommonTextWords("灵犀一指"):
               dispatchEvent(new BaseEvent(LINGXIYIZHI));
               break;
            case LanResManager.getLanCommonTextWords("藏宝阁"):
               PipeManager.sendMsg(PipeConstants.SHOW_XUNZHANG_PANEL,GameInstance.lookPlayerID);
               break;
            case "龙武阁":
               PipeManager.sendMsg(PipeConstants.YN_REQUEST_LONGWUGE,GameInstance.lookPlayerID);
               break;
            case LanResManager.getLanCommonTextWords("六龙装备"):
               dispatchEvent(new BaseEvent(LIULONGZHUANGBEI));
               break;
            case LanResManager.getLanCommonTextWords("精灵气旋"):
               dispatchEvent(new BaseEvent(JINGLINGQIXUAN));
               break;
            case "Hồn Hoàn":
               dispatchEvent(new BaseEvent(GUIHUN));
               break;
            case LanResManager.getLanCommonTextWords("勋章展示"):
               PipeManager.sendMsg(PipeConstants.SHOW_XUNZHANGZHANSHI_PANEL,GameInstance.lookPlayerID);
               break;
            case LanResManager.getLanCommonTextWords("二十八星宿阵"):
               dispatchEvent(new BaseEvent(XINGXIUZHEN));
               break;
            case LanResManager.getLanCommonTextWords("新二十八星宿阵"):
               dispatchEvent(new BaseEvent(XINGXIUZHEN1));
               break;
            case LanResManager.getLanCommonTextWords("七杀阵"):
               dispatchEvent(new BaseEvent(QISHAZHEN));
               break;
            case LanResManager.getLanCommonTextWords("符文刻画1"):
               dispatchEvent(new BaseEvent(FUWENKEHUA));
               break;
            case LanResManager.getLanCommonTextWords("两仪微尘阵"):
               dispatchEvent(new BaseEvent(LIANGYIWEICHENZHEN));
               break;
            case LanResManager.getLanCommonTextWords("四绝剑阵"):
               dispatchEvent(new BaseEvent(SIJUEJIANZHEN));
               break;
            case LanResManager.getLanCommonTextWords("襄阳之战"):
               dispatchEvent(new BaseEvent(XIANGYANGZHIZHAN));
               break;
            case LanResManager.getLanCommonTextWords("金凤雕"):
               this.initCharPanel(3,"20");
               break;
            case LanResManager.getLanCommonTextWords("惊雷枪"):
               dispatchEvent(new BaseEvent(JINGLEIQIANG));
               break;
            case LanResManager.getLanCommonTextWords("明玉功"):
               dispatchEvent(new BaseEvent(MINGYUGONG));
               break;
            case LanResManager.getLanCommonTextWords("屠龙刀"):
               dispatchEvent(new BaseEvent(TULONGDAO));
               break;
            case LanResManager.getLanCommonTextWords("金蛇剑法"):
               dispatchEvent(new BaseEvent(JINSHEJIANFA));
               break;
            case LanResManager.getLanCommonTextWords("粗浅功夫"):
               dispatchEvent(new BaseEvent(CUQIANKUNGFU));
               break;
            case LanResManager.getLanCommonTextWords("双龙斩"):
               dispatchEvent(new BaseEvent(QINGDIESHUANGREN));
               break;
            case LanResManager.getLanCommonTextWords("藏剑玄天"):
               dispatchEvent(new BaseEvent(CANGJIANXUANTIAN));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         this.removeMc();
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function initCharPanel(param1:int, param2:String) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         _loc3_ = 0;
         _loc4_ = true;
         _loc5_ = 1;
         while(_loc5_ <= this.BUTTON_CONTAINER_NUM)
         {
            if(_loc5_ == param1)
            {
               this["LeftButtonContainer" + _loc5_].visible = true;
               _loc6_ = 0;
               while(_loc6_ < this["btnArray" + _loc5_].length)
               {
                  if(this["btnArray" + _loc5_][_loc6_].dengji <= GameInstance.lookPlayerData.attributeInfo.lv && _loc4_)
                  {
                     _loc3_++;
                  }
                  if(this["btnArray" + _loc5_][_loc6_].name == param2)
                  {
                     _loc4_ = false;
                     this["btnArray" + _loc5_][_loc6_].neirong.visible = true;
                     this["btnArray" + _loc5_][_loc6_].biaoqian.skin = "selectButton";
                  }
                  else
                  {
                     this["btnArray" + _loc5_][_loc6_].neirong.visible = false;
                     this["btnArray" + _loc5_][_loc6_].biaoqian.skin = "newButton";
                  }
                  _loc6_++;
               }
            }
            else
            {
               this["LeftButtonContainer" + _loc5_].visible = false;
               _loc7_ = 0;
               while(_loc7_ < this["btnArray" + _loc5_].length)
               {
                  this["btnArray" + _loc5_][_loc7_].neirong.visible = false;
                  _loc7_++;
               }
            }
            _loc5_++;
         }
         this.showBtnByPage(param1,(_loc3_ - 1) / this.MAX_VISIBLE_BTN_COUNT,false);
         this.removeMc();
      }
      
      public function setIsShowBiaoqian(param1:int) : void
      {
         var i:int = 0;
         var cont:int = 0;
         var sortOnDengJi:Function = null;
         var j:int = 0;
         var int1:int = param1;
         i = 1;
         while(i <= this.BUTTON_CONTAINER_NUM)
         {
            sortOnDengJi = function(param1:Object, param2:Object):Number
            {
               var _loc3_:Number = NaN;
               var _loc4_:Number = NaN;
               _loc3_ = parseInt(param1.name);
               _loc4_ = parseInt(param2.name);
               if(_loc3_ > _loc4_)
               {
                  return 1;
               }
               if(_loc3_ < _loc4_)
               {
                  return -1;
               }
               return 0;
            };
            cont = 0;
            this["btnArray" + i].sort(sortOnDengJi);
            j = 0;
            while(j < this["btnArray" + i].length)
            {
               if(this["btnArray" + i][j].dengji <= int1)
               {
                  this["btnArray" + i][j].biaoqian.visible = true;
                  this["btnArray" + i][j].biaoqian.y = j * 20 - cont * 20;
               }
               else
               {
                  cont++;
                  this["btnArray" + i][j].biaoqian.visible = false;
               }
               j++;
            }
            i++;
         }
      }
      
      public function setTabBar(param1:int) : void
      {
         if(param1 == 1)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("角色"));
         }
         else if(param1 == 2)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("功法"));
         }
         else if(param1 == 3)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("兵器"));
         }
         else if(param1 == 4)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("阵法"));
         }
         else if(param1 == 5)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("传奇"));
         }
         else if(param1 == 7)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("我的荣誉"));
         }
         else if(param1 == 6)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("门派"));
         }
      }
      
      public function showChar() : void
      {
         this.initCharPanel(1,"1");
      }
      
      public function setAvatar(param1:BitmapData) : void
      {
         this.charContainer.avatar = param1;
         if(param1 != null)
         {
            if((GameInstance.lookPlayerData as Player).avatarInfo.needChangeAvatarXY)
            {
               this.charContainer.setAvaterXY(true);
            }
         }
      }
      
      public function setBaseAttribute(param1:String = "", param2:String = "", param3:Number = -1, param4:Number = -1, param5:int = -1, param6:String = "", param7:String = "", param8:String = "", param9:Number = -1, param10:int = 0, param11:int = -1, param12:int = -1, param13:int = -1) : void
      {
         this.charContainer.setBaseAttribute(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13);
      }
      
      public function setZhenQi(param1:int, param2:int) : void
      {
         this.charContainer.setZhenQi(param1,param2);
      }
      
      public function setShowItem(param1:Array, param2:Boolean = false) : void
      {
         this.charContainer.setShowItem(param1,param2);
      }
      
      public function setICOState(param1:Boolean, param2:int, param3:Boolean, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:int, param9:Boolean, param10:int, param11:Boolean, param12:int, param13:Boolean, param14:int, param15:Boolean, param16:int) : void
      {
         this.charContainer.ico.setState(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15,param16);
      }
      
      public function setICOXiantian(param1:Boolean, param2:int, param3:int, param4:int) : void
      {
         this.charContainer.ico.setXiantian(param1,param2,param3,param4);
      }
      
      public function setICOHuXinYao(param1:Boolean) : void
      {
         this.charContainer.ico.setHuXinYao(param1);
      }
      
      public function setICONiXi(param1:Boolean) : void
      {
         this.charContainer.ico.setNiXi(param1);
      }
      
      public function setICOFengHuang(param1:Boolean) : void
      {
         this.charContainer.ico.setFengHuang(param1);
      }
      
      public function setICORouti(param1:Boolean) : void
      {
         this.charContainer.ico.setRouti(param1);
      }
      
      public function setSiShengShouState(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.charContainer.ico.setSiShengShouState(param1,param2,param3,param4);
      }
      
      public function setICOWuhun(param1:int, param2:Boolean, param3:Boolean, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:Boolean, param9:int) : void
      {
         this.charContainer.ico.setWuhun(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function setHPMP(param1:Number = -1, param2:Number = -1, param3:Number = -1, param4:Number = -1, param5:Number = -1, param6:Number = -1) : void
      {
         this.charContainer.setHPMP(param1,param2,param3,param4,param5,param6);
      }
      
      public function setSkillValue(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
      {
         this.charContainer.setSkillValue(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function setSkillSchedule(param1:Number, param2:Number) : void
      {
         this.charContainer.setSkillSchedule(param1,param2);
      }
      
      public function setVenation(param1:int, param2:int) : void
      {
         this.charContainer.setVenation(param1,param2);
      }
      
      public function setAccomplishment(param1:int, param2:int) : void
      {
         this.charContainer.setAccomplishment(param1,param2);
      }
      
      public function setRoushenjingjie(param1:int, param2:int, param3:int) : void
      {
         this.charContainer.setRoushenjingjie(param1,param2,param3);
      }
      
      public function setYupei(param1:Goods = null) : void
      {
         this.charContainer.setYupei(param1);
      }
      
      public function setZanWenValue(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int) : void
      {
         this.charContainer.setZanWenValue(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
      }
      
      public function set9JianJianCheng(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number) : void
      {
         this.charContainer.set9JianJianCheng(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
      }
      
      public function addSlot(param1:Boolean) : void
      {
         this.charContainer.addSlot(param1);
      }
      
      public function permitZuoQi(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.zuoqiButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.rideContainer,0);
            this.zuoqiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.zuoqiButton);
            this.btnArray1.push(this.zuoQiObj);
         }
         else if(!param1 && this.zuoqiButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.rideContainer != null && this.rideContainer.parent != null)
            {
               this.rideContainer.parent.removeChild(this.rideContainer);
            }
            this.zuoqiButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.zuoqiButton != null && this.zuoqiButton.parent != null)
            {
               this.zuoqiButton.parent.removeChild(this.zuoqiButton);
            }
            _loc3_ = this.btnArray1.indexOf(this.zuoQiObj);
            if(_loc3_ >= 0)
            {
               this.btnArray1.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showRide() : void
      {
         this.initCharPanel(1,"2");
      }
      
      public function setRideAvatar(param1:BitmapData, param2:int) : void
      {
         this.rideContainer.setAvatar(param1,param2);
      }
      
      public function setYinCangShuXingJiHuo(param1:int) : void
      {
         this.rideContainer.setYinCangShuXingJiHuo(param1);
      }
      
      public function setShouwangzhihun(param1:Boolean, param2:Boolean) : void
      {
         this.rideContainer.setShouwangzhihun(param1,param2);
      }
      
      public function setRideList(param1:XML, param2:String) : void
      {
         this.rideContainer.ridelist = param1;
         this.rideContainer.rideCount = param2;
      }
      
      public function setRideAvatarQuality(param1:String = "") : void
      {
         this.rideContainer.setRideQuality(param1);
      }
      
      public function setRideAddCharValue(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
      {
         this.rideContainer.setAddValue(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function setRideBaseAttribute(param1:String, param2:String, param3:String, param4:String, param5:String) : void
      {
         this.rideContainer.setBaseAttribute(param1,param2,param3,param4,param5);
      }
      
      public function setRideAttibute(param1:Number, param2:Number, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int, param13:int, param14:int, param15:int, param16:int, param17:int, param18:int) : void
      {
         this.rideContainer.setAttribute(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15,param16,param17,param18);
      }
      
      public function setRideEquip(param1:Array) : void
      {
         this.rideContainer.setEquip(param1);
      }
      
      public function setRideSkill(param1:Object) : void
      {
         this.rideContainer.setSkill(param1);
      }
      
      public function setExpireDate(param1:String) : void
      {
         this.rideContainer.setExpireDate(param1);
      }
      
      public function setFlag(param1:int) : void
      {
         this.charContainer.setFlag(param1);
      }
      
      public function setDreamValue(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int) : void
      {
         this.rideContainer.setDreamValue(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function setSiShengShouValue(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
      {
         this.rideContainer.setSiShengShouValue(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function permitAnQi(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.anqiButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.anqiContainer,0);
            this.anqiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.anqiButton);
            this.btnArray3.push(this.objAnQi);
         }
         else if(!param1 && this.anqiButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.anqiContainer != null && this.anqiContainer.parent != null)
            {
               this.anqiContainer.parent.removeChild(this.anqiContainer);
            }
            this.anqiButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.anqiButton != null && this.anqiButton.parent != null)
            {
               this.anqiButton.parent.removeChild(this.anqiButton);
            }
            _loc3_ = this.btnArray3.indexOf(this.objAnQi);
            if(_loc3_ >= 0)
            {
               this.btnArray3.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showAnqi(param1:Boolean = false) : void
      {
         this.initCharPanel(3,"1");
      }
      
      public function setDangqianInitialize(param1:Array) : void
      {
         this.anqiContainer.setDangqianInitialize(false,param1);
      }
      
      public function setAnqiInitialize(param1:Array) : void
      {
         this.anqiContainer.setAnqiInitialize(param1);
      }
      
      public function setSkillTeshunengli(param1:Array) : void
      {
         this.anqiContainer.setSkillTeshunengli(param1);
      }
      
      public function setPageInitialize(param1:int, param2:int, param3:String) : void
      {
         this.anqiContainer.setPageInitialize(param1,param2,param3);
      }
      
      public function setAnqiBtnFun(param1:int) : void
      {
         this.anqiContainer.setAnqiBtnFun(param1);
      }
      
      public function setYincangshuxing(param1:Boolean, param2:Boolean, param3:int) : void
      {
         this.anqiContainer.setYincangshuxing(param1,param2,param3);
      }
      
      public function setAnqiKfSkill(param1:Skill) : void
      {
         this.anqiContainer.setSkill(param1);
      }
      
      public function anqiZuoQi(param1:Boolean) : void
      {
         this.anqiContainer.anqiZuoQi(param1);
      }
      
      public function SetkfSkillContentFalse(param1:Boolean) : void
      {
         this.anqiContainer.SetkfSkillContentFalse(param1);
      }
      
      public function SetkfSkillContent(param1:Boolean) : void
      {
         this.anqiContainer.SetkfSkillContent(param1);
      }
      
      public function setAnQiZhuangBei(param1:Array) : void
      {
         this.anqiContainer.setAnQiZhuangBei(param1);
      }
      
      public function setBierenAnqiBunFun() : void
      {
         this.anqiContainer.setBierenAnqiBunFun();
      }
      
      public function permitBow(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.gongjianButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.bow,0);
            this.gongjianButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.gongjianButton);
            this.btnArray3.push(this.bowObj);
         }
         else if(!param1 && this.gongjianButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.bow != null && this.bow.parent != null)
            {
               this.bow.parent.removeChild(this.bow);
            }
            this.gongjianButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.gongjianButton != null && this.gongjianButton.parent != null)
            {
               this.gongjianButton.parent.removeChild(this.gongjianButton);
            }
            _loc3_ = this.btnArray3.indexOf(this.bowObj);
            if(_loc3_ >= 0)
            {
               this.btnArray3.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showBow() : void
      {
         this.initCharPanel(3,"2");
      }
      
      public function setJianshu(param1:Array, param2:int, param3:int) : void
      {
         this.bow.setJianshu(param1,param2,param3);
      }
      
      public function setJianzhi(param1:Array, param2:int) : void
      {
         this.bow.setJianzhi(param1,param2);
      }
      
      public function setIsOpen(param1:Boolean) : void
      {
         this.bow.setIsOpen(param1);
      }
      
      public function setBowPage(param1:int, param2:int, param3:Boolean = false, param4:int = 0) : void
      {
         this.bow.setBowPage(param1,param2,param3,param4);
      }
      
      public function setZuoyong(param1:String) : void
      {
         this.bow.setZuoyong(param1);
      }
      
      public function setShuxing(param1:Array, param2:Boolean) : void
      {
         this.bow.setShuxing(param1,param2);
      }
      
      public function setName(param1:String, param2:String) : void
      {
         this.bow.setName(param1,param2);
      }
      
      public function setBuff(param1:Array) : void
      {
         this.bow.setBuff(param1);
      }
      
      public function setBowEnabledFun() : void
      {
         this.bow.setBowEnabledFun();
      }
      
      public function setBowEquip(param1:Array) : void
      {
         this.bow.setBowEquip(param1);
      }
      
      public function setYNEquip(param1:Array) : void
      {
         this.bow.setYNBowEquip(param1);
      }
      
      public function removeMc() : void
      {
         this.anqiContainer.removeMc();
         this.bow.removeMc();
         this.dantian.removeMc();
         this.dugujiujian.removeMc();
         this.dongxiao.removeMc();
         this.jiuyang.removeMc();
         this.zixiashengong.removeMc();
         this.xiangLongShiBaZahang.removeMc();
         this.beiMingShenGong.removeMc();
         this.smithingbodyContainer.removeMc();
         this.chiXueMoZhen.removeMc();
         if(this.siLingZhen)
         {
            this.siLingZhen.closeMC();
         }
         this.charContainer.deleteSlot();
         this.charContainer.hideZanWen();
         if(this.fuWenKeHua)
         {
            this.fuWenKeHua.showDataPanel(false);
         }
      }
      
      public function BowShow(param1:Boolean) : void
      {
         this.bow.setShow(param1);
      }
      
      public function setBowJihuo(param1:Boolean) : void
      {
         this.bow.setButtonYC(param1);
      }
      
      public function menuBowToolTip(param1:String) : void
      {
         this.bow.menuToolTip(param1);
      }
      
      public function setBowMenghuanYujian(param1:Boolean) : void
      {
         this.bow.setBowMenghuanYujian(false);
      }
      
      public function setBowDanTian(param1:Boolean) : void
      {
         this.bow.setBowDanTian(param1);
      }
      
      public function setBowJinduNum(param1:int, param2:Boolean) : void
      {
         this.bow.setJinduNum(param1,param2);
      }
      
      public function permitDanTian(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.dantianButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.dantian,0);
            this.dantianButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.dantianButton);
            this.btnArray1.push(this.danTianObj);
         }
         else if(!param1 && this.dantianButton.hasEventListener(MouseEvent.CLICK))
         {
            this.dantianButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.dantian);
            this.removeDisplayObject(this.dantianButton);
            _loc3_ = this.btnArray1.indexOf(this.danTianObj);
            if(_loc3_ >= 0)
            {
               this.btnArray1.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showDantian() : void
      {
         this.initCharPanel(1,"11");
      }
      
      public function setSkill(param1:Array) : void
      {
         this.dantian.setSkill(param1);
      }
      
      public function setDantianShuxing(param1:Array, param2:Boolean) : void
      {
         this.dantian.setShuxing(param1,param2);
      }
      
      public function setWuxue(param1:int, param2:int, param3:int, param4:Boolean) : void
      {
         this.dantian.setWuxue(param1,param2,param3,param4);
      }
      
      public function setDengji(param1:int) : void
      {
         this.dantian.setDengji(param1);
      }
      
      public function jingling(param1:Boolean) : void
      {
         this.dantian.jingling(param1);
      }
      
      public function setLeftMc(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean) : void
      {
         this.dantian.setLeftMc(param1,param2,param3,param4,param5,param6);
      }
      
      public function setRightMc(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.dantian.setRightMc(param1,param2,param3,param4);
      }
      
      public function setXunzhangYN_DT(param1:Array) : *
      {
         this.dantian.setYN(param1);
      }
      
      public function showXunzhangYN_DT_TJLY(param1:Boolean) : void
      {
         this.dantian.showYN_TJLY(param1);
      }
      
      public function setXunzhangSelectYN_DT_TJLY(param1:Boolean) : void
      {
         this.dantian.setCHK_TJLY(param1);
      }
      
      public function showXunzhangYN_DT_SDXN(param1:Boolean) : void
      {
         this.dantian.showYN_SDXN(param1);
      }
      
      public function setXunzhangSelectYN_DT_SDXN(param1:Boolean) : void
      {
         this.dantian.setCHK_SDXN(param1);
      }
      
      public function setDantianZhufuzhi(param1:int, param2:int) : void
      {
         this.dantian.setZhufuzhi(param1,param2);
      }
      
      public function setDantianChenggonglv(param1:int, param2:int, param3:String, param4:Boolean) : void
      {
         this.dantian.setChenggonglv(param1,param2,param3,param4);
      }
      
      public function setDantianPudidan(param1:Goods) : void
      {
         this.dantian.setPudidan(param1);
      }
      
      public function onDantianShowLv(param1:Boolean) : void
      {
         this.dantian.onShowLv(param1);
      }
      
      public function setDantianZdtsBtnLabel(param1:Boolean) : void
      {
         this.dantian.setZdtsBtnLabel(param1);
      }
      
      public function setTupoBtnEnabled(param1:Boolean) : void
      {
         this.dantian.setTupoBtnEnabled(param1);
      }
      
      public function setTishi(param1:Array, param2:Array, param3:Array) : void
      {
         this.dantian.setTishi(param1,param2,param3);
      }
      
      public function setDantianEnabledFun() : void
      {
         this.dantian.setDantianEnabledFun();
      }
      
      public function setDantianJihuo(param1:Boolean = false) : void
      {
         this.dantian.setJihuo(param1);
      }
      
      public function setJihuoDantianJinjieBtn(param1:int) : void
      {
         this.dantian.setJihuoDantianJinjieBtn(param1);
      }
      
      public function setDengjiTupoBtn(param1:String, param2:Boolean, param3:Boolean) : void
      {
         this.dantian.setDengjiTupoBtn(param1,param2,param3);
      }
      
      public function setDantianJinjieBuff(param1:Skill) : void
      {
         this.dantian.setDantianJinjieBuff(param1);
      }
      
      public function setDantianJinjieEnabledFun(param1:Boolean) : void
      {
         this.dantian.setDantianJinjieEnabledFun(param1);
      }
      
      public function menuDantianToolTip(param1:String) : void
      {
         this.dantian.menuToolTip(param1);
      }
      
      public function setDantianJinduNum(param1:int, param2:Boolean) : void
      {
         this.dantian.setJinduNum(param1,param2);
      }
      
      public function setDanTianXinFa(param1:int) : void
      {
         this.dantian.setXinFaItem(param1);
      }
      
      public function setDantianMenghuanJindan(param1:Boolean) : void
      {
         this.dantian.setDantianMenghuanJindan(false);
      }
      
      public function set_DuGuJiuJian(param1:Array) : void
      {
         this.dugujiujian.set_DuGuJiuJian(param1);
      }
      
      public function permitJiuJian(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.dugujiujianButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.dugujiujian,0);
            this.dugujiujianButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.dugujiujianButton);
            this.btnArray2.push(this.objJiuJian);
         }
         else if(!param1 && this.dugujiujianButton.hasEventListener(MouseEvent.CLICK))
         {
            this.dugujiujianButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.dugujiujian);
            this.removeDisplayObject(this.dugujiujianButton);
            _loc3_ = this.btnArray2.indexOf(this.objJiuJian);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showDugujiujian() : void
      {
         this.initCharPanel(2,"4");
      }
      
      public function setDuguJiujianInitialize(param1:Array) : void
      {
         this.dugujiujian.setInitialize(false,param1);
      }
      
      public function setDuguJiujianAvatar(param1:BitmapData) : void
      {
         this.dugujiujian.avatar = param1;
      }
      
      public function setDugujiujianMc(param1:int) : void
      {
         this.dugujiujian.setMc(param1);
      }
      
      public function setJiujianEnabledFun() : void
      {
         this.dugujiujian.setJiujianEnabledFun();
      }
      
      public function setJiuJianJihuo(param1:Boolean, param2:Boolean) : void
      {
         this.dugujiujian.setJihuo(param1,param2);
      }
      
      public function permitDongXiao(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.dongxiaoButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.dongxiao,0);
            this.dongxiaoButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.dongxiaoButton);
            this.btnArray3.push(this.dongXiaoObj);
         }
         else if(!param1 && this.dongxiaoButton.hasEventListener(MouseEvent.CLICK))
         {
            this.dongxiaoButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.dongxiaoButton);
            this.removeDisplayObject(this.dongxiao);
            _loc3_ = this.btnArray3.indexOf(this.dongXiaoObj);
            if(_loc3_ >= 0)
            {
               this.btnArray3.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showDongxiao() : void
      {
         this.initCharPanel(3,"3");
      }
      
      public function setDongxiaoDengji(param1:String) : void
      {
         this.dongxiao.setDengji(param1);
      }
      
      public function setDongxiaoJindu(param1:int, param2:int, param3:Boolean) : void
      {
         this.dongxiao.setJindu(param1,param2,param3);
      }
      
      public function setDongxiaoJianshu(param1:Array) : void
      {
         this.dongxiao.setJianshu(param1);
      }
      
      public function setDongxiaoShuxing(param1:String, param2:int, param3:int, param4:Array) : void
      {
         this.dongxiao.setShuxing(param1,param2,param3,param4);
      }
      
      public function setYCSX(param1:int) : void
      {
         this.dongxiao.setYCSX(param1);
      }
      
      public function setDongxiaoMiaoshu(param1:String) : void
      {
         this.dongxiao.setMiaoshu(param1);
      }
      
      public function setUse(param1:Boolean) : void
      {
         this.dongxiao.setUse(param1);
      }
      
      public function setDongxiaoEnabledFun() : void
      {
         this.dongxiao.setDongxiaoEnabledFun();
      }
      
      public function DongxiaoShow(param1:Boolean) : void
      {
         this.dongxiao.setShow(param1);
      }
      
      public function menuDongxiaoToolTip(param1:String) : void
      {
         this.dongxiao.menuToolTip(param1);
      }
      
      public function setDongxiaoJinduNum(param1:int, param2:Boolean) : void
      {
         this.dongxiao.setJinduNum(param1,param2);
      }
      
      public function setZhanyin(param1:Boolean) : void
      {
         this.dongxiao.setZhanyin(param1);
         this.dongxiao.setJiHuo(false);
      }
      
      public function permitBaGua(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.baguazhangButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.bagua,0);
            this.baguazhangButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.baguazhangButton);
            this.btnArray2.push(this.objBaGua);
         }
         else if(!param1 && this.baguazhangButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.bagua != null && this.bagua.parent != null)
            {
               this.bagua.parent.removeChild(this.bagua);
            }
            this.baguazhangButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.baguazhangButton != null && this.baguazhangButton.parent != null)
            {
               this.baguazhangButton.parent.removeChild(this.baguazhangButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objBaGua);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showSmithingBodyB() : void
      {
         this.initCharPanel(2,"1");
         this.bagua.setBaGuaMenghuanJindan(false);
      }
      
      public function setJingjieB(param1:String = "", param2:String = "") : void
      {
         this.bagua.setJingjie(param1,param2);
      }
      
      public function setMiaoshuB(param1:String) : void
      {
         this.bagua.setMiaoshu(param1);
      }
      
      public function setBar1B(param1:Boolean, param2:int, param3:int) : void
      {
         this.bagua.setBar1(param1,param2,param3);
      }
      
      public function setBar2B(param1:Boolean, param2:int, param3:int) : void
      {
         this.bagua.setBar2(param1,param2,param3);
      }
      
      public function setBar3B(param1:Boolean, param2:int, param3:int) : void
      {
         this.bagua.setBar3(param1,param2,param3);
      }
      
      public function setBar4B(param1:Boolean, param2:int, param3:int) : void
      {
         this.bagua.setBar4(param1,param2,param3);
      }
      
      public function setBar5B(param1:Boolean, param2:int, param3:int) : void
      {
         this.bagua.setBar5(param1,param2,param3);
      }
      
      public function setBar6B(param1:Boolean, param2:int, param3:int) : void
      {
         this.bagua.setBar6(param1,param2,param3);
      }
      
      public function setBar7B(param1:Boolean, param2:int, param3:int) : void
      {
         this.bagua.setBar7(param1,param2,param3);
      }
      
      public function setBar8B(param1:Boolean, param2:int, param3:int) : void
      {
         this.bagua.setBar8(param1,param2,param3);
      }
      
      public function setBar9B(param1:Boolean, param2:int, param3:int) : void
      {
         this.bagua.setBar9(param1,param2,param3);
      }
      
      public function setBar10B(param1:Boolean, param2:int, param3:int) : void
      {
         this.bagua.setBar10(param1,param2,param3);
      }
      
      public function setBar(param1:Boolean, param2:int, param3:int) : void
      {
         this.bagua.setBar(param1,param2,param3);
      }
      
      public function setJinduB(param1:int) : void
      {
         this.bagua.setJindu(param1);
      }
      
      public function setSmithingBodyBuffB(param1:Array) : void
      {
         this.bagua.setSmithingBodyBuff(param1);
      }
      
      public function setJihuoB(param1:Boolean = false) : void
      {
         this.bagua.setJihuo(param1);
      }
      
      public function setBaguazhangEnabledFunB() : void
      {
         this.bagua.setBaguazhangEnabledFun();
      }
      
      public function menuBaguazhangJinduToolTip(param1:String) : void
      {
         this.bagua.menuJinduToolTip(param1);
      }
      
      public function setBaguazhangJinduNum(param1:int, param2:Boolean) : void
      {
         this.bagua.setJinduNum(param1,param2);
      }
      
      public function set_BGHL(param1:Array) : *
      {
         this.bagua.set_BGHL(param1);
      }
      
      public function setXueshou(param1:Boolean) : void
      {
         this.bagua.setXueshou(param1);
      }
      
      public function setBaGuaDanTian(param1:Boolean, param2:Boolean) : void
      {
         this.bagua.setBaGuaDanTian(param1,param2);
      }
      
      public function permitJiuYang(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.jiuyangshengongButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.jiuyang,0);
            this.jiuyangshengongButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.jiuyangshengongButton);
            this.btnArray2.push(this.objJiuYang);
         }
         else if(!param1 && this.jiuyangshengongButton.hasEventListener(MouseEvent.CLICK))
         {
            this.jiuyangshengongButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.jiuyang);
            this.removeDisplayObject(this.jiuyangshengongButton);
            _loc3_ = this.btnArray2.indexOf(this.objJiuYang);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showDugujiujianJ() : void
      {
         this.initCharPanel(2,"5");
      }
      
      public function setDuguJiujianInitializeJ(param1:Array) : void
      {
         this.jiuyang.setInitialize(false,param1);
      }
      
      public function setDuguJiujianAvatarJ(param1:BitmapData) : void
      {
         this.jiuyang.avatar = param1;
      }
      
      public function setDugujiujianMcJ(param1:int) : void
      {
         this.jiuyang.setMc(param1);
      }
      
      public function setJiujianEnabledFunJ() : void
      {
         this.jiuyang.setJiujianEnabledFun();
      }
      
      public function setJiuYangJihuo(param1:Boolean) : void
      {
         this.jiuyang.setJihuo(param1);
      }
      
      public function setJiuYangJiHuo2(param1:Boolean) : void
      {
         this.jiuyang.setJihuo2(param1);
      }
      
      public function permitXiangLong(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.shibazhangButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.xiangLongShiBaZahang,0);
            this.shibazhangButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.shibazhangButton);
            this.btnArray2.push(this.objXiangLong);
         }
         else if(!param1 && this.shibazhangButton.hasEventListener(MouseEvent.CLICK))
         {
            this.shibazhangButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.xiangLongShiBaZahang);
            this.removeDisplayObject(this.shibazhangButton);
            _loc3_ = this.btnArray2.indexOf(this.objXiangLong);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showXiangLongShiBaZhang() : void
      {
         this.initCharPanel(2,"11");
      }
      
      public function initilizeXiangLongShiBaZhangUI(param1:XiangLongMainPanelVO) : void
      {
         this.xiangLongShiBaZahang.initilizeUI(false,param1);
         this.xiangLongShiBaZahang.lockOn();
      }
      
      public function menuJinduToolTip(param1:String) : void
      {
         this.xiangLongShiBaZahang.menuToolTip(param1);
      }
      
      public function setJinduNum(param1:int, param2:Boolean) : void
      {
         this.xiangLongShiBaZahang.setJinduNum(param1,param2);
      }
      
      public function set_XLSBZ(param1:Array) : void
      {
         this.xiangLongShiBaZahang.set_XLSBZ(param1);
      }
      
      public function set_YiJinJing(param1:Array) : void
      {
         this.yiJinJing.set_YiJinJing(param1);
      }
      
      public function permitYiJinJing(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.yijinjingButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.yiJinJing,0);
            this.yijinjingButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.yijinjingButton);
            this.btnArray2.push(this.yiJinJingObj);
         }
         else if(!param1 && this.yijinjingButton.hasEventListener(MouseEvent.CLICK))
         {
            this.yijinjingButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.yiJinJing);
            this.removeDisplayObject(this.yijinjingButton);
            _loc3_ = this.btnArray2.indexOf(this.yiJinJingObj);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showYiJinJing() : void
      {
         this.initCharPanel(2,"3");
      }
      
      public function initilizeYiJinJingUI(param1:YiJinJingVO) : void
      {
         this.yiJinJing.setInitialize(false,param1);
      }
      
      public function setYiJinJingEnabledFunJ() : void
      {
         this.yiJinJing.setYiJinJingEnabledFun();
      }
      
      public function permitJingJie(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.jingjieButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.jingjie,0);
            this.jingjieButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.jingjieButton);
            this.btnArray1.push(this.jingJieObj);
         }
         else if(!param1 && this.jingjieButton.hasEventListener(MouseEvent.CLICK))
         {
            this.jingjieButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.jingjie);
            this.removeDisplayObject(this.jingjieButton);
            _loc3_ = this.btnArray1.indexOf(this.jingJieObj);
            if(_loc3_ >= 0)
            {
               this.btnArray1.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showJingJie() : void
      {
         this.initCharPanel(1,"10");
      }
      
      public function initilizeJingJieUI(param1:int, param2:int, param3:int) : void
      {
         this.jingjie.setInitialize(param1,param2,param3,false);
      }
      
      public function setJingjieShuxing(param1:Boolean, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int) : void
      {
         this.jingjie.setShuxing(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function setJingJieEnabledFunJ() : void
      {
         this.jingjie.setJingJieEnabledFun();
      }
      
      public function set_TSJJ(param1:Array) : void
      {
         this.jingjie.set_CJTBS(param1);
      }
      
      public function set_LYGG(param1:Boolean) : void
      {
         var _loc2_:Skill = null;
         _loc2_ = new Skill(200142);
         _loc2_.isLearn = 1;
         this.jingjie.set_LYGG(param1,_loc2_);
      }
      
      public function setWeilieShuxing(param1:Boolean) : void
      {
         this.jingjie.setWeilieShuxing(param1);
      }
      
      public function setChuandai(param1:Boolean, param2:Boolean) : void
      {
         this.jingjie.setChuandai(param1,param2);
      }
      
      public function permitXiSuiJing(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.xisuijingButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.xisuiJing,0);
            this.xisuijingButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.xisuijingButton);
            this.btnArray2.push(this.xiSuiJingObj);
         }
         else if(!param1 && this.xisuijingButton.hasEventListener(MouseEvent.CLICK))
         {
            this.xisuijingButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.xisuiJing);
            this.removeDisplayObject(this.xisuijingButton);
            _loc3_ = this.btnArray2.indexOf(this.xiSuiJingObj);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showYiJinJing_X() : void
      {
         this.initCharPanel(2,"6");
      }
      
      public function set_XiSuiJing(param1:Array) : void
      {
         this.xisuiJing.set_XiSuiJing(param1);
      }
      
      public function initilizeYiJinJingUI_X(param1:XiSuiJingVO) : void
      {
         this.xisuiJing.setInitialize(false,param1);
      }
      
      public function setYiJinJingEnabledFunJ_X() : void
      {
         this.xisuiJing.setYiJinJingEnabledFun();
      }
      
      public function menuXisuijingToolTip(param1:String) : void
      {
         this.xisuiJing.menuToolTip(param1);
      }
      
      public function setXisuijingJinduNum(param1:int, param2:Boolean) : void
      {
         this.xisuiJing.setJinduNum(param1,param2);
      }
      
      public function permitFeiLong(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.feilongtanyunshouButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.feilongtanyunshou,0);
            this.feilongtanyunshouButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.feilongtanyunshouButton);
            this.btnArray2.push(this.feiLongObj);
         }
         else if(!param1 && this.feilongtanyunshouButton.hasEventListener(MouseEvent.CLICK))
         {
            this.feilongtanyunshouButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.feilongtanyunshou);
            this.removeDisplayObject(this.feilongtanyunshouButton);
            _loc3_ = this.btnArray2.indexOf(this.feiLongObj);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showFeiLongTanYunShou() : void
      {
         this.initCharPanel(2,"8");
      }
      
      public function setFeiLongTanYunShouInitialize(param1:FeiLongTanYunShouVO) : void
      {
         this.feilongtanyunshou.initilizeUI(false,param1);
      }
      
      public function showFeiLongTanYunShouLingWuPanel(param1:Boolean) : void
      {
         this.feilongtanyunshou.showFeilongtanyunshougLingWuPanel(param1);
      }
      
      public function setFeilongtanyunshouLingwuGoods_X(param1:Goods, param2:Boolean) : void
      {
         this.feilongtanyunshou.setGoods(param1,param2);
      }
      
      public function setFeilongtanyunshouLingwuBtn_X(param1:Boolean) : void
      {
         this.feilongtanyunshou.setBtn(param1);
      }
      
      public function isFeilongtanyunshoutupoCanvasShow_X() : Boolean
      {
         return this.feilongtanyunshou.isFeilongtanyunshoutupoCanvasShow();
      }
      
      public function setFeilongtanyunshouLingwuInitialize_X(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:String) : void
      {
         this.feilongtanyunshou.showFeilongtanyunshougLingWuPanel(true);
         this.feilongtanyunshou.setInitialize(param1,param2,param3,param4,param5,param6);
         this.feilongtanyunshou.setShuoming(param7);
      }
      
      public function setFeilongtanyunshouLingwuZhufuzhi_X(param1:int, param2:int, param3:int = 0) : void
      {
         this.feilongtanyunshou.setZhufuzhi(param1,param2,param3);
      }
      
      public function setFeiongtanyunshouUse(param1:Boolean) : void
      {
         this.feilongtanyunshou.setFeiongtanyunshouUse(param1);
      }
      
      public function setFeiLongTanYunShouEnabledFunJ(param1:int) : void
      {
         this.feilongtanyunshou.lockOn(param1);
      }
      
      public function menuFeilongToolTip(param1:String) : void
      {
         this.feilongtanyunshou.menuToolTip(param1);
      }
      
      public function setFeilongJinduNum(param1:int, param2:Boolean) : void
      {
         this.feilongtanyunshou.setJinduNum(param1,param2);
      }
      
      public function setFeiLongJiHuo(param1:Boolean) : void
      {
         this.feilongtanyunshou.setJiHuo(param1);
      }
      
      public function set_JiuYinZhenJing(param1:Array) : void
      {
         this.jiuyin.set_JiuYinZhenJing(param1);
      }
      
      public function permitJiuYin(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.jiuyinzhenjingButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.jiuyin,0);
            this.jiuyinzhenjingButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.jiuyinzhenjingButton);
            this.btnArray2.push(this.jiuYinObj);
         }
         else if(!param1 && this.jiuyinzhenjingButton.hasEventListener(MouseEvent.CLICK))
         {
            this.jiuyinzhenjingButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.jiuyin);
            this.removeDisplayObject(this.jiuyinzhenjingButton);
            _loc3_ = this.btnArray2.indexOf(this.jiuYinObj);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showJiuyinzhenjing() : void
      {
         this.initCharPanel(2,"7");
      }
      
      public function setJiuyinzhenjingInitialize(param1:Array) : void
      {
         this.jiuyin.setInitialize(false,param1);
      }
      
      public function setJiuyinzhenjingBuff(param1:Skill, param2:String, param3:int) : void
      {
         this.jiuyin.setJiuyinBuff(param1,param2,param3);
      }
      
      public function setJiuyinzhenjingQiu(param1:int) : void
      {
         this.jiuyin.setJiuyinQiu(param1);
      }
      
      public function setJiuyinzhenjingEnabledFun() : void
      {
         this.jiuyin.setJiuyinzhenjingEnabledFun();
      }
      
      public function isHuanZHuang(param1:Boolean) : void
      {
         this.jiuyin.isHuanZHuang(param1);
      }
      
      public function set_YunCheng(param1:Array) : void
      {
         this.yuncheng.set_YunCheng(param1);
      }
      
      public function setYunChengZuoQi(param1:Boolean, param2:Boolean) : void
      {
         this.yuncheng.setYunChengZuoQi(param1,param2);
      }
      
      public function permitYunCheng(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.yunchengButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.yuncheng,0);
            this.yunchengButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.yunchengButton);
            this.btnArray1.push(this.objYunCheng);
         }
         else if(!param1 && this.yunchengButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.yuncheng != null && this.yuncheng.parent != null)
            {
               this.yuncheng.parent.removeChild(this.yuncheng);
            }
            this.yunchengButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.yunchengButton != null && this.yunchengButton.parent != null)
            {
               this.yunchengButton.parent.removeChild(this.yunchengButton);
            }
            _loc3_ = this.btnArray1.indexOf(this.objYunCheng);
            if(_loc3_ >= 0)
            {
               this.btnArray1.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showYunCheng() : void
      {
         this.initCharPanel(1,"5");
      }
      
      public function setYunInitializeYuncheng(param1:Array, param2:int, param3:Number) : void
      {
         this.yuncheng.setInitialize(false,param1,param2,param3);
      }
      
      public function setTime(param1:int) : void
      {
         this.yuncheng.setTime(param1);
      }
      
      public function setYunchengEnabledFun() : void
      {
         this.yuncheng.setEnabledFun();
      }
      
      public function setYunchengJihuo(param1:Boolean, param2:Array) : void
      {
         this.yuncheng.setYunchengJihuo(param1,param2);
      }
      
      public function permitXunZhang(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.wulizhiButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.wulizhi,0);
            this.wulizhiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.wulizhiButton);
            this.btnArray1.push(this.xunZhangObj);
         }
         else if(!param1 && this.wulizhiButton.hasEventListener(MouseEvent.CLICK))
         {
            this.wulizhiButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.wulizhi);
            this.removeDisplayObject(this.wulizhiButton);
            _loc3_ = this.btnArray1.indexOf(this.xunZhangObj);
            if(_loc3_ >= 0)
            {
               this.btnArray1.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showWulizhi() : void
      {
         this.initCharPanel(1,"6");
      }
      
      public function setWuliItems(param1:Array) : void
      {
         this.wulizhi.setShowItem(false,param1);
      }
      
      public function setTotalXunzhang(param1:Boolean, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : void
      {
         this.wulizhi.setTotalXunzhang(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setXunZhangZuoQi(param1:Boolean) : void
      {
         this.wulizhi.gouxuan(param1);
      }
      
      public function set_WuXingQuan(param1:Array) : void
      {
         this.wuxingquan.set_WuXingQuan(param1);
      }
      
      public function permitWuXingQuan(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.wuxingquanButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.wuxingquan,0);
            this.wuxingquanButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.wuxingquanButton);
            this.btnArray2.push(this.wuXingQuanObj);
         }
         else if(!param1 && this.wuxingquanButton.hasEventListener(MouseEvent.CLICK))
         {
            this.wuxingquanButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.wuxingquan);
            this.removeDisplayObject(this.wuxingquanButton);
            _loc3_ = this.btnArray2.indexOf(this.wuXingQuanObj);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showWuXingQuan() : void
      {
         this.initCharPanel(2,"9");
      }
      
      public function setInitializeWxq(param1:Array, param2:Skill, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean) : void
      {
         this.wuxingquan.setInitialize(param1,param2,param3,false,param4,param5,param6);
      }
      
      public function setWuXingQuanEnabledFun() : void
      {
         this.wuxingquan.setWuXingQuanEnabledFun();
      }
      
      public function setWuXingQuanJiHuo(param1:Boolean, param2:Boolean) : void
      {
         this.wuxingquan.setJiHuo(param1,param2);
      }
      
      public function permitLiuMaiShenJian(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.liumaishenjianButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.liumaishenjian,0);
            this.liumaishenjianButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.liumaishenjianButton);
            this.btnArray2.push(this.liuMaiObj);
         }
         else if(!param1 && this.liumaishenjianButton.hasEventListener(MouseEvent.CLICK))
         {
            this.liumaishenjianButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.liumaishenjian);
            this.removeDisplayObject(this.liumaishenjianButton);
            _loc3_ = this.btnArray2.indexOf(this.liuMaiObj);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showLiuMaiShenJian() : void
      {
         this.initCharPanel(2,"10");
      }
      
      public function setLiumaishenjianJianshuBtn(param1:Array) : void
      {
         this.liumaishenjian.setJianshuBtn(param1);
      }
      
      public function setLiumaishenjianSkill(param1:Array) : void
      {
         this.liumaishenjian.setSkill(param1,false);
      }
      
      public function lmsjJiHuoStatus(param1:Boolean) : void
      {
         this.liumaishenjian.setJiHuo(param1,false);
      }
      
      public function setLiumaishenjianMiaoshu(param1:String) : void
      {
         this.liumaishenjian.setMiaoshu(param1);
      }
      
      public function setLiumaishenjianShuxingNum(param1:Array, param2:Array) : void
      {
         this.liumaishenjian.setShuxingNum(param1,param2);
      }
      
      public function setLiumaishenjianDengji(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.liumaishenjian.setDengji(param1,param2,param3,param4);
      }
      
      public function loadLiumaishenjianPicture(param1:int) : void
      {
         this.liumaishenjian.loadPicture(param1);
      }
      
      public function setLiumaishenjianEnabledFun() : void
      {
         this.liumaishenjian.setLiumaishenjianEnabledFun();
      }
      
      public function permitShiBaTongRen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.shibatongrenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.shibatongren,0);
            this.shibatongrenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.shibatongrenButton);
            this.btnArray4.push(this.shiBaTongRenObj);
         }
         else if(!param1 && this.shibatongrenButton.hasEventListener(MouseEvent.CLICK))
         {
            this.shibatongrenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.shibatongren);
            this.removeDisplayObject(this.shibatongrenButton);
            _loc3_ = this.btnArray4.indexOf(this.shiBaTongRenObj);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showShiBaTongRen() : void
      {
         this.initCharPanel(4,"3");
      }
      
      public function initilizeShiBaTongRenUI(param1:ShiBaTongRenMainPanelVO) : void
      {
         this.shibatongren.initilizeUI(false,param1);
         this.shibatongren.lockOn();
      }
      
      public function showYN_LSSH(param1:Boolean) : void
      {
         this.shibatongren.showYN_LSSH(param1);
      }
      
      public function setCHK_LSSH(param1:Boolean) : void
      {
         this.shibatongren.setCHK_LSSH(param1);
      }
      
      public function setXunzhangYN_SBTRZ(param1:Array) : *
      {
         this.shibatongren.setYN(param1);
      }
      
      public function shibatongrenVisible() : Boolean
      {
         return this.shibatongren.visible;
      }
      
      public function showYNequipselect() : void
      {
         this.shibatongren.showYNequipselect(false);
      }
      
      public function showSelectJianBarSBTR() : void
      {
         this.shibatongren.showSelectJianBar();
      }
      
      public function permitZhanQi(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.zhanqiButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.zhanqi,0);
            this.zhanqiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.zhanqiButton);
            this.btnArray1.push(this.zhanQiObj);
         }
         else if(!param1 && this.zhanqiButton.hasEventListener(MouseEvent.CLICK))
         {
            this.zhanqiButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.zhanqi);
            this.removeDisplayObject(this.zhanqiButton);
            _loc3_ = this.btnArray1.indexOf(this.zhanQiObj);
            if(_loc3_ >= 0)
            {
               this.btnArray1.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showZhanQi() : void
      {
         this.initCharPanel(1,"7");
      }
      
      public function setZhanqiItems(param1:Array) : void
      {
         this.zhanqi.setShowItem(false,param1);
         this.zhanqi.setTotal(GameState.dictTargetStatus[40626]);
      }
      
      public function setTotalZhanQi(param1:Boolean) : void
      {
         this.zhanqi.setTotal(param1);
      }
      
      public function setZhanQiHuanZ(param1:Boolean) : void
      {
         this.zhanqi.ishuanz(param1);
      }
      
      public function set_WuXingZhiRen(param1:Array) : void
      {
         this.wuXingZhiRen.set_WuXingZhiRen(param1);
      }
      
      public function permitWuXingZhiRen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.wuXingZhiRenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.wuXingZhiRen,0);
            this.wuXingZhiRenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.wuXingZhiRenButton);
            this.btnArray3.push(this.wuXingZhiRenObj);
         }
         else if(!param1 && this.wuXingZhiRenButton.hasEventListener(MouseEvent.CLICK))
         {
            this.wuXingZhiRenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.wuXingZhiRenButton);
            this.removeDisplayObject(this.wuXingZhiRen);
            _loc3_ = this.btnArray3.indexOf(this.wuXingZhiRenObj);
            if(_loc3_ >= 0)
            {
               this.btnArray3.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function wuxingzhirenHZ(param1:Boolean) : void
      {
         this.wuXingZhiRen.wuxingzhirenHZ(param1);
      }
      
      public function showWuXingZhiRen() : void
      {
         this.initCharPanel(3,"4");
      }
      
      public function setYunInitializeWuXingZhiRen(param1:Array, param2:String, param3:int, param4:int, param5:Boolean) : void
      {
         this.wuXingZhiRen.setYunInitializeWuXingZhiRen(false,param1,param2,param3,param4,param5);
      }
      
      public function WuXingZhiRenShow(param1:Boolean) : void
      {
         this.wuXingZhiRen.showWuXingZhiRenApd(param1);
      }
      
      public function setWuXingZhiRenEnabledFun() : void
      {
         this.wuXingZhiRen.setWuXingZhiRenEnabledFun();
      }
      
      public function permitJinZhongZhao(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.jinzhongzhaoButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.jinzhongzhao,0);
            this.jinzhongzhaoButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.jinzhongzhaoButton);
            this.btnArray2.push(this.jinZhongZhaoObj);
         }
         else if(!param1 && this.jinzhongzhaoButton.hasEventListener(MouseEvent.CLICK))
         {
            this.jinzhongzhaoButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.jinzhongzhao);
            this.removeDisplayObject(this.jinzhongzhaoButton);
            _loc3_ = this.btnArray2.indexOf(this.jinZhongZhaoObj);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showJinZhongZhao() : void
      {
         this.initCharPanel(2,"12");
      }
      
      public function initilizeUIJZZ(param1:String, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean) : void
      {
         this.jinzhongzhao.initilizeUI(param1,param2,param3,param4,param5,param6,param7,param8);
         this.jinzhongzhao.setDingJiJiHuo(false);
      }
      
      public function setMiaoshuJZZ(param1:String) : void
      {
         this.jinzhongzhao.setMiaoshu(param1);
      }
      
      public function setHP(param1:Boolean, param2:int, param3:int) : void
      {
         this.jinzhongzhao.setBar1(param1,param2,param3);
      }
      
      public function setMP(param1:Boolean, param2:int, param3:int) : void
      {
         this.jinzhongzhao.setBar2(param1,param2,param3);
      }
      
      public function setDP(param1:Boolean, param2:int, param3:int) : void
      {
         this.jinzhongzhao.setBar3(param1,param2,param3);
      }
      
      public function setPP(param1:Boolean, param2:int, param3:int) : void
      {
         this.jinzhongzhao.setBar4(param1,param2,param3);
      }
      
      public function setLockonJZZ(param1:Boolean) : void
      {
         this.jinzhongzhao.lockOn();
      }
      
      public function setQiangHuaSta(param1:Boolean) : void
      {
         this.jinzhongzhao.setQiangHuaSta(param1);
      }
      
      public function set_CJTBS(param1:Array) : void
      {
         this.jinzhongzhao.set_CJTBS(param1);
      }
      
      public function setZhuqueTuwen(param1:Boolean) : void
      {
         this.jinzhongzhao.setZhuqueTuwen(param1);
      }
      
      public function setJinZhongZhaoJiHuo(param1:Boolean) : void
      {
         this.jinzhongzhao.setJiHuo(param1);
      }
      
      public function set_XiuWei(param1:Array) : void
      {
         this.xiuwei.set_XiuWei(param1);
      }
      
      public function permitXiuWei(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.xiuweiButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.xiuwei,0);
            this.xiuweiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.xiuweiButton);
            this.btnArray1.push(this.xiuWeiObj);
         }
         else if(!param1 && this.xiuweiButton.hasEventListener(MouseEvent.CLICK))
         {
            this.xiuweiButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.xiuwei);
            this.removeDisplayObject(this.xiuweiButton);
            _loc3_ = this.btnArray1.indexOf(this.xiuWeiObj);
            if(_loc3_ >= 0)
            {
               this.btnArray1.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showXiuWei() : void
      {
         this.initCharPanel(1,"8");
      }
      
      public function setXiuweiInitializeText(param1:String, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int, param8:Boolean, param9:Boolean) : void
      {
         this.xiuwei.setInitializeText(param1,param2,param3,param4,param5,param6,param7,0,false,param8,param9);
      }
      
      public function setXiuweiGoods(param1:Goods, param2:String, param3:int, param4:Boolean) : void
      {
         var _loc5_:Goods = null;
         _loc5_ = new Goods(param1.id);
         this.xiuwei.setGoods(_loc5_,param2,param3,param4);
      }
      
      public function setXiuweiJinduNum(param1:int, param2:int, param3:*, param4:int) : *
      {
         this.xiuwei.setJinduNum(param1,param2,param3,param4);
      }
      
      public function setXiuweiZhaoShiMsg(param1:String, param2:int, param3:int) : void
      {
         this.xiuwei.setZhaoShiMsg(param1,param2,param3);
      }
      
      public function setXiuweiEnabledFun() : void
      {
         this.xiuwei.setXiuweiEnabledFun();
      }
      
      public function setXiuweiDingJiShuXing(param1:Boolean) : void
      {
         this.xiuwei.setDingJiShuXing(param1);
      }
      
      public function setXiuWeiJiHuo(param1:Boolean) : void
      {
         this.xiuwei.setJiHuo(param1);
      }
      
      public function xiuweiHuanZhuang(param1:Boolean) : void
      {
         this.xiuwei.huanzhuang(param1);
      }
      
      public function permitZhanHun(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.zhanhunButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.zhanhun,0);
            this.zhanhunButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.zhanhunButton);
            this.btnArray1.push(this.zhanHunObj);
         }
         else if(!param1 && this.zhanhunButton.hasEventListener(MouseEvent.CLICK))
         {
            this.zhanhunButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.zhanhun);
            this.removeDisplayObject(this.zhanhunButton);
            _loc3_ = this.btnArray1.indexOf(this.zhanHunObj);
            if(_loc3_ >= 0)
            {
               this.btnArray1.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showZhanhun() : void
      {
         this.initCharPanel(1,"9");
      }
      
      public function setZhanhunItem(param1:McBaseItem, param2:int) : void
      {
         this.zhanhun.setItem(param1,param2);
      }
      
      public function setZhanhunDakong(param1:int) : void
      {
         this.zhanhun.setDakong(param1);
      }
      
      public function setZhanhunShuxingNum(param1:int, param2:Array) : void
      {
         this.zhanhun.setShuxingNum(param1,param2,false);
      }
      
      public function isZhanHunHuanZhuang(param1:Boolean) : void
      {
         this.zhanhun.isZhanHunHuanZhuang(param1);
         this.zhanhun.setJiHuo(false);
      }
      
      public function setBtnEnbale() : void
      {
         this.zhanhun.setBtnEnbale();
      }
      
      public function setShuxingVis(param1:Boolean) : void
      {
         this.zhanhun.setShuxingVis(param1);
      }
      
      public function setZhanhunBtn(param1:int) : void
      {
         this.zhanhun.setBtn(param1);
      }
      
      public function set_TaiXuanShenGong(param1:Array) : void
      {
         this.taiXuanShenGong.set_TaiXuanShenGong(param1);
      }
      
      public function permitTaiXuanShenGong(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.taiXuanShenGongButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.taiXuanShenGong,0);
            this.taiXuanShenGongButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.taiXuanShenGongButton);
            this.btnArray2.push(this.taiXuanObj);
         }
         else if(!param1 && this.taiXuanShenGongButton.hasEventListener(MouseEvent.CLICK))
         {
            this.taiXuanShenGongButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.taiXuanShenGong);
            this.removeDisplayObject(this.taiXuanShenGongButton);
            _loc3_ = this.btnArray2.indexOf(this.taiXuanObj);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showTaiXuanShenGong() : void
      {
         this.initCharPanel(2,"13");
      }
      
      public function initilizeTaiXuanShenGongUI(param1:TaiXuanShenGongVO) : void
      {
         this.taiXuanShenGong.setInitialize(false,param1);
      }
      
      public function setTaiXuanShenGongEnabledFunJ() : void
      {
         this.taiXuanShenGong.setTaiXuanShenGongEnabledFun();
      }
      
      public function showVenation(param1:Array, param2:int, param3:int, param4:Boolean = false, param5:Boolean = false) : void
      {
         this.initCharPanel(1,"3");
         this.venationContainer.setIsZhenLong(param5);
         this.venationContainer.showAll(param1,param2,param3);
         if(param4)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("角色"));
         }
      }
      
      public function setQiHaiSta(param1:Boolean, param2:Boolean = false, param3:String = "") : void
      {
         this.venationContainer.setBtnType(param1,param2,param3);
      }
      
      public function setVenationPointAttribute(param1:String, param2:String, param3:int) : void
      {
         this.venationContainer.setPointAttribute(param1,param2,param3);
      }
      
      public function setVenationAddValue(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         this.venationContainer.setAddValue(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function isZuoQi(param1:Boolean, param2:Boolean) : void
      {
         this.venationContainer.isZuoQi(param1,param2);
      }
      
      public function setVenationExpAddValue(param1:int, param2:Number) : void
      {
         this.venationContainer.setExpAddValue(param1,param2);
      }
      
      public function setIsHuti(param1:Boolean, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:Boolean, param9:Boolean, param10:int) : void
      {
         this.venationContainer.setIsHuti(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
      }
      
      public function show_1(param1:int, param2:Boolean, param3:String) : void
      {
         this.venationContainer.showYangWei(param1,param2,param3);
      }
      
      public function show_2(param1:int, param2:Boolean, param3:String) : void
      {
         this.venationContainer.showYinWei(param1,param2,param3);
      }
      
      public function show_3(param1:int, param2:Boolean, param3:String) : void
      {
         this.venationContainer.showYangQiao(param1,param2,param3);
      }
      
      public function show_4(param1:int, param2:Boolean, param3:String) : void
      {
         this.venationContainer.showYinQiao(param1,param2,param3);
      }
      
      public function show_5(param1:int, param2:Boolean, param3:String) : void
      {
         this.venationContainer.showDai(param1,param2,param3);
      }
      
      public function show_6(param1:int, param2:Boolean, param3:String) : void
      {
         this.venationContainer.showCong(param1,param2,param3);
      }
      
      public function show_7(param1:int, param2:Boolean, param3:String) : void
      {
         this.venationContainer.showRen(param1,param2,param3);
      }
      
      public function show_8(param1:int, param2:Boolean, param3:String) : void
      {
         this.venationContainer.showDu(param1,param2,param3);
      }
      
      public function setLongmaiJingyuan(param1:Boolean) : void
      {
         this.venationContainer.setLongmaiJingyuan(param1);
      }
      
      public function setZhuanshiZhenlong(param1:Boolean) : void
      {
         this.venationContainer.setZhuanshiZhenlong(param1);
      }
      
      public function set_RouShen(param1:Array) : void
      {
         this.smithingbodyContainer.set_RouShen(param1);
      }
      
      public function showSmithingBody() : void
      {
         this.initCharPanel(1,"4");
         this.smithingbodyContainer.setRouShenMenghuanJindan(false);
      }
      
      public function setJindu(param1:int) : void
      {
         this.smithingbodyContainer.setJindu(param1);
      }
      
      public function menuRoushenJinduToolTip(param1:String) : void
      {
         this.smithingbodyContainer.menuJinduToolTip(param1);
      }
      
      public function roushenzuoqi(param1:Boolean) : void
      {
         this.smithingbodyContainer.zuoqi(param1);
      }
      
      public function setJihuo(param1:Boolean) : void
      {
         this.smithingbodyContainer.setJihuo(param1);
      }
      
      public function setJihuoDajinlong(param1:Boolean) : void
      {
         this.smithingbodyContainer.setJihuoDajinlong(param1);
      }
      
      public function setIsJihuoMohua(param1:Array) : void
      {
         this.smithingbodyContainer.setIsJihuoMohua(param1);
      }
      
      public function loadLongPicture() : void
      {
         this.smithingbodyContainer.loadLongPicture();
      }
      
      public function setRoushenJinduNum(param1:int, param2:Boolean) : void
      {
         this.smithingbodyContainer.setJinduNum(param1,param2);
      }
      
      public function menuToolTip(param1:Array) : void
      {
         this.smithingbodyContainer.menuToolTip(param1);
      }
      
      public function setJingjie(param1:String) : void
      {
         this.smithingbodyContainer.setJingjie(param1);
      }
      
      public function setRouti(param1:Boolean) : void
      {
         this.smithingbodyContainer.setRouti(param1);
      }
      
      public function setMiaoshu(param1:String) : void
      {
         this.smithingbodyContainer.setMiaoshu(param1);
      }
      
      public function setBar1(param1:Boolean, param2:int, param3:int) : void
      {
         this.smithingbodyContainer.setBar1(param1,param2,param3);
      }
      
      public function setBar2(param1:Boolean, param2:int, param3:int) : void
      {
         this.smithingbodyContainer.setBar2(param1,param2,param3);
      }
      
      public function setBar3(param1:Boolean, param2:int, param3:int) : void
      {
         this.smithingbodyContainer.setBar3(param1,param2,param3);
      }
      
      public function setBar4(param1:Boolean, param2:int, param3:int) : void
      {
         this.smithingbodyContainer.setBar4(param1,param2,param3);
      }
      
      public function setBar5(param1:Boolean, param2:int, param3:int) : void
      {
         this.smithingbodyContainer.setBar5(param1,param2,param3);
      }
      
      public function setBar6(param1:Boolean, param2:int, param3:int) : void
      {
         this.smithingbodyContainer.setBar6(param1,param2,param3);
      }
      
      public function setBar7(param1:Boolean, param2:int, param3:int) : void
      {
         this.smithingbodyContainer.setBar7(param1,param2,param3);
      }
      
      public function setBar8(param1:Boolean, param2:int, param3:int) : void
      {
         this.smithingbodyContainer.setBar8(param1,param2,param3);
      }
      
      public function setBar9(param1:Boolean, param2:int, param3:int) : void
      {
         this.smithingbodyContainer.setBar9(param1,param2,param3);
      }
      
      public function setBar10(param1:Boolean, param2:int, param3:int) : void
      {
         this.smithingbodyContainer.setBar10(param1,param2,param3);
      }
      
      public function setPage(param1:int, param2:int, param3:Boolean) : void
      {
         this.smithingbodyContainer.setPage(param1,param2,param3);
      }
      
      public function setIsEnabled(param1:Boolean) : void
      {
         this.smithingbodyContainer.setIsEnabled(param1);
      }
      
      public function okBtnToolTip(param1:String) : void
      {
         this.smithingbodyContainer.okBtnToolTip(param1);
      }
      
      public function setRouShenEnabledFun() : void
      {
         this.smithingbodyContainer.setEnabledFun();
      }
      
      public function reSetRouShen() : void
      {
         this.smithingbodyContainer.reSet();
      }
      
      public function set_BeiMingShenGong(param1:Array) : void
      {
         this.beiMingShenGong.set_BeiMingShenGong(param1);
      }
      
      public function permitBeiMingShenGong(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.beiMingShenGongButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.beiMingShenGong,0);
            this.beiMingShenGongButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.beiMingShenGongButton);
            this.btnArray2.push(this.beiMingObj);
         }
         else if(!param1 && this.beiMingShenGongButton.hasEventListener(MouseEvent.CLICK))
         {
            this.beiMingShenGongButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.beiMingShenGong);
            this.removeDisplayObject(this.beiMingShenGongButton);
            _loc3_ = this.btnArray2.indexOf(this.beiMingObj);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showBeiMingShenGong() : void
      {
         this.initCharPanel(2,"14");
      }
      
      public function initializateBmsgPanel(param1:BeiMingShenGongVO) : void
      {
         this.beiMingShenGong.initializateBmsgPanel(false,param1);
      }
      
      public function setBeiMingShenGongAvatar(param1:BitmapData) : void
      {
         this.beiMingShenGong.avatar = param1;
      }
      
      public function setBeiMingShenGongEnabledFun() : void
      {
         this.beiMingShenGong.setBeiMingShenGongEnabledFun();
      }
      
      public function permitQiShangQuan(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.qiShangQuanButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.qiShangQuan,0);
            this.qiShangQuanButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.qiShangQuanButton);
            this.btnArray2.push(this.qiShangQuanObj);
         }
         else if(!param1 && this.qiShangQuanButton.hasEventListener(MouseEvent.CLICK))
         {
            this.qiShangQuanButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.qiShangQuan);
            this.removeDisplayObject(this.qiShangQuanButton);
            _loc3_ = this.btnArray2.indexOf(this.qiShangQuanObj);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showQiShangQuan() : void
      {
         this.initCharPanel(2,"15");
      }
      
      public function setQiShangQuanInitializeText(param1:String, param2:int) : void
      {
         this.qiShangQuan.setInitializeText(false,param1,param2);
      }
      
      public function setQiShangQuanFanBei(param1:int) : void
      {
         this.qiShangQuan.setFanBei(param1);
      }
      
      public function setQiShangQuanZuoQi(param1:Boolean, param2:Boolean) : void
      {
         this.qiShangQuan.setQiShangQuanZuoQi(param1,param2);
      }
      
      public function setQiShangQuanGoods(param1:Goods, param2:String, param3:int, param4:Boolean) : void
      {
         this.qiShangQuan.setGoods(param1,param2,param3,param4);
      }
      
      public function setQiShangQuanJinduNum(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean) : *
      {
         this.qiShangQuan.setJinduNum(param1,param2,param3,param4,param5);
      }
      
      public function setQiShangQuanZhaoShiMsg(param1:QiShangQuanVo, param2:String, param3:int, param4:int) : void
      {
         this.qiShangQuan.setZhaoShiMsg(param1,param2,param3,param4);
      }
      
      public function setQiShangQuanEnabledFun() : void
      {
         this.qiShangQuan.setQiShangQuanEnabledFun();
      }
      
      public function permitSiLingZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.siLingZhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.siLingZhen,0);
            this.siLingZhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.siLingZhenButton);
            this.btnArray4.push(this.siLingZhenObj);
         }
         else if(!param1 && this.siLingZhenButton.hasEventListener(MouseEvent.CLICK))
         {
            this.siLingZhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.siLingZhen);
            this.removeDisplayObject(this.siLingZhenButton);
            _loc3_ = this.btnArray4.indexOf(this.siLingZhenObj);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showSiLingZhen() : void
      {
         this.initCharPanel(4,"2");
      }
      
      public function setSiLingZhenData(param1:Array, param2:int) : void
      {
         this.siLingZhen.setData(param1,param2);
      }
      
      public function set_HDZB(param1:Array) : void
      {
         this.siLingZhen.set_HDZB(param1);
      }
      
      public function setQiankunzhu(param1:Boolean) : void
      {
         this.siLingZhen.setQiankunzhu(param1);
      }
      
      public function setSiLingZhenJiHuo(param1:Boolean) : void
      {
         this.siLingZhen.setJiHuo(param1);
      }
      
      public function setBaolongshou(param1:Boolean) : void
      {
         this.siLingZhen.setBaolongshou(param1);
      }
      
      public function setZhenyan(param1:int, param2:int, param3:int) : void
      {
         this.siLingZhen.setZhenyan(param1,param2,param3);
         this.siLingZhen.setxueshaJiHuo(false);
      }
      
      public function setSiLingZhenBuffAvatar(param1:int) : void
      {
         this.siLingZhen.setBuffAvatar(false,param1);
      }
      
      public function setSiLingZhenEnabledFun() : void
      {
         this.siLingZhen.setEnabledFun();
      }
      
      public function permitShenZhaoJing(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.shenzhaojingButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.shenzhaojing,0);
            this.shenzhaojingButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.shenzhaojingButton);
            this.btnArray2.push(this.shenzhaojingObj);
         }
         else if(!param1 && this.shenzhaojingButton.hasEventListener(MouseEvent.CLICK))
         {
            this.shenzhaojingButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.shenzhaojing);
            this.removeDisplayObject(this.shenzhaojingButton);
            _loc3_ = this.btnArray2.indexOf(this.shenzhaojingObj);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showShenzhaojing() : void
      {
         this.initCharPanel(2,"2");
      }
      
      public function ShenzhaojingInit(param1:ShenzhaojingVO) : void
      {
         var _loc2_:Array = null;
         this.shenzhaojing.setDengji(param1.szjCkCsNum + LanResManager.getLanCommonTextWords("层") + "(" + param1.szjCkDsNum + "/" + LanResManager.getLanCommonTextWords("5段") + ")");
         this.shenzhaojing.setJindu(false,param1.nowJinduNum,param1.maxJinduNum,param1.szjLwCsNum,param1.szjCkCsNum,param1.szjLwDsNum,param1.szjCkDsNum);
         _loc2_ = new Array();
         _loc2_[0] = param1.act;
         _loc2_[1] = param1.def;
         _loc2_[2] = param1.bj;
         _loc2_[3] = param1.sb;
         _loc2_[4] = param1.hp;
         _loc2_[5] = param1.mp;
         _loc2_[6] = param1.cp;
         _loc2_[7] = param1.szjText;
         _loc2_[8] = param1.szjCkCsNum;
         this.shenzhaojing.setShuxing(_loc2_,param1.renwuArr);
         this.shenzhaojing.setSkill(param1.skill,param1.skillText);
         this.shenzhaojing.setShenZhaoJingEnabledFun();
         this.shenzhaojing.huanzhuang(param1.huanzhuang,param1.isDanTian);
      }
      
      public function setStarSta(param1:int) : void
      {
         this.charContainer.setStarSta(param1);
      }
      
      public function setStatusByString(param1:String) : void
      {
         this.charContainer.setStatusByString(param1);
      }
      
      public function permitZiXiaShenGong(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.zixiashengongButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.zixiashengong,0);
            this.zixiashengongButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.zixiashengongButton);
            this.btnArray2.push(this.ziXiaObj);
         }
         else if(!param1 && this.zixiashengongButton.hasEventListener(MouseEvent.CLICK))
         {
            this.zixiashengongButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.zixiashengong);
            this.removeDisplayObject(this.zixiashengongButton);
            _loc3_ = this.btnArray2.indexOf(this.ziXiaObj);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showZixiashengong() : void
      {
         this.initCharPanel(2,"16");
      }
      
      public function setZiXiaShenGongInitialize(param1:Array, param2:int) : void
      {
         this.zixiashengong.setInitialize(false,param1,param2);
      }
      
      public function setZuoQiDaZuo(param1:Boolean, param2:Boolean) : void
      {
         this.zixiashengong.setZuoQiDaZuo(param1,param2);
      }
      
      public function setZiXiaShenGongAvatar(param1:BitmapData) : void
      {
         this.zixiashengong.avatar = param1;
      }
      
      public function setZiXiaShenGongShuxingNum(param1:Boolean, param2:Array, param3:Boolean, param4:int) : void
      {
         this.zixiashengong.setShuxingNum(param1,param2,param3,param4);
      }
      
      public function setZiXiaShenGongMc(param1:int) : void
      {
         this.zixiashengong.setMc(param1);
      }
      
      public function setZiXiaShenGongEnabledFun() : void
      {
         this.zixiashengong.setZiXiaEnabledFun();
      }
      
      public function setZiXiaCheckEnabledFun() : void
      {
         this.zixiashengong.setZiXiaCheckEnabledFun();
      }
      
      public function set_QiMenZhen(param1:Array) : void
      {
         this.qimenzhen.set_QiMenZhen(param1);
      }
      
      public function permitQiMenZhen(param1:Boolean, param2:*) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.qimenzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.qimenzhen,0);
            this.qimenzhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.qimenzhenButton);
            this.btnArray4.push(this.qiMenZhenObj);
         }
         else if(!param1 && this.qimenzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            this.qimenzhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.qimenzhen);
            this.removeDisplayObject(this.qimenzhenButton);
            _loc3_ = this.btnArray4.indexOf(this.qiMenZhenObj);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showQiMenZhen() : void
      {
         this.initCharPanel(4,"1");
      }
      
      public function setQiMenZhenInitializeText(param1:String, param2:int) : void
      {
         this.qimenzhen.setInitializeText(false,param1,param2);
      }
      
      public function setQiMenZhenFanBei(param1:int, param2:Boolean) : void
      {
         this.qimenzhen.setFanBei(param1,param2);
      }
      
      public function ShenJiangJiZuoQi(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         this.qimenzhen.setZuoQi(param1,param2,param3);
      }
      
      public function setQiMenZhenGoods(param1:Goods, param2:String, param3:int, param4:Boolean) : void
      {
         this.qimenzhen.setGoods(param1,param2,param3,param4);
      }
      
      public function setQiMenZhenJinduNum(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean) : *
      {
         this.qimenzhen.setJinduNum(param1,param2,param3,param4,param5);
      }
      
      public function setQiMenZhenZhaoShiMsg(param1:int, param2:int) : void
      {
         this.qimenzhen.setZhaoShiMsg(param1,param2);
      }
      
      public function setQiMenZhenEnabledFun() : void
      {
         this.qimenzhen.setQiShangQuanEnabledFun();
      }
      
      public function set_QMDJ(param1:Boolean) : void
      {
         var _loc2_:Skill = null;
         _loc2_ = new Skill(200141);
         _loc2_.isLearn = 1;
         this.qimenzhen.set_QMDJ(param1,_loc2_);
      }
      
      public function showHaMaGong() : void
      {
         this.initCharPanel(2,"17");
      }
      
      public function setHaMaGongInitialize(param1:HaMaGongVO) : void
      {
         this.hamagong.initilizeUI(false,param1);
      }
      
      public function showHaMaGongLingWuPanel(param1:Boolean) : void
      {
         this.hamagong.showHaMaGongLingWuPanel(param1);
      }
      
      public function setHaMaGongLingwuGoods_X(param1:Goods, param2:Boolean) : void
      {
         this.hamagong.setGoods(param1,param2);
      }
      
      public function setHaMaGongLingwuBtn_X(param1:Boolean) : void
      {
         this.hamagong.setBtn(param1);
      }
      
      public function isHaMaGongtupoCanvasShow_X() : Boolean
      {
         return this.hamagong.isHaMaGongtupoCanvasShow();
      }
      
      public function setHaMaGongLingwuInitialize_X(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:String) : void
      {
         this.hamagong.showHaMaGongLingWuPanel(true);
         this.hamagong.setInitialize(param1,param2,param3,param4,param5,param6);
         this.hamagong.setShuoming(param7);
      }
      
      public function setHaMaGongLingwuZhufuzhi_X(param1:int, param2:int, param3:int = 0) : void
      {
         this.hamagong.setZhufuzhi(param1,param2,param3);
      }
      
      public function setHaMaGongEnabledFunJ() : void
      {
         this.hamagong.lockOn();
      }
      
      public function permitHaMaGong(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.hamagongButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.hamagong,0);
            this.hamagongButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.hamagongButton);
            this.btnArray2.push(this.objHaMaGong);
         }
         else if(!param1 && this.hamagongButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.hamagong != null && this.hamagong.parent != null)
            {
               this.hamagong.parent.removeChild(this.hamagong);
            }
            this.hamagongButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.hamagongButton != null && this.hamagongButton.parent != null)
            {
               this.hamagongButton.parent.removeChild(this.hamagongButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objHaMaGong);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function permitTianFu(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.tianFuButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.tianFu,0);
            this.tianFuButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.tianFuButton);
            this.objTianFu = new Object();
            this.objTianFu.neirong = this.tianFu;
            this.objTianFu.biaoqian = this.tianFuButton;
            this.objTianFu.name = "12";
            this.objTianFu.isShow = true;
            this.objTianFu.dengji = -1;
            this.btnArray1.push(this.objTianFu);
            this.setIsShowBiaoqian(param2);
         }
         else if(!param1 && this.tianFuButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.tianFu != null && this.tianFu.parent != null)
            {
               this.tianFu.parent.removeChild(this.tianFu);
            }
            this.tianFuButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.tianFuButton != null && this.tianFuButton.parent != null)
            {
               this.tianFuButton.parent.removeChild(this.tianFuButton);
            }
            _loc3_ = this.btnArray1.indexOf(this.objTianFu);
            if(_loc3_ >= 0)
            {
               this.btnArray1.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showTianFu() : void
      {
         this.initCharPanel(1,"12");
      }
      
      public function setTianFuData(param1:Boolean, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:int, param10:Boolean, param11:Boolean) : void
      {
         this.tianFu.setData(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public function setTianFuJiHuo(param1:Boolean) : void
      {
         this.tianFu.setJiHuo(param1);
      }
      
      public function setTianFuGoods(param1:Array) : void
      {
         this.tianFu.setGoods(param1);
      }
      
      public function tianfu_huanzhuang(param1:Boolean) : void
      {
         this.tianFu.tianfu_huanzhuang(param1);
      }
      
      public function permitWuXingZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.wuXingZhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.wuXingZhen,0);
            this.wuXingZhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.wuXingZhenButton);
            this.btnArray4.push(this.wuXingZhenObj);
         }
         else if(!param1 && this.wuXingZhenButton.hasEventListener(MouseEvent.CLICK))
         {
            this.wuXingZhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.wuXingZhen);
            this.removeDisplayObject(this.wuXingZhenButton);
            _loc3_ = this.btnArray4.indexOf(this.wuXingZhenObj);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
         }
         this.setIsShowBiaoqian(param2);
      }
      
      public function showWuXingZhen() : void
      {
         this.initCharPanel(4,"4");
      }
      
      public function wuxingzhenGouXuan(param1:Boolean, param2:Boolean, param3:Boolean, param4:Boolean, param5:Boolean) : void
      {
         this.wuXingZhen.setGouXuan(param1,param2,param3,param4,param5);
      }
      
      public function setWuXingZhenInit(param1:int, param2:Array, param3:int, param4:int, param5:int, param6:int, param7:int, param8:Boolean, param9:Boolean, param10:Boolean) : void
      {
         this.wuXingZhen.setPanel(true,param1,param2,param3,param4,param5,param6,param7,param8,param9,false,param10);
      }
      
      public function setWuXingZhenEnableFun() : void
      {
         this.wuXingZhen.setEnableFun();
      }
      
      public function setWuXingZhenJiHuo(param1:Boolean) : void
      {
         this.wuXingZhen.setJiHuo(param1);
      }
      
      public function set_ZhuXunzhang(param1:Array) : void
      {
         this.wuXingZhen.set_ZhuXunzhang(param1);
      }
      
      public function set_WuXingZhen(param1:Array) : void
      {
         this.wuXingZhen.set_WuXingZhenXunZhang(param1);
      }
      
      public function set_ChiXueMoZhen(param1:Array) : void
      {
         this.chiXueMoZhen.set_ChiXueMoZhen(param1);
      }
      
      public function showChiXueMoZhen() : void
      {
         this.initCharPanel(4,"5");
      }
      
      public function setChiXueMoZhenInit(param1:int, param2:String, param3:int, param4:Array, param5:int, param6:int, param7:int, param8:int, param9:int, param10:Boolean, param11:int, param12:Boolean, param13:Boolean, param14:int, param15:Boolean, param16:Boolean, param17:Boolean, param18:Boolean) : void
      {
         this.chiXueMoZhen.initilizeUI(false,param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15,param16,param17,param18);
      }
      
      public function setChiXueMoZhenEnableFun() : void
      {
         this.chiXueMoZhen.setEnableFun();
      }
      
      public function set_XSJC(param1:int) : void
      {
         this.chiXueMoZhen.set_XSJC(param1);
      }
      
      public function setChiXueMoZhenAvatar(param1:BitmapData) : void
      {
         this.chiXueMoZhen.avatar = param1;
      }
      
      public function permitChiXueMoZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.chiXueMoZhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.chiXueMoZhen,0);
            this.chiXueMoZhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.chiXueMoZhenButton);
            this.btnArray4.push(this.objChiXueMoZhen);
         }
         else if(!param1 && this.chiXueMoZhenButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.chiXueMoZhen != null && this.chiXueMoZhen.parent != null)
            {
               this.chiXueMoZhen.parent.removeChild(this.chiXueMoZhen);
            }
            this.chiXueMoZhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.chiXueMoZhenButton != null && this.chiXueMoZhenButton.parent != null)
            {
               this.chiXueMoZhenButton.parent.removeChild(this.chiXueMoZhenButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objChiXueMoZhen);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showSanShiLiuShou() : void
      {
         this.initCharPanel(2,"18");
      }
      
      public function setSanShiLiuShouInit(param1:String, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:Boolean, param12:int, param13:Boolean) : void
      {
         this.sanShiLiuShou.setinitilizeUI(false,param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13);
      }
      
      public function setSanShiLiuShouEnableFun() : void
      {
         this.sanShiLiuShou.setEnableFun();
      }
      
      public function permitSanShiLiuShou(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.sanShiLiuShouButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.sanShiLiuShou,0);
            this.sanShiLiuShouButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.sanShiLiuShouButton);
            this.btnArray2.push(this.objSanShiLiuShou);
         }
         else if(!param1 && this.sanShiLiuShouButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.sanShiLiuShou != null && this.sanShiLiuShou.parent != null)
            {
               this.sanShiLiuShou.parent.removeChild(this.sanShiLiuShou);
            }
            this.sanShiLiuShouButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.sanShiLiuShouButton != null && this.sanShiLiuShouButton.parent != null)
            {
               this.sanShiLiuShouButton.parent.removeChild(this.sanShiLiuShouButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objSanShiLiuShou);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function set_BeiDouQiXingZhen(param1:Array) : void
      {
         this.beidouqixing.set_BeiDouQiXingZhen(param1);
      }
      
      public function showBeiDouQiXing() : void
      {
         this.initCharPanel(4,"6");
      }
      
      public function permitBeiDouQiXing(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.beidouqixingButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.beidouqixing,0);
            this.beidouqixingButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.beidouqixingButton);
            this.btnArray4.push(this.objBeiDouQiXing);
         }
         else if(!param1 && this.beidouqixingButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.beidouqixing != null && this.beidouqixing.parent != null)
            {
               this.beidouqixing.parent.removeChild(this.beidouqixing);
            }
            this.beidouqixingButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.beidouqixingButton != null && this.beidouqixingButton.parent != null)
            {
               this.beidouqixingButton.parent.removeChild(this.beidouqixingButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objBeiDouQiXing);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function initBeiDouQiXing(param1:Boolean, param2:int, param3:int, param4:Array, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean, param13:Boolean, param14:Boolean, param15:Boolean) : void
      {
         this.beidouqixing.setinitilizeUI(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15);
      }
      
      public function setBeiDouQiXingEnableFun() : void
      {
         this.beidouqixing.setEnableFun();
      }
      
      public function showJinChanTuoQiao() : void
      {
         this.initCharPanel(2,"19");
      }
      
      public function setJinChanTuoQiaoInit(param1:Boolean, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:Boolean) : void
      {
         this.jinchantuoqiao.setinitilizeUI(false,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public function setJinChanTuoQiaoEnableFun() : void
      {
         this.jinchantuoqiao.setEnableFun();
      }
      
      public function permitJinChanTuoQiao(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.jinchantuoqiaoButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.jinchantuoqiao,0);
            this.jinchantuoqiaoButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.jinchantuoqiaoButton);
            this.btnArray2.push(this.objJinChanTuoQiao);
         }
         else if(!param1 && this.jinchantuoqiaoButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.jinchantuoqiao != null && this.jinchantuoqiao.parent != null)
            {
               this.jinchantuoqiao.parent.removeChild(this.jinchantuoqiao);
            }
            this.jinchantuoqiaoButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.jinchantuoqiaoButton != null && this.jinchantuoqiaoButton.parent != null)
            {
               this.jinchantuoqiaoButton.parent.removeChild(this.jinchantuoqiaoButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objJinChanTuoQiao);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function permitXunZhangYangCheng(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.xunzhangyangchengButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.xunzhangyangcheng,0);
            this.xunzhangyangchengButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.xunzhangyangchengButton);
            this.btnArray1.push(this.xunZhangYangChengObj);
         }
         else if(!param1 && this.xunzhangyangchengButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.xunzhangyangcheng != null && this.xunzhangyangcheng.parent != null)
            {
               this.xunzhangyangcheng.parent.removeChild(this.xunzhangyangcheng);
            }
            this.xunzhangyangchengButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.xunzhangyangchengButton != null && this.xunzhangyangchengButton.parent != null)
            {
               this.xunzhangyangchengButton.parent.removeChild(this.xunzhangyangchengButton);
            }
            _loc3_ = this.btnArray1.indexOf(this.xunZhangYangChengObj);
            if(_loc3_ >= 0)
            {
               this.btnArray1.splice(_loc3_,1);
            }
         }
         this.setIsShowBiaoqian(param2);
      }
      
      public function showXunZhangYangCheng() : void
      {
         this.initCharPanel(1,"13");
      }
      
      public function setXunZhang(param1:Array) : void
      {
         this.xunzhangyangcheng.setXunZhang(param1);
      }
      
      public function setBtn() : void
      {
         this.xunzhangyangcheng.setBtn();
      }
      
      public function set_JiuQuHuangHeZhen(param1:Array) : void
      {
         this.jiuquhuanghezhen.set_JiuQuHuangHeZhen(param1);
      }
      
      public function showJiuQuHuangHeZhen() : void
      {
         this.initCharPanel(4,"7");
      }
      
      public function setJiuQuHuangHeZhenInitialize(param1:JiuQuHuangHeZhenVO) : void
      {
         this.jiuquhuanghezhen.setInitialize(false,param1);
      }
      
      public function setJiuquJiHuo(param1:Boolean) : void
      {
         this.jiuquhuanghezhen.setJiuquJiHuo(param1);
      }
      
      public function setJiuQuHuangHeZhenEnableFun() : void
      {
         this.jiuquhuanghezhen.setJiuQuHuangHeZhenEnabledFun();
      }
      
      public function permitJiuQuHuangHeZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.jiuquhuanghezhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.jiuquhuanghezhen,0);
            this.jiuquhuanghezhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.jiuquhuanghezhenButton);
            this.btnArray4.push(this.objJiuQuHuangHeZhen);
         }
         else if(!param1 && this.jiuquhuanghezhenButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.jiuquhuanghezhen != null && this.jiuquhuanghezhen.parent != null)
            {
               this.jiuquhuanghezhen.parent.removeChild(this.jiuquhuanghezhen);
            }
            this.jiuquhuanghezhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.jiuquhuanghezhenButton != null && this.jiuquhuanghezhenButton.parent != null)
            {
               this.jiuquhuanghezhenButton.parent.removeChild(this.jiuquhuanghezhenButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objJiuQuHuangHeZhen);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function set_ZhenWuQiJieZhen(param1:Array) : void
      {
         this.zhenwuqijiezhen.set_ZhenWuQiJieZhen(param1);
      }
      
      public function showZhenWuQiJieZhen() : void
      {
         this.initCharPanel(4,"8");
      }
      
      public function setZhenWuQiJieZhenInitialize(param1:ZhenWuQiJieZhenVO) : void
      {
         this.zhenwuqijiezhen.setInitialize(false,param1);
      }
      
      public function setZhenWuQiJieZhenEnableFun() : void
      {
         this.zhenwuqijiezhen.setEnableFun();
      }
      
      public function permitZhenWuQiJieZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.zhenwuqijiezhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.zhenwuqijiezhen,0);
            this.zhenwuqijiezhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.zhenwuqijiezhenButton);
            this.btnArray4.push(this.objZhenWuQiJieZhen);
         }
         else if(!param1 && this.zhenwuqijiezhenButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.zhenwuqijiezhen != null && this.zhenwuqijiezhen.parent != null)
            {
               this.zhenwuqijiezhen.parent.removeChild(this.zhenwuqijiezhen);
            }
            this.zhenwuqijiezhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.zhenwuqijiezhenButton != null && this.zhenwuqijiezhenButton.parent != null)
            {
               this.zhenwuqijiezhenButton.parent.removeChild(this.zhenwuqijiezhenButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objZhenWuQiJieZhen);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showDouZhuanXingYi() : void
      {
         this.initCharPanel(2,"20");
      }
      
      public function setDouZhuanXingYiInit(param1:DouZhuanXingYiVO) : void
      {
         this.douzhuanxingyi.setInitialize(false,param1);
      }
      
      public function setDouZhuanXingYiEnableFun() : void
      {
         this.douzhuanxingyi.setEnableFun();
      }
      
      public function setDouzhuangxingyiZhuangbei(param1:Array) : void
      {
         this.douzhuanxingyi.setDouzhuangxingyiZhuangbei(param1);
      }
      
      public function permitDouZhuanXingYi(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.douzhuanxingyiButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.douzhuanxingyi,0);
            this.douzhuanxingyiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.douzhuanxingyiButton);
            this.objDouZhuanXingYi = new Object();
            this.objDouZhuanXingYi.neirong = this.douzhuanxingyi;
            this.objDouZhuanXingYi.biaoqian = this.douzhuanxingyiButton;
            this.objDouZhuanXingYi.name = "20";
            this.objDouZhuanXingYi.isShow = true;
            this.objDouZhuanXingYi.dengji = -1;
            this.btnArray2.push(this.objDouZhuanXingYi);
         }
         else if(!param1 && this.douzhuanxingyiButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.douzhuanxingyi != null && this.douzhuanxingyi.parent != null)
            {
               this.douzhuanxingyi.parent.removeChild(this.douzhuanxingyi);
            }
            this.douzhuanxingyiButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.douzhuanxingyiButton != null && this.douzhuanxingyiButton.parent != null)
            {
               this.douzhuanxingyiButton.parent.removeChild(this.douzhuanxingyiButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objDouZhuanXingYi);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function set_GuiLiuZhen(param1:Array) : void
      {
         this.guiliuzhen.set_GuiLiuZhen(param1);
      }
      
      public function showGuiLiuZhen() : void
      {
         this.initCharPanel(4,"9");
      }
      
      public function setGuiLiuZhenInitialize(param1:GuiLiuZhenVO) : void
      {
         this.guiliuzhen.setInitialize(false,param1);
      }
      
      public function setGuiLiuZhenEnableFun() : void
      {
         this.guiliuzhen.setEnableFun();
      }
      
      public function permitGuiLiuZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.guiliuzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.guiliuzhen,0);
            this.guiliuzhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.guiliuzhenButton);
            this.objGuiLiuZhen = new Object();
            this.objGuiLiuZhen.neirong = this.guiliuzhen;
            this.objGuiLiuZhen.biaoqian = this.guiliuzhenButton;
            this.objGuiLiuZhen.name = "9";
            this.objGuiLiuZhen.isShow = true;
            this.objGuiLiuZhen.dengji = -1;
            this.btnArray4.push(this.objGuiLiuZhen);
         }
         else if(!param1 && this.guiliuzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.guiliuzhen != null && this.guiliuzhen.parent != null)
            {
               this.guiliuzhen.parent.removeChild(this.guiliuzhen);
            }
            this.guiliuzhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.guiliuzhenButton != null && this.guiliuzhenButton.parent != null)
            {
               this.guiliuzhenButton.parent.removeChild(this.guiliuzhenButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objGuiLiuZhen);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function set_JinGangFuMoQuan(param1:Array) : void
      {
         this.jingangfumoquan.set_JinGangFuMoQuan(param1);
      }
      
      public function set_JinGangFuMoQuan1(param1:Array) : void
      {
         this.jingangfumoquan.set_JinGangFuMoQuan1(param1);
      }
      
      public function showJinGangFuMoQuan() : void
      {
         this.initCharPanel(4,"10");
      }
      
      public function setJinGangFuMoQuanInitialize(param1:JingangfumoquanVo) : void
      {
         this.jingangfumoquan.setInitialize(false,param1);
      }
      
      public function setJinGangFuMoQuanEnableFun() : void
      {
         this.jingangfumoquan.setEnableFun();
      }
      
      public function permitJinGangFuMoQuan(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.jingangfumoquanButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.jingangfumoquan,0);
            this.jingangfumoquanButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.jingangfumoquanButton);
            this.objJinGangFuMoQuan = new Object();
            this.objJinGangFuMoQuan.neirong = this.jingangfumoquan;
            this.objJinGangFuMoQuan.biaoqian = this.jingangfumoquanButton;
            this.objJinGangFuMoQuan.name = "10";
            this.objJinGangFuMoQuan.isShow = true;
            this.objJinGangFuMoQuan.dengji = -1;
            this.btnArray4.push(this.objJinGangFuMoQuan);
         }
         else if(!param1 && this.jingangfumoquanButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.jingangfumoquan != null && this.jingangfumoquan.parent != null)
            {
               this.jingangfumoquan.parent.removeChild(this.jingangfumoquan);
            }
            this.jingangfumoquanButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.jingangfumoquanButton != null && this.jingangfumoquanButton.parent != null)
            {
               this.jingangfumoquanButton.parent.removeChild(this.jingangfumoquanButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objJinGangFuMoQuan);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function setJinGangFuMoQuanAvatar(param1:BitmapData) : void
      {
         this.jingangfumoquan.avatar = param1;
      }
      
      public function set_QinLongGong(param1:Array) : void
      {
         this.qinlonggong.set_QinLongGong(param1);
      }
      
      public function showQinLongGong() : void
      {
         this.initCharPanel(2,"21");
      }
      
      public function setQinLongGongInit(param1:QinLongGongVo) : void
      {
         this.qinlonggong.setinitilizeUI(false,param1);
      }
      
      public function qinLongGongJiHuo(param1:Boolean) : void
      {
         this.qinlonggong.setJiHuo(param1);
      }
      
      public function setQinLongGongEnableFun() : void
      {
         this.qinlonggong.setEnableFun();
      }
      
      public function permitQinLongGong(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.qinlonggongButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.qinlonggong,0);
            this.qinlonggongButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.qinlonggongButton);
            this.objQinLongGong = new Object();
            this.objQinLongGong.neirong = this.qinlonggong;
            this.objQinLongGong.biaoqian = this.qinlonggongButton;
            this.objQinLongGong.name = "21";
            this.objQinLongGong.isShow = true;
            this.objQinLongGong.dengji = -1;
            this.btnArray2.push(this.objQinLongGong);
         }
         else if(!param1 && this.qinlonggongButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.qinlonggong != null && this.qinlonggong.parent != null)
            {
               this.qinlonggong.parent.removeChild(this.qinlonggong);
            }
            this.qinlonggongButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.qinlonggongButton != null && this.qinlonggongButton.parent != null)
            {
               this.qinlonggongButton.parent.removeChild(this.qinlonggongButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objQinLongGong);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function permitChiBang(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.chibangButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.chibang,0);
            this.chibangButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.chibangButton);
            this.objChiBang = new Object();
            this.objChiBang.neirong = this.chibang;
            this.objChiBang.biaoqian = this.chibangButton;
            this.objChiBang.name = "5";
            this.objChiBang.isShow = true;
            this.objChiBang.dengji = -1;
            this.btnArray3.push(this.objChiBang);
         }
         else if(!param1 && this.chibangButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.chibang != null && this.chibang.parent != null)
            {
               this.chibang.parent.removeChild(this.chibang);
            }
            this.chibangButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.chibangButton != null && this.chibangButton.parent != null)
            {
               this.chibangButton.parent.removeChild(this.chibangButton);
            }
            _loc3_ = this.btnArray3.indexOf(this.objChiBang);
            if(_loc3_ >= 0)
            {
               this.btnArray3.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function permitTengtianyi(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.tengtianyiButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.tengtianyi,0);
            this.tengtianyiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.tengtianyiButton);
            this.objTengtianyi = new Object();
            this.objTengtianyi.neirong = this.tengtianyi;
            this.objTengtianyi.biaoqian = this.tengtianyiButton;
            this.objTengtianyi.name = "19";
            this.objTengtianyi.isShow = true;
            this.objTengtianyi.dengji = -1;
            this.btnArray3.push(this.objTengtianyi);
         }
         else if(!param1 && this.tengtianyiButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.tengtianyi != null && this.tengtianyi.parent != null)
            {
               this.tengtianyi.parent.removeChild(this.tengtianyi);
            }
            this.tengtianyiButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.tengtianyiButton != null && this.tengtianyiButton.parent != null)
            {
               this.tengtianyiButton.parent.removeChild(this.tengtianyiButton);
            }
            _loc3_ = this.btnArray3.indexOf(this.objTengtianyi);
            if(_loc3_ >= 0)
            {
               this.btnArray3.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showChiBang() : void
      {
         this.initCharPanel(3,"5");
      }
      
      public function showTengtianyi() : void
      {
         this.initCharPanel(3,"19");
      }
      
      public function setYunInitializeChiBang(param1:ChiBangVo) : void
      {
         this.chibang.setInitialize(param1,false);
      }
      
      public function setYunInitializeTengtianyi(param1:TengtianyiVo) : void
      {
         this.tengtianyi.setInitialize(param1,false);
      }
      
      public function ChiBangShow(param1:int) : void
      {
         this.chibang.showChiBang(param1);
      }
      
      public function TengtianyiShow(param1:int) : void
      {
         this.tengtianyi.showTengtianyi(param1);
      }
      
      public function setChiBangEnabledFun() : void
      {
         this.chibang.setEnableFun();
      }
      
      public function setChiBangJiHuo(param1:Boolean) : void
      {
         this.chibang.setJiHuo(param1);
      }
      
      public function setTengtianyiEnabledFun() : void
      {
         this.tengtianyi.setEnableFun();
      }
      
      public function setTengtianyiJiHuo(param1:Boolean) : void
      {
         this.tengtianyi.setJiHuo(param1);
      }
      
      public function showXiaoYaoYuFeng() : void
      {
         this.initCharPanel(2,"22");
      }
      
      public function setXiaoYaoYuFengInit(param1:XiaoYaoYuFengVO) : void
      {
         this.xiaoyaoyufeng.setInitialize(false,param1);
      }
      
      public function setXiaoYaoYuFengEnableFun() : void
      {
         this.xiaoyaoyufeng.setEnableFun();
      }
      
      public function permitXiaoYaoYuFeng(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.xiaoyaoyufengButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.xiaoyaoyufeng,0);
            this.xiaoyaoyufengButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.xiaoyaoyufengButton);
            this.objXiaoYaoYuFeng = new Object();
            this.objXiaoYaoYuFeng.neirong = this.xiaoyaoyufeng;
            this.objXiaoYaoYuFeng.biaoqian = this.xiaoyaoyufengButton;
            this.objXiaoYaoYuFeng.name = "22";
            this.objXiaoYaoYuFeng.isShow = true;
            this.objXiaoYaoYuFeng.dengji = -1;
            this.btnArray2.push(this.objXiaoYaoYuFeng);
         }
         else if(!param1 && this.xiaoyaoyufengButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.xiaoyaoyufeng != null && this.xiaoyaoyufeng.parent != null)
            {
               this.xiaoyaoyufeng.parent.removeChild(this.xiaoyaoyufeng);
            }
            this.xiaoyaoyufengButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.xiaoyaoyufengButton != null && this.xiaoyaoyufengButton.parent != null)
            {
               this.xiaoyaoyufengButton.parent.removeChild(this.xiaoyaoyufengButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objXiaoYaoYuFeng);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function permitHuangdao(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.ynHuangdaoButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.ynHuangdao,0);
            this.ynHuangdaoButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.ynHuangdaoButton);
            this.btnArray1.push(this.ynHuangdaoObj);
            this.initCharPanel(1,"14");
         }
         else if(!param1 && this.ynHuangdaoButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.ynHuangdao != null && this.ynHuangdao.parent != null)
            {
               this.ynHuangdao.parent.removeChild(this.ynHuangdao);
            }
            this.ynHuangdaoButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.ynHuangdaoButton != null && this.ynHuangdaoButton.parent != null)
            {
               this.ynHuangdaoButton.parent.removeChild(this.ynHuangdaoButton);
            }
            _loc3_ = this.btnArray1.indexOf(this.ynHuangdaoObj);
            if(_loc3_ >= 0)
            {
               this.btnArray1.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showHuangdao() : void
      {
         this.initCharPanel(1,"14");
      }
      
      public function permitZhuanpan(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.ynZhuanpanButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.ynZhuanpan,0);
            this.ynZhuanpanButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.ynZhuanpanButton);
            this.btnArray1.push(this.ynZhuanpanObj);
            this.initCharPanel(1,"15");
         }
         else if(!param1 && this.ynZhuanpanButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.ynZhuanpan != null && this.ynZhuanpan.parent != null)
            {
               this.ynZhuanpan.parent.removeChild(this.ynZhuanpan);
            }
            this.ynZhuanpanButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.ynZhuanpanButton != null && this.ynZhuanpanButton.parent != null)
            {
               this.ynZhuanpanButton.parent.removeChild(this.ynZhuanpanButton);
            }
            _loc3_ = this.btnArray1.indexOf(this.ynZhuanpanObj);
            if(_loc3_ >= 0)
            {
               this.btnArray1.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showZhuanpan() : void
      {
         this.initCharPanel(1,"15");
      }
      
      public function permitWZZB(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.ynWZZButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.ynWZZB,0);
            this.ynWZZButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.ynWZZButton);
            this.btnArray1.push(this.ynWZZBObj);
            this.initCharPanel(1,"19");
         }
         else if(!param1 && this.ynWZZButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.ynWZZB != null && this.ynWZZB.parent != null)
            {
               this.ynWZZB.parent.removeChild(this.ynWZZB);
            }
            this.ynWZZButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.ynWZZButton != null && this.ynWZZButton.parent != null)
            {
               this.ynWZZButton.parent.removeChild(this.ynWZZButton);
            }
            _loc3_ = this.btnArray1.indexOf(this.ynWZZBObj);
            if(_loc3_ >= 0)
            {
               this.btnArray1.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showWZZB() : void
      {
         this.initCharPanel(1,"19");
      }
      
      public function permitFSZB(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.ynFSZButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.ynFSZB,0);
            this.ynFSZButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.ynFSZButton);
            this.btnArray1.push(this.ynFSZBObj);
            this.initCharPanel(5,"6");
         }
         else if(!param1 && this.ynFSZButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.ynFSZB != null && this.ynFSZB.parent != null)
            {
               this.ynFSZB.parent.removeChild(this.ynFSZB);
            }
            this.ynFSZButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.ynFSZButton != null && this.ynFSZButton.parent != null)
            {
               this.ynFSZButton.parent.removeChild(this.ynFSZButton);
            }
            _loc3_ = this.btnArray5.indexOf(this.ynFSZBObj);
            if(_loc3_ >= 0)
            {
               this.btnArray5.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showFSZB() : void
      {
         this.initCharPanel(5,"6");
      }
      
      public function set_LianQi(param1:Array) : void
      {
         this.lianqi.set_LianQi(param1);
      }
      
      public function permitLianQi(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.lianqiButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.lianqi,0);
            this.lianqiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.lianqiButton);
            this.objLianQi = new Object();
            this.objLianQi.neirong = this.lianqi;
            this.objLianQi.biaoqian = this.lianqiButton;
            this.objLianQi.name = "17";
            this.objLianQi.isShow = true;
            this.objLianQi.dengji = -1;
            this.btnArray1.push(this.objLianQi);
         }
         else if(!param1 && this.lianqiButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.lianqi != null && this.lianqi.parent != null)
            {
               this.lianqi.parent.removeChild(this.lianqi);
            }
            this.lianqiButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.lianqiButton != null && this.lianqiButton.parent != null)
            {
               this.lianqiButton.parent.removeChild(this.lianqiButton);
            }
            _loc3_ = this.btnArray1.indexOf(this.objLianQi);
            if(_loc3_ >= 0)
            {
               this.btnArray1.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showLianQi() : void
      {
         this.initCharPanel(1,"17");
      }
      
      public function setLianQiInitialize(param1:LianQiVO) : void
      {
         this.lianqi.setInitialize(param1,false);
      }
      
      public function setLianQiAvatar(param1:BitmapData) : void
      {
         this.lianqi.avatar = param1;
      }
      
      public function setLianQiEnabledFun() : void
      {
         this.lianqi.setEnableFun();
      }
      
      public function setFanbeiJiHuo(param1:Boolean) : void
      {
         this.lianqi.setFanbeiJiHuo(param1);
      }
      
      public function setDingjiJiHuo(param1:Boolean) : void
      {
         this.lianqi.setDingjiJiHuo(param1);
      }
      
      public function showTianMenZhen() : void
      {
         this.initCharPanel(4,"11");
      }
      
      public function setTianMenZhenInitialize(param1:TianMenZhenVO) : void
      {
         this.tianmenzhen.setInitialize(false,param1);
      }
      
      public function setTianMenZhenEnableFun() : void
      {
         this.tianmenzhen.setEnableFun();
      }
      
      public function setTianMenZhenPingBi(param1:Boolean) : void
      {
         this.tianmenzhen.setXianShi(param1);
      }
      
      public function permitTianMenZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.tianmenzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.tianmenzhen,0);
            this.tianmenzhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.tianmenzhenButton);
            this.objTianMenZhen = new Object();
            this.objTianMenZhen.neirong = this.tianmenzhen;
            this.objTianMenZhen.biaoqian = this.tianmenzhenButton;
            this.objTianMenZhen.name = "11";
            this.objTianMenZhen.isShow = true;
            this.objTianMenZhen.dengji = -1;
            this.btnArray4.push(this.objTianMenZhen);
         }
         else if(!param1 && this.tianmenzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.tianmenzhen != null && this.tianmenzhen.parent != null)
            {
               this.tianmenzhen.parent.removeChild(this.tianmenzhen);
            }
            this.tianmenzhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.tianmenzhenButton != null && this.tianmenzhenButton.parent != null)
            {
               this.tianmenzhenButton.parent.removeChild(this.tianmenzhenButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objTianMenZhen);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function set_TianMenZhen(param1:Array) : void
      {
         this.tianmenzhen.set_TianMenZhen(param1);
      }
      
      public function set_BiHaiChaoShengQu(param1:Array) : void
      {
         this.bihaichaoshengqu.set_BiHaiChaoShengQu(param1);
      }
      
      public function showBiHaiChaoShengQu() : void
      {
         this.initCharPanel(2,"23");
      }
      
      public function setBiHaiChaoShengQuInit(param1:BiHaiChaoShengQuVo) : void
      {
         this.bihaichaoshengqu.setinitilizeUI(false,param1);
      }
      
      public function setBiHaiChaoShengQuEnableFun() : void
      {
         this.bihaichaoshengqu.setEnableFun();
      }
      
      public function permitBiHaiChaoShengQu(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.bihaichaoshengquButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.bihaichaoshengqu,0);
            this.bihaichaoshengquButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.bihaichaoshengquButton);
            this.objBiHaiChaoShengQu = new Object();
            this.objBiHaiChaoShengQu.neirong = this.bihaichaoshengqu;
            this.objBiHaiChaoShengQu.biaoqian = this.bihaichaoshengquButton;
            this.objBiHaiChaoShengQu.name = "23";
            this.objBiHaiChaoShengQu.isShow = true;
            this.objBiHaiChaoShengQu.dengji = -1;
            this.btnArray2.push(this.objBiHaiChaoShengQu);
         }
         else if(!param1 && this.bihaichaoshengquButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.bihaichaoshengqu != null && this.bihaichaoshengqu.parent != null)
            {
               this.bihaichaoshengqu.parent.removeChild(this.bihaichaoshengqu);
            }
            this.bihaichaoshengquButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.bihaichaoshengquButton != null && this.bihaichaoshengquButton.parent != null)
            {
               this.bihaichaoshengquButton.parent.removeChild(this.bihaichaoshengquButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objBiHaiChaoShengQu);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function set_HeYiZhen(param1:Array) : void
      {
         this.heyizhen.set_HeYiZhen(param1);
      }
      
      public function showHeYiZhen() : void
      {
         this.initCharPanel(4,"12");
      }
      
      public function setHeYiZhenInitialize(param1:HeYiZhenVO) : void
      {
         this.heyizhen.setInitialize(false,param1);
      }
      
      public function setHeYiZhenEnableFun() : void
      {
         this.heyizhen.setEnableFun();
      }
      
      public function setHeYiZhenPingBi(param1:Boolean) : void
      {
         this.heyizhen.setXianShi(param1);
      }
      
      public function setHeYiJiHuo(param1:Boolean) : void
      {
         this.heyizhen.setJiHuo(param1);
      }
      
      public function permitHeYiZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.heyizhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.heyizhen,0);
            this.heyizhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.heyizhenButton);
            this.objHeYiZhen = new Object();
            this.objHeYiZhen.neirong = this.heyizhen;
            this.objHeYiZhen.biaoqian = this.heyizhenButton;
            this.objHeYiZhen.name = "12";
            this.objHeYiZhen.isShow = true;
            this.objHeYiZhen.dengji = -1;
            this.btnArray4.push(this.objHeYiZhen);
         }
         else if(!param1 && this.heyizhenButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.heyizhen != null && this.heyizhen.parent != null)
            {
               this.heyizhen.parent.removeChild(this.heyizhen);
            }
            this.heyizhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.heyizhenButton != null && this.heyizhenButton.parent != null)
            {
               this.heyizhenButton.parent.removeChild(this.heyizhenButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objHeYiZhen);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showYuLiZhen() : void
      {
         this.initCharPanel(4,"13");
      }
      
      public function setYuLiZhenInitialize(param1:YuLiZhenVO) : void
      {
         this.yulizhen.setInitialize(false,param1);
      }
      
      public function setYuLiZhenEnableFun() : void
      {
         this.yulizhen.setEnableFun();
      }
      
      public function setYuLiZhenPingBi(param1:Boolean) : void
      {
         this.yulizhen.setXianShi(param1);
      }
      
      public function setYuLiJiHuo(param1:Boolean) : void
      {
         this.yulizhen.setJiHuo(param1);
      }
      
      public function permitYuLiZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.yulizhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.yulizhen,0);
            this.yulizhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.yulizhenButton);
            this.objYuLiZhen = new Object();
            this.objYuLiZhen.neirong = this.yulizhen;
            this.objYuLiZhen.biaoqian = this.yulizhenButton;
            this.objYuLiZhen.name = "13";
            this.objYuLiZhen.isShow = true;
            this.objYuLiZhen.dengji = -1;
            this.btnArray4.push(this.objYuLiZhen);
         }
         else if(!param1 && this.yulizhenButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.yulizhen != null && this.yulizhen.parent != null)
            {
               this.yulizhen.parent.removeChild(this.yulizhen);
            }
            this.yulizhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.yulizhenButton != null && this.yulizhenButton.parent != null)
            {
               this.yulizhenButton.parent.removeChild(this.yulizhenButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objYuLiZhen);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showYuXiaoJianFa() : void
      {
         this.initCharPanel(2,"24");
      }
      
      public function setYuXiaoJianFaInit(param1:YuXiaoJianFaVo) : void
      {
         this.yuxiaojianfa.setinitilizeUI(param1,false);
      }
      
      public function setYuXiaoJianFaEnableFun() : void
      {
         this.yuxiaojianfa.setEnableFun();
      }
      
      public function permitYuXiaoJianFa(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.yuxiaojianfaButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.yuxiaojianfa,0);
            this.yuxiaojianfaButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.yuxiaojianfaButton);
            this.objYuXiaoJianFa = new Object();
            this.objYuXiaoJianFa.neirong = this.yuxiaojianfa;
            this.objYuXiaoJianFa.biaoqian = this.yuxiaojianfaButton;
            this.objYuXiaoJianFa.name = "24";
            this.objYuXiaoJianFa.isShow = true;
            this.objYuXiaoJianFa.dengji = -1;
            this.btnArray2.push(this.objYuXiaoJianFa);
         }
         else if(!param1 && this.yuxiaojianfaButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.yuxiaojianfa != null && this.yuxiaojianfa.parent != null)
            {
               this.yuxiaojianfa.parent.removeChild(this.yuxiaojianfa);
            }
            this.yuxiaojianfaButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.yuxiaojianfaButton != null && this.yuxiaojianfaButton.parent != null)
            {
               this.yuxiaojianfaButton.parent.removeChild(this.yuxiaojianfaButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objYuXiaoJianFa);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function set_YanYueZhen(param1:Array) : void
      {
         this.yanyuezhen.set_YanYueZhen(param1);
      }
      
      public function showYanYueZhen() : void
      {
         this.initCharPanel(4,"14");
      }
      
      public function setYanYueZhenInitialize(param1:YanYueZhenVO) : void
      {
         this.yanyuezhen.setInitialize(false,param1);
      }
      
      public function setYanYueZhenEnableFun() : void
      {
         this.yanyuezhen.setEnableFun();
      }
      
      public function setYanYueZhenPingBi(param1:Boolean) : void
      {
         this.yanyuezhen.setXianShi(param1);
      }
      
      public function setYanYueJiHuo(param1:Boolean) : void
      {
         this.yanyuezhen.setJiHuo(param1);
      }
      
      public function permitYanYueZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.yanyuezhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.yanyuezhen,0);
            this.yanyuezhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.yanyuezhenButton);
            this.objYanYueZhen = new Object();
            this.objYanYueZhen.neirong = this.yanyuezhen;
            this.objYanYueZhen.biaoqian = this.yanyuezhenButton;
            this.objYanYueZhen.name = "14";
            this.objYanYueZhen.isShow = true;
            this.objYanYueZhen.dengji = -1;
            this.btnArray4.push(this.objYanYueZhen);
         }
         else if(!param1 && this.yanyuezhenButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.yanyuezhen != null && this.yanyuezhen.parent != null)
            {
               this.yanyuezhen.parent.removeChild(this.yanyuezhen);
            }
            this.yanyuezhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.yanyuezhenButton != null && this.yanyuezhenButton.parent != null)
            {
               this.yanyuezhenButton.parent.removeChild(this.yanyuezhenButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objYanYueZhen);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function set_ChangSheZhen(param1:Array) : void
      {
         this.changshezhen.set_ChangSheZhen(param1);
      }
      
      public function showChangSheZhen() : void
      {
         this.initCharPanel(4,"15");
      }
      
      public function setChangSheZhenInitialize(param1:ChangSheZhenVO) : void
      {
         this.changshezhen.setInitialize(false,param1);
      }
      
      public function setChangSheZhenEnableFun() : void
      {
         this.changshezhen.setEnableFun();
      }
      
      public function setChangSheZhenPingBi(param1:Boolean) : void
      {
         this.changshezhen.setXianShi(param1);
      }
      
      public function setChangSheJiHuo(param1:Boolean) : void
      {
         this.changshezhen.setJiHuo(param1);
      }
      
      public function permitChangSheZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.changshezhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.changshezhen,0);
            this.changshezhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.changshezhenButton);
            this.objChangSheZhen = new Object();
            this.objChangSheZhen.neirong = this.changshezhen;
            this.objChangSheZhen.biaoqian = this.changshezhenButton;
            this.objChangSheZhen.name = "15";
            this.objChangSheZhen.isShow = true;
            this.objChangSheZhen.dengji = -1;
            this.btnArray4.push(this.objChangSheZhen);
         }
         else if(!param1 && this.changshezhenButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.changshezhen != null && this.changshezhen.parent != null)
            {
               this.changshezhen.parent.removeChild(this.changshezhen);
            }
            this.changshezhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.changshezhenButton != null && this.changshezhenButton.parent != null)
            {
               this.changshezhenButton.parent.removeChild(this.changshezhenButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objChangSheZhen);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function permitTianFuZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this._tianFuZhenBtn.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this._tianFuZhenPanel,0);
            this._tianFuZhenBtn.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this._tianFuZhenBtn);
            this.objTianFuZhen = new Object();
            this.objTianFuZhen.neirong = this._tianFuZhenPanel;
            this.objTianFuZhen.biaoqian = this._tianFuZhenBtn;
            this.objTianFuZhen.name = "21";
            this.objTianFuZhen.isShow = true;
            this.objTianFuZhen.dengji = -1;
            this.btnArray4.push(this.objTianFuZhen);
         }
         else if(!param1 && this._tianFuZhenBtn.hasEventListener(MouseEvent.CLICK))
         {
            if(this._tianFuZhenPanel != null && this._tianFuZhenPanel.parent != null)
            {
               this._tianFuZhenPanel.parent.removeChild(this._tianFuZhenPanel);
            }
            this._tianFuZhenBtn.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this._tianFuZhenBtn != null && this._tianFuZhenBtn.parent != null)
            {
               this._tianFuZhenBtn.parent.removeChild(this._tianFuZhenBtn);
            }
            _loc3_ = this.btnArray4.indexOf(this.objTianFuZhen);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function permitNiaoXiangZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this._niaoXiangZhenBtn.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this._niaoXiangZhenPanel,0);
            this._niaoXiangZhenBtn.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this._niaoXiangZhenBtn);
            this.niaoXiangZhenObj = new Object();
            this.niaoXiangZhenObj.neirong = this._niaoXiangZhenPanel;
            this.niaoXiangZhenObj.biaoqian = this._niaoXiangZhenBtn;
            this.niaoXiangZhenObj.name = "22";
            this.niaoXiangZhenObj.isShow = true;
            this.niaoXiangZhenObj.dengji = -1;
            this.btnArray4.push(this.niaoXiangZhenObj);
         }
         else if(!param1 && this._niaoXiangZhenBtn.hasEventListener(MouseEvent.CLICK))
         {
            if(this._niaoXiangZhenPanel != null && this._niaoXiangZhenPanel.parent != null)
            {
               this._niaoXiangZhenPanel.parent.removeChild(this._niaoXiangZhenPanel);
            }
            this._niaoXiangZhenBtn.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this._niaoXiangZhenBtn != null && this._niaoXiangZhenBtn.parent != null)
            {
               this._niaoXiangZhenBtn.parent.removeChild(this._niaoXiangZhenBtn);
            }
            _loc3_ = this.btnArray4.indexOf(this.niaoXiangZhenObj);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function set_CanHeZhi(param1:Array) : void
      {
         this.canhezhi.set_CanHeZhi(param1);
      }
      
      public function showCanHeZhi() : void
      {
         this.initCharPanel(2,"25");
      }
      
      public function setCanHeZhiInit(param1:CanHeZhiVo) : void
      {
         this.canhezhi.setinitilizeUI(false,param1);
      }
      
      public function setCanHeZhiEnableFun() : void
      {
         this.canhezhi.setEnableFun();
      }
      
      public function permitCanHeZhi(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.canhezhiButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.canhezhi,0);
            this.canhezhiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.canhezhiButton);
            this.objCanHeZhi = new Object();
            this.objCanHeZhi.neirong = this.canhezhi;
            this.objCanHeZhi.biaoqian = this.canhezhiButton;
            this.objCanHeZhi.name = "25";
            this.objCanHeZhi.isShow = true;
            this.objCanHeZhi.dengji = -1;
            this.btnArray2.push(this.objCanHeZhi);
         }
         else if(!param1 && this.canhezhiButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.canhezhi != null && this.canhezhi.parent != null)
            {
               this.canhezhi.parent.removeChild(this.canhezhi);
            }
            this.canhezhiButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.canhezhiButton != null && this.canhezhiButton.parent != null)
            {
               this.canhezhiButton.parent.removeChild(this.canhezhiButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objCanHeZhi);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function permitEMoZhiYi(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.emozhiyiButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.emozhiyi,0);
            this.emozhiyiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.emozhiyiButton);
            this.objEMoZhiYi = new Object();
            this.objEMoZhiYi.neirong = this.emozhiyi;
            this.objEMoZhiYi.biaoqian = this.emozhiyiButton;
            this.objEMoZhiYi.name = "6";
            this.objEMoZhiYi.isShow = true;
            this.objEMoZhiYi.dengji = -1;
            this.btnArray3.push(this.objEMoZhiYi);
         }
         else if(!param1 && this.emozhiyiButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.emozhiyi != null && this.emozhiyi.parent != null)
            {
               this.emozhiyi.parent.removeChild(this.emozhiyi);
            }
            this.emozhiyiButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.emozhiyiButton != null && this.emozhiyiButton.parent != null)
            {
               this.emozhiyiButton.parent.removeChild(this.emozhiyiButton);
            }
            _loc3_ = this.btnArray3.indexOf(this.objEMoZhiYi);
            if(_loc3_ >= 0)
            {
               this.btnArray3.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showEMoZhiYi() : void
      {
         this.initCharPanel(3,"6");
      }
      
      public function setYunInitializeEMoZhiYi(param1:EMoZhiYiVo) : void
      {
         this.emozhiyi.setInitialize(param1,false);
      }
      
      public function EMoZhiYiShow(param1:Boolean) : void
      {
         this.emozhiyi.showEMoZhiYi(param1);
      }
      
      public function setEMoZhiYiEnabledFun() : void
      {
         this.emozhiyi.setEnableFun();
      }
      
      public function setEMoZhiYiJiHuo(param1:Boolean) : void
      {
         this.emozhiyi.setJiHuo(param1);
      }
      
      public function showYanXingZhen() : void
      {
         this.initCharPanel(4,"17");
      }
      
      public function setYanXingZhenInitialize(param1:YanXingZhenVO) : void
      {
         this.yanxingzhen.setInitialize(false,param1);
      }
      
      public function setYanXingZhenEnableFun() : void
      {
         this.yanxingzhen.setEnableFun();
      }
      
      public function setYanXingZhenPingBi(param1:Boolean) : void
      {
         this.yanxingzhen.setXianShi(param1);
      }
      
      public function permitYanXingZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.yanxingzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.yanxingzhen,0);
            this.yanxingzhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.yanxingzhenButton);
            this.objYanXingZhen = new Object();
            this.objYanXingZhen.neirong = this.yanxingzhen;
            this.objYanXingZhen.biaoqian = this.yanxingzhenButton;
            this.objYanXingZhen.name = "17";
            this.objYanXingZhen.isShow = true;
            this.objYanXingZhen.dengji = -1;
            this.btnArray4.push(this.objYanXingZhen);
         }
         else if(!param1 && this.yanxingzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.yanxingzhen != null && this.yanxingzhen.parent != null)
            {
               this.yanxingzhen.parent.removeChild(this.yanxingzhen);
            }
            this.yanxingzhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.yanxingzhenButton != null && this.yanxingzhenButton.parent != null)
            {
               this.yanxingzhenButton.parent.removeChild(this.yanxingzhenButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objYanXingZhen);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function set_XuanXiangZhen(param1:Array) : void
      {
         this.xuanxiangzhen.set_XuanXiangZhen(param1);
      }
      
      public function showXuanXiangZhen() : void
      {
         this.initCharPanel(4,"16");
      }
      
      public function setXuanXiangZhenInitialize(param1:XuanXiangZhenVO) : void
      {
         this.xuanxiangzhen.setInitialize(false,param1);
      }
      
      public function setXuanXiangZhenEnableFun() : void
      {
         this.xuanxiangzhen.setEnableFun();
      }
      
      public function setXuanXiangZhenPingBi(param1:Boolean) : void
      {
         this.xuanxiangzhen.setXianShi(param1);
      }
      
      public function permitXuanXiangZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.xuanxiangzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.xuanxiangzhen,0);
            this.xuanxiangzhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.xuanxiangzhenButton);
            this.objXuanXiangZhen = new Object();
            this.objXuanXiangZhen.neirong = this.xuanxiangzhen;
            this.objXuanXiangZhen.biaoqian = this.xuanxiangzhenButton;
            this.objXuanXiangZhen.name = "16";
            this.objXuanXiangZhen.isShow = true;
            this.objXuanXiangZhen.dengji = -1;
            this.btnArray4.push(this.objXuanXiangZhen);
         }
         else if(!param1 && this.xuanxiangzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.xuanxiangzhen != null && this.xuanxiangzhen.parent != null)
            {
               this.xuanxiangzhen.parent.removeChild(this.xuanxiangzhen);
            }
            this.xuanxiangzhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.xuanxiangzhenButton != null && this.xuanxiangzhenButton.parent != null)
            {
               this.xuanxiangzhenButton.parent.removeChild(this.xuanxiangzhenButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objXuanXiangZhen);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function set_JueZhanGuangMingDing(param1:Array) : void
      {
         this.juezhanguangmingding.set_juezhanguangmingding(param1);
      }
      
      public function showJueZhanGuangMingDing() : void
      {
         this.initCharPanel(5,"1");
      }
      
      public function setJueZhanGuangMingDingInit(param1:Object) : void
      {
         this.juezhanguangmingding.setinitilizeUI(false,param1);
      }
      
      public function setJueZhanGuangMingDingEnableFun() : void
      {
         this.juezhanguangmingding.setEnableFun();
      }
      
      public function permitJueZhanGuangMingDing(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.juezhanguangmingdingButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.juezhanguangmingding,0);
            this.juezhanguangmingdingButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer5.addChild(this.juezhanguangmingdingButton);
            this.objJueZhanGuangMingDing = new Object();
            this.objJueZhanGuangMingDing.neirong = this.juezhanguangmingding;
            this.objJueZhanGuangMingDing.biaoqian = this.juezhanguangmingdingButton;
            this.objJueZhanGuangMingDing.eventType = JUEZHANGUANGMINGDING;
            this.objJueZhanGuangMingDing.name = "1";
            this.objJueZhanGuangMingDing.isShow = true;
            this.objJueZhanGuangMingDing.dengji = -1;
            this.btnArray5.push(this.objJueZhanGuangMingDing);
         }
         else if(!param1 && this.juezhanguangmingdingButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.juezhanguangmingding != null && this.juezhanguangmingding.parent != null)
            {
               this.juezhanguangmingding.parent.removeChild(this.juezhanguangmingding);
            }
            this.juezhanguangmingdingButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.juezhanguangmingdingButton != null && this.juezhanguangmingdingButton.parent != null)
            {
               this.juezhanguangmingdingButton.parent.removeChild(this.juezhanguangmingdingButton);
            }
            _loc3_ = this.btnArray5.indexOf(this.objJueZhanGuangMingDing);
            if(_loc3_ >= 0)
            {
               this.btnArray5.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function permitTushidahui(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this._tushidahuiBtn.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this._tushidahuiPanel,0);
            this._tushidahuiBtn.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer5.addChild(this._tushidahuiBtn);
            this.tushidahuiObj = new Object();
            this.tushidahuiObj.neirong = this._tushidahuiPanel;
            this.tushidahuiObj.biaoqian = this._tushidahuiBtn;
            this.tushidahuiObj.eventType = TushidahuiConst.TARGET_TUSHIDAHUI;
            this.tushidahuiObj.name = "2";
            this.tushidahuiObj.isShow = true;
            this.tushidahuiObj.dengji = -1;
            this.btnArray5.push(this.tushidahuiObj);
         }
         else if(!param1 && this._tushidahuiBtn.hasEventListener(MouseEvent.CLICK))
         {
            if(this._tushidahuiPanel != null && this._tushidahuiPanel.parent != null)
            {
               this._tushidahuiPanel.parent.removeChild(this._tushidahuiPanel);
            }
            this._tushidahuiBtn.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this._tushidahuiBtn != null && this._tushidahuiBtn.parent != null)
            {
               this._tushidahuiBtn.parent.removeChild(this._tushidahuiBtn);
            }
            _loc3_ = this.btnArray5.indexOf(this.tushidahuiObj);
            if(_loc3_ >= 0)
            {
               this.btnArray5.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function set_GanJiangMoYe(param1:Array) : void
      {
         this.ganjiangmoye.set_GanJiangMoYe(param1);
      }
      
      public function permitGanJiangMoYe(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.ganjiangmoyeButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.ganjiangmoye,0);
            this.ganjiangmoyeButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.ganjiangmoyeButton);
            this.objGanJiangMoYe = new Object();
            this.objGanJiangMoYe.neirong = this.ganjiangmoye;
            this.objGanJiangMoYe.biaoqian = this.ganjiangmoyeButton;
            this.objGanJiangMoYe.name = "7";
            this.objGanJiangMoYe.isShow = true;
            this.objGanJiangMoYe.dengji = -1;
            this.btnArray3.push(this.objGanJiangMoYe);
         }
         else if(!param1 && this.ganjiangmoyeButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.ganjiangmoye != null && this.ganjiangmoye.parent != null)
            {
               this.ganjiangmoye.parent.removeChild(this.ganjiangmoye);
            }
            this.ganjiangmoyeButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.ganjiangmoyeButton != null && this.ganjiangmoyeButton.parent != null)
            {
               this.ganjiangmoyeButton.parent.removeChild(this.ganjiangmoyeButton);
            }
            _loc3_ = this.btnArray3.indexOf(this.objGanJiangMoYe);
            if(_loc3_ >= 0)
            {
               this.btnArray3.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showGanJiangMoYe() : void
      {
         this.initCharPanel(3,"7");
      }
      
      public function GjMygouxuan(param1:Boolean, param2:Boolean) : void
      {
         this.ganjiangmoye.gouxuan(param1,param2);
      }
      
      public function setShuxingJiacheng(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : void
      {
         this.ganjiangmoye.setShuxingJiacheng(param1,param2,param3,param4,param5,param6,param7,param8);
         this.ganjiangmoye.setJiHuo(false);
      }
      
      public function setGanJiangMoYeHuanZhuang(param1:Boolean, param2:Boolean, param3:Boolean, param4:Boolean) : void
      {
         this.ganjiangmoye.setGanJiangMoYeHuanZhuang(param1,param2,param3,param4);
      }
      
      public function setBg(param1:int, param2:int) : void
      {
         this.ganjiangmoye.setBg(param1,param2);
      }
      
      public function setGanJiangMoYeSkill(param1:int, param2:Boolean) : void
      {
         this.ganjiangmoye.setSkill(param1,param2);
      }
      
      public function setGanJiangMoYeEnableFun() : void
      {
         this.ganjiangmoye.setEnableFun();
      }
      
      public function setHuangdaoItems(param1:Array, param2:int, param3:int, param4:int) : void
      {
         this.ynHuangdao.setXunZhang(param1,param2,param3,param4,false);
      }
      
      public function setZhuanpanItems(param1:Array, param2:int, param3:int, param4:int) : void
      {
         this.ynZhuanpan.setXunZhang(param1,param2,param3,param4,false);
      }
      
      public function setWZZBItems(param1:Array, param2:int, param3:int, param4:int) : void
      {
         this.ynWZZB.setXunZhang(param1,param2,param3,param4,false);
      }
      
      public function setFSZBItems(param1:Array, param2:int, param3:int, param4:int) : void
      {
         this.ynFSZB.setXunZhang(param1,param2,param3,param4,false);
      }
      
      public function set_HuTaoZhen(param1:Array) : void
      {
         this.hutaozhen.set_HuTaoZhen(param1);
      }
      
      public function showHuTaoZhen() : void
      {
         this.initCharPanel(4,"18");
      }
      
      public function setHuTaoZhenInitialize(param1:HuTaoZhenVO) : void
      {
         this.hutaozhen.setInitialize(false,param1);
      }
      
      public function setHuTaoZhenEnableFun() : void
      {
         this.hutaozhen.setEnableFun();
      }
      
      public function setHuTaoZhenPingBi(param1:Boolean) : void
      {
         this.hutaozhen.setXianShi(param1);
      }
      
      public function permitHuTaoZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.hutaozhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.hutaozhen,0);
            this.hutaozhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.hutaozhenButton);
            this.objHuTaoZhen = new Object();
            this.objHuTaoZhen.neirong = this.hutaozhen;
            this.objHuTaoZhen.biaoqian = this.hutaozhenButton;
            this.objHuTaoZhen.name = "18";
            this.objHuTaoZhen.isShow = true;
            this.objHuTaoZhen.dengji = -1;
            this.btnArray4.push(this.objHuTaoZhen);
         }
         else if(!param1 && this.hutaozhenButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.hutaozhen != null && this.hutaozhen.parent != null)
            {
               this.hutaozhen.parent.removeChild(this.hutaozhen);
            }
            this.hutaozhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.hutaozhenButton != null && this.hutaozhenButton.parent != null)
            {
               this.hutaozhenButton.parent.removeChild(this.hutaozhenButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objHuTaoZhen);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function set_YunLongZhen(param1:Array) : void
      {
         this.yunlongzhen.set_YunLongZhen(param1);
      }
      
      public function showYunLongZhen() : void
      {
         this.initCharPanel(4,"19");
      }
      
      public function setYunLongZhenInitialize(param1:YunLongZhenVO) : void
      {
         this.yunlongzhen.setInitialize(false,param1);
      }
      
      public function setYunLongZhenEnableFun() : void
      {
         this.yunlongzhen.setEnableFun();
      }
      
      public function setYunLongZhenPingBi(param1:Boolean) : void
      {
         this.yunlongzhen.setXianShi(param1);
      }
      
      public function permitYunLongZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.yunlongzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.yunlongzhen,0);
            this.yunlongzhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.yunlongzhenButton);
            this.objYunLongZhen = new Object();
            this.objYunLongZhen.neirong = this.yunlongzhen;
            this.objYunLongZhen.biaoqian = this.yunlongzhenButton;
            this.objYunLongZhen.name = "19";
            this.objYunLongZhen.isShow = true;
            this.objYunLongZhen.dengji = -1;
            this.btnArray4.push(this.objYunLongZhen);
         }
         else if(!param1 && this.yunlongzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.yunlongzhen != null && this.yunlongzhen.parent != null)
            {
               this.yunlongzhen.parent.removeChild(this.yunlongzhen);
            }
            this.yunlongzhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.yunlongzhenButton != null && this.yunlongzhenButton.parent != null)
            {
               this.yunlongzhenButton.parent.removeChild(this.yunlongzhenButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objYunLongZhen);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function set_XianTianGong(param1:Array) : void
      {
         this.xiantiangong.set_XianTianGong(param1);
      }
      
      public function showXianTianGong() : void
      {
         this.initCharPanel(2,"26");
      }
      
      public function setXianTianGongInit(param1:XianTianGongVo) : void
      {
         this.xiantiangong.setinitilizeUI(false,param1);
      }
      
      public function setXianTianGongEnableFun() : void
      {
         this.xiantiangong.setEnableFun();
      }
      
      public function permitXianTianGong(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.xiantiangongButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.xiantiangong,0);
            this.xiantiangongButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.xiantiangongButton);
            this.objXianTianGong = new Object();
            this.objXianTianGong.neirong = this.xiantiangong;
            this.objXianTianGong.biaoqian = this.xiantiangongButton;
            this.objXianTianGong.name = "26";
            this.objXianTianGong.isShow = true;
            this.objXianTianGong.dengji = -1;
            this.btnArray2.push(this.objXianTianGong);
         }
         else if(!param1 && this.xiantiangongButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.xiantiangong != null && this.xiantiangong.parent != null)
            {
               this.xiantiangong.parent.removeChild(this.xiantiangong);
            }
            this.xiantiangongButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.xiantiangongButton != null && this.xiantiangongButton.parent != null)
            {
               this.xiantiangongButton.parent.removeChild(this.xiantiangongButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objXianTianGong);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showPangXieZhen() : void
      {
         this.initCharPanel(4,"20");
      }
      
      public function setPangXieZhenInitialize(param1:PangXieZhenVO) : void
      {
         this.pangxiezhen.setInitialize(false,param1);
      }
      
      public function setPangXieZhenEnableFun() : void
      {
         this.pangxiezhen.setEnableFun();
      }
      
      public function setPangXieZhenPingBi(param1:Boolean) : void
      {
         this.pangxiezhen.setXianShi(param1);
      }
      
      public function permitPangXieZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.pangxiezhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.pangxiezhen,0);
            this.pangxiezhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.pangxiezhenButton);
            this.objPangXieZhen = new Object();
            this.objPangXieZhen.neirong = this.pangxiezhen;
            this.objPangXieZhen.biaoqian = this.pangxiezhenButton;
            this.objPangXieZhen.name = "20";
            this.objPangXieZhen.isShow = true;
            this.objPangXieZhen.dengji = -1;
            this.btnArray4.push(this.objPangXieZhen);
         }
         else if(!param1 && this.pangxiezhenButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.pangxiezhen != null && this.pangxiezhen.parent != null)
            {
               this.pangxiezhen.parent.removeChild(this.pangxiezhen);
            }
            this.pangxiezhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.pangxiezhenButton != null && this.pangxiezhenButton.parent != null)
            {
               this.pangxiezhenButton.parent.removeChild(this.pangxiezhenButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objPangXieZhen);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function set_XueDaoXinFa(param1:Array) : void
      {
         this.xuedaoxinfa.set_XueDaoXinFa(param1);
      }
      
      public function showXueDaoXinFa() : void
      {
         this.initCharPanel(2,"27");
      }
      
      public function setXueDaoXinFaInit(param1:XueDaoXinFaVO) : void
      {
         this.xuedaoxinfa.setinitilizeUI(false,param1);
      }
      
      public function setXueDaoXinFaEnableFun() : void
      {
         this.xuedaoxinfa.setEnableFun();
      }
      
      public function permitXueDaoXinFa(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.xuedaoxinfaButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.xuedaoxinfa,0);
            this.xuedaoxinfaButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.xuedaoxinfaButton);
            this.objXueDaoXinFa = new Object();
            this.objXueDaoXinFa.neirong = this.xuedaoxinfa;
            this.objXueDaoXinFa.biaoqian = this.xuedaoxinfaButton;
            this.objXueDaoXinFa.name = "27";
            this.objXueDaoXinFa.isShow = true;
            this.objXueDaoXinFa.dengji = -1;
            this.btnArray2.push(this.objXueDaoXinFa);
         }
         else if(!param1 && this.xuedaoxinfaButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.xuedaoxinfa != null && this.xuedaoxinfa.parent != null)
            {
               this.xuedaoxinfa.parent.removeChild(this.xuedaoxinfa);
            }
            this.xuedaoxinfaButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.xuedaoxinfaButton != null && this.xuedaoxinfaButton.parent != null)
            {
               this.xuedaoxinfaButton.parent.removeChild(this.xuedaoxinfaButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objXueDaoXinFa);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function permitHuYiJueXing(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.huyijuexingButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.huyijuexing,0);
            this.huyijuexingButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.huyijuexingButton);
            this.objHuYiJueXing = new Object();
            this.objHuYiJueXing.neirong = this.huyijuexing;
            this.objHuYiJueXing.biaoqian = this.huyijuexingButton;
            this.objHuYiJueXing.name = "8";
            this.objHuYiJueXing.isShow = true;
            this.objHuYiJueXing.dengji = -1;
            this.btnArray3.push(this.objHuYiJueXing);
         }
         else if(!param1 && this.huyijuexingButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.huyijuexing != null && this.huyijuexing.parent != null)
            {
               this.huyijuexing.parent.removeChild(this.huyijuexing);
            }
            this.huyijuexingButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.huyijuexingButton != null && this.huyijuexingButton.parent != null)
            {
               this.huyijuexingButton.parent.removeChild(this.huyijuexingButton);
            }
            _loc3_ = this.btnArray3.indexOf(this.objHuYiJueXing);
            if(_loc3_ >= 0)
            {
               this.btnArray3.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showHuYiJueXing() : void
      {
         this.initCharPanel(3,"8");
      }
      
      public function setHuYiJueXingInit(param1:HuYiJueXingVO) : void
      {
         this.huyijuexing.setinitilizeUI(false,param1);
      }
      
      public function setHuYiJueXingEnableFun() : void
      {
         this.huyijuexing.setEnableFun();
      }
      
      public function showDiZaiZhen() : void
      {
         this.initCharPanel(4,"23");
      }
      
      public function setDiZaiZhenInitialize(param1:DiZaiZhenVO) : void
      {
         this.dizaizhen.setInitialize(false,param1);
      }
      
      public function setDiZaiZhenEnableFun() : void
      {
         this.dizaizhen.setEnableFun();
      }
      
      public function setDiZaiZhenPingBi(param1:Boolean) : void
      {
         this.dizaizhen.setXianShi(param1);
      }
      
      public function permitDiZaiZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.dizaizhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.dizaizhen,0);
            this.dizaizhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.dizaizhenButton);
            this.objDiZaiZhen = new Object();
            this.objDiZaiZhen.neirong = this.dizaizhen;
            this.objDiZaiZhen.biaoqian = this.dizaizhenButton;
            this.objDiZaiZhen.name = "23";
            this.objDiZaiZhen.isShow = true;
            this.objDiZaiZhen.dengji = -1;
            this.btnArray4.push(this.objDiZaiZhen);
         }
         else if(!param1 && this.dizaizhenButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.dizaizhen != null && this.dizaizhen.parent != null)
            {
               this.dizaizhen.parent.removeChild(this.dizaizhen);
            }
            this.dizaizhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.dizaizhenButton != null && this.dizaizhenButton.parent != null)
            {
               this.dizaizhenButton.parent.removeChild(this.dizaizhenButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objDiZaiZhen);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showFengYangZhen() : void
      {
         this.initCharPanel(4,"24");
      }
      
      public function setFengYangZhenInitialize(param1:FengYangZhenVO) : void
      {
         this.fengyangzhen.setInitialize(false,param1);
      }
      
      public function setFengYangZhenEnableFun() : void
      {
         this.fengyangzhen.setEnableFun();
      }
      
      public function setFengYangZhenPingBi(param1:Boolean) : void
      {
         this.fengyangzhen.setXianShi(param1);
      }
      
      public function permitFengYangZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.fengyangzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.fengyangzhen,0);
            this.fengyangzhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.fengyangzhenButton);
            this.objFengYangZhen = new Object();
            this.objFengYangZhen.neirong = this.fengyangzhen;
            this.objFengYangZhen.biaoqian = this.fengyangzhenButton;
            this.objFengYangZhen.name = "24";
            this.objFengYangZhen.isShow = true;
            this.objFengYangZhen.dengji = -1;
            this.btnArray4.push(this.objFengYangZhen);
         }
         else if(!param1 && this.fengyangzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.fengyangzhen != null && this.fengyangzhen.parent != null)
            {
               this.fengyangzhen.parent.removeChild(this.fengyangzhen);
            }
            this.fengyangzhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.fengyangzhenButton != null && this.fengyangzhenButton.parent != null)
            {
               this.fengyangzhenButton.parent.removeChild(this.fengyangzhenButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objFengYangZhen);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function permitLongYaJueXing(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.longyajuexingButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.longyajuexing,0);
            this.longyajuexingButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.longyajuexingButton);
            this.objLongYaJueXing = new Object();
            this.objLongYaJueXing.neirong = this.longyajuexing;
            this.objLongYaJueXing.biaoqian = this.longyajuexingButton;
            this.objLongYaJueXing.name = "9";
            this.objLongYaJueXing.isShow = true;
            this.objLongYaJueXing.dengji = -1;
            this.btnArray3.push(this.objLongYaJueXing);
         }
         else if(!param1 && this.longyajuexingButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.longyajuexing != null && this.longyajuexing.parent != null)
            {
               this.longyajuexing.parent.removeChild(this.longyajuexing);
            }
            this.longyajuexingButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.longyajuexingButton != null && this.longyajuexingButton.parent != null)
            {
               this.longyajuexingButton.parent.removeChild(this.longyajuexingButton);
            }
            _loc3_ = this.btnArray3.indexOf(this.objLongYaJueXing);
            if(_loc3_ >= 0)
            {
               this.btnArray3.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showLongYaJueXing() : void
      {
         this.initCharPanel(3,"9");
      }
      
      public function setLongYaJueXingInit(param1:LongYaJueXingVO) : void
      {
         this.longyajuexing.setinitilizeUI(false,param1);
      }
      
      public function setLongYaJueXingEnableFun() : void
      {
         this.longyajuexing.setEnableFun();
      }
      
      public function permitQuanShenJueXing(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.quanshenjuexingButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.quanshenjuexing,0);
            this.quanshenjuexingButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.quanshenjuexingButton);
            this.objQuanShenJueXing = new Object();
            this.objQuanShenJueXing.neirong = this.quanshenjuexing;
            this.objQuanShenJueXing.biaoqian = this.quanshenjuexingButton;
            this.objQuanShenJueXing.name = "10";
            this.objQuanShenJueXing.isShow = true;
            this.objQuanShenJueXing.dengji = -1;
            this.btnArray3.push(this.objQuanShenJueXing);
         }
         else if(!param1 && this.quanshenjuexingButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.quanshenjuexing != null && this.quanshenjuexing.parent != null)
            {
               this.quanshenjuexing.parent.removeChild(this.quanshenjuexing);
            }
            this.quanshenjuexingButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.quanshenjuexingButton != null && this.quanshenjuexingButton.parent != null)
            {
               this.quanshenjuexingButton.parent.removeChild(this.quanshenjuexingButton);
            }
            _loc3_ = this.btnArray3.indexOf(this.objQuanShenJueXing);
            if(_loc3_ >= 0)
            {
               this.btnArray3.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showQuanShenJueXing() : void
      {
         this.initCharPanel(3,"10");
      }
      
      public function setQuanShenJueXingInit(param1:QuanShenJueXingVO) : void
      {
         this.quanshenjuexing.setinitilizeUI(false,param1);
      }
      
      public function setQuanShenJueXingEnableFun() : void
      {
         this.quanshenjuexing.setEnableFun();
      }
      
      public function permitWuDuZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.wuduzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.wuduzhen,0);
            this.wuduzhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.wuduzhenButton);
            this.objWuDuZhen = new Object();
            this.objWuDuZhen.neirong = this.wuduzhen;
            this.objWuDuZhen.biaoqian = this.wuduzhenButton;
            this.objWuDuZhen.name = "25";
            this.objWuDuZhen.isShow = true;
            this.objWuDuZhen.dengji = -1;
            this.btnArray4.push(this.objWuDuZhen);
         }
         else if(!param1 && this.wuduzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.wuduzhen != null && this.wuduzhen.parent != null)
            {
               this.wuduzhen.parent.removeChild(this.wuduzhen);
            }
            this.wuduzhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.wuduzhenButton != null && this.wuduzhenButton.parent != null)
            {
               this.wuduzhenButton.parent.removeChild(this.wuduzhenButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objWuDuZhen);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showWuDuZhen() : void
      {
         this.initCharPanel(4,"25");
      }
      
      public function setWuDuZhenInit(param1:int, param2:Array, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:int, param9:Boolean, param10:int, param11:Boolean, param12:Boolean, param13:Boolean) : void
      {
         this.wuduzhen.setPanel(true,param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13);
      }
      
      public function setWuDuZhenEnableFun() : void
      {
         this.wuduzhen.setEnableFun();
      }
      
      public function permitLongYinJueXing(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.longyinjuexingButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.longyinjuexing,0);
            this.longyinjuexingButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.longyinjuexingButton);
            this.objLongYinJueXing = new Object();
            this.objLongYinJueXing.neirong = this.longyinjuexing;
            this.objLongYinJueXing.biaoqian = this.longyinjuexingButton;
            this.objLongYinJueXing.name = "11";
            this.objLongYinJueXing.isShow = true;
            this.objLongYinJueXing.dengji = -1;
            this.btnArray3.push(this.objLongYinJueXing);
         }
         else if(!param1 && this.longyinjuexingButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.longyinjuexing != null && this.longyinjuexing.parent != null)
            {
               this.longyinjuexing.parent.removeChild(this.longyinjuexing);
            }
            this.longyinjuexingButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.longyinjuexingButton != null && this.longyinjuexingButton.parent != null)
            {
               this.longyinjuexingButton.parent.removeChild(this.longyinjuexingButton);
            }
            _loc3_ = this.btnArray3.indexOf(this.objLongYinJueXing);
            if(_loc3_ >= 0)
            {
               this.btnArray3.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showLongYinJueXing() : void
      {
         this.initCharPanel(3,"11");
      }
      
      public function setLongYinJueXingInit(param1:LongYinJueXingVO) : void
      {
         this.longyinjuexing.setinitilizeUI(false,param1);
      }
      
      public function setLongYinJueXingEnableFun() : void
      {
         this.longyinjuexing.setEnableFun();
      }
      
      public function showShenXingBaiBian() : void
      {
         this.initCharPanel(2,"28");
      }
      
      public function setShenXingBaiBianInit(param1:ShenXingBaiBianVO) : void
      {
         this.shenxingbaibian.setinitilizeUI(false,param1);
      }
      
      public function setShenXingBaiBianEnableFun() : void
      {
         this.shenxingbaibian.setEnableFun();
      }
      
      public function permitShenXingBaiBian(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.shenxingbaibianButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.shenxingbaibian,0);
            this.shenxingbaibianButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.shenxingbaibianButton);
            this.objShenXingBaiBian = new Object();
            this.objShenXingBaiBian.neirong = this.shenxingbaibian;
            this.objShenXingBaiBian.biaoqian = this.shenxingbaibianButton;
            this.objShenXingBaiBian.name = "28";
            this.objShenXingBaiBian.isShow = true;
            this.objShenXingBaiBian.dengji = -1;
            this.btnArray2.push(this.objShenXingBaiBian);
         }
         else if(!param1 && this.shenxingbaibianButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.shenxingbaibian != null && this.shenxingbaibian.parent != null)
            {
               this.shenxingbaibian.parent.removeChild(this.shenxingbaibian);
            }
            this.shenxingbaibianButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.shenxingbaibianButton != null && this.shenxingbaibianButton.parent != null)
            {
               this.shenxingbaibianButton.parent.removeChild(this.shenxingbaibianButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objShenXingBaiBian);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function permitLangHunDun(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.langhundunButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.langhundun,0);
            this.langhundunButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.langhundunButton);
            this.objLangHunDun = new Object();
            this.objLangHunDun.neirong = this.langhundun;
            this.objLangHunDun.biaoqian = this.langhundunButton;
            this.objLangHunDun.name = "12";
            this.objLangHunDun.isShow = true;
            this.objLangHunDun.dengji = -1;
            this.btnArray3.push(this.objLangHunDun);
         }
         else if(!param1 && this.langhundunButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.langhundun != null && this.langhundun.parent != null)
            {
               this.langhundun.parent.removeChild(this.langhundun);
            }
            this.langhundunButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.langhundunButton != null && this.langhundunButton.parent != null)
            {
               this.langhundunButton.parent.removeChild(this.langhundunButton);
            }
            _loc3_ = this.btnArray3.indexOf(this.objLangHunDun);
            if(_loc3_ >= 0)
            {
               this.btnArray3.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showLangHunDun() : void
      {
         this.initCharPanel(3,"12");
      }
      
      public function setLangHunDunInit(param1:LangHunDunVO) : void
      {
         this.langhundun.setinitilizeUI(false,param1);
      }
      
      public function setLangHunDunEnableFun() : void
      {
         this.langhundun.setEnableFun();
      }
      
      public function setLangHunDunZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.langhundun.setZhufuzhi(param1,param2,0);
      }
      
      public function showRulaishenzhang() : void
      {
         this.initCharPanel(2,"29");
      }
      
      public function setRulaishenzhangInit(param1:RuLaiShenZhangVO) : void
      {
         this.rulaishenzhang.setInitialize(false,param1);
      }
      
      public function setRulaishenzhangEnableFun() : void
      {
         this.rulaishenzhang.setRulaishenzhangEnabledFun();
      }
      
      public function permitRulaishenzhang(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.rulaishenzhangButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.rulaishenzhang,0);
            this.rulaishenzhangButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.rulaishenzhangButton);
            this.objRulaishenzhang = new Object();
            this.objRulaishenzhang.neirong = this.rulaishenzhang;
            this.objRulaishenzhang.biaoqian = this.rulaishenzhangButton;
            this.objRulaishenzhang.name = "29";
            this.objRulaishenzhang.isShow = true;
            this.objRulaishenzhang.dengji = -1;
            this.btnArray2.push(this.objRulaishenzhang);
         }
         else if(!param1 && this.rulaishenzhangButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.rulaishenzhang != null && this.rulaishenzhang.parent != null)
            {
               this.rulaishenzhang.parent.removeChild(this.rulaishenzhang);
            }
            this.rulaishenzhangButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.rulaishenzhangButton != null && this.rulaishenzhangButton.parent != null)
            {
               this.rulaishenzhangButton.parent.removeChild(this.rulaishenzhangButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objRulaishenzhang);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showLuoYingShenJianZhang() : void
      {
         this.initCharPanel(2,"30");
      }
      
      public function setLuoYingShenJianZhangInit(param1:LuoYingShenJianZhangVO) : void
      {
         this.luoyingshenjianzhang.setinitilizeUI(false,param1);
      }
      
      public function setLuoYingShenJianZhangEnableFun() : void
      {
         this.luoyingshenjianzhang.setEnableFun();
      }
      
      public function permitLuoYingShenJianZhang(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.luoyingshenjianzhangButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.luoyingshenjianzhang,0);
            this.luoyingshenjianzhangButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.luoyingshenjianzhangButton);
            this.objLuoYingShenJianZhang = new Object();
            this.objLuoYingShenJianZhang.neirong = this.luoyingshenjianzhang;
            this.objLuoYingShenJianZhang.biaoqian = this.luoyingshenjianzhangButton;
            this.objLuoYingShenJianZhang.name = "30";
            this.objLuoYingShenJianZhang.isShow = true;
            this.objLuoYingShenJianZhang.dengji = -1;
            this.btnArray2.push(this.objLuoYingShenJianZhang);
         }
         else if(!param1 && this.luoyingshenjianzhangButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.luoyingshenjianzhang != null && this.luoyingshenjianzhang.parent != null)
            {
               this.luoyingshenjianzhang.parent.removeChild(this.luoyingshenjianzhang);
            }
            this.luoyingshenjianzhangButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.luoyingshenjianzhangButton != null && this.luoyingshenjianzhangButton.parent != null)
            {
               this.luoyingshenjianzhangButton.parent.removeChild(this.luoyingshenjianzhangButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objLuoYingShenJianZhang);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function set_BaZhenTu(param1:Array) : void
      {
         this.bazhentu.set_BaZhenTu(param1);
      }
      
      public function showBaZhenTu() : void
      {
         this.initCharPanel(4,"26");
      }
      
      public function setBaZhenTuInit(param1:BaZhenTuVO) : void
      {
         this.bazhentu.setinitilizeUI(false,param1);
      }
      
      public function setBaZhenTuEnableFun() : void
      {
         this.bazhentu.setEnableFun();
      }
      
      public function permitBaZhenTu(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.bazhentuButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.bazhentu,0);
            this.bazhentuButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.bazhentuButton);
            this.objBaZhenTu = new Object();
            this.objBaZhenTu.neirong = this.bazhentu;
            this.objBaZhenTu.biaoqian = this.bazhentuButton;
            this.objBaZhenTu.name = "26";
            this.objBaZhenTu.isShow = true;
            this.objBaZhenTu.dengji = -1;
            this.btnArray4.push(this.objBaZhenTu);
         }
         else if(!param1 && this.bazhentuButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.bazhentu != null && this.bazhentu.parent != null)
            {
               this.bazhentu.parent.removeChild(this.bazhentu);
            }
            this.bazhentuButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.bazhentuButton != null && this.bazhentuButton.parent != null)
            {
               this.bazhentuButton.parent.removeChild(this.bazhentuButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objBaZhenTu);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function permitDuGuQiuBai(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.duguqiubaiButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.duguqiubai,0);
            this.duguqiubaiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer5.addChild(this.duguqiubaiButton);
            this.objDuGuQiuBai = new Object();
            this.objDuGuQiuBai.neirong = this.duguqiubai;
            this.objDuGuQiuBai.biaoqian = this.duguqiubaiButton;
            this.objDuGuQiuBai.eventType = DUGUQIUBAI;
            this.objDuGuQiuBai.name = "3";
            this.objDuGuQiuBai.isShow = true;
            this.objDuGuQiuBai.dengji = -1;
            this.btnArray5.push(this.objDuGuQiuBai);
         }
         else if(!param1 && this.duguqiubaiButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.duguqiubai != null && this.duguqiubai.parent != null)
            {
               this.duguqiubai.parent.removeChild(this.duguqiubai);
            }
            this.duguqiubaiButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.duguqiubaiButton != null && this.duguqiubaiButton.parent != null)
            {
               this.duguqiubaiButton.parent.removeChild(this.duguqiubaiButton);
            }
            _loc3_ = this.btnArray5.indexOf(this.objDuGuQiuBai);
            if(_loc3_ >= 0)
            {
               this.btnArray5.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showDuGuQiuBai() : void
      {
         this.initCharPanel(5,"3");
      }
      
      public function setDuGuQiuBaiInit(param1:DuGuQiuBaiVO) : void
      {
         this.duguqiubai.setinitilizeUI(false,param1);
      }
      
      public function setDuGuQiuBaiEnableFun() : void
      {
         this.duguqiubai.setEnableFun();
      }
      
      public function setDuGuQiuBaiGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.duguqiubai.setGoods(param1,param2);
      }
      
      public function setDuGuQiuBaiZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.duguqiubai.setZhufuzhi(param1,param2,0);
      }
      
      public function set_XuanTieJianFa(param1:Array) : void
      {
         this.xuantiejianfa.set_XuanTieJianFa(param1);
      }
      
      public function showxuantiejianfa() : void
      {
         this.initCharPanel(2,"31");
      }
      
      public function setXuanTieJianFaInit(param1:XuanTieJianFaVO) : void
      {
         this.xuantiejianfa.setinitilizeUI(false,param1);
      }
      
      public function setXuanTieJianFaEnableFun() : void
      {
         this.xuantiejianfa.setEnableFun();
      }
      
      public function permitXuanTieJianFa(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.xuantiejianfaButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.xuantiejianfa,0);
            this.xuantiejianfaButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.xuantiejianfaButton);
            this.objXuanTieJianFa = new Object();
            this.objXuanTieJianFa.neirong = this.xuantiejianfa;
            this.objXuanTieJianFa.biaoqian = this.xuantiejianfaButton;
            this.objXuanTieJianFa.name = "31";
            this.objXuanTieJianFa.isShow = true;
            this.objXuanTieJianFa.dengji = -1;
            this.btnArray2.push(this.objXuanTieJianFa);
         }
         else if(!param1 && this.xuantiejianfaButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.xuantiejianfa != null && this.xuantiejianfa.parent != null)
            {
               this.xuantiejianfa.parent.removeChild(this.xuantiejianfa);
            }
            this.xuantiejianfaButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.xuantiejianfaButton != null && this.xuantiejianfaButton.parent != null)
            {
               this.xuantiejianfaButton.parent.removeChild(this.xuantiejianfaButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objXuanTieJianFa);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function set_ChangShengJue(param1:Array) : void
      {
         this.changshengjue.set_ChangShengJue(param1);
      }
      
      public function showchangshengjue() : void
      {
         this.initCharPanel(2,"32");
      }
      
      public function setChangShengJueInit(param1:ChangShengJueVO) : void
      {
         this.changshengjue.setinitilizeUI(false,param1);
      }
      
      public function setChangShengJueEnableFun() : void
      {
         this.changshengjue.setEnableFun();
      }
      
      public function permitChangShengJue(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.changshengjueButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.changshengjue,0);
            this.changshengjueButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.changshengjueButton);
            this.objChangShengJue = new Object();
            this.objChangShengJue.neirong = this.changshengjue;
            this.objChangShengJue.biaoqian = this.changshengjueButton;
            this.objChangShengJue.name = "32";
            this.objChangShengJue.isShow = true;
            this.objChangShengJue.dengji = -1;
            this.btnArray2.push(this.objChangShengJue);
         }
         else if(!param1 && this.changshengjueButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.changshengjue != null && this.changshengjue.parent != null)
            {
               this.changshengjue.parent.removeChild(this.changshengjue);
            }
            this.changshengjueButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.changshengjueButton != null && this.changshengjueButton.parent != null)
            {
               this.changshengjueButton.parent.removeChild(this.changshengjueButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objChangShengJue);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showWanHunZhen() : void
      {
         this.initCharPanel(4,"27");
      }
      
      public function setWanHunZhenInit(param1:WanHunZhenVO) : void
      {
         this.wanhunzhen.setinitilizeUI(false,param1);
      }
      
      public function setWanHunZhenEnableFun() : void
      {
         this.wanhunzhen.setEnableFun();
      }
      
      public function permitWanHunZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.wanhunzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.wanhunzhen,0);
            this.wanhunzhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.wanhunzhenButton);
            this.objWanHunZhen = new Object();
            this.objWanHunZhen.neirong = this.wanhunzhen;
            this.objWanHunZhen.biaoqian = this.wanhunzhenButton;
            this.objWanHunZhen.name = "27";
            this.objWanHunZhen.isShow = true;
            this.objWanHunZhen.dengji = -1;
            this.btnArray4.push(this.objWanHunZhen);
         }
         else if(!param1 && this.wanhunzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.wanhunzhen != null && this.wanhunzhen.parent != null)
            {
               this.wanhunzhen.parent.removeChild(this.wanhunzhen);
            }
            this.wanhunzhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.wanhunzhenButton != null && this.wanhunzhenButton.parent != null)
            {
               this.wanhunzhenButton.parent.removeChild(this.wanhunzhenButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objWanHunZhen);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showZhenYanShouYin() : void
      {
         this.initCharPanel(2,"33");
      }
      
      public function setZhenYanShouYinInit(param1:int, param2:String, param3:int, param4:int, param5:int, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number, param11:Array) : void
      {
         this.zhenyanshouyin.setData(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public function setExp(param1:int, param2:int, param3:int) : void
      {
         this.zhenyanshouyin.setExp(param1,param2,param3);
      }
      
      public function setZhenYanShouYinEnableFun() : void
      {
         this.zhenyanshouyin.setEnableFun();
      }
      
      public function permitZhenYanShouYin(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.zhenyanshouyinButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.zhenyanshouyin,0);
            this.zhenyanshouyinButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.zhenyanshouyinButton);
            this.zhenyanshouyinObj = new Object();
            this.zhenyanshouyinObj.neirong = this.zhenyanshouyin;
            this.zhenyanshouyinObj.biaoqian = this.zhenyanshouyinButton;
            this.zhenyanshouyinObj.name = "33";
            this.zhenyanshouyinObj.isShow = true;
            this.zhenyanshouyinObj.dengji = -1;
            this.btnArray2.push(this.zhenyanshouyinObj);
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
         }
         else if(!param1 && this.zhenyanshouyinButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.zhenyanshouyin != null && this.zhenyanshouyin.parent != null)
            {
               this.zhenyanshouyin.parent.removeChild(this.zhenyanshouyin);
            }
            this.zhenyanshouyinButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.zhenyanshouyinButton != null && this.zhenyanshouyinButton.parent != null)
            {
               this.zhenyanshouyinButton.parent.removeChild(this.zhenyanshouyinButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.zhenyanshouyinObj);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
         }
         this.setIsShowBiaoqian(param2);
      }
      
      public function showWoDeMenPai() : void
      {
         this.initCharPanel(6,"1");
      }
      
      public function setWoDeMenPaiInit(param1:MenPai) : void
      {
         this.woDeMenPai.setWoDeMenPaiInit(false,param1);
      }
      
      public function setWoDeMenPaiAvatar(param1:BitmapData) : void
      {
         this.woDeMenPai.avatar = param1;
      }
      
      public function setWoDeMenPaiEnableFun() : void
      {
         this.woDeMenPai.setEnableFun();
      }
      
      public function removeDisplayObject(param1:DisplayObject) : void
      {
         if(param1 != null && param1.parent != null)
         {
            param1.parent.removeChild(param1);
         }
      }
      
      public function setLayout(param1:Boolean) : void
      {
         this.charContainer.setLayout(param1);
         if(!param1)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("角色"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("功法"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("兵器"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("阵法"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("传奇"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("门派"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("我的荣誉"),this.onTabClick);
            this.permitCangBaoGe(true);
            this.permitXunzhangzhanshi(false);
         }
         else
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("角色"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("功法"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("兵器"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("阵法"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("传奇"),this.onTabClick);
            this.permitCangBaoGe(true);
            this.permitXunzhangzhanshi(false);
         }
      }
      
      public function setDiZiData(param1:String, param2:String, param3:int) : void
      {
         this.charContainer.setDiZiData(param1,param2,param3);
      }
      
      public function showWoDeRongYu() : void
      {
         this.initCharPanel(7,"1");
      }
      
      public function setWoDeRongYuInit(param1:Object, param2:Array) : void
      {
         this.woderongyu.setinitilizeUI(param1,param2);
      }
      
      public function setWoDeRongYuEnableFun(param1:Boolean) : void
      {
         this.woderongyu.setEnableFun(param1);
      }
      
      public function showZhenLongQiJu() : void
      {
         this.initCharPanel(4,"28");
      }
      
      public function setZhenLongQiJuInit(param1:ZhenLongQiJuVO) : void
      {
         this.zhenlongqiju.setinitilizeUI(false,param1);
      }
      
      public function setZhenLongQiJuEnableFun() : void
      {
         this.zhenlongqiju.setEnableFun();
      }
      
      public function permitZhenLongQiJu(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.zhenlongqijuButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.zhenlongqiju,0);
            this.zhenlongqijuButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.zhenlongqijuButton);
            this.objZhenLongQiJu = new Object();
            this.objZhenLongQiJu.neirong = this.zhenlongqiju;
            this.objZhenLongQiJu.biaoqian = this.zhenlongqijuButton;
            this.objZhenLongQiJu.name = "28";
            this.objZhenLongQiJu.isShow = true;
            this.objZhenLongQiJu.dengji = -1;
            this.btnArray4.push(this.objZhenLongQiJu);
            this.initCharPanel(4,"28");
         }
         else if(!param1 && this.zhenlongqijuButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.zhenlongqiju != null && this.zhenlongqiju.parent != null)
            {
               this.zhenlongqiju.parent.removeChild(this.zhenlongqiju);
            }
            this.zhenlongqijuButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.zhenlongqijuButton != null && this.zhenlongqijuButton.parent != null)
            {
               this.zhenlongqijuButton.parent.removeChild(this.zhenlongqijuButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objZhenLongQiJu);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
         }
         this.setIsShowBiaoqian(param2);
      }
      
      public function showShengSiFu() : void
      {
         this.initCharPanel(2,"34");
      }
      
      public function setShengSiFuInit(param1:ShengSiFuVO) : void
      {
         this.shengsifu.setinitilizeUI(false,param1);
      }
      
      public function setShengSiFuEnableFun() : void
      {
         this.shengsifu.setEnableFun();
      }
      
      public function permitShengSiFu(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.shengsifuButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.shengsifu,0);
            this.shengsifuButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.shengsifuButton);
            this.objShengSiFu = new Object();
            this.objShengSiFu.neirong = this.shengsifu;
            this.objShengSiFu.biaoqian = this.shengsifuButton;
            this.objShengSiFu.name = "34";
            this.objShengSiFu.isShow = true;
            this.objShengSiFu.dengji = -1;
            this.btnArray2.push(this.objShengSiFu);
         }
         else if(!param1 && this.shengsifuButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.shengsifu != null && this.shengsifu.parent != null)
            {
               this.shengsifu.parent.removeChild(this.shengsifu);
            }
            this.shengsifuButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.shengsifuButton != null && this.shengsifuButton.parent != null)
            {
               this.shengsifuButton.parent.removeChild(this.shengsifuButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objShengSiFu);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showTaoHuaZhen() : void
      {
         this.initCharPanel(4,"29");
      }
      
      public function setTaoHuaZhenInit(param1:TaoHuaZhenVO) : void
      {
         this.taohuazhen.setinitilizeUI(false,param1);
      }
      
      public function setTaoHuaZhenEnableFun() : void
      {
         this.taohuazhen.setEnableFun();
      }
      
      public function permitTaoHuaZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.taohuazhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.taohuazhen,0);
            this.taohuazhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.taohuazhenButton);
            this.objTaoHuaZhen = new Object();
            this.objTaoHuaZhen.neirong = this.taohuazhen;
            this.objTaoHuaZhen.biaoqian = this.taohuazhenButton;
            this.objTaoHuaZhen.name = "29";
            this.objTaoHuaZhen.isShow = true;
            this.objTaoHuaZhen.dengji = -1;
            this.btnArray4.push(this.objTaoHuaZhen);
            this.initCharPanel(4,"29");
         }
         else if(!param1 && this.taohuazhenButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.taohuazhen != null && this.taohuazhen.parent != null)
            {
               this.taohuazhen.parent.removeChild(this.taohuazhen);
            }
            this.taohuazhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.taohuazhenButton != null && this.taohuazhenButton.parent != null)
            {
               this.taohuazhenButton.parent.removeChild(this.taohuazhenButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objTaoHuaZhen);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
         }
         this.setIsShowBiaoqian(param2);
      }
      
      public function permitXiaKeXing(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.xiakexingButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.xiakexing,0);
            this.xiakexingButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer5.addChild(this.xiakexingButton);
            this.objXiaKeXing = new Object();
            this.objXiaKeXing.neirong = this.xiakexing;
            this.objXiaKeXing.biaoqian = this.xiakexingButton;
            this.objXiaKeXing.eventType = XIAKEXING;
            this.objXiaKeXing.name = "4";
            this.objXiaKeXing.isShow = true;
            this.objXiaKeXing.dengji = -1;
            this.btnArray5.push(this.objXiaKeXing);
         }
         else if(!param1 && this.xiakexingButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.xiakexing != null && this.xiakexing.parent != null)
            {
               this.xiakexing.parent.removeChild(this.xiakexing);
            }
            this.xiakexingButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.xiakexingButton != null && this.xiakexingButton.parent != null)
            {
               this.xiakexingButton.parent.removeChild(this.xiakexingButton);
            }
            _loc3_ = this.btnArray5.indexOf(this.objXiaKeXing);
            if(_loc3_ >= 0)
            {
               this.btnArray5.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showXiaKeXing() : void
      {
         this.initCharPanel(5,"4");
      }
      
      public function setXiaKeXingInit(param1:XiaKeXingVO, param2:Array) : void
      {
         this.xiakexing.setinitilizeUI(false,param1,param2);
      }
      
      public function setXiaKeXingEnableFun() : void
      {
         this.xiakexing.setEnableFun();
      }
      
      public function permitMoLingZhiYi(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.molingzhiyiButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.molingzhiyi,0);
            this.molingzhiyiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.molingzhiyiButton);
            this.objMoLingZhiYi = new Object();
            this.objMoLingZhiYi.neirong = this.molingzhiyi;
            this.objMoLingZhiYi.biaoqian = this.molingzhiyiButton;
            this.objMoLingZhiYi.name = "13";
            this.objMoLingZhiYi.isShow = true;
            this.objMoLingZhiYi.dengji = -1;
            this.btnArray3.push(this.objMoLingZhiYi);
         }
         else if(!param1 && this.molingzhiyiButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.molingzhiyi != null && this.molingzhiyi.parent != null)
            {
               this.molingzhiyi.parent.removeChild(this.molingzhiyi);
            }
            this.molingzhiyiButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.molingzhiyiButton != null && this.molingzhiyiButton.parent != null)
            {
               this.molingzhiyiButton.parent.removeChild(this.molingzhiyiButton);
            }
            _loc3_ = this.btnArray3.indexOf(this.objMoLingZhiYi);
            if(_loc3_ >= 0)
            {
               this.btnArray3.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showMoLingZhiYi() : void
      {
         this.initCharPanel(3,"13");
      }
      
      public function setYunInitializeMoLingZhiYi(param1:MoLingZhiYiVO) : void
      {
         this.molingzhiyi.setInitialize(param1,false);
      }
      
      public function MoLingZhiYiShow(param1:Boolean) : void
      {
         this.molingzhiyi.showMoLingZhiYi(param1);
      }
      
      public function setMoLingZhiYiEnabledFun() : void
      {
         this.molingzhiyi.setEnableFun();
      }
      
      public function setMoLingZhiYiJiHuo(param1:Boolean) : void
      {
         this.molingzhiyi.setJiHuo(param1);
      }
      
      public function set_FuMoZhangFa(param1:Array) : void
      {
         this.fumozhangfa.set_FuMoZhangFa(param1);
      }
      
      public function showFuMoZhangFa() : void
      {
         this.initCharPanel(2,"35");
      }
      
      public function setFuMoZhangFaInit(param1:FuMoZhangFaVO) : void
      {
         this.fumozhangfa.setinitilizeUI(false,param1);
      }
      
      public function setFuMoZhangFaEnableFun() : void
      {
         this.fumozhangfa.setEnableFun();
      }
      
      public function permitFuMoZhangFa(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.fumozhangfaButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.fumozhangfa,0);
            this.fumozhangfaButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.fumozhangfaButton);
            this.objFuMoZhangFa = new Object();
            this.objFuMoZhangFa.neirong = this.fumozhangfa;
            this.objFuMoZhangFa.biaoqian = this.fumozhangfaButton;
            this.objFuMoZhangFa.name = "35";
            this.objFuMoZhangFa.isShow = true;
            this.objFuMoZhangFa.dengji = -1;
            this.btnArray2.push(this.objFuMoZhangFa);
         }
         else if(!param1 && this.fumozhangfaButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.fumozhangfa != null && this.fumozhangfa.parent != null)
            {
               this.fumozhangfa.parent.removeChild(this.fumozhangfa);
            }
            this.fumozhangfaButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.fumozhangfaButton != null && this.fumozhangfaButton.parent != null)
            {
               this.fumozhangfaButton.parent.removeChild(this.fumozhangfaButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objFuMoZhangFa);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showYuNvSuXinJianFa() : void
      {
         this.initCharPanel(2,"36");
      }
      
      public function setYuNvSuXinJianFaInit(param1:YuNvSuXinJianFaVO) : void
      {
         this.yunvsuxinjianfa.setinitilizeUI(false,param1);
      }
      
      public function setYuNvSuXinJianFaEnableFun() : void
      {
         this.yunvsuxinjianfa.setEnableFun();
      }
      
      public function permitYuNvSuXinJianFa(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.yunvsuxinjianfaButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.yunvsuxinjianfa,0);
            this.yunvsuxinjianfaButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.yunvsuxinjianfaButton);
            this.objYuNvSuXinJianFa = new Object();
            this.objYuNvSuXinJianFa.neirong = this.yunvsuxinjianfa;
            this.objYuNvSuXinJianFa.biaoqian = this.yunvsuxinjianfaButton;
            this.objYuNvSuXinJianFa.name = "36";
            this.objYuNvSuXinJianFa.isShow = true;
            this.objYuNvSuXinJianFa.dengji = -1;
            this.btnArray2.push(this.objYuNvSuXinJianFa);
         }
         else if(!param1 && this.yunvsuxinjianfaButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.yunvsuxinjianfa != null && this.yunvsuxinjianfa.parent != null)
            {
               this.yunvsuxinjianfa.parent.removeChild(this.yunvsuxinjianfa);
            }
            this.yunvsuxinjianfaButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.yunvsuxinjianfaButton != null && this.yunvsuxinjianfaButton.parent != null)
            {
               this.yunvsuxinjianfaButton.parent.removeChild(this.yunvsuxinjianfaButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objYuNvSuXinJianFa);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function permitLieKongJueXing(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.liekongjuexingButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.liekongjuexing,0);
            this.liekongjuexingButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.liekongjuexingButton);
            this.objLieKongJueXing = new Object();
            this.objLieKongJueXing.neirong = this.liekongjuexing;
            this.objLieKongJueXing.biaoqian = this.liekongjuexingButton;
            this.objLieKongJueXing.name = "14";
            this.objLieKongJueXing.isShow = true;
            this.objLieKongJueXing.dengji = -1;
            this.btnArray3.push(this.objLieKongJueXing);
         }
         else if(!param1 && this.liekongjuexingButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.liekongjuexing != null && this.liekongjuexing.parent != null)
            {
               this.liekongjuexing.parent.removeChild(this.liekongjuexing);
            }
            this.liekongjuexingButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.liekongjuexingButton != null && this.liekongjuexingButton.parent != null)
            {
               this.liekongjuexingButton.parent.removeChild(this.liekongjuexingButton);
            }
            _loc3_ = this.btnArray3.indexOf(this.objLieKongJueXing);
            if(_loc3_ >= 0)
            {
               this.btnArray3.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showLieKongJueXing() : void
      {
         this.initCharPanel(3,"14");
      }
      
      public function setLieKongJueXingInit(param1:LieKongJueXingVO) : void
      {
         this.liekongjuexing.setinitilizeUI(false,param1);
      }
      
      public function setLieKongJueXingEnableFun() : void
      {
         this.liekongjuexing.setEnableFun();
      }
      
      public function showTianYuYanMeng() : void
      {
         this.initCharPanel(4,"30");
      }
      
      public function setTianYuYanMengInit(param1:TianYuYanMengVO) : void
      {
         this.tianyuyanmeng.setinitilizeUI(false,param1);
      }
      
      public function setTianYuYanMengEnableFun() : void
      {
         this.tianyuyanmeng.setEnableFun();
      }
      
      public function permitTianYuYanMeng(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.tianyuyanmengButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.tianyuyanmeng,0);
            this.tianyuyanmengButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.tianyuyanmengButton);
            this.objTianYuYanMeng = new Object();
            this.objTianYuYanMeng.neirong = this.tianyuyanmeng;
            this.objTianYuYanMeng.biaoqian = this.tianyuyanmengButton;
            this.objTianYuYanMeng.name = "30";
            this.objTianYuYanMeng.isShow = true;
            this.objTianYuYanMeng.dengji = -1;
            this.btnArray4.push(this.objTianYuYanMeng);
         }
         else if(!param1 && this.tianyuyanmengButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.tianyuyanmeng != null && this.tianyuyanmeng.parent != null)
            {
               this.tianyuyanmeng.parent.removeChild(this.tianyuyanmeng);
            }
            this.tianyuyanmengButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.tianyuyanmengButton != null && this.tianyuyanmengButton.parent != null)
            {
               this.tianyuyanmengButton.parent.removeChild(this.tianyuyanmengButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objTianYuYanMeng);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showTianShanLiuYangZhang() : void
      {
         this.initCharPanel(2,"37");
      }
      
      public function setTianShanLiuYangZhangAvatar(param1:BitmapData) : void
      {
         this.tianshanliuyangzhang.avatar = param1;
      }
      
      public function setTianShanLiuYangZhangInit(param1:TianShanLiuYangZhangVo) : void
      {
         this.tianshanliuyangzhang.setinitilizeUI(false,param1);
      }
      
      public function setTianShanLiuYangZhangEnableFun() : void
      {
         this.tianshanliuyangzhang.setEnableFun();
      }
      
      public function permitTianShanLiuYangZhang(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.tianshanliuyangzhangButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.tianshanliuyangzhang,0);
            this.tianshanliuyangzhangButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.tianshanliuyangzhangButton);
            this.objTianShanLiuYangZhang = new Object();
            this.objTianShanLiuYangZhang.neirong = this.tianshanliuyangzhang;
            this.objTianShanLiuYangZhang.biaoqian = this.tianshanliuyangzhangButton;
            this.objTianShanLiuYangZhang.name = "37";
            this.objTianShanLiuYangZhang.isShow = true;
            this.objTianShanLiuYangZhang.dengji = -1;
            this.btnArray2.push(this.objTianShanLiuYangZhang);
         }
         else if(!param1 && this.tianshanliuyangzhangButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.tianshanliuyangzhang != null && this.tianshanliuyangzhang.parent != null)
            {
               this.tianshanliuyangzhang.parent.removeChild(this.tianshanliuyangzhang);
            }
            this.tianshanliuyangzhangButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.tianshanliuyangzhangButton != null && this.tianshanliuyangzhangButton.parent != null)
            {
               this.tianshanliuyangzhangButton.parent.removeChild(this.tianshanliuyangzhangButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objTianShanLiuYangZhang);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function set_AoJianShenJiangJi(param1:Array) : void
      {
         this.aojianshenjiangji.set_AoJianShenJiangXunZhang(param1);
      }
      
      public function set_MingJiaoZhangWuJi(param1:Array) : void
      {
         this.aojianshenjiangji.set_MingJiaoZhangWuJi(param1);
      }
      
      public function permitAoJianShenJiangJi(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.aojianshenjiangjiButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.aojianshenjiangji,0);
            this.aojianshenjiangjiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.aojianshenjiangjiButton);
            this.objAoJianShenJiangJi = new Object();
            this.objAoJianShenJiangJi.neirong = this.aojianshenjiangji;
            this.objAoJianShenJiangJi.biaoqian = this.aojianshenjiangjiButton;
            this.objAoJianShenJiangJi.name = "15";
            this.objAoJianShenJiangJi.isShow = true;
            this.objAoJianShenJiangJi.dengji = -1;
            this.btnArray3.push(this.objAoJianShenJiangJi);
         }
         else if(!param1 && this.aojianshenjiangjiButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.aojianshenjiangji != null && this.aojianshenjiangji.parent != null)
            {
               this.aojianshenjiangji.parent.removeChild(this.aojianshenjiangji);
            }
            this.aojianshenjiangjiButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.aojianshenjiangjiButton != null && this.aojianshenjiangjiButton.parent != null)
            {
               this.aojianshenjiangjiButton.parent.removeChild(this.aojianshenjiangjiButton);
            }
            _loc3_ = this.btnArray3.indexOf(this.objAoJianShenJiangJi);
            if(_loc3_ >= 0)
            {
               this.btnArray3.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showAoJianShenJiangJi() : void
      {
         this.initCharPanel(3,"15");
      }
      
      public function setAoJianShenJiangJiInit(param1:AoJianShenJiangJiVO) : void
      {
         this.aojianshenjiangji.setinitilizeUI(false,param1);
      }
      
      public function setAoJianShenJiangJiEnableFun() : void
      {
         this.aojianshenjiangji.setEnableFun();
      }
      
      public function permitWuxiakapai(param1:Boolean) : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:int = 0;
         if(param1 && !this.wuxiakapaiButton.hasEventListener(MouseEvent.CLICK))
         {
            this.wuxiakapaiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.wuxiakapaiButton);
            _loc2_ = new Sprite();
            this.wuxiakapaiObj = new Object();
            this.wuxiakapaiObj.neirong = _loc2_;
            this.wuxiakapaiObj.biaoqian = this.wuxiakapaiButton;
            this.wuxiakapaiObj.name = "16";
            this.wuxiakapaiObj.isShow = true;
            this.wuxiakapaiObj.dengji = -1;
            this.btnArray1.push(this.wuxiakapaiObj);
            this.initCharPanel(1,"16");
         }
         else if(!param1 && this.wuxiakapaiButton.hasEventListener(MouseEvent.CLICK))
         {
            this.wuxiakapaiButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.wuxiakapaiButton != null && this.wuxiakapaiButton.parent != null)
            {
               this.wuxiakapaiButton.parent.removeChild(this.wuxiakapaiButton);
            }
            _loc3_ = this.btnArray1.indexOf(this.wuxiakapaiObj);
            if(_loc3_ >= 0)
            {
               this.btnArray1.splice(_loc3_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showDuoMingShiSanJian() : void
      {
         this.initCharPanel(2,"38");
      }
      
      public function setDuoMingShiSanJianInit(param1:DuoMingShiSanJianVo) : void
      {
         this.duomingshisanjian.setinitilizeUI(false,param1);
      }
      
      public function setDuoMingShiSanJianEnableFun() : void
      {
         this.duomingshisanjian.setEnableFun();
      }
      
      public function permitDuoMingShiSanJian(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.duomingshisanjianButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.duomingshisanjian,0);
            this.duomingshisanjianButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.duomingshisanjianButton);
            this.objDuoMingShiSanJian = new Object();
            this.objDuoMingShiSanJian.neirong = this.duomingshisanjian;
            this.objDuoMingShiSanJian.biaoqian = this.duomingshisanjianButton;
            this.objDuoMingShiSanJian.name = "38";
            this.objDuoMingShiSanJian.isShow = true;
            this.objDuoMingShiSanJian.dengji = -1;
            this.btnArray2.push(this.objDuoMingShiSanJian);
         }
         else if(!param1 && this.duomingshisanjianButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.duomingshisanjian != null && this.duomingshisanjian.parent != null)
            {
               this.duomingshisanjian.parent.removeChild(this.duomingshisanjian);
            }
            this.duomingshisanjianButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.duomingshisanjianButton != null && this.duomingshisanjianButton.parent != null)
            {
               this.duomingshisanjianButton.parent.removeChild(this.duomingshisanjianButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objDuoMingShiSanJian);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function permitRijinlun(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.rijinlunButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.rijinlun,0);
            this.rijinlunButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.rijinlunButton);
            this.objRijinlun = new Object();
            this.objRijinlun.neirong = this.rijinlun;
            this.objRijinlun.biaoqian = this.rijinlunButton;
            this.objRijinlun.name = "16";
            this.objRijinlun.isShow = true;
            this.objRijinlun.dengji = -1;
            this.btnArray3.push(this.objRijinlun);
            this.initCharPanel(3,"16");
         }
         else if(!param1 && this.rijinlunButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.rijinlun != null && this.rijinlun.parent != null)
            {
               this.rijinlun.parent.removeChild(this.rijinlun);
            }
            this.rijinlunButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.rijinlunButton != null && this.rijinlunButton.parent != null)
            {
               this.rijinlunButton.parent.removeChild(this.rijinlunButton);
            }
            _loc3_ = this.btnArray3.indexOf(this.objRijinlun);
            if(_loc3_ >= 0)
            {
               this.btnArray3.splice(_loc3_,1);
            }
         }
         this.setIsShowBiaoqian(param2);
      }
      
      public function requestShowRijinlun() : void
      {
         dispatchEvent(new BaseEvent(RIJINLUN));
      }
      
      public function showRijinlun() : void
      {
         this.initCharPanel(3,"16");
      }
      
      public function setRijinlunInitialize(param1:int, param2:int, param3:int, param4:String, param5:String, param6:String, param7:int, param8:String) : void
      {
         this.rijinlun.setData(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function showKongMingQuan() : void
      {
         this.initCharPanel(2,"39");
      }
      
      public function setKongMingQuanInit(param1:KongMingQuanVo) : void
      {
         this.kongmingquan.setinitilizeUI(false,param1);
      }
      
      public function setKongMingQuanEnableFun() : void
      {
         this.kongmingquan.setEnableFun();
      }
      
      public function permitKongMingQuan(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.kongmingquanButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.kongmingquan,0);
            this.kongmingquanButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.kongmingquanButton);
            this.objKongMingQuan = new Object();
            this.objKongMingQuan.neirong = this.kongmingquan;
            this.objKongMingQuan.biaoqian = this.kongmingquanButton;
            this.objKongMingQuan.name = "39";
            this.objKongMingQuan.isShow = true;
            this.objKongMingQuan.dengji = -1;
            this.btnArray2.push(this.objKongMingQuan);
         }
         else if(!param1 && this.kongmingquanButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.kongmingquan != null && this.kongmingquan.parent != null)
            {
               this.kongmingquan.parent.removeChild(this.kongmingquan);
            }
            this.kongmingquanButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.kongmingquanButton != null && this.kongmingquanButton.parent != null)
            {
               this.kongmingquanButton.parent.removeChild(this.kongmingquanButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objKongMingQuan);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function set_XueYinJueXing(param1:Array) : void
      {
         this.xueyinjuexing.set_XueYinJueXing(param1);
      }
      
      public function permitXueYinJueXing(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.xueyinjuexingButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.xueyinjuexing,0);
            this.xueyinjuexingButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.xueyinjuexingButton);
            this.objXueYinJueXing = new Object();
            this.objXueYinJueXing.neirong = this.xueyinjuexing;
            this.objXueYinJueXing.biaoqian = this.xueyinjuexingButton;
            this.objXueYinJueXing.name = "17";
            this.objXueYinJueXing.isShow = true;
            this.objXueYinJueXing.dengji = -1;
            this.btnArray3.push(this.objXueYinJueXing);
         }
         else if(!param1 && this.xueyinjuexingButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.xueyinjuexing != null && this.xueyinjuexing.parent != null)
            {
               this.xueyinjuexing.parent.removeChild(this.xueyinjuexing);
            }
            this.xueyinjuexingButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.xueyinjuexingButton != null && this.xueyinjuexingButton.parent != null)
            {
               this.xueyinjuexingButton.parent.removeChild(this.xueyinjuexingButton);
            }
            _loc3_ = this.btnArray3.indexOf(this.objXueYinJueXing);
            if(_loc3_ >= 0)
            {
               this.btnArray3.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showXueYinJueXing() : void
      {
         this.initCharPanel(3,"17");
      }
      
      public function setXueYinJueXingInit(param1:XueYinJueXingVO) : void
      {
         this.xueyinjuexing.setinitilizeUI(false,param1);
      }
      
      public function setXueYinJueXingEnableFun() : void
      {
         this.xueyinjuexing.setEnableFun();
      }
      
      public function set_HuaShanLunJian(param1:Array) : void
      {
         this.huashanlunjian.set_HuaShanLunJian(param1);
      }
      
      public function showHuashanlunjian() : void
      {
         this.initCharPanel(5,"5");
      }
      
      public function setHuashanlunjianInit(param1:int, param2:Object, param3:int, param4:int, param5:String, param6:String, param7:String) : void
      {
         this.huashanlunjian.setInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setHuashanlunjianEnableFun() : void
      {
         this.huashanlunjian.setEnableFun();
      }
      
      public function permitHuashanlunjian(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.huashanlunjianButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.huashanlunjian,0);
            this.huashanlunjianButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer5.addChild(this.huashanlunjianButton);
            this.huashanlunjianObj = new Object();
            this.huashanlunjianObj.neirong = this.huashanlunjian;
            this.huashanlunjianObj.biaoqian = this.huashanlunjianButton;
            this.huashanlunjianObj.eventType = HUASHANLUNJIAN;
            this.huashanlunjianObj.name = "5";
            this.huashanlunjianObj.isShow = true;
            this.huashanlunjianObj.dengji = -1;
            this.btnArray5.push(this.huashanlunjianObj);
         }
         else if(!param1 && this.huashanlunjianButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.huashanlunjian != null && this.huashanlunjian.parent != null)
            {
               this.huashanlunjian.parent.removeChild(this.huashanlunjian);
            }
            this.huashanlunjianButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.huashanlunjianButton != null && this.huashanlunjianButton.parent != null)
            {
               this.huashanlunjianButton.parent.removeChild(this.huashanlunjianButton);
            }
            _loc3_ = this.btnArray5.indexOf(this.huashanlunjianObj);
            if(_loc3_ >= 0)
            {
               this.btnArray5.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function set_HanBingShenZhang(param1:Array) : void
      {
         this.hanbingshenzhang.set_HanBingShenZhang(param1);
      }
      
      public function showHanBingShenZhang() : void
      {
         this.initCharPanel(2,"40");
      }
      
      public function setHanBingShenZhangInit(param1:HanBingShenZhangVo) : void
      {
         this.hanbingshenzhang.setinitilizeUI(false,param1);
      }
      
      public function setHanBingShenZhangEnableFun() : void
      {
         this.hanbingshenzhang.setEnableFun();
      }
      
      public function permitHanBingShenZhang(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.hanbingshenzhangButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.hanbingshenzhang,0);
            this.hanbingshenzhangButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.hanbingshenzhangButton);
            this.objHanBingShenZhang = new Object();
            this.objHanBingShenZhang.neirong = this.hanbingshenzhang;
            this.objHanBingShenZhang.biaoqian = this.hanbingshenzhangButton;
            this.objHanBingShenZhang.name = "40";
            this.objHanBingShenZhang.isShow = true;
            this.objHanBingShenZhang.dengji = -1;
            this.btnArray2.push(this.objHanBingShenZhang);
         }
         else if(!param1 && this.hanbingshenzhangButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.hanbingshenzhang != null && this.hanbingshenzhang.parent != null)
            {
               this.hanbingshenzhang.parent.removeChild(this.hanbingshenzhang);
            }
            this.hanbingshenzhangButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.hanbingshenzhangButton != null && this.hanbingshenzhangButton.parent != null)
            {
               this.hanbingshenzhangButton.parent.removeChild(this.hanbingshenzhangButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objHanBingShenZhang);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function permitYuejinlun(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.yuejinlunButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.yuejinlun,0);
            this.yuejinlunButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.yuejinlunButton);
            this.objYuejinlun = new Object();
            this.objYuejinlun.neirong = this.yuejinlun;
            this.objYuejinlun.biaoqian = this.yuejinlunButton;
            this.objYuejinlun.name = "18";
            this.objYuejinlun.isShow = true;
            this.objYuejinlun.dengji = -1;
            this.btnArray3.push(this.objYuejinlun);
            this.initCharPanel(3,"18");
         }
         else if(!param1 && this.yuejinlunButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.yuejinlun != null && this.yuejinlun.parent != null)
            {
               this.yuejinlun.parent.removeChild(this.yuejinlun);
            }
            this.yuejinlunButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.yuejinlunButton != null && this.yuejinlunButton.parent != null)
            {
               this.yuejinlunButton.parent.removeChild(this.yuejinlunButton);
            }
            _loc3_ = this.btnArray3.indexOf(this.objYuejinlun);
            if(_loc3_ >= 0)
            {
               this.btnArray3.splice(_loc3_,1);
            }
         }
         this.setIsShowBiaoqian(param2);
      }
      
      public function showYuejinlun() : void
      {
         this.initCharPanel(3,"18");
      }
      
      public function setYuejinlunInitialize(param1:int, param2:int, param3:int, param4:String, param5:String, param6:String, param7:int, param8:String) : void
      {
         this.yuejinlun.setData(false,param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function set_LingXiYiZhi(param1:Array) : void
      {
         this.lingxiyizhi.set_LingXiYiZhi(param1);
      }
      
      public function showLingXiYiZhi() : void
      {
         this.initCharPanel(2,"41");
      }
      
      public function setLingXiYiZhiInit(param1:LingXiYiZhiVo) : void
      {
         this.lingxiyizhi.setinitilizeUI(false,param1);
      }
      
      public function setLingXiYiZhiEnableFun() : void
      {
         this.lingxiyizhi.setEnableFun();
      }
      
      public function permitLingXiYiZhi(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.lingxiyizhiButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.lingxiyizhi,0);
            this.lingxiyizhiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.lingxiyizhiButton);
            this.objLingXiYiZhi = new Object();
            this.objLingXiYiZhi.neirong = this.lingxiyizhi;
            this.objLingXiYiZhi.biaoqian = this.lingxiyizhiButton;
            this.objLingXiYiZhi.name = "41";
            this.objLingXiYiZhi.isShow = true;
            this.objLingXiYiZhi.dengji = -1;
            this.btnArray2.push(this.objLingXiYiZhi);
         }
         else if(!param1 && this.lingxiyizhiButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.lingxiyizhi != null && this.lingxiyizhi.parent != null)
            {
               this.lingxiyizhi.parent.removeChild(this.lingxiyizhi);
            }
            this.lingxiyizhiButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.lingxiyizhiButton != null && this.lingxiyizhiButton.parent != null)
            {
               this.lingxiyizhiButton.parent.removeChild(this.lingxiyizhiButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objLingXiYiZhi);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function permitCangBaoGe(param1:Boolean) : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:int = 0;
         if(param1 && !this.cangbaogeButton.hasEventListener(MouseEvent.CLICK))
         {
            this.cangbaogeButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.cangbaogeButton);
            _loc2_ = new Sprite();
            this.cangbaogeObj = new Object();
            this.cangbaogeObj.neirong = _loc2_;
            this.cangbaogeObj.biaoqian = this.cangbaogeButton;
            this.cangbaogeObj.name = "18";
            this.cangbaogeObj.isShow = true;
            this.cangbaogeObj.dengji = -1;
            this.btnArray1.push(this.cangbaogeObj);
            this.initCharPanel(1,"18");
         }
         else if(!param1 && this.cangbaogeButton.hasEventListener(MouseEvent.CLICK))
         {
            this.cangbaogeButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.cangbaogeButton != null && this.cangbaogeButton.parent != null)
            {
               this.cangbaogeButton.parent.removeChild(this.cangbaogeButton);
            }
            _loc3_ = this.btnArray1.indexOf(this.cangbaogeObj);
            if(_loc3_ >= 0)
            {
               this.btnArray1.splice(_loc3_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function permitXunzhangzhanshi(param1:Boolean) : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:int = 0;
         if(param1 && !this.xunzhangzhanshiButton.hasEventListener(MouseEvent.CLICK))
         {
            this.xunzhangzhanshiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.xunzhangzhanshiButton);
            _loc2_ = new Sprite();
            this.xunzhangzhanshiObj = new Object();
            this.xunzhangzhanshiObj.neirong = _loc2_;
            this.xunzhangzhanshiObj.biaoqian = this.xunzhangzhanshiButton;
            this.xunzhangzhanshiObj.name = "21";
            this.xunzhangzhanshiObj.isShow = true;
            this.xunzhangzhanshiObj.dengji = -1;
            this.btnArray1.push(this.xunzhangzhanshiObj);
            this.initCharPanel(1,"21");
         }
         else if(!param1 && this.xunzhangzhanshiButton.hasEventListener(MouseEvent.CLICK))
         {
            this.xunzhangzhanshiButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.xunzhangzhanshiButton != null && this.xunzhangzhanshiButton.parent != null)
            {
               this.xunzhangzhanshiButton.parent.removeChild(this.xunzhangzhanshiButton);
            }
            _loc3_ = this.btnArray1.indexOf(this.xunzhangzhanshiObj);
            if(_loc3_ >= 0)
            {
               this.btnArray1.splice(_loc3_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function set_YNliulongzhuangbei(param1:Array) : void
      {
         this.ynliulongzhuangbei.set_Equip(param1,false);
      }
      
      public function permitYNliulongzhuangbei(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.ynliulongzhuangbeiButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.ynliulongzhuangbei,0);
            this.ynliulongzhuangbeiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.ynliulongzhuangbeiButton);
            this.ynliulongzhuangbeiObj = new Object();
            this.ynliulongzhuangbeiObj.neirong = this.ynliulongzhuangbei;
            this.ynliulongzhuangbeiObj.biaoqian = this.ynliulongzhuangbeiButton;
            this.ynliulongzhuangbeiObj.name = "20";
            this.ynliulongzhuangbeiObj.isShow = true;
            this.ynliulongzhuangbeiObj.dengji = -1;
            this.btnArray1.push(this.ynliulongzhuangbeiObj);
            this.initCharPanel(1,"20");
         }
         else if(!param1 && this.ynliulongzhuangbeiButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.ynliulongzhuangbei != null && this.ynliulongzhuangbei.parent != null)
            {
               this.ynliulongzhuangbei.parent.removeChild(this.ynliulongzhuangbei);
            }
            this.ynliulongzhuangbeiButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.ynliulongzhuangbeiButton != null && this.ynliulongzhuangbeiButton.parent != null)
            {
               this.ynliulongzhuangbeiButton.parent.removeChild(this.ynliulongzhuangbeiButton);
            }
            _loc2_ = this.btnArray1.indexOf(this.ynliulongzhuangbeiObj);
            if(_loc2_ >= 0)
            {
               this.btnArray1.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showYNliulongzhuangbei() : void
      {
         this.initCharPanel(1,"20");
      }
      
      public function requestShowYNliulongzhuangbei() : void
      {
         dispatchEvent(new BaseEvent(LIULONGZHUANGBEI));
      }
      
      public function setYNliulongzhuangbei(param1:Array, param2:String, param3:String) : void
      {
         this.ynliulongzhuangbei.setData(param1,param2,param3,false);
      }
      
      public function permitYNJingLing(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.ynJingLingButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.ynJingLing,0);
            this.ynJingLingButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.ynJingLingButton);
            this.ynJingLingObj = new Object();
            this.ynJingLingObj.neirong = this.ynJingLing;
            this.ynJingLingObj.biaoqian = this.ynJingLingButton;
            this.ynJingLingObj.name = "21";
            this.ynJingLingObj.isShow = true;
            this.ynJingLingObj.dengji = -1;
            this.btnArray1.push(this.ynJingLingObj);
            this.initCharPanel(1,"21");
         }
         else if(!param1 && this.ynJingLingButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.ynJingLing != null && this.ynJingLing.parent != null)
            {
               this.ynJingLing.parent.removeChild(this.ynJingLing);
            }
            this.ynJingLingButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.ynJingLingButton != null && this.ynJingLingButton.parent != null)
            {
               this.ynJingLingButton.parent.removeChild(this.ynJingLingButton);
            }
            _loc2_ = this.btnArray1.indexOf(this.ynJingLingObj);
            if(_loc2_ >= 0)
            {
               this.btnArray1.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showYNJingLing() : void
      {
         this.initCharPanel(1,"21");
      }
      
      public function requestShowYNJingLing() : void
      {
         dispatchEvent(new BaseEvent(JINGLINGQIXUAN));
      }
      
      public function setYNJingLing(param1:Object) : void
      {
         this.ynJingLing.setData(param1);
      }
      
      public function set_GuiHun(param1:Array) : void
      {
      }
      
      public function permitYNGuiHun(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.ynGuiHunButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.ynGuiHun,0);
            this.ynGuiHunButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.ynGuiHunButton);
            this.ynGuiHunObj = new Object();
            this.ynGuiHunObj.neirong = this.ynGuiHun;
            this.ynGuiHunObj.biaoqian = this.ynGuiHunButton;
            this.ynGuiHunObj.name = "22";
            this.ynGuiHunObj.isShow = true;
            this.ynGuiHunObj.dengji = -1;
            this.btnArray1.push(this.ynGuiHunObj);
            this.initCharPanel(1,"22");
         }
         else if(!param1 && this.ynGuiHunButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.ynGuiHun != null && this.ynGuiHun.parent != null)
            {
               this.ynGuiHun.parent.removeChild(this.ynGuiHun);
            }
            this.ynGuiHunButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.ynGuiHunButton != null && this.ynGuiHunButton.parent != null)
            {
               this.ynGuiHunButton.parent.removeChild(this.ynGuiHunButton);
            }
            _loc2_ = this.btnArray1.indexOf(this.ynGuiHunObj);
            if(_loc2_ >= 0)
            {
               this.btnArray1.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showYNGuiHun() : void
      {
         this.initCharPanel(1,"22");
      }
      
      public function requestShowYNGuiHun() : void
      {
         dispatchEvent(new BaseEvent(GUIHUN));
      }
      
      public function setYNGuiHun(param1:Object) : void
      {
         this.ynGuiHun.setData(param1,false);
      }
      
      public function set_XingXiuZhen(param1:Array) : void
      {
         this.xingxiuzhen.set_XingXiuZhen(param1);
      }
      
      public function showXingXiuZhen() : void
      {
         this.initCharPanel(4,"31");
      }
      
      public function setXingXiuZhenInit(param1:XingXiuZhenVo) : void
      {
         this.xingxiuzhen.setinitilizeUI(false,param1);
      }
      
      public function setXingXiuZhenEnableFun() : void
      {
         this.xingxiuzhen.setEnableFun();
      }
      
      public function permitXingXiuZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.xingxiuzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.xingxiuzhen,0);
            this.xingxiuzhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.xingxiuzhenButton);
            this.objXingXiuZhen = new Object();
            this.objXingXiuZhen.neirong = this.xingxiuzhen;
            this.objXingXiuZhen.biaoqian = this.xingxiuzhenButton;
            this.objXingXiuZhen.name = "31";
            this.objXingXiuZhen.isShow = true;
            this.objXingXiuZhen.dengji = -1;
            this.btnArray4.push(this.objXingXiuZhen);
         }
         else if(!param1 && this.xingxiuzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.xingxiuzhen != null && this.xingxiuzhen.parent != null)
            {
               this.xingxiuzhen.parent.removeChild(this.xingxiuzhen);
            }
            this.xingxiuzhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.xingxiuzhenButton != null && this.xingxiuzhenButton.parent != null)
            {
               this.xingxiuzhenButton.parent.removeChild(this.xingxiuzhenButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objXingXiuZhen);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function set_XingXiuZhen1(param1:Array) : void
      {
         this.xingxiuzhen1.set_XingXiuZhen(param1);
      }
      
      public function showXingXiuZhen1() : void
      {
         this.initCharPanel(4,"35");
      }
      
      public function setXingXiuZhen1Init(param1:XingXiuZhen1Vo) : void
      {
         this.xingxiuzhen1.setinitilizeUI(false,param1);
      }
      
      public function setXingXiuZhen1EnableFun() : void
      {
         this.xingxiuzhen1.setEnableFun();
      }
      
      public function permitXingXiuZhen1(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.xingxiuzhen1Button.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.xingxiuzhen1,0);
            this.xingxiuzhen1Button.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.xingxiuzhen1Button);
            this.objXingXiuZhen1 = new Object();
            this.objXingXiuZhen1.neirong = this.xingxiuzhen1;
            this.objXingXiuZhen1.biaoqian = this.xingxiuzhen1Button;
            this.objXingXiuZhen1.name = "31";
            this.objXingXiuZhen1.isShow = true;
            this.objXingXiuZhen1.dengji = -1;
            this.btnArray4.push(this.objXingXiuZhen1);
         }
         else if(!param1 && this.xingxiuzhen1Button.hasEventListener(MouseEvent.CLICK))
         {
            if(this.xingxiuzhen1 != null && this.xingxiuzhen1.parent != null)
            {
               this.xingxiuzhen1.parent.removeChild(this.xingxiuzhen1);
            }
            this.xingxiuzhen1Button.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.xingxiuzhen1Button != null && this.xingxiuzhen1Button.parent != null)
            {
               this.xingxiuzhen1Button.parent.removeChild(this.xingxiuzhen1Button);
            }
            _loc3_ = this.btnArray4.indexOf(this.objXingXiuZhen1);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function set_QiShaZhen(param1:Array) : void
      {
         this.qishazhen.set_QiShaZhen(param1);
      }
      
      public function showQiShaZhen() : void
      {
         this.initCharPanel(4,"32");
      }
      
      public function setQiShaZhenInit(param1:QiShaZhenVo) : void
      {
         this.qishazhen.setinitilizeUI(false,param1);
      }
      
      public function setQiShaZhenEnableFun() : void
      {
         this.qishazhen.setEnableFun();
      }
      
      public function permitQiShaZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.qishazhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.qishazhen,0);
            this.qishazhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.qishazhenButton);
            this.objQiShaZhen = new Object();
            this.objQiShaZhen.neirong = this.qishazhen;
            this.objQiShaZhen.biaoqian = this.qishazhenButton;
            this.objQiShaZhen.name = "32";
            this.objQiShaZhen.isShow = true;
            this.objQiShaZhen.dengji = -1;
            this.btnArray4.push(this.objQiShaZhen);
         }
         else if(!param1 && this.qishazhenButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.qishazhen != null && this.qishazhen.parent != null)
            {
               this.qishazhen.parent.removeChild(this.qishazhen);
            }
            this.qishazhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.qishazhenButton != null && this.qishazhenButton.parent != null)
            {
               this.qishazhenButton.parent.removeChild(this.qishazhenButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objQiShaZhen);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showFuWenKeHua() : void
      {
         this.initCharPanel(4,"33");
      }
      
      public function setFuWenKeHuaEnableFun() : void
      {
         this.fuWenKeHua.setEnableFun();
      }
      
      public function permitFuWenKeHua(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.fuWenKeHuaButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.fuWenKeHua,0);
            this.fuWenKeHuaButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.fuWenKeHuaButton);
            this.objFuWenKeHua = new Object();
            this.objFuWenKeHua.neirong = this.fuWenKeHua;
            this.objFuWenKeHua.biaoqian = this.fuWenKeHuaButton;
            this.objFuWenKeHua.name = "33";
            this.objFuWenKeHua.isShow = true;
            this.objFuWenKeHua.dengji = 60;
            this.btnArray4.push(this.objFuWenKeHua);
         }
         else if(!param1 && this.fuWenKeHuaButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.fuWenKeHua != null && this.fuWenKeHua.parent != null)
            {
               this.fuWenKeHua.parent.removeChild(this.fuWenKeHua);
            }
            this.fuWenKeHuaButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.fuWenKeHuaButton != null && this.fuWenKeHuaButton.parent != null)
            {
               this.fuWenKeHuaButton.parent.removeChild(this.fuWenKeHuaButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objFuWenKeHua);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function initFuWenKeHuaPanel(param1:int, param2:int, param3:Array, param4:int, param5:int, param6:int) : void
      {
         this.fuWenKeHua.setinitilizeUI(false,param1,param2,param3,param4,param5,param6);
      }
      
      public function setFuWenData(param1:int, param2:int, param3:String, param4:String, param5:int, param6:Boolean, param7:Boolean, param8:int, param9:int = 0) : void
      {
         this.fuWenKeHua.setFuWenData(false,param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function set_LiangYiWeiChenZhen(param1:Array) : void
      {
         this.liangyiweichenzhen.set_LiangYiWeiChenZhen(param1);
      }
      
      public function showLiangYiWeiChenZhen() : void
      {
         this.initCharPanel(4,"34");
      }
      
      public function setLiangYiWeiChenZhenInit(param1:LiangYiWeiChenZhenVo) : void
      {
         this.liangyiweichenzhen.setinitilizeUI(false,param1);
      }
      
      public function setLiangYiWeiChenZhenEnableFun() : void
      {
         this.liangyiweichenzhen.setEnableFun();
      }
      
      public function permitLiangYiWeiChenZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.liangyiweichenzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.liangyiweichenzhen,0);
            this.liangyiweichenzhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.liangyiweichenzhenButton);
            this.objLiangYiWeiChenZhen = new Object();
            this.objLiangYiWeiChenZhen.neirong = this.liangyiweichenzhen;
            this.objLiangYiWeiChenZhen.biaoqian = this.liangyiweichenzhenButton;
            this.objLiangYiWeiChenZhen.name = "34";
            this.objLiangYiWeiChenZhen.isShow = true;
            this.objLiangYiWeiChenZhen.dengji = -1;
            this.btnArray4.push(this.objLiangYiWeiChenZhen);
         }
         else if(!param1 && this.liangyiweichenzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.liangyiweichenzhen != null && this.liangyiweichenzhen.parent != null)
            {
               this.liangyiweichenzhen.parent.removeChild(this.liangyiweichenzhen);
            }
            this.liangyiweichenzhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.liangyiweichenzhenButton != null && this.liangyiweichenzhenButton.parent != null)
            {
               this.liangyiweichenzhenButton.parent.removeChild(this.liangyiweichenzhenButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objLiangYiWeiChenZhen);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function set_SiJueJianZhen(param1:Array) : void
      {
         this.sijuejianzhen.set_SiJueJianZhen(param1);
      }
      
      public function showSiJueJianZhen() : void
      {
         this.initCharPanel(4,"36");
      }
      
      public function setSiJueJianZhenInit(param1:SiJueJianZhenVo) : void
      {
         this.sijuejianzhen.setinitilizeUI(false,param1);
      }
      
      public function setSiJueJianZhenEnableFun() : void
      {
         this.sijuejianzhen.setEnableFun();
      }
      
      public function permitSiJueJianZhen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.sijuejianzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.sijuejianzhen,0);
            this.sijuejianzhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.sijuejianzhenButton);
            this.objSiJueJianZhen = new Object();
            this.objSiJueJianZhen.neirong = this.sijuejianzhen;
            this.objSiJueJianZhen.biaoqian = this.sijuejianzhenButton;
            this.objSiJueJianZhen.name = "36";
            this.objSiJueJianZhen.isShow = true;
            this.objSiJueJianZhen.dengji = -1;
            this.btnArray4.push(this.objSiJueJianZhen);
         }
         else if(!param1 && this.sijuejianzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.sijuejianzhen != null && this.sijuejianzhen.parent != null)
            {
               this.sijuejianzhen.parent.removeChild(this.sijuejianzhen);
            }
            this.sijuejianzhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.sijuejianzhenButton != null && this.sijuejianzhenButton.parent != null)
            {
               this.sijuejianzhenButton.parent.removeChild(this.sijuejianzhenButton);
            }
            _loc3_ = this.btnArray4.indexOf(this.objSiJueJianZhen);
            if(_loc3_ >= 0)
            {
               this.btnArray4.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function set_XiangYangZhiZhan(param1:Array) : void
      {
         this.xiangyangzhizhan.set_XiangYangZhiZhan(param1);
      }
      
      public function showXiangYangZhiZhan() : void
      {
         this.initCharPanel(5,"9");
      }
      
      public function setXiangYangZhiZhanInit(param1:int, param2:Object, param3:int, param4:int, param5:String, param6:String, param7:String) : void
      {
         this.xiangyangzhizhan.setInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setXiangYangZhiZhanEnableFun() : void
      {
         this.xiangyangzhizhan.setEnableFun();
      }
      
      public function permitXiangYangZhiZhan(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.xiangyangzhizhanButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.xiangyangzhizhan,0);
            this.xiangyangzhizhanButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer5.addChild(this.xiangyangzhizhanButton);
            this.xiangyangzhizhanObj = new Object();
            this.xiangyangzhizhanObj.neirong = this.xiangyangzhizhan;
            this.xiangyangzhizhanObj.biaoqian = this.xiangyangzhizhanButton;
            this.xiangyangzhizhanObj.eventType = XIANGYANGZHIZHAN;
            this.xiangyangzhizhanObj.name = "9";
            this.xiangyangzhizhanObj.isShow = true;
            this.xiangyangzhizhanObj.dengji = -1;
            this.btnArray5.push(this.xiangyangzhizhanObj);
            this.initCharPanel(5,"9");
         }
         else if(!param1 && this.xiangyangzhizhanButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.xiangyangzhizhan != null && this.xiangyangzhizhan.parent != null)
            {
               this.xiangyangzhizhan.parent.removeChild(this.xiangyangzhizhan);
            }
            this.xiangyangzhizhanButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.xiangyangzhizhanButton != null && this.xiangyangzhizhanButton.parent != null)
            {
               this.xiangyangzhizhanButton.parent.removeChild(this.xiangyangzhizhanButton);
            }
            _loc3_ = this.btnArray5.indexOf(this.xiangyangzhizhanObj);
            if(_loc3_ >= 0)
            {
               this.btnArray5.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function set_FengDiao(param1:Array) : void
      {
         this.fengdiao.set_Equip(param1);
      }
      
      public function showFengDiao() : void
      {
         this.initCharPanel(3,"20");
      }
      
      public function setFengDiaoInit(param1:Array) : void
      {
         this.fengdiao.setData(param1,"","",true);
      }
      
      public function permitFengDiao(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.fengdiaoButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.fengdiao,0);
            this.fengdiaoButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.fengdiaoButton);
            this.fengdiaoObj = new Object();
            this.fengdiaoObj.neirong = this.fengdiao;
            this.fengdiaoObj.biaoqian = this.fengdiaoButton;
            this.fengdiaoObj.name = "20";
            this.fengdiaoObj.isShow = true;
            this.fengdiaoObj.dengji = -1;
            this.btnArray3.push(this.fengdiaoObj);
            this.initCharPanel(3,"20");
         }
         else if(!param1 && this.fengdiaoButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.fengdiao != null && this.fengdiao.parent != null)
            {
               this.fengdiao.parent.removeChild(this.fengdiao);
            }
            this.fengdiaoButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.fengdiaoButton != null && this.fengdiaoButton.parent != null)
            {
               this.fengdiaoButton.parent.removeChild(this.fengdiaoButton);
            }
            _loc3_ = this.btnArray3.indexOf(this.fengdiaoObj);
            if(_loc3_ >= 0)
            {
               this.btnArray3.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function showJingLeiQiang() : void
      {
         this.initCharPanel(3,"21");
      }
      
      public function setJingLeiQiangInit(param1:JingLeiQiangVo) : void
      {
         this.jingleiqiang.setinitilizeUI(false,param1);
      }
      
      public function setJingLeiQiangEnableFun() : void
      {
         this.jingleiqiang.setEnableFun();
      }
      
      public function permitJingLeiQiang(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.jingleiqiangButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.jingleiqiang,0);
            this.jingleiqiangButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.jingleiqiangButton);
            this.objJingLeiQiang = new Object();
            this.objJingLeiQiang.neirong = this.jingleiqiang;
            this.objJingLeiQiang.biaoqian = this.jingleiqiangButton;
            this.objJingLeiQiang.name = "21";
            this.objJingLeiQiang.isShow = true;
            this.objJingLeiQiang.dengji = -1;
            this.btnArray3.push(this.objJingLeiQiang);
         }
         else if(!param1 && this.jingleiqiangButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.jingleiqiang != null && this.jingleiqiang.parent != null)
            {
               this.jingleiqiang.parent.removeChild(this.jingleiqiang);
            }
            this.jingleiqiangButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.jingleiqiangButton != null && this.jingleiqiangButton.parent != null)
            {
               this.jingleiqiangButton.parent.removeChild(this.jingleiqiangButton);
            }
            _loc3_ = this.btnArray3.indexOf(this.objJingLeiQiang);
            if(_loc3_ >= 0)
            {
               this.btnArray3.splice(_loc3_,1);
            }
            this.setIsShowBiaoqian(param2);
         }
      }
      
      public function permitMingYuGong(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.mingyugongButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.mingyugong,0);
            this.mingyugongButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.mingyugongButton);
            this.objMingYuGong = new Object();
            this.objMingYuGong.neirong = this.mingyugong;
            this.objMingYuGong.biaoqian = this.mingyugongButton;
            this.objMingYuGong.name = "43";
            this.objMingYuGong.isShow = true;
            this.objMingYuGong.dengji = 70;
            this.btnArray2.push(this.objMingYuGong);
            this.showMingYuGong();
         }
         else if(!param1 && this.mingyugongButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.mingyugong != null && this.mingyugong.parent != null)
            {
               this.mingyugong.parent.removeChild(this.mingyugong);
            }
            this.mingyugongButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.mingyugongButton != null && this.mingyugongButton.parent != null)
            {
               this.mingyugongButton.parent.removeChild(this.mingyugongButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objMingYuGong);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
         }
         this.setIsShowBiaoqian(param2);
      }
      
      public function showMingYuGong() : void
      {
         this.initCharPanel(2,"43");
      }
      
      public function initializateMingYuGong(param1:Object) : void
      {
         this.mingyugong.setData(param1,false);
      }
      
      public function setMingYuGongEnabledFun() : void
      {
         this.mingyugong.setMingYuGongEnabledFun();
      }
      
      public function setMingYuGongAvatar(param1:BitmapData) : void
      {
         this.mingyugong.avatar = param1;
      }
      
      public function permitTuLongDao(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.tulongdaoButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.tulongdao,0);
            this.tulongdaoButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.tulongdaoButton);
            this.objTuLongDao = new Object();
            this.objTuLongDao.neirong = this.tulongdao;
            this.objTuLongDao.biaoqian = this.tulongdaoButton;
            this.objTuLongDao.name = "22";
            this.objTuLongDao.isShow = true;
            this.objTuLongDao.dengji = -1;
            this.btnArray3.push(this.objTuLongDao);
            this.showTuLongDao();
         }
         else if(!param1 && this.tulongdaoButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.tulongdao != null && this.tulongdao.parent != null)
            {
               this.tulongdao.parent.removeChild(this.tulongdao);
            }
            this.tulongdaoButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.tulongdaoButton != null && this.tulongdaoButton.parent != null)
            {
               this.tulongdaoButton.parent.removeChild(this.tulongdaoButton);
            }
            _loc3_ = this.btnArray3.indexOf(this.objTuLongDao);
            if(_loc3_ >= 0)
            {
               this.btnArray3.splice(_loc3_,1);
            }
         }
         this.setIsShowBiaoqian(param2);
      }
      
      public function showTuLongDao() : void
      {
         this.initCharPanel(3,"22");
      }
      
      public function initializateTuLongDao(param1:TuLongDaoVO) : void
      {
         this.tulongdao.setinitilizeUI(false,param1);
      }
      
      public function setTuLongDaoEnabledFun() : void
      {
         this.tulongdao.setEnableFun();
      }
      
      public function permitJinSheJianFa(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.jinSheJianFaButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.jinSheJianFa,0);
            this.jinSheJianFaButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.jinSheJianFaButton);
            this.objJinSheJianFa = new Object();
            this.objJinSheJianFa.neirong = this.jinSheJianFa;
            this.objJinSheJianFa.biaoqian = this.jinSheJianFaButton;
            this.objJinSheJianFa.name = "42";
            this.objJinSheJianFa.isShow = true;
            this.objJinSheJianFa.dengji = -1;
            this.btnArray2.push(this.objJinSheJianFa);
            this.showJinSheJianFa();
         }
         else if(!param1 && this.jinSheJianFaButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.jinSheJianFa != null && this.jinSheJianFa.parent != null)
            {
               this.jinSheJianFa.parent.removeChild(this.jinSheJianFa);
            }
            this.jinSheJianFaButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.jinSheJianFaButton != null && this.jinSheJianFaButton.parent != null)
            {
               this.jinSheJianFaButton.parent.removeChild(this.jinSheJianFaButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objJinSheJianFa);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
         }
         this.setIsShowBiaoqian(param2);
      }
      
      public function showJinSheJianFa() : void
      {
         this.initCharPanel(2,"42");
      }
      
      public function initializateJinSheJianFa(param1:JinSheJianFaVO) : void
      {
         this.jinSheJianFa.initializateJinSheJianFa(param1,false);
      }
      
      public function setJinSheJianFaEnabledFun() : void
      {
         this.jinSheJianFa.setJinSheJianFaEnabledFun();
      }
      
      public function showCuQianKungFu() : void
      {
         this.initCharPanel(2,"44");
      }
      
      public function setCuQianKungFuInit(param1:CuQianKungFuVO) : void
      {
         this.cuqiankungfu.setInitialize(false,param1);
      }
      
      public function setCuQianKungFuEnabledFun() : void
      {
         this.cuqiankungfu.setCuQianKungFuEnabledFun();
      }
      
      public function permitCuQianKungFu(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.cuqiankungfuButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.cuqiankungfu,0);
            this.cuqiankungfuButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.cuqiankungfuButton);
            this.objCuQianKungFu = new Object();
            this.objCuQianKungFu.neirong = this.cuqiankungfu;
            this.objCuQianKungFu.biaoqian = this.cuqiankungfuButton;
            this.objCuQianKungFu.name = "44";
            this.objCuQianKungFu.isShow = true;
            this.objCuQianKungFu.dengji = -1;
            this.btnArray2.push(this.objCuQianKungFu);
            this.initCharPanel(2,"44");
         }
         else if(!param1 && this.cuqiankungfuButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.cuqiankungfu != null && this.cuqiankungfu.parent != null)
            {
               this.cuqiankungfu.parent.removeChild(this.cuqiankungfu);
            }
            this.cuqiankungfuButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.cuqiankungfuButton != null && this.cuqiankungfuButton.parent != null)
            {
               this.cuqiankungfuButton.parent.removeChild(this.cuqiankungfuButton);
            }
            _loc3_ = this.btnArray2.indexOf(this.objCuQianKungFu);
            if(_loc3_ >= 0)
            {
               this.btnArray2.splice(_loc3_,1);
            }
         }
         this.setIsShowBiaoqian(param2);
      }
      
      public function setCuQianKungFuJinduNum(param1:int, param2:int, param3:int, param4:Boolean) : *
      {
         this.cuqiankungfu.setJinduNum(param1,param2,param3,param4);
      }
      
      public function permitQingDieShuangRen(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.qingdieshuangrenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.qingdieshuangren,0);
            this.qingdieshuangrenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.qingdieshuangrenButton);
            this.objQingDieShuangRen = new Object();
            this.objQingDieShuangRen.neirong = this.qingdieshuangren;
            this.objQingDieShuangRen.biaoqian = this.qingdieshuangrenButton;
            this.objQingDieShuangRen.name = "23";
            this.objQingDieShuangRen.isShow = true;
            this.objQingDieShuangRen.dengji = -1;
            this.btnArray3.push(this.objQingDieShuangRen);
            this.showQingDieShuangRen();
         }
         else if(!param1 && this.qingdieshuangrenButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.qingdieshuangren != null && this.qingdieshuangren.parent != null)
            {
               this.qingdieshuangren.parent.removeChild(this.qingdieshuangren);
            }
            this.qingdieshuangrenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.qingdieshuangrenButton != null && this.qingdieshuangrenButton.parent != null)
            {
               this.qingdieshuangrenButton.parent.removeChild(this.qingdieshuangrenButton);
            }
            _loc3_ = this.btnArray3.indexOf(this.objQingDieShuangRen);
            if(_loc3_ >= 0)
            {
               this.btnArray3.splice(_loc3_,1);
            }
         }
         this.setIsShowBiaoqian(param2);
      }
      
      public function showQingDieShuangRen() : void
      {
         this.initCharPanel(3,"23");
      }
      
      public function initializateQingDieShuangRen(param1:QingDieShuangRenVO) : void
      {
         this.qingdieshuangren.initializateQingDieShuangRen(param1);
      }
      
      public function setQingDieShuangRenEnabledFun() : void
      {
         this.qingdieshuangren.setQingDieShuangRenEnabledFun();
      }
      
      public function permitCangJianXuanTian(param1:Boolean, param2:int) : void
      {
         var _loc3_:int = 0;
         if(param1 && !this.cangjianxuantianButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.cangjianxuantian,0);
            this.cangjianxuantianButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.cangjianxuantianButton);
            this.objCangJianXuanTian = new Object();
            this.objCangJianXuanTian.neirong = this.cangjianxuantian;
            this.objCangJianXuanTian.biaoqian = this.cangjianxuantianButton;
            this.objCangJianXuanTian.name = "24";
            this.objCangJianXuanTian.isShow = true;
            this.objCangJianXuanTian.dengji = -1;
            this.btnArray3.push(this.objCangJianXuanTian);
            this.showCangJianXuanTian();
         }
         else if(!param1 && this.cangjianxuantianButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.cangjianxuantian != null && this.cangjianxuantian.parent != null)
            {
               this.cangjianxuantian.parent.removeChild(this.cangjianxuantian);
            }
            this.cangjianxuantianButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.cangjianxuantianButton != null && this.cangjianxuantianButton.parent != null)
            {
               this.cangjianxuantianButton.parent.removeChild(this.cangjianxuantianButton);
            }
            _loc3_ = this.btnArray3.indexOf(this.objCangJianXuanTian);
            if(_loc3_ >= 0)
            {
               this.btnArray3.splice(_loc3_,1);
            }
         }
         this.setIsShowBiaoqian(param2);
      }
      
      public function showCangJianXuanTian() : void
      {
         this.initCharPanel(3,"24");
      }
      
      public function initializateCangJianXuanTian(param1:CangJianXuanTianVO) : void
      {
         this.cangjianxuantian.initializateCangJianXuanTian(param1);
      }
      
      public function setCangJianXuanTianEnabledFun() : void
      {
         this.cangjianxuantian.setCangJianXuanTianEnabledFun();
      }
   }
}

