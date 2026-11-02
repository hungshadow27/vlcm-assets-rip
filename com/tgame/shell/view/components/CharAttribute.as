package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.NewButton;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.info.data.PersonData;
   import com.tgame.common.vo.item.Buff;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.McBaseItem;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
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
   import com.tgame.shell.view.components.attribute.Attribute;
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
   import com.tgame.shell.view.components.attribute.DataObject;
   import com.tgame.shell.view.components.attribute.DiZaiZhen;
   import com.tgame.shell.view.components.attribute.Dongxiao;
   import com.tgame.shell.view.components.attribute.DongxiaoTisuPanel;
   import com.tgame.shell.view.components.attribute.DongxiaoTupopingjingPanel;
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
   import com.tgame.shell.view.components.attribute.ImpactPointPanel;
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
   import com.tgame.shell.view.components.attribute.PangXieZhen;
   import com.tgame.shell.view.components.attribute.PlayerInfoCanvas;
   import com.tgame.shell.view.components.attribute.PlayerInfoUploadPhotoPanel;
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
   import com.tgame.shell.view.components.attribute.ShenZhaoJingTisuPanel;
   import com.tgame.shell.view.components.attribute.ShenZhaoJingTopoCanvas;
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
   import com.tgame.shell.view.components.attribute.Venation;
   import com.tgame.shell.view.components.attribute.VenationBreakthroughPanel;
   import com.tgame.shell.view.components.attribute.WanHunZhen;
   import com.tgame.shell.view.components.attribute.WoDeChuanGong;
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
   import com.tgame.shell.view.components.attribute.ZhenLongImpactPointPanel;
   import com.tgame.shell.view.components.attribute.ZhenLongQiJu;
   import com.tgame.shell.view.components.attribute.ZhenWuQiJieZhen;
   import com.tgame.shell.view.components.attribute.ZhenYanShouYin;
   import com.tgame.shell.view.components.attribute.ZiXiaShenGong;
   import com.tgame.shell.view.components.attribute.niaoxiangzhen.NiaoXiangZhen;
   import com.tgame.shell.view.components.attribute.niaoxiangzhen.NiaoXiangZhenConst;
   import com.tgame.shell.view.components.attribute.niaoxiangzhen.NiaoXiangZhenController;
   import com.tgame.shell.view.components.attribute.tengtianyi.TengtianyiPanel;
   import com.tgame.shell.view.components.attribute.tianfuzhen.TianFuZhen;
   import com.tgame.shell.view.components.attribute.tianfuzhen.TianFuZhenConst;
   import com.tgame.shell.view.components.attribute.tianfuzhen.TianFuZhenController;
   import com.tgame.shell.view.components.attribute.tushidahui.Tushidahui;
   import com.tgame.shell.view.components.attribute.tushidahui.TushidahuiConst;
   import com.tgame.shell.view.components.attribute.tushidahui.TushidahuiController;
   import com.tgame.shell.view.components.jingleiqiang.JingLeiQiang;
   import com.tgame.shell.view.components.liangyiweichenzhen.LiangYiWeiChenZhen;
   import com.tgame.shell.view.components.qishazhen.QiShaZhen;
   import com.tgame.shell.view.components.siLingZhen.SiLingZhenCanvas;
   import com.tgame.shell.view.components.xingxiuzhen.XingXiuZhen;
   import com.tgame.shell.view.components.xingxiuzhen1.XingXiuZhen1;
   import com.tgame.shell.view.components.ynSpecial.YNGuiHun;
   import com.tgame.shell.view.components.ynSpecial.YNJingLing;
   import com.tgame.shell.view.components.ynSpecial.YNjinfengdiao;
   import com.tgame.shell.view.components.ynSpecial.YNliulongzhuangbei;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class CharAttribute extends FPanel
   {
      
      public static const GETCHARATTRIBUTE:String = "ui.char.getchar";
      
      public static const UI_CHARATTRIBUTE_ARRRIBUT_POINT_OK:String = "UI_CHARATTRIBUTE_ARRRIBUT_POINT_OK";
      
      public static const GETVENATION:String = "ui.char.getvenation";
      
      public static const UI_VENATION_EVENT_CLICK:String = "UI_VENATION_EVENT_CLICK";
      
      public static const UI_VENATION_POINT_CLICK:String = "UI_VENATION_POINT_CLICK";
      
      public static const UI_VENATION_USE_ITEM_COUNT:String = "UI_VENATION_USE_ITEM_COUNT";
      
      public static const UI_VENATION_POINT_IMPACT_STARTBTN_CLICK:String = "UI_VENATION_POINT_IMPACT_STARTBTN_CLICK";
      
      public static const UI_VENATION_BREAKTHROUGH:String = "UI_VENATION_BREAKTHROUGH";
      
      public static const UI_VENATION_BREAKTHROUGH_OK:String = "UI_VENATION_BREAKTHROUGH_OK";
      
      public static const UI_VENATION_GET_POINT_ATTRIBUTE:String = "UI_VENATION_GET_POINT_ATTRIBUTE";
      
      public static const GETACCOMPLISHMENT:String = "ui.char.getaccomplishment";
      
      public static const UI_CHAR_ATTRIBUTE_MENU_SHOW:String = "UI_CHAR_ATTRIBUTE_MENU_SHOW";
      
      public static const UI_CHAR_SELECT_SHOW_JIAN:String = "UI_CHAR_SELECT_SHOW_JIAN";
      
      public static const EQUIP_SEARCH_UNLOAD:String = "EQUIP_SEARCH_UNLOAD";
      
      public static const UI_CHAR_SELECT_SHOW_YUPEI:String = "UI_CHAR_SELECT_SHOW_YUPEI";
      
      public static const GETBINGQI:String = "GETBINGQI";
      
      public static const GETANQI:String = "GETANQI";
      
      public static const UI_ANQI_PREVIOUS_CLICK:String = "UI_ANQI_PREVIOUS_CLICK";
      
      public static const UI_ANQI_NEXT_CLICK:String = "UI_ANQI_NEXT_CLICK";
      
      public static const UI_ANQI_CHAYUEANQICHENGJIU_CLICK:String = "UI_ANQI_CHAYUEANQICHENGJIU_CLICK";
      
      public static const UI_ANQI_TISHENGSUDU_CLICK:String = "UI_ANQI_TISHENGSUDU_CLICK";
      
      public static const UI_ANQI_TUPOPINGJING_CLICK:String = "UI_ANQI_TUPOPINGJING_CLICK";
      
      public static const UI_ANQI_SHIFOUSHIYONGANQI_CLICK:String = "UI_ANQI_SHIFOUSHIYONGANQI_CLICK";
      
      public static const UI_ANQI_KAIFENG_CLICK:String = "UI_ANQI_KAIFENG_CLICK";
      
      public static const UI_XIULIANTISU_GOUMAI_CLICK:String = "UI_XIULIANTISU_GOUMAI_CLICK";
      
      public static const UI_XIULIANTISU_KAISHITISU_CLICK:String = "UI_XIULIANTISU_KAISHITISU_CLICK";
      
      public static const UI_XIULIANTISU_SHIYONGQUANBU_CLICK:String = "UI_XIULIANTISU_SHIYONGQUANBU_CLICK";
      
      public static const UI_ANQITUPOPINGJING_KAISHITUPO_CLICK:String = "UI_ANQITUPOPINGJING_KAISHITUPO_CLICK";
      
      public static const UI_ANQIJINJIE_ZIDONGJINJIE_CLICK:String = "UI_ANQIJINJIE_ZIDONGJINJIE_CLICK";
      
      public static const UI_ANQITUPOPINGJING_GOUMAISHENGJIEWUPIN_CLICK:String = "UI_ANQITUPOPINGJING_GOUMAISHENGJIEWUPIN_CLICK";
      
      public static const UI_ANQITUPOPINGJINGTISHI_MUBATUPO_CLICK:String = "UI_ANQITUPOPINGJINGTISHI_MUBATUPO_CLICK";
      
      public static const UI_ANQITUPOPINGJINGTISHI_GUANBITUPO_CLICK:String = "UI_ANQITUPOPINGJINGTISHI_GUANBITUPO_CLICK";
      
      public static const UI_CHARATTRIBUTE_PLAYER_INFO_PHOTO_UPLOAD:String = "UI_CHARATTRIBUTE_PLAYER_INFO_PHOTO_UPLOAD";
      
      public static const UI_CHARATTRIBUTE_PLAYER_INFO_SUBMIT:String = "UI_CHARATTRIBUTE_PLAYER_INFO_SUBMIT";
      
      public static const GETDUANZAOROUSHEN:String = "GETDUANZAOROUSHEN";
      
      public static const UI_SMITHINGBODY_MENU_CLICK:String = "UI_SMITHINGBODY_MENU_CLICK";
      
      public static const UI_SMITHINGBODY_TISHENGROUSHENJINGJIE_CLICK:String = "UI_SMITHINGBODY_TISHENGROUSHENJINGJIE_CLICK";
      
      public static const UI_SMITHINGBODY_SHANGYIYE_CLICK:String = "UI_SMITHINGBODY_SHANGYIYE_CLICK";
      
      public static const UI_SMITHINGBODY_XIAYIYE_CLICK:String = "UI_SMITHINGBODY_XIAYIYE_CLICK";
      
      public static const UI_SMITHINGBODYADVANCEACNVAS_GOUMAI_CLICK:String = "UI_SMITHINGBODYADVANCEACNVAS_GOUMAI_CLICK";
      
      public static const UI_SMITHINGBODYADVANCEACNVAS_KAISHITISHENG_CLICK:String = "UI_SMITHINGBODYADVANCEACNVAS_KAISHITISHENG_CLICK";
      
      public static const UI_SMITHINGBODYADVANCEACNVAS_ZIDONGTISHENG_CLICK:String = "UI_SMITHINGBODYADVANCEACNVAS_ZIDONGTISHENG_CLICK";
      
      public static const UI_SMITHINGBODY_JIHUO_CLICK:String = "UI_SMITHINGBODY_JIHUO_CLICK";
      
      public static const UI_SMITHINGBODY_JIHUODAJINLONG_CLICK:String = "UI_SMITHINGBODY_JIHUODAJINLONG_CLICK";
      
      public static const UI_ROUTIJINSHEN_JIHUODAJINLONG_CLICK:String = "UI_ROUTIJINSHEN_JIHUODAJINLONG_CLICK";
      
      public static const ITEM_LINK_CLICK:String = "ITEM_LINK_CLICK";
      
      public static const CHAT_ITEM_LINK_HIDE:String = "CHAT_ITEM_LINK_HIDE";
      
      public static const UI_SMITHINGBODYADVANCEACNVAS_PUTIJINGCUI_CHECK_CLICK:String = "UI_SMITHINGBODYADVANCEACNVAS_PUTIJINGCUI_CHECK_CLICK";
      
      public static const GETGONGJIAN:String = "GETGONGJIAN";
      
      public static const UI_BOW_SHANGYIYE_CLICK:String = "UI_BOW_SHANGYIYE_CLICK";
      
      public static const UI_BOW_XIAYIYE_CLICK:String = "UI_BOW_XIAYIYE_CLICK";
      
      public static const UI_BOW_JINJIEHECHENG_CLICK:String = "UI_BOW_JINJIEHECHENG_CLICK";
      
      public static const UI_BOW_SHIFOUSHIYONGANQI_CLICK:String = "UI_BOW_SHIFOUSHIYONGANQI_CLICK";
      
      public static const UI_BOW_SHIFOUXIANSHI_CLICK:String = "UI_BOW_SHIFOUXIANSHI_CLICK";
      
      public static const UI_BOW_OPTION_PANEL_STONE_CLICK:String = "UI_BOW_OPTION_PANEL_STONE_CLICK";
      
      public static const UI_BOW_OPTION_PANEL_DRAG_ENTER:String = "UI_BOW_OPTION_PANEL_DRAG_ENTER";
      
      public static const UI_BOWJINJIE_GOUMAI_CLICK:String = "UI_BOWJINJIE_GOUMAI_CLICK";
      
      public static const UI_BOWJINJIE_KAISHIJINJIE_CLICK:String = "UI_BOWJINJIE_KAISHIJINJIE_CLICK";
      
      public static const UI_BOWJINJIE_ZIDONGJINJIE_CLICK:String = "UI_BOWJINJIE_ZIDONGJINJIE_CLICK";
      
      public static const UI_BOWJINJIE_CLOSE_CLICK:String = "UI_BOWJINJIE_CLOSE_CLICK";
      
      public static const UI_GONGJIANYINCANGSHUXING_JIHUO_CLICK:String = "UI_GONGJIANYINCANGSHUXING_JIHUO_CLICK";
      
      public static const UI_BOWJINJIE_USE_SHENQILONGSHOUJIN_CLICK:String = "UI_BOWJINJIE_USE_SHENQILONGSHOUJIN_CLICK";
      
      public static const GETDANTIAN:String = "GETDANTIAN";
      
      public static const UI_DANTIAN_SHANGYIYE_CLICK:String = "UI_DANTIAN_SHANGYIYE_CLICK";
      
      public static const UI_DANTIAN_XIAYIYE_CLICK:String = "UI_DANTIAN_XIAYIYE_CLICK";
      
      public static const UI_DANTIAN_DENGJITUPO_CLICK:String = "UI_DANTIAN_DENGJITUPO_CLICK";
      
      public static const UI_DANTIAN_JINJIE_CLICK:String = "UI_DANTIAN_JINJIE_CLICK";
      
      public static const UI_DANTIAN_GOUMAI_CLICK:String = "UI_DANTIAN_GOUMAI_CLICK";
      
      public static const UI_DANTIAN_KAISHITISHENG_CLICK:String = "UI_DANTIAN_KAISHITISHENG_CLICK";
      
      public static const UI_DANTIAN_ZIDONGTISHENG_CLICK:String = "UI_DANTIAN_ZIDONGTISHENG_CLICK";
      
      public static const UI_DANTIAN_CLOSE:String = "UI_DANTIAN_CLOSE";
      
      public static const UI_DANTIAN_JIHUO_CLICK:String = "UI_DANTIAN_JIHUO_CLICK";
      
      public static const UI_DANTIANJINJIE_JIHUO_CLICK:String = "UI_DANTIANJINJIE_JIHUO_CLICK";
      
      public static const UI_YUENANDINGZHI_QIXUAN_ZIDONGHUANZHUANG:String = "UI_YUENANDINGZHI_QIXUAN_ZIDONGHUANZHUANG";
      
      public static const UI_DANTIAN_SKILL_DRAG_START:String = "UI_DANTIAN_SKILL_DRAG_START";
      
      public static const DUGUJIUJIAN:String = "DUGUJIUJIAN";
      
      public static const UI_DUGUJIUJIAN_DENGJITUPO_CLICK:String = "UI_DUGUJIUJIAN_DENGJITUPO_CLICK";
      
      public static const UI_DUGUJIUJIAN_KAISHITISHENG_CLICK:String = "UI_DUGUJIUJIAN_KAISHITISHENG_CLICK";
      
      public static const UI_DUGUJIUJIAN_ZIDONGTISHENG_CLICK:String = "UI_DUGUJIUJIAN_ZIDONGTISHENG_CLICK";
      
      public static const UI_DUGUJIUJIAN_CLOSE:String = "UI_DUGUJIUJIAN_CLOSE";
      
      public static const UI_CHARATTRIBUTE_CLOSE:String = "UI_CHARATTRIBUTE_CLOSE";
      
      public static const UI_DUGUJIUJIAN_EFFECT_SHOW:String = "UI_DUGUJIUJIAN_EFFECT_SHOW";
      
      public static const UI_DUGUJIUJIAN_YINCANGSHUXING_JIHUO_CLICK:String = "UI_DUGUJIUJIAN_YINCANGSHUXING_JIHUO_CLICK";
      
      public static const DONGXIAO:String = "DONGXIAO";
      
      public static const UI_DONGXIAO_SHIFOUSHIYONGANQI_CLICK:String = "UI_DONGXIAO_SHIFOUSHIYONGANQI_CLICK";
      
      public static const UI_DONGXIAO_SHIFOUSHIXIANSHI_CLICK:String = "UI_DONGXIAO_SHIFOUSHIXIANSHI_CLICK";
      
      public static const UI_DONGXIAO_FANYE_CLICK:String = "UI_DONGXIAO_FANYE_CLICK";
      
      public static const UI_DONGXIAO_TISHENGSUDU_CLICK:String = "UI_DONGXIAO_TISHENGSUDU_CLICK";
      
      public static const UI_DONGXIAO_TUPOPINGJING_CLICK:String = "UI_DONGXIAO_TUPOPINGJING_CLICK";
      
      public static const UI_DONGXIAO_XIULIANTISU_GOUMAI_CLICK:String = "UI_DONGXIAO_XIULIANTISU_GOUMAI_CLICK";
      
      public static const UI_DONGXIAO_XIULIANTISU_KAISHITISU_CLICK:String = "UI_DONGXIAO_XIULIANTISU_KAISHITISU_CLICK";
      
      public static const UI_DONGXIAOTUPOPINGJING_CLOSE:String = "UI_DONGXIAOTUPOPINGJING_CLOSE";
      
      public static const UI_DONGXIAOTUPOPINGJING_KAISHITUPO_CLICK:String = "UI_DONGXIAOTUPOPINGJING_KAISHITUPO_CLICK";
      
      public static const UI_DONGXIAOTUPOPINGJING_GOUMAISHENGJIEWUPIN_CLICK:String = "UI_DONGXIAOTUPOPINGJING_GOUMAISHENGJIEWUPIN_CLICK";
      
      public static const GETDUANZAOROUSHENB:String = "GETDUANZAOROUSHENB";
      
      public static const UI_SMITHINGBODY_MENU_CLICKB:String = "UI_SMITHINGBODY_MENU_CLICKB";
      
      public static const UI_SMITHINGBODY_TISHENGROUSHENJINGJIE_CLICKB:String = "UI_SMITHINGBODY_TISHENGROUSHENJINGJIE_CLICKB";
      
      public static const UI_SMITHINGBODY_SHANGYIYE_CLICKB:String = "UI_SMITHINGBODY_SHANGYIYE_CLICKB";
      
      public static const UI_SMITHINGBODY_XIAYIYE_CLICKB:String = "UI_SMITHINGBODY_XIAYIYE_CLICKB";
      
      public static const UI_SMITHINGBODYADVANCEACNVAS_GOUMAI_CLICKB:String = "UI_SMITHINGBODYADVANCEACNVAS_GOUMAI_CLICKB";
      
      public static const UI_SMITHINGBODYADVANCEACNVAS_KAISHITISHENG_CLICKB:String = "UI_SMITHINGBODYADVANCEACNVAS_KAISHITISHENG_CLICKB";
      
      public static const UI_SMITHINGBODYADVANCEACNVAS_ZIDONGTISHENG_CLICKB:String = "UI_SMITHINGBODYADVANCEACNVAS_ZIDONGTISHENG_CLICKB";
      
      public static const UI_SMITHINGBODYADVANCEACNVAS_ZIDONGTISHENG_CLOSE:String = "UI_SMITHINGBODYADVANCEACNVAS_ZIDONGTISHENG_CLOSE";
      
      public static const UI_SMITHINGBODY_JIHUO_CLICKB:String = "UI_SMITHINGBODY_JIHUO_CLICKB";
      
      public static const ITEM_LINK_CLICKB:String = "ITEM_LINK_CLICKB";
      
      public static const CHAT_ITEM_LINK_HIDEB:String = "CHAT_ITEM_LINK_HIDEB";
      
      public static const UI_SMITHINGBODYADVANCEACNVAS_PUTIJINGCUI_CHECK_CLICKB:String = "UI_SMITHINGBODYADVANCEACNVAS_PUTIJINGCUI_CHECK_CLICKB";
      
      public static const DUGUJIUJIANJ:String = "DUGUJIUJIANJ";
      
      public static const UI_DUGUJIUJIAN_DENGJITUPO_CLICKJ:String = "UI_DUGUJIUJIAN_DENGJITUPO_CLICKJ";
      
      public static const UI_DUGUJIUJIAN_KAISHITISHENG_CLICKJ:String = "UI_DUGUJIUJIAN_KAISHITISHENG_CLICKJ";
      
      public static const UI_DUGUJIUJIAN_ZIDONGTISHENG_CLICKJ:String = "UI_DUGUJIUJIAN_ZIDONGTISHENG_CLICKJ";
      
      public static const UI_DUGUJIUJIAN_CLOSEJ:String = "UI_DUGUJIUJIAN_CLOSEJ";
      
      public static const UI_CHARATTRIBUTE_CLOSEJ:String = "UI_CHARATTRIBUTE_CLOSEJ";
      
      public static const UI_JIUYANGSHENGONG_EFFECT_SHOW:String = "UI_JIUYANGSHENGONG_EFFECT_SHOW";
      
      public static const UI_JIUYANG_YINCANGSHUXING_JIHUO_CLICK:String = "UI_JIUYANG_YINCANGSHUXING_JIHUO_CLICK";
      
      public static const UI_QI_HAI_BTN_CLICKED:String = "QI_HAI_BTN_CLICKED";
      
      public static const UI_QI_HAI_SHOW:String = "UI_QI_HAI_SHOW";
      
      public static const XIANGLONGSHIBAZHANG_SHOW:String = "XIANG_LONG_SHI_BA_ZHANG";
      
      public static const XIANGLONGSHIBAZHANG_LINGWU_SHOW:String = "XIANGLONGSHIBAZHANG_LINGWU_SHOW";
      
      public static const XIANGLONGSHIBAZHANG_ARROW_CLICK:String = "XIANGLONGSHIBAZHANG_ARROW_CLICK";
      
      public static const XIANGLONGSHIBAZHANG_SKILL_INSTALL:String = "XIANGLONGSHIBAZHANG_SKILL_INSTALL";
      
      public static const UI_XIANGLONGSHIBAZHANG_KAISHITISHENG_CLICKJ:String = "UI_XIANGLONGSHIBAZHANG_KAISHITISHENG_CLICKJ";
      
      public static const UI_XIANGLONGSHIBAZHANG_ZIDONGTISHENG_CLICKJ:String = "UI_XIANGLONGSHIBAZHAN_ZIDONGTISHENG_CLICKJ";
      
      public static const UI_XIANGLONGSHIBAZHANG_GOUMAI_CLICK:String = "UI_XIANGLONGSHIBAZHANG_GOUMAI_CLICK";
      
      public static const UI_XIANGLONGSHIBAZHANG_CLOSEJ:String = "UI_XIANGLONGSHIBAZHANG_CLOSEJ";
      
      public static const XIANGLONGSHIBAZHANG_SKILL_DRAG:String = "XIANGLONGSHIBAZHANG_SKILL_DRAG";
      
      public static const GETYIJINJING:String = "GETYIJINJING";
      
      public static const UI_YIJINJING_SHANGYIYE_CLICK:String = "UI_YIJINJING_SHANGYIYE_CLICK";
      
      public static const UI_YIJINJING_XIAYIYE_CLICK:String = "UI_YIJINJING_XIAYIYE_CLICK";
      
      public static const YIJINJING_LINGWU_SHOW:String = "YIJINJING_LINGWU_SHOW";
      
      public static const UI_YIJINJING_KAISHITISHENG_CLICKJ:String = "UI_YIJINJING_KAISHITISHENG_CLICKJ";
      
      public static const UI_YIJINJING_ZIDONGTISHENG_CLICKJ:String = "UI_YIJINJING_ZIDONGTISHENG_CLICKJ";
      
      public static const UI_YIJINJING_ZHIJIETISHENG_CLICKJ:String = "UI_YIJINJING_ZHIJIETISHENG_CLICKJ";
      
      public static const UI_YIJINJING_GOUMAI_CLICK:String = "UI_YIJINJING_GOUMAI_CLICK";
      
      public static const UI_YIJINJING_SKILL_DRAG:String = "UI_YIJINJING_SKILL_DRAG";
      
      public static const GETJINGJIE:String = "GETJINGJIE";
      
      public static const UI_JINGJIE_EVENT_CLICK:String = "UI_JINGJIE_EVENT_CLICK";
      
      public static const JINGJIE_LINGWU_SHOW:String = "JINGJIE_LINGWU_SHOW";
      
      public static const UI_JINGJIE_GOUMAI_CLICK:String = "UI_JINGJIE_GOUMAI_CLICK";
      
      public static const UI_JINGJIE_KAISHITISHENG_CLICK:String = "UI_JINGJIE_KAISHITISHENG_CLICK";
      
      public static const UI_JINGJIE_ZIDONGTISHENG_CLICK:String = "UI_JINGJIE_ZIDONGTISHENG_CLICK";
      
      public static const GETYIJINJING_X:String = "GETYIJINJING_X";
      
      public static const UI_YIJINJING_SHANGYIYE_CLICK_X:String = "UI_YIJINJING_SHANGYIYE_CLICK_X";
      
      public static const UI_YIJINJING_XIAYIYE_CLICK_X:String = "UI_YIJINJING_XIAYIYE_CLICK_X";
      
      public static const YIJINJING_LINGWU_SHOW_X:String = "YIJINJING_LINGWU_SHOW_X";
      
      public static const UI_YIJINJING_KAISHITISHENG_CLICKJ_X:String = "UI_YIJINJING_KAISHITISHENG_CLICKJ_X";
      
      public static const UI_YIJINJING_ZIDONGTISHENG_CLICKJ_X:String = "UI_YIJINJING_ZIDONGTISHENG_CLICKJ_X";
      
      public static const UI_YIJINJING_ZHIJIETISHENG_CLICKJ_X:String = "UI_YIJINJING_ZHIJIETISHENG_CLICKJ_X";
      
      public static const UI_YIJINJING_GOUMAI_CLICK_X:String = "UI_YIJINJING_GOUMAI_CLICK_X";
      
      public static const UI_YIJINJING_SKILL_DRAG_X:String = "UI_YIJINJING_SKILL_DRAG_X";
      
      public static const FEILONGTANYUNSHOU:String = "FEILONGTANYUNSHOU";
      
      public static const UI_FEILONGTANYUNSHOU_LINGWU_SHOW:String = "UI_FEILONGTANYUNSHOU_LINGWU_SHOW";
      
      public static const UI_FEILONGTANYUNSHOU_PREVIOUS_CLICK:String = "UI_FEILONGTANYUNSHOU_PREVIOUS_CLICK";
      
      public static const UI_FEILONGTANYUNSHOU_NEXT_CLICK:String = "UI_FEILONGTANYUNSHOU_NEXT_CLICK";
      
      public static const UI_FEILONGTANYUNSHOU_KAISHITISHENG_CLICKJ:String = "UI_FEILONGTANYUNSHOU_KAISHITISHENG_CLICKJ";
      
      public static const UI_FEILONGTANYUNSHOU_ZIDONGTISHENG_CLICKJ:String = "UI_FEILONGTANYUNSHOU_ZIDONGTISHENG_CLICKJ";
      
      public static const UI_FEILONGTANYUNSHOU_GOUMAI_CLICK:String = "UI_FEILONGTANYUNSHOU_GOUMAI_CLICK";
      
      public static const UI_FEILONGTANYUNSHOU_CLOSEJ:String = "UI_FEILONGTANYUNSHOU_CLOSEJ";
      
      public static const UI_FEILONGTANYUNSHOU_SHIFOUSHIYONG_CLICK:String = "UI_FEILONGTANYUNSHOU_SHIFOUSHIYONG_CLICK";
      
      public static const JIUYINZHENJING:String = "JIUYINZHENJING";
      
      public static const UI_JIUYINZHENJING_DENGJITUPO_CLICKJ:String = "UI_JIUYINZHENJING_DENGJITUPO_CLICKJ";
      
      public static const UI_JIUYINZHENJING_CLOSE:String = "UI_JIUYINZHENJING_CLOSE";
      
      public static const UI_JIUYINZHENJING_KAISHITISHENG_CLICKJ:String = "UI_JIUYINZHENJING_KAISHITISHENG_CLICKJ";
      
      public static const UI_JIUYINZHENJING_ZIDONGTISHENG_CLICKJ:String = "UI_JIUYINZHENJING_ZIDONGTISHENG_CLICKJ";
      
      public static const UI_JIUYINZHENJING_GOUMAI_CLICK:String = "UI_JIUYINZHENJING_GOUMAI_CLICK";
      
      public static const GETYUNCHENG:String = "GETYUNCHENG";
      
      public static const YUNCHENG_JIHUO:String = "YUNCHENG_JIHUO";
      
      public static const GETWULIZHI:String = "GETWULIZHI";
      
      public static const WUXINGQUAN:String = "WUXINGQUAN";
      
      public static const WUXINGQUAN_LINGWU:String = "WUXINGQUAN_LINGWU";
      
      public static const WUXINGQUAN_SKILL_DRAG:String = "WUXINGQUAN_SKILL_DRAG";
      
      public static const WUXINGQUAN_LINGWUMIANBAN_KAISHILINGWU:String = "WUXINGQUAN_LINGWUMIANBAN_KAISHILINGWU";
      
      public static const WUXINGQUAN_LINGWUMIANBAN_ZIDONGLINGWU:String = "WUXINGQUAN_LINGWUMIANBAN_ZIDONGLINGWU";
      
      public static const WUXINGQUAN_GOUMAI_CLICK:String = "WUXINGQUAN_GOUMAI_CLICK";
      
      public static const SHIBATONGREN:String = "SHIBATONGREN";
      
      public static const SHIBATONGREN_CHUANGGUAN:String = "SHIBATONGREN_CHUANGGUAN";
      
      public static const SHIBATONGREN_CHUANGGUAN_CLOSE:String = "SHIBATONGREN_CHUANGGUAN_CLOSE";
      
      public static const SHIBATONGREN_CHUANGGUAN_KAISHI:String = "SHIBATONGREN_CHUANGGUAN_KAISHI";
      
      public static const SHIBATONGREN_CHUANGGUAN_ZIDONG:String = "SHIBATONGREN_CHUANGGUAN_ZIDONG";
      
      public static const SHIBATONGREN_ARROW_CLICK:String = "SHIBATONGREN_ARROW_CLICK";
      
      public static const SHIBATONGREN_GOUMAI_CLICK:String = "SHIBATONGREN_GOUMAI_CLICK";
      
      public static const UI_CHAR_SELECT_SHOW_SBTR:String = "UI_CHAR_SELECT_SHOW_SBTR";
      
      public static const GETZHANQI:String = "GETZHANQI";
      
      public static const LIUMAISHENJIAN:String = "LIUMAISHENJIAN";
      
      public static const UI_SHENJIAN_EVENT_CLICK:String = "UI_SHENJIAN_EVENT_CLICK";
      
      public static const UI_LIUMAISHENJIAN_PREVIOUS_CLICK:String = "UI_LIUMAISHENJIAN_PREVIOUS_CLICK";
      
      public static const UI_LIUMAISHENJIAN_NEXT_CLICK:String = "UI_LIUMAISHENJIAN_NEXT_CLICK";
      
      public static const UI_LIUMAISHENJIAN_XIULIAN_CLICK:String = "UI_LIUMAISHENJIAN_XIULIAN_CLICK";
      
      public static const UI_LIUMAISHENJIAN_SKILL_DRAG:String = "UI_LIUMAISHENJIAN_SKILL_DRAG";
      
      public static const UI_LIUMAISHENJIAN_KAISHITISHENG_CLICKJ:String = "UI_LIUMAISHENJIAN_KAISHITISHENG_CLICKJ";
      
      public static const UI_LIUMAISHENJIAN_ZIDONGTISHENG_CLICKJ:String = "UI_LIUMAISHENJIAN_ZIDONGTISHENG_CLICKJ";
      
      public static const UI_LIUMAISHENJIAN_GOUMAI_CLICK:String = "UI_LIUMAISHENJIAN_GOUMAI_CLICK";
      
      public static const WUXINGZHIREN:String = "WUXINGZHIREN";
      
      public static const UI_WUXING_USE_CLICK:String = "UI_WUXING_USE_CLICK";
      
      public static const UI_WUXING_JIHUO_CLICK:String = "UI_WUXING_JIHUO_CLICK";
      
      public static const UI_WUXING_QIEHUAN_CLICK:String = "UI_WUXING_QIEHUAN_CLICK";
      
      public static const UI_WUXING_SHOW_CLICK:String = "UI_WUXING_SHOW_CLICK";
      
      public static const UI_WUXINGZHIREN_PANEL_SHOW_MENU:String = "UI_WUXINGZHIREN_PANEL_SHOW_MENU";
      
      public static const JINZHONGZHAO:String = "JINZHONGZHAO";
      
      public static const JINZHONGZHAO_DENGJITUPO:String = "JINZHONGZHAO_DENGJITUPO";
      
      public static const JINZHONGZHAO_DENGJITUPO_CLOSE:String = "JINZHONGZHAO_DENGJITUPO_CLOSE";
      
      public static const JINZHONGZHAO_DENGJITUPO_KAISHI:String = "JINZHONGZHAO_DENGJITUPO_KAISHI";
      
      public static const JINZHONGZHAO_DENGJITUPO_ZIDONG:String = "JINZHONGZHAO_DENGJITUPO_ZIDONG";
      
      public static const JINZHONGZHAO_ARROW_CLICK:String = "JINZHONGZHAO_ARROW_CLICK";
      
      public static const JINZHONGZHAO_GOUMAI_CLICK:String = "JINZHONGZHAO_GOUMAI_CLICK";
      
      public static const JINZHONGZHAO_QIANGHUA_CLICK:String = "JINZHONGZHAO_QIANGHUA_CLICK";
      
      public static const JINZHONGZHAO_ITEM_LINK_CLICK:String = "JINZHONGZHAO_ITEM_LINK_CLICK";
      
      public static const JINZHONGZHAO_CHAT_ITEM_LINK_HIDE:String = "JINZHONGZHAO_CHAT_ITEM_LINK_HIDE";
      
      public static const GETTAIXUANSHENGONG:String = "GETTAIXUANSHENGONG";
      
      public static const UI_TAIXUANSHENGONG_SHANGYIYE_CLICK:String = "UI_TAIXUANSHENGONG_SHANGYIYE_CLICK";
      
      public static const UI_TAIXUANSHENGONG_XIAYIYE_CLICK:String = "UI_TAIXUANSHENGONG_XIAYIYE_CLICK";
      
      public static const TAIXUANSHENGONG_LINGWU_SHOW:String = "TAIXUANSHENGONG_LINGWU_SHOW";
      
      public static const UI_TAIXUANSHENGONG_KAISHITISHENG_CLICKJ:String = "UI_TAIXUANSHENGONG_KAISHITISHENG_CLICKJ";
      
      public static const UI_TAIXUANSHENGONG_ZIDONGTISHENG_CLICKJ:String = "UI_TAIXUANSHENGONG_ZIDONGTISHENG_CLICKJ";
      
      public static const UI_TAIXUANSHENGONG_ZHIJIETISHENG_CLICKJ:String = "UI_TAIXUANSHENGONG_ZHIJIETISHENG_CLICKJ";
      
      public static const UI_TAIXUANSHENGONG_GOUMAI_CLICK:String = "UI_TAIXUANSHENGONG_GOUMAI_CLICK";
      
      public static const UI_TAIXUANSHENGONG_SKILL_DRAG:String = "UI_TAIXUANSHENGONG_SKILL_DRAG";
      
      public static const GETXIUWEI:String = "GETXIUWEI";
      
      public static const XIUWEI_ARROW_CLICK:String = "XIUWEI_ARROW_CLICK";
      
      public static const XIUWEI_GOUMAI_CLICK:String = "XIUWEI_GOUMAI_CLICK";
      
      public static const UI_XIUWEI_KAISHITISHENG_CLICKJ:String = "UI_XIUWEI_KAISHITISHENG_CLICKJ";
      
      public static const UI_XIUWEI_ZIDONGTISHENG_CLICKJ:String = "UI_XIUWEI_ZIDONGTISHENG_CLICKJ";
      
      public static const GETZHANHUN:String = "GETZHANHUN";
      
      public static const UI_QUZHANHUN_CLICK:String = "UI_QUZHANHUN_CLICK";
      
      public static const UI_ZHUANGBEI_CLICK:String = "UI_ZHUANGBEI_CLICK";
      
      public static const UI_ITEM_OPTION_PANEL_DRAG_START:String = "UI_BACKPACK_STONE_OPTION_PANEL_DRAG_START";
      
      public static const UI_ITEM_OPTION_PANEL_STONE_CLICK:String = "UI_ITEM_OPTION_PANEL_STONE_CLICK";
      
      public static const UI_ITEM_OPTION_PANEL_DRAG_ENTER:String = "UI_BACKPACK_STONE_OPTION_PANEL_DRAG_ENTER";
      
      public static const GETBEIMINGSHENGONG:String = "GETBEIMINGSHENGONG";
      
      public static const UI_SHIFOUSHIYONGBEIMINGSHENGONG_CLICK:String = "UI_SHIFOUSHIYONGBEIMINGSHENGONG_CLICK";
      
      public static const UI_BEIMINGSHENGONG_XIULIAN_CLICK:String = "UI_BEIMINGSHENGONG_XIULIAN_CLICK";
      
      public static const UI_BEIMINGSHENGONG_PREVIOUS_CLICK:String = "UI_BEIMINGSHENGONG_PREVIOUS_CLICK";
      
      public static const UI_BEIMINGSHENGONG_NEXT_CLICK:String = "UI_BEIMINGSHENGONG_NEXT_CLICK";
      
      public static const UI_BEIMINGSHENGONG_KAISHITISHENG_CLICKJ:String = "UI_BEIMINGSHENGONG_KAISHITISHENG_CLICKJ";
      
      public static const UI_BEIMINGSHENGONG_ZIDONGTISHENG_CLICKJ:String = "UI_BEIMINGSHENGONG_ZIDONGTISHENG_CLICKJ";
      
      public static const UI_BEIMINGSHENGONG_GOUMAI_CLICK:String = "UI_BEIMINGSHENGONG_GOUMAI_CLICK";
      
      public static const GETQISHANGQUAN:String = "GETQISHANGQUAN";
      
      public static const QISHANGQUAN_ARROW_CLICK:String = "QISHANGQUAN_ARROW_CLICK";
      
      public static const QISHANGQUAN_GOUMAI_CLICK:String = "QISHANGQUAN_GOUMAI_CLICK";
      
      public static const UI_QISHANGQUAN_KAISHITISHENG_CLICKJ:String = "UI_QISHANGQUAN_KAISHITISHENG_CLICKJ";
      
      public static const UI_QISHANGQUAN_ZIDONGTISHENG_CLICKJ:String = "UI_QISHANGQUAN_ZIDONGTISHENG_CLICKJ";
      
      public static const GETSILINGZHEN:String = "GETSILINGZHEN";
      
      public static const UI_SILINGZHEN_PANEL_ZHENYAN_CLICK:String = "UI_SILINGZHEN_PANEL_ZHENYAN_CLICK";
      
      public static const UI_SILINGZHEN_PANEL_UPGRADE_START:String = "UI_SILINGZHEN_PANEL_UPGRADE_START";
      
      public static const UI_SILINGZHEN_PANEL_UPGRADE_START_AUTO:String = "UI_SILINGZHEN_PANEL_UPGRADE_START_AUTO";
      
      public static const UI_SILINGZHEN_PANEL_UPGRADE_START_AUTO_STOP:String = "UI_SILINGZHEN_PANEL_UPGRADE_START_AUTO_STOP";
      
      public static const UI_SILINGZHEN_PANEL_UPGRADE_CLOSE:String = "UI_SILINGZHEN_PANEL_UPGRADE_CLOSE";
      
      public static const SHENZHAOJING:String = "SHENZHAOJING";
      
      public static const UI_SHENZHAOJING_PREVIOUS_CLICK:String = "UI_SHENZHAOJING_PREVIOUS_CLICK";
      
      public static const UI_SHENZHAOJING_NEXT_CLICK:String = "UI_SHENZHAOJING_NEXT_CLICK";
      
      public static const UI_SHENZHAOJING_TISHENGSUDU_CLICK:String = "UI_SHENZHAOJING_TISHENGSUDU_CLICK";
      
      public static const UI_SHENZHAOJING_TUPOPINGJING_CLICK:String = "UI_SHENZHAOJING_TUPOPINGJING_CLICK";
      
      public static const UI_SHENZHAOJING_XIULIANTISU_GOUMAI_CLICK:String = "UI_SHENZHAOJING_XIULIANTISU_GOUMAI_CLICK";
      
      public static const UI_SHENZHAOJING_XIULIANTISU_ONE_CLICK:String = "UI_SHENZHAOJING_XIULIANTISU_ONE_CLICK";
      
      public static const UI_SHENZHAOJING_XIULIANTISU_ALL_CLICK:String = "UI_SHENZHAOJING_XIULIANTISU_ALL_CLICK";
      
      public static const SHENZHAOJING_DENGJITUPO:String = "SHENZHAOJING_DENGJITUPO";
      
      public static const UI_SHENZHAOJINGTUPOPINGJING_CLOSE:String = "UI_SHENZHAOJINGTUPOPINGJING_CLOSE";
      
      public static const UI_SHENZHAOJING_KAISHITISHENG_CLICKJ:String = "UI_SHENZHAOJING_KAISHITISHENG_CLICKJ";
      
      public static const UI_SHENZHAOJING_ZIDONGTISHENG_CLICKJ:String = "UI_SHENZHAOJING_ZIDONGTISHENG_CLICKJ";
      
      public static const UI_SHENZHAOJINGTUPOPINGJING_GOUMAISHENGJIEWUPIN_CLICK:String = "UI_SHENZHAOJINGTUPOPINGJING_GOUMAISHENGJIEWUPIN_CLICK";
      
      public static const UI_SHENZHAOJING_SKILL_DRAG:String = "UI_SHENZHAOJING_SKILL_DRAG";
      
      public static const GETZIXIASHENGONG:String = "GETZIXIASHENGONG";
      
      public static const UI_ZIXIASHENGONG_DENGJITUPO_CLICKJ:String = "UI_ZIXIASHENGONG_DENGJITUPO_CLICKJ";
      
      public static const UI_ZIXIASHENGONG_KAISHITISHENG_CLICKJ:String = "UI_ZIXIASHENGONG_KAISHITISHENG_CLICKJ";
      
      public static const UI_ZIXIASHENGONG_ZIDONGTISHENG_CLICKJ:String = "UI_ZIXIASHENGONG_ZIDONGTISHENG_CLICKJ";
      
      public static const UI_ZIXIASHENGONG_CLOSEJ:String = "UI_ZIXIASHENGONG_CLOSEJ";
      
      public static const UI_ZIXIASHENGONG_GOUMAI_CLICK:String = "UI_ZIXIASHENGONG_GOUMAI_CLICK";
      
      public static const UI_ZIXIASHENGONG_EFFECT_SHOW:String = "UI_ZIXIASHENGONG_EFFECT_SHOW";
      
      public static const GETQIMENZHEN:String = "GETQIMENZHEN";
      
      public static const QIMENZHEN_ARROW_CLICK:String = "QIMENZHEN_ARROW_CLICK";
      
      public static const QIMENZHEN_GOUMAI_CLICK:String = "QIMENZHEN_GOUMAI_CLICK";
      
      public static const UI_QIMENZHEN_KAISHITISHENG_CLICKJ:String = "UI_QIMENZHEN_KAISHITISHENG_CLICKJ";
      
      public static const UI_QIMENZHEN_ZIDONGTISHENG_CLICKJ:String = "UI_QIMENZHEN_ZIDONGTISHENG_CLICKJ";
      
      public static const HAMAGONG:String = "HAMAGONG";
      
      public static const UI_HAMAGONG_LINGWU_SHOW:String = "UI_HAMAGONG_LINGWU_SHOW";
      
      public static const UI_HAMAGONG_PREVIOUS_CLICK:String = "UI_HAMAGONG_PREVIOUS_CLICK";
      
      public static const UI_HAMAGONG_NEXT_CLICK:String = "UI_HAMAGONG_NEXT_CLICK";
      
      public static const UI_HAMAGONG_KAISHITISHENG_CLICKJ:String = "UI_HAMAGONG_KAISHITISHENG_CLICKJ";
      
      public static const UI_HAMAGONG_ZIDONGTISHENG_CLICKJ:String = "UI_HAMAGONG_ZIDONGTISHENG_CLICKJ";
      
      public static const UI_HAMAGONG_GOUMAI_CLICK:String = "UI_HAMAGONG_GOUMAI_CLICK";
      
      public static const UI_HAMAGONG_CLOSEJ:String = "UI_HAMAGONG_CLOSEJ";
      
      public static const UI_HAMAGONG_SHIFOUSHIYONG_CLICK:String = "UI_HAMAGONG_SHIFOUSHIYONG_CLICK";
      
      public static const UI_HAMAGONG_SKILL_DRAG:String = "UI_HAMAGONG_SKILL_DRAG";
      
      public static const GETTIANFU:String = "GETTIANFU";
      
      public static const TIANFU_SHUAXIN_CLICK:String = "TIANFU_SHUAXIN_CLICK";
      
      public static const TIANFU_TUIMING_CLICK:String = "TIANFU_TUIMING_CLICK";
      
      public static const TIANFU_XIANGQIAN_CLICK:String = "TIANFU_XIANGQIAN_CLICK";
      
      public static const TIANFU_LINGQU_CLICK:String = "TIANFU_LINGQU_CLICK";
      
      public static const GETWUXINGZHEN:String = "GETWUXINGZHEN";
      
      public static const UI_WUXINGZHEN_TUPO_CLICK:String = "UI_WUXINGZHEN_TUPO_CLICK";
      
      public static const UI_WUXINGZHEN_KAISHITISHENG_CLICK:String = "UI_WUXINGZHEN_KAISHITISHENG_CLICK";
      
      public static const UI_WUXINGZHEN_ZIDONGTISHENG_CLICK:String = "UI_WUXINGZHEN_ZIDONGTISHENG_CLICK";
      
      public static const UI_WUXINGZHEN_GOUMAI_CLICK:String = "UI_WUXINGZHEN_GOUMAI_CLICK";
      
      public static const UI_WUXINGZHEN_PRE_NEXT_CLICK:String = "UI_WUXINGZHEN_PRE_NEXT_CLICK";
      
      public static const UI_WUXINGZHEN_TUPO_CLOSE:String = "UI_WUXINGZHEN_TUPO_CLOSE";
      
      public static const CHIXUEMOZHEN:String = "CHIXUEMOZHEN";
      
      public static const UI_CHIXUEMOZHEN_PREVIOUS_CLICK:String = "UI_CHIXUEMOZHEN_PREVIOUS_CLICK";
      
      public static const UI_CHIXUEMOZHEN_NEXT_CLICK:String = "UI_CHIXUEMOZHEN_NEXT_CLICK";
      
      public static const UI_CHIXUEMOZHEN_TUPO_CLICK:String = "UI_CHIXUEMOZHEN_TUPO_CLICK";
      
      public static const UI_CHIXUEMOZHEN_KAISHITISHENG_CLICK:String = "UI_CHIXUEMOZHEN_KAISHITISHENG_CLICK";
      
      public static const UI_CHIXUEMOZHEN_ZIDONGTISHENG_CLICK:String = "UI_CHIXUEMOZHEN_ZIDONGTISHENG_CLICK";
      
      public static const UI_CHIXUEMOZHEN_GOUMAI_CLICK:String = "UI_CHIXUEMOZHEN_GOUMAI_CLICK";
      
      public static const UI_CHIXUEMOZHEN_SKILL_DRAG:String = "UI_CHIXUEMOZHEN_SKILL_DRAG";
      
      public static const UI_CHIXUEMOZHEN_ADDITEM:String = "UI_CHIXUEMOZHEN_ADDITEM";
      
      public static const UI_CHIXUEMOZHEN_MOXUE_GUANZHU:String = "UI_CHIXUEMOZHEN_MOXUE_GUANZHU";
      
      public static const UI_CHIXUEMOZHEN_MOXUE_TISHENG:String = "UI_CHIXUEMOZHEN_MOXUE_TISHENG";
      
      public static const SANSHILIUSHOU:String = "SANSHILIUSHOU";
      
      public static const UI_SANSHILIUSHOU_PREVIOUS_CLICK:String = "UI_SANSHILIUSHOU_PREVIOUS_CLICK";
      
      public static const UI_SANSHILIUSHOU_NEXT_CLICK:String = "UI_SANSHILIUSHOU_NEXT_CLICK";
      
      public static const UI_SANSHILIUSHOU_TUPO_CLICK:String = "UI_SANSHILIUSHOU_TUPO_CLICK";
      
      public static const UI_SANSHILIUSHOU_KAISHITISHENG_CLICK:String = "UI_SANSHILIUSHOU_KAISHITISHENG_CLICK";
      
      public static const UI_SANSHILIUSHOU_ZIDONGTISHENG_CLICK:String = "UI_SANSHILIUSHOU_ZIDONGTISHENG_CLICK";
      
      public static const UI_SANSHILIUSHOU_GOUMAI_CLICK:String = "UI_SANSHILIUSHOU_GOUMAI_CLICK";
      
      public static const UI_DINGCHANJUE_SKILL_DRAG:String = "UI_DINGCHANJUE_SKILL_DRAG";
      
      public static const BEIDOUQIXINGZHEN:String = "BEIDOUQIXINGZHEN";
      
      public static const UI_BEIDOUQIXINGZHEN_XUANZHEBTN_CLICKB:String = "UI_BEIDOUQIXINGZHEN_XUANZHEBTN_CLICKB";
      
      public static const UI_BEIDOUQIXINGZHEN_JINENG_CLICKB:String = "UI_BEIDOUQIXINGZHEN_JINENG_CLICKB";
      
      public static const UI_BEIDOUQIXINGZHEN_TUPO_CLICK:String = "UI_BEIDOUQIXINGZHEN_TUPO_CLICK";
      
      public static const UI_BEIDOUQIXINGZHEN_KAISHITUPO_CLICK:String = "UI_BEIDOUQIXINGZHEN_KAISHITUPO_CLICK";
      
      public static const UI_BEIDOUQIXINGZHEN_ZIDONGTUPO_CLICK:String = "UI_BEIDOUQIXINGZHEN_ZIDONGTUPO_CLICK";
      
      public static const UI_BEIDOUQIXINGZHEN_GOUMAI_CLICK:String = "UI_BEIDOUQIXINGZHEN_GOUMAI_CLICK";
      
      public static const JINCHANTUOQIAO:String = "JINCHANTUOQIAO";
      
      public static const UI_JINCHANTUOQIAO_PREVIOUS_CLICK:String = "UI_JINCHANTUOQIAO_PREVIOUS_CLICK";
      
      public static const UI_JINCHANTUOQIAO_NEXT_CLICK:String = "UI_JINCHANTUOQIAO_NEXT_CLICK";
      
      public static const UI_JINCHANTUOQIAO_TUPO_CLICK:String = "UI_JINCHANTUOQIAO_TUPO_CLICK";
      
      public static const UI_JINCHANTUOQIAO_KAISHITISHENG_CLICK:String = "UI_JINCHANTUOQIAO_KAISHITISHENG_CLICK";
      
      public static const UI_JINCHANTUOQIAO_ZIDONGTISHENG_CLICK:String = "UI_JINCHANTUOQIAO_ZIDONGTISHENG_CLICK";
      
      public static const UI_JINCHANTUOQIAO_GOUMAI_CLICK:String = "UI_JINCHANTUOQIAO_GOUMAI_CLICK";
      
      public static const UI_JINCHANTUOQIAO_SKILL_DRAG:String = "UI_JINCHANTUOQIAO_SKILL_DRAG";
      
      public static const GETJIUQUHUANGHEZHEN:String = "GETJIUQUHUANGHEZHEN";
      
      public static const UI_JIUQUHUANGHEZHEN_SHANGYIYE_CLICK:String = "UI_JIUQUHUANGHEZHEN_SHANGYIYE_CLICK";
      
      public static const UI_JIUQUHUANGHEZHEN_XIAYIYE_CLICK:String = "UI_JIUQUHUANGHEZHEN_XIAYIYE_CLICK";
      
      public static const JIUQUHUANGHEZHEN_LINGWU_SHOW:String = "JIUQUHUANGHEZHEN_LINGWU_SHOW";
      
      public static const UI_JIUQUHUANGHEZHEN_KAISHITISHENG_CLICKJ:String = "UI_JIUQUHUANGHEZHEN_KAISHITISHENG_CLICKJ";
      
      public static const UI_JIUQUHUANGHEZHEN_ZIDONGTISHENG_CLICKJ:String = "UI_JIUQUHUANGHEZHEN_ZIDONGTISHENG_CLICKJ";
      
      public static const UI_JIUQUHUANGHEZHEN_ZHIJIETISHENG_CLICKJ:String = "UI_JIUQUHUANGHEZHEN_ZHIJIETISHENG_CLICKJ";
      
      public static const UI_JIUQUHUANGHEZHEN_GOUMAI_CLICK:String = "UI_JIUQUHUANGHEZHEN_GOUMAI_CLICK";
      
      public static const ZHENWUQIJIEZHEN:String = "ZHENWUQIJIEZHEN";
      
      public static const UI_ZHENWUQIJIEZHEN_SHANGYIYE_CLICK:String = "UI_ZHENWUQIJIEZHEN_SHANGYIYE_CLICK";
      
      public static const UI_ZHENWUQIJIEZHEN_XIAYIYE_CLICK:String = "UI_ZHENWUQIJIEZHEN_XIAYIYE_CLICK";
      
      public static const UI_ZHENWUQIJIEZHEN_LINGWU_SHOW:String = "UI_ZHENWUQIJIEZHEN_LINGWU_SHOW";
      
      public static const UI_ZHENWUQIJIEZHEN_KAISHITISHENG_CLICK:String = "UI_ZHENWUQIJIEZHEN_KAISHITISHENG_CLICK";
      
      public static const UI_ZHENWUQIJIEZHEN_ZIDONGTISHENG_CLICK:String = "UI_ZHENWUQIJIEZHEN_ZIDONGTISHENG_CLICK";
      
      public static const UI_ZHENWUQIJIEZHEN_GOUMAI_CLICK:String = "UI_ZHENWUQIJIEZHEN_GOUMAI_CLICK";
      
      public static const UI_ZHENWUQIJIEZHEN_SKILL_DRAG:String = "UI_ZHENWUQIJIEZHEN_SKILL_DRAG";
      
      public static const XUNZHANGYANGCHENG:String = "XUNZHANGYANGCHENG";
      
      public static const UI_XUNZHANGYANGCHENG_LINGQU_CLICK:String = "UI_XUNZHANGYANGCHENG_LINGQU_CLICK";
      
      public static const UI_XUNZHANGYANGCHENG_YANGCHENG_CLICK:String = "UI_XUNZHANGYANGCHENG_YANGCHENG_CLICK";
      
      public static const DOUZHUANXINGYI:String = "DOUZHUANXINGYI";
      
      public static const UI_DOUZHUANXINGYI_PREVIOUS_CLICK:String = "UI_DOUZHUANXINGYI_PREVIOUS_CLICK";
      
      public static const UI_DOUZHUANXINGYI_NEXT_CLICK:String = "UI_DOUZHUANXINGYI_NEXT_CLICK";
      
      public static const UI_DOUZHUANXINGYI_TUPO_CLICK:String = "UI_DOUZHUANXINGYI_TUPO_CLICK";
      
      public static const UI_DOUZHUANXINGYI_KAISHITISHENG_CLICK:String = "UI_DOUZHUANXINGYI_KAISHITISHENG_CLICK";
      
      public static const UI_DOUZHUANXINGYI_ZIDONGTISHENG_CLICK:String = "UI_DOUZHUANXINGYI_ZIDONGTISHENG_CLICK";
      
      public static const UI_DOUZHUANXINGYI_GOUMAI_CLICK:String = "UI_DOUZHUANXINGYI_GOUMAI_CLICK";
      
      public static const GUILIUZHEN:String = "GUILIUZHEN";
      
      public static const UI_GUILIUZHEN_SHANGYIYE_CLICK:String = "UI_GUILIUZHEN_SHANGYIYE_CLICK";
      
      public static const UI_GUILIUZHEN_XIAYIYE_CLICK:String = "UI_GUILIUZHEN_XIAYIYE_CLICK";
      
      public static const UI_GUILIUZHEN_LINGWU_SHOW:String = "UI_GUILIUZHEN_LINGWU_SHOW";
      
      public static const UI_GUILIUZHEN_KAISHITISHENG_CLICK:String = "UI_GUILIUZHEN_KAISHITISHENG_CLICK";
      
      public static const UI_GUILIUZHEN_ZIDONGTISHENG_CLICK:String = "UI_GUILIUZHEN_ZIDONGTISHENG_CLICK";
      
      public static const UI_GUILIUZHEN_GOUMAI_CLICK:String = "UI_GUILIUZHEN_GOUMAI_CLICK";
      
      public static const JINGANGFUMOQUAN:String = "JINGANGFUMOQUAN";
      
      public static const UI_JINGANGFUMOQUAN_SHANGYIYE_CLICK:String = "UI_JINGANGFUMOQUAN_SHANGYIYE_CLICK";
      
      public static const UI_JINGANGFUMOQUAN_XIAYIYE_CLICK:String = "UI_JINGANGFUMOQUAN_XIAYIYE_CLICK";
      
      public static const UI_JINGANGFUMOQUAN_LINGWU_SHOW:String = "UI_JINGANGFUMOQUAN_LINGWU_SHOW";
      
      public static const UI_JINGANGFUMOQUAN_KAISHITISHENG_CLICK:String = "UI_JINGANGFUMOQUAN_KAISHITISHENG_CLICK";
      
      public static const UI_JINGANGFUMOQUAN_ZIDONGTISHENG_CLICK:String = "UI_JINGANGFUMOQUAN_ZIDONGTISHENG_CLICK";
      
      public static const UI_JINGANGFUMOQUAN_GOUMAI_CLICK:String = "UI_JINGANGFUMOQUAN_GOUMAI_CLICK";
      
      public static const UI_JINGANGFUMOQUAN_SKILL_DRAG:String = "UI_JINGANGFUMOQUAN_SKILL_DRAG";
      
      public static const QINLONGGONG:String = "QINLONGGONG";
      
      public static const UI_QINLONGGONG_PREVIOUS_CLICK:String = "UI_QINLONGGONG_PREVIOUS_CLICK";
      
      public static const UI_QINLONGGONG_NEXT_CLICK:String = "UI_QINLONGGONG_NEXT_CLICK";
      
      public static const UI_QINLONGGONG_TUPO_CLICK:String = "UI_QINLONGGONG_TUPO_CLICK";
      
      public static const UI_QINLONGGONG_KAISHITISHENG_CLICK:String = "UI_QINLONGGONG_KAISHITISHENG_CLICK";
      
      public static const UI_QINLONGGONG_ZIDONGTISHENG_CLICK:String = "UI_QINLONGGONG_ZIDONGTISHENG_CLICK";
      
      public static const UI_QINLONGGONG_GOUMAI_CLICK:String = "UI_QINLONGGONG_GOUMAI_CLICK";
      
      public static const UI_QINLONGGONG_SKILL_DRAG:String = "UI_QINLONGGONG_SKILL_DRAG";
      
      public static const CHIBANG:String = "CHIBANG";
      
      public static const UI_CHIBANG_HUANYE_CLICK:String = "UI_CHIBANG_HUANYE_CLICK";
      
      public static const UI_CHIBANG_FEIXING_CLICK:String = "UI_CHIBANG_FEIXING_CLICK";
      
      public static const UI_CHIBANG_WAIGUAN_CLICK:String = "UI_CHIBANG_WAIGUAN_CLICK";
      
      public static const UI_CHIBANG_HECHENG_SHOW:String = "UI_CHIBANG_HECHENG_SHOW";
      
      public static const UI_CHIBANG_LINGWU_SHOW:String = "UI_CHIBANG_LINGWU_SHOW";
      
      public static const UI_CHIBANG_KAISHITISHENG_CLICK:String = "UI_CHIBANG_KAISHITISHENG_CLICK";
      
      public static const UI_CHIBANG_ZIDONGTISHENG_CLICK:String = "UI_CHIBANG_ZIDONGTISHENG_CLICK";
      
      public static const UI_CHIBANG_GOUMAI_CLICK:String = "UI_CHIBANG_GOUMAI_CLICK";
      
      public static const UI_CHIBANG_HUADIE_CLICK:String = "UI_CHIBANG_HUADIE_CLICK";
      
      public static const TENGTIANYI:String = "TENGTIANYI";
      
      public static const UI_TENGTIANYI_HUANYE_CLICK:String = "UI_TENGTIANYI_HUANYE_CLICK";
      
      public static const UI_TENGTIANYI_WAIGUAN_CLICK:String = "UI_TENGTIANYI_WAIGUAN_CLICK";
      
      public static const UI_TENGTIANYI_LINGWU_SHOW:String = "UI_TENGTIANYI_LINGWU_SHOW";
      
      public static const UI_TENGTIANYI_KAISHITISHENG_CLICK:String = "UI_TENGTIANYIG_KAISHITISHENG_CLICK";
      
      public static const UI_TENGTIANYI_ZIDONGTISHENG_CLICK:String = "UI_TENGTIANYI_ZIDONGTISHENG_CLICK";
      
      public static const UI_TENGTIANYI_GOUMAI_CLICK:String = "UI_TENGTIANYI_GOUMAI_CLICK";
      
      public static const UI_TENGTIANYI_BANIANSHENWU_CLICK:String = "UI_TENGTIANYI_BANIANSHENWU_CLICK";
      
      public static const XIAOYAOYUFENG:String = "XIAOYAOYUFENG";
      
      public static const UI_XIAOYAOYUFENG_PREVIOUS_CLICK:String = "UI_XIAOYAOYUFENG_PREVIOUS_CLICK";
      
      public static const UI_XIAOYAOYUFENG_NEXT_CLICK:String = "UI_XIAOYAOYUFENG_NEXT_CLICK";
      
      public static const UI_XIAOYAOYUFENG_TUPO_CLICK:String = "UI_XIAOYAOYUFENG_TUPO_CLICK";
      
      public static const UI_XIAOYAOYUFENG_SHEZHI_CLICK:String = "UI_XIAOYAOYUFENG_SHEZHI_CLICK";
      
      public static const UI_XIAOYAOYUFENG_KAISHITISHENG_CLICK:String = "UI_XIAOYAOYUFENG_KAISHITISHENG_CLICK";
      
      public static const UI_XIAOYAOYUFENG_ZIDONGTISHENG_CLICK:String = "UI_XIAOYAOYUFENG_ZIDONGTISHENG_CLICK";
      
      public static const UI_XIAOYAOYUFENG_GOUMAI_CLICK:String = "UI_XIAOYAOYUFENG_GOUMAI_CLICK";
      
      public static const UI_XIAOYAOYUFENG_SKILL_DRAG:String = "UI_XIAOYAOYUFENG_SKILL_DRAG";
      
      public static const UI_XIAOYAOYUFENG_ZIDONGSHIYONG_CLICK:String = "UI_XIAOYAOYUFENG_ZIDONGSHIYONG_CLICK";
      
      public static const LIANQI:String = "LIANQI";
      
      public static const UI_LIANQI_PREVIOUS_CLICK:String = "UI_LIANQI_PREVIOUS_CLICK";
      
      public static const UI_LIANQI_NEXT_CLICK:String = "UI_LIANQI_NEXT_CLICK";
      
      public static const UI_LIANQI_LINGWU_SHOW:String = "UI_LIANQI_LINGWU_SHOW";
      
      public static const UI_LIANQI_QINGQIU_CLICK:String = "UI_LIANQI_QINGQIU_CLICK";
      
      public static const UI_LIANQI_HUOQU_CLICK:String = "UI_LIANQI_HUOQU_CLICK";
      
      public static const UI_LIANQI_KAISHITISHENG_CLICK:String = "UI_LIANQI_KAISHITISHENG_CLICK";
      
      public static const UI_LIANQI_ZIDONGTISHENG_CLICK:String = "UI_LIANQI_ZIDONGTISHENG_CLICK";
      
      public static const UI_LIANQI_GOUMAI_CLICK:String = "UI_LIANQI_GOUMAI_CLICK";
      
      public static const GETGANJIANGMOYE:String = "GETGANJIANGMOYE";
      
      public static const UI_GANJIANGMOYE_DUANZAO_CLICK:String = "UI_GANJIANGMOYE_DUANZAO_CLICK";
      
      public static const UI_GANJIANGMOYE_HUANHUA_CLICK:String = "UI_GANJIANGMOYE_HUANHUA_CLICK";
      
      public static const TIANMENZHEN:String = "TIANMENZHEN";
      
      public static const UI_TIANMENZHEN_SHANGYIYE_CLICK:String = "UI_TIANMENZHEN_SHANGYIYE_CLICK";
      
      public static const UI_TIANMENZHEN_XIAYIYE_CLICK:String = "UI_TIANMENZHEN_XIAYIYE_CLICK";
      
      public static const UI_TIANMENZHEN_LINGWU_SHOW:String = "UI_TIANMENZHEN_LINGWU_SHOW";
      
      public static const UI_TIANMENZHEN_BUZHEN_CLICK:String = "UI_TIANMENZHEN_BUZHEN_CLICK";
      
      public static const UI_TIANMENZHEN_XIANSHI_CHECK:String = "UI_TIANMENZHEN_XIANSHI_CHECK";
      
      public static const UI_TIANMENZHEN_KAISHITISHENG_CLICK:String = "UI_TIANMENZHEN_KAISHITISHENG_CLICK";
      
      public static const UI_TIANMENZHEN_ZIDONGTISHENG_CLICK:String = "UI_TIANMENZHEN_ZIDONGTISHENG_CLICK";
      
      public static const UI_TIANMENZHEN_GOUMAI_CLICK:String = "UI_TIANMENZHEN_GOUMAI_CLICK";
      
      public static const UI_TIANMENZHEN_BAOFA_CLICK:String = "UI_TIANMENZHEN_BAOFA_CLICK";
      
      public static const BIHAICHAOSHENGQU:String = "BIHAICHAOSHENGQU";
      
      public static const UI_BIHAICHAOSHENGQU_PREVIOUS_CLICK:String = "UI_BIHAICHAOSHENGQU_PREVIOUS_CLICK";
      
      public static const UI_BIHAICHAOSHENGQU_NEXT_CLICK:String = "UI_BIHAICHAOSHENGQU_NEXT_CLICK";
      
      public static const UI_BIHAICHAOSHENGQU_TUPO_CLICK:String = "UI_BIHAICHAOSHENGQU_TUPO_CLICK";
      
      public static const UI_BIHAICHAOSHENGQU_KAISHITISHENG_CLICK:String = "UI_BIHAICHAOSHENGQU_KAISHITISHENG_CLICK";
      
      public static const UI_BIHAICHAOSHENGQU_ZIDONGTISHENG_CLICK:String = "UI_BIHAICHAOSHENGQU_ZIDONGTISHENG_CLICK";
      
      public static const UI_BIHAICHAOSHENGQU_GOUMAI_CLICK:String = "UI_BIHAICHAOSHENGQU_GOUMAI_CLICK";
      
      public static const HEYIZHEN:String = "HEYIZHEN";
      
      public static const UI_HEYIZHEN_SHANGYIYE_CLICK:String = "UI_HEYIZHEN_SHANGYIYE_CLICK";
      
      public static const UI_HEYIZHEN_XIAYIYE_CLICK:String = "UI_HEYIZHEN_XIAYIYE_CLICK";
      
      public static const UI_HEYIZHEN_LINGWU_SHOW:String = "UI_HEYIZHEN_LINGWU_SHOW";
      
      public static const UI_HEYIZHEN_BUZHEN_CLICK:String = "UI_HEYIZHEN_BUZHEN_CLICK";
      
      public static const UI_HEYIZHEN_XIANSHI_CHECK:String = "UI_HEYIZHEN_XIANSHI_CHECK";
      
      public static const UI_HEYIZHEN_KAISHITISHENG_CLICK:String = "UI_HEYIZHEN_KAISHITISHENG_CLICK";
      
      public static const UI_HEYIZHEN_ZIDONGTISHENG_CLICK:String = "UI_HEYIZHEN_ZIDONGTISHENG_CLICK";
      
      public static const UI_HEYIZHEN_GOUMAI_CLICK:String = "UI_HEYIZHEN_GOUMAI_CLICK";
      
      public static const UI_HEYIZHEN_BAOFA_CLICK:String = "UI_HEYIZHEN_BAOFA_CLICK";
      
      public static const YUXIAOJIANFA:String = "YUXIAOJIANFA";
      
      public static const UI_YUXIAOJIANFA_PREVIOUS_CLICK:String = "UI_YUXIAOJIANFA_PREVIOUS_CLICK";
      
      public static const UI_YUXIAOJIANFA_NEXT_CLICK:String = "UI_YUXIAOJIANFA_NEXT_CLICK";
      
      public static const UI_YUXIAOJIANFA_TUPO_CLICK:String = "UI_YUXIAOJIANFA_TUPO_CLICK";
      
      public static const UI_YUXIAOJIANFA_KAISHITISHENG_CLICK:String = "UI_YUXIAOJIANFA_KAISHITISHENG_CLICK";
      
      public static const UI_YUXIAOJIANFA_ZIDONGTISHENG_CLICK:String = "UI_YUXIAOJIANFA_ZIDONGTISHENG_CLICK";
      
      public static const UI_YUXIAOJIANFA_GOUMAI_CLICK:String = "UI_YUXIAOJIANFA_GOUMAI_CLICK";
      
      public static const YULIZHEN:String = "YULIZHEN";
      
      public static const UI_YULIZHEN_SHANGYIYE_CLICK:String = "UI_YULIZHEN_SHANGYIYE_CLICK";
      
      public static const UI_YULIZHEN_XIAYIYE_CLICK:String = "UI_YULIZHEN_XIAYIYE_CLICK";
      
      public static const UI_YULIZHEN_LINGWU_SHOW:String = "UI_YULIZHEN_LINGWU_SHOW";
      
      public static const UI_YULIZHEN_BUZHEN_CLICK:String = "UI_YULIZHEN_BUZHEN_CLICK";
      
      public static const UI_YULIZHEN_XIANSHI_CHECK:String = "UI_YULIZHEN_XIANSHI_CHECK";
      
      public static const UI_YULIZHEN_KAISHITISHENG_CLICK:String = "UI_YULIZHEN_KAISHITISHENG_CLICK";
      
      public static const UI_YULIZHEN_ZIDONGTISHENG_CLICK:String = "UI_YULIZHEN_ZIDONGTISHENG_CLICK";
      
      public static const UI_YULIZHEN_GOUMAI_CLICK:String = "UI_YULIZHEN_GOUMAI_CLICK";
      
      public static const UI_YULIZHEN_BAOFA_CLICK:String = "UI_YULIZHEN_BAOFA_CLICK";
      
      public static const YANYUEZHEN:String = "YANYUEZHEN";
      
      public static const UI_YANYUEZHEN_SHANGYIYE_CLICK:String = "UI_YANYUEZHEN_SHANGYIYE_CLICK";
      
      public static const UI_YANYUEZHEN_XIAYIYE_CLICK:String = "UI_YANYUEZHEN_XIAYIYE_CLICK";
      
      public static const UI_YANYUEZHEN_LINGWU_SHOW:String = "UI_YANYUEZHEN_LINGWU_SHOW";
      
      public static const UI_YANYUEZHEN_BUZHEN_CLICK:String = "UI_YANYUEZHEN_BUZHEN_CLICK";
      
      public static const UI_YANYUEZHEN_XIANSHI_CHECK:String = "UI_YANYUEZHEN_XIANSHI_CHECK";
      
      public static const UI_YANYUEZHEN_KAISHITISHENG_CLICK:String = "UI_YANYUEZHEN_KAISHITISHENG_CLICK";
      
      public static const UI_YANYUEZHEN_ZIDONGTISHENG_CLICK:String = "UI_YANYUEZHEN_ZIDONGTISHENG_CLICK";
      
      public static const UI_YANYUEZHEN_GOUMAI_CLICK:String = "UI_YANYUEZHEN_GOUMAI_CLICK";
      
      public static const CHANGSHEZHEN:String = "CHANGSHEZHEN";
      
      public static const UI_CHANGSHEZHEN_SHANGYIYE_CLICK:String = "UI_CHANGSHEZHEN_SHANGYIYE_CLICK";
      
      public static const UI_CHANGSHEZHEN_XIAYIYE_CLICK:String = "UI_CHANGSHEZHEN_XIAYIYE_CLICK";
      
      public static const UI_CHANGSHEZHEN_LINGWU_SHOW:String = "UI_CHANGSHEZHEN_LINGWU_SHOW";
      
      public static const UI_CHANGSHEZHEN_BUZHEN_CLICK:String = "UI_CHANGSHEZHEN_BUZHEN_CLICK";
      
      public static const UI_CHANGSHEZHEN_XIANSHI_CHECK:String = "UI_CHANGSHEZHEN_XIANSHI_CHECK";
      
      public static const UI_CHANGSHEZHEN_KAISHITISHENG_CLICK:String = "UI_CHANGSHEZHEN_KAISHITISHENG_CLICK";
      
      public static const UI_CHANGSHEZHEN_ZIDONGTISHENG_CLICK:String = "UI_CHANGSHEZHEN_ZIDONGTISHENG_CLICK";
      
      public static const UI_CHANGSHEZHEN_GOUMAI_CLICK:String = "UI_CHANGSHEZHEN_GOUMAI_CLICK";
      
      public static const UI_CHANGSHEZHEN_BAOFA_CLICK:String = "UI_CHANGSHEZHEN_BAOFA_CLICK";
      
      public static const CANHEZHI:String = "CANHEZHI";
      
      public static const UI_CANHEZHI_PREVIOUS_CLICK:String = "UI_CANHEZHI_PREVIOUS_CLICK";
      
      public static const UI_CANHEZHI_NEXT_CLICK:String = "UI_CANHEZHI_NEXT_CLICK";
      
      public static const UI_CANHEZHI_TUPO_CLICK:String = "UI_CANHEZHI_TUPO_CLICK";
      
      public static const UI_CANHEZHI_KAISHITISHENG_CLICK:String = "UI_CANHEZHI_KAISHITISHENG_CLICK";
      
      public static const UI_CANHEZHI_ZIDONGTISHENG_CLICK:String = "UI_CANHEZHI_ZIDONGTISHENG_CLICK";
      
      public static const UI_CANHEZHI_GOUMAI_CLICK:String = "UI_CANHEZHI_GOUMAI_CLICK";
      
      public static const EMOZHIYI:String = "EMOZHIYI";
      
      public static const UI_EMOZHIYI_HUANYE_CLICK:String = "UI_EMOZHIYI_HUANYE_CLICK";
      
      public static const UI_EMOZHIYI_FEIXING_CLICK:String = "UI_EMOZHIYI_FEIXING_CLICK";
      
      public static const UI_EMOZHIYI_WAIGUAN_CLICK:String = "UI_EMOZHIYI_WAIGUAN_CLICK";
      
      public static const UI_EMOZHIYI_HECHENG_SHOW:String = "UI_EMOZHIYI_HECHENG_SHOW";
      
      public static const UI_EMOZHIYI_LINGWU_SHOW:String = "UI_EMOZHIYI_LINGWU_SHOW";
      
      public static const UI_EMOZHIYI_KAISHITISHENG_CLICK:String = "UI_EMOZHIYI_KAISHITISHENG_CLICK";
      
      public static const UI_EMOZHIYI_ZIDONGTISHENG_CLICK:String = "UI_EMOZHIYI_ZIDONGTISHENG_CLICK";
      
      public static const UI_EMOZHIYI_GOUMAI_CLICK:String = "UI_EMOZHIYI_GOUMAI_CLICK";
      
      public static const YANXINGZHEN:String = "YANXINGZHEN";
      
      public static const UI_YANXINGZHEN_SHANGYIYE_CLICK:String = "UI_YANXINGZHEN_SHANGYIYE_CLICK";
      
      public static const UI_YANXINGZHEN_XIAYIYE_CLICK:String = "UI_YANXINGZHEN_XIAYIYE_CLICK";
      
      public static const UI_YANXINGZHEN_LINGWU_SHOW:String = "UI_YANXINGZHEN_LINGWU_SHOW";
      
      public static const UI_YANXINGZHEN_BUZHEN_CLICK:String = "UI_YANXINGZHEN_BUZHEN_CLICK";
      
      public static const UI_YANXINGZHEN_XIANSHI_CHECK:String = "UI_YANXINGZHEN_XIANSHI_CHECK";
      
      public static const UI_YANXINGZHEN_KAISHITISHENG_CLICK:String = "UI_YANXINGZHEN_KAISHITISHENG_CLICK";
      
      public static const UI_YANXINGZHEN_ZIDONGTISHENG_CLICK:String = "UI_YANXINGZHEN_ZIDONGTISHENG_CLICK";
      
      public static const UI_YANXINGZHEN_GOUMAI_CLICK:String = "UI_YANXINGZHEN_GOUMAI_CLICK";
      
      public static const XUANXIANGZHEN:String = "XUANXIANGZHEN";
      
      public static const UI_XUANXIANGZHEN_SHANGYIYE_CLICK:String = "UI_XUANXIANGZHEN_SHANGYIYE_CLICK";
      
      public static const UI_XUANXIANGZHEN_XIAYIYE_CLICK:String = "UI_XUANXIANGZHEN_XIAYIYE_CLICK";
      
      public static const UI_XUANXIANGZHEN_LINGWU_SHOW:String = "UI_XUANXIANGZHEN_LINGWU_SHOW";
      
      public static const UI_XUANXIANGZHEN_BUZHEN_CLICK:String = "UI_XUANXIANGZHEN_BUZHEN_CLICK";
      
      public static const UI_XUANXIANGZHEN_XIANSHI_CHECK:String = "UI_XUANXIANGZHEN_XIANSHI_CHECK";
      
      public static const UI_XUANXIANGZHEN_KAISHITISHENG_CLICK:String = "UI_XUANXIANGZHEN_KAISHITISHENG_CLICK";
      
      public static const UI_XUANXIANGZHEN_ZIDONGTISHENG_CLICK:String = "UI_XUANXIANGZHEN_ZIDONGTISHENG_CLICK";
      
      public static const UI_XUANXIANGZHEN_GOUMAI_CLICK:String = "UI_XUANXIANGZHEN_GOUMAI_CLICK";
      
      public static const JUEZHANGUANGMINGDING:String = "JUEZHANGUANGMINGDING";
      
      public static const WODERONGYU:String = "WODERONGYU";
      
      public static const UI_WODERONGYU_FANYE_CLICK:String = "UI_WODERONGYU_FANYE_CLICK";
      
      public static const UI_WODERONGYU_GUANZHU_CLICK:String = "UI_WODERONGYU_GUANZHU_CLICK";
      
      public static const REQUEST_YNHUANGDAO:String = "REQUEST_YNHUANGDAO";
      
      public static const REQUEST_ZHUANPAN:String = "REQUEST_ZHUANPAN";
      
      public static const REQUEST_WZZB:String = "REQUEST_WZZB";
      
      public static const REQUEST_FSZB:String = "REQUEST_FSZB";
      
      public static const HUTAOZHEN:String = "HUTAOZHEN";
      
      public static const UI_HUTAOZHEN_SHANGYIYE_CLICK:String = "UI_HUTAOZHEN_SHANGYIYE_CLICK";
      
      public static const UI_HUTAOZHEN_XIAYIYE_CLICK:String = "UI_HUTAOZHEN_XIAYIYE_CLICK";
      
      public static const UI_HUTAOZHEN_LINGWU_SHOW:String = "UI_HUTAOZHEN_LINGWU_SHOW";
      
      public static const UI_HUTAOZHEN_BUZHEN_CLICK:String = "UI_HUTAOZHEN_BUZHEN_CLICK";
      
      public static const UI_HUTAOZHEN_XIANSHI_CHECK:String = "UI_HUTAOZHEN_XIANSHI_CHECK";
      
      public static const UI_HUTAOZHEN_KAISHITISHENG_CLICK:String = "UI_HUTAOZHEN_KAISHITISHENG_CLICK";
      
      public static const UI_HUTAOZHEN_ZIDONGTISHENG_CLICK:String = "UI_HUTAOZHEN_ZIDONGTISHENG_CLICK";
      
      public static const UI_HUTAOZHEN_GOUMAI_CLICK:String = "UI_HUTAOZHEN_GOUMAI_CLICK";
      
      public static const YUNLONGZHEN:String = "YUNLONGZHEN";
      
      public static const UI_YUNLONGZHEN_SHANGYIYE_CLICK:String = "UI_YUNLONGZHEN_SHANGYIYE_CLICK";
      
      public static const UI_YUNLONGZHEN_XIAYIYE_CLICK:String = "UI_YUNLONGZHEN_XIAYIYE_CLICK";
      
      public static const UI_YUNLONGZHEN_LINGWU_SHOW:String = "UI_YUNLONGZHEN_LINGWU_SHOW";
      
      public static const UI_YUNLONGZHEN_BUZHEN_CLICK:String = "UI_YUNLONGZHEN_BUZHEN_CLICK";
      
      public static const UI_YUNLONGZHEN_XIANSHI_CHECK:String = "UI_YUNLONGZHEN_XIANSHI_CHECK";
      
      public static const UI_YUNLONGZHEN_KAISHITISHENG_CLICK:String = "UI_YUNLONGZHEN_KAISHITISHENG_CLICK";
      
      public static const UI_YUNLONGZHEN_ZIDONGTISHENG_CLICK:String = "UI_YUNLONGZHEN_ZIDONGTISHENG_CLICK";
      
      public static const UI_YUNLONGZHEN_GOUMAI_CLICK:String = "UI_YUNLONGZHEN_GOUMAI_CLICK";
      
      public static const XIANTIANGONG:String = "XIANTIANGONG";
      
      public static const UI_XIANTIANGONG_PREVIOUS_CLICK:String = "UI_XIANTIANGONG_PREVIOUS_CLICK";
      
      public static const UI_XIANTIANGONG_NEXT_CLICK:String = "UI_XIANTIANGONG_NEXT_CLICK";
      
      public static const UI_XIANTIANGONG_TUPO_CLICK:String = "UI_XIANTIANGONG_TUPO_CLICK";
      
      public static const UI_XIANTIANGONG_KAISHITISHENG_CLICK:String = "UI_XIANTIANGONG_KAISHITISHENG_CLICK";
      
      public static const UI_XIANTIANGONG_ZIDONGTISHENG_CLICK:String = "UI_XIANTIANGONG_ZIDONGTISHENG_CLICK";
      
      public static const UI_XIANTIANGONG_GOUMAI_CLICK:String = "UI_XIANTIANGONG_GOUMAI_CLICK";
      
      public static const PANGXIEZHEN:String = "PANGXIEZHEN";
      
      public static const UI_PANGXIEZHEN_SHANGYIYE_CLICK:String = "UI_PANGXIEZHEN_SHANGYIYE_CLICK";
      
      public static const UI_PANGXIEZHEN_XIAYIYE_CLICK:String = "UI_PANGXIEZHEN_XIAYIYE_CLICK";
      
      public static const UI_PANGXIEZHEN_LINGWU_SHOW:String = "UI_PANGXIEZHEN_LINGWU_SHOW";
      
      public static const UI_PANGXIEZHEN_BUZHEN_CLICK:String = "UI_PANGXIEZHEN_BUZHEN_CLICK";
      
      public static const UI_PANGXIEZHEN_XIANSHI_CHECK:String = "UI_PANGXIEZHEN_XIANSHI_CHECK";
      
      public static const UI_PANGXIEZHEN_KAISHITISHENG_CLICK:String = "UI_PANGXIEZHEN_KAISHITISHENG_CLICK";
      
      public static const UI_PANGXIEZHEN_ZIDONGTISHENG_CLICK:String = "UI_PANGXIEZHEN_ZIDONGTISHENG_CLICK";
      
      public static const UI_PANGXIEZHEN_GOUMAI_CLICK:String = "UI_PANGXIEZHEN_GOUMAI_CLICK";
      
      public static const XUEDAOXINFA:String = "XUEDAOXINFA";
      
      public static const UI_XUEDAOXINFA_PREVIOUS_CLICK:String = "UI_XUEDAOXINFA_PREVIOUS_CLICK";
      
      public static const UI_XUEDAOXINFA_NEXT_CLICK:String = "UI_XUEDAOXINFA_NEXT_CLICK";
      
      public static const UI_XUEDAOXINFA_TUPO_CLICK:String = "UI_XUEDAOXINFA_TUPO_CLICK";
      
      public static const UI_XUEDAOXINFA_KAISHITISHENG_CLICK:String = "UI_XUEDAOXINFA_KAISHITISHENG_CLICK";
      
      public static const UI_XUEDAOXINFA_ZIDONGTISHENG_CLICK:String = "UI_XUEDAOXINFA_ZIDONGTISHENG_CLICK";
      
      public static const UI_XUEDAOXINFA_GOUMAI_CLICK:String = "UI_XUEDAOXINFA_GOUMAI_CLICK";
      
      public static const HUYIJUEXING:String = "HUYIJUEXING";
      
      public static const UI_HUYIJUEXING_PREVIOUS_CLICK:String = "UI_HUYIJUEXING_PREVIOUS_CLICK";
      
      public static const UI_HUYIJUEXING_NEXT_CLICK:String = "UI_HUYIJUEXING_NEXT_CLICK";
      
      public static const UI_HUYIJUEXING_TUPO_CLICK:String = "UI_HUYIJUEXING_TUPO_CLICK";
      
      public static const UI_HUYIJUEXING_KAISHITISHENG_CLICK:String = "UI_HUYIJUEXING_KAISHITISHENG_CLICK";
      
      public static const UI_HUYIJUEXING_ZIDONGTISHENG_CLICK:String = "UI_HUYIJUEXING_ZIDONGTISHENG_CLICK";
      
      public static const UI_HUYIJUEXING_GOUMAI_CLICK:String = "UI_HUYIJUEXING_GOUMAI_CLICK";
      
      public static const UI_HUYIJUEXING_XIANGQIAN_CLICK:String = "UI_HUYIJUEXING_XIANGQIAN_CLICK";
      
      public static const DIZAIZHEN:String = "DIZAIZHEN";
      
      public static const UI_DIZAIZHEN_SHANGYIYE_CLICK:String = "UI_DIZAIZHEN_SHANGYIYE_CLICK";
      
      public static const UI_DIZAIZHEN_XIAYIYE_CLICK:String = "UI_DIZAIZHEN_XIAYIYE_CLICK";
      
      public static const UI_DIZAIZHEN_LINGWU_SHOW:String = "UI_DIZAIZHEN_LINGWU_SHOW";
      
      public static const UI_DIZAIZHEN_BUZHEN_CLICK:String = "UI_DIZAIZHEN_BUZHEN_CLICK";
      
      public static const UI_DIZAIZHEN_XIANSHI_CHECK:String = "UI_DIZAIZHEN_XIANSHI_CHECK";
      
      public static const UI_DIZAIZHEN_KAISHITISHENG_CLICK:String = "UI_DIZAIZHEN_KAISHITISHENG_CLICK";
      
      public static const UI_DIZAIZHEN_ZIDONGTISHENG_CLICK:String = "UI_DIZAIZHEN_ZIDONGTISHENG_CLICK";
      
      public static const UI_DIZAIZHEN_GOUMAI_CLICK:String = "UI_DIZAIZHEN_GOUMAI_CLICK";
      
      public static const FENGYANGZHEN:String = "FENGYANGZHEN";
      
      public static const UI_FENGYANGZHEN_SHANGYIYE_CLICK:String = "UI_FENGYANGZHEN_SHANGYIYE_CLICK";
      
      public static const UI_FENGYANGZHEN_XIAYIYE_CLICK:String = "UI_FENGYANGZHEN_XIAYIYE_CLICK";
      
      public static const UI_FENGYANGZHEN_LINGWU_SHOW:String = "UI_FENGYANGZHEN_LINGWU_SHOW";
      
      public static const UI_FENGYANGZHEN_BUZHEN_CLICK:String = "UI_FENGYANGZHEN_BUZHEN_CLICK";
      
      public static const UI_FENGYANGZHEN_XIANSHI_CHECK:String = "UI_FENGYANGZHEN_XIANSHI_CHECK";
      
      public static const UI_FENGYANGZHEN_KAISHITISHENG_CLICK:String = "UI_FENGYANGZHEN_KAISHITISHENG_CLICK";
      
      public static const UI_FENGYANGZHEN_ZIDONGTISHENG_CLICK:String = "UI_FENGYANGZHEN_ZIDONGTISHENG_CLICK";
      
      public static const UI_FENGYANGZHEN_GOUMAI_CLICK:String = "UI_FENGYANGZHEN_GOUMAI_CLICK";
      
      public static const LONGYAJUEXING:String = "LONGYAJUEXING";
      
      public static const UI_LONGYAJUEXING_PREVIOUS_CLICK:String = "UI_LONGYAJUEXING_PREVIOUS_CLICK";
      
      public static const UI_LONGYAJUEXING_NEXT_CLICK:String = "UI_LONGYAJUEXING_NEXT_CLICK";
      
      public static const UI_LONGYAJUEXING_TUPO_CLICK:String = "UI_LONGYAJUEXING_TUPO_CLICK";
      
      public static const UI_LONGYAJUEXING_KAISHITISHENG_CLICK:String = "UI_LONGYAJUEXING_KAISHITISHENG_CLICK";
      
      public static const UI_LONGYAJUEXING_ZIDONGTISHENG_CLICK:String = "UI_LONGYAJUEXING_ZIDONGTISHENG_CLICK";
      
      public static const UI_LONGYAJUEXING_GOUMAI_CLICK:String = "UI_LONGYAJUEXING_GOUMAI_CLICK";
      
      public static const UI_LONGYAJUEXING_XIANGQIAN_CLICK:String = "UI_LONGYAJUEXING_XIANGQIAN_CLICK";
      
      public static const QUANSHENJUEXING:String = "QUANSHENJUEXING";
      
      public static const UI_QUANSHENJUEXING_PREVIOUS_CLICK:String = "UI_QUANSHENJUEXING_PREVIOUS_CLICK";
      
      public static const UI_QUANSHENJUEXING_NEXT_CLICK:String = "UI_QUANSHENJUEXING_NEXT_CLICK";
      
      public static const UI_QUANSHENJUEXING_TUPO_CLICK:String = "UI_QUANSHENJUEXING_TUPO_CLICK";
      
      public static const UI_QUANSHENJUEXING_KAISHITISHENG_CLICK:String = "UI_QUANSHENJUEXING_KAISHITISHENG_CLICK";
      
      public static const UI_QUANSHENJUEXING_ZIDONGTISHENG_CLICK:String = "UI_QUANSHENJUEXING_ZIDONGTISHENG_CLICK";
      
      public static const UI_QUANSHENJUEXING_GOUMAI_CLICK:String = "UI_QUANSHENJUEXING_GOUMAI_CLICK";
      
      public static const UI_QUANSHENJUEXING_XIANGQIAN_CLICK:String = "UI_QUANSHENJUEXING_XIANGQIAN_CLICK";
      
      public static const WUDUZHEN:String = "WUDUZHEN";
      
      public static const UI_WUDUZHEN_TUPO_CLICK:String = "UI_WUDUZHEN_TUPO_CLICK";
      
      public static const UI_WUDUZHEN_KAISHITISHENG_CLICK:String = "UI_WUDUZHEN_KAISHITISHENG_CLICK";
      
      public static const UI_WUDUZHEN_ZIDONGTISHENG_CLICK:String = "UI_WUDUZHEN_ZIDONGTISHENG_CLICK";
      
      public static const UI_WUDUZHEN_GOUMAI_CLICK:String = "UI_WUDUZHEN_GOUMAI_CLICK";
      
      public static const UI_WUDUZHEN_PRE_NEXT_CLICK:String = "UI_WUDUZHEN_PRE_NEXT_CLICK";
      
      public static const UI_WUDUZHEN_SIWANGXUANYAN_SKILL_DRAG:String = "UI_WUDUZHEN_SIWANGXUANYAN_SKILL_DRAG";
      
      public static const LONGYINJUEXING:String = "LONGYINJUEXING";
      
      public static const UI_LONGYINJUEXING_PREVIOUS_CLICK:String = "UI_LONGYINJUEXING_PREVIOUS_CLICK";
      
      public static const UI_LONGYINJUEXING_NEXT_CLICK:String = "UI_LONGYINJUEXING_NEXT_CLICK";
      
      public static const UI_LONGYINJUEXING_TUPO_CLICK:String = "UI_LONGYINJUEXING_TUPO_CLICK";
      
      public static const UI_LONGYINJUEXING_KAISHITISHENG_CLICK:String = "UI_LONGYINJUEXING_KAISHITISHENG_CLICK";
      
      public static const UI_LONGYINJUEXING_ZIDONGTISHENG_CLICK:String = "UI_LONGYINJUEXING_ZIDONGTISHENG_CLICK";
      
      public static const UI_LONGYINJUEXING_GOUMAI_CLICK:String = "UI_LONGYINJUEXING_GOUMAI_CLICK";
      
      public static const UI_LONGYINJUEXING_XIANGQIAN_CLICK:String = "UI_LONGYINJUEXING_XIANGQIAN_CLICK";
      
      public static const SHENXINGBAIBIAN:String = "SHENXINGBAIBIAN";
      
      public static const UI_SHENXINGBAIBIAN_PREVIOUS_CLICK:String = "UI_SHENXINGBAIBIAN_PREVIOUS_CLICK";
      
      public static const UI_SHENXINGBAIBIAN_NEXT_CLICK:String = "UI_SHENXINGBAIBIAN_NEXT_CLICK";
      
      public static const UI_SHENXINGBAIBIAN_TUPO_CLICK:String = "UI_SHENXINGBAIBIAN_TUPO_CLICK";
      
      public static const UI_SHENXINGBAIBIAN_KAISHITISHENG_CLICK:String = "UI_SHENXINGBAIBIAN_KAISHITISHENG_CLICK";
      
      public static const UI_SHENXINGBAIBIAN_ZIDONGTISHENG_CLICK:String = "UI_SHENXINGBAIBIAN_ZIDONGTISHENG_CLICK";
      
      public static const UI_SHENXINGBAIBIAN_GOUMAI_CLICK:String = "UI_SHENXINGBAIBIAN_GOUMAI_CLICK";
      
      public static const LANGHUNDUN:String = "LANGHUNDUN";
      
      public static const UI_LANGHUNDUN_KAISHITISHENG_CLICK:String = "UI_LANGHUNDUN_KAISHITISHENG_CLICK";
      
      public static const UI_LANGHUNDUN_ZIDONGTISHENG_CLICK:String = "UI_LANGHUNDUN_ZIDONGTISHENG_CLICK";
      
      public static const GETRULAISHENZHANG:String = "GETRULAISHENZHANG";
      
      public static const UI_RULAISHENZHANG_SHANGYIYE_CLICK:String = "UI_RULAISHENZHANG_SHANGYIYE_CLICK";
      
      public static const UI_RULAISHENZHANG_XIAYIYE_CLICK:String = "UI_RULAISHENZHANG_XIAYIYE_CLICK";
      
      public static const RULAISHENZHANG_LINGWU_SHOW:String = "RULAISHENZHANG_LINGWU_SHOW";
      
      public static const UI_RULAISHENZHANG_KAISHITISHENG_CLICKJ:String = "UI_RULAISHENZHANG_KAISHITISHENG_CLICKJ";
      
      public static const UI_RULAISHENZHANG_ZIDONGTISHENG_CLICKJ:String = "UI_RULAISHENZHANG_ZIDONGTISHENG_CLICKJ";
      
      public static const UI_RULAISHENZHANG_GOUMAI_CLICK:String = "UI_RULAISHENZHANG_GOUMAI_CLICK";
      
      public static const UI_RULAISHENZHANG_SKILL_DRAG:String = "UI_RULAISHENZHANG_SKILL_DRAG";
      
      public static const DUGUQIUBAI:String = "DUGUQIUBAI";
      
      public static const UI_DUGUQIUBAI_SHANGYIYE_CLICK:String = "UI_DUGUQIUBAI_SHANGYIYE_CLICK";
      
      public static const UI_DUGUQIUBAI_XIAYIYE_CLICK:String = "UI_DUGUQIUBAI_XIAYIYE_CLICK";
      
      public static const UI_DUGUQIUBAI_KAISHITISHENG_CLICK:String = "UI_DUGUQIUBAI_KAISHITISHENG_CLICK";
      
      public static const UI_DUGUQIUBAI_ZIDONGTISHENG_CLICK:String = "UI_DUGUQIUBAI_ZIDONGTISHENG_CLICK";
      
      public static const UI_DUGUQIUBAI_GOUMAI_CLICK:String = "UI_DUGUQIUBAI_GOUMAI_CLICK";
      
      public static const UI_DUGUQIUBAI_HUANZHUANG_CLICK:String = "UI_DUGUQIUBAI_HUANZHUANG_CLICK";
      
      public static const LUOYINGSHENJIANZHANG:String = "LUOYINGSHENJIANZHANG";
      
      public static const UI_LUOYINGSHENJIANZHANG_PREVIOUS_CLICK:String = "UI_LUOYINGSHENJIANZHANG_PREVIOUS_CLICK";
      
      public static const UI_LUOYINGSHENJIANZHANG_NEXT_CLICK:String = "UI_LUOYINGSHENJIANZHANG_NEXT_CLICK";
      
      public static const UI_LUOYINGSHENJIANZHANG_TUPO_CLICK:String = "UI_LUOYINGSHENJIANZHANG_TUPO_CLICK";
      
      public static const UI_LUOYINGSHENJIANZHANG_KAISHITISHENG_CLICK:String = "UI_LUOYINGSHENJIANZHANG_KAISHITISHENG_CLICK";
      
      public static const UI_LUOYINGSHENJIANZHANG_ZIDONGTISHENG_CLICK:String = "UI_LUOYINGSHENJIANZHANG_ZIDONGTISHENG_CLICK";
      
      public static const UI_LUOYINGSHENJIANZHANG_GOUMAI_CLICK:String = "UI_LUOYINGSHENJIANZHANG_GOUMAI_CLICK";
      
      public static const BAZHENTU:String = "BAZHENTU";
      
      public static const UI_BAZHENTU_PREVIOUS_CLICK:String = "UI_BAZHENTU_PREVIOUS_CLICK";
      
      public static const UI_BAZHENTU_NEXT_CLICK:String = "UI_BAZHENTU_NEXT_CLICK";
      
      public static const UI_BAZHENTU_TUPO_CLICK:String = "UI_BAZHENTU_TUPO_CLICK";
      
      public static const UI_BAZHENTU_KAISHITISHENG_CLICK:String = "UI_BAZHENTU_KAISHITISHENG_CLICK";
      
      public static const UI_BAZHENTU_ZIDONGTISHENG_CLICK:String = "UI_BAZHENTU_ZIDONGTISHENG_CLICK";
      
      public static const UI_BAZHENTU_GOUMAI_CLICK:String = "UI_BAZHENTU_GOUMAI_CLICK";
      
      public static const XUANTIEJIANFA:String = "XUANTIEJIANFA";
      
      public static const UI_XUANTIEJIANFA_PREVIOUS_CLICK:String = "UI_XUANTIEJIANFA_PREVIOUS_CLICK";
      
      public static const UI_XUANTIEJIANFA_NEXT_CLICK:String = "UI_XUANTIEJIANFA_NEXT_CLICK";
      
      public static const UI_XUANTIEJIANFA_TUPO_CLICK:String = "UI_XUANTIEJIANFA_TUPO_CLICK";
      
      public static const UI_XUANTIEJIANFA_KAISHITISHENG_CLICK:String = "UI_XUANTIEJIANFA_KAISHITISHENG_CLICK";
      
      public static const UI_XUANTIEJIANFA_ZIDONGTISHENG_CLICK:String = "UI_XUANTIEJIANFA_ZIDONGTISHENG_CLICK";
      
      public static const UI_XUANTIEJIANFA_GOUMAI_CLICK:String = "UI_XUANTIEJIANFA_GOUMAI_CLICK";
      
      public static const CHANGSHENGJUE:String = "CHANGSHENGJUE";
      
      public static const UI_CHANGSHENGJUE_PREVIOUS_CLICK:String = "UI_CHANGSHENGJUE_PREVIOUS_CLICK";
      
      public static const UI_CHANGSHENGJUE_NEXT_CLICK:String = "UI_CHANGSHENGJUE_NEXT_CLICK";
      
      public static const UI_CHANGSHENGJUE_TUPO_CLICK:String = "UI_CHANGSHENGJUE_TUPO_CLICK";
      
      public static const UI_CHANGSHENGJUE_KAISHITISHENG_CLICK:String = "UI_CHANGSHENGJUE_KAISHITISHENG_CLICK";
      
      public static const UI_CHANGSHENGJUE_ZIDONGTISHENG_CLICK:String = "UI_CHANGSHENGJUE_ZIDONGTISHENG_CLICK";
      
      public static const UI_CHANGSHENGJUE_GOUMAI_CLICK:String = "UI_CHANGSHENGJUE_GOUMAI_CLICK";
      
      public static const WANHUNZHEN:String = "WANHUNZHEN";
      
      public static const UI_WANHUNZHEN_PREVIOUS_CLICK:String = "UI_WANHUNZHEN_PREVIOUS_CLICK";
      
      public static const UI_WANHUNZHEN_NEXT_CLICK:String = "UI_WANHUNZHEN_NEXT_CLICK";
      
      public static const UI_WANHUNZHEN_TUPO_CLICK:String = "UI_WANHUNZHEN_TUPO_CLICK";
      
      public static const UI_WANHUNZHEN_KAISHITISHENG_CLICK:String = "UI_WANHUNZHEN_KAISHITISHENG_CLICK";
      
      public static const UI_WANHUNZHEN_ZIDONGTISHENG_CLICK:String = "UI_WANHUNZHEN_ZIDONGTISHENG_CLICK";
      
      public static const UI_WANHUNZHEN_GOUMAI_CLICK:String = "UI_WANHUNZHEN_GOUMAI_CLICK";
      
      public static const WODEMENPAI:String = "WODEMENPAI";
      
      public static const UI_WUDEMENPAI_CREATE_CLICK:String = "UI_WUDEMENPAI_CREATE_CLICK";
      
      public static const UI_WUDEMENPAI_QIEHUAN_CLICK:String = "UI_WUDEMENPAI_QIEHUAN_CLICK";
      
      public static const UI_WUDEMENPAI_TUIBIAN_CLICK:String = "UI_WUDEMENPAI_TUIBIAN_CLICK";
      
      public static const UI_WUDEMENPAI_CHUZHAN_CLICK:String = "UI_WUDEMENPAI_CHUZHAN_CLICK";
      
      public static const UI_WUDEMENPAI_CHAKAN_CLICK:String = "UI_WUDEMENPAI_CHAKAN_CLICK";
      
      public static const UI_WUDEMENPAI_GONGXIAN_CLICK:String = "UI_WUDEMENPAI_GONGXIAN_CLICK";
      
      public static const UI_WUDEMENPAI_GONGXIAN_OK_CLICK:String = "UI_WUDEMENPAI_GONGXIAN_OK_CLICK";
      
      public static const UI_WUDEMENPAI_CHUANGONG_CLICK:String = "UI_WUDEMENPAI_CHUANGONG_CLICK";
      
      public static const WODECHUANGONG:String = "WODECHUANGONG";
      
      public static const UI_WUDECHUANGONG_START_CLICK:String = "UI_WUDECHUANGONG_START_CLICK";
      
      public static const ZHENYANSHOUYIN:String = "ZHENYANSHOUYIN";
      
      public static const UI_ZHENYANSHOUYIN_KAISHITISHENG_CLICK:String = "UI_ZHENYANSHOUYIN_KAISHITISHENG_CLICK";
      
      public static const UI_ZHENYANSHOUYIN_ZIDONGTISHENG_CLICK:String = "UI_ZHENYANSHOUYIN_ZIDONGTISHENG_CLICK";
      
      public static const UI_ZHENYANSHOUYIN_PRE_NEXT_CLICK:String = "UI_ZHENYANSHOUYIN_PRE_NEXT_CLICK";
      
      public static const ZHENLONGQIJU:String = "ZHENLONGQIJU";
      
      public static const UI_ZHENLONGQIJU_PREVIOUS_CLICK:String = "UI_ZHENLONGQIJU_PREVIOUS_CLICK";
      
      public static const UI_ZHENLONGQIJU_NEXT_CLICK:String = "UI_ZHENLONGQIJU_NEXT_CLICK";
      
      public static const UI_ZHENLONGQIJU_TUPO_CLICK:String = "UI_ZHENLONGQIJU_TUPO_CLICK";
      
      public static const UI_ZHENLONGQIJU_KAISHITISHENG_CLICK:String = "UI_ZHENLONGQIJU_KAISHITISHENG_CLICK";
      
      public static const UI_ZHENLONGQIJU_ZIDONGTISHENG_CLICK:String = "UI_ZHENLONGQIJU_ZIDONGTISHENG_CLICK";
      
      public static const UI_ZHENLONGQIJU_GOUMAI_CLICK:String = "UI_ZHENLONGQIJU_GOUMAI_CLICK";
      
      public static const SHENGSIFU:String = "SHENGSIFU";
      
      public static const UI_SHENGSIFU_PREVIOUS_CLICK:String = "UI_SHENGSIFU_PREVIOUS_CLICK";
      
      public static const UI_SHENGSIFU_NEXT_CLICK:String = "UI_SHENGSIFU_NEXT_CLICK";
      
      public static const UI_SHENGSIFU_TUPO_CLICK:String = "UI_SHENGSIFU_TUPO_CLICK";
      
      public static const UI_SHENGSIFU_KAISHITISHENG_CLICK:String = "UI_SHENGSIFU_KAISHITISHENG_CLICK";
      
      public static const UI_SHENGSIFU_ZIDONGTISHENG_CLICK:String = "UI_SHENGSIFU_ZIDONGTISHENG_CLICK";
      
      public static const UI_SHENGSIFU_GOUMAI_CLICK:String = "UI_SHENGSIFU_GOUMAI_CLICK";
      
      public static const TAOHUAZHEN:String = "TAOHUAZHEN";
      
      public static const UI_TAOHUAZHEN_PREVIOUS_CLICK:String = "UI_TAOHUAZHEN_PREVIOUS_CLICK";
      
      public static const UI_TAOHUAZHEN_NEXT_CLICK:String = "UI_TAOHUAZHEN_NEXT_CLICK";
      
      public static const UI_TAOHUAZHEN_TUPO_CLICK:String = "UI_TAOHUAZHEN_TUPO_CLICK";
      
      public static const UI_TAOHUAZHEN_KAISHITISHENG_CLICK:String = "UI_TAOHUAZHEN_KAISHITISHENG_CLICK";
      
      public static const UI_TAOHUAZHEN_ZIDONGTISHENG_CLICK:String = "UI_TAOHUAZHEN_ZIDONGTISHENG_CLICK";
      
      public static const UI_TAOHUAZHEN_GOUMAI_CLICK:String = "UI_TAOHUAZHEN_GOUMAI_CLICK";
      
      public static const XIAKEXING:String = "XIAKEXING";
      
      public static const UI_XIAKEXING_KAISHITISHENG_CLICK:String = "UI_XIAKEXING_KAISHITISHENG_CLICK";
      
      public static const UI_XIAKEXING_SKILL_DRAG:String = "UI_XIAKEXING_SKILL_DRAG";
      
      public static const MOLINGZHIYI:String = "MOLINGZHIYI";
      
      public static const UI_MOLINGZHIYI_HUANYE_CLICK:String = "UI_MOLINGZHIYI_HUANYE_CLICK";
      
      public static const UI_MOLINGZHIYI_FEIXING_CLICK:String = "UI_MOLINGZHIYI_FEIXING_CLICK";
      
      public static const UI_MOLINGZHIYI_WAIGUAN_CLICK:String = "UI_MOLINGZHIYI_WAIGUAN_CLICK";
      
      public static const UI_MOLINGZHIYI_HECHENG_SHOW:String = "UI_MOLINGZHIYI_HECHENG_SHOW";
      
      public static const UI_MOLINGZHIYI_LINGWU_SHOW:String = "UI_MOLINGZHIYI_LINGWU_SHOW";
      
      public static const UI_MOLINGZHIYI_KAISHITISHENG_CLICK:String = "UI_MOLINGZHIYI_KAISHITISHENG_CLICK";
      
      public static const UI_MOLINGZHIYI_ZIDONGTISHENG_CLICK:String = "UI_MOLINGZHIYI_ZIDONGTISHENG_CLICK";
      
      public static const UI_MOLINGZHIYI_GOUMAI_CLICK:String = "UI_MOLINGZHIYI_GOUMAI_CLICK";
      
      public static const UI_MOLINGZHIYI_XUESEYUYI_CLICK:String = "UI_MOLINGZHIYI_XUESEYUYI_CLICK";
      
      public static const FUMOZHANGFA:String = "FUMOZHANGFA";
      
      public static const UI_FUMOZHANGFA_PREVIOUS_CLICK:String = "UI_FUMOZHANGFA_PREVIOUS_CLICK";
      
      public static const UI_FUMOZHANGFA_NEXT_CLICK:String = "UI_FUMOZHANGFA_NEXT_CLICK";
      
      public static const UI_FUMOZHANGFA_TUPO_CLICK:String = "UI_FUMOZHANGFA_TUPO_CLICK";
      
      public static const UI_FUMOZHANGFA_KAISHITISHENG_CLICK:String = "UI_FUMOZHANGFA_KAISHITISHENG_CLICK";
      
      public static const UI_FUMOZHANGFA_ZIDONGTISHENG_CLICK:String = "UI_FUMOZHANGFA_ZIDONGTISHENG_CLICK";
      
      public static const UI_FUMOZHANGFA_GOUMAI_CLICK:String = "UI_FUMOZHANGFA_GOUMAI_CLICK";
      
      public static const YUNVSUXINJIANFA:String = "YUNVSUXINJIANFA";
      
      public static const UI_YUNVSUXINJIANFA_PREVIOUS_CLICK:String = "UI_YUNVSUXINJIANFA_PREVIOUS_CLICK";
      
      public static const UI_YUNVSUXINJIANFA_NEXT_CLICK:String = "UI_YUNVSUXINJIANFA_NEXT_CLICK";
      
      public static const UI_YUNVSUXINJIANFA_TUPO_CLICK:String = "UI_YUNVSUXINJIANFA_TUPO_CLICK";
      
      public static const UI_YUNVSUXINJIANFA_KAISHITISHENG_CLICK:String = "UI_YUNVSUXINJIANFA_KAISHITISHENG_CLICK";
      
      public static const UI_YUNVSUXINJIANFA_ZIDONGTISHENG_CLICK:String = "UI_YUNVSUXINJIANFA_ZIDONGTISHENG_CLICK";
      
      public static const UI_YUNVSUXINJIANFA_GOUMAI_CLICK:String = "UI_YUNVSUXINJIANFA_GOUMAI_CLICK";
      
      public static const LIEKONGJUEXING:String = "LIEKONGJUEXING";
      
      public static const UI_LIEKONGJUEXING_PREVIOUS_CLICK:String = "UI_LIEKONGJUEXING_PREVIOUS_CLICK";
      
      public static const UI_LIEKONGJUEXING_NEXT_CLICK:String = "UI_LIEKONGJUEXING_NEXT_CLICK";
      
      public static const UI_LIEKONGJUEXING_TUPO_CLICK:String = "UI_LIEKONGJUEXING_TUPO_CLICK";
      
      public static const UI_LIEKONGJUEXING_KAISHITISHENG_CLICK:String = "UI_LIEKONGJUEXING_KAISHITISHENG_CLICK";
      
      public static const UI_LIEKONGJUEXING_ZIDONGTISHENG_CLICK:String = "UI_LIEKONGJUEXING_ZIDONGTISHENG_CLICK";
      
      public static const UI_LIEKONGJUEXING_GOUMAI_CLICK:String = "UI_LIEKONGJUEXING_GOUMAI_CLICK";
      
      public static const UI_LIEKONGJUEXING_XIANGQIAN_CLICK:String = "UI_LIEKONGJUEXING_XIANGQIAN_CLICK";
      
      public static const TIANYUYANMENG:String = "TIANYUYANMENG";
      
      public static const UI_TIANYUYANMENG_PREVIOUS_CLICK:String = "UI_TIANYUYANMENG_PREVIOUS_CLICK";
      
      public static const UI_TIANYUYANMENG_NEXT_CLICK:String = "UI_TIANYUYANMENG_NEXT_CLICK";
      
      public static const UI_TIANYUYANMENG_TUPO_CLICK:String = "UI_TIANYUYANMENG_TUPO_CLICK";
      
      public static const UI_TIANYUYANMENG_KAISHITISHENG_CLICK:String = "UI_TIANYUYANMENG_KAISHITISHENG_CLICK";
      
      public static const UI_TIANYUYANMENG_ZIDONGTISHENG_CLICK:String = "UI_TIANYUYANMENG_ZIDONGTISHENG_CLICK";
      
      public static const UI_TIANYUYANMENG_GOUMAI_CLICK:String = "UI_TIANYUYANMENG_GOUMAI_CLICK";
      
      public static const UI_TIANYUYANMENG_SKILL_DRAG:String = "UI_TIANYUYANMENG_SKILL_DRAG";
      
      public static const TIANSHANLIUYANGZHANG:String = "TIANSHANLIUYANGZHANG";
      
      public static const UI_TIANSHANLIUYANGZHANG_PREVIOUS_CLICK:String = "UI_TIANSHANLIUYANGZHANG_PREVIOUS_CLICK";
      
      public static const UI_TIANSHANLIUYANGZHANG_NEXT_CLICK:String = "UI_TIANSHANLIUYANGZHANG_NEXT_CLICK";
      
      public static const UI_TIANSHANLIUYANGZHANG_TUPO_CLICK:String = "UI_TIANSHANLIUYANGZHANG_TUPO_CLICK";
      
      public static const UI_TIANSHANLIUYANGZHANG_KAISHITISHENG_CLICK:String = "UI_TIANSHANLIUYANGZHANG_KAISHITISHENG_CLICK";
      
      public static const UI_TIANSHANLIUYANGZHANG_ZIDONGTISHENG_CLICK:String = "UI_TIANSHANLIUYANGZHANG_ZIDONGTISHENG_CLICK";
      
      public static const UI_TIANSHANLIUYANGZHANG_GOUMAI_CLICK:String = "UI_TIANSHANLIUYANGZHANG_GOUMAI_CLICK";
      
      public static const AOJIANSHENJIANGJI:String = "AOJIANSHENJIANGJI";
      
      public static const UI_AOJIANSHENJIANGJI_QIEHUAN_CLICK:String = "UI_AOJIANSHENJIANGJI_QIEHUAN_CLICK";
      
      public static const UI_WUXIAKAPAI_CLICK:String = "UI_WUXIAKAPAI_CLICK";
      
      public static const DUOMINGSHISANJIAN:String = "DUOMINGSHISANJIAN";
      
      public static const UI_DUOMINGSHISANJIAN_PREVIOUS_CLICK:String = "UI_DUOMINGSHISANJIAN_PREVIOUS_CLICK";
      
      public static const UI_DUOMINGSHISANJIAN_NEXT_CLICK:String = "UI_DUOMINGSHISANJIAN_NEXT_CLICK";
      
      public static const UI_DUOMINGSHISANJIAN_TUPO_CLICK:String = "UI_DUOMINGSHISANJIAN_TUPO_CLICK";
      
      public static const UI_DUOMINGSHISANJIAN_KAISHITISHENG_CLICK:String = "UI_DUOMINGSHISANJIAN_KAISHITISHENG_CLICK";
      
      public static const UI_DUOMINGSHISANJIAN_ZIDONGTISHENG_CLICK:String = "UI_DUOMINGSHISANJIAN_ZIDONGTISHENG_CLICK";
      
      public static const UI_DUOMINGSHISANJIAN_GOUMAI_CLICK:String = "UI_DUOMINGSHISANJIAN_GOUMAI_CLICK";
      
      public static const RIJINLUN:String = "RIJINLUN";
      
      public static const UI_RIJINLUN_HUANYE_CLICK:String = "UI_RIJINLUN_HUANYE_CLICK";
      
      public static const UI_RIJINLUN_FEIXING_CLICK:String = "UI_RIJINLUN_FEIXING_CLICK";
      
      public static const UI_RIJINLUN_WAIGUAN_CLICK:String = "UI_RIJINLUN_WAIGUAN_CLICK";
      
      public static const UI_RIJINLUN_LINGWU_SHOW:String = "UI_RIJINLUN_LINGWU_SHOW";
      
      public static const UI_RIJINLUN_KAISHITISHENG_CLICK:String = "UI_RIJINLUN_KAISHITISHENG_CLICK";
      
      public static const UI_RIJINLUN_ZIDONGTISHENG_CLICK:String = "UI_RIJINLUN_ZIDONGTISHENG_CLICK";
      
      public static const UI_RIJINLUN_GOUMAI_CLICK:String = "UI_RIJINLUN_GOUMAI_CLICK";
      
      public static const KONGMINGQUAN:String = "KONGMINGQUAN";
      
      public static const UI_KONGMINGQUAN_PREVIOUS_CLICK:String = "UI_KONGMINGQUAN_PREVIOUS_CLICK";
      
      public static const UI_KONGMINGQUAN_NEXT_CLICK:String = "UI_KONGMINGQUAN_NEXT_CLICK";
      
      public static const UI_KONGMINGQUAN_TUPO_CLICK:String = "UI_KONGMINGQUAN_TUPO_CLICK";
      
      public static const UI_KONGMINGQUAN_KAISHITISHENG_CLICK:String = "UI_KONGMINGQUAN_KAISHITISHENG_CLICK";
      
      public static const UI_KONGMINGQUAN_ZIDONGTISHENG_CLICK:String = "UI_KONGMINGQUAN_ZIDONGTISHENG_CLICK";
      
      public static const UI_KONGMINGQUAN_GOUMAI_CLICK:String = "UI_KONGMINGQUAN_GOUMAI_CLICK";
      
      public static const XUEYINJUEXING:String = "XUEYINJUEXING";
      
      public static const UI_XUEYINJUEXING_PREVIOUS_CLICK:String = "UI_XUEYINJUEXING_PREVIOUS_CLICK";
      
      public static const UI_XUEYINJUEXING_NEXT_CLICK:String = "UI_XUEYINJUEXING_NEXT_CLICK";
      
      public static const UI_XUEYINJUEXING_TUPO_CLICK:String = "UI_XUEYINJUEXING_TUPO_CLICK";
      
      public static const UI_XUEYINJUEXING_KAISHITISHENG_CLICK:String = "UI_XUEYINJUEXING_KAISHITISHENG_CLICK";
      
      public static const UI_XUEYINJUEXING_ZIDONGTISHENG_CLICK:String = "UI_XUEYINJUEXING_ZIDONGTISHENG_CLICK";
      
      public static const UI_XUEYINJUEXING_GOUMAI_CLICK:String = "UI_XUEYINJUEXING_GOUMAI_CLICK";
      
      public static const UI_XUEYINJUEXING_XIANGQIAN_CLICK:String = "UI_XUEYINJUEXING_XIANGQIAN_CLICK";
      
      public static const YUEJINLUN:String = "YUEJINLUN";
      
      public static const UI_YUEJINLUN_HUANYE_CLICK:String = "UI_YUEJINLUN_HUANYE_CLICK";
      
      public static const UI_YUEJINLUN_FEIXING_CLICK:String = "UI_YUEJINLUN_FEIXING_CLICK";
      
      public static const UI_YUEJINLUN_WAIGUAN_CLICK:String = "UI_YUEJINLUN_WAIGUAN_CLICK";
      
      public static const UI_YUEJINLUN_LINGWU_SHOW:String = "UI_YUEJINLUN_LINGWU_SHOW";
      
      public static const UI_YUEJINLUN_KAISHITISHENG_CLICK:String = "UI_YUEJINLUN_KAISHITISHENG_CLICK";
      
      public static const UI_YUEJINLUN_ZIDONGTISHENG_CLICK:String = "UI_YUEJINLUN_ZIDONGTISHENG_CLICK";
      
      public static const UI_YUEJINLUN_GOUMAI_CLICK:String = "UI_YUEJINLUN_GOUMAI_CLICK";
      
      public static const HUASHANLUNJIAN:String = "HUASHANLUNJIAN";
      
      public static const UI_HUASHANLUNJIAN_SHANGYIYE_CLICK:String = "UI_HUASHANLUNJIAN_SHANGYIYE_CLICK";
      
      public static const UI_HUASHANLUNJIAN_XIAYIYE_CLICK:String = "UI_HUASHANLUNJIAN_XIAYIYE_CLICK";
      
      public static const UI_HUASHANLUNJIAN_LINGWU_SHOW:String = "UI_HUASHANLUNJIAN_LINGWU_SHOW";
      
      public static const UI_HUASHANLUNJIAN_KAISHITISHENG_CLICK:String = "UI_HUASHANLUNJIAN_KAISHITISHENG_CLICK";
      
      public static const UI_HUASHANLUNJIAN_ZIDONGTISHENG_CLICK:String = "UI_HUASHANLUNJIAN_ZIDONGTISHENG_CLICK";
      
      public static const UI_HUASHANLUNJIAN_GOUMAI_CLICK:String = "UI_HUASHANLUNJIAN_GOUMAI_CLICK";
      
      public static const HANBINGSHENZHANG:String = "HANBINGSHENZHANG";
      
      public static const UI_HANBINGSHENZHANG_PREVIOUS_CLICK:String = "UI_HANBINGSHENZHANG_PREVIOUS_CLICK";
      
      public static const UI_HANBINGSHENZHANG_NEXT_CLICK:String = "UI_HANBINGSHENZHANG_NEXT_CLICK";
      
      public static const UI_HANBINGSHENZHANG_TUPO_CLICK:String = "UI_HANBINGSHENZHANG_TUPO_CLICK";
      
      public static const UI_HANBINGSHENZHANG_KAISHITISHENG_CLICK:String = "UI_HANBINGSHENZHANG_KAISHITISHENG_CLICK";
      
      public static const UI_HANBINGSHENZHANG_ZIDONGTISHENG_CLICK:String = "UI_HANBINGSHENZHANG_ZIDONGTISHENG_CLICK";
      
      public static const UI_HANBINGSHENZHANG_GOUMAI_CLICK:String = "UI_HANBINGSHENZHANG_GOUMAI_CLICK";
      
      public static const LINGXIYIZHI:String = "LINGXIYIZHI";
      
      public static const UI_LINGXIYIZHI_PREVIOUS_CLICK:String = "UI_LINGXIYIZHI_PREVIOUS_CLICK";
      
      public static const UI_LINGXIYIZHI_NEXT_CLICK:String = "UI_LINGXIYIZHI_NEXT_CLICK";
      
      public static const UI_LINGXIYIZHI_TUPO_CLICK:String = "UI_LINGXIYIZHI_TUPO_CLICK";
      
      public static const UI_LINGXIYIZHI_KAISHITISHENG_CLICK:String = "UI_LINGXIYIZHI_KAISHITISHENG_CLICK";
      
      public static const UI_LINGXIYIZHI_ZIDONGTISHENG_CLICK:String = "UI_LINGXIYIZHI_ZIDONGTISHENG_CLICK";
      
      public static const UI_LINGXIYIZHI_GOUMAI_CLICK:String = "UI_LINGXIYIZHI_GOUMAI_CLICK";
      
      public static const LIULONGZHUANGBEI:String = "LIULONGZHUANGBEI";
      
      public static const UI_YNLIULONGZHUANGBEI_SKILL_DRAG:String = "UI_YNLIULONGZHUANGBEI_SKILL_DRAG";
      
      public static const JINGLINGQIXUAN:String = "JINGLINGQIXUAN";
      
      public static const GUIHUN:String = "GUIHUN";
      
      public static const GUIHUN_SHENGJI:String = "GUIHUN_SHENGJI";
      
      public static const GUIHUN_TUPO:String = "GUIHUN_TUPO";
      
      public static const GUIHUN_DRAG_STRAT:String = "UI_GUIHUN_DRAG_STRAT";
      
      public static const GUIHUN_CLICK:String = "GUIHUN_CLICK";
      
      public static const GUIHUN_SKILL_CLICK:String = "GUIHUN_SKILL_CLICK";
      
      public static const YNJINFENGDIAO:String = "YNJINFENGDIAO";
      
      public static const UI_YNJINFENGDIAO_SKILL_DRAG:String = "UI_YNJINFENGDIAO_SKILL_DRAG";
      
      public static const XINGXIUZHEN:String = "XINGXIUZHEN";
      
      public static const UI_XINGXIUZHEN_PREVIOUS_CLICK:String = "UI_XINGXIUZHEN_PREVIOUS_CLICK";
      
      public static const UI_XINGXIUZHEN_NEXT_CLICK:String = "UI_XINGXIUZHEN_NEXT_CLICK";
      
      public static const UI_XINGXIUZHEN_TUPO_CLICK:String = "UI_XINGXIUZHEN_TUPO_CLICK";
      
      public static const UI_XINGXIUZHEN_KAISHITISHENG_CLICK:String = "UI_XINGXIUZHEN_KAISHITISHENG_CLICK";
      
      public static const UI_XINGXIUZHEN_ZIDONGTISHENG_CLICK:String = "UI_XINGXIUZHEN_ZIDONGTISHENG_CLICK";
      
      public static const UI_XINGXIUZHEN_GOUMAI_CLICK:String = "UI_XINGXIUZHEN_GOUMAI_CLICK";
      
      public static const XINGXIUZHEN1:String = "XINGXIUZHEN1";
      
      public static const UI_XINGXIUZHEN1_PREVIOUS_CLICK:String = "UI_XINGXIUZHEN1_PREVIOUS_CLICK";
      
      public static const UI_XINGXIUZHEN1_NEXT_CLICK:String = "UI_XINGXIUZHEN1_NEXT_CLICK";
      
      public static const UI_XINGXIUZHEN1_TUPO_CLICK:String = "UI_XINGXIUZHEN1_TUPO_CLICK";
      
      public static const UI_XINGXIUZHEN1_KAISHITISHENG_CLICK:String = "UI_XINGXIUZHEN1_KAISHITISHENG_CLICK";
      
      public static const UI_XINGXIUZHEN1_ZIDONGTISHENG_CLICK:String = "UI_XINGXIUZHEN1_ZIDONGTISHENG_CLICK";
      
      public static const UI_XINGXIUZHEN1_GOUMAI_CLICK:String = "UI_XINGXIUZHEN1_GOUMAI_CLICK";
      
      public static const QISHAZHEN:String = "QISHAZHEN";
      
      public static const UI_QISHAZHEN_PREVIOUS_CLICK:String = "UI_QISHAZHEN_PREVIOUS_CLICK";
      
      public static const UI_QISHAZHEN_NEXT_CLICK:String = "UI_QISHAZHEN_NEXT_CLICK";
      
      public static const UI_QISHAZHEN_TUPO_CLICK:String = "UI_QISHAZHEN_TUPO_CLICK";
      
      public static const UI_QISHAZHEN_KAISHITISHENG_CLICK:String = "UI_QISHAZHEN_KAISHITISHENG_CLICK";
      
      public static const UI_QISHAZHEN_ZIDONGTISHENG_CLICK:String = "UI_QISHAZHEN_ZIDONGTISHENG_CLICK";
      
      public static const UI_QISHAZHEN_GOUMAI_CLICK:String = "UI_QISHAZHEN_GOUMAI_CLICK";
      
      public static const FUWENKEHUA:String = "FUWENKEHUA";
      
      public static const UI_FUWENKEHUA_PAGE_CLICK:String = "UI_FUWENKEHUA_PAGE_CLICK";
      
      public static const UI_FUWENKEHUA_FUWENXINXI_CLICK:String = "UI_FUWENKEHUA_FUWENXINXI_CLICK";
      
      public static const UI_FUWENKEHUA_XIANSHIWAIGUAN_CLICK:String = "UI_FUWENKEHUA_XIANSHIWAIGUAN_CLICK";
      
      public static const UI_FUWENKEHUA_SKILL_DRAG:String = "UI_FUWENKEHUA_SKILL_DRAG";
      
      public static const LIANGYIWEICHENZHEN:String = "LIANGYIWEICHENZHEN";
      
      public static const UI_LIANGYIWEICHENZHEN_PREVIOUS_CLICK:String = "UI_LIANGYIWEICHENZHEN_PREVIOUS_CLICK";
      
      public static const UI_LIANGYIWEICHENZHEN_NEXT_CLICK:String = "UI_LIANGYIWEICHENZHEN_NEXT_CLICK";
      
      public static const UI_LIANGYIWEICHENZHEN_TUPO_CLICK:String = "UI_LIANGYIWEICHENZHEN_TUPO_CLICK";
      
      public static const UI_LIANGYIWEICHENZHEN_JIHUO_CLICK:String = "UI_LIANGYIWEICHENZHEN_JIHUO_CLICK";
      
      public static const UI_LIANGYIWEICHENZHEN_KAISHITISHENG_CLICK:String = "UI_LIANGYIWEICHENZHEN_KAISHITISHENG_CLICK";
      
      public static const UI_LIANGYIWEICHENZHEN_ZIDONGTISHENG_CLICK:String = "UI_LIANGYIWEICHENZHEN_ZIDONGTISHENG_CLICK";
      
      public static const UI_LIANGYIWEICHENZHEN_GOUMAI_CLICK:String = "UI_LIANGYIWEICHENZHEN_GOUMAI_CLICK";
      
      public static const SIJUEJIANZHEN:String = "SIJUEJIANZHEN";
      
      public static const UI_SIJUEJIANZHEN_PREVIOUS_CLICK:String = "UI_SIJUEJIANZHEN_PREVIOUS_CLICK";
      
      public static const UI_SIJUEJIANZHEN_NEXT_CLICK:String = "UI_SIJUEJIANZHEN_NEXT_CLICK";
      
      public static const UI_SIJUEJIANZHEN_TUPO_CLICK:String = "UI_SIJUEJIANZHEN_TUPO_CLICK";
      
      public static const UI_SIJUEJIANZHEN_KAISHITISHENG_CLICK:String = "UI_SIJUEJIANZHEN_KAISHITISHENG_CLICK";
      
      public static const UI_SIJUEJIANZHEN_ZIDONGTISHENG_CLICK:String = "UI_SIJUEJIANZHEN_ZIDONGTISHENG_CLICK";
      
      public static const UI_SIJUEJIANZHEN_GOUMAI_CLICK:String = "UI_SIJUEJIANZHEN_GOUMAI_CLICK";
      
      public static const XIANGYANGZHIZHAN:String = "XIANGYANGZHIZHAN";
      
      public static const UI_XIANGYANGZHIZHAN_SHANGYIYE_CLICK:String = "UI_XIANGYANGZHIZHAN_SHANGYIYE_CLICK";
      
      public static const UI_XIANGYANGZHIZHAN_XIAYIYE_CLICK:String = "UI_XIANGYANGZHIZHAN_XIAYIYE_CLICK";
      
      public static const UI_XIANGYANGZHIZHAN_LINGWU_SHOW:String = "UI_XIANGYANGZHIZHAN_LINGWU_SHOW";
      
      public static const UI_XIANGYANGZHIZHAN_KAISHITISHENG_CLICK:String = "UI_XIANGYANGZHIZHAN_KAISHITISHENG_CLICK";
      
      public static const UI_XIANGYANGZHIZHAN_ZIDONGTISHENG_CLICK:String = "UI_XIANGYANGZHIZHAN_ZIDONGTISHENG_CLICK";
      
      public static const UI_XIANGYANGZHIZHAN_GOUMAI_CLICK:String = "UI_XIANGYANGZHIZHAN_GOUMAI_CLICK";
      
      public static const JINGLEIQIANG:String = "JINGLEIQIANG";
      
      public static const UI_JINGLEIQIANG_PREVIOUS_CLICK:String = "UI_JINGLEIQIANG_PREVIOUS_CLICK";
      
      public static const UI_JINGLEIQIANG_NEXT_CLICK:String = "UI_JINGLEIQIANG_NEXT_CLICK";
      
      public static const UI_JINGLEIQIANG_TUPO_CLICK:String = "UI_JINGLEIQIANG_TUPO_CLICK";
      
      public static const UI_JINGLEIQIANG_KAISHITISHENG_CLICK:String = "UI_JINGLEIQIANG_KAISHITISHENG_CLICK";
      
      public static const UI_JINGLEIQIANG_ZIDONGTISHENG_CLICK:String = "UI_JINGLEIQIANG_ZIDONGTISHENG_CLICK";
      
      public static const UI_JINGLEIQIANG_GOUMAI_CLICK:String = "UI_JINGLEIQIANG_GOUMAI_CLICK";
      
      public static const UI_JINGLEIQIANG_XIANSHI_CLICK:String = "UI_JINGLEIQIANG_XIANSHI_CLICK";
      
      public static const GETMINGYUGONG:String = "GETMINGYUGONG";
      
      public static const UI_MINGYUGONG_DENGJITUPO_CLICKJ:String = "UI_MINGYUGONG_DENGJITUPO_CLICKJ";
      
      public static const UI_MINGYUGONG_PREVIOUS_CLICK:String = "UI_MINGYUGONG_PREVIOUS_CLICK";
      
      public static const UI_MINGYUGONG_NEXT_CLICK:String = "UI_MINGYUGONG_NEXT_CLICK";
      
      public static const UI_MINGYUGONG_KAISHITISHENG_CLICKJ:String = "UI_MINGYUGONG_KAISHITISHENG_CLICKJ";
      
      public static const UI_MINGYUGONG_ZIDONGTISHENG_CLICKJ:String = "UI_MINGYUGONG_ZIDONGTISHENG_CLICKJ";
      
      public static const UI_MINGYUGONG_CLOSEJ:String = "UI_MINGYUGONG_CLOSEJ";
      
      public static const UI_MINGYUGONG_GOUMAI_CLICK:String = "UI_MINGYUGONG_GOUMAI_CLICK";
      
      public static const UI_MINGYUGONG_SKILL_DRAG:String = "UI_MINGYUGONG_SKILL_DRAG";
      
      public static const UI_MINGYUGONG_SHOWWAIGUAN:String = "UI_MINGYUGONG_SHOWWAIGUAN";
      
      public static const UI_WUXINGBAOJIA_HUANZHUANG_CLICK:String = "UI_WUXINGBAOJIA_HUANZHUANG_CLICK";
      
      public static const GETTULONGDAO:String = "GETTULONGDAO";
      
      public static const UI_TULONGDAO_XIULIAN_CLICK:String = "UI_TULONGDAO_XIULIAN_CLICK";
      
      public static const UI_TULONGDAO_KAISHITISHENG_CLICK:String = "UI_TULONGDAO_KAISHITISHENG_CLICK";
      
      public static const UI_TULONGDAO_ZIDONGTISHENG_CLICK:String = "UI_TULONGDAO_ZIDONGTISHENG_CLICK";
      
      public static const UI_TULONGDAO_GOUMAI_CLICK:String = "UI_TULONGDAO_GOUMAI_CLICK";
      
      public static const UI_TULONGDAO_GUANZHU_CLICK:String = "UI_TULONGDAO_GUANZHU_CLICK";
      
      public static const UI_TULONGDAO_XIANSHI_CLICK:String = "UI_TULONGDAO_XIANSHI_CLICK";
      
      public static const UI_TULONGDAO_JIHUO_CLICK:String = "UI_TULONGDAO_JIHUO_CLICK";
      
      public static const UI_TULONGDAO_DAKAI_CLICK:String = "UI_TULONGDAO_DAKAI_CLICK";
      
      public static const GETJINSHEJIANFA:String = "GETJINSHEJIANFA";
      
      public static const UI_JINSHEJIANFA_XIULIAN_CLICK:String = "UI_JINSHEJIANFA_XIULIAN_CLICK";
      
      public static const UI_JINSHEJIANFA_PREVIOUS_CLICK:String = "UI_JINSHEJIANFA_PREVIOUS_CLICK";
      
      public static const UI_JINSHEJIANFA_NEXT_CLICK:String = "UI_JINSHEJIANFA_NEXT_CLICK";
      
      public static const UI_JINSHEJIANFA_KAISHITISHENG_CLICKJ:String = "UI_JINSHEJIANFA_KAISHITISHENG_CLICKJ";
      
      public static const UI_JINSHEJIANFA_ZIDONGTISHENG_CLICKJ:String = "UI_JINSHEJIANFA_ZIDONGTISHENG_CLICKJ";
      
      public static const UI_JINSHEJIANFA_GOUMAI_CLICK:String = "UI_JINSHEJIANFA_GOUMAI_CLICK";
      
      public static const GETCUQIANKUNGFU:String = "GETCUQIANKUNGFU";
      
      public static const UI_CUQIANKUNGFU_SHANGYIYE_CLICK:String = "UI_CUQIANKUNGFU_SHANGYIYE_CLICK";
      
      public static const UI_CUQIANKUNGFU_XIAYIYE_CLICK:String = "UI_CUQIANKUNGFU_XIAYIYE_CLICK";
      
      public static const UI_CUQIANKUNGFU_CHALLENGE_CLICK:String = "UI_CUQIANKUNGFU_CHALLENGE_CLICK";
      
      public static const GETQINGDIESHUANGREN:String = "GETQINGDIESHUANGREN";
      
      public static const UI_QINGDIESHUANGREN_XIULIAN_CLICK:String = "UI_QINGDIESHUANGREN_XIULIAN_CLICK";
      
      public static const UI_QINGDIESHUANGREN_PREVIOUS_CLICK:String = "UI_QINGDIESHUANGREN_PREVIOUS_CLICK";
      
      public static const UI_QINGDIESHUANGREN_NEXT_CLICK:String = "UI_QINGDIESHUANGREN_NEXT_CLICK";
      
      public static const UI_QINGDIESHUANGREN_KAISHITISHENG_CLICKJ:String = "UI_QINGDIESHUANGREN_KAISHITISHENG_CLICKJ";
      
      public static const UI_QINGDIESHUANGREN_ZIDONGTISHENG_CLICKJ:String = "UI_QINGDIESHUANGREN_ZIDONGTISHENG_CLICKJ";
      
      public static const UI_QINGDIESHUANGREN_GOUMAI_CLICK:String = "UI_QINGDIESHUANGREN_GOUMAI_CLICK";
      
      public static const MENPAIJUEXUE:String = "MENPAIJUEXUE";
      
      public static const MENPAINEIFA:String = "MENPAINEIFA";
      
      public static const GETCANGJIANXUANTIAN:String = "GETCANGJIANXUANTIAN";
      
      public static const UI_CANGJIANXUANTIAN_XIULIAN_CLICK:String = "UI_CANGJIANXUANTIAN_XIULIAN_CLICK";
      
      public static const UI_CANGJIANXUANTIAN_PREVIOUS_CLICK:String = "UI_CANGJIANXUANTIAN_PREVIOUS_CLICK";
      
      public static const UI_CANGJIANXUANTIAN_NEXT_CLICK:String = "UI_CANGJIANXUANTIAN_NEXT_CLICK";
      
      public static const UI_CANGJIANXUANTIAN_KAISHITISHENG_CLICKJ:String = "UI_CANGJIANXUANTIAN_KAISHITISHENG_CLICKJ";
      
      public static const UI_CANGJIANXUANTIAN_ZIDONGTISHENG_CLICKJ:String = "UI_CANGJIANXUANTIAN_ZIDONGTISHENG_CLICKJ";
      
      public static const UI_CANGJIANXUANTIAN_GOUMAI_CLICK:String = "UI_CANGJIANXUANTIAN_GOUMAI_CLICK";
      
      public static const UI_CANGJIANXUANTIAN_HUANZHUANG_CLICK:String = "UI_CANGJIANXUANTIAN_HUANZHUANG_CLICK";
      
      public static const UI_JIANGHUN_HUANZHUANG_CLICK:String = "UI_JIANGHUN_HUANZHUANG_CLICK";
      
      public const MAX_VISIBLE_BTN_COUNT:int = 17;
      
      public var tabBar:FTabBar;
      
      private var charContainer:Attribute;
      
      private var venationContainer:Venation;
      
      private var anqiContainer:Anqi;
      
      private var smithingbodyContainer:SmithingBody;
      
      private var bow:Bow;
      
      private var dantian:Dantian;
      
      public var dugujiujian:DuguJiujian;
      
      public var jiuyang:Jiuyang;
      
      private var impactPointPanel:ImpactPointPanel;
      
      private var zhenLongImpactPanel:ZhenLongImpactPointPanel;
      
      private var anqitupopingjingPanel:AnqiTupopingjingPanel;
      
      private var xiuliantisuPanel:XiuliantisuPanel;
      
      private var achieveaccomplishmentPanel1:AchieveAccomplishmentPanel;
      
      private var achieveaccomplishmentPanel2:AchieveAccomplishmentPanel;
      
      private var breadthroughPanel:VenationBreakthroughPanel;
      
      private var playerInfoContainer:PlayerInfoCanvas;
      
      private var uploadPanel:PlayerInfoUploadPhotoPanel;
      
      private var bowjinjiePanel:BowJinjiePanel;
      
      private var dongxiao:Dongxiao;
      
      private var wuXingZhiRen:WuXingZhiRen;
      
      private var dongxiaotisu:DongxiaoTisuPanel;
      
      private var dongxiaotupopingjing:DongxiaoTupopingjingPanel;
      
      private var bagua:Baguazhang;
      
      private var xiangLongShiBaZahang:XiangLongSHiBaZhang;
      
      private var yiJinJing:Yijinjing;
      
      private var xisuijing:Xisuijing;
      
      private var jingJie:JingJie;
      
      private var feilongtanyunshou:Feilongtanyunshou;
      
      public var jiuyin:Jiuyinzhenjing;
      
      private var yuncheng:YunCheng;
      
      private var wulizhi:Wulizhi;
      
      private var wuxingquan:WuXingQuan;
      
      private var shibatongren:ShiBaTongRen;
      
      private var zhanqi:ZhanQi;
      
      private var liumaishenjian:Liumaishenjian;
      
      private var jinzhongzhao:JinZhongZhao;
      
      public var xiuwei:XiuweiPanel;
      
      private var zhanhun:ZhanhunCanvas;
      
      private var zhanhundai:ZhanhundaiPanel;
      
      private var taiXuanShenGong:TaiXuanShenGong;
      
      private var beiMingShenGong:BeiMingShenGongPanel;
      
      private var qiShangQuan:QiShangQuanPanel;
      
      private var siLingZhen:SiLingZhenCanvas;
      
      private var shenzhaojing:ShenZhaoJing;
      
      private var shenzhaojingTupo:ShenZhaoJingTopoCanvas;
      
      private var shenzhaojingTisu:ShenZhaoJingTisuPanel;
      
      public var zixiashengong:ZiXiaShenGong;
      
      public var qimenzhen:QiMenZhen;
      
      private var hamagong:HaMaGong;
      
      public var tianFu:TianFu;
      
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
      
      private var chibang:ChiBang;
      
      private var tengtianyi:TengtianyiPanel;
      
      private var xiaoyaoyufeng:XiaoYaoYuFeng;
      
      private var lianqi:LianQi;
      
      private var tianmenzhen:TianMenZhen;
      
      private var bihaichaoshengqu:BiHaiChaoShengQu;
      
      private var heyizhen:HeYiZhen;
      
      private var yulizhen:YuLiZhen;
      
      private var yuxiaojianfa:YuXiaoJianFa;
      
      private var yanyuezhen:YanYueZhen;
      
      private var changshezhen:ChangSheZhen;
      
      private var canhezhi:CanHeZhi;
      
      private var emozhiyi:EMoZhiYi;
      
      private var yanxingzhen:YanXingZhen;
      
      private var xuanxiangzhen:XuanXiangZhen;
      
      private var juezhanguangmingding:JueZhanGuangMingDing;
      
      private var ganjiangmoye:GanJiangMoYe;
      
      private var hutaozhen:HuTaoZhen;
      
      private var yunlongzhen:YunLongZhen;
      
      private var xiantiangong:XianTianGong;
      
      private var pangxiezhen:PangXieZhen;
      
      private var xuedaoxinfa:XueDaoXinFa;
      
      private var _tianFuZhenPanel:TianFuZhen;
      
      private var _niaoXiangZhenPanel:NiaoXiangZhen;
      
      private var huyijuexing:HuyiJuexing;
      
      private var _tushidahuiPanel:Tushidahui;
      
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
      
      public var duguqiubai:DuGuQiuBai;
      
      private var xuantiejianfa:XuanTieJianFa;
      
      private var changshengjue:ChangShengJue;
      
      private var wanhunzhen:WanHunZhen;
      
      private var zhenlongqiju:ZhenLongQiJu;
      
      private var woDeMenPai:WoDeMenPai;
      
      private var woDeChuanGong:WoDeChuanGong;
      
      private var zhenyanshouyin:ZhenYanShouYin;
      
      private var woderongyu:WoDeRongYu;
      
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
      
      private var duomingshisanjian:DuoMingShiSanJian;
      
      private var rijinlun:Rijinlun;
      
      private var kongmingquan:KongMingQuan;
      
      private var xueyinjuexing:XueYinJueXing;
      
      private var huashanlunjian:Huashanlunjian;
      
      private var yuejinlun:Yuejinlun;
      
      private var hanbingshenzhang:HanBingZhang;
      
      private var lingxiyizhi:LingXiYiZhi;
      
      private var ynHuangdao:YNXunzhang;
      
      private var ynZhuanpan:YNXunzhang;
      
      private var ynWZZB:YNXunzhang;
      
      private var ynFSZB:YNXunzhang;
      
      private var ynliulongzhuangbei:YNliulongzhuangbei;
      
      private var ynJingLing:YNJingLing;
      
      private var ynGuiHun:YNGuiHun;
      
      private var ynJinfengdiao:YNjinfengdiao;
      
      private var xingxiuzhen:XingXiuZhen;
      
      private var xingxiuzhen1:XingXiuZhen1;
      
      private var qishazhen:QiShaZhen;
      
      private var fuWenKeHua:FuWenKeHua;
      
      private var liangyiweichenzhen:LiangYiWeiChenZhen;
      
      private var sijuejianzhen:SiJueJianZhen;
      
      private var jingleiqiang:JingLeiQiang;
      
      public var mingyugong:Mingyugong;
      
      private var cuqiankungfu:CuQianKungFu;
      
      public var qingdieshuangren:QingDieShuangRenPanel;
      
      private var btnArray1:Array = [];
      
      private var btnArray2:Array = [];
      
      private var btnArray3:Array = [];
      
      private var btnArray4:Array = [];
      
      private var btnArray5:Array = [];
      
      private var btnArray6:Array = [];
      
      private var btnArray7:Array = [];
      
      private var texiaoMc:MovieClip;
      
      private var LeftButtonContainer1:Sprite;
      
      private var LeftButtonContainer2:Sprite;
      
      private var LeftButtonContainer3:Sprite;
      
      private var LeftButtonContainer4:Sprite;
      
      private var LeftButtonContainer5:Sprite;
      
      private var LeftButtonContainer6:Sprite;
      
      private var LeftButtonContainer7:Sprite;
      
      public const BUTTON_CONTAINER_NUM:int = 7;
      
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
      
      private var jichuButton:NewButton;
      
      private var jingmaiButton:NewButton;
      
      private var roushenButton:NewButton;
      
      private var dantianButton:NewButton;
      
      private var jingjieButton:NewButton;
      
      private var baguazhangButton:NewButton;
      
      private var dugujiujianButton:NewButton;
      
      private var jiuyangshengongButton:NewButton;
      
      private var shibazhangButton:NewButton;
      
      private var anqiButton:NewButton;
      
      private var gongjianButton:NewButton;
      
      private var dongxiaoButton:NewButton;
      
      private var yijinjingButton:NewButton;
      
      private var xisuijingButton:NewButton;
      
      private var feilongtanyunshouButton:NewButton;
      
      private var jiuyinButton:NewButton;
      
      private var wuxingquanButton:NewButton;
      
      private var yunchengButton:NewButton;
      
      private var wulizhiButton:NewButton;
      
      private var shibatongrenButton:NewButton;
      
      private var zhanqiButton:NewButton;
      
      private var liumaishenjianButton:NewButton;
      
      private var wuXingZhiRenButton:NewButton;
      
      private var jinzhongzhaoButton:NewButton;
      
      private var xiuweiButton:NewButton;
      
      private var zhanhunButton:NewButton;
      
      private var taiXuanShenGongButton:NewButton;
      
      private var beiMingShenGongButton:NewButton;
      
      private var qiShangQuanButton:NewButton;
      
      private var siLingZhenButton:NewButton;
      
      private var shenzhaojingButton:NewButton;
      
      private var zixiashengongButton:NewButton;
      
      private var qimenzhenButton:NewButton;
      
      private var hamagongButton:NewButton;
      
      private var tianFuButton:NewButton;
      
      private var wuXingZhenButton:NewButton;
      
      private var chiXueMoZhenButton:NewButton;
      
      private var sanShiLiuShouButton:NewButton;
      
      private var beidouqixingButton:NewButton;
      
      private var jinchantuoqiaoButton:NewButton;
      
      private var jiuquhuangheButton:NewButton;
      
      private var zhenwuqijiezhenButton:NewButton;
      
      private var douzhuanxingyiButton:NewButton;
      
      private var xunzhangyangchengButton:NewButton;
      
      private var guiliuzhenButton:NewButton;
      
      private var jingangfumoquanButton:NewButton;
      
      private var qinlonggongButton:NewButton;
      
      private var chibangButton:NewButton;
      
      private var tengtianyiButton:NewButton;
      
      private var xiaoyaoyufengButton:NewButton;
      
      private var lianqiButton:NewButton;
      
      private var tianmenzhenButton:NewButton;
      
      private var bihaichaoshengquButton:NewButton;
      
      private var heyizhenButton:NewButton;
      
      private var yulizhenButton:NewButton;
      
      private var yuxiaojianfaButton:NewButton;
      
      private var yanyuezhenButton:NewButton;
      
      private var changshezhenButton:NewButton;
      
      private var canhezhiButton:NewButton;
      
      private var emozhiyiButton:NewButton;
      
      private var yanxingzhenButton:NewButton;
      
      private var xuanxiangzhenButton:NewButton;
      
      private var juezhanguangmingdingButton:NewButton;
      
      private var ganjiangmoyeButton:NewButton;
      
      private var hutaozhenButton:NewButton;
      
      private var yunlongzhenButton:NewButton;
      
      private var xiantiangongButton:NewButton;
      
      private var pangxiezhenButton:NewButton;
      
      private var xuedaoxinfaButton:NewButton;
      
      private var _tianFuZhenBtn:NewButton;
      
      private var _niaoXiangZhenBtn:NewButton;
      
      private var huyijuexingButton:NewButton;
      
      private var _tushidahuiBtn:NewButton;
      
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
      
      private var woDeChuanGongButton:NewButton;
      
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
      
      private var huashanlunjianButton:NewButton;
      
      private var hanbingshenzhangButton:NewButton;
      
      private var lingxiyizhiButton:NewButton;
      
      private var ynHuangdaoButton:NewButton;
      
      private var ynZhuanpanButton:NewButton;
      
      private var ynWZZBButton:NewButton;
      
      private var ynFSZBButton:NewButton;
      
      private var wuxiakapaiButton:NewButton;
      
      private var cangbaogeButton:NewButton;
      
      private var rijinlunButton:NewButton;
      
      private var kongmingquanButton:NewButton;
      
      private var xueyinjuexingButton:NewButton;
      
      private var yuejinlunButton:NewButton;
      
      private var ynliulongzhuangbeiButton:NewButton;
      
      private var ynJingLingButton:NewButton;
      
      private var ynGuiHunButton:NewButton;
      
      private var ynjinfengdiaoButton:NewButton;
      
      private var yntulongdaoButton:NewButton;
      
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
      
      private var shenxingbaibianObj:Object;
      
      private var luoyingshenjianzhangObj:Object;
      
      private var xuantiejianfaObj:Object;
      
      private var bazhentuObj:Object;
      
      private var changshengjueObj:Object;
      
      private var wanhunzhenObj:Object;
      
      private var tianyuyanmengObj:Object;
      
      private var zhenyanshouyinObj:Object;
      
      private var shengsifuObj:Object;
      
      private var woderongyuButton:NewButton;
      
      private var fumozhangfaObj:Object;
      
      private var yunvsuxinjianfaObj:Object;
      
      private var zhenlongqijuObj:Object;
      
      private var taohuazhenObj:Object;
      
      private var xiakexingObj:Object;
      
      private var duguqiubaiObj:Object;
      
      private var langhundunObj:Object;
      
      private var tianshanliuyangzhangObj:Object;
      
      private var lb:int;
      
      private var bitmap:Bitmap;
      
      private var objSanShiLiuShou:Object;
      
      private var objBeiDouQiXing:DataObject;
      
      private var objJinChanTuoQiao:DataObject;
      
      private var objJiuQuHuangHeZhen:DataObject;
      
      private var objDouZhuanXingYi:Object;
      
      private var objChiBang:Object;
      
      private var objTengtianyi:Object;
      
      private var objQinLongGong:Object;
      
      private var objXiaoYaoYuFeng:Object;
      
      private var objLianQi:Object;
      
      private var objTianMenZhen:Object;
      
      private var objBiHaiChaoShengQu:Object;
      
      private var objHeYiZhen:Object;
      
      private var objYuLiZhen:Object;
      
      private var objYanYueZhen:Object;
      
      private var objChangSheZhen:Object;
      
      private var objCanHeZhi:Object;
      
      private var objYanXingZhen:Object;
      
      private var objJueZhanGuangMingDing:Object;
      
      private var objHuTaoZhen:Object;
      
      private var objYunLongZhen:Object;
      
      private var objXueDaoXinFa:Object;
      
      private var objTianFuZhen:Object;
      
      private var niaoXiangZhenObj:Object;
      
      private var objDiZaiZhen:Object;
      
      private var objFengYangZhen:Object;
      
      private var objLongYaJueXing:Object;
      
      private var objQuanShenJueXing:Object;
      
      private var objWuDuZhen:Object;
      
      private var objHaMaGong:Object;
      
      private var objChiXueMoZhen:Object;
      
      private var objZhenWuQiJieZhen:DataObject;
      
      private var objJinGangFuMoQuan:Object;
      
      private var objEMoZhiYi:Object;
      
      private var objXuanXiangZhen:Object;
      
      private var objXianTianGong:Object;
      
      private var objGuiLiuZhen:Object;
      
      private var objYuXiaoJianFa:Object;
      
      private var objYunCheng:Object;
      
      private var objBaGua:Object;
      
      private var objAnQi:Object;
      
      private var bowObj:Object;
      
      private var objJiuJian:Object;
      
      private var objJiuYang:Object;
      
      private var dongXiaoObj:Object;
      
      private var wuXingZhiRenObj:Object;
      
      private var objXiangLong:Object;
      
      private var yiJinJingObj:Object;
      
      private var xiSuiJingObj:Object;
      
      private var jingJieObj:Object;
      
      private var feiLongObj:Object;
      
      private var jiuYinObj:Object;
      
      private var xunZhangObj:Object;
      
      private var wuXingQuanObj:Object;
      
      private var shiBaTongRenObj:Object;
      
      private var zhanQiObj:Object;
      
      private var liuMaiObj:Object;
      
      private var jinZhongZhaoObj:Object;
      
      private var xiuWeiObj:Object;
      
      private var zhanHunObj:Object;
      
      private var taiXuanObj:Object;
      
      private var beiMingObj:Object;
      
      private var qiShangQuanObj:Object;
      
      private var siLingZhenObj:Object;
      
      private var shenzhaojingObj:Object;
      
      private var ziXiaObj:Object;
      
      private var qiMenZhenObj:Object;
      
      private var tianFuObj:Object;
      
      private var wuXingZhenObj:Object;
      
      private var woDeChuanGongObj:Object;
      
      private var xunZhangYangChengObj:Object;
      
      private var pangXieZhenObj:Object;
      
      private var tushidahuiObj:Object;
      
      private var objHuYiJueXing:Object;
      
      private var objLongYinJueXing:Object;
      
      private var objRuLaiShenZhang:Object;
      
      private var danTianObj:Object;
      
      private var objMoLingZhiYi:Object;
      
      private var objLieKongJueXing:Object;
      
      private var objAoJianShenJiangJi:Object;
      
      private var objDuomingshisanjian:Object;
      
      private var wuxiakapaiObj:Object;
      
      private var objRijinlun:Object;
      
      private var objKongmingquan:Object;
      
      private var objXueYinJueXing:Object;
      
      private var objHuashanlunjian:Object;
      
      private var objYuejinlun:Object;
      
      private var objHanbingshenzhang:Object;
      
      private var lingxiyizhiObj:Object;
      
      private var ynZhuanpanObj:Object;
      
      private var ynHuangdaoObj:Object;
      
      private var ynWZZBObj:Object;
      
      private var ynFSZBObj:Object;
      
      private var cangbaogeObj:Object;
      
      private var ynliulongzhuangbeiObj:Object;
      
      private var ynJingLingObj:Object;
      
      private var ynGuiHunObj:Object;
      
      private var ynjinfengdiaoObj:Object;
      
      private var xunzhangzhanshiObj:Object;
      
      private var xingxiuzhenObj:Object;
      
      private var xingxiuzhen1Obj:Object;
      
      private var objQishazhen:Object;
      
      private var objFuWenKeHua:Object;
      
      private var objLiangYiWeiChenZhen:Object;
      
      private var objSiJueJianZhen:Object;
      
      private var xiangyangzhizhan:XiangYangZhiZhan;
      
      private var xiangyangzhizhanButton:NewButton;
      
      private var objXiangYangZhiZhan:Object;
      
      private var jingleiqiangObj:Object;
      
      public var tulongdao:TuLongDao;
      
      private var tulongdaoButton:NewButton;
      
      public var jinSheJianFa:JinSheJianFaPanel;
      
      private var jinSheJianFaButton:NewButton;
      
      private var menpaijuexueButton:NewButton;
      
      private var menpaineifaButton:NewButton;
      
      private var menpaijuexue:MenPaiJueXue;
      
      private var menpaineifa:MenPaiNeiFa;
      
      public var cangjianxuantian:CangJianXuanTianPanel;
      
      private var cangjianxuantianButton:NewButton;
      
      internal var tulongdaoObj:Object;
      
      internal var objJinSheJianFa:Object;
      
      internal var objCuQianKungFu:Object;
      
      internal var objQingDieShuangRen:Object;
      
      private var objMenPaiJueXue:Object;
      
      private var objMenPaiNeiFa:Object;
      
      internal var objCangJianXuanTian:Object;
      
      public function CharAttribute()
      {
         var _loc1_:Object = null;
         var _loc2_:Vector.<Bitmap> = null;
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 502;
         height = 432;
         titleText = LanResManager.getLanCommonTextWords("人物属性");
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
         this.charContainer = new Attribute();
         this.charContainer.$parent = this;
         this.charContainer.zanwenValue.$parent = this;
         this.charContainer.equipList.$parent2 = this;
         addChildAt(this.charContainer,0);
         this.charContainer.x = 90;
         this.charContainer.y = 22;
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
         _loc1_.dengji = -5;
         this.btnArray1.push(_loc1_);
         this.venationContainer = new Venation();
         this.venationContainer.$parent = this;
         addChildAt(this.venationContainer,0);
         this.venationContainer.x = 90;
         this.venationContainer.y = 22;
         this.jingmaiButton = new NewButton();
         this.jingmaiButton.label = LanResManager.getLanCommonTextWords("经脉");
         this.jingmaiButton.width = 80;
         this.jingmaiButton.height = 20;
         this.jingmaiButton.align = "center";
         this.jingmaiButton.y = 20;
         this.jingmaiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
         this.LeftButtonContainer1.addChild(this.jingmaiButton);
         _loc1_ = new Object();
         _loc1_.neirong = this.venationContainer;
         _loc1_.biaoqian = this.jingmaiButton;
         _loc1_.name = "2";
         _loc1_.isShow = true;
         _loc1_.dengji = -4;
         this.btnArray1.push(_loc1_);
         this.smithingbodyContainer = new SmithingBody();
         this.smithingbodyContainer.$parent = this;
         addChildAt(this.smithingbodyContainer,0);
         this.smithingbodyContainer.x = 89;
         this.smithingbodyContainer.y = 21;
         this.roushenButton = new NewButton();
         this.roushenButton.label = LanResManager.getLanCommonTextWords("肉身");
         this.roushenButton.width = 80;
         this.roushenButton.height = 20;
         this.roushenButton.align = "center";
         this.roushenButton.y = 40;
         this.roushenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
         this.LeftButtonContainer1.addChild(this.roushenButton);
         _loc1_ = new Object();
         _loc1_.neirong = this.smithingbodyContainer;
         _loc1_.biaoqian = this.roushenButton;
         _loc1_.name = "3";
         _loc1_.isShow = true;
         _loc1_.dengji = -3;
         this.btnArray1.push(_loc1_);
         this.yuncheng = new YunCheng();
         this.yuncheng.setParent = this;
         this.yuncheng.x = 90;
         this.yuncheng.y = 22;
         this.yunchengButton = new NewButton();
         this.yunchengButton.label = LanResManager.getLanCommonTextWords("运程");
         this.yunchengButton.width = 80;
         this.yunchengButton.height = 20;
         this.yunchengButton.align = "center";
         this.yunchengButton.y = 60;
         this.objYunCheng = new Object();
         this.objYunCheng.neirong = this.yuncheng;
         this.objYunCheng.biaoqian = this.yunchengButton;
         this.objYunCheng.name = "4";
         this.objYunCheng.isShow = true;
         this.objYunCheng.dengji = -1;
         this.wulizhi = new Wulizhi();
         this.wulizhi.setParent = this;
         this.wulizhi.x = 90;
         this.wulizhi.y = 22;
         this.wulizhiButton = new NewButton();
         this.wulizhiButton.label = LanResManager.getLanCommonTextWords("勋章");
         this.wulizhiButton.width = 80;
         this.wulizhiButton.height = 20;
         this.wulizhiButton.align = "center";
         this.wulizhiButton.y = 80;
         this.xunZhangObj = new Object();
         this.xunZhangObj.neirong = this.wulizhi;
         this.xunZhangObj.biaoqian = this.wulizhiButton;
         this.xunZhangObj.name = "5";
         this.xunZhangObj.isShow = true;
         this.xunZhangObj.dengji = -1;
         this.zhanqi = new ZhanQi();
         this.zhanqi.setParent = this;
         this.zhanqi.x = 90;
         this.zhanqi.y = 22;
         this.zhanqiButton = new NewButton();
         this.zhanqiButton.label = LanResManager.getLanCommonTextWords("战旗");
         this.zhanqiButton.width = 80;
         this.zhanqiButton.height = 20;
         this.zhanqiButton.align = "center";
         this.zhanqiButton.y = 100;
         this.zhanQiObj = new Object();
         this.zhanQiObj.neirong = this.zhanqi;
         this.zhanQiObj.biaoqian = this.zhanqiButton;
         this.zhanQiObj.name = "6";
         this.zhanQiObj.isShow = true;
         this.zhanQiObj.dengji = -1;
         this.xiuwei = new XiuweiPanel();
         this.xiuwei._$parent = this;
         this.xiuwei.x = 90;
         this.xiuwei.y = 22;
         this.xiuweiButton = new NewButton();
         this.xiuweiButton.label = LanResManager.getLanCommonTextWords("修行");
         this.xiuweiButton.width = 80;
         this.xiuweiButton.height = 20;
         this.xiuweiButton.align = "center";
         this.xiuweiButton.y = 120;
         this.xiuWeiObj = new Object();
         this.xiuWeiObj.neirong = this.xiuwei;
         this.xiuWeiObj.biaoqian = this.xiuweiButton;
         this.xiuWeiObj.name = "7";
         this.xiuWeiObj.isShow = true;
         this.xiuWeiObj.dengji = -1;
         this.zhanhun = new ZhanhunCanvas();
         this.zhanhun.$parent = this;
         this.zhanhun.x = 90;
         this.zhanhun.y = 22;
         this.zhanhunButton = new NewButton();
         this.zhanhunButton.label = LanResManager.getLanCommonTextWords("战魂");
         this.zhanhunButton.width = 80;
         this.zhanhunButton.height = 20;
         this.zhanhunButton.align = "center";
         this.zhanhunButton.y = 140;
         this.zhanHunObj = new Object();
         this.zhanHunObj.neirong = this.zhanhun;
         this.zhanHunObj.biaoqian = this.zhanhunButton;
         this.zhanHunObj.name = "8";
         this.zhanHunObj.isShow = true;
         this.zhanHunObj.dengji = -1;
         this.jingJie = new JingJie();
         this.jingJie.setParent = this;
         this.jingJie.x = 90;
         this.jingJie.y = 22;
         this.jingjieButton = new NewButton();
         this.jingjieButton.label = LanResManager.getLanTextWords(this,"境界");
         this.jingjieButton.width = 80;
         this.jingjieButton.height = 20;
         this.jingjieButton.align = "center";
         this.jingjieButton.y = 160;
         this.jingJieObj = new Object();
         this.jingJieObj.neirong = this.jingJie;
         this.jingJieObj.biaoqian = this.jingjieButton;
         this.jingJieObj.name = "9";
         this.jingJieObj.isShow = true;
         this.jingJieObj.dengji = 60;
         this.dantian = new Dantian();
         this.dantian.$parent = this;
         this.dantian.x = 90;
         this.dantian.y = 22;
         this.dantianButton = new NewButton();
         this.dantianButton.label = LanResManager.getLanCommonTextWords("丹田");
         this.dantianButton.width = 80;
         this.dantianButton.height = 20;
         this.dantianButton.align = "center";
         this.dantianButton.y = 180;
         this.dantianButton.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("完成65级郭芙处的支线任务后可以开始修炼第一级丹田") + "</font>";
         this.danTianObj = new Object();
         this.danTianObj.neirong = this.dantian;
         this.danTianObj.biaoqian = this.dantianButton;
         this.danTianObj.name = "10";
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
         this.tianFuButton.y = 200;
         this.tianFuObj = new Object();
         this.tianFuObj.neirong = this.tianFu;
         this.tianFuObj.biaoqian = this.tianFuButton;
         this.tianFuObj.name = "11";
         this.tianFuObj.isShow = true;
         this.tianFuObj.dengji = -1;
         this.xunzhangyangcheng = new XunZhangYangCheng();
         this.xunzhangyangcheng.$parent = this;
         this.xunzhangyangcheng.x = 90;
         this.xunzhangyangcheng.y = 22;
         this.xunzhangyangchengButton = new NewButton();
         this.xunzhangyangchengButton.label = LanResManager.getLanCommonTextWords("勋章养成");
         this.xunzhangyangchengButton.width = 80;
         this.xunzhangyangchengButton.height = 20;
         this.xunzhangyangchengButton.align = "center";
         this.xunzhangyangchengButton.y = 220;
         _loc1_ = new Object();
         _loc1_.neirong = this.xunzhangyangcheng;
         _loc1_.biaoqian = this.xunzhangyangchengButton;
         _loc1_.name = "12";
         _loc1_.isShow = true;
         _loc1_.dengji = -1;
         this.xunZhangYangChengObj = new Object();
         this.xunZhangYangChengObj.neirong = this.xunzhangyangcheng;
         this.xunZhangYangChengObj.biaoqian = this.xunzhangyangchengButton;
         this.xunZhangYangChengObj.name = "12";
         this.xunZhangYangChengObj.isShow = true;
         this.xunZhangYangChengObj.dengji = -1;
         this.lianqi = new LianQi();
         this.lianqi.setParent = this;
         this.lianqi.x = 90;
         this.lianqi.y = 22;
         this.lianqiButton = new NewButton();
         this.lianqiButton.label = LanResManager.getLanCommonTextWords("炼气");
         this.lianqiButton.width = 80;
         this.lianqiButton.height = 20;
         this.lianqiButton.align = "center";
         this.lianqiButton.y = 40;
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
         this.ynHuangdao = new YNXunzhang();
         this.ynHuangdao.$parent = this;
         this.ynHuangdao.x = 90;
         this.ynHuangdao.y = 22;
         this.ynHuangdaoButton = new NewButton();
         this.ynHuangdaoButton.label = LanResManager.getLanCommonTextWords("黄道");
         this.ynHuangdaoButton.width = 80;
         this.ynHuangdaoButton.height = 20;
         this.ynHuangdaoButton.align = "center";
         this.ynZhuanpan = new YNXunzhang();
         this.ynZhuanpan.$parent = this;
         this.ynZhuanpan.x = 90;
         this.ynZhuanpan.y = 22;
         this.ynZhuanpanButton = new NewButton();
         this.ynZhuanpanButton.label = LanResManager.getLanCommonTextWords("转盘");
         this.ynZhuanpanButton.width = 80;
         this.ynZhuanpanButton.height = 20;
         this.ynZhuanpanButton.align = "center";
         this.ynZhuanpanButton.visible = false;
         this.ynWZZB = new YNXunzhang();
         this.ynWZZB.$parent = this;
         this.ynWZZB.x = 90;
         this.ynWZZB.y = 22;
         this.ynWZZBButton = new NewButton();
         this.ynWZZBButton.label = LanResManager.getLanCommonTextWords("王者装备");
         this.ynWZZBButton.width = 80;
         this.ynWZZBButton.height = 20;
         this.ynWZZBButton.align = "center";
         this.ynWZZBButton.visible = false;
         this.ynFSZB = new YNXunzhang();
         this.ynFSZB.$parent = this;
         this.ynFSZB.x = 90;
         this.ynFSZB.y = 22;
         this.ynFSZBButton = new NewButton();
         this.ynFSZBButton.label = LanResManager.getLanCommonTextWords("飞升装备");
         this.ynFSZBButton.width = 80;
         this.ynFSZBButton.height = 20;
         this.ynFSZBButton.align = "center";
         this.ynFSZBButton.visible = false;
         this.woDeChuanGong = new WoDeChuanGong();
         this.woDeChuanGong.setParent = this;
         this.woDeChuanGong.x = 90;
         this.woDeChuanGong.y = 22;
         this.woDeChuanGong.visible = false;
         this.woDeChuanGongButton = new NewButton();
         this.woDeChuanGongButton.label = LanResManager.getLanCommonTextWords("传功");
         this.woDeChuanGongButton.width = 80;
         this.woDeChuanGongButton.height = 20;
         this.woDeChuanGongButton.align = "center";
         this.woDeChuanGongButton.visible = false;
         this.woDeChuanGongObj = new Object();
         this.woDeChuanGongObj.neirong = this.woDeChuanGong;
         this.woDeChuanGongObj.biaoqian = this.woDeChuanGongButton;
         this.woDeChuanGongObj.name = "16";
         this.woDeChuanGongObj.isShow = true;
         this.woDeChuanGongObj.dengji = -1;
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
         this.LeftButtonContainer2 = new Sprite();
         this.LeftButtonContainer2.x = 10;
         this.LeftButtonContainer2.y = 25;
         this.bagua = new Baguazhang();
         this.bagua.$parent = this;
         this.bagua.x = 90;
         this.bagua.y = 22;
         this.baguazhangButton = new NewButton();
         this.baguazhangButton.label = LanResManager.getLanCommonTextWords("八卦掌");
         this.baguazhangButton.width = 80;
         this.baguazhangButton.height = 20;
         this.baguazhangButton.align = "center";
         this.baguazhangButton.y = 0;
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
         this.qiShangQuanObj.isShow = false;
         this.qiShangQuanObj.dengji = 20;
         this.shenzhaojing = new ShenZhaoJing();
         this.shenzhaojing.setParent = this;
         this.shenzhaojing.x = 90;
         this.shenzhaojing.y = 22;
         this.shenzhaojingButton = new NewButton();
         this.shenzhaojingButton.label = LanResManager.getLanCommonTextWords("神照经");
         this.shenzhaojingButton.width = 80;
         this.shenzhaojingButton.height = 20;
         this.shenzhaojingButton.align = "center";
         this.shenzhaojingButton.y = 20;
         this.shenzhaojingObj = new Object();
         this.shenzhaojingObj.neirong = this.shenzhaojing;
         this.shenzhaojingObj.biaoqian = this.shenzhaojingButton;
         this.shenzhaojingObj.name = "2";
         this.shenzhaojingObj.isShow = true;
         this.shenzhaojingObj.dengji = 30;
         this.zixiashengongButton = new NewButton();
         this.zixiashengongButton.label = LanResManager.getLanCommonTextWords("紫霞神功");
         this.zixiashengongButton.width = 80;
         this.zixiashengongButton.height = 20;
         this.zixiashengongButton.align = "center";
         this.zixiashengongButton.y = 40;
         this.zixiashengong = new ZiXiaShenGong();
         this.zixiashengong.setParent = this;
         this.zixiashengong.x = 90;
         this.zixiashengong.y = 22;
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
         this.yijinjingButton.y = 60;
         this.yiJinJingObj = new Object();
         this.yiJinJingObj.neirong = this.yiJinJing;
         this.yiJinJingObj.biaoqian = this.yijinjingButton;
         this.yiJinJingObj.name = "3";
         this.yiJinJingObj.isShow = true;
         this.yiJinJingObj.dengji = 61;
         this.dugujiujian = new DuguJiujian();
         this.dugujiujian.$parent = this;
         this.dugujiujian.x = 90;
         this.dugujiujian.y = 22;
         this.dugujiujianButton = new NewButton();
         this.dugujiujianButton.label = LanResManager.getLanCommonTextWords("独孤九剑");
         this.dugujiujianButton.width = 80;
         this.dugujiujianButton.height = 20;
         this.dugujiujianButton.align = "center";
         this.dugujiujianButton.y = 80;
         this.dugujiujianButton.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("等级达到62级后，可以开始修炼独孤九剑，破尽天下武学") + "</font>";
         this.objJiuJian = new Object();
         this.objJiuJian.neirong = this.dugujiujian;
         this.objJiuJian.biaoqian = this.dugujiujianButton;
         this.objJiuJian.name = "4";
         this.objJiuJian.isShow = true;
         this.objJiuJian.dengji = 62;
         this.jiuyang = new Jiuyang();
         this.jiuyang.$parent = this;
         this.jiuyang.x = 89;
         this.jiuyang.y = 23;
         this.jiuyangshengongButton = new NewButton();
         this.jiuyangshengongButton.label = LanResManager.getLanCommonTextWords("九阳神功");
         this.jiuyangshengongButton.width = 80;
         this.jiuyangshengongButton.height = 20;
         this.jiuyangshengongButton.align = "center";
         this.jiuyangshengongButton.y = 100;
         this.jiuyangshengongButton.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("角色62级后方可修炼九阳神功") + "</font>";
         this.objJiuYang = new Object();
         this.objJiuYang.neirong = this.jiuyang;
         this.objJiuYang.biaoqian = this.jiuyangshengongButton;
         this.objJiuYang.name = "5";
         this.objJiuYang.isShow = true;
         this.objJiuYang.dengji = 62;
         this.xisuijing = new Xisuijing();
         this.xisuijing.setParent = this;
         this.xisuijing.x = 90;
         this.xisuijing.y = 22;
         this.xisuijingButton = new NewButton();
         this.xisuijingButton.label = LanResManager.getLanCommonTextWords("洗髓经");
         this.xisuijingButton.width = 80;
         this.xisuijingButton.height = 20;
         this.xisuijingButton.align = "center";
         this.xisuijingButton.y = 120;
         this.xiSuiJingObj = new Object();
         this.xiSuiJingObj.neirong = this.xisuijing;
         this.xiSuiJingObj.biaoqian = this.xisuijingButton;
         this.xiSuiJingObj.name = "6";
         this.xiSuiJingObj.isShow = true;
         this.xiSuiJingObj.dengji = 63;
         this.jiuyin = new Jiuyinzhenjing();
         this.jiuyin.$parent = this;
         this.jiuyin.x = 90;
         this.jiuyin.y = 22;
         this.jiuyinButton = new NewButton();
         this.jiuyinButton.label = LanResManager.getLanCommonTextWords("九阴真经");
         this.jiuyinButton.width = 80;
         this.jiuyinButton.height = 20;
         this.jiuyinButton.align = "center";
         this.jiuyinButton.y = 140;
         this.jiuYinObj = new Object();
         this.jiuYinObj.neirong = this.jiuyin;
         this.jiuYinObj.biaoqian = this.jiuyinButton;
         this.jiuYinObj.name = "7";
         this.jiuYinObj.isShow = true;
         this.jiuYinObj.dengji = 64;
         this.feilongtanyunshou = new Feilongtanyunshou();
         this.feilongtanyunshou.setParent = this;
         this.feilongtanyunshou.x = 90;
         this.feilongtanyunshou.y = 22;
         this.feilongtanyunshouButton = new NewButton();
         this.feilongtanyunshouButton.label = LanResManager.getLanCommonTextWords("飞龙探云手");
         this.feilongtanyunshouButton.width = 80;
         this.feilongtanyunshouButton.height = 20;
         this.feilongtanyunshouButton.align = "center";
         this.feilongtanyunshouButton.y = 160;
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
         this.wuxingquanButton = new NewButton();
         this.wuxingquanButton.label = LanResManager.getLanCommonTextWords("五形拳");
         this.wuxingquanButton.width = 80;
         this.wuxingquanButton.height = 20;
         this.wuxingquanButton.align = "center";
         this.wuxingquanButton.y = 180;
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
         this.liumaishenjianButton = new NewButton();
         this.liumaishenjianButton.label = LanResManager.getLanCommonTextWords("六脉神剑");
         this.liumaishenjianButton.width = 80;
         this.liumaishenjianButton.height = 20;
         this.liumaishenjianButton.align = "center";
         this.liumaishenjianButton.y = 200;
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
         this.shibazhangButton = new NewButton();
         this.shibazhangButton.label = LanResManager.getLanCommonTextWords("降龙十八掌");
         this.shibazhangButton.width = 80;
         this.shibazhangButton.height = 20;
         this.shibazhangButton.align = "center";
         this.shibazhangButton.y = 220;
         this.shibazhangButton.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("人物等级达到级，才能修炼降龙十八掌") + "</font>";
         this.objXiangLong = new Object();
         this.objXiangLong.neirong = this.xiangLongShiBaZahang;
         this.objXiangLong.biaoqian = this.shibazhangButton;
         this.objXiangLong.name = "11";
         this.objXiangLong.isShow = false;
         this.objXiangLong.dengji = 70;
         this.jinzhongzhao = new JinZhongZhao();
         this.jinzhongzhao.$parent = this;
         this.jinzhongzhao.x = 90;
         this.jinzhongzhao.y = 22;
         this.jinzhongzhaoButton = new NewButton();
         this.jinzhongzhaoButton.label = LanResManager.getLanCommonTextWords("金钟罩");
         this.jinzhongzhaoButton.width = 80;
         this.jinzhongzhaoButton.height = 20;
         this.jinzhongzhaoButton.align = "center";
         this.jinzhongzhaoButton.y = 240;
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
         this.taiXuanShenGongButton = new NewButton();
         this.taiXuanShenGongButton.label = LanResManager.getLanCommonTextWords("太玄神功");
         this.taiXuanShenGongButton.width = 80;
         this.taiXuanShenGongButton.height = 20;
         this.taiXuanShenGongButton.align = "center";
         this.taiXuanShenGongButton.y = 260;
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
         this.beiMingShenGongButton = new NewButton();
         this.beiMingShenGongButton.label = LanResManager.getLanCommonTextWords("北冥神功");
         this.beiMingShenGongButton.width = 80;
         this.beiMingShenGongButton.height = 20;
         this.beiMingShenGongButton.align = "center";
         this.beiMingShenGongButton.y = 280;
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
         this.sanShiLiuShou = new SanShiLiuShouDianXueShu();
         this.sanShiLiuShou.setParent = this;
         this.sanShiLiuShou.x = 90;
         this.sanShiLiuShou.y = 22;
         this.sanShiLiuShouButton = new NewButton();
         this.sanShiLiuShouButton.label = LanResManager.getLanCommonTextWords("擒拿点穴术");
         this.sanShiLiuShouButton.width = 80;
         this.sanShiLiuShouButton.height = 20;
         this.sanShiLiuShouButton.align = "center";
         this.rulaishenzhang = new RuLaiShenZhang();
         this.rulaishenzhang.setParent = this;
         this.rulaishenzhang.x = 90;
         this.rulaishenzhang.y = 22;
         this.rulaishenzhangButton = new NewButton();
         this.rulaishenzhangButton.label = LanResManager.getLanCommonTextWords("如来神掌");
         this.rulaishenzhangButton.width = 80;
         this.rulaishenzhangButton.height = 20;
         this.rulaishenzhangButton.align = "center";
         this.objSanShiLiuShou = new Object();
         this.objSanShiLiuShou.neirong = this.sanShiLiuShou;
         this.objSanShiLiuShou.biaoqian = this.sanShiLiuShouButton;
         this.objSanShiLiuShou.name = "18";
         this.objSanShiLiuShou.isShow = true;
         this.objSanShiLiuShou.dengji = -1;
         this.mingyugong = new Mingyugong();
         this.mingyugong.$parent = this;
         this.mingyugong.setParent = this;
         addChildAt(this.mingyugong,0);
         this.mingyugong.x = 90;
         this.mingyugong.y = 22;
         this.mingyugongButton = new NewButton();
         this.mingyugongButton.label = LanResManager.getLanCommonTextWords("明玉功");
         this.mingyugongButton.width = 80;
         this.mingyugongButton.height = 20;
         this.mingyugongButton.align = "center";
         this.mingyugongButton.y = 220;
         this.mingyugongButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
         this.LeftButtonContainer2.addChild(this.mingyugongButton);
         _loc1_ = new Object();
         _loc1_.neirong = this.mingyugong;
         _loc1_.biaoqian = this.mingyugongButton;
         _loc1_.name = "43";
         _loc1_.isShow = true;
         _loc1_.dengji = 70;
         this.btnArray2.push(_loc1_);
         this.cuqiankungfu = new CuQianKungFu();
         this.cuqiankungfu.setParent = this;
         addChildAt(this.cuqiankungfu,0);
         this.cuqiankungfu.x = 90;
         this.cuqiankungfu.y = 22;
         this.cuqiankungfuButton = new NewButton();
         this.cuqiankungfuButton.label = LanResManager.getLanCommonTextWords("粗浅功夫");
         this.cuqiankungfuButton.width = 80;
         this.cuqiankungfuButton.height = 20;
         this.cuqiankungfuButton.align = "center";
         this.cuqiankungfuButton.y = 260;
         this.cuqiankungfuButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
         this.LeftButtonContainer2.addChild(this.cuqiankungfuButton);
         _loc1_ = new Object();
         _loc1_.neirong = this.cuqiankungfu;
         _loc1_.biaoqian = this.cuqiankungfuButton;
         _loc1_.name = "44";
         _loc1_.isShow = true;
         _loc1_.dengji = 60;
         this.btnArray2.push(_loc1_);
         this.addChild(this.LeftButtonContainer2);
         this.LeftButtonContainer3 = new Sprite();
         this.LeftButtonContainer3.x = 10;
         this.LeftButtonContainer3.y = 25;
         this.addChild(this.LeftButtonContainer3);
         this.anqiContainer = new Anqi();
         this.anqiContainer.$parent = this;
         this.anqiContainer.x = 90;
         this.anqiContainer.y = 22;
         this.anqiButton = new NewButton();
         this.anqiButton.label = LanResManager.getLanCommonTextWords("暗器");
         this.anqiButton.width = 80;
         this.anqiButton.height = 20;
         this.anqiButton.align = "center";
         this.anqiButton.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("人物达到14级，则可获得第一件暗器") + "</font>";
         this.objAnQi = new Object();
         this.objAnQi.neirong = this.anqiContainer;
         this.objAnQi.biaoqian = this.anqiButton;
         this.objAnQi.name = "1";
         this.objAnQi.isShow = false;
         this.objAnQi.dengji = 14;
         this.bow = new Bow();
         this.bow.$parent = this;
         this.bow.x = 90;
         this.bow.y = 22;
         this.gongjianButton = new NewButton();
         this.gongjianButton.label = LanResManager.getLanCommonTextWords("弓箭");
         this.gongjianButton.width = 80;
         this.gongjianButton.height = 20;
         this.gongjianButton.align = "center";
         this.gongjianButton.y = 20;
         this.gongjianButton.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("人物达到60级，则可获得第一把弓箭") + "</font>";
         this.bowObj = new Object();
         this.bowObj.neirong = this.bow;
         this.bowObj.biaoqian = this.gongjianButton;
         this.bowObj.name = "2";
         this.bowObj.isShow = false;
         this.bowObj.dengji = 60;
         this.dongxiao = new Dongxiao();
         this.dongxiao.$parent = this;
         this.dongxiao.x = 90;
         this.dongxiao.y = 22;
         this.dongxiaoButton = new NewButton();
         this.dongxiaoButton.label = LanResManager.getLanCommonTextWords("洞箫");
         this.dongxiaoButton.width = 80;
         this.dongxiaoButton.height = 20;
         this.dongxiaoButton.align = "center";
         this.dongxiaoButton.y = 40;
         this.dongxiaoButton.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("人物达到68级，则可以修炼此功能，有如神助，独步天下") + "</font>";
         this.dongXiaoObj = new Object();
         this.dongXiaoObj.neirong = this.dongxiao;
         this.dongXiaoObj.biaoqian = this.dongxiaoButton;
         this.dongXiaoObj.name = "3";
         this.dongXiaoObj.isShow = false;
         this.dongXiaoObj.dengji = 68;
         this.ynJinfengdiao = new YNjinfengdiao();
         this.ynJinfengdiao.$parent = this;
         this.ynJinfengdiao.x = 90;
         this.ynJinfengdiao.y = 22;
         this.ynjinfengdiaoButton = new NewButton();
         this.ynjinfengdiaoButton.label = LanResManager.getLanCommonTextWords("金凤雕");
         this.ynjinfengdiaoButton.width = 80;
         this.ynjinfengdiaoButton.height = 20;
         this.ynjinfengdiaoButton.align = "center";
         this.ynjinfengdiaoButton.visible = false;
         this.wuXingZhiRen = new WuXingZhiRen();
         this.wuXingZhiRen.$parent = this;
         this.wuXingZhiRen.x = 90;
         this.wuXingZhiRen.y = 22;
         this.wuXingZhiRenButton = new NewButton();
         this.wuXingZhiRenButton.label = LanResManager.getLanCommonTextWords("五行之刃");
         this.wuXingZhiRenButton.width = 80;
         this.wuXingZhiRenButton.height = 20;
         this.wuXingZhiRenButton.align = "center";
         this.wuXingZhiRenButton.y = 60;
         this.wuXingZhiRenButton.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("人物达到70级，则可以修炼五行之刃") + "</font>";
         this.wuXingZhiRenObj = new Object();
         this.wuXingZhiRenObj.neirong = this.wuXingZhiRen;
         this.wuXingZhiRenObj.biaoqian = this.wuXingZhiRenButton;
         this.wuXingZhiRenObj.name = "4";
         this.wuXingZhiRenObj.isShow = true;
         this.wuXingZhiRenObj.dengji = 70;
         this.chibang = new ChiBang();
         this.chibang.setParent = this;
         this.chibang.x = 90;
         this.chibang.y = 22;
         this.chibangButton = new NewButton();
         this.chibangButton.label = LanResManager.getLanCommonTextWords("天使之翼");
         this.chibangButton.width = 80;
         this.chibangButton.height = 20;
         this.chibangButton.align = "center";
         this.chibangButton.y = 60;
         this.tengtianyi = new TengtianyiPanel();
         this.tengtianyi.setParent = this;
         this.tengtianyi.x = 90;
         this.tengtianyi.y = 22;
         this.tengtianyiButton = new NewButton();
         this.tengtianyiButton.label = LanResManager.getLanCommonTextWords("腾天翼");
         this.tengtianyiButton.width = 80;
         this.tengtianyiButton.height = 20;
         this.tengtianyiButton.align = "center";
         this.tengtianyiButton.y = 60;
         this.emozhiyi = new EMoZhiYi();
         this.emozhiyi.setParent = this;
         this.emozhiyi.x = 90;
         this.emozhiyi.y = 22;
         this.emozhiyiButton = new NewButton();
         this.emozhiyiButton.label = LanResManager.getLanCommonTextWords("恶魔之翼");
         this.emozhiyiButton.width = 80;
         this.emozhiyiButton.height = 20;
         this.emozhiyiButton.align = "center";
         this.emozhiyiButton.y = 60;
         this.molingzhiyi = new MoLingZhiYi();
         this.molingzhiyi.setParent = this;
         this.molingzhiyi.x = 90;
         this.molingzhiyi.y = 22;
         this.molingzhiyiButton = new NewButton();
         this.molingzhiyiButton.label = LanResManager.getLanCommonTextWords("魔灵之翼");
         this.molingzhiyiButton.width = 80;
         this.molingzhiyiButton.height = 20;
         this.molingzhiyiButton.align = "center";
         this.molingzhiyiButton.y = 60;
         this.ganjiangmoye = new GanJiangMoYe();
         this.ganjiangmoye._$parent = this;
         this.ganjiangmoye.x = 90;
         this.ganjiangmoye.y = 22;
         this.ganjiangmoyeButton = new NewButton();
         this.ganjiangmoyeButton.label = LanResManager.getLanCommonTextWords("干将莫邪");
         this.ganjiangmoyeButton.width = 80;
         this.ganjiangmoyeButton.height = 20;
         this.ganjiangmoyeButton.align = "center";
         this.huyijuexing = new HuyiJuexing();
         this.huyijuexing.setParent = this;
         this.huyijuexing.x = 90;
         this.huyijuexing.y = 22;
         this.huyijuexingButton = new NewButton();
         this.huyijuexingButton.label = LanResManager.getLanCommonTextWords("虎翼觉醒");
         this.huyijuexingButton.width = 80;
         this.huyijuexingButton.height = 20;
         this.huyijuexingButton.align = "center";
         this.longyajuexing = new LongYaJueXing();
         this.longyajuexing.setParent = this;
         this.longyajuexing.x = 90;
         this.longyajuexing.y = 22;
         this.longyajuexingButton = new NewButton();
         this.longyajuexingButton.label = LanResManager.getLanCommonTextWords("龙牙觉醒");
         this.longyajuexingButton.width = 80;
         this.longyajuexingButton.height = 20;
         this.longyajuexingButton.align = "center";
         this.quanshenjuexing = new QuanShenJueXing();
         this.quanshenjuexing.setParent = this;
         this.quanshenjuexing.x = 90;
         this.quanshenjuexing.y = 22;
         this.quanshenjuexingButton = new NewButton();
         this.quanshenjuexingButton.label = LanResManager.getLanCommonTextWords("犬神觉醒");
         this.quanshenjuexingButton.width = 80;
         this.quanshenjuexingButton.height = 20;
         this.quanshenjuexingButton.align = "center";
         this.longyinjuexing = new LongYinJueXing();
         this.longyinjuexing.setParent = this;
         this.longyinjuexing.x = 90;
         this.longyinjuexing.y = 22;
         this.longyinjuexingButton = new NewButton();
         this.longyinjuexingButton.label = LanResManager.getLanCommonTextWords("龙吟觉醒");
         this.longyinjuexingButton.width = 80;
         this.longyinjuexingButton.height = 20;
         this.longyinjuexingButton.align = "center";
         this.liekongjuexing = new LieKongJueXing();
         this.liekongjuexing.setParent = this;
         this.liekongjuexing.x = 90;
         this.liekongjuexing.y = 22;
         this.liekongjuexingButton = new NewButton();
         this.liekongjuexingButton.label = LanResManager.getLanCommonTextWords("裂空觉醒");
         this.liekongjuexingButton.width = 80;
         this.liekongjuexingButton.height = 20;
         this.liekongjuexingButton.align = "center";
         this.aojianshenjiangji = new AoJianShenJiangJi();
         this.aojianshenjiangji.setParent = this;
         this.aojianshenjiangji.visible = false;
         this.aojianshenjiangji.x = 90;
         this.aojianshenjiangji.y = 22;
         this.aojianshenjiangjiButton = new NewButton();
         this.aojianshenjiangjiButton.label = LanResManager.getLanCommonTextWords("傲剑神将技");
         this.aojianshenjiangjiButton.width = 80;
         this.aojianshenjiangjiButton.height = 20;
         this.aojianshenjiangjiButton.align = "center";
         this.xueyinjuexing = new XueYinJueXing();
         this.xueyinjuexing.setParent = this;
         this.xueyinjuexing.x = 90;
         this.xueyinjuexing.y = 22;
         this.xueyinjuexingButton = new NewButton();
         this.xueyinjuexingButton.label = LanResManager.getLanCommonTextWords("血饮觉醒");
         this.xueyinjuexingButton.width = 80;
         this.xueyinjuexingButton.height = 20;
         this.xueyinjuexingButton.align = "center";
         this.langhundun = new LangHunDun();
         this.langhundun.setParent = this;
         this.langhundun.x = 90;
         this.langhundun.y = 22;
         this.langhundunButton = new NewButton();
         this.langhundunButton.label = LanResManager.getLanCommonTextWords("狼魂盾");
         this.langhundunButton.width = 80;
         this.langhundunButton.height = 20;
         this.langhundunButton.align = "center";
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
         addChildAt(this.qimenzhen,0);
         this.qimenzhen.x = 90;
         this.qimenzhen.y = 22;
         this.qimenzhenButton = new NewButton();
         this.qimenzhenButton.label = LanResManager.getLanCommonTextWords("奇门阵");
         this.qimenzhenButton.width = 80;
         this.qimenzhenButton.height = 20;
         this.qimenzhenButton.align = "center";
         this.LeftButtonContainer4.addChild(this.qimenzhenButton);
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
         addChild(this.siLingZhen);
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
         this.objBeiDouQiXing = new DataObject(this.beidouqixing,this.beidouqixingButton,"6",true,-1);
         this.jinchantuoqiao = new JinChanTuoQiao();
         this.jinchantuoqiao.setParent = this;
         this.jinchantuoqiao.x = 90;
         this.jinchantuoqiao.y = 22;
         this.jinchantuoqiaoButton = new NewButton();
         this.jinchantuoqiaoButton.label = LanResManager.getLanCommonTextWords("金蝉脱壳");
         this.jinchantuoqiaoButton.width = 80;
         this.jinchantuoqiaoButton.height = 20;
         this.jinchantuoqiaoButton.align = "center";
         this.objJinChanTuoQiao = new DataObject(this.jinchantuoqiao,this.jinchantuoqiaoButton,"19",true,-1);
         this.jiuquhuanghezhen = new JiuQuHuangHeZhen();
         this.jiuquhuanghezhen.setParent = this;
         this.jiuquhuanghezhen.x = 90;
         this.jiuquhuanghezhen.y = 22;
         this.jiuquhuangheButton = new NewButton();
         this.jiuquhuangheButton.label = LanResManager.getLanCommonTextWords("九曲黄河阵");
         this.jiuquhuangheButton.width = 80;
         this.jiuquhuangheButton.height = 20;
         this.jiuquhuangheButton.align = "center";
         this.objJiuQuHuangHeZhen = new DataObject(this.jiuquhuanghezhen,this.jiuquhuangheButton,"7");
         this.zhenwuqijiezhen = new ZhenWuQiJieZhen();
         this.zhenwuqijiezhen.setParent = this;
         this.zhenwuqijiezhen.x = 90;
         this.zhenwuqijiezhen.y = 22;
         this.zhenwuqijiezhenButton = new NewButton();
         this.zhenwuqijiezhenButton.label = LanResManager.getLanCommonTextWords("真武七截阵");
         this.zhenwuqijiezhenButton.width = 80;
         this.zhenwuqijiezhenButton.height = 20;
         this.zhenwuqijiezhenButton.align = "center";
         this.objZhenWuQiJieZhen = new DataObject(this.zhenwuqijiezhen,this.zhenwuqijiezhenButton,"8");
         this.douzhuanxingyi = new DouZhuanXingYi();
         this.douzhuanxingyi.setParent = this;
         this.douzhuanxingyi.x = 90;
         this.douzhuanxingyi.y = 22;
         this.douzhuanxingyiButton = new NewButton();
         this.douzhuanxingyiButton.label = LanResManager.getLanCommonTextWords("斗转星移");
         this.douzhuanxingyiButton.width = 80;
         this.douzhuanxingyiButton.height = 20;
         this.douzhuanxingyiButton.align = "center";
         this.objDouZhuanXingYi = new DataObject(this.douzhuanxingyi,this.douzhuanxingyiButton,"20");
         this.guiliuzhen = new GuiLiuZhen();
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
         this.jingangfumoquan.visible = false;
         this.jingangfumoquanButton = new NewButton();
         this.jingangfumoquanButton.label = LanResManager.getLanCommonTextWords("金刚伏魔圈");
         this.jingangfumoquanButton.width = 80;
         this.jingangfumoquanButton.height = 20;
         this.jingangfumoquanButton.align = "center";
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
         this.tianmenzhen = new TianMenZhen();
         this.tianmenzhen.setParent = this;
         this.tianmenzhen.x = 90;
         this.tianmenzhen.y = 22;
         this.tianmenzhenButton = new NewButton();
         this.tianmenzhenButton.label = LanResManager.getLanCommonTextWords("天门阵");
         this.tianmenzhenButton.width = 80;
         this.tianmenzhenButton.height = 20;
         this.tianmenzhenButton.align = "center";
         this.bihaichaoshengqu = new BiHaiChaoShengQu();
         this.bihaichaoshengqu.setParent = this;
         this.bihaichaoshengqu.x = 90;
         this.bihaichaoshengqu.y = 22;
         this.bihaichaoshengquButton = new NewButton();
         this.bihaichaoshengquButton.label = LanResManager.getLanCommonTextWords("碧海潮生曲");
         this.bihaichaoshengquButton.width = 80;
         this.bihaichaoshengquButton.height = 20;
         this.bihaichaoshengquButton.align = "center";
         this.heyizhen = new HeYiZhen();
         this.heyizhen.setParent = this;
         this.heyizhen.x = 90;
         this.heyizhen.y = 22;
         this.heyizhenButton = new NewButton();
         this.heyizhenButton.label = LanResManager.getLanCommonTextWords("鹤翼阵");
         this.heyizhenButton.width = 80;
         this.heyizhenButton.height = 20;
         this.heyizhenButton.align = "center";
         this.yuxiaojianfa = new YuXiaoJianFa();
         this.yuxiaojianfa.setParent = this;
         this.yuxiaojianfa.x = 90;
         this.yuxiaojianfa.y = 22;
         this.yuxiaojianfaButton = new NewButton();
         this.yuxiaojianfaButton.label = LanResManager.getLanCommonTextWords("玉箫剑法");
         this.yuxiaojianfaButton.width = 80;
         this.yuxiaojianfaButton.height = 20;
         this.yuxiaojianfaButton.align = "center";
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
         TianFuZhenController.instance.setup(this,this._tianFuZhenPanel);
         this._niaoXiangZhenPanel = new NiaoXiangZhen();
         this._niaoXiangZhenPanel.setParent = this;
         this._niaoXiangZhenPanel.x = 90;
         this._niaoXiangZhenPanel.y = 22;
         this._niaoXiangZhenBtn = new NewButton();
         this._niaoXiangZhenBtn.label = LanResManager.getLanCommonTextWords("鸟翔阵");
         this._niaoXiangZhenBtn.width = 80;
         this._niaoXiangZhenBtn.height = 20;
         this._niaoXiangZhenBtn.align = "center";
         NiaoXiangZhenController.instance.setup(this,this._niaoXiangZhenPanel);
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
         this.shenxingbaibian = new ShenXingBaiBian();
         this.shenxingbaibian.setParent = this;
         this.shenxingbaibian.x = 90;
         this.shenxingbaibian.y = 22;
         this.shenxingbaibianButton = new NewButton();
         this.shenxingbaibianButton.label = LanResManager.getLanCommonTextWords("神行百变");
         this.shenxingbaibianButton.width = 80;
         this.shenxingbaibianButton.height = 20;
         this.shenxingbaibianButton.align = "center";
         this.luoyingshenjianzhang = new LuoYingShenJianZhang();
         this.luoyingshenjianzhang.setParent = this;
         this.luoyingshenjianzhang.x = 90;
         this.luoyingshenjianzhang.y = 22;
         this.luoyingshenjianzhangButton = new NewButton();
         this.luoyingshenjianzhangButton.label = LanResManager.getLanCommonTextWords("落英神剑掌");
         this.luoyingshenjianzhangButton.width = 80;
         this.luoyingshenjianzhangButton.height = 20;
         this.luoyingshenjianzhangButton.align = "center";
         this.bazhentu = new BaZhenTu();
         this.bazhentu.setParent = this;
         this.bazhentu.x = 90;
         this.bazhentu.y = 22;
         this.bazhentuButton = new NewButton();
         this.bazhentuButton.label = LanResManager.getLanCommonTextWords("八阵图");
         this.bazhentuButton.width = 80;
         this.bazhentuButton.height = 20;
         this.bazhentuButton.align = "center";
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
         this.shengsifu = new ShengSiFu();
         this.shengsifu.setParent = this;
         this.shengsifu.x = 90;
         this.shengsifu.y = 22;
         this.shengsifuButton = new NewButton();
         this.shengsifuButton.label = LanResManager.getLanCommonTextWords("生死符");
         this.shengsifuButton.width = 80;
         this.shengsifuButton.height = 20;
         this.shengsifuButton.align = "center";
         this.taohuazhen = new TaoHuaZhen();
         this.taohuazhen.setParent = this;
         this.taohuazhen.x = 90;
         this.taohuazhen.y = 22;
         this.taohuazhenButton = new NewButton();
         this.taohuazhenButton.label = LanResManager.getLanCommonTextWords("桃花阵");
         this.taohuazhenButton.width = 80;
         this.taohuazhenButton.height = 20;
         this.taohuazhenButton.align = "center";
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
         this.addChild(this.LeftButtonContainer2);
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
         this._tushidahuiPanel = new Tushidahui();
         this._tushidahuiPanel.setParent = this;
         this._tushidahuiPanel.x = 90;
         this._tushidahuiPanel.y = 22;
         this._tushidahuiBtn = new NewButton();
         this._tushidahuiBtn.label = LanResManager.getLanCommonTextWords("屠狮大会");
         this._tushidahuiBtn.width = 80;
         this._tushidahuiBtn.height = 20;
         this._tushidahuiBtn.align = "center";
         TushidahuiController.instance.setup(this,this._tushidahuiPanel);
         this.duguqiubai = new DuGuQiuBai();
         this.duguqiubai.setParent = this;
         this.duguqiubai.x = 90;
         this.duguqiubai.y = 22;
         this.duguqiubaiButton = new NewButton();
         this.duguqiubaiButton.label = LanResManager.getLanCommonTextWords("独孤求败");
         this.duguqiubaiButton.width = 80;
         this.duguqiubaiButton.height = 20;
         this.duguqiubaiButton.align = "center";
         this.xiakexing = new XiaKeXing();
         this.xiakexing.setParent = this;
         this.xiakexing.x = 90;
         this.xiakexing.y = 22;
         this.xiakexingButton = new NewButton();
         this.xiakexingButton.label = LanResManager.getLanCommonTextWords("侠客行");
         this.xiakexingButton.width = 80;
         this.xiakexingButton.height = 20;
         this.xiakexingButton.align = "center";
         this.huashanlunjian = new Huashanlunjian();
         this.huashanlunjian.setParent = this;
         this.huashanlunjian.x = 90;
         this.huashanlunjian.y = 22;
         this.huashanlunjianButton = new NewButton();
         this.huashanlunjianButton.label = LanResManager.getLanCommonTextWords("华山论剑");
         this.huashanlunjianButton.width = 80;
         this.huashanlunjianButton.height = 20;
         this.huashanlunjianButton.align = "center";
         this.addChild(this.LeftButtonContainer5);
         this.LeftButtonContainer6 = new Sprite();
         this.LeftButtonContainer6.x = 10;
         this.LeftButtonContainer6.y = 25;
         this.addChild(this.LeftButtonContainer6);
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
         this.LeftButtonContainer6 = new Sprite();
         this.LeftButtonContainer6.x = 10;
         this.LeftButtonContainer6.y = 25;
         this.addChildAt(this.LeftButtonContainer6,0);
         this.woDeMenPai = new WoDeMenPai();
         this.woDeMenPai.setParent = this;
         this.woDeMenPai.x = 10;
         this.woDeMenPai.y = 22;
         this.woDeMenPaiButton = new NewButton();
         this.woDeMenPaiButton.label = LanResManager.getLanCommonTextWords("门派");
         this.woDeMenPaiButton.width = 80;
         this.woDeMenPaiButton.height = 20;
         this.woDeMenPaiButton.align = "center";
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
         addChildAt(this.woDeMenPai,1);
         this.LeftButtonContainer7 = new Sprite();
         this.LeftButtonContainer7.x = 10;
         this.LeftButtonContainer7.y = 25;
         this.addChild(this.LeftButtonContainer7);
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
         _loc1_.isShow = false;
         _loc1_.dengji = 0;
         this.btnArray7.push(_loc1_);
         this.addChildAt(this.LeftButtonContainer7,0);
         addChildAt(this.woderongyu,1);
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
         this.preBtn5.y = 352;
         this.preBtn5.x = 18;
         this.preBtn5.addEventListener(MouseEvent.CLICK,this.onPreNextClick);
         this.LeftButtonContainer5.addChild(this.preBtn5);
         this.nextBtn5 = new FSimpleButton();
         this.nextBtn5.skin = "mainPanelDownBtn";
         this.nextBtn5.y = 352;
         this.nextBtn5.x = this.preBtn5.x + this.preBtn5.width + 5;
         this.nextBtn5.addEventListener(MouseEvent.CLICK,this.onPreNextClick);
         this.LeftButtonContainer5.addChild(this.nextBtn5);
         this.preBtn6 = new FSimpleButton();
         this.preBtn6.skin = "mainPanelUpBtn";
         this.preBtn6.y = 352;
         this.preBtn6.x = 18;
         this.preBtn6.addEventListener(MouseEvent.CLICK,this.onPreNextClick);
         this.LeftButtonContainer6.addChild(this.preBtn6);
         this.nextBtn6 = new FSimpleButton();
         this.nextBtn6.skin = "mainPanelDownBtn";
         this.nextBtn6.y = 352;
         this.nextBtn6.x = this.preBtn6.x + this.preBtn6.width + 5;
         this.nextBtn6.addEventListener(MouseEvent.CLICK,this.onPreNextClick);
         this.LeftButtonContainer6.addChild(this.nextBtn6);
         this.preBtn7 = new FSimpleButton();
         this.preBtn7.skin = "mainPanelUpBtn";
         this.preBtn7.y = 352;
         this.preBtn7.x = 18;
         this.preBtn7.addEventListener(MouseEvent.CLICK,this.onPreNextClick);
         this.LeftButtonContainer7.addChild(this.preBtn7);
         this.nextBtn7 = new FSimpleButton();
         this.nextBtn7.skin = "mainPanelDownBtn";
         this.nextBtn7.y = 352;
         this.nextBtn7.x = this.preBtn7.x + this.preBtn7.width + 5;
         this.nextBtn7.addEventListener(MouseEvent.CLICK,this.onPreNextClick);
         this.xiangyangzhizhan = new XiangYangZhiZhan();
         this.xiangyangzhizhan.setParent = this;
         this.xiangyangzhizhan.x = 90;
         this.xiangyangzhizhan.y = 22;
         this.xiangyangzhizhanButton = new NewButton();
         this.xiangyangzhizhanButton.label = LanResManager.getLanCommonTextWords("襄阳之战");
         this.xiangyangzhizhanButton.width = 80;
         this.xiangyangzhizhanButton.height = 20;
         this.xiangyangzhizhanButton.align = "center";
         this.LeftButtonContainer7.addChild(this.nextBtn7);
         _loc2_ = new Vector.<Bitmap>();
         _loc2_.push(this.charContainer.bgImg);
         _loc2_.push(this.venationContainer.bgImg1);
         _loc2_.push(this.smithingbodyContainer.bgImg);
         _loc2_.push(this.dantian.bgImg);
         _loc2_.push(this.dugujiujian.bgImg);
         _loc2_.push(this.anqiContainer.img);
         _loc2_.push(this.dongxiao.img);
         _loc2_.push(this.bagua.bgImg);
         _loc2_.push(this.jiuyang.bgImg);
         _loc2_.push(this.bitmap);
         _loc2_.push(this.xiangLongShiBaZahang.bgImg);
         _loc2_.push(this.yiJinJing.bg);
         _loc2_.push(this.xisuijing.bg);
         _loc2_.push(this.yuncheng.bgImg);
         _loc2_.push(this.wulizhi.bgImg);
         _loc2_.push(this.liumaishenjian.bgImg);
         _loc2_.push(this.wuXingZhiRen.bgImg);
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
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("龙纹刻画"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("门派"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("越南屠龙刀"),this.onTabClick);
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
         this.jinSheJianFaButton.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("金蛇剑法") + "</font>";
         this.menpaijuexue = new MenPaiJueXue();
         this.menpaijuexueButton = new NewButton();
         this.menpaijuexueButton.label = "门派绝学";
         this.menpaijuexueButton.width = 80;
         this.menpaijuexueButton.height = 20;
         this.menpaijuexueButton.align = "center";
         this.menpaineifa = new MenPaiNeiFa();
         this.menpaineifaButton = new NewButton();
         this.menpaineifaButton.label = "门派内法";
         this.menpaineifaButton.width = 80;
         this.menpaineifaButton.height = 20;
         this.menpaineifaButton.align = "center";
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
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("角色"):
               dispatchEvent(new Event(GETCHARATTRIBUTE));
               this.showBtnByPage(1,0,false);
               this.bitmap.visible = true;
               this.lb = 1;
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
               this.showBtnByPage(2,0,false);
               this.bitmap.visible = true;
               this.lb = 2;
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
               this.showBtnByPage(3,0,false);
               this.bitmap.visible = true;
               this.lb = 3;
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
               this.showBtnByPage(4,0,false);
               this.bitmap.visible = true;
               this.lb = 4;
               break;
            case LanResManager.getLanCommonTextWords("传奇"):
               if(this.btnArray5.length)
               {
                  dispatchEvent(new Event(this.btnArray5[0].eventType));
               }
               else
               {
                  dispatchEvent(new Event(JUEZHANGUANGMINGDING));
               }
               this.showBtnByPage(5,0,false);
               this.bitmap.visible = true;
               this.lb = 5;
               break;
            case LanResManager.getLanCommonTextWords("藏宝阁"):
               PipeManager.sendMsg(PipeConstants.SHOW_XUNZHANG_PANEL,-1);
               this.setTabBar(this.lb);
               return;
            case LanResManager.getLanCommonTextWords("侍从"):
               PipeManager.sendMsg(PipeConstants.SHOW_MEIREN_PANEL,-1);
               this.setTabBar(this.lb);
               return;
            case LanResManager.getLanCommonTextWords("龙纹刻画"):
               PipeManager.sendMsg(PipeConstants.SHOW_LONGWENKEHUA_PANEL,-1);
               this.setTabBar(this.lb);
               break;
            case LanResManager.getLanCommonTextWords("我的荣誉"):
               dispatchEvent(new Event(WODERONGYU));
               this.showBtnByPage(7,0,false);
               this.LeftButtonContainer7.visible = false;
               this.lb = 7;
               break;
            case LanResManager.getLanCommonTextWords("门派"):
               dispatchEvent(new Event(WODEMENPAI));
               this.showBtnByPage(6,0,false);
               this.LeftButtonContainer6.visible = false;
               this.lb = 6;
               this.setTabBar(this.lb);
               break;
            case "龙武阁":
               PipeManager.sendMsg(PipeConstants.YN_REQUEST_LONGWUGE,-1);
               this.setTabBar(this.lb);
               return;
            case LanResManager.getLanCommonTextWords("越南屠龙刀"):
               this.setTabBar(this.lb);
               return;
         }
         this.dispatchAllCloseMiniPanel();
      }
      
      public function requestShowShiCong() : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_MEIREN_PANEL,-1);
      }
      
      public function requestShowFabao() : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_FABAOPANEL);
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
      
      public function onButtonClick(param1:MouseEvent = null, param2:String = "") : void
      {
         var _loc3_:String = null;
         _loc3_ = "";
         if(param1 == null && param2 != "")
         {
            _loc3_ = param2;
         }
         else
         {
            _loc3_ = (param1.target as NewButton).label;
         }
         this.smithingbodyContainer.hidePuTiDanTipCanvas();
         this.closeQiHaiPanel();
         this.onShowLvB(false);
         this.dispatchAllCloseMiniPanel();
         switch(_loc3_)
         {
            case LanResManager.getLanCommonTextWords("基础"):
               dispatchEvent(new Event(GETCHARATTRIBUTE));
               break;
            case LanResManager.getLanCommonTextWords("经脉"):
               dispatchEvent(new Event(GETVENATION));
               break;
            case LanResManager.getLanCommonTextWords("肉身"):
               dispatchEvent(new Event(GETDUANZAOROUSHEN));
               break;
            case LanResManager.getLanCommonTextWords("丹田"):
               dispatchEvent(new Event(GETDANTIAN));
               break;
            case LanResManager.getLanTextWords(this,"境界"):
               dispatchEvent(new Event(GETJINGJIE));
               break;
            case LanResManager.getLanCommonTextWords("运程"):
               this.loadSetMc();
               dispatchEvent(new Event(GETYUNCHENG));
               break;
            case LanResManager.getLanCommonTextWords("勋章"):
               dispatchEvent(new Event(GETWULIZHI));
               break;
            case LanResManager.getLanCommonTextWords("独孤九剑"):
               dispatchEvent(new Event(DUGUJIUJIAN));
               break;
            case LanResManager.getLanCommonTextWords("八卦掌"):
               dispatchEvent(new Event(GETDUANZAOROUSHENB));
               break;
            case LanResManager.getLanCommonTextWords("九阳神功"):
               dispatchEvent(new Event(DUGUJIUJIANJ));
               break;
            case LanResManager.getLanCommonTextWords("降龙十八掌"):
               dispatchEvent(new Event(XIANGLONGSHIBAZHANG_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("易筋经"):
               dispatchEvent(new Event(GETYIJINJING));
               break;
            case LanResManager.getLanCommonTextWords("洗髓经"):
               dispatchEvent(new Event(GETYIJINJING_X));
               break;
            case LanResManager.getLanCommonTextWords("飞龙探云手"):
               dispatchEvent(new Event(FEILONGTANYUNSHOU));
               break;
            case LanResManager.getLanCommonTextWords("九阴真经"):
               dispatchEvent(new Event(JIUYINZHENJING));
               break;
            case LanResManager.getLanCommonTextWords("五形拳"):
               dispatchEvent(new Event(WUXINGQUAN));
               break;
            case LanResManager.getLanCommonTextWords("十八铜人阵"):
               dispatchEvent(new Event(SHIBATONGREN));
               break;
            case LanResManager.getLanCommonTextWords("六脉神剑"):
               dispatchEvent(new Event(LIUMAISHENJIAN));
               break;
            case LanResManager.getLanCommonTextWords("金钟罩"):
               dispatchEvent(new Event(JINZHONGZHAO));
               break;
            case LanResManager.getLanCommonTextWords("暗器"):
               dispatchEvent(new Event(GETANQI));
               break;
            case LanResManager.getLanCommonTextWords("弓箭"):
               dispatchEvent(new Event(GETGONGJIAN));
               break;
            case LanResManager.getLanCommonTextWords("洞箫"):
               dispatchEvent(new Event(DONGXIAO));
               break;
            case LanResManager.getLanCommonTextWords("九阳"):
               this.showDugujiujianJ();
               dispatchEvent(new Event(DUGUJIUJIANJ));
               break;
            case LanResManager.getLanTextWords(this,"成就"):
               dispatchEvent(new Event(GETACCOMPLISHMENT));
               break;
            case LanResManager.getLanTextWords(this,"个人资料"):
               this.showPlayerInfo();
               break;
            case LanResManager.getLanCommonTextWords("战旗"):
               dispatchEvent(new Event(GETZHANQI));
               break;
            case LanResManager.getLanCommonTextWords("战魂"):
               dispatchEvent(new Event(GETZHANHUN));
               break;
            case LanResManager.getLanCommonTextWords("五行之刃"):
               dispatchEvent(new Event(WUXINGZHIREN));
               break;
            case LanResManager.getLanCommonTextWords("修行"):
               dispatchEvent(new Event(GETXIUWEI));
               break;
            case LanResManager.getLanCommonTextWords("太玄神功"):
               dispatchEvent(new Event(GETTAIXUANSHENGONG));
               break;
            case LanResManager.getLanCommonTextWords("北冥神功"):
               dispatchEvent(new Event(GETBEIMINGSHENGONG));
               this.showBeiMingShenGong();
               break;
            case LanResManager.getLanCommonTextWords("四灵阵法"):
               dispatchEvent(new Event(GETSILINGZHEN));
               break;
            case LanResManager.getLanCommonTextWords("神照经"):
               dispatchEvent(new Event(SHENZHAOJING));
               break;
            case LanResManager.getLanCommonTextWords("七伤拳"):
               dispatchEvent(new Event(GETQISHANGQUAN));
               break;
            case LanResManager.getLanCommonTextWords("紫霞神功"):
               dispatchEvent(new Event(GETZIXIASHENGONG));
               break;
            case LanResManager.getLanCommonTextWords("奇门阵"):
               dispatchEvent(new Event(GETQIMENZHEN));
               break;
            case LanResManager.getLanCommonTextWords("蛤蟆功"):
               dispatchEvent(new Event(HAMAGONG));
               break;
            case LanResManager.getLanCommonTextWords("天赋"):
               dispatchEvent(new Event(GETTIANFU));
               break;
            case LanResManager.getLanCommonTextWords("五行阵"):
               dispatchEvent(new Event(GETWUXINGZHEN));
               break;
            case LanResManager.getLanCommonTextWords("赤血魔阵"):
               dispatchEvent(new Event(CHIXUEMOZHEN));
               break;
            case LanResManager.getLanCommonTextWords("擒拿点穴术"):
               dispatchEvent(new Event(SANSHILIUSHOU));
               break;
            case LanResManager.getLanCommonTextWords("北斗七星阵"):
               dispatchEvent(new Event(BEIDOUQIXINGZHEN));
               break;
            case LanResManager.getLanCommonTextWords("金蝉脱壳"):
               dispatchEvent(new Event(JINCHANTUOQIAO));
               break;
            case LanResManager.getLanCommonTextWords("九曲黄河阵"):
               dispatchEvent(new Event(GETJIUQUHUANGHEZHEN));
               break;
            case LanResManager.getLanCommonTextWords("真武七截阵"):
               dispatchEvent(new Event(ZHENWUQIJIEZHEN));
               break;
            case LanResManager.getLanCommonTextWords("斗转星移"):
               dispatchEvent(new Event(DOUZHUANXINGYI));
               break;
            case LanResManager.getLanCommonTextWords("勋章养成"):
               dispatchEvent(new Event(XUNZHANGYANGCHENG));
               break;
            case LanResManager.getLanCommonTextWords("归流阵"):
               dispatchEvent(new Event(GUILIUZHEN));
               break;
            case LanResManager.getLanCommonTextWords("金刚伏魔圈"):
               dispatchEvent(new Event(JINGANGFUMOQUAN));
               break;
            case LanResManager.getLanCommonTextWords("擒龙功"):
               dispatchEvent(new Event(QINLONGGONG));
               break;
            case LanResManager.getLanCommonTextWords("天使之翼"):
               dispatchEvent(new Event(CHIBANG));
               break;
            case LanResManager.getLanCommonTextWords("腾天翼"):
               dispatchEvent(new Event(TENGTIANYI));
               break;
            case LanResManager.getLanCommonTextWords("逍遥御风"):
               dispatchEvent(new Event(XIAOYAOYUFENG));
               break;
            case LanResManager.getLanCommonTextWords("炼气"):
               dispatchEvent(new Event(LIANQI));
               break;
            case LanResManager.getLanCommonTextWords("天门阵"):
               dispatchEvent(new Event(TIANMENZHEN));
               break;
            case LanResManager.getLanCommonTextWords("碧海潮生曲"):
               dispatchEvent(new Event(BIHAICHAOSHENGQU));
               break;
            case LanResManager.getLanCommonTextWords("鹤翼阵"):
               dispatchEvent(new Event(HEYIZHEN));
               break;
            case LanResManager.getLanCommonTextWords("鱼丽阵"):
               dispatchEvent(new Event(YULIZHEN));
               break;
            case LanResManager.getLanCommonTextWords("玉箫剑法"):
               dispatchEvent(new Event(YUXIAOJIANFA));
               this.showYuXiaoJianFa();
               break;
            case LanResManager.getLanCommonTextWords("偃月阵"):
               this.showYanYueZhen();
               dispatchEvent(new Event(YANYUEZHEN));
               break;
            case LanResManager.getLanCommonTextWords("长蛇阵"):
               dispatchEvent(new Event(CHANGSHEZHEN));
               break;
            case LanResManager.getLanCommonTextWords("参合指"):
               dispatchEvent(new Event(CANHEZHI));
               this.showCanHeZhi();
               break;
            case LanResManager.getLanCommonTextWords("恶魔之翼"):
               dispatchEvent(new Event(EMOZHIYI));
               break;
            case LanResManager.getLanCommonTextWords("雁行阵"):
               dispatchEvent(new Event(YANXINGZHEN));
               break;
            case LanResManager.getLanCommonTextWords("玄襄阵"):
               dispatchEvent(new Event(XUANXIANGZHEN));
               break;
            case LanResManager.getLanCommonTextWords("决战光明顶"):
               dispatchEvent(new Event(JUEZHANGUANGMINGDING));
               break;
            case LanResManager.getLanCommonTextWords("干将莫邪"):
               this.showGanJiangMoYe();
               dispatchEvent(new Event(GETGANJIANGMOYE));
               break;
            case LanResManager.getLanCommonTextWords("黄道"):
               dispatchEvent(new Event(REQUEST_YNHUANGDAO));
               break;
            case LanResManager.getLanCommonTextWords("转盘"):
               dispatchEvent(new Event(REQUEST_ZHUANPAN));
               break;
            case LanResManager.getLanCommonTextWords("王者装备"):
               dispatchEvent(new Event(REQUEST_WZZB));
               break;
            case LanResManager.getLanCommonTextWords("飞升装备"):
               dispatchEvent(new Event(REQUEST_FSZB));
               break;
            case LanResManager.getLanCommonTextWords("虎韬阵"):
               dispatchEvent(new Event(HUTAOZHEN));
               break;
            case LanResManager.getLanCommonTextWords("云龙阵"):
               dispatchEvent(new Event(YUNLONGZHEN));
               break;
            case LanResManager.getLanCommonTextWords("先天功"):
               dispatchEvent(new Event(XIANTIANGONG));
               break;
            case LanResManager.getLanCommonTextWords("螃蟹阵"):
               dispatchEvent(new Event(PANGXIEZHEN));
               break;
            case LanResManager.getLanCommonTextWords("血刀心法"):
               dispatchEvent(new Event(XUEDAOXINFA));
               break;
            case LanResManager.getLanCommonTextWords("天覆阵"):
               dispatchEvent(new Event(TianFuZhenConst.TIANFUZHEN));
               break;
            case LanResManager.getLanCommonTextWords("鸟翔阵"):
               dispatchEvent(new Event(NiaoXiangZhenConst.NIAOXIANGZHEN));
               break;
            case LanResManager.getLanCommonTextWords("虎翼觉醒"):
               dispatchEvent(new Event(HUYIJUEXING));
               break;
            case LanResManager.getLanCommonTextWords("屠狮大会"):
               dispatchEvent(new Event(TushidahuiConst.TUSHIDAHUI));
               break;
            case LanResManager.getLanCommonTextWords("地载阵"):
               dispatchEvent(new Event(DIZAIZHEN));
               break;
            case LanResManager.getLanCommonTextWords("风扬阵"):
               dispatchEvent(new Event(FENGYANGZHEN));
               break;
            case LanResManager.getLanCommonTextWords("龙牙觉醒"):
               dispatchEvent(new Event(LONGYAJUEXING));
               break;
            case LanResManager.getLanCommonTextWords("犬神觉醒"):
               dispatchEvent(new Event(QUANSHENJUEXING));
               break;
            case LanResManager.getLanCommonTextWords("五毒阵"):
               dispatchEvent(new Event(WUDUZHEN));
               break;
            case LanResManager.getLanCommonTextWords("龙吟觉醒"):
               dispatchEvent(new Event(LONGYINJUEXING));
               break;
            case LanResManager.getLanCommonTextWords("神行百变"):
               dispatchEvent(new Event(SHENXINGBAIBIAN));
               break;
            case LanResManager.getLanCommonTextWords("狼魂盾"):
               dispatchEvent(new Event(LANGHUNDUN));
               break;
            case LanResManager.getLanCommonTextWords("如来神掌"):
               dispatchEvent(new Event(GETRULAISHENZHANG));
               break;
            case LanResManager.getLanCommonTextWords("落英神剑掌"):
               dispatchEvent(new Event(LUOYINGSHENJIANZHANG));
               break;
            case LanResManager.getLanCommonTextWords("八阵图"):
               dispatchEvent(new Event(BAZHENTU));
               break;
            case LanResManager.getLanCommonTextWords("独孤求败"):
               dispatchEvent(new Event(DUGUQIUBAI));
               break;
            case LanResManager.getLanCommonTextWords("玄铁剑法"):
               dispatchEvent(new Event(XUANTIEJIANFA));
               break;
            case LanResManager.getLanCommonTextWords("长生诀"):
               dispatchEvent(new Event(CHANGSHENGJUE));
               break;
            case LanResManager.getLanCommonTextWords("万魂阵"):
               dispatchEvent(new Event(WANHUNZHEN));
               break;
            case LanResManager.getLanCommonTextWords("门派"):
               dispatchEvent(new Event(WODEMENPAI));
               break;
            case LanResManager.getLanCommonTextWords("传功"):
               dispatchEvent(new Event(WODECHUANGONG));
               break;
            case LanResManager.getLanCommonTextWords("真言手印"):
               dispatchEvent(new Event(ZHENYANSHOUYIN));
               break;
            case LanResManager.getLanCommonTextWords("我的荣誉"):
               dispatchEvent(new Event(WODERONGYU));
               break;
            case LanResManager.getLanCommonTextWords("珍珑棋局"):
               dispatchEvent(new Event(ZHENLONGQIJU));
               break;
            case LanResManager.getLanCommonTextWords("生死符"):
               dispatchEvent(new Event(SHENGSIFU));
               break;
            case LanResManager.getLanCommonTextWords("桃花阵"):
               dispatchEvent(new Event(TAOHUAZHEN));
               break;
            case LanResManager.getLanCommonTextWords("侠客行"):
               dispatchEvent(new Event(XIAKEXING));
               break;
            case LanResManager.getLanCommonTextWords("魔灵之翼"):
               dispatchEvent(new Event(MOLINGZHIYI));
               break;
            case LanResManager.getLanCommonTextWords("伏魔杖法"):
               dispatchEvent(new Event(FUMOZHANGFA));
               break;
            case LanResManager.getLanCommonTextWords("玉女素心剑"):
               dispatchEvent(new Event(YUNVSUXINJIANFA));
               break;
            case LanResManager.getLanCommonTextWords("裂空觉醒"):
               dispatchEvent(new Event(LIEKONGJUEXING));
               break;
            case LanResManager.getLanCommonTextWords("天欲烟梦"):
               dispatchEvent(new Event(TIANYUYANMENG));
               break;
            case LanResManager.getLanCommonTextWords("天山六阳掌"):
               dispatchEvent(new Event(TIANSHANLIUYANGZHANG));
               break;
            case LanResManager.getLanCommonTextWords("傲剑神将技"):
               dispatchEvent(new Event(AOJIANSHENJIANGJI));
               break;
            case LanResManager.getLanCommonTextWords("夺命十三剑"):
               dispatchEvent(new Event(DUOMINGSHISANJIAN));
               break;
            case LanResManager.getLanCommonTextWords("武侠卡牌"):
               PipeManager.sendMsg(PipeConstants.REQUEST_WUXIAKAPAI,-1);
               break;
            case LanResManager.getLanCommonTextWords("日金轮"):
               dispatchEvent(new Event(RIJINLUN));
               break;
            case LanResManager.getLanCommonTextWords("空明拳"):
               dispatchEvent(new Event(KONGMINGQUAN));
               break;
            case LanResManager.getLanCommonTextWords("血饮觉醒"):
               dispatchEvent(new Event(XUEYINJUEXING));
               break;
            case LanResManager.getLanCommonTextWords("华山论剑"):
               dispatchEvent(new Event(HUASHANLUNJIAN));
               break;
            case LanResManager.getLanCommonTextWords("月金轮"):
               dispatchEvent(new Event(YUEJINLUN));
               break;
            case LanResManager.getLanCommonTextWords("寒冰神掌"):
               dispatchEvent(new Event(HANBINGSHENZHANG));
               break;
            case LanResManager.getLanCommonTextWords("灵犀一指"):
               dispatchEvent(new Event(LINGXIYIZHI));
               break;
            case LanResManager.getLanCommonTextWords("藏宝阁"):
               PipeManager.sendMsg(PipeConstants.SHOW_XUNZHANG_PANEL,-1);
               return;
            case "龙武阁":
               PipeManager.sendMsg(PipeConstants.YN_REQUEST_LONGWUGE,-1);
               break;
            case LanResManager.getLanCommonTextWords("六龙装备"):
               dispatchEvent(new Event(LIULONGZHUANGBEI));
               break;
            case LanResManager.getLanCommonTextWords("精灵气旋"):
               dispatchEvent(new Event(JINGLINGQIXUAN));
               break;
            case "Hồn Hoàn":
               dispatchEvent(new Event(GUIHUN));
               break;
            case LanResManager.getLanCommonTextWords("金凤雕"):
               dispatchEvent(new Event(YNJINFENGDIAO));
               break;
            case LanResManager.getLanCommonTextWords("勋章展示"):
               PipeManager.sendMsg(PipeConstants.SHOW_XUNZHANGZHANSHI_PANEL,-1);
               break;
            case LanResManager.getLanCommonTextWords("二十八星宿阵"):
               dispatchEvent(new Event(XINGXIUZHEN));
               break;
            case LanResManager.getLanCommonTextWords("新二十八星宿阵"):
               dispatchEvent(new Event(XINGXIUZHEN1));
               break;
            case LanResManager.getLanCommonTextWords("七杀阵"):
               dispatchEvent(new Event(QISHAZHEN));
               break;
            case LanResManager.getLanCommonTextWords("符文刻画1"):
               dispatchEvent(new Event(FUWENKEHUA));
               break;
            case LanResManager.getLanCommonTextWords("两仪微尘阵"):
               dispatchEvent(new Event(LIANGYIWEICHENZHEN));
               break;
            case LanResManager.getLanCommonTextWords("四绝剑阵"):
               dispatchEvent(new Event(SIJUEJIANZHEN));
               break;
            case LanResManager.getLanCommonTextWords("襄阳之战"):
               dispatchEvent(new Event(XIANGYANGZHIZHAN));
               break;
            case LanResManager.getLanCommonTextWords("惊雷枪"):
               dispatchEvent(new Event(JINGLEIQIANG));
               break;
            case LanResManager.getLanCommonTextWords("明玉功"):
               dispatchEvent(new Event(GETMINGYUGONG));
               break;
            case LanResManager.getLanCommonTextWords("屠龙刀"):
               dispatchEvent(new Event(GETTULONGDAO));
               break;
            case LanResManager.getLanCommonTextWords("金蛇剑法"):
               dispatchEvent(new Event(GETJINSHEJIANFA));
               break;
            case LanResManager.getLanCommonTextWords("粗浅功夫"):
               dispatchEvent(new Event(GETCUQIANKUNGFU));
               break;
            case LanResManager.getLanCommonTextWords("双龙斩"):
               dispatchEvent(new Event(GETQINGDIESHUANGREN));
               break;
            case "门派绝学":
               PipeManager.sendMsg(PipeConstants.SHOW_MENPAIJUEXUE_PANEL);
               break;
            case "门派内法":
               PipeManager.sendMsg(PipeConstants.SHOW_MENPAINEIFA_PANEL);
               break;
            case LanResManager.getLanCommonTextWords("藏剑玄天"):
               dispatchEvent(new Event(GETCANGJIANXUANTIAN));
         }
      }
      
      private function dispatchAllCloseMiniPanel() : void
      {
         this.removeMc();
         if(this.xiangLongShiBaZahang)
         {
            this.xiangLongShiBaZahang.showXiangLongLingWuPanel(false);
         }
         if(this.yiJinJing)
         {
            this.yiJinJing.onShowLv(false);
         }
         if(this.xisuijing)
         {
            this.xisuijing.onShowLv(false);
         }
         if(this.feilongtanyunshou)
         {
            this.feilongtanyunshou.showFeilongtanyunshougLingWuPanel(false);
         }
         if(this.taiXuanShenGong)
         {
            this.taiXuanShenGong.onShowLv(false);
         }
         if(this.jingJie)
         {
            this.onJingJieShowLv(false);
            this.removeJingJieShuoming();
         }
         if(this.shenzhaojing)
         {
            this.shenzhaojing.removeMc();
         }
         if(this.smithingbodyContainer)
         {
            this.smithingbodyContainer.onShowLv(false);
            dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_ZIDONGTISHENG_CLICK,"",false));
         }
         if(this.dantian)
         {
            this.dantian.onShowLv(false);
            dispatchEvent(new BaseEvent(CharAttribute.UI_DANTIAN_ZIDONGTISHENG_CLICK,"",false));
         }
         if(this.bagua)
         {
            this.onShowLvB(false);
            dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_ZIDONGTISHENG_CLICKB,"",false));
         }
         if(this.dugujiujian)
         {
            this.dugujiujian.onShowLv(false);
            dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUJIUJIAN_ZIDONGTISHENG_CLICK,"",true));
         }
         if(this.jiuyang)
         {
            this.jiuyang.onShowLv(false);
            dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUJIUJIAN_ZIDONGTISHENG_CLICKJ,"",true));
         }
         if(this.bow)
         {
            if(this.bowjinjiePanel != null && this.bowjinjiePanel.parent != null)
            {
               dispatchEvent(new BaseEvent(UI_BOWJINJIE_CLOSE_CLICK));
               this.bowjinjiePanel.removeMc();
               this.bowjinjiePanel.parent.removeChild(this.bowjinjiePanel);
            }
            dispatchEvent(new BaseEvent(CharAttribute.UI_BOWJINJIE_ZIDONGJINJIE_CLICK,"",false));
         }
         if(this.dongxiao)
         {
            this.showDongxiaoTupopingjingPanel(false);
            dispatchEvent(new BaseEvent(CharAttribute.UI_DONGXIAOTUPOPINGJING_CLOSE,"",3));
         }
         if(this.anqiContainer)
         {
            if(this.anqitupopingjingPanel != null && this.anqitupopingjingPanel.parent != null)
            {
               this.anqitupopingjingPanel.parent.removeChild(this.anqitupopingjingPanel);
               dispatchEvent(new BaseEvent(UI_ANQITUPOPINGJINGTISHI_GUANBITUPO_CLICK));
            }
            dispatchEvent(new BaseEvent(CharAttribute.UI_ANQIJINJIE_ZIDONGJINJIE_CLICK,"",false));
         }
         if(this.jiuyin)
         {
            this.jiuyin.onShowLv(false);
         }
         if(this.wuxingquan)
         {
            this.wuxingquan.showPanel(false);
         }
         if(this.shibatongren)
         {
            this.shibatongren.hideChuangguanPanel();
         }
         if(this.liumaishenjian)
         {
            this.ShowTupo(false);
         }
         if(this.jinzhongzhao)
         {
            this.jinzhongzhao.showJinZhongZhaoLingWuPanel(false);
            dispatchEvent(new BaseEvent(CharAttribute.JINZHONGZHAO_DENGJITUPO_ZIDONG,"",false));
         }
         if(this.xiuwei)
         {
            this.xiuwei.setBtn(false);
            dispatchEvent(new BaseEvent(CharAttribute.UI_XIUWEI_ZIDONGTISHENG_CLICKJ,"",false));
         }
         if(Fun.isVisible(GameInstance.uiInstance.zhanhundai))
         {
            GameInstance.uiInstance.zhanhundai.parent.removeChild(GameInstance.uiInstance.zhanhundai);
         }
         if(this.beiMingShenGong)
         {
            this.beiMingShenGong.onShowLv(false);
         }
         if(this.shenzhaojing)
         {
            this.shenzhaojing.onShowLv(false);
         }
         if(this.qiShangQuan)
         {
            this.qiShangQuan.setBtn(false);
            dispatchEvent(new BaseEvent(CharAttribute.UI_QISHANGQUAN_ZIDONGTISHENG_CLICKJ,"",false));
            this.removeQiShangQuanShuoming();
         }
         if(this.zixiashengong)
         {
            this.zixiashengong.onShowLv(false);
         }
         if(this.qimenzhen)
         {
            this.qimenzhen.setBtn(false);
            dispatchEvent(new BaseEvent(CharAttribute.UI_QIMENZHEN_ZIDONGTISHENG_CLICKJ,"",false));
            this.removeQiMenZhenShuoming();
         }
         if(this.hamagong)
         {
            this.hamagong.showHaMaGongLingWuPanel(false);
         }
         if(this.wuXingZhen)
         {
            this.wuXingZhen.showShuoMing(false);
            this.wuXingZhen.showTupoPanel(false);
         }
         if(this.chiXueMoZhen)
         {
            this.chiXueMoZhen.showTuPoPanel(false);
            this.chiXueMoZhen.showShuoMing(false);
         }
         if(this.sanShiLiuShou)
         {
            this.sanShiLiuShou.showTuPoPanel(false);
         }
         if(this.beidouqixing)
         {
            this.beidouqixing.showTuPoPanel(false);
         }
         if(this.jinchantuoqiao)
         {
            this.jinchantuoqiao.showTuPoPanel(false);
         }
         if(this.jiuquhuanghezhen)
         {
            this.jiuquhuanghezhen.onShowLv(false);
         }
         if(this.zhenwuqijiezhen)
         {
            this.zhenwuqijiezhen.showTuPoPanel(false);
         }
         if(this.douzhuanxingyi)
         {
            this.douzhuanxingyi.showTuPoPanel(false);
         }
         if(this.guiliuzhen)
         {
            this.guiliuzhen.showTuPoPanel(false);
         }
         if(this.jingangfumoquan)
         {
            this.jingangfumoquan.showTuPoPanel(false);
         }
         if(this.chibang)
         {
            this.chibang.showTuPoPanel(false);
         }
         if(this.tengtianyi)
         {
            this.tengtianyi.showTuPoPanel(false);
         }
         if(this.rijinlun)
         {
            this.rijinlun.showTuPoPanel(false);
         }
         if(this.qinlonggong)
         {
            this.qinlonggong.showTuPoPanel(false);
         }
         if(this.xiaoyaoyufeng)
         {
            this.xiaoyaoyufeng.showTuPoPanel(false);
         }
         if(this.lianqi)
         {
            this.lianqi.showTuPoPanel(false);
         }
         if(this.tianmenzhen)
         {
            this.tianmenzhen.showTuPoPanel(false);
         }
         if(this.bihaichaoshengqu)
         {
            this.bihaichaoshengqu.showTuPoPanel(false);
         }
         if(this.heyizhen)
         {
            this.heyizhen.showTuPoPanel(false);
         }
         if(this.yulizhen)
         {
            this.yulizhen.showTuPoPanel(false);
         }
         if(this.yuxiaojianfa)
         {
            this.yuxiaojianfa.showTuPoPanel(false);
         }
         if(this.yanyuezhen)
         {
            this.yanyuezhen.showTuPoPanel(false);
         }
         if(this.changshezhen)
         {
            this.changshezhen.showTuPoPanel(false);
         }
         if(this.canhezhi)
         {
            this.canhezhi.showTuPoPanel(false);
         }
         if(this.emozhiyi)
         {
            this.emozhiyi.showTuPoPanel(false);
         }
         if(this.yanxingzhen)
         {
            this.yanxingzhen.showTuPoPanel(false);
         }
         if(this.xuanxiangzhen)
         {
            this.xuanxiangzhen.showTuPoPanel(false);
         }
         if(this.ganjiangmoye)
         {
            this.setGuan();
         }
         if(this.hutaozhen)
         {
            this.hutaozhen.showTuPoPanel(false);
         }
         if(this.yunlongzhen)
         {
            this.yunlongzhen.showTuPoPanel(false);
         }
         if(this.xiantiangong)
         {
            this.xiantiangong.showTuPoPanel(false);
         }
         if(this.pangxiezhen)
         {
            this.pangxiezhen.showTuPoPanel(false);
         }
         if(this.xuedaoxinfa)
         {
            this.xuedaoxinfa.showTuPoPanel(false);
         }
         if(this._tianFuZhenPanel)
         {
            this._tianFuZhenPanel.showTuPoPanel(false);
         }
         if(this.huyijuexing)
         {
            this.huyijuexing.showTuPoPanel(false);
         }
         if(this.dizaizhen)
         {
            this.dizaizhen.showTuPoPanel(false);
         }
         if(this.fengyangzhen)
         {
            this.fengyangzhen.showTuPoPanel(false);
         }
         if(this.longyajuexing)
         {
            this.longyajuexing.showTuPoPanel(false);
         }
         if(this.quanshenjuexing)
         {
            this.quanshenjuexing.showTuPoPanel(false);
         }
         if(this.wuduzhen)
         {
            this.wuduzhen.showShuoMing(false);
            this.wuduzhen.showTupoPanel(false);
         }
         if(this.longyinjuexing)
         {
            this.longyinjuexing.showTuPoPanel(false);
         }
         if(this.shenxingbaibian)
         {
            this.shenxingbaibian.showTuPoPanel(false);
         }
         if(this.rulaishenzhang)
         {
            this.rulaishenzhang.onShowLv(false);
         }
         if(this.luoyingshenjianzhang)
         {
            this.luoyingshenjianzhang.showTuPoPanel(false);
         }
         if(this.xuantiejianfa)
         {
            this.xuantiejianfa.showTuPoPanel(false);
         }
         if(this.changshengjue)
         {
            this.changshengjue.showTuPoPanel(false);
         }
         if(this.bazhentu)
         {
            this.bazhentu.showTuPoPanel(false);
         }
         if(this.duguqiubai)
         {
            this.duguqiubai.setTuPoBtn(true);
         }
         if(this.wanhunzhen)
         {
            this.wanhunzhen.showTuPoPanel(false);
         }
         if(this.zhenlongqiju)
         {
            this.zhenlongqiju.showTuPoPanel(false);
         }
         if(this.shengsifu)
         {
            this.shengsifu.showTuPoPanel(false);
         }
         if(this.taohuazhen)
         {
            this.taohuazhen.showTuPoPanel(false);
         }
         if(this.molingzhiyi)
         {
            this.molingzhiyi.showTuPoPanel(false);
         }
         if(this.fumozhangfa)
         {
            this.fumozhangfa.showTuPoPanel(false);
         }
         if(this.yunvsuxinjianfa)
         {
            this.yunvsuxinjianfa.showTuPoPanel(false);
         }
         if(this.liekongjuexing)
         {
            this.liekongjuexing.showTuPoPanel(false);
         }
         if(this.tianyuyanmeng)
         {
            this.tianyuyanmeng.showTuPoPanel(false);
         }
         if(this.tianshanliuyangzhang)
         {
            this.tianshanliuyangzhang.showTuPoPanel(false);
         }
         if(this.duomingshisanjian)
         {
            this.duomingshisanjian.showTuPoPanel(false);
         }
         if(this.kongmingquan)
         {
            this.kongmingquan.showTuPoPanel(false);
         }
         if(this.xueyinjuexing)
         {
            this.xueyinjuexing.showTuPoPanel(false);
         }
         if(this.huashanlunjian)
         {
            this.huashanlunjian.showTupoPanel(false);
         }
         if(this.yuejinlun)
         {
            this.yuejinlun.showTuPoPanel(false);
         }
         if(this.hanbingshenzhang)
         {
            this.hanbingshenzhang.showTuPoPanel(false);
         }
         if(this.lingxiyizhi)
         {
            this.lingxiyizhi.showTuPoPanel(false);
         }
         if(this.xingxiuzhen)
         {
            this.xingxiuzhen.showTuPoPanel(false);
         }
         if(this.xingxiuzhen1)
         {
            this.xingxiuzhen1.showTuPoPanel(false);
         }
         if(this.qishazhen)
         {
            this.qishazhen.showTuPoPanel(false);
         }
         if(this.fuWenKeHua)
         {
            this.fuWenKeHua.showDataPanel(false);
         }
         if(this.liangyiweichenzhen)
         {
            this.liangyiweichenzhen.showTuPoPanel(false);
         }
         if(this.sijuejianzhen)
         {
            this.sijuejianzhen.showTuPoPanel(false);
         }
         if(this.mingyugong)
         {
            this.mingyugong.onShowLv(false);
         }
         if(this.tulongdao)
         {
            this.tulongdao.showTuPoPanel(false);
         }
         if(this.qingdieshuangren)
         {
            this.qingdieshuangren.onShowLv(false);
         }
         if(this.cangjianxuantian)
         {
            this.cangjianxuantian.onShowLv(false);
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         this.closeFun();
      }
      
      private function closeFun() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance.zhanhundai))
         {
            GameInstance.uiInstance.zhanhundai.parent.removeChild(GameInstance.uiInstance.zhanhundai);
         }
         this.removeMc();
         if(this.bowjinjiePanel != null && this.bowjinjiePanel.parent != null)
         {
            dispatchEvent(new BaseEvent(UI_BOWJINJIE_CLOSE_CLICK));
            this.bowjinjiePanel.removeMc();
            this.bowjinjiePanel.parent.removeChild(this.bowjinjiePanel);
         }
         if(this.bagua.smithingbodyadvanceCanvas != null && this.bagua.smithingbodyadvanceCanvas.parent != null)
         {
            dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_ZIDONGTISHENG_CLICKB,"",false));
            this.bagua.smithingbodyadvanceCanvas.parent.removeChild(this.bagua.smithingbodyadvanceCanvas);
         }
         if(this.xiangLongShiBaZahang)
         {
            this.xiangLongShiBaZahang.showXiangLongLingWuPanel(false);
         }
         this.closeQiHaiPanel();
         if(this.yiJinJing)
         {
            this.yiJinJing.onShowLv(false);
         }
         if(this.xisuijing)
         {
            this.xisuijing.onShowLv(false);
         }
         if(this.feilongtanyunshou)
         {
            this.feilongtanyunshou.showFeilongtanyunshougLingWuPanel(false);
         }
         if(this.jingJie)
         {
            this.onJingJieShowLv(false);
            this.removeJingJieShuoming();
         }
         if(this.anqitupopingjingPanel != null && this.anqitupopingjingPanel.parent != null)
         {
            this.anqitupopingjingPanel.parent.removeChild(this.anqitupopingjingPanel);
            dispatchEvent(new BaseEvent(UI_ANQITUPOPINGJINGTISHI_GUANBITUPO_CLICK));
         }
         if(this.taiXuanShenGong)
         {
            this.taiXuanShenGong.onShowLv(false);
         }
         if(this.jiuyin)
         {
            this.jiuyin.onShowLv(false);
         }
         if(this.shibatongren)
         {
            this.shibatongren.hideChuangguanPanel();
         }
         if(this.parent != null)
         {
            dispatchEvent(new BaseEvent(UI_DANTIAN_CLOSE));
            dispatchEvent(new BaseEvent(UI_DUGUJIUJIAN_CLOSE));
            this.parent.removeChild(this);
            this.smithingbodyContainer.hidePuTiDanTipCanvas();
         }
         if(this.liumaishenjian)
         {
            this.ShowTupo(false);
         }
         if(this.xiuwei)
         {
            this.xiuwei.setBtn(false);
         }
         if(this.beiMingShenGong)
         {
            this.beiMingShenGong.onShowLv(false);
         }
         if(this.shenzhaojing)
         {
            this.shenzhaojing.onShowLv(false);
         }
         if(this.qiShangQuan)
         {
            this.removeQiShangQuanShuoming();
         }
         if(this.zixiashengong)
         {
            this.zixiashengong.onShowLv(false);
         }
         if(this.qimenzhen)
         {
            this.removeQiMenZhenShuoming();
         }
         if(this.hamagong)
         {
            this.hamagong.showHaMaGongLingWuPanel(false);
         }
         if(this.wuXingZhen)
         {
            this.wuXingZhen.showTupoPanel(false);
         }
         if(this.chiXueMoZhen)
         {
            this.chiXueMoZhen.showTuPoPanel(false);
            this.chiXueMoZhen.showShuoMing(false);
         }
         if(this.sanShiLiuShou)
         {
            this.sanShiLiuShou.showTuPoPanel(false);
         }
         if(this.beidouqixing)
         {
            this.beidouqixing.showTuPoPanel(false);
         }
         if(this.jinchantuoqiao)
         {
            this.jinchantuoqiao.showTuPoPanel(false);
         }
         if(this.jiuquhuanghezhen)
         {
            this.jiuquhuanghezhen.onShowLv(false);
         }
         if(this.zhenwuqijiezhen)
         {
            this.zhenwuqijiezhen.showTuPoPanel(false);
         }
         if(this.douzhuanxingyi)
         {
            this.douzhuanxingyi.showTuPoPanel(false);
         }
         if(this.guiliuzhen)
         {
            this.guiliuzhen.showTuPoPanel(false);
         }
         if(this.jingangfumoquan)
         {
            this.jingangfumoquan.showTuPoPanel(false);
         }
         if(this.qinlonggong)
         {
            this.qinlonggong.showTuPoPanel(false);
         }
         if(this.chibang)
         {
            this.chibang.showTuPoPanel(false);
         }
         if(this.chibang)
         {
            this.tengtianyi.showTuPoPanel(false);
         }
         if(this.rijinlun)
         {
            this.rijinlun.showTuPoPanel(false);
         }
         if(this.xiaoyaoyufeng)
         {
            this.xiaoyaoyufeng.showTuPoPanel(false);
         }
         if(this.lianqi)
         {
            this.lianqi.showTuPoPanel(false);
         }
         if(this.tianmenzhen)
         {
            this.tianmenzhen.showTuPoPanel(false);
         }
         if(this.bihaichaoshengqu)
         {
            this.bihaichaoshengqu.showTuPoPanel(false);
         }
         if(this.heyizhen)
         {
            this.heyizhen.showTuPoPanel(false);
         }
         if(this.yulizhen)
         {
            this.yulizhen.showTuPoPanel(false);
         }
         if(this.yanyuezhen)
         {
            this.yanyuezhen.showTuPoPanel(false);
         }
         if(this.changshezhen)
         {
            this.changshezhen.showTuPoPanel(false);
         }
         if(this.canhezhi)
         {
            this.canhezhi.showTuPoPanel(false);
         }
         if(this.yuxiaojianfa)
         {
            this.yuxiaojianfa.showTuPoPanel(false);
         }
         if(this.emozhiyi)
         {
            this.emozhiyi.showTuPoPanel(false);
         }
         if(this.yanxingzhen)
         {
            this.yanxingzhen.showTuPoPanel(false);
         }
         if(this.xuanxiangzhen)
         {
            this.xuanxiangzhen.showTuPoPanel(false);
         }
         if(this.ganjiangmoye)
         {
            this.setGuan();
         }
         if(this.hutaozhen)
         {
            this.hutaozhen.showTuPoPanel(false);
         }
         if(this.yunlongzhen)
         {
            this.yunlongzhen.showTuPoPanel(false);
         }
         if(this.xiantiangong)
         {
            this.xiantiangong.showTuPoPanel(false);
         }
         if(this.pangxiezhen)
         {
            this.pangxiezhen.showTuPoPanel(false);
         }
         if(this.xuedaoxinfa)
         {
            this.xuedaoxinfa.showTuPoPanel(false);
         }
         if(this._tianFuZhenPanel)
         {
            this._tianFuZhenPanel.showTuPoPanel(false);
         }
         if(this.huyijuexing)
         {
            this.huyijuexing.showTuPoPanel(false);
         }
         if(this.dizaizhen)
         {
            this.dizaizhen.showTuPoPanel(false);
         }
         if(this.fengyangzhen)
         {
            this.fengyangzhen.showTuPoPanel(false);
         }
         if(this.longyajuexing)
         {
            this.longyajuexing.showTuPoPanel(false);
         }
         if(this.quanshenjuexing)
         {
            this.quanshenjuexing.showTuPoPanel(false);
         }
         if(this.wuduzhen)
         {
            this.wuduzhen.showTupoPanel(false);
         }
         if(this.longyinjuexing)
         {
            this.longyinjuexing.showTuPoPanel(false);
         }
         if(this.shenxingbaibian)
         {
            this.shenxingbaibian.showTuPoPanel(false);
         }
         if(this.rulaishenzhang)
         {
            this.rulaishenzhang.onShowLv(false);
         }
         if(this.luoyingshenjianzhang)
         {
            this.luoyingshenjianzhang.showTuPoPanel(false);
         }
         if(this.bazhentu)
         {
            this.bazhentu.showTuPoPanel(false);
         }
         if(this.duguqiubai)
         {
            this.duguqiubai.setTuPoBtn(true);
         }
         if(this.xuantiejianfa)
         {
            this.xuantiejianfa.showTuPoPanel(false);
         }
         if(this.changshengjue)
         {
            this.changshengjue.showTuPoPanel(false);
         }
         if(this.wanhunzhen)
         {
            this.wanhunzhen.showTuPoPanel(false);
         }
         if(this.zhenyanshouyin)
         {
            this.zhenyanshouyin.setAutoBtn(false);
         }
         if(this.zhenlongqiju)
         {
            this.zhenlongqiju.showTuPoPanel(false);
         }
         if(this.shengsifu)
         {
            this.shengsifu.showTuPoPanel(false);
         }
         if(this.taohuazhen)
         {
            this.taohuazhen.showTuPoPanel(false);
         }
         if(this.molingzhiyi)
         {
            this.molingzhiyi.showTuPoPanel(false);
         }
         if(this.fumozhangfa)
         {
            this.fumozhangfa.showTuPoPanel(false);
         }
         if(this.yunvsuxinjianfa)
         {
            this.yunvsuxinjianfa.showTuPoPanel(false);
         }
         if(this.liekongjuexing)
         {
            this.liekongjuexing.showTuPoPanel(false);
         }
         if(this.tianyuyanmeng)
         {
            this.tianyuyanmeng.showTuPoPanel(false);
         }
         if(this.tianshanliuyangzhang)
         {
            this.tianshanliuyangzhang.showTuPoPanel(false);
         }
         if(this.duomingshisanjian)
         {
            this.duomingshisanjian.showTuPoPanel(false);
         }
         if(this.kongmingquan)
         {
            this.kongmingquan.showTuPoPanel(false);
         }
         if(this.xueyinjuexing)
         {
            this.xueyinjuexing.showTuPoPanel(false);
         }
         if(this.huashanlunjian)
         {
            this.huashanlunjian.showTupoPanel(false);
         }
         if(this.yuejinlun)
         {
            this.yuejinlun.showTuPoPanel(false);
         }
         if(this.hanbingshenzhang)
         {
            this.hanbingshenzhang.showTuPoPanel(false);
         }
         if(this.lingxiyizhi)
         {
            this.lingxiyizhi.showTuPoPanel(false);
         }
         if(this.xingxiuzhen)
         {
            this.xingxiuzhen.showTuPoPanel(false);
         }
         if(this.qishazhen)
         {
            this.qishazhen.showTuPoPanel(false);
         }
         if(this.fuWenKeHua)
         {
            this.fuWenKeHua.showDataPanel(false);
         }
         if(this.liangyiweichenzhen)
         {
            this.liangyiweichenzhen.showTuPoPanel(false);
         }
         if(this.sijuejianzhen)
         {
            this.sijuejianzhen.showTuPoPanel(false);
         }
         if(this.mingyugong)
         {
            this.mingyugong.onShowLv(false);
         }
         this.dispatchAllCloseMiniPanel();
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
               if(param1 != 6 && param1 != 7)
               {
                  this["LeftButtonContainer" + _loc5_].visible = true;
               }
               else
               {
                  this["LeftButtonContainer" + _loc5_].visible = true;
               }
               _loc6_ = 0;
               while(_loc6_ < this["btnArray" + _loc5_].length)
               {
                  if(this["btnArray" + _loc5_][_loc6_].dengji <= GameInstance.mainCharData.attributeInfo.lv && _loc4_)
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
         switch(param1)
         {
            case 1:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("角色"));
               break;
            case 2:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("功法"));
               break;
            case 3:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("兵器"));
               break;
            case 4:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("阵法"));
               break;
            case 5:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("传奇"));
               break;
            case 6:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("门派"));
               break;
            case 7:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("我的荣誉"));
               break;
            case 8:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("法宝"));
         }
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
            if(this["btnArray" + param1][_loc6_].dengji <= GameInstance.mainCharData.attributeInfo.lv)
            {
               _loc5_++;
            }
            if(this["btnArray" + param1][_loc6_].dengji <= GameInstance.mainCharData.attributeInfo.lv && _loc5_ > this["curPage" + param1] * this.MAX_VISIBLE_BTN_COUNT && _loc5_ <= (this["curPage" + param1] + 1) * this.MAX_VISIBLE_BTN_COUNT)
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
      
      public function getShowBiaoqiang(param1:int) : Array
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         this.btnArray1.length;
         this.btnArray2.length;
         this.btnArray3.length;
         this.btnArray4.length;
         _loc2_ = new Array();
         _loc3_ = 1;
         while(_loc3_ <= this.BUTTON_CONTAINER_NUM)
         {
            _loc4_ = 0;
            while(_loc4_ < this["btnArray" + _loc3_].length)
            {
               if(this["btnArray" + _loc3_][_loc4_].dengji == param1)
               {
                  _loc5_ = new Array();
                  _loc5_.push(_loc3_);
                  _loc5_.push(this["btnArray" + _loc3_][_loc4_].name);
                  _loc5_.push(this["btnArray" + _loc3_][_loc4_].biaoqian.label);
                  _loc2_.push(_loc5_);
               }
               _loc4_++;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function setShowBiaoqian(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:NewButton = null;
         var _loc5_:int = 0;
         this["preBtn" + param1].visible = false;
         this["nextBtn" + param1].visible = false;
         _loc3_ = 0;
         _loc5_ = 0;
         _loc5_ = 0;
         while(_loc5_ < this["btnArray" + param1].length)
         {
            if(this["btnArray" + param1][_loc5_].dengji <= GameInstance.mainCharData.attributeInfo.lv)
            {
               _loc3_++;
            }
            if(this["btnArray" + param1][_loc5_].name == String(param2))
            {
               this["btnArray" + param1][_loc5_].biaoqian.visible = true;
               this["btnArray" + param1][_loc5_].biaoqian.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
               _loc4_ = this["btnArray" + param1][_loc5_].biaoqian;
               break;
            }
            _loc5_++;
         }
         this.showBtnByPage(param1,(_loc3_ - 1) / this.MAX_VISIBLE_BTN_COUNT,false);
         if(this.texiaoMc != null && this.texiaoMc.parent != null)
         {
            this.texiaoMc.parent.removeChild(this.texiaoMc);
         }
         this.texiaoMc = StaticValue.getMCByClassName("ui.char.menu.btn.mc") as MovieClip;
         this.texiaoMc.x = _loc4_.x - 5;
         this.texiaoMc.y = _loc4_.y + 7;
         this.texiaoMc.mouseChildren = false;
         this.texiaoMc.mouseEnabled = false;
         addChild(this.texiaoMc);
         this.texiaoMc.gotoAndPlay(1);
         this.setTabBar(param1);
      }
      
      public function getBiaoqianLabel(param1:int, param2:int) : String
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         _loc4_ = 0;
         while(_loc4_ < this["btnArray" + param1].length)
         {
            if(this["btnArray" + param1][_loc4_].name == String(param2))
            {
               _loc3_ = this["btnArray" + param1][_loc4_].biaoqian.label;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getBiaoqianVisible(param1:int, param2:int) : Boolean
      {
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         _loc4_ = 0;
         while(_loc4_ < this["btnArray" + param1].length)
         {
            if(this["btnArray" + param1][_loc4_].name == String(param2))
            {
               _loc3_ = Boolean(this["btnArray" + param1][_loc4_].biaoqian.visible);
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getNeirongVisible(param1:int, param2:int) : Boolean
      {
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         _loc4_ = 0;
         while(_loc4_ < this["btnArray" + param1].length)
         {
            if(this["btnArray" + param1][_loc4_].name == String(param2))
            {
               _loc3_ = Boolean(this["btnArray" + param1][_loc4_].neirong.visible);
            }
            _loc4_++;
         }
         return _loc3_;
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
         else if(param1 == 6)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("门派"));
         }
         else if(param1 == 7)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("我的荣誉"));
         }
      }
      
      public function removeMc() : void
      {
         this.charContainer.hideZanWen();
         this.bow.removeMc();
         this.dantian.removeMc();
         this.dugujiujian.removeMc();
         this.dongxiao.removeMc();
         this.jiuyang.removeMc();
         this.zixiashengong.removeMc();
         this.xiangLongShiBaZahang.removeMc();
         this.feilongtanyunshou.removeMc();
         this.wuXingZhiRen.removeMc();
         this.beiMingShenGong.removeMc();
         this.smithingbodyContainer.removeMc();
         this.chiXueMoZhen.removeMc();
         if(this.siLingZhen)
         {
            this.siLingZhen.closeMC();
         }
         this.charContainer.deleteSlot();
      }
      
      public function initAllBtn() : void
      {
         this.charContainer.hideZanWen();
         this.jichuButton.enabled = true;
         this.jingmaiButton.enabled = true;
         this.roushenButton.enabled = true;
         this.dantianButton.enabled = true;
         this.jingjieButton.enabled = true;
         this.yunchengButton.enabled = true;
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
      
      public function setShowItem(param1:Array) : void
      {
         this.charContainer.setShowItem(param1);
      }
      
      public function showJiaoSelect() : void
      {
         this.charContainer.showJiaoSelect();
      }
      
      public function closeJianSelectSpr() : void
      {
         this.charContainer.closeJianSelectSpr();
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
      
      public function setSkillValue(param1:Number, param2:Number, param3:Number, param4:Number, param5:int, param6:int) : void
      {
         this.charContainer.setSkillValue(param1,param2,param3,param4,param5,param6);
      }
      
      public function setPoint(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         this.charContainer.setPoint(param1,param2,param3,param4,param5);
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
      
      public function showVenation(param1:Array, param2:int, param3:int, param4:Boolean = false, param5:Boolean = false) : void
      {
         this.initCharPanel(1,"2");
         this.venationContainer.setIsZhenLong(param5);
         this.venationContainer.showAll(param1,param2,param3);
         if(param4)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("角色"));
         }
      }
      
      public function requestShowJingMai() : void
      {
         dispatchEvent(new Event(GETVENATION));
      }
      
      public function setJingMaiZhongShang(param1:Array) : void
      {
         this.venationContainer.setZhongShang(param1);
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
      
      public function showImpactPointPanel(param1:String, param2:String, param3:int, param4:Goods, param5:int, param6:int) : void
      {
         if(this.impactPointPanel == null)
         {
            this.impactPointPanel = new ImpactPointPanel();
            this.impactPointPanel.$parent = this;
         }
         this.impactPointPanel.visible = true;
         this.impactPointPanel.reset();
         this.impactPointPanel.setPoint(param1);
         this.impactPointPanel.setPrize(param2);
         this.impactPointPanel.setGasTotal(param3);
         this.impactPointPanel.setItem(param4);
         this.impactPointPanel.setExpandGas(param5);
         this.impactPointPanel.setProbability(param6);
         POPWindowManager.showWindow(this.impactPointPanel);
      }
      
      public function setImpactPointProbability(param1:int) : void
      {
         if(this.impactPointPanel != null)
         {
            this.impactPointPanel.setProbability(param1);
         }
      }
      
      public function setVenationAddValue(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         this.venationContainer.setAddValue(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setVenationExpAddValue(param1:int, param2:Number) : void
      {
         this.venationContainer.setExpAddValue(param1,param2);
      }
      
      public function setIsHuti(param1:Boolean, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:Boolean, param9:Boolean, param10:int) : void
      {
         this.venationContainer.setIsHuti(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
      }
      
      public function isZuoQi(param1:Boolean, param2:Boolean) : void
      {
         this.venationContainer.isZuoQi(param1,param2);
      }
      
      public function setVenationPointAttribute(param1:String, param2:String, param3:int) : void
      {
         this.venationContainer.setPointAttribute(param1,param2,param3);
      }
      
      public function showVenationBreakthroughPanel(param1:Array, param2:Array, param3:Array) : void
      {
         if(!this.breadthroughPanel)
         {
            this.breadthroughPanel = new VenationBreakthroughPanel();
            this.breadthroughPanel.$parent = this;
         }
         this.breadthroughPanel.visible = true;
         this.breadthroughPanel.setZhuLongAaddValue(param1[0],param1[1],param1[2],param1[3],param1[4],param1[5],param1[6]);
         this.breadthroughPanel.setZhenLongAaddValue(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6]);
         this.breadthroughPanel.setItemAndOther(param3[0],param3[1],param3[2],param3[3]);
         GameInstance.uiInstance.uiContainer.addChild(this.breadthroughPanel);
         this.breadthroughPanel.x = (GameConfig.sceneWidth - this.breadthroughPanel.panelWidth) / 2;
         this.breadthroughPanel.y = (GameConfig.sceneHeight - this.breadthroughPanel.panelHeight) / 2;
      }
      
      public function setLongZhu(param1:Goods) : void
      {
         if(this.breadthroughPanel != null)
         {
            this.breadthroughPanel.setItem(param1);
         }
      }
      
      public function hideVenationBreakthroughPanel() : void
      {
         if(Boolean(this.breadthroughPanel) && Boolean(this.breadthroughPanel.parent))
         {
            this.breadthroughPanel.parent.removeChild(this.breadthroughPanel);
         }
      }
      
      public function showZhenLongImpactPanel(param1:String, param2:String, param3:int, param4:Goods, param5:int, param6:int, param7:int) : void
      {
         if(this.zhenLongImpactPanel == null)
         {
            this.zhenLongImpactPanel = new ZhenLongImpactPointPanel();
            this.zhenLongImpactPanel.$parent = this;
         }
         this.zhenLongImpactPanel.visible = true;
         this.zhenLongImpactPanel.setPoint(param1);
         this.zhenLongImpactPanel.setPrize(param2);
         this.zhenLongImpactPanel.setGasTotal(param3);
         this.zhenLongImpactPanel.setItem(param4);
         this.zhenLongImpactPanel.setExpandGas(param5);
         this.zhenLongImpactPanel.setProbability(param6);
         this.zhenLongImpactPanel.setItemCount(param7);
         POPWindowManager.showWindow(this.zhenLongImpactPanel);
      }
      
      public function permitAnQi(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.anqiButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.anqiContainer,0);
            this.anqiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.anqiButton);
            this.btnArray3.push(this.objAnQi);
            this.initCharPanel(3,"1");
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
            _loc2_ = this.btnArray3.indexOf(this.objAnQi);
            if(_loc2_ >= 0)
            {
               this.btnArray3.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showAnqi(param1:Boolean = false) : void
      {
         this.initCharPanel(3,"1");
      }
      
      public function setDangqianInitialize(param1:Array) : void
      {
         this.anqiContainer.setDangqianInitialize(true,param1);
      }
      
      public function requestShowAnQiPanel() : void
      {
         dispatchEvent(new BaseEvent(GETANQI));
      }
      
      public function setAnqiKfSkill(param1:Skill) : void
      {
         this.anqiContainer.setSkill(param1);
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
      
      public function anqiZuoQi(param1:Boolean) : void
      {
         this.anqiContainer.anqiZuoQi(param1);
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
      
      public function setAnqiUse(param1:Boolean) : void
      {
         this.anqiContainer.setAnqiUse(param1);
      }
      
      public function setAnqiXljdTop(param1:String) : void
      {
         this.anqiContainer.setAnqiXljdTop(param1);
      }
      
      public function setAnqiXljdBottom(param1:String) : void
      {
         this.anqiContainer.setAnqiXljdBottom(param1);
      }
      
      public function setAnqiBtnFun(param1:int) : void
      {
         this.anqiContainer.setAnqiBtnFun(param1);
      }
      
      public function setYincangshuxing(param1:Boolean, param2:Boolean, param3:int) : void
      {
         this.anqiContainer.setYincangshuxing(param1,param2,param3);
      }
      
      public function setAnQiZdtsBtnLabel(param1:Boolean) : void
      {
         if(this.anqitupopingjingPanel != null)
         {
            this.anqitupopingjingPanel.setZdtsBtnLabel(param1);
         }
      }
      
      public function showXiuliantisuPanel(param1:Array) : void
      {
         if(!this.xiuliantisuPanel)
         {
            this.xiuliantisuPanel = new XiuliantisuPanel();
            this.xiuliantisuPanel.$parent = this;
         }
         this.xiuliantisuPanel.visible = true;
         this.xiuliantisuPanel.setDangqianInitialize(param1);
         GameInstance.uiInstance.uiContainer.addChild(this.xiuliantisuPanel);
         this.xiuliantisuPanel.x = (GameConfig.sceneWidth - this.xiuliantisuPanel.width) / 2;
         this.xiuliantisuPanel.y = (GameConfig.sceneHeight - this.xiuliantisuPanel.height) / 2;
      }
      
      public function CloseXiuliantisuPanel() : void
      {
         this.xiuliantisuPanel.onCloseFun();
      }
      
      public function showTupopingjingPanel(param1:Boolean, param2:Boolean) : void
      {
         if(!this.anqitupopingjingPanel)
         {
            this.anqitupopingjingPanel = new AnqiTupopingjingPanel();
            this.anqitupopingjingPanel.$parent = this;
         }
         if(param1)
         {
            this.anqitupopingjingPanel.visible = param1;
            if(!param2)
            {
               GameInstance.uiInstance.uiContainer.addChild(this.anqitupopingjingPanel);
               this.anqitupopingjingPanel.x = (GameConfig.sceneWidth - this.anqitupopingjingPanel.width) / 2;
               this.anqitupopingjingPanel.y = (GameConfig.sceneHeight - this.anqitupopingjingPanel.height) / 2;
            }
         }
         else
         {
            this.anqitupopingjingPanel.visible = param1;
            GameInstance.uiInstance.uiContainer.addChild(this.anqitupopingjingPanel);
            this.anqitupopingjingPanel.x = (GameConfig.sceneWidth - this.anqitupopingjingPanel.width) / 2;
            this.anqitupopingjingPanel.y = (GameConfig.sceneHeight - this.anqitupopingjingPanel.height) / 2;
            this.anqitupopingjingPanel.onTishiCloseFun();
         }
      }
      
      public function setTupopingjingInitializeFun(param1:Array) : void
      {
         if(!this.anqitupopingjingPanel)
         {
            this.anqitupopingjingPanel = new AnqiTupopingjingPanel();
            this.anqitupopingjingPanel.$parent = this;
         }
         this.anqitupopingjingPanel.setInitialize(param1);
      }
      
      public function setRTime(param1:int) : void
      {
         if(this.anqitupopingjingPanel)
         {
            this.anqitupopingjingPanel.setRTime(param1);
         }
      }
      
      public function showMubaBtn(param1:Boolean) : void
      {
         if(!this.anqitupopingjingPanel)
         {
            this.anqitupopingjingPanel = new AnqiTupopingjingPanel();
            this.anqitupopingjingPanel.$parent = this;
         }
         this.anqitupopingjingPanel.showMubaBtn(param1);
      }
      
      public function onCloseMuba() : void
      {
         this.anqitupopingjingPanel.onCloseMuba();
      }
      
      public function setTuPoBtnEnabled(param1:Boolean) : void
      {
         this.anqiContainer.TppjBtn.enabled = param1;
      }
      
      public function SetInitializeContent(param1:Array) : void
      {
         if(!this.achieveaccomplishmentPanel1)
         {
            this.achieveaccomplishmentPanel1 = new AchieveAccomplishmentPanel();
         }
         this.achieveaccomplishmentPanel1.visible = true;
         this.achieveaccomplishmentPanel1.SetInitializeContent([param1[0]]);
         GameInstance.uiInstance.uiContainer.addChild(this.achieveaccomplishmentPanel1);
         this.achieveaccomplishmentPanel1.x = (GameConfig.sceneWidth - this.achieveaccomplishmentPanel1.width) / 2;
         this.achieveaccomplishmentPanel1.y = (GameConfig.sceneHeight - this.achieveaccomplishmentPanel1.height * 2) / 2;
         if(!this.achieveaccomplishmentPanel2)
         {
            this.achieveaccomplishmentPanel2 = new AchieveAccomplishmentPanel();
         }
         this.achieveaccomplishmentPanel2.visible = true;
         this.achieveaccomplishmentPanel2.SetInitializeContent([param1[1]]);
         GameInstance.uiInstance.uiContainer.addChild(this.achieveaccomplishmentPanel2);
         this.achieveaccomplishmentPanel2.x = (GameConfig.sceneWidth - this.achieveaccomplishmentPanel2.width) / 2;
         this.achieveaccomplishmentPanel2.y = (GameConfig.sceneHeight - this.achieveaccomplishmentPanel2.height * 2) / 2 + this.achieveaccomplishmentPanel2.height;
      }
      
      public function setFlag(param1:int) : void
      {
         this.charContainer.setFlag(param1);
      }
      
      public function showPlayerInfo() : void
      {
         this.charContainer.visible = false;
         this.venationContainer.visible = false;
         this.anqiContainer.visible = false;
         this.anqiContainer.removeMc();
         this.smithingbodyContainer.visible = false;
         this.bow.visible = false;
         this.dantian.visible = false;
         this.bow.removeMc();
         this.dantian.removeMc();
         this.dugujiujian.visible = false;
         this.dugujiujian.removeMc();
         this.dongxiao.visible = false;
         this.dongxiao.removeMc();
         this.bagua.visible = false;
         this.jiuyang.visible = false;
         this.jiuyang.removeMc();
         this.zixiashengong.removeMc();
         this.zixiashengong.visible = false;
         this.xiangLongShiBaZahang.visible = false;
         this.xiangLongShiBaZahang.removeMc();
         this.yiJinJing.visible = false;
         this.xisuijing.visible = false;
         this.jingJie.visible = false;
         this.feilongtanyunshou.visible = false;
         this.feilongtanyunshou.removeMc();
         this.jiuyin.visible = false;
         this.yuncheng.visible = false;
         this.wulizhi.visible = false;
         this.zhanqi.visible = false;
         this.wuxingquan.visible = false;
         this.shibatongren.visible = false;
         this.liumaishenjian.visible = false;
         this.wuXingZhiRen.visible = false;
         this.wuXingZhiRen.removeMc();
         this.jinzhongzhao.visible = false;
         this.jingangfumoquan.visible = false;
         this.ynliulongzhuangbei.visible = false;
         this.ynJingLing.visible = false;
         this.ynGuiHun.visible = false;
         this.ynJinfengdiao.visible = false;
         this.xiuwei.visible = false;
         this.zhanhun.visible = false;
         this.chiXueMoZhen.visible = false;
         this.chiXueMoZhen.removeMc();
      }
      
      public function setPlayerInfo(param1:PersonData) : void
      {
         this.playerInfoContainer.setData(param1);
      }
      
      public function showUploadPhotoPanel(param1:String) : void
      {
         if(!this.uploadPanel)
         {
            this.uploadPanel = new PlayerInfoUploadPhotoPanel();
         }
         this.uploadPanel.setKey(param1);
         this.uploadPanel.visible = true;
         GameInstance.uiInstance.uiContainer.addChild(this.uploadPanel);
         this.uploadPanel.x = (GameConfig.sceneWidth - this.uploadPanel.panelWidth) / 2;
         this.uploadPanel.y = (GameConfig.sceneHeight - this.uploadPanel.panelHeight) / 2;
      }
      
      public function set_RouShen(param1:Array) : void
      {
         this.smithingbodyContainer.set_RouShen(param1);
      }
      
      public function showSmithingBody() : void
      {
         this.initCharPanel(1,"3");
         this.smithingbodyContainer.setRouShenMenghuanJindan(true);
      }
      
      public function requestSmithingBody() : void
      {
         dispatchEvent(new BaseEvent(GETDUANZAOROUSHEN));
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
      
      public function setZhufuzhi(param1:int, param2:int) : void
      {
         this.smithingbodyContainer.setZhufuzhi(param1,param2);
      }
      
      public function setChenggonglv(param1:int, param2:int, param3:String) : void
      {
         this.smithingbodyContainer.setChenggonglv(param1,param2,param3);
      }
      
      public function setAdvanceMiaoshu(param1:String) : void
      {
         this.smithingbodyContainer.setAdvanceMiaoshu(param1);
      }
      
      public function setCountDown(param1:int) : void
      {
         this.smithingbodyContainer.setCountDown(param1);
      }
      
      public function setPudidan(param1:Goods) : void
      {
         this.smithingbodyContainer.setPudidan(param1);
      }
      
      public function showBuyPanel(param1:int, param2:String, param3:String, param4:int, param5:String, param6:int, param7:Number) : void
      {
         this.smithingbodyContainer.showBuyPanel(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function onShowLv(param1:Boolean) : void
      {
         this.smithingbodyContainer.onShowLv(param1);
      }
      
      public function okBtnToolTip(param1:String) : void
      {
         this.smithingbodyContainer.okBtnToolTip(param1);
      }
      
      public function menuToolTip(param1:Array) : void
      {
         this.smithingbodyContainer.menuToolTip(param1);
      }
      
      public function setJindu(param1:int) : void
      {
         this.smithingbodyContainer.setJindu(param1);
      }
      
      public function setIsShowUsePuTiJingCui(param1:Boolean) : void
      {
         this.smithingbodyContainer.setIsShowUsePuTiJingCui(param1);
      }
      
      public function setIsShowUsePuTiDan(param1:Boolean) : void
      {
         this.smithingbodyContainer.setIsShowUsePuTiDan(param1);
      }
      
      public function setIsUsePuTiDan(param1:Boolean) : void
      {
         this.smithingbodyContainer.setIsUsePuTiDan(param1);
      }
      
      public function showPuTiDanTipCanvas(param1:int) : void
      {
         this.smithingbodyContainer.showPuTiDanTipCanvas(param1);
      }
      
      public function setCheck(param1:Boolean) : void
      {
         this.smithingbodyContainer.setCheck(param1);
      }
      
      public function showDuantijindan(param1:Buff) : void
      {
         this.smithingbodyContainer.showDuantijindan(param1);
      }
      
      public function setSmithingBodyBuff(param1:Array) : void
      {
         this.smithingbodyContainer.setSmithingBodyBuff(param1);
      }
      
      public function setJihuo(param1:Boolean) : void
      {
         this.smithingbodyContainer.setJihuo(param1);
      }
      
      public function setJihuoDajinlong(param1:Boolean) : void
      {
         this.smithingbodyContainer.setJihuoDajinlong(param1);
      }
      
      public function loadLongPicture() : void
      {
         this.smithingbodyContainer.loadLongPicture();
      }
      
      public function setIsJihuoMohua(param1:Array) : void
      {
         this.smithingbodyContainer.setIsJihuoMohua(param1);
      }
      
      public function setRoushenZdtsBtnLabel(param1:Boolean) : void
      {
         this.smithingbodyContainer.setZdtsBtnLabel(param1);
      }
      
      public function menuRoushenJinduToolTip(param1:String) : void
      {
         this.smithingbodyContainer.menuJinduToolTip(param1);
      }
      
      public function roushenzuoqi(param1:Boolean) : void
      {
         this.smithingbodyContainer.zuoqi(param1);
      }
      
      public function setRoushenJinduNum(param1:int, param2:Boolean) : void
      {
         this.smithingbodyContainer.setJinduNum(param1,param2);
      }
      
      public function permitBow(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.gongjianButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.bow,0);
            this.gongjianButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.gongjianButton);
            this.btnArray3.push(this.bowObj);
            this.initCharPanel(3,"2");
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
            _loc2_ = this.btnArray3.indexOf(this.bowObj);
            if(_loc2_ >= 0)
            {
               this.btnArray3.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showBow() : void
      {
         this.initCharPanel(3,"2");
      }
      
      public function requestShowBowPanel() : void
      {
         dispatchEvent(new BaseEvent(GETGONGJIAN));
      }
      
      public function isOpenBow(param1:Boolean) : void
      {
         this.bow.setIsOpen(param1);
      }
      
      public function setJinJieBtnEnabled(param1:Boolean) : void
      {
         this.bow.jjhcBtn.enabled = param1;
      }
      
      public function setJianshu(param1:Array, param2:int, param3:int) : void
      {
         this.bow.setJianshu(param1,param2,param3);
      }
      
      public function setJianzhi(param1:Array, param2:int) : void
      {
         this.bow.setJianzhi(param1,param2);
      }
      
      public function setBowPage(param1:int, param2:int, param3:Boolean = true, param4:int = 0) : void
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
      
      public function showBowJinjie() : void
      {
         if(!this.bowjinjiePanel)
         {
            this.bowjinjiePanel = new BowJinjiePanel();
            this.bowjinjiePanel.$parent = this;
         }
         this.bowjinjiePanel.visible = true;
         GameInstance.uiInstance.uiContainer.addChild(this.bowjinjiePanel);
         this.bowjinjiePanel.x = (GameConfig.sceneWidth - this.bowjinjiePanel.width) / 2;
         this.bowjinjiePanel.y = (GameConfig.sceneHeight - this.bowjinjiePanel.height) / 2;
      }
      
      public function setGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.bowjinjiePanel.setGoods(param1,param2);
      }
      
      public function setBow(param1:String, param2:int, param3:String, param4:int) : void
      {
         this.bowjinjiePanel.setBow(param1,param2,param3,param4);
      }
      
      public function setXingyunzhi(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int = 0) : void
      {
         this.bowjinjiePanel.setXingyunzhi(param1,param2,param3,param4,param5,param6);
      }
      
      public function xingyunzhiPlay() : void
      {
         this.bowjinjiePanel.xingyunzhiPlay();
      }
      
      public function xingyunzhiStop(param1:int) : void
      {
         this.bowjinjiePanel.xingyunzhiStop(param1);
      }
      
      public function addXingyunzhi(param1:int) : void
      {
         this.bowjinjiePanel.addXingyunzhi(param1);
      }
      
      public function bowJinjiePanelClose() : void
      {
         this.bowjinjiePanel.onClose();
      }
      
      public function BowShow(param1:Boolean) : void
      {
         this.bow.setShow(param1);
      }
      
      public function setBowJihuo(param1:Boolean) : void
      {
         this.bow.setButtonYC(param1);
      }
      
      public function setBowZdtsBtnLabel(param1:Boolean) : void
      {
         if(this.bowjinjiePanel != null)
         {
            this.bowjinjiePanel.setZdtsBtnLabel(param1);
         }
      }
      
      public function menuBowToolTip(param1:String) : void
      {
         this.bow.menuToolTip(param1);
      }
      
      public function setBowJinduNum(param1:int, param2:Boolean) : void
      {
         this.bow.setJinduNum(param1,param2);
      }
      
      public function setRTimeGj(param1:int) : void
      {
         this.bowjinjiePanel.setRTime(param1);
      }
      
      public function setBowEquip(param1:Array) : void
      {
         this.bow.setBowEquip(param1);
      }
      
      public function setYNBowEquip(param1:Array) : void
      {
         this.bow.setYNBowEquip(param1);
      }
      
      public function setBowMenghuanYujian(param1:Boolean) : void
      {
         this.bow.setBowMenghuanYujian(true);
      }
      
      public function setBowDanTian(param1:Boolean) : void
      {
         this.bow.setBowDanTian(param1);
      }
      
      public function permitDanTian(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.dantianButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.dantian,0);
            this.dantianButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.dantianButton);
            this.btnArray1.push(this.danTianObj);
            this.initCharPanel(1,"10");
         }
         else if(!param1 && this.dantianButton.hasEventListener(MouseEvent.CLICK))
         {
            this.dantianButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.dantian);
            this.removeDisplayObject(this.dantianButton);
            _loc2_ = this.btnArray1.indexOf(this.danTianObj);
            if(_loc2_ >= 0)
            {
               this.btnArray1.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showDantian() : void
      {
         this.initCharPanel(1,"10");
      }
      
      public function requestShowDantianPanel() : void
      {
         dispatchEvent(new BaseEvent(GETDANTIAN));
      }
      
      public function get useDantianGoodsType() : int
      {
         return this.dantian.useDantianGoodsType;
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
      
      public function chuandai(param1:Boolean) : void
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
      
      public function setDantianRTime(param1:int) : void
      {
         this.dantian.setRTime(param1);
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
      
      public function bofangYanhua() : void
      {
         this.dantian.bofangYanhua();
      }
      
      public function showMask(param1:Boolean) : void
      {
         this.charContainer.showMask(param1);
      }
      
      public function setDantianBuff(param1:Array) : void
      {
         this.dantian.setDantianBuff(param1);
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
         this.dantian.setDantianMenghuanJindan(true);
      }
      
      public function dantianVisible() : Boolean
      {
         return this.dantian.visible;
      }
      
      public function set_DuGuJiuJian(param1:Array) : void
      {
         this.dugujiujian.set_DuGuJiuJian(param1);
      }
      
      public function permitJiuJian(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.dugujiujianButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.dugujiujian,0);
            this.dugujiujianButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.dugujiujianButton);
            this.btnArray2.push(this.objJiuJian);
            this.initCharPanel(2,"4");
         }
         else if(!param1 && this.dugujiujianButton.hasEventListener(MouseEvent.CLICK))
         {
            this.dugujiujianButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.dugujiujian);
            this.removeDisplayObject(this.dugujiujianButton);
            _loc2_ = this.btnArray2.indexOf(this.objJiuJian);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showDugujiujian() : void
      {
         this.initCharPanel(2,"4");
      }
      
      public function requestShowDugujiujianPanel() : void
      {
         dispatchEvent(new BaseEvent(DUGUJIUJIAN));
      }
      
      public function requestShowDugujiujianPanelAndPlayMC() : void
      {
         dispatchEvent(new BaseEvent(DUGUJIUJIAN));
         this.dugujiujian.bofangDuguNo10();
      }
      
      public function setDuguJiujianInitialize(param1:Array) : void
      {
         this.dugujiujian.setInitialize(true,param1);
      }
      
      public function setDuguJiujianAvatar(param1:BitmapData) : void
      {
         this.dugujiujian.avatar = param1;
      }
      
      public function setDugujiujianMc(param1:int) : void
      {
         this.dugujiujian.setMc(param1);
      }
      
      public function onDuguJiujianShowLv(param1:Boolean) : void
      {
         this.dugujiujian.onShowLv(param1);
      }
      
      public function setJiujianLingwuInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:int) : void
      {
         this.dugujiujian.setJiujianLingwuInitialize(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setJiujianLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.dugujiujian.setJiujianLingwuZhufuzhi(param1,param2,param3);
      }
      
      public function setJiujianLingwuGoods(param1:Goods) : void
      {
         this.dugujiujian.setJiujianLingwuGoods(param1);
      }
      
      public function setJiujianLingwuShuoming(param1:String) : void
      {
         this.dugujiujian.setJiujianLingwuShuoming(param1);
      }
      
      public function setJiujianLingwuBtn(param1:Boolean) : void
      {
         this.dugujiujian.setJiujianLingwuBtn(param1);
      }
      
      public function bofangDuguYanhua() : void
      {
         this.dugujiujian.bofangDuguYanhua();
      }
      
      public function DugujiujianEffectShow(param1:Boolean) : void
      {
         this.dugujiujian.setShow(param1);
      }
      
      public function setJiuJianJihuo(param1:Boolean, param2:Boolean) : void
      {
         this.dugujiujian.setJihuo(param1,param2);
      }
      
      public function permitDongXiao(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.dongxiaoButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.dongxiao,0);
            this.dongxiaoButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.dongxiaoButton);
            this.btnArray3.push(this.dongXiaoObj);
            this.initCharPanel(3,"3");
         }
         else if(!param1 && this.dongxiaoButton.hasEventListener(MouseEvent.CLICK))
         {
            this.dongxiaoButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.dongxiaoButton);
            this.removeDisplayObject(this.dongxiao);
            _loc2_ = this.btnArray3.indexOf(this.dongXiaoObj);
            if(_loc2_ >= 0)
            {
               this.btnArray3.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestDongXiao() : void
      {
         dispatchEvent(new BaseEvent(DONGXIAO));
      }
      
      public function showDongxiao(param1:Boolean = false) : void
      {
         this.initCharPanel(3,"3");
      }
      
      public function get useDongxiaoGoodsType() : int
      {
         return this.dongxiaotupopingjing.useDongxiaoGoodsType;
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
      
      public function setDongxiaoMiaoshu(param1:String) : void
      {
         this.dongxiao.setMiaoshu(param1);
      }
      
      public function setUse(param1:Boolean) : void
      {
         this.dongxiao.setUse(param1);
      }
      
      public function setYCSX(param1:int) : void
      {
         this.dongxiao.setYCSX(param1);
      }
      
      public function setZhanyin(param1:Boolean) : void
      {
         this.dongxiao.setZhanyin(param1);
         this.dongxiao.setJiHuo(true);
      }
      
      public function showDongxiaoTisuPanel(param1:Array) : void
      {
         if(!this.dongxiaotisu)
         {
            this.dongxiaotisu = new DongxiaoTisuPanel();
            this.dongxiaotisu.$parent = this;
         }
         this.dongxiaotisu.visible = true;
         this.dongxiaotisu.setDangqianInitialize(param1);
         GameInstance.uiInstance.uiContainer.addChild(this.dongxiaotisu);
         this.dongxiaotisu.x = (GameConfig.sceneWidth - this.dongxiaotisu.width) / 2;
         this.dongxiaotisu.y = (GameConfig.sceneHeight - this.dongxiaotisu.height) / 2;
      }
      
      public function CloseDongxiaoXiuliantisuPanel() : void
      {
         this.dongxiaotisu.onCloseFun();
      }
      
      public function showDongxiaoTupopingjingPanel(param1:Boolean) : void
      {
         if(!this.dongxiaotupopingjing)
         {
            this.dongxiaotupopingjing = new DongxiaoTupopingjingPanel();
            this.dongxiaotupopingjing.$parent = this;
         }
         if(param1)
         {
            this.dongxiaotupopingjing.visible = param1;
            GameInstance.uiInstance.uiContainer.addChild(this.dongxiaotupopingjing);
            this.dongxiaotupopingjing.x = (GameConfig.sceneWidth - this.dongxiaotupopingjing.width) / 2;
            this.dongxiaotupopingjing.y = (GameConfig.sceneHeight - this.dongxiaotupopingjing.height) / 2;
         }
         else
         {
            this.dongxiaotupopingjing.visible = param1;
            GameInstance.uiInstance.uiContainer.addChild(this.dongxiaotupopingjing);
            this.dongxiaotupopingjing.x = (GameConfig.sceneWidth - this.dongxiaotupopingjing.width) / 2;
            this.dongxiaotupopingjing.y = (GameConfig.sceneHeight - this.dongxiaotupopingjing.height) / 2;
            this.dongxiaotupopingjing.onTishiCloseFun();
         }
      }
      
      public function setDongxiaoTupopingjingInitializeFun(param1:Array) : void
      {
         if(!this.dongxiaotupopingjing)
         {
            this.dongxiaotupopingjing = new DongxiaoTupopingjingPanel();
            this.dongxiaotupopingjing.$parent = this;
         }
         this.dongxiaotupopingjing.setInitialize(param1);
      }
      
      public function DongxiaoShow(param1:Boolean) : void
      {
         this.dongxiao.setShow(param1);
      }
      
      public function setDongXiaoZdtsBtnLabel(param1:Boolean) : void
      {
         if(this.dongxiaotupopingjing != null)
         {
            this.dongxiaotupopingjing.setZdtsBtnLabel(param1);
         }
      }
      
      public function menuDongxiaoToolTip(param1:String) : void
      {
         this.dongxiao.menuToolTip(param1);
      }
      
      public function setDongxiaoJinduNum(param1:int, param2:Boolean) : void
      {
         this.dongxiao.setJinduNum(param1,param2);
      }
      
      public function requestShowSmithingBodyB() : void
      {
         dispatchEvent(new BaseEvent(GETDUANZAOROUSHENB));
      }
      
      public function permitBaGua(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.baguazhangButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.bagua,0);
            this.baguazhangButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.baguazhangButton);
            this.objBaGua = new Object();
            this.objBaGua.neirong = this.bagua;
            this.objBaGua.biaoqian = this.baguazhangButton;
            this.objBaGua.name = "1";
            this.objBaGua.isShow = true;
            this.objBaGua.dengji = 0;
            this.btnArray2.push(this.objBaGua);
            this.initCharPanel(2,"1");
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
            _loc2_ = this.btnArray2.indexOf(this.objBaGua);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowBaGua() : void
      {
         dispatchEvent(new BaseEvent(GETDUANZAOROUSHENB));
      }
      
      public function showSmithingBodyB() : void
      {
         this.initCharPanel(2,"1");
         this.bagua.setBaGuaMenghuanJindan(true);
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
      
      public function setPageB(param1:int, param2:int, param3:Boolean) : void
      {
         this.bagua.setPage(param1,param2,param3);
      }
      
      public function setIsEnabledB(param1:Boolean) : void
      {
         this.bagua.setIsEnabled(param1);
      }
      
      public function setZhufuzhiB(param1:int, param2:int) : void
      {
         this.bagua.setZhufuzhi(param1,param2);
      }
      
      public function setChenggonglvB(param1:int, param2:int, param3:String) : void
      {
         this.bagua.setChenggonglv(param1,param2,param3);
      }
      
      public function setAdvanceMiaoshuB(param1:String) : void
      {
         this.bagua.setAdvanceMiaoshu(param1);
      }
      
      public function setCountDownB(param1:int) : void
      {
         this.bagua.setCountDown(param1);
      }
      
      public function setPudidanB(param1:Goods) : void
      {
         this.bagua.setPudidan(param1);
      }
      
      public function showBuyPanelB(param1:int, param2:String, param3:String, param4:int, param5:String, param6:int, param7:Number) : void
      {
         this.bagua.showBuyPanel(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function onShowLvB(param1:Boolean = true) : void
      {
         if(param1)
         {
            this.bagua.onShowLv(param1);
            ResizeManager.showDoublePanel(this,this.bagua.smithingbodyadvanceCanvas);
         }
         else if(this.bagua.smithingbodyadvanceCanvas != null && this.bagua.smithingbodyadvanceCanvas.parent != null)
         {
            this.bagua.smithingbodyadvanceCanvas.parent.removeChild(this.bagua.smithingbodyadvanceCanvas);
         }
      }
      
      public function okBtnToolTipB(param1:String) : void
      {
         this.bagua.okBtnToolTip(param1);
      }
      
      public function menuToolTipB(param1:Array) : void
      {
         this.bagua.menuToolTip(param1);
      }
      
      public function setJinduB(param1:int) : void
      {
         this.bagua.setJindu(param1);
      }
      
      public function setIsShowUsePuTiJingCuiB(param1:Boolean) : void
      {
         this.bagua.setIsShowUsePuTiJingCui(param1);
      }
      
      public function setIsShowUsePuTiDanB(param1:Boolean) : void
      {
         this.bagua.setIsShowUsePuTiDan(param1);
      }
      
      public function setIsUsePuTiDanB(param1:Boolean) : void
      {
         this.bagua.setIsUsePuTiDan(param1);
      }
      
      public function showPuTiDanTipCanvasB(param1:int) : void
      {
         this.bagua.showPuTiDanTipCanvas(param1);
      }
      
      public function setCheckB(param1:Boolean) : void
      {
         this.bagua.setCheck(param1);
      }
      
      public function setDengjiB(param1:int) : void
      {
         this.bagua.setDengji(param1);
      }
      
      public function showDuantijindanB(param1:Buff) : void
      {
         this.bagua.showDuantijindan(param1);
      }
      
      public function setSmithingBodyBuffB(param1:Array) : void
      {
         this.bagua.setSmithingBodyBuff(param1);
      }
      
      public function setJihuoB(param1:Boolean) : void
      {
         this.bagua.setJihuo(param1);
      }
      
      public function setBaguazhangZdtsBtnLabel(param1:Boolean) : void
      {
         this.bagua.setZdtsBtnLabel(param1);
      }
      
      public function menuBaguazhangJinduToolTip(param1:String) : void
      {
         this.bagua.menuJinduToolTip(param1);
      }
      
      public function setBaguazhangJinduNum(param1:int, param2:Boolean) : void
      {
         this.bagua.setJinduNum(param1,param2);
      }
      
      public function set_BGHL(param1:Array) : void
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
      
      public function permitJiuYang(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.jiuyangshengongButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.jiuyang,0);
            this.jiuyangshengongButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.jiuyangshengongButton);
            this.btnArray2.push(this.objJiuYang);
            this.initCharPanel(2,"5");
         }
         else if(!param1 && this.jiuyangshengongButton.hasEventListener(MouseEvent.CLICK))
         {
            this.jiuyangshengongButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.jiuyang);
            this.removeDisplayObject(this.jiuyangshengongButton);
            _loc2_ = this.btnArray2.indexOf(this.objJiuYang);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestJiuYang() : void
      {
         dispatchEvent(new BaseEvent(DUGUJIUJIANJ));
      }
      
      public function showDugujiujianJ() : void
      {
         this.initCharPanel(2,"5");
      }
      
      public function requestShowJiuYang() : void
      {
         dispatchEvent(new BaseEvent(DUGUJIUJIANJ));
      }
      
      public function setDuguJiujianInitializeJ(param1:Array) : void
      {
         this.jiuyang.setInitialize(true,param1);
      }
      
      public function setDuguJiujianAvatarJ(param1:BitmapData) : void
      {
         this.jiuyang.avatar = param1;
      }
      
      public function setDugujiujianMcJ(param1:int) : void
      {
         this.jiuyang.setMc(param1);
      }
      
      public function onDuguJiujianShowLvJ(param1:Boolean) : void
      {
         this.jiuyang.onShowLv(param1);
      }
      
      public function setJiujianLingwuInitializeJ(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:int) : void
      {
         this.jiuyang.setJiujianLingwuInitialize(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setJiujianLingwuZhufuzhiJ(param1:int, param2:int, param3:int = 0) : void
      {
         this.jiuyang.setJiujianLingwuZhufuzhi(param1,param2,param3);
      }
      
      public function setJiujianLingwuGoodsJ(param1:Goods) : void
      {
         this.jiuyang.setJiujianLingwuGoods(param1);
      }
      
      public function setJiujianLingwuShuomingJ(param1:String) : void
      {
         this.jiuyang.setJiujianLingwuShuoming(param1);
      }
      
      public function setJiujianLingwuBtnJ(param1:Boolean) : void
      {
         this.jiuyang.setJiujianLingwuBtn(param1);
      }
      
      public function bofangDuguYanhuaJ() : void
      {
         this.jiuyang.bofangDuguYanhua();
      }
      
      public function JiuyangEffectShow(param1:Boolean) : void
      {
         this.jiuyang.setShow(param1);
      }
      
      public function setJiuYangJihuo(param1:Boolean) : void
      {
         this.jiuyang.setJihuo(param1);
      }
      
      public function setJiuYangJiHuo2(param1:Boolean) : void
      {
         this.jiuyang.setJihuo2(param1);
      }
      
      public function setBtnType(param1:Boolean, param2:Boolean = false) : void
      {
         this.venationContainer.setBtnType(param1,param2);
      }
      
      public function setQiHaiData(param1:Array) : void
      {
         this.venationContainer.setQiHaiData(param1);
      }
      
      public function closeQiHaiPanel() : void
      {
         this.venationContainer.closeQiHaiPanel();
      }
      
      public function setZhuFu(param1:int, param2:int) : void
      {
         this.venationContainer.setZhuFu(param1,param2);
      }
      
      public function showQueRenPanel() : void
      {
         this.venationContainer.showQueRenPanel();
      }
      
      public function setLongmaiJingyuan(param1:Boolean) : void
      {
         this.venationContainer.setLongmaiJingyuan(param1);
      }
      
      public function setZhuanshiZhenlong(param1:Boolean) : void
      {
         this.venationContainer.setZhuanshiZhenlong(param1);
      }
      
      public function permitXiangLong(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.shibazhangButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.xiangLongShiBaZahang,0);
            this.shibazhangButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.shibazhangButton);
            this.btnArray2.push(this.objXiangLong);
            this.initCharPanel(2,"11");
         }
         else if(!param1 && this.shibazhangButton.hasEventListener(MouseEvent.CLICK))
         {
            this.shibazhangButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.xiangLongShiBaZahang);
            this.removeDisplayObject(this.shibazhangButton);
            _loc2_ = this.btnArray2.indexOf(this.objXiangLong);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showXiangLongShiBaZhang() : void
      {
         this.initCharPanel(2,"11");
      }
      
      public function initilizeUI(param1:XiangLongMainPanelVO) : void
      {
         this.xiangLongShiBaZahang.initilizeUI(true,param1);
      }
      
      public function setMainMsg(param1:String) : void
      {
      }
      
      public function setZhaoShiMsg(param1:String, param2:int, param3:int, param4:Boolean) : void
      {
         this.xiangLongShiBaZahang.setZhaoShiMsg(param1,param2,param3,param4);
      }
      
      public function setChatShuXing(param1:String) : void
      {
         this.xiangLongShiBaZahang.setChatShuXing(param1);
      }
      
      public function setChatWuGong(param1:int, param2:int, param3:int) : void
      {
         this.xiangLongShiBaZahang.setChatWuGong(param1,param2,param3);
      }
      
      public function setBaGuZhangSkill(param1:int, param2:Skill, param3:Skill, param4:Skill, param5:Skill, param6:Skill, param7:Boolean, param8:Skill) : void
      {
         this.xiangLongShiBaZahang.setSkill(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setTips(param1:String, param2:String, param3:String, param4:String) : void
      {
         this.xiangLongShiBaZahang.setTips(param1,param2,param3,param4);
      }
      
      public function showXiangLongLingWuPanel(param1:Boolean) : void
      {
      }
      
      public function setInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.xiangLongShiBaZahang.showXiangLongLingWuPanel(true);
         this.xiangLongShiBaZahang.setInitialize(param1,param2,param3,param4,param5,param6);
      }
      
      public function setXiangLongShiBaZahangZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.xiangLongShiBaZahang.setZhufuzhi(param1,param2,param3);
      }
      
      public function setXiangLongShiBaZahangGoods(param1:Goods, param2:Boolean) : void
      {
         this.xiangLongShiBaZahang.setGoods(param1,param2);
      }
      
      public function setShuoming(param1:String) : void
      {
         this.xiangLongShiBaZahang.setShuoming(param1);
      }
      
      public function setBtn(param1:Boolean) : void
      {
         this.xiangLongShiBaZahang.setBtn(param1);
      }
      
      public function closeMiniPanel() : void
      {
         this.xiangLongShiBaZahang.closeMiniPanel();
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
      
      public function requestShowXiangLongShiBaZhang() : void
      {
         dispatchEvent(new BaseEvent(XIANGLONGSHIBAZHANG_SHOW));
      }
      
      public function set_YiJinJing(param1:Array) : void
      {
         this.yiJinJing.set_YiJinJing(param1);
      }
      
      public function requestShowYiJinJing() : void
      {
         dispatchEvent(new BaseEvent(GETYIJINJING));
      }
      
      public function permitYiJinJing(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.yijinjingButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.yiJinJing,0);
            this.yijinjingButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.yijinjingButton);
            this.btnArray2.push(this.yiJinJingObj);
            this.initCharPanel(2,"3");
         }
         else if(!param1 && this.yijinjingButton.hasEventListener(MouseEvent.CLICK))
         {
            this.yijinjingButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.yiJinJing);
            this.removeDisplayObject(this.yijinjingButton);
            _loc2_ = this.btnArray2.indexOf(this.yiJinJingObj);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showYiJinJing() : void
      {
         this.initCharPanel(2,"3");
      }
      
      public function requestYiJinJing() : void
      {
         dispatchEvent(new Event(GETYIJINJING));
      }
      
      public function setYijinjingInitialize(param1:YiJinJingVO) : void
      {
         this.yiJinJing.setInitialize(true,param1);
      }
      
      public function setYijinjingLingwuInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.yiJinJing.setYijinjingLingwuInitialize(param1,param2,param3,param4,param5,param6);
      }
      
      public function setYijinjingLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.yiJinJing.setYijinjingLingwuZhufuzhi(param1,param2,param3);
      }
      
      public function setYijinjingLingwuJiyuanzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.yiJinJing.setYijinjingLingwuJiyuanzhi(param1,param2,param3);
      }
      
      public function setYijinjingLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.yiJinJing.setYijinjingLingwuGoods(param1,param2);
      }
      
      public function setYijinjingLingwuBtn(param1:Boolean) : void
      {
         this.yiJinJing.setYijinjingLingwuBtn(param1);
      }
      
      public function showYijinjingLingWuPanel(param1:Boolean) : void
      {
         this.yiJinJing.onShowLv(param1);
      }
      
      public function isYijinjingtupoCanvasShow() : Boolean
      {
         return this.yiJinJing.isYijinjingtupoCanvasShow();
      }
      
      public function permitJingJie(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.jingjieButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.jingJie,0);
            this.jingjieButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.jingjieButton);
            this.btnArray1.push(this.jingJieObj);
            this.showJingJie();
         }
         else if(!param1 && this.jingjieButton.hasEventListener(MouseEvent.CLICK))
         {
            this.jingjieButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.jingJie);
            this.removeDisplayObject(this.jingjieButton);
            _loc2_ = this.btnArray1.indexOf(this.jingJieObj);
            if(_loc2_ >= 0)
            {
               this.btnArray1.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showJingJie() : void
      {
         this.initCharPanel(1,"9");
      }
      
      public function requestJingJie() : void
      {
         dispatchEvent(new Event(GETJINGJIE));
      }
      
      public function setJingJieInitialize(param1:int, param2:int, param3:int) : void
      {
         this.jingJie.setInitialize(param1,param2,param3,true);
      }
      
      public function setJingJieShuxing(param1:Boolean, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int) : void
      {
         this.jingJie.setShuxing(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function onJingJieShowLv(param1:Boolean) : void
      {
         this.jingJie.onShowLv(param1);
      }
      
      public function menuJingJieToolTip(param1:Array) : void
      {
         this.jingJie.menuToolTip(param1);
      }
      
      public function setJingJieTuPoZhufuzhi(param1:int, param2:int) : void
      {
         this.jingJie.setTuPoZhufuzhi(param1,param2);
      }
      
      public function setJingJieTuPoShuxing(param1:int, param2:int, param3:String) : void
      {
         this.jingJie.setTuPoShuxing(param1,param2,param3);
      }
      
      public function setJingJieTuPoGoods(param1:Goods) : void
      {
         this.jingJie.setTuPoGoods(param1);
      }
      
      public function setJingJieTuPoBtn(param1:Boolean) : void
      {
         this.jingJie.setTuPoBtn(param1);
      }
      
      public function removeJingJieShuoming() : void
      {
         this.jingJie.removeShuoming();
      }
      
      public function set_TSJJ(param1:Array) : void
      {
         this.jingJie.set_CJTBS(param1);
      }
      
      public function set_LYGG(param1:Boolean) : void
      {
         var _loc2_:Skill = null;
         _loc2_ = new Skill(200142);
         _loc2_.isLearn = 1;
         this.jingJie.set_LYGG(param1,_loc2_);
      }
      
      public function setWeilieShuxing(param1:Boolean) : void
      {
         this.jingJie.setWeilieShuxing(param1);
      }
      
      public function setChuandai(param1:Boolean, param2:Boolean) : void
      {
         this.jingJie.setChuandai(param1,param2);
      }
      
      public function permitXiSuiJing(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.xisuijingButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.xisuijing,0);
            this.xisuijingButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.xisuijingButton);
            this.btnArray2.push(this.xiSuiJingObj);
            this.initCharPanel(2,"6");
         }
         else if(!param1 && this.xisuijingButton.hasEventListener(MouseEvent.CLICK))
         {
            this.xisuijingButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.xisuijing);
            this.removeDisplayObject(this.xisuijingButton);
            _loc2_ = this.btnArray2.indexOf(this.xiSuiJingObj);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showYiJinJing_X() : void
      {
         this.initCharPanel(2,"6");
      }
      
      public function set_XiSuiJing(param1:Array) : void
      {
         this.xisuijing.set_XiSuiJing(param1);
      }
      
      public function setYijinjingInitialize_X(param1:XiSuiJingVO) : void
      {
         this.xisuijing.setInitialize(true,param1);
      }
      
      public function requestXiSuiJing() : void
      {
         dispatchEvent(new Event(GETYIJINJING_X));
      }
      
      public function setYijinjingLingwuInitialize_X(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:String) : void
      {
         this.xisuijing.setYijinjingLingwuInitialize(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setYijinjingLingwuZhufuzhi_X(param1:int, param2:int, param3:int = 0) : void
      {
         this.xisuijing.setYijinjingLingwuZhufuzhi(param1,param2,param3);
      }
      
      public function setYijinjingLingwuJiyuanzhi_X(param1:int, param2:int, param3:int = 0) : void
      {
         this.xisuijing.setYijinjingLingwuJiyuanzhi(param1,param2,param3);
      }
      
      public function setYijinjingLingwuGoods_X(param1:Goods, param2:Boolean) : void
      {
         this.xisuijing.setYijinjingLingwuGoods(param1,param2);
      }
      
      public function setYijinjingLingwuBtn_X(param1:Boolean) : void
      {
         this.xisuijing.setYijinjingLingwuBtn(param1);
      }
      
      public function showYijinjingLingWuPanel_X(param1:Boolean) : void
      {
         this.xisuijing.onShowLv(param1);
      }
      
      public function isYijinjingtupoCanvasShow_X() : Boolean
      {
         return this.xisuijing.isYijinjingtupoCanvasShow();
      }
      
      public function menuXisuijingToolTip(param1:String) : void
      {
         this.xisuijing.menuToolTip(param1);
      }
      
      public function setXisuijingJinduNum(param1:int, param2:Boolean) : void
      {
         this.xisuijing.setJinduNum(param1,param2);
      }
      
      public function permitFeiLong(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.feilongtanyunshouButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.feilongtanyunshou,0);
            this.feilongtanyunshouButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.feilongtanyunshouButton);
            this.btnArray2.push(this.feiLongObj);
            this.showFeiLongTanYunShou();
         }
         else if(!param1 && this.feilongtanyunshouButton.hasEventListener(MouseEvent.CLICK))
         {
            this.feilongtanyunshouButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.feilongtanyunshou);
            this.removeDisplayObject(this.feilongtanyunshouButton);
            _loc2_ = this.btnArray2.indexOf(this.feiLongObj);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestFeiLong() : void
      {
         dispatchEvent(new BaseEvent(FEILONGTANYUNSHOU));
      }
      
      public function requestShowFeiLongTanYunShou() : void
      {
         dispatchEvent(new BaseEvent(FEILONGTANYUNSHOU));
      }
      
      public function showFeiLongTanYunShou() : void
      {
         this.initCharPanel(2,"8");
      }
      
      public function setFeiLongTanYunShouInitialize(param1:FeiLongTanYunShouVO) : void
      {
         this.feilongtanyunshou.initilizeUI(true,param1);
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
      
      public function showYN_HLZ(param1:Boolean) : void
      {
         this.feilongtanyunshou.showYN_HLZ(param1);
      }
      
      public function setCHK_HLZ(param1:Boolean) : void
      {
         this.feilongtanyunshou.setCHK_HLZ(param1);
      }
      
      public function setXunzhangYN_FLTYS(param1:Array) : *
      {
         this.feilongtanyunshou.setYN(param1);
      }
      
      public function feilongtanyunshouVisible() : Boolean
      {
         return this.feilongtanyunshou.visible;
      }
      
      public function set_JiuYinZhenJing(param1:Array) : void
      {
         this.jiuyin.set_JiuYinZhenJing(param1);
      }
      
      public function isHuanZHuang(param1:Boolean) : void
      {
         this.jiuyin.isHuanZHuang(param1);
      }
      
      public function permitJiuYin(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.jiuyinButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.jiuyin,0);
            this.jiuyinButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.jiuyinButton);
            this.btnArray2.push(this.jiuYinObj);
            this.showJiuyinZhenjing();
         }
         else if(!param1 && this.jiuyinButton.hasEventListener(MouseEvent.CLICK))
         {
            this.jiuyinButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.jiuyin);
            this.removeDisplayObject(this.jiuyinButton);
            _loc2_ = this.btnArray2.indexOf(this.jiuYinObj);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showJiuyinZhenjing() : void
      {
         this.initCharPanel(2,"7");
      }
      
      public function setJiuyinzhenjingInitialize(param1:Array) : void
      {
         this.jiuyin.setInitialize(true,param1);
      }
      
      public function setJiuyinzhenjingBuff(param1:Skill, param2:String, param3:int) : void
      {
         this.jiuyin.setJiuyinBuff(param1,param2,param3);
      }
      
      public function setJiuyinzhenjingQiu(param1:int) : void
      {
         this.jiuyin.setJiuyinQiu(param1);
      }
      
      public function bofangJiuyinYanhuaJ() : void
      {
         this.jiuyin.bofangJiuyinYanhua();
      }
      
      public function onJiuyinzhenjingShowLv(param1:Boolean) : void
      {
         this.jiuyin.onShowLv(param1);
      }
      
      public function setJiuyinzhenjingTupoInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.jiuyin.setJiuyinInitialize(param1,param2,param3,param4,param5,param6);
      }
      
      public function setJiuyinzhenjingZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.jiuyin.setJiuyinZhufuzhi(param1,param2,param3);
      }
      
      public function setJiuyinzhenjingGoods(param1:Goods) : void
      {
         this.jiuyin.setJiuyinGoods(param1);
      }
      
      public function setJiuyinzhenjingShuoming(param1:String) : void
      {
         this.jiuyin.setJiuyinShuoming(param1);
      }
      
      public function setJiuyinzhenjingBtn(param1:Boolean) : void
      {
         this.jiuyin.setJiuyinBtn(param1);
      }
      
      public function requestShowJiuYinZhenJing() : void
      {
         dispatchEvent(new BaseEvent(JIUYINZHENJING));
      }
      
      public function set_YunCheng(param1:Array) : void
      {
         this.yuncheng.set_YunCheng(param1);
      }
      
      public function permitYunCheng(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.yunchengButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.yuncheng,0);
            this.yunchengButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.yunchengButton);
            this.btnArray1.push(this.objYunCheng);
            this.initCharPanel(1,"4");
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
            _loc2_ = this.btnArray1.indexOf(this.objYunCheng);
            if(_loc2_ >= 0)
            {
               this.btnArray1.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showYunCheng() : void
      {
         this.initCharPanel(1,"4");
      }
      
      public function setYunChengZuoQi(param1:Boolean, param2:Boolean) : void
      {
         this.yuncheng.setYunChengZuoQi(param1,param2);
      }
      
      public function setYunInitializeYuncheng(param1:Array, param2:int, param3:Number) : void
      {
         this.yuncheng.setInitialize(true,param1,param2,param3);
      }
      
      public function setMcYuncheng(param1:int) : void
      {
         this.yuncheng.setMc(param1);
      }
      
      public function setTime(param1:int) : void
      {
         this.yuncheng.setTime(param1);
      }
      
      public function loadSetMc() : void
      {
         this.yuncheng.loadSetMc();
      }
      
      public function requestShowYunCheng() : void
      {
         dispatchEvent(new BaseEvent(GETYUNCHENG));
      }
      
      public function setYunchengJihuo(param1:Boolean, param2:Array) : void
      {
         this.yuncheng.setYunchengJihuo(param1,param2);
      }
      
      public function requestShowWulizhi() : void
      {
         dispatchEvent(new Event(GETWULIZHI));
      }
      
      public function permitXunZhang(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.wulizhiButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.wulizhi,0);
            this.wulizhiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.wulizhiButton);
            this.btnArray1.push(this.xunZhangObj);
            this.showWulizhi();
         }
         else if(!param1 && this.wulizhiButton.hasEventListener(MouseEvent.CLICK))
         {
            this.wulizhiButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.wulizhi);
            this.removeDisplayObject(this.wulizhiButton);
            _loc2_ = this.btnArray1.indexOf(this.xunZhangObj);
            if(_loc2_ >= 0)
            {
               this.btnArray1.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showWulizhi() : void
      {
         this.initCharPanel(1,"5");
      }
      
      public function setWuliItems(param1:Array) : void
      {
         this.wulizhi.setShowItem(true,param1);
      }
      
      public function setTotalXunzhang(param1:Boolean, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : void
      {
         this.wulizhi.setTotalXunzhang(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setXunZhangZuoQi(param1:Boolean) : void
      {
         this.wulizhi.gouxuan(param1);
      }
      
      public function requestXunZhang() : void
      {
         dispatchEvent(new Event(GETWULIZHI));
      }
      
      public function set_WuXingQuan(param1:Array) : void
      {
         this.wuxingquan.set_WuXingQuan(param1);
      }
      
      public function permitWuXingQuan(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.wuxingquanButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.wuxingquan,0);
            this.wuxingquanButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.wuxingquanButton);
            this.btnArray2.push(this.wuXingQuanObj);
            this.showWuXingQuan();
         }
         else if(!param1 && this.wuxingquanButton.hasEventListener(MouseEvent.CLICK))
         {
            this.wuxingquanButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.wuxingquan);
            this.removeDisplayObject(this.wuxingquanButton);
            _loc2_ = this.btnArray2.indexOf(this.wuXingQuanObj);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestWuXingQuan() : void
      {
         dispatchEvent(new BaseEvent(WUXINGQUAN));
      }
      
      public function showWuXingQuan() : void
      {
         this.initCharPanel(2,"9");
      }
      
      public function setInitializeWxq(param1:Array, param2:Skill, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean) : void
      {
         this.wuxingquan.setInitialize(param1,param2,param3,true,param4,param5,param6);
      }
      
      public function requestShowWuXingQuan() : void
      {
         dispatchEvent(new BaseEvent(WUXINGQUAN));
      }
      
      public function bofangJiuyinYanhuaWxq() : void
      {
         this.wuxingquan.bofangJiuyinYanhua();
      }
      
      public function showPanelWxq(param1:Boolean) : void
      {
         this.wuxingquan.showPanel(param1);
      }
      
      public function setWuXingQuanJiHuo(param1:Boolean, param2:Boolean) : void
      {
         this.wuxingquan.setJiHuo(param1,param2);
      }
      
      public function setInitializeWxqTupo(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:int) : void
      {
         this.wuxingquan.setInitializeWxqTupo(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setZhufuzhiWxqTupo(param1:int, param2:int, param3:int = 0) : void
      {
         this.wuxingquan.setZhufuzhiWxqTupo(param1,param2,param3);
      }
      
      public function setGoodsWxqTupo(param1:Goods, param2:Boolean = true) : void
      {
         this.wuxingquan.setGoodsWxqTupo(param1,param2);
      }
      
      public function setShuomingWxqTupo(param1:String) : void
      {
         this.wuxingquan.setShuomingWxqTupo(param1);
      }
      
      public function setBtnWxqTupo(param1:Boolean) : void
      {
         this.wuxingquan.setBtnWxqTupo(param1);
      }
      
      public function reManbanBoWxq() : Boolean
      {
         return this.wuxingquan.reManbanBo();
      }
      
      public function requestShowShiBaTongRen() : void
      {
         dispatchEvent(new Event(SHIBATONGREN));
      }
      
      public function permitShiBaTongRen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.shibatongrenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.shibatongren,0);
            this.shibatongrenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.shibatongrenButton);
            this.btnArray4.push(this.shiBaTongRenObj);
            this.showShiBaTongRen();
         }
         else if(!param1 && this.shibatongrenButton.hasEventListener(MouseEvent.CLICK))
         {
            this.shibatongrenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.shibatongren);
            this.removeDisplayObject(this.shibatongrenButton);
            _loc2_ = this.btnArray4.indexOf(this.shiBaTongRenObj);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShiBaTongRen() : void
      {
         dispatchEvent(new BaseEvent(SHIBATONGREN));
      }
      
      public function showShiBaTongRen() : void
      {
         this.initCharPanel(4,"3");
      }
      
      public function initilizeUISBTR(param1:ShiBaTongRenMainPanelVO) : void
      {
         this.shibatongren.initilizeUI(true,param1);
      }
      
      public function setMainMsgSBTR(param1:String) : void
      {
         this.shibatongren.setMainMsgSBTR(param1);
      }
      
      public function setZhaoShiMsgSBTR(param1:String, param2:int, param3:int, param4:Boolean) : void
      {
         this.shibatongren.setZhaoShiMsg(param1,param2,param3,param4);
      }
      
      public function setChatShuXingSBTR(param1:String) : void
      {
         this.shibatongren.setChatShuXing(param1);
      }
      
      public function showShiBaTongRenLingWuPanel(param1:Boolean) : void
      {
         this.shibatongren.showXiangLongLingWuPanel(param1);
      }
      
      public function setInitializeSBTR(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.shibatongren.showXiangLongLingWuPanel(true);
         this.shibatongren.setInitialize(param1,param2,param3,param4,param5,param6);
      }
      
      public function setShiBaTongRenZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.shibatongren.setZhufuzhi(param1,param2,param3);
      }
      
      public function setShiBaTongRenGoods(param1:Goods, param2:Boolean) : void
      {
         this.shibatongren.setGoods(param1,param2);
      }
      
      public function setShuomingSBTR(param1:String) : void
      {
         this.shibatongren.setShuoming(param1);
      }
      
      public function setBtnSBTR(param1:Boolean) : void
      {
         this.shibatongren.setBtn(param1);
      }
      
      public function closeMiniPanelSBTR() : void
      {
         this.shibatongren.closeMiniPanel();
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
         this.shibatongren.showYNequipselect(true);
      }
      
      public function showSelectJianBarSBTR() : void
      {
         this.shibatongren.showSelectJianBar();
      }
      
      public function requestShowZhanqi() : void
      {
         dispatchEvent(new Event(GETZHANQI));
      }
      
      public function permitZhanQi(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.zhanqiButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.zhanqi,0);
            this.zhanqiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.zhanqiButton);
            this.btnArray1.push(this.zhanQiObj);
            this.showZhanqi();
         }
         else if(!param1 && this.zhanqiButton.hasEventListener(MouseEvent.CLICK))
         {
            this.zhanqiButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.zhanqi);
            this.removeDisplayObject(this.zhanqiButton);
            _loc2_ = this.btnArray1.indexOf(this.zhanQiObj);
            if(_loc2_ >= 0)
            {
               this.btnArray1.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showZhanqi() : void
      {
         this.initCharPanel(1,"6");
      }
      
      public function setZhanqiItems(param1:Array) : void
      {
         this.zhanqi.setShowItem(true,param1);
         this.zhanqi.setTotal(GameState.dictMainStatus[40626]);
      }
      
      public function setTotalZhanQi(param1:Boolean) : void
      {
         this.zhanqi.setTotal(param1);
      }
      
      public function requestZhanQi() : void
      {
         dispatchEvent(new Event(GETZHANQI));
      }
      
      public function setZhanQiHuanZ(param1:Boolean) : void
      {
         this.zhanqi.ishuanz(param1);
      }
      
      public function requestShowLiuMaiShenJian() : void
      {
         dispatchEvent(new Event(LIUMAISHENJIAN));
      }
      
      public function permitLiuMaiShenJian(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.liumaishenjianButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.liumaishenjian,0);
            this.liumaishenjianButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.liumaishenjianButton);
            this.btnArray2.push(this.liuMaiObj);
            this.showLiuMaiShenJian();
         }
         else if(!param1 && this.liumaishenjianButton.hasEventListener(MouseEvent.CLICK))
         {
            this.liumaishenjianButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.liumaishenjian);
            this.removeDisplayObject(this.liumaishenjianButton);
            _loc2_ = this.btnArray2.indexOf(this.liuMaiObj);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestLiuMai() : void
      {
         dispatchEvent(new Event(LIUMAISHENJIAN));
      }
      
      public function showLiuMaiShenJian() : void
      {
         this.initCharPanel(2,"10");
      }
      
      public function setLiumaishenjianJianshuBtn(param1:Array) : void
      {
         this.liumaishenjian.setJianshuBtn(param1);
      }
      
      public function menuLiumaishenjianJianToolTip(param1:Array) : void
      {
         this.liumaishenjian.menuToolTip(param1);
      }
      
      public function setLiumaishenjianSkill(param1:Array) : void
      {
         this.liumaishenjian.setSkill(param1,true);
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
      
      public function lmsjJiHuoStatus(param1:Boolean) : void
      {
         this.liumaishenjian.setJiHuo(param1,true);
      }
      
      public function reManbanBo() : Boolean
      {
         return this.liumaishenjian.reManbanBo();
      }
      
      public function ShowTupo(param1:Boolean) : void
      {
         this.liumaishenjian.onShowLv(param1);
      }
      
      public function setLiumaishenjianTupoInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:String) : void
      {
         this.liumaishenjian.setTupoInitialize(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setLiumaishenjianTupoZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.liumaishenjian.setTupoZhufuzhi(param1,param2,param3);
      }
      
      public function setLiumaishenjianTupoGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.liumaishenjian.setTupoGoods(param1,param2);
      }
      
      public function setLiumaishenjianTupoBtn(param1:Boolean) : void
      {
         this.liumaishenjian.setTupoBtn(param1);
      }
      
      public function set_WuXingZhiRen(param1:Array) : void
      {
         this.wuXingZhiRen.set_WuXingZhiRen(param1);
      }
      
      public function setZhuangbei2(param1:Array) : void
      {
         this.wuXingZhiRen.setZhuangbei2(param1);
      }
      
      public function requestShowWuXingZhiRen() : void
      {
         dispatchEvent(new Event(WUXINGZHIREN));
      }
      
      public function permitWuXingZhiRen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.wuXingZhiRenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.wuXingZhiRen,0);
            this.wuXingZhiRenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.wuXingZhiRenButton);
            this.btnArray3.push(this.wuXingZhiRenObj);
            this.initCharPanel(3,"4");
         }
         else if(!param1 && this.wuXingZhiRenButton.hasEventListener(MouseEvent.CLICK))
         {
            this.wuXingZhiRenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.wuXingZhiRenButton);
            this.removeDisplayObject(this.wuXingZhiRen);
            _loc2_ = this.btnArray3.indexOf(this.wuXingZhiRenObj);
            if(_loc2_ >= 0)
            {
               this.btnArray3.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestWuXingZhiRen() : void
      {
         dispatchEvent(new Event(WUXINGZHIREN));
      }
      
      public function wuxingzhirenHZ(param1:Boolean) : void
      {
         this.wuXingZhiRen.wuxingzhirenHZ(param1);
      }
      
      public function showWuXingZhiRen(param1:Boolean = false) : void
      {
         this.initCharPanel(3,"4");
      }
      
      public function setYunInitializeWuXingZhiRen(param1:Array, param2:String, param3:int, param4:int, param5:Boolean) : void
      {
         this.wuXingZhiRen.setYunInitializeWuXingZhiRen(true,param1,param2,param3,param4,param5);
      }
      
      public function setWuXingTimerText(param1:Number) : void
      {
         this.wuXingZhiRen.setTimerText(param1);
      }
      
      public function WuXingZhiRenShow(param1:Boolean) : void
      {
         this.wuXingZhiRen.showWuXingZhiRenApd(param1);
      }
      
      public function showKaiQiTiShi(param1:int) : void
      {
         this.wuXingZhiRen.showKaiQiTiShi(param1);
      }
      
      public function permitJinZhongZhao(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.jinzhongzhaoButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.jinzhongzhao,0);
            this.jinzhongzhaoButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.jinzhongzhaoButton);
            this.btnArray2.push(this.jinZhongZhaoObj);
            this.showJinZhongZhao();
         }
         else if(!param1 && this.jinzhongzhaoButton.hasEventListener(MouseEvent.CLICK))
         {
            this.jinzhongzhaoButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.jinzhongzhao);
            this.removeDisplayObject(this.jinzhongzhaoButton);
            _loc2_ = this.btnArray2.indexOf(this.jinZhongZhaoObj);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestJinZhongZhao() : void
      {
         dispatchEvent(new BaseEvent(JINZHONGZHAO));
      }
      
      public function showJinZhongZhao() : void
      {
         this.initCharPanel(2,"12");
      }
      
      public function initilizeUIJZZ(param1:String, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean) : void
      {
         this.jinzhongzhao.initilizeUI(param1,param2,param3,param4,param5,param6,param7,param8);
         this.jinzhongzhao.setDingJiJiHuo(true);
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
      
      public function showJinZhongZhaoLingWuPanel(param1:Boolean) : void
      {
         this.jinzhongzhao.showJinZhongZhaoLingWuPanel(param1);
      }
      
      public function setInitializeJZZ(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.jinzhongzhao.showJinZhongZhaoLingWuPanel(true);
         this.jinzhongzhao.setInitialize(param1,param2,param3,param4,param5,param6);
      }
      
      public function setJinZhongZhaoZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.jinzhongzhao.setZhufuzhi(param1,param2,param3);
      }
      
      public function setJinZhongZhaoGoods(param1:Goods, param2:Boolean) : void
      {
         this.jinzhongzhao.setGoods(param1,param2);
      }
      
      public function setShuomingJZZ(param1:String) : void
      {
         this.jinzhongzhao.setShuoming(param1);
      }
      
      public function setBtnJZZ(param1:Boolean) : void
      {
         this.jinzhongzhao.setBtn(param1);
      }
      
      public function closeMiniPanelJZZ() : void
      {
         this.jinzhongzhao.closeMiniPanel();
      }
      
      public function bofangYH() : void
      {
         this.jinzhongzhao.bofangYanhua();
      }
      
      public function lockOnJZZ() : void
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
      
      public function jinzhongzhaoVisible() : Boolean
      {
         return this.jinzhongzhao.visible;
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
      
      public function permitXiuWei(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.xiuweiButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.xiuwei,0);
            this.xiuweiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.xiuweiButton);
            this.btnArray1.push(this.xiuWeiObj);
            this.showXiuWei();
         }
         else if(!param1 && this.xiuweiButton.hasEventListener(MouseEvent.CLICK))
         {
            this.xiuweiButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.xiuwei);
            this.removeDisplayObject(this.xiuweiButton);
            _loc2_ = this.btnArray1.indexOf(this.xiuWeiObj);
            if(_loc2_ >= 0)
            {
               this.btnArray1.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showXiuWei() : void
      {
         this.initCharPanel(1,"7");
      }
      
      public function requestShowXiuWei() : void
      {
         dispatchEvent(new Event(GETXIUWEI));
      }
      
      public function setXiuweiInitializeText(param1:String, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Boolean, param10:Boolean) : void
      {
         this.xiuwei.setInitializeText(param1,param2,param3,param4,param5,param6,param7,param8,true,param9,param10);
      }
      
      public function setXiuweiGoods(param1:Goods, param2:String, param3:int, param4:Boolean) : void
      {
         this.xiuwei.setGoods(param1,param2,param3,param4);
      }
      
      public function setXiuweiJinduNum(param1:int, param2:int, param3:int, param4:int) : *
      {
         this.xiuwei.setJinduNum(param1,param2,param3,param4);
      }
      
      public function setXiuweiZhaoShiMsg(param1:String, param2:int, param3:int) : void
      {
         this.xiuwei.setZhaoShiMsg(param1,param2,param3);
      }
      
      public function setXiuweiBtn(param1:Boolean) : void
      {
         this.xiuwei.setBtn(param1);
      }
      
      public function bofangXiuweiYanhua() : void
      {
         this.xiuwei.bofangYanhua();
      }
      
      public function reXiuwei() : Boolean
      {
         return this.tabBar.currentLabel && this.tabBar.currentLabel == LanResManager.getLanCommonTextWords("角色") && this.xiuweiButton.skin == "selectButton" && this.xiuwei.visible;
      }
      
      public function setXiuweiDingJiShuXing(param1:Boolean) : void
      {
         this.xiuwei.setDingJiShuXing(param1);
      }
      
      public function setXiuWeiJiHuo(param1:Boolean) : void
      {
         this.xiuwei.setJiHuo(param1);
      }
      
      public function setXiuWeiHuanZhuang(param1:Boolean) : void
      {
         this.xiuwei.huanzhuang(param1);
      }
      
      public function requestXiuWei() : void
      {
         dispatchEvent(new BaseEvent(GETXIUWEI));
      }
      
      public function permitZhanHun(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.zhanhunButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.zhanhun,0);
            this.zhanhunButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.zhanhunButton);
            this.btnArray1.push(this.zhanHunObj);
            this.showZhanhun();
         }
         else if(!param1 && this.zhanhunButton.hasEventListener(MouseEvent.CLICK))
         {
            this.zhanhunButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.zhanhun);
            this.removeDisplayObject(this.zhanhunButton);
            _loc2_ = this.btnArray1.indexOf(this.zhanHunObj);
            if(_loc2_ >= 0)
            {
               this.btnArray1.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showZhanhun() : void
      {
         this.initCharPanel(1,"8");
      }
      
      public function isZhanHunHuanZhuang(param1:Boolean) : void
      {
         this.zhanhun.isZhanHunHuanZhuang(param1);
         this.zhanhun.setJiHuo(true);
      }
      
      public function getZhanhunVis() : Boolean
      {
         return this.zhanhun.visible;
      }
      
      public function setZhanhunQingqiu() : void
      {
         dispatchEvent(new BaseEvent(UI_ZHUANGBEI_CLICK,"",-1));
      }
      
      public function setZhanhunBtn(param1:int) : void
      {
         this.zhanhun.setBtn(param1);
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
         this.zhanhun.setShuxingNum(param1,param2,true);
      }
      
      public function setShuxingVis(param1:Boolean) : void
      {
         this.zhanhun.setShuxingVis(param1);
      }
      
      public function requestZhanHun() : void
      {
         dispatchEvent(new BaseEvent(GETZHANHUN));
      }
      
      public function set_TaiXuanShenGong(param1:Array) : void
      {
         this.taiXuanShenGong.set_TaiXuanShenGong(param1);
      }
      
      public function permitTaiXuanShenGong(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.taiXuanShenGongButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.taiXuanShenGong,0);
            this.taiXuanShenGongButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.taiXuanShenGongButton);
            this.btnArray2.push(this.taiXuanObj);
            this.showTaiXuanShenGong();
         }
         else if(!param1 && this.taiXuanShenGongButton.hasEventListener(MouseEvent.CLICK))
         {
            this.taiXuanShenGongButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.taiXuanShenGong);
            this.removeDisplayObject(this.taiXuanShenGongButton);
            _loc2_ = this.btnArray2.indexOf(this.taiXuanObj);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestTaiXuanShenGong() : void
      {
         dispatchEvent(new BaseEvent(GETTAIXUANSHENGONG));
      }
      
      public function showTaiXuanShenGong() : void
      {
         this.initCharPanel(2,"13");
      }
      
      public function setTaiXuanShenGongInitialize(param1:TaiXuanShenGongVO) : void
      {
         this.taiXuanShenGong.setInitialize(true,param1);
      }
      
      public function setTaiXuanShenGongLingwuInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:String) : void
      {
         this.taiXuanShenGong.setTaiXuanShenGongLingwuInitialize(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setTaiXuanShenGongLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.taiXuanShenGong.setTaiXuanShenGongLingwuZhufuzhi(param1,param2,param3);
      }
      
      public function setTaiXuanShenGongLingwuJiyuanzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.taiXuanShenGong.setTaiXuanShenGongLingwuJiyuanzhi(param1,param2,param3);
      }
      
      public function setTaiXuanShenGongLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.taiXuanShenGong.setTaiXuanShenGongLingwuGoods(param1,param2);
      }
      
      public function setTaiXuanShenGongLingwuBtn(param1:Boolean) : void
      {
         this.taiXuanShenGong.setTaiXuanShenGongLingwuBtn(param1);
      }
      
      public function showTaiXuanShenGongLingWuPanel(param1:Boolean) : void
      {
         this.taiXuanShenGong.onShowLv(param1);
      }
      
      public function isTaiXuanShenGongtupoCanvasShow() : Boolean
      {
         return this.taiXuanShenGong.isTaiXuanShenGongtupoCanvasShow();
      }
      
      public function set_BeiMingShenGong(param1:Array) : void
      {
         this.beiMingShenGong.set_BeiMingShenGong(param1);
      }
      
      public function requestShowBeiMingShenGong() : void
      {
         dispatchEvent(new BaseEvent(GETBEIMINGSHENGONG));
      }
      
      public function permitBeiMingShenGong(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.beiMingShenGongButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.beiMingShenGong,0);
            this.beiMingShenGongButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.beiMingShenGongButton);
            this.btnArray2.push(this.beiMingObj);
            this.showBeiMingShenGong();
         }
         else if(!param1 && this.beiMingShenGongButton.hasEventListener(MouseEvent.CLICK))
         {
            this.beiMingShenGongButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.beiMingShenGong);
            this.removeDisplayObject(this.beiMingShenGongButton);
            _loc2_ = this.btnArray2.indexOf(this.beiMingObj);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestBeiMingShenGong() : void
      {
         dispatchEvent(new BaseEvent(GETBEIMINGSHENGONG));
      }
      
      public function showBeiMingShenGong() : void
      {
         this.initCharPanel(2,"14");
      }
      
      public function initializateBmsgPanel(param1:BeiMingShenGongVO) : void
      {
         this.beiMingShenGong.initializateBmsgPanel(true,param1);
      }
      
      public function setBeiMingShenGongAvatar(param1:BitmapData) : void
      {
         this.beiMingShenGong.avatar = param1;
      }
      
      public function setBeiMingShenGongInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.beiMingShenGong.setInitialize(param1,param2,param3,param4,param5,param6);
      }
      
      public function setBeiMingShenGongZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.beiMingShenGong.setZhufuzhi(param1,param2,param3);
      }
      
      public function setBeiMingShenGongGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.beiMingShenGong.setGoods(param1,param2);
      }
      
      public function setBeiMingShenGongShuoming(param1:String, param2:String) : void
      {
         this.beiMingShenGong.setShuoming(param1,param2);
      }
      
      public function setBeiMingShenGongBtn(param1:Boolean) : void
      {
         this.beiMingShenGong.setBtn(param1);
      }
      
      public function setBeiMingShenGongUse(param1:Boolean) : void
      {
         this.beiMingShenGong.showBeiMingShenGongApd(param1);
      }
      
      public function showBeiMingShenGongLingWuPanel(param1:*) : void
      {
         this.beiMingShenGong.onShowLv(param1);
      }
      
      public function setBeiMingShenGongLVInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.beiMingShenGong.setInitialize(param1,param2,param3,param4,param5,param6);
      }
      
      public function isBeiMingShenGongLVShow() : Boolean
      {
         return this.beiMingShenGong.isBeiMingShenGongtupoCanvasShow();
      }
      
      public function permitQiShangQuan(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.qiShangQuanButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.qiShangQuan,0);
            this.qiShangQuanButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.qiShangQuanButton);
            this.btnArray2.push(this.qiShangQuanObj);
            this.showQiShangQuan();
         }
         else if(!param1 && this.qiShangQuanButton.hasEventListener(MouseEvent.CLICK))
         {
            this.qiShangQuanButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.qiShangQuan);
            this.removeDisplayObject(this.qiShangQuanButton);
            _loc2_ = this.btnArray2.indexOf(this.qiShangQuanObj);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showQiShangQuan() : void
      {
         this.initCharPanel(2,"15");
      }
      
      public function requestShowQiShangQuanPanel() : void
      {
         dispatchEvent(new BaseEvent(GETQISHANGQUAN));
      }
      
      public function setQiShangQuanInitializeText(param1:String, param2:int) : void
      {
         this.qiShangQuan.setInitializeText(true,param1,param2);
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
      
      public function setQiShangQuanBtn(param1:Boolean) : void
      {
         this.qiShangQuan.setBtn(param1);
      }
      
      public function bofangQiShangQuanYanhua() : void
      {
         this.qiShangQuan.bofangYanhua();
      }
      
      public function reQiShangQuan() : Boolean
      {
         return this.tabBar.currentLabel && this.tabBar.currentLabel == LanResManager.getLanCommonTextWords("功法") && this.qiShangQuanButton.skin == "selectButton" && this.qiShangQuan.visible;
      }
      
      public function removeQiShangQuanShuoming() : void
      {
         this.qiShangQuan.removeShuoming();
      }
      
      public function permitSiLingZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.siLingZhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChild(this.siLingZhen);
            this.siLingZhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.siLingZhenButton);
            this.btnArray4.push(this.siLingZhenObj);
            this.showSiLingZhen();
         }
         else if(!param1 && this.siLingZhenButton.hasEventListener(MouseEvent.CLICK))
         {
            this.siLingZhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.siLingZhen);
            this.removeDisplayObject(this.siLingZhenButton);
            _loc2_ = this.btnArray4.indexOf(this.siLingZhenObj);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowSiLingZhen() : void
      {
         dispatchEvent(new BaseEvent(GETSILINGZHEN));
      }
      
      public function showSiLingZhen() : void
      {
         this.initCharPanel(4,"2");
      }
      
      public function set_SLZ_HDZB(param1:Array) : void
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
      
      public function setSiLingZhenBuffAvatar(param1:int) : void
      {
         this.siLingZhen.setBuffAvatar(true,param1);
      }
      
      public function setSiLingZhenData(param1:Array, param2:int = 0, param3:int = 1) : void
      {
         this.siLingZhen.setData(param1,param2,param3);
      }
      
      public function setZhenyan(param1:int, param2:int, param3:int) : void
      {
         this.siLingZhen.setZhenyan(param1,param2,param3);
         this.siLingZhen.setxueshaJiHuo(true);
      }
      
      public function playSiLingZhenYanhua() : void
      {
         this.siLingZhen.bofangYanhua();
      }
      
      public function resetSiLingZhenAutoBtnLabel() : void
      {
         this.siLingZhen.resetAutoBtnLabel();
      }
      
      public function setUpgradePanelVisble(param1:Boolean) : void
      {
         this.siLingZhen.setUpgradePanelVisble(param1);
      }
      
      public function showUpgradePanel(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:Goods, param8:int, param9:int) : void
      {
         this.siLingZhen.showUpgradePanel(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function getUseGoodsType() : int
      {
         return this.siLingZhen.getUseGoodsType();
      }
      
      public function isSiLingZhenShow() : Boolean
      {
         return this.siLingZhen.isSiLingZhenShow();
      }
      
      public function requestShowShenZhaoJing() : void
      {
         dispatchEvent(new BaseEvent(SHENZHAOJING));
      }
      
      public function permitShenZhaoJing(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.shenzhaojingButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.shenzhaojing,0);
            this.shenzhaojingButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.shenzhaojingButton);
            this.btnArray2.push(this.shenzhaojingObj);
            this.showShenzhaojing();
         }
         else if(!param1 && this.shenzhaojingButton.hasEventListener(MouseEvent.CLICK))
         {
            this.shenzhaojingButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.shenzhaojing);
            this.removeDisplayObject(this.shenzhaojingButton);
            _loc2_ = this.btnArray2.indexOf(this.shenzhaojingObj);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShenZhaoJing() : void
      {
         dispatchEvent(new BaseEvent(SHENZHAOJING));
      }
      
      public function showShenzhaojing(param1:Boolean = false) : void
      {
         this.initCharPanel(2,"2");
      }
      
      public function setShenZhaoJingInit(param1:ShenzhaojingVO) : void
      {
         var _loc2_:Array = null;
         this.shenzhaojing.setDengji(param1.szjCkCsNum + LanResManager.getLanCommonTextWords("层") + "(" + param1.szjCkDsNum + "/" + LanResManager.getLanCommonTextWords("5段") + ")");
         this.shenzhaojing.setJindu(true,param1.nowJinduNum,param1.maxJinduNum,param1.szjLwCsNum,param1.szjCkCsNum,param1.szjLwDsNum,param1.szjCkDsNum);
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
         this.shenzhaojing.huanzhuang(param1.huanzhuang,param1.isDanTian);
      }
      
      public function setShenZhaoJingJindu(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         this.shenzhaojing.setJindu(true,param1,param2,param3,param4,param5,param6);
      }
      
      public function setShenZhaoJingSkill(param1:Skill) : void
      {
         this.shenzhaojing.setSkill(param1,param1.res.desc);
      }
      
      public function setShenZhaoJingShuxing(param1:ShenzhaojingVO) : void
      {
         var _loc2_:Array = null;
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
      }
      
      public function showShenZhaoJingTisuPanel(param1:String, param2:String, param3:int, param4:int, param5:Goods) : void
      {
         if(!this.shenzhaojingTisu)
         {
            this.shenzhaojingTisu = new ShenZhaoJingTisuPanel();
            this.shenzhaojingTisu.$parent = this;
         }
         this.shenzhaojingTisu.visible = true;
         this.shenzhaojingTisu.setDangqianInitialize(param1,param2,param3,param4,param5);
         GameInstance.uiInstance.uiContainer.addChild(this.shenzhaojingTisu);
         this.shenzhaojingTisu.x = (GameConfig.sceneWidth - this.shenzhaojingTisu.width) / 2;
         this.shenzhaojingTisu.y = (GameConfig.sceneHeight - this.shenzhaojingTisu.height) / 2;
      }
      
      public function CloseShenZhaoJingXiuliantisuPanel() : void
      {
         this.shenzhaojingTisu.onCloseFun();
      }
      
      public function setShenZhaoJingLingwuInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.shenzhaojing.setJiujianLingwuInitialize(param1,param2,param3,param4,param5,param6);
      }
      
      public function IsShow() : Boolean
      {
         return this.shenzhaojing.istupoCanvasShow();
      }
      
      public function setShenZhaoJingonShowLv(param1:Boolean) : void
      {
         this.shenzhaojing.onShowLv(param1);
      }
      
      public function setShenZhaoJingLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.shenzhaojing.setJiujianLingwuZhufuzhi(param1,param2,param3);
      }
      
      public function setShenZhaoJingLingwuGoods(param1:Goods) : void
      {
         this.shenzhaojing.setJiujianLingwuGoods(param1);
      }
      
      public function setShenZhaoJingLingwuShuoming(param1:String) : void
      {
         this.shenzhaojing.setJiujianLingwuShuoming(param1);
      }
      
      public function setShenZhaoJingnLingwuBtn(param1:Boolean) : void
      {
         this.shenzhaojing.setJiujianLingwuBtn(param1);
      }
      
      public function bofangShenZhaoJingYanhua() : void
      {
         this.shenzhaojing.bofangDuguYanhua();
      }
      
      public function setStarSta(param1:int) : void
      {
         this.charContainer.setStarSta(param1);
      }
      
      public function setStatusByString(param1:String) : void
      {
         this.charContainer.setStatusByString(param1);
      }
      
      public function setDiZiData(param1:String, param2:String, param3:int) : void
      {
         this.charContainer.setDiZiData(param1,param2,param3);
      }
      
      public function permitZiXiaShenGong(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.zixiashengongButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.zixiashengong,0);
            this.zixiashengongButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.zixiashengongButton);
            this.btnArray2.push(this.ziXiaObj);
            this.showZiXiaShenGong();
         }
         else if(!param1 && this.zixiashengongButton.hasEventListener(MouseEvent.CLICK))
         {
            this.zixiashengongButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.zixiashengong);
            this.removeDisplayObject(this.zixiashengongButton);
            _loc2_ = this.btnArray2.indexOf(this.ziXiaObj);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showZiXiaShenGong() : void
      {
         this.initCharPanel(2,"16");
      }
      
      public function requestShowZiXiaShenGong() : void
      {
         dispatchEvent(new BaseEvent(GETZIXIASHENGONG));
      }
      
      public function setZiXiaShenGongInitialize(param1:Array, param2:int) : void
      {
         this.zixiashengong.setInitialize(true,param1,param2);
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
      
      public function onZiXiaShenGongShowLv(param1:Boolean) : void
      {
         this.zixiashengong.onShowLv(param1);
      }
      
      public function setZixiaInitializeTupo(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.zixiashengong.setZixiaInitializeTupo(param1,param2,param3,param4,param5,param6);
      }
      
      public function setZiXiaShenGongZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.zixiashengong.setZhufuzhi(param1,param2,param3);
      }
      
      public function setZiXiaShenGongGoods(param1:Goods) : void
      {
         this.zixiashengong.setGoods(param1);
      }
      
      public function setZiXiaShenGongBtn(param1:Boolean) : void
      {
         this.zixiashengong.setBtn(param1);
      }
      
      public function ZixiaEffectShow(param1:Boolean) : void
      {
         this.zixiashengong.setShow(param1);
      }
      
      public function set_QiMenZhen(param1:Array) : void
      {
         this.qimenzhen.set_QiMenZhen(param1);
      }
      
      public function permitQiMenZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.qimenzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.qimenzhen,0);
            this.qimenzhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.qimenzhenButton);
            this.btnArray4.push(this.qiMenZhenObj);
            this.showQiMenZhen();
         }
         else if(!param1 && this.qimenzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            this.qimenzhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.qimenzhen);
            this.removeDisplayObject(this.qimenzhenButton);
            _loc2_ = this.btnArray4.indexOf(this.qiMenZhenObj);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showQiMenZhen() : void
      {
         this.initCharPanel(4,"1");
      }
      
      public function requestShowQiMenZhen() : void
      {
         dispatchEvent(new BaseEvent(GETQIMENZHEN));
      }
      
      public function setQiMenZhenInitializeText(param1:String, param2:int) : void
      {
         this.qimenzhen.setInitializeText(true,param1,param2);
      }
      
      public function setQiMenZhenFanBei(param1:int, param2:Boolean) : void
      {
         this.qimenzhen.setFanBei(param1,param2);
      }
      
      public function setZuoQi(param1:Boolean, param2:Boolean, param3:Boolean) : void
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
      
      public function setQiMenZhenBtn(param1:Boolean) : void
      {
         this.qimenzhen.setBtn(param1);
      }
      
      public function bofangQiMenZhenYanhua() : void
      {
         this.qimenzhen.bofangYanhua();
      }
      
      public function set_QMDJ(param1:Boolean) : void
      {
         var _loc2_:Skill = null;
         _loc2_ = new Skill(200141);
         _loc2_.isLearn = 1;
         this.qimenzhen.set_QMDJ(param1,_loc2_);
      }
      
      public function reQiMenZhen() : Boolean
      {
         return this.tabBar.currentLabel && this.tabBar.currentLabel == LanResManager.getLanCommonTextWords("阵法") && this.qimenzhenButton.skin == "selectButton" && this.qimenzhen.visible;
      }
      
      public function removeQiMenZhenShuoming() : void
      {
         this.qimenzhen.removeShuoming();
      }
      
      public function requestXiangLong() : void
      {
         dispatchEvent(new Event(XIANGLONGSHIBAZHANG_SHOW));
      }
      
      public function requestJingZhongZhao() : void
      {
         dispatchEvent(new Event(JINZHONGZHAO));
      }
      
      public function requestBaGuaZhang() : void
      {
         dispatchEvent(new Event(GETDUANZAOROUSHENB));
      }
      
      public function requestSiLingZhen() : void
      {
         dispatchEvent(new Event(GETSILINGZHEN));
      }
      
      public function showHaMaGong() : void
      {
         this.initCharPanel(2,"17");
      }
      
      public function requestShowHamagong() : void
      {
         dispatchEvent(new BaseEvent(HAMAGONG));
      }
      
      public function setHaMaGongInitialize(param1:HaMaGongVO) : void
      {
         this.hamagong.initilizeUI(true,param1);
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
      
      public function permitHaMaGong(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.hamagongButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.hamagong,0);
            this.hamagongButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.hamagongButton);
            this.objHaMaGong = new Object();
            this.objHaMaGong.neirong = this.hamagong;
            this.objHaMaGong.biaoqian = this.hamagongButton;
            this.objHaMaGong.name = "17";
            this.objHaMaGong.isShow = true;
            this.objHaMaGong.dengji = -1;
            this.btnArray2.push(this.objHaMaGong);
            this.initCharPanel(2,"17");
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
            _loc2_ = this.btnArray2.indexOf(this.objHaMaGong);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function initTianFuSystem() : void
      {
         var _loc1_:Object = null;
         if(!this.tianFuButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.tianFu,0);
            this.tianFuButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.tianFuButton);
            _loc1_ = new Object();
            _loc1_ = new Object();
            _loc1_.neirong = this.tianFu;
            _loc1_.biaoqian = this.tianFuButton;
            _loc1_.name = "11";
            _loc1_.isShow = true;
            _loc1_.dengji = -1;
            this.btnArray1.push(_loc1_);
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(1,"11");
         }
      }
      
      public function permitTianFu(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.tianFuButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.tianFu,0);
            this.tianFuButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.tianFuButton);
            this.btnArray1.push(this.tianFuObj);
            this.showTianFu();
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
         }
         else if(!param1 && this.tianFuButton.hasEventListener(MouseEvent.CLICK))
         {
            this.tianFuButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.tianFu);
            this.removeDisplayObject(this.tianFuButton);
            _loc2_ = this.btnArray1.indexOf(this.tianFuObj);
            if(_loc2_ >= 0)
            {
               this.btnArray1.splice(_loc2_,1);
            }
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
         }
      }
      
      public function requestTianFu() : void
      {
         dispatchEvent(new BaseEvent(GETTIANFU));
      }
      
      public function showTianFu() : void
      {
         this.initCharPanel(1,"11");
      }
      
      public function setTianFuData(param1:Boolean, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:int, param10:Boolean, param11:Boolean, param12:Boolean, param13:int) : void
      {
         this.tianFu.setData(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13);
      }
      
      public function setTianFuGoods(param1:Array) : void
      {
         this.tianFu.setGoods(param1);
      }
      
      public function setTianFuShuaXinNum(param1:int) : void
      {
         this.tianFu.setShuaXinNum(param1);
      }
      
      public function setTianFuTuiMingNum(param1:int) : void
      {
         this.tianFu.setTuiMingNum(param1);
      }
      
      public function setTianFuJiHuo(param1:Boolean) : void
      {
         this.tianFu.setJiHuo(param1);
      }
      
      public function tianfu_huanzhuang(param1:Boolean) : void
      {
         this.tianFu.tianfu_huanzhuang(param1);
      }
      
      public function setTianFuTurn(param1:int = 0, param2:int = 0, param3:int = 5, param4:int = 1080) : void
      {
         this.tianFu.setTurn(param1,param2,param3,param4);
      }
      
      public function tianFuLingQuGoods() : void
      {
         this.tianFu.lingQuGoods();
      }
      
      public function permitWuXingZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.wuXingZhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.wuXingZhen,0);
            this.wuXingZhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.wuXingZhenButton);
            this.btnArray4.push(this.wuXingZhenObj);
            this.showWuXingZhen();
         }
         else if(!param1 && this.wuXingZhenButton.hasEventListener(MouseEvent.CLICK))
         {
            this.wuXingZhenButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.wuXingZhen);
            this.removeDisplayObject(this.wuXingZhenButton);
            _loc2_ = this.btnArray4.indexOf(this.wuXingZhenObj);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestWuXingZhen() : void
      {
         dispatchEvent(new BaseEvent(GETWUXINGZHEN));
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
         this.wuXingZhen.setPanel(false,param1,param2,param3,param4,param5,param6,param7,param8,param9,true,param10);
      }
      
      public function setWuXingZhenTuPoPanel(param1:int, param2:Goods, param3:int, param4:int, param5:int, param6:int, param7:int = 0) : void
      {
         this.wuXingZhen.setTupoPanel(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function showWuXingZhenTupo(param1:Boolean) : void
      {
         this.wuXingZhen.showTupoPanel(param1);
      }
      
      public function setWuXingZhenTupoBtn(param1:Boolean) : void
      {
         this.wuXingZhen.setTuPoPanelBtn(param1);
      }
      
      public function isShowWuXingZhenTupoPanel() : Boolean
      {
         return this.wuXingZhen.isShowTupo();
      }
      
      public function set_ZhuXunzhang(param1:Array) : void
      {
         this.wuXingZhen.set_ZhuXunzhang(param1);
      }
      
      public function set_WuXingZhen(param1:Array) : void
      {
         this.wuXingZhen.set_WuXingZhenXunZhang(param1);
      }
      
      public function setWuXingZhenJiHuo(param1:Boolean) : void
      {
         this.wuXingZhen.setJiHuo(param1);
      }
      
      public function set_ChiXueMoZhen(param1:Array) : void
      {
         this.chiXueMoZhen.set_ChiXueMoZhen(param1);
      }
      
      public function permitChiXueMoZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.chiXueMoZhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.chiXueMoZhen,0);
            this.chiXueMoZhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.chiXueMoZhenButton);
            this.btnArray4.push(this.objChiXueMoZhen);
            this.showChiXueMoZhen();
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
            _loc2_ = this.btnArray4.indexOf(this.objChiXueMoZhen);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showChiXueMoZhen() : void
      {
         this.initCharPanel(4,"5");
      }
      
      public function setChiXueMoZhenInit(param1:int, param2:String, param3:int, param4:Array, param5:int, param6:int, param7:int, param8:int, param9:int, param10:Boolean, param11:int, param12:Boolean, param13:Boolean, param14:int, param15:Boolean, param16:Boolean, param17:Boolean, param18:Boolean) : void
      {
         this.chiXueMoZhen.initilizeUI(true,param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15,param16,param17,param18);
      }
      
      public function set_XSJC(param1:int) : void
      {
         this.chiXueMoZhen.set_XSJC(param1);
      }
      
      public function showChiXueMoZhenTupoPanel(param1:*) : void
      {
         this.chiXueMoZhen.showTuPoPanel(param1);
      }
      
      public function setChiXueMoZhenTupoPanel(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.chiXueMoZhen.setTupoInit(param1,param2,param3,param4,param5,param6);
      }
      
      public function setChiXueMoZhenZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.chiXueMoZhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setChiXueMoZhenGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.chiXueMoZhen.setGoods(param1,param2);
      }
      
      public function setChiXueMoZhenBtn(param1:Boolean) : void
      {
         this.chiXueMoZhen.setTuPoBtn(param1);
      }
      
      public function setChiXueMoZhenAvatar(param1:BitmapData) : void
      {
         this.chiXueMoZhen.avatar = param1;
      }
      
      public function requestShowChiXueMoZhen() : void
      {
         dispatchEvent(new BaseEvent(CHIXUEMOZHEN));
      }
      
      public function isChiXueMoZhenLVShow() : Boolean
      {
         return this.chiXueMoZhen.isTupoCanvasShow();
      }
      
      public function isChiXueMoZhenShow() : Boolean
      {
         return this.chiXueMoZhen.visible;
      }
      
      public function showSanShiLiuShou() : void
      {
         this.initCharPanel(2,"18");
      }
      
      public function setSanShiLiuShouInit(param1:String, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:Boolean, param12:int, param13:Boolean) : void
      {
         this.sanShiLiuShou.setinitilizeUI(true,param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13);
      }
      
      public function showSanShiLiuShouTupoPanel(param1:*) : void
      {
         this.sanShiLiuShou.showTuPoPanel(param1);
      }
      
      public function setSanShiLiuShouTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.sanShiLiuShou.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setSanShiLiuShouZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.sanShiLiuShou.setZhufuzhi(param1,param2,param3);
      }
      
      public function setSanShiLiuShouGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.sanShiLiuShou.setGoods(param1,param2);
      }
      
      public function setSanShiLiuShouBtn(param1:Boolean) : void
      {
         this.sanShiLiuShou.setTuPoBtn(param1);
      }
      
      public function permitSanShiLiuShou(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.sanShiLiuShouButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.sanShiLiuShou,0);
            this.sanShiLiuShouButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.sanShiLiuShouButton);
            this.btnArray2.push(this.objSanShiLiuShou);
            this.initCharPanel(2,"18");
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
            _loc2_ = this.btnArray2.indexOf(this.objSanShiLiuShou);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowSanShiLiuShou() : void
      {
         dispatchEvent(new BaseEvent(SANSHILIUSHOU));
      }
      
      public function isSanShiLiuShouLVShow() : Boolean
      {
         return this.sanShiLiuShou.isTupoCanvasShow();
      }
      
      public function isSanShiLiuShouShow() : Boolean
      {
         return this.sanShiLiuShou.visible;
      }
      
      public function set_BeiDouQiXingZhen(param1:Array) : void
      {
         this.beidouqixing.set_BeiDouQiXingZhen(param1);
      }
      
      public function showBeiDouQiXing() : void
      {
         this.initCharPanel(4,"6");
      }
      
      public function requestBeiDouQiXing() : void
      {
         dispatchEvent(new BaseEvent(BEIDOUQIXINGZHEN));
      }
      
      public function permitBeiDouQiXing(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.beidouqixingButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.beidouqixing,0);
            this.beidouqixingButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.beidouqixingButton);
            this.btnArray4.push(this.objBeiDouQiXing);
            this.showBeiDouQiXing();
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
            _loc2_ = this.btnArray4.indexOf(this.objBeiDouQiXing);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function initBeiDouQiXing(param1:Boolean, param2:int, param3:int, param4:Array, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean, param13:Boolean, param14:Boolean, param15:Boolean) : void
      {
         this.beidouqixing.setinitilizeUI(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15);
      }
      
      public function setBeiDouTupoInit(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.beidouqixing.setTupoInit(param1,param2,param3,param4,param5,param6);
      }
      
      public function setBeiDouZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.beidouqixing.setZhufuzhi(param1,param2,param3);
      }
      
      public function showBeiDouTuPoPanel(param1:Boolean) : void
      {
         this.beidouqixing.showTuPoPanel(param1);
      }
      
      public function setBeiDouZdtsBtnLabel(param1:Boolean) : void
      {
         this.beidouqixing.setZdtsBtnLabel(param1);
      }
      
      public function isBeiDouTupoCanvasShow() : Boolean
      {
         this.beidouqixing.isTupoCanvasShow();
         return false;
      }
      
      public function setBeiDouQiXingSkills(param1:Array) : void
      {
         this.beidouqixing.setSkillArr(param1);
      }
      
      public function setBeiDouQiXingGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.beidouqixing.setGoods(param1,param2);
      }
      
      public function showJinChanTuoQiao() : void
      {
         this.initCharPanel(2,"19");
      }
      
      public function setJinChanTuoQiaoInit(param1:Boolean, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:Boolean) : void
      {
         this.jinchantuoqiao.setinitilizeUI(true,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public function showJinChanTuoQiaoTupoPanel(param1:*) : void
      {
         this.jinchantuoqiao.showTuPoPanel(param1);
      }
      
      public function setJinChanTuoQiaoTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.jinchantuoqiao.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setJinChanTuoQiaoZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.jinchantuoqiao.setZhufuzhi(param1,param2,param3);
      }
      
      public function setJinChanTuoQiaoGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.jinchantuoqiao.setGoods(param1,param2);
      }
      
      public function setJinChanTuiQiaoBtn(param1:Boolean) : void
      {
         this.jinchantuoqiao.setTuPoBtn(param1);
      }
      
      public function permitJinChanTuoQiao(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.jinchantuoqiaoButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.jinchantuoqiao,0);
            this.jinchantuoqiaoButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.jinchantuoqiaoButton);
            this.btnArray2.push(this.objJinChanTuoQiao);
            this.initCharPanel(2,"19");
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
            _loc2_ = this.btnArray2.indexOf(this.objJinChanTuoQiao);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowJinChanTuoQiao() : void
      {
         dispatchEvent(new BaseEvent(JINCHANTUOQIAO));
      }
      
      public function isJinChanTuoQiaoLVShow() : Boolean
      {
         return this.jinchantuoqiao.isTupoCanvasShow();
      }
      
      public function isJinChanTuoQiaoShow() : Boolean
      {
         return this.jinchantuoqiao.visible;
      }
      
      public function set_JiuQuHuangHeZhen(param1:Array) : void
      {
         this.jiuquhuanghezhen.set_JiuQuHuangHeZhen(param1);
      }
      
      public function permitJiuQuHuangHeZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.jiuquhuangheButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.jiuquhuanghezhen,0);
            this.jiuquhuangheButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.jiuquhuangheButton);
            this.btnArray4.push(this.objJiuQuHuangHeZhen);
            this.initCharPanel(4,"7");
         }
         else if(!param1 && this.jiuquhuangheButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.jiuquhuanghezhen != null && this.jiuquhuanghezhen.parent != null)
            {
               this.jiuquhuanghezhen.parent.removeChild(this.jiuquhuanghezhen);
            }
            this.jiuquhuangheButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.jiuquhuangheButton != null && this.jiuquhuangheButton.parent != null)
            {
               this.jiuquhuangheButton.parent.removeChild(this.jiuquhuangheButton);
            }
            _loc2_ = this.btnArray4.indexOf(this.objJiuQuHuangHeZhen);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowJiuQuHuangHeZhen() : void
      {
         dispatchEvent(new BaseEvent(GETJIUQUHUANGHEZHEN));
      }
      
      public function showJiuQuHuangHeZhen() : void
      {
         this.initCharPanel(4,"7");
      }
      
      public function setJiuQuHuangHeZhenInitialize(param1:JiuQuHuangHeZhenVO) : void
      {
         this.jiuquhuanghezhen.setInitialize(true,param1);
      }
      
      public function setJiuquJiHuo(param1:Boolean) : void
      {
         this.jiuquhuanghezhen.setJiuquJiHuo(param1);
      }
      
      public function setJiuQuHuangHeZhenLingwuInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:String) : void
      {
         this.jiuquhuanghezhen.setJiuQuHuangHeZhenLingwuInitialize(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setJiuQuHuangHeZhenLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.jiuquhuanghezhen.setJiuQuHuangHeZhenLingwuZhufuzhi(param1,param2,param3);
      }
      
      public function setJiuQuHuangHeZhenLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.jiuquhuanghezhen.setJiuQuHuangHeZhenLingwuGoods(param1,param2);
      }
      
      public function setJiuQuHuangHeZhenLingwuBtn(param1:Boolean) : void
      {
         this.jiuquhuanghezhen.setJiuQuHuangHeZhenLingwuBtn(param1);
      }
      
      public function showJiuQuHuangHeZhenLingWuPanel(param1:Boolean) : void
      {
         this.jiuquhuanghezhen.onShowLv(param1);
      }
      
      public function isJiuQuHuangHeZhentupoCanvasShow() : Boolean
      {
         return this.jiuquhuanghezhen.isJiuQuHuangHetupoCanvasShow();
      }
      
      public function set_ZhenWuQiJieZhen(param1:Array) : void
      {
         this.zhenwuqijiezhen.set_ZhenWuQiJieZhen(param1);
      }
      
      public function permitZhenWuQiJieZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.zhenwuqijiezhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.zhenwuqijiezhen,0);
            this.zhenwuqijiezhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.zhenwuqijiezhenButton);
            this.btnArray4.push(this.objZhenWuQiJieZhen);
            this.initCharPanel(4,"8");
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
            _loc2_ = this.btnArray4.indexOf(this.objZhenWuQiJieZhen);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowZhenWuQiJieZhen() : void
      {
         dispatchEvent(new BaseEvent(ZHENWUQIJIEZHEN));
      }
      
      public function showZhenWuQiJieZhen() : void
      {
         this.initCharPanel(4,"8");
      }
      
      public function setZhenWuQiJieZhenInitialize(param1:ZhenWuQiJieZhenVO) : void
      {
         this.zhenwuqijiezhen.setInitialize(true,param1);
      }
      
      public function setZhenWuQiJieZhenLingwuInitialize(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.zhenwuqijiezhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhenWuQiJieZhenLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.zhenwuqijiezhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setZhenWuQiJieZhenLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.zhenwuqijiezhen.setGoods(param1,param2);
      }
      
      public function setZhenWuQiJieZhenLingwuBtn(param1:Boolean) : void
      {
         this.zhenwuqijiezhen.setTuPoBtn(param1);
      }
      
      public function showZhenWuQiJieZhenLingWuPanel(param1:Boolean) : void
      {
         this.zhenwuqijiezhen.showTuPoPanel(param1);
      }
      
      public function isZhenWuQiJieZhentupoCanvasShow() : Boolean
      {
         return this.zhenwuqijiezhen.isTupoCanvasShow();
      }
      
      public function showDouZhuanXingYi() : void
      {
         this.initCharPanel(2,"20");
      }
      
      public function setDouZhuanXingYiInit(param1:DouZhuanXingYiVO) : void
      {
         this.douzhuanxingyi.setInitialize(true,param1);
      }
      
      public function showDouZhuanXingYiTupoPanel(param1:*) : void
      {
         this.douzhuanxingyi.showTuPoPanel(param1);
      }
      
      public function setDouzhuangxingyiZhuangbei(param1:Array) : void
      {
         this.douzhuanxingyi.setDouzhuangxingyiZhuangbei(param1);
      }
      
      public function setDouZhuanXingYiTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.douzhuanxingyi.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setDouZhuanXingYiZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.douzhuanxingyi.setZhufuzhi(param1,param2,param3);
      }
      
      public function setDouZhuanXingYiGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.douzhuanxingyi.setGoods(param1,param2);
      }
      
      public function setDouZhuanXingYiBtn(param1:Boolean) : void
      {
         this.douzhuanxingyi.setTuPoBtn(param1);
      }
      
      public function permitDouZhuanXingYi(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.douzhuanxingyiButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.douzhuanxingyi,0);
            this.douzhuanxingyiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.douzhuanxingyiButton);
            this.btnArray2.push(this.objDouZhuanXingYi);
            this.initCharPanel(2,"20");
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
            _loc2_ = this.btnArray2.indexOf(this.objDouZhuanXingYi);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowDouZhuanXingYi() : void
      {
         dispatchEvent(new BaseEvent(DOUZHUANXINGYI));
      }
      
      public function isDouZhuanXingYiLVShow() : Boolean
      {
         return this.douzhuanxingyi.isTupoCanvasShow();
      }
      
      public function isDouZhuanXingYiShow() : Boolean
      {
         return this.douzhuanxingyi.visible;
      }
      
      public function showXunZhangYangCheng() : void
      {
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
         this.initCharPanel(1,"12");
      }
      
      public function setXunZhang(param1:Array) : void
      {
         this.xunzhangyangcheng.setXunZhang(param1);
      }
      
      public function permitXunZhangYangChen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.xunzhangyangchengButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.xunzhangyangcheng,0);
            this.xunzhangyangchengButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.xunzhangyangchengButton);
            this.btnArray1.push(this.xunZhangYangChengObj);
            this.showXunZhangYangCheng();
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
            _loc2_ = this.btnArray1.indexOf(this.xunZhangYangChengObj);
            if(_loc2_ >= 0)
            {
               this.btnArray1.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestXunZhangYangChen() : void
      {
         dispatchEvent(new BaseEvent(XUNZHANGYANGCHENG));
      }
      
      public function set_GuiLiuZhen(param1:Array) : void
      {
         this.guiliuzhen.set_GuiLiuZhen(param1);
      }
      
      public function permitGuiLiuZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(4,"9");
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
            _loc2_ = this.btnArray4.indexOf(this.objGuiLiuZhen);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowGuiLiuZhen() : void
      {
         dispatchEvent(new BaseEvent(GUILIUZHEN));
      }
      
      public function showGuiLiuZhen() : void
      {
         this.initCharPanel(4,"9");
      }
      
      public function setGuiLiuZhenInitialize(param1:GuiLiuZhenVO) : void
      {
         this.guiliuzhen.setInitialize(true,param1);
      }
      
      public function setGuiLiuZhenLingwuInitialize(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.guiliuzhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setGuiLiuZhenLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.guiliuzhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGuiLiuZhenLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.guiliuzhen.setGoods(param1,param2);
      }
      
      public function setGuiLiuZhenLingwuBtn(param1:Boolean) : void
      {
         this.guiliuzhen.setTuPoBtn(param1);
      }
      
      public function showGuiLiuZhenLingWuPanel(param1:Boolean) : void
      {
         this.guiliuzhen.showTuPoPanel(param1);
      }
      
      public function isGuiLiuZhentupoCanvasShow() : Boolean
      {
         return this.guiliuzhen.isTupoCanvasShow();
      }
      
      public function set_JinGangFuMoQuan(param1:Array) : void
      {
         this.jingangfumoquan.set_JinGangFuMoQuan(param1);
      }
      
      public function set_JinGangFuMoQuan1(param1:Array) : void
      {
         this.jingangfumoquan.set_JinGangFuMoQuan1(param1);
      }
      
      public function permitJinGangFuMoQuan(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.jingangfumoquan.visible = true;
            this.initCharPanel(4,"10");
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
            _loc2_ = this.btnArray4.indexOf(this.objJinGangFuMoQuan);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showJinGangFuMoQuan() : void
      {
         this.initCharPanel(4,"10");
      }
      
      public function requestShowJinGangFuMoQuan() : void
      {
         dispatchEvent(new BaseEvent(JINGANGFUMOQUAN));
      }
      
      public function setJinGangFuMoQuanInitialize(param1:JingangfumoquanVo) : void
      {
         this.jingangfumoquan.setInitialize(true,param1);
      }
      
      public function setJinGangFuMoQuanAvatar(param1:BitmapData) : void
      {
         this.jingangfumoquan.avatar = param1;
      }
      
      public function setJinGangFuMoQuanLingwuInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.jingangfumoquan.setTupoInit(param1,param2,param3,param4,param5,param6);
      }
      
      public function setJinGangFuMoQuanLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.jingangfumoquan.setZhufuzhi(param1,param2,param3);
      }
      
      public function setJinGangFuMoQuanLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.jingangfumoquan.setGoods(param1,param2);
      }
      
      public function setJinGangFuMoQuanLingwuBtn(param1:Boolean) : void
      {
         this.jingangfumoquan.setTuPoBtn(param1);
      }
      
      public function showJinGangFuMoQuanLingWuPanel(param1:Boolean) : void
      {
         this.jingangfumoquan.showTuPoPanel(param1);
      }
      
      public function isJinGangFuMoQuantupoCanvasShow() : Boolean
      {
         return this.jingangfumoquan.isTupoCanvasShow();
      }
      
      public function jingangfumoquanVisible() : Boolean
      {
         return this.jingangfumoquan.visible;
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
         this.qinlonggong.setinitilizeUI(true,param1);
      }
      
      public function qinLongGongJiHuo(param1:Boolean) : void
      {
         this.qinlonggong.setJiHuo(param1);
      }
      
      public function showQinLongGongTupoPanel(param1:*) : void
      {
         this.qinlonggong.showTuPoPanel(param1);
      }
      
      public function setQinLongGongTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.qinlonggong.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setQinLongGongZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.qinlonggong.setZhufuzhi(param1,param2,param3);
      }
      
      public function setQinLongGongGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.qinlonggong.setGoods(param1,param2);
      }
      
      public function setQinLongGongBtn(param1:Boolean) : void
      {
         this.qinlonggong.setTuPoBtn(param1);
      }
      
      public function permitQinLongGong(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(2,"21");
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
            _loc2_ = this.btnArray2.indexOf(this.objQinLongGong);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowQinLongGong() : void
      {
         dispatchEvent(new BaseEvent(QINLONGGONG));
      }
      
      public function isQinLongGongLVShow() : Boolean
      {
         return this.qinlonggong.isTupoCanvasShow();
      }
      
      public function isQinLongGongShow() : Boolean
      {
         return this.qinlonggong.visible;
      }
      
      public function permitChiBang(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(3,"5");
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
            _loc2_ = this.btnArray3.indexOf(this.objChiBang);
            if(_loc2_ >= 0)
            {
               this.btnArray3.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function permitTengtianyi(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(3,"19");
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
            _loc2_ = this.btnArray3.indexOf(this.objTengtianyi);
            if(_loc2_ >= 0)
            {
               this.btnArray3.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowChiBang() : void
      {
         dispatchEvent(new BaseEvent(CHIBANG));
      }
      
      public function requestShowTengtianyi() : void
      {
         dispatchEvent(new BaseEvent(TENGTIANYI));
      }
      
      public function showChibang(param1:Boolean = false) : void
      {
         this.initCharPanel(3,"5");
      }
      
      public function showTengtianyi(param1:Boolean = false) : void
      {
         this.initCharPanel(3,"19");
      }
      
      public function setChiBangInitialize(param1:ChiBangVo) : void
      {
         this.chibang.setInitialize(param1,true);
      }
      
      public function setTengtianyiInitialize(param1:TengtianyiVo) : void
      {
         this.tengtianyi.setInitialize(param1,true);
      }
      
      public function setChiBangJiHuo(param1:Boolean) : void
      {
         this.chibang.setJiHuo(param1);
      }
      
      public function setTengtianyiJiHuo(param1:Boolean) : void
      {
         this.tengtianyi.setJiHuo(param1);
      }
      
      public function ChiBangShow(param1:int) : void
      {
         this.chibang.showChiBang(param1);
      }
      
      public function setChiBangLingwuInitialize(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.chibang.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setTengtianyiLingwuInitialize(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.tengtianyi.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setChiBangLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.chibang.setZhufuzhi(param1,param2,param3);
      }
      
      public function setTengtianyiLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.tengtianyi.setZhufuzhi(param1,param2,param3);
      }
      
      public function setChiBangLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.chibang.setGoods(param1,param2);
      }
      
      public function setTengtianyiLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.tengtianyi.setGoods(param1,param2);
      }
      
      public function setChiBangLingwuBtn(param1:Boolean) : void
      {
         this.chibang.setTuPoBtn(param1);
      }
      
      public function setTengtianyiLingwuBtn(param1:Boolean) : void
      {
         this.tengtianyi.setTuPoBtn(param1);
      }
      
      public function showChiBangLingWuPanel(param1:Boolean) : void
      {
         this.chibang.showTuPoPanel(param1);
      }
      
      public function showTengtianyiLingWuPanel(param1:Boolean) : void
      {
         this.tengtianyi.showTuPoPanel(param1);
      }
      
      public function isChiBangtupoCanvasShow() : Boolean
      {
         return this.chibang.isTupoCanvasShow();
      }
      
      public function composeSuccess() : void
      {
         this.chibang.showlihua();
      }
      
      public function showXiaoYaoYuFeng() : void
      {
         this.initCharPanel(2,"22");
      }
      
      public function setXiaoYaoYuFengInit(param1:XiaoYaoYuFengVO) : void
      {
         this.xiaoyaoyufeng.setInitialize(true,param1);
      }
      
      public function showXiaoYaoYuFengTupoPanel(param1:*) : void
      {
         this.xiaoyaoyufeng.showTuPoPanel(param1);
      }
      
      public function setXiaoYaoYuFengTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.xiaoyaoyufeng.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setXiaoYaoYuFengZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.xiaoyaoyufeng.setZhufuzhi(param1,param2,param3);
      }
      
      public function setXiaoYaoYuFengGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.xiaoyaoyufeng.setGoods(param1,param2);
      }
      
      public function setXiaoYaoYuFengBtn(param1:Boolean) : void
      {
         this.xiaoyaoyufeng.setTuPoBtn(param1);
      }
      
      public function permitXiaoYaoYuFeng(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(2,"22");
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
            _loc2_ = this.btnArray2.indexOf(this.objXiaoYaoYuFeng);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowXiaoYaoYuFeng() : void
      {
         dispatchEvent(new BaseEvent(XIAOYAOYUFENG));
      }
      
      public function isXiaoYaoYuFengLVShow() : Boolean
      {
         return this.xiaoyaoyufeng.isTupoCanvasShow();
      }
      
      public function isXiaoYaoYuFengShow() : Boolean
      {
         return this.xiaoyaoyufeng.visible;
      }
      
      public function set_LianQi(param1:Array) : void
      {
         this.lianqi.set_LianQi(param1);
      }
      
      public function permitLianQi(param1:Boolean) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:int = 0;
         if(param1 && !this.lianqiButton.hasEventListener(MouseEvent.CLICK))
         {
            this.lianqiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            _loc2_ = new Object();
            _loc2_.neirong = this.lianqi;
            _loc2_.biaoqian = this.lianqiButton;
            _loc2_.name = "13";
            _loc2_.isShow = true;
            _loc2_.dengji = -1;
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(1,"13");
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
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showLianQi(param1:Boolean = false) : void
      {
         this.initCharPanel(1,"13");
      }
      
      public function setLianQiInitialize(param1:LianQiVO) : void
      {
         this.lianqi.setInitialize(param1,true);
      }
      
      public function setLianQiAvatar(param1:BitmapData) : void
      {
         this.lianqi.avatar = param1;
      }
      
      public function setLianQiLingwuInitialize(param1:String, param2:int, param3:Boolean, param4:int) : void
      {
         this.lianqi.setTupoInit(param1,param2,param3,param4);
      }
      
      public function setLianQiLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.lianqi.setZhufuzhi(param1,param2,param3);
      }
      
      public function setLianQiLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.lianqi.setGoods(param1,param2);
      }
      
      public function setLianQiLingwuBtn(param1:Boolean) : void
      {
         this.lianqi.setTuPoBtn(param1);
      }
      
      public function showLianQiLingWuPanel(param1:Boolean) : void
      {
         this.lianqi.showTuPoPanel(param1);
      }
      
      public function isLianQitupoCanvasShow() : Boolean
      {
         return this.lianqi.isTupoCanvasShow();
      }
      
      public function showLianQiHuoQu(param1:int) : void
      {
         this.lianqi.showPan(param1);
      }
      
      public function isShowLianQiDuiHuan() : Boolean
      {
         return this.lianqi.isShowDuiHuan();
      }
      
      public function setLianQiDuiHuanGoods(param1:int = 0) : void
      {
         this.lianqi.setDuiHuanGoods(param1);
      }
      
      public function requestShowLianQi() : void
      {
         dispatchEvent(new BaseEvent(LIANQI));
      }
      
      public function setFanbeiJiHuo(param1:Boolean) : void
      {
         this.lianqi.setFanbeiJiHuo(param1);
      }
      
      public function setDingjiJiHuo(param1:Boolean) : void
      {
         this.lianqi.setDingjiJiHuo(param1);
      }
      
      public function set_TianMenZhen(param1:Array) : void
      {
         this.tianmenzhen.set_TianMenZhen(param1);
      }
      
      public function permitTianMenZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(4,"11");
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
            _loc2_ = this.btnArray4.indexOf(this.objTianMenZhen);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowTianMenZhen() : void
      {
         dispatchEvent(new BaseEvent(TIANMENZHEN));
      }
      
      public function showTianMenZhen() : void
      {
         this.initCharPanel(4,"11");
      }
      
      public function setTianMenZhenInitialize(param1:TianMenZhenVO) : void
      {
         this.tianmenzhen.setInitialize(true,param1);
      }
      
      public function setTianMenZhenLingwuInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:int, param8:int) : void
      {
         this.tianmenzhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setTianMenZhenLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.tianmenzhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setTianMenZhenLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.tianmenzhen.setGoods(param1,param2);
      }
      
      public function setTianMenZhenLingwuBtn(param1:Boolean) : void
      {
         this.tianmenzhen.setTuPoBtn(param1);
      }
      
      public function showTianMenZhenLingWuPanel(param1:Boolean) : void
      {
         this.tianmenzhen.showTuPoPanel(param1);
      }
      
      public function isTianMenZhentupoCanvasShow() : Boolean
      {
         return this.tianmenzhen.isTupoCanvasShow();
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
         this.bihaichaoshengqu.setinitilizeUI(true,param1);
      }
      
      public function showBiHaiChaoShengQuTupoPanel(param1:*) : void
      {
         this.bihaichaoshengqu.showTuPoPanel(param1);
      }
      
      public function setBiHaiChaoShengQuTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.bihaichaoshengqu.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setBiHaiChaoShengQuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.bihaichaoshengqu.setZhufuzhi(param1,param2,param3);
      }
      
      public function setBiHaiChaoShengQuGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.bihaichaoshengqu.setGoods(param1,param2);
      }
      
      public function setBiHaiChaoShengQuBtn(param1:Boolean) : void
      {
         this.bihaichaoshengqu.setTuPoBtn(param1);
      }
      
      public function permitBiHaiChaoShengQu(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(2,"23");
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
            _loc2_ = this.btnArray2.indexOf(this.objBiHaiChaoShengQu);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowBiHaiChaoShengQu() : void
      {
         dispatchEvent(new BaseEvent(BIHAICHAOSHENGQU));
      }
      
      public function isBiHaiChaoShengQuLVShow() : Boolean
      {
         return this.bihaichaoshengqu.isTupoCanvasShow();
      }
      
      public function isBiHaiChaoShengQuShow() : Boolean
      {
         return this.bihaichaoshengqu.visible;
      }
      
      public function set_HeYiZhen(param1:Array) : void
      {
         this.heyizhen.set_HeYiZhen(param1);
      }
      
      public function permitHeYiZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(4,"12");
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
            _loc2_ = this.btnArray4.indexOf(this.objHeYiZhen);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowHeYiZhen() : void
      {
         dispatchEvent(new BaseEvent(HEYIZHEN));
      }
      
      public function showHeYiZhen() : void
      {
         this.initCharPanel(4,"12");
      }
      
      public function setHeYiZhenInitialize(param1:HeYiZhenVO) : void
      {
         this.heyizhen.setInitialize(true,param1);
      }
      
      public function setHeYiJiHuo(param1:Boolean) : void
      {
         this.heyizhen.setJiHuo(param1);
      }
      
      public function setHeYiZhenLingwuInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:int, param8:int) : void
      {
         this.heyizhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setHeYiZhenLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.heyizhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setHeYiZhenLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.heyizhen.setGoods(param1,param2);
      }
      
      public function setHeYiZhenLingwuBtn(param1:Boolean) : void
      {
         this.heyizhen.setTuPoBtn(param1);
      }
      
      public function showHeYiZhenLingWuPanel(param1:Boolean) : void
      {
         this.heyizhen.showTuPoPanel(param1);
      }
      
      public function isHeYiZhentupoCanvasShow() : Boolean
      {
         return this.heyizhen.isTupoCanvasShow();
      }
      
      public function permitYuLiZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(4,"13");
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
            _loc2_ = this.btnArray4.indexOf(this.objYuLiZhen);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowYuLiZhen() : void
      {
         dispatchEvent(new BaseEvent(YULIZHEN));
      }
      
      public function showYuLiZhen() : void
      {
         this.initCharPanel(4,"13");
      }
      
      public function setYuLiZhenInitialize(param1:YuLiZhenVO) : void
      {
         this.yulizhen.setInitialize(true,param1);
      }
      
      public function setYuLiJiHuo(param1:Boolean) : void
      {
         this.yulizhen.setJiHuo(param1);
      }
      
      public function setYuLiZhenLingwuInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:int, param8:int) : void
      {
         this.yulizhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setYuLiZhenLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.yulizhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setYuLiZhenLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.yulizhen.setGoods(param1,param2);
      }
      
      public function setYuLiZhenLingwuBtn(param1:Boolean) : void
      {
         this.yulizhen.setTuPoBtn(param1);
      }
      
      public function showYuLiZhenLingWuPanel(param1:Boolean) : void
      {
         this.yulizhen.showTuPoPanel(param1);
      }
      
      public function isYuLiZhentupoCanvasShow() : Boolean
      {
         return this.yulizhen.isTupoCanvasShow();
      }
      
      public function showYuXiaoJianFa() : void
      {
         this.initCharPanel(2,"24");
      }
      
      public function setYuXiaoJianFaInit(param1:YuXiaoJianFaVo) : void
      {
         this.yuxiaojianfa.setinitilizeUI(param1,true);
      }
      
      public function showYuXiaoJianFaTupoPanel(param1:*) : void
      {
         this.yuxiaojianfa.showTuPoPanel(param1);
      }
      
      public function setYuXiaoJianFaTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.yuxiaojianfa.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setYuXiaoJianFaZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.yuxiaojianfa.setZhufuzhi(param1,param2,param3);
      }
      
      public function setYuXiaoJianFaGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.yuxiaojianfa.setGoods(param1,param2);
      }
      
      public function setYuXiaoJianFaBtn(param1:Boolean) : void
      {
         this.yuxiaojianfa.setTuPoBtn(param1);
      }
      
      public function permitYuXiaoJianFa(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(2,"24");
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
            _loc2_ = this.btnArray2.indexOf(this.objYuXiaoJianFa);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowYuXiaoJianFa() : void
      {
         dispatchEvent(new BaseEvent(YUXIAOJIANFA));
      }
      
      public function isYuXiaoJianFaLVShow() : Boolean
      {
         return this.yuxiaojianfa.isTupoCanvasShow();
      }
      
      public function isYuXiaoJianFaShow() : Boolean
      {
         return this.yuxiaojianfa.visible;
      }
      
      public function set_YanYueZhen(param1:Array) : void
      {
         this.yanyuezhen.set_YanYueZhen(param1);
      }
      
      public function permitYanYueZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(4,"14");
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
            _loc2_ = this.btnArray4.indexOf(this.objYanYueZhen);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowYanYueZhen() : void
      {
         dispatchEvent(new BaseEvent(YANYUEZHEN));
      }
      
      public function showYanYueZhen() : void
      {
         this.initCharPanel(4,"14");
      }
      
      public function setYanYueZhenInitialize(param1:YanYueZhenVO) : void
      {
         this.yanyuezhen.setInitialize(true,param1);
      }
      
      public function setYanYueJiHuo(param1:Boolean) : void
      {
         this.yanyuezhen.setJiHuo(param1);
      }
      
      public function setYanYueZhenLingwuInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:int, param8:int) : void
      {
         this.yanyuezhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setYanYueZhenLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.yanyuezhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setYanYueZhenLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.yanyuezhen.setGoods(param1,param2);
      }
      
      public function setYanYueZhenLingwuBtn(param1:Boolean) : void
      {
         this.yanyuezhen.setTuPoBtn(param1);
      }
      
      public function showYanYueZhenLingWuPanel(param1:Boolean) : void
      {
         this.yanyuezhen.showTuPoPanel(param1);
      }
      
      public function isYanYueZhentupoCanvasShow() : Boolean
      {
         return this.yanyuezhen.isTupoCanvasShow();
      }
      
      public function permitTianFuZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(4,"21");
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
            _loc2_ = this.btnArray4.indexOf(this.objTianFuZhen);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function permitNiaoXiangZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(4,"22");
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
            _loc2_ = this.btnArray4.indexOf(this.niaoXiangZhenObj);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function set_ChangSheZhen(param1:Array) : void
      {
         this.changshezhen.set_ChangSheZhen(param1);
      }
      
      public function permitChangSheZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(4,"15");
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
            _loc2_ = this.btnArray4.indexOf(this.objChangSheZhen);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowChangSheZhen() : void
      {
         dispatchEvent(new BaseEvent(CHANGSHEZHEN));
      }
      
      public function showChangSheZhen() : void
      {
         this.initCharPanel(4,"15");
      }
      
      public function setChangSheZhenInitialize(param1:ChangSheZhenVO) : void
      {
         this.changshezhen.setInitialize(true,param1);
      }
      
      public function setChangSheJiHuo(param1:Boolean) : void
      {
         this.changshezhen.setJiHuo(param1);
      }
      
      public function setChangSheZhenLingwuInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:int, param8:int) : void
      {
         this.changshezhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setChangSheZhenLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.changshezhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setChangSheZhenLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.changshezhen.setGoods(param1,param2);
      }
      
      public function setChangSheZhenLingwuBtn(param1:Boolean) : void
      {
         this.changshezhen.setTuPoBtn(param1);
      }
      
      public function showChangSheZhenLingWuPanel(param1:Boolean) : void
      {
         this.changshezhen.showTuPoPanel(param1);
      }
      
      public function isChangSheZhentupoCanvasShow() : Boolean
      {
         return this.changshezhen.isTupoCanvasShow();
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
         this.canhezhi.setinitilizeUI(true,param1);
      }
      
      public function showCanHeZhiTupoPanel(param1:*) : void
      {
         this.canhezhi.showTuPoPanel(param1);
      }
      
      public function setCanHeZhiTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.canhezhi.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setCanHeZhiZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.canhezhi.setZhufuzhi(param1,param2,param3);
      }
      
      public function setCanHeZhiGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.canhezhi.setGoods(param1,param2);
      }
      
      public function setCanHeZhiBtn(param1:Boolean) : void
      {
         this.canhezhi.setTuPoBtn(param1);
      }
      
      public function permitCanHeZhi(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(2,"25");
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
            _loc2_ = this.btnArray2.indexOf(this.objCanHeZhi);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowCanHeZhi() : void
      {
         dispatchEvent(new BaseEvent(CANHEZHI));
      }
      
      public function isCanHeZhiLVShow() : Boolean
      {
         return this.canhezhi.isTupoCanvasShow();
      }
      
      public function isCanHeZhiShow() : Boolean
      {
         return this.canhezhi.visible;
      }
      
      public function permitEMoZhiYi(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(3,"6");
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
            _loc2_ = this.btnArray3.indexOf(this.objEMoZhiYi);
            if(_loc2_ >= 0)
            {
               this.btnArray3.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowEMoZhiYi() : void
      {
         dispatchEvent(new BaseEvent(EMOZHIYI));
      }
      
      public function showEMoZhiYi(param1:Boolean = false) : void
      {
         this.initCharPanel(3,"6");
      }
      
      public function setEMoZhiYiInitialize(param1:EMoZhiYiVo) : void
      {
         this.emozhiyi.setInitialize(param1,true);
      }
      
      public function setEMoZhiYiJiHuo(param1:Boolean) : void
      {
         this.emozhiyi.setJiHuo(param1);
      }
      
      public function EMoZhiYiShow(param1:Boolean) : void
      {
         this.emozhiyi.showEMoZhiYi(param1);
      }
      
      public function setEMoZhiYiLingwuInitialize(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.emozhiyi.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setEMoZhiYiLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.emozhiyi.setZhufuzhi(param1,param2,param3);
      }
      
      public function setEMoZhiYiLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.emozhiyi.setGoods(param1,param2);
      }
      
      public function setEMoZhiYiLingwuBtn(param1:Boolean) : void
      {
         this.emozhiyi.setTuPoBtn(param1);
      }
      
      public function showEMoZhiYiLingWuPanel(param1:Boolean) : void
      {
         this.emozhiyi.showTuPoPanel(param1);
      }
      
      public function isEMoZhiYitupoCanvasShow() : Boolean
      {
         return this.emozhiyi.isTupoCanvasShow();
      }
      
      public function EMoZhiYicomposeSuccess() : void
      {
         this.emozhiyi.showlihua();
      }
      
      public function permitYanXingZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(4,"17");
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
            _loc2_ = this.btnArray4.indexOf(this.objYanXingZhen);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowYanXingZhen() : void
      {
         dispatchEvent(new BaseEvent(YANXINGZHEN));
      }
      
      public function showYanXingZhen() : void
      {
         this.initCharPanel(4,"17");
      }
      
      public function setYanXingZhenInitialize(param1:YanXingZhenVO) : void
      {
         this.yanxingzhen.setInitialize(true,param1);
      }
      
      public function setYanXingZhenLingwuInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:int, param8:int) : void
      {
         this.yanxingzhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setYanXingZhenLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.yanxingzhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setYanXingZhenLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.yanxingzhen.setGoods(param1,param2);
      }
      
      public function setYanXingZhenLingwuBtn(param1:Boolean) : void
      {
         this.yanxingzhen.setTuPoBtn(param1);
      }
      
      public function showYanXingZhenLingWuPanel(param1:Boolean) : void
      {
         this.yanxingzhen.showTuPoPanel(param1);
      }
      
      public function isYanXingZhentupoCanvasShow() : Boolean
      {
         return this.yanxingzhen.isTupoCanvasShow();
      }
      
      public function set_XuanXiangZhen(param1:Array) : void
      {
         this.xuanxiangzhen.set_XuanXiangZhen(param1);
      }
      
      public function permitXuanXiangZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(4,"16");
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
            _loc2_ = this.btnArray4.indexOf(this.objXuanXiangZhen);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowXuanXiangZhen() : void
      {
         dispatchEvent(new BaseEvent(XUANXIANGZHEN));
      }
      
      public function showXuanXiangZhen() : void
      {
         this.initCharPanel(4,"16");
      }
      
      public function setXuanXiangZhenInitialize(param1:XuanXiangZhenVO) : void
      {
         this.xuanxiangzhen.setInitialize(true,param1);
      }
      
      public function setXuanXiangZhenLingwuInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:int, param8:int) : void
      {
         this.xuanxiangzhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setXuanXiangZhenLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.xuanxiangzhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setXuanXiangZhenLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.xuanxiangzhen.setGoods(param1,param2);
      }
      
      public function setXuanXiangZhenLingwuBtn(param1:Boolean) : void
      {
         this.xuanxiangzhen.setTuPoBtn(param1);
      }
      
      public function showXuanXiangZhenLingWuPanel(param1:Boolean) : void
      {
         this.xuanxiangzhen.showTuPoPanel(param1);
      }
      
      public function isXuanXiangZhentupoCanvasShow() : Boolean
      {
         return this.xuanxiangzhen.isTupoCanvasShow();
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
         this.juezhanguangmingding.setinitilizeUI(true,param1);
      }
      
      public function permitJueZhanGuangMingDing(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(5,"1");
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
            _loc2_ = this.btnArray5.indexOf(this.objJueZhanGuangMingDing);
            if(_loc2_ >= 0)
            {
               this.btnArray5.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowJueZhanGuangMingDing() : void
      {
         dispatchEvent(new BaseEvent(JUEZHANGUANGMINGDING));
      }
      
      public function isJueZhanGuangMingDingShow() : Boolean
      {
         return this.juezhanguangmingding.visible;
      }
      
      public function permitTushidahui(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this._tushidahuiBtn.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this._tushidahuiPanel,0);
            this._tushidahuiBtn.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer5.addChild(this._tushidahuiBtn);
            this.tushidahuiObj = new Object();
            this.tushidahuiObj.neirong = this._tushidahuiPanel;
            this.tushidahuiObj.biaoqian = this._tushidahuiBtn;
            this.tushidahuiObj.eventType = TushidahuiConst.TUSHIDAHUI;
            this.tushidahuiObj.name = "2";
            this.tushidahuiObj.isShow = true;
            this.tushidahuiObj.dengji = -1;
            this.btnArray5.push(this.tushidahuiObj);
            this.initCharPanel(5,"2");
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
            _loc2_ = this.btnArray5.indexOf(this.tushidahuiObj);
            if(_loc2_ >= 0)
            {
               this.btnArray5.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function set_GanJiangMoYe(param1:Array) : void
      {
         this.ganjiangmoye.set_GanJiangMoYe(param1);
      }
      
      public function permitGanJiangMoYe() : void
      {
         var _loc1_:* = undefined;
         this.AddGanjiangmoye();
         _loc1_ = new Object();
         _loc1_.neirong = this.ganjiangmoye;
         _loc1_.biaoqian = this.ganjiangmoyeButton;
         _loc1_.name = "7";
         _loc1_.isShow = true;
         _loc1_.dengji = -1;
         this.btnArray3.push(_loc1_);
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
         this.initCharPanel(3,"7");
      }
      
      public function AddGanjiangmoye() : void
      {
         this.CloseGanJiangMoYe(false);
         this.ganjiangmoye = new GanJiangMoYe();
         this.ganjiangmoye._$parent = this;
         this.ganjiangmoye.x = 90;
         this.ganjiangmoye.y = 22;
         addChildAt(this.ganjiangmoye,0);
         this.ganjiangmoyeButton = new NewButton();
         this.ganjiangmoyeButton.label = LanResManager.getLanCommonTextWords("干将莫邪");
         this.ganjiangmoyeButton.width = 80;
         this.ganjiangmoyeButton.height = 20;
         this.ganjiangmoyeButton.align = "center";
         this.LeftButtonContainer3.addChild(this.ganjiangmoyeButton);
         this.ganjiangmoyeButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
      }
      
      public function CloseGanJiangMoYe(param1:Boolean = true) : void
      {
         var _loc2_:int = 0;
         if(this.ganjiangmoye)
         {
            if(this.contains(this.ganjiangmoye))
            {
               if(this.ganjiangmoye.parent != null)
               {
                  this.ganjiangmoye.parent.removeChild(this.ganjiangmoye);
               }
            }
         }
         if(Boolean(this.ganjiangmoyeButton) && this.LeftButtonContainer3.contains(this.ganjiangmoyeButton))
         {
            this.LeftButtonContainer3.removeChild(this.ganjiangmoyeButton);
         }
         _loc2_ = 0;
         while(_loc2_ < this.btnArray3.length)
         {
            if(this.btnArray3[_loc2_].name == "7")
            {
               this.btnArray3.splice(_loc2_,1);
            }
            _loc2_++;
         }
         if(param1)
         {
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(3,"1");
         }
      }
      
      public function requestShowGanJiangMoYe() : void
      {
         dispatchEvent(new BaseEvent(GETGANJIANGMOYE));
      }
      
      public function showGanJiangMoYe() : void
      {
         this.initCharPanel(3,"7");
      }
      
      public function GjMygouxuan(param1:Boolean, param2:Boolean) : void
      {
         this.ganjiangmoye.gouxuan(param1,param2);
      }
      
      public function setinitilizeUI(param1:Boolean, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Goods, param13:int, param14:int, param15:int, param16:Boolean, param17:Boolean, param18:Boolean, param19:Boolean, param20:Boolean) : void
      {
         this.ganjiangmoye.setinitilizeUI(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15,param16,param17,param18,param19,param20);
         this.ganjiangmoye.setGoods(param12);
         this.ganjiangmoye.setSuiPianXiaoHao(param13,param14);
         this.ganjiangmoye.setJiHuo(true);
      }
      
      public function setDuiJianWaiXing(param1:int, param2:int) : void
      {
         this.ganjiangmoye.setBg(param1,param2);
      }
      
      public function setShuxingJiacheng(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : void
      {
         this.ganjiangmoye.setShuxingJiacheng(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setGuan() : void
      {
         this.ganjiangmoye.onCloseTupo();
      }
      
      public function setQiangHuaYanHua(param1:Boolean) : void
      {
         this.ganjiangmoye.showlihua(param1);
      }
      
      public function permitHuangdao(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.ynHuangdaoButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.ynHuangdao,0);
            this.ynHuangdaoButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.ynHuangdaoButton);
            this.ynHuangdaoObj = new Object();
            this.ynHuangdaoObj.neirong = this.ynHuangdao;
            this.ynHuangdaoObj.biaoqian = this.ynHuangdaoButton;
            this.ynHuangdaoObj.name = "14";
            this.ynHuangdaoObj.isShow = true;
            this.ynHuangdaoObj.dengji = -1;
            this.btnArray1.push(this.ynHuangdaoObj);
         }
         else if(!param1 && this.ynHuangdaoButton.hasEventListener(MouseEvent.CLICK))
         {
            this.ynHuangdaoButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.removeDisplayObject(this.ynHuangdao);
            this.removeDisplayObject(this.ynHuangdaoButton);
            _loc2_ = this.btnArray1.indexOf(this.ynHuangdaoObj);
            if(_loc2_ >= 0)
            {
               this.btnArray1.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowHuangdao() : void
      {
         dispatchEvent(new BaseEvent(REQUEST_YNHUANGDAO));
      }
      
      public function showHuangdao() : void
      {
         this.initCharPanel(1,"14");
      }
      
      public function setHuangdaoItems(param1:Array, param2:int, param3:int, param4:int) : void
      {
         this.ynHuangdao.setXunZhang(param1,param2,param3,param4,true);
      }
      
      public function permitZhuanpan(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.ynZhuanpanButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.ynZhuanpan,0);
            this.ynZhuanpanButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.ynZhuanpanButton);
            this.ynZhuanpanObj = new Object();
            this.ynZhuanpanObj.neirong = this.ynZhuanpan;
            this.ynZhuanpanObj.biaoqian = this.ynZhuanpanButton;
            this.ynZhuanpanObj.name = "15";
            this.ynZhuanpanObj.isShow = true;
            this.ynZhuanpanObj.dengji = -1;
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
            _loc2_ = this.btnArray1.indexOf(this.ynZhuanpanObj);
            if(_loc2_ >= 0)
            {
               this.btnArray1.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showZhuanpan() : void
      {
         this.initCharPanel(1,"15");
      }
      
      public function requestShowZhuanpan() : void
      {
         dispatchEvent(new BaseEvent(REQUEST_ZHUANPAN));
      }
      
      public function setZhuanpanItems(param1:Array, param2:int, param3:int, param4:int) : void
      {
         this.ynZhuanpan.setXunZhang(param1,param2,param3,param4,true);
      }
      
      public function permitFSZB(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.ynFSZBButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.ynFSZB,0);
            this.ynFSZBButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer5.addChild(this.ynFSZBButton);
            this.ynFSZBObj = new Object();
            this.ynFSZBObj.eventType = REQUEST_FSZB;
            this.ynFSZBObj.neirong = this.ynFSZB;
            this.ynFSZBObj.biaoqian = this.ynFSZBButton;
            this.ynFSZBObj.name = "6";
            this.ynFSZBObj.isShow = true;
            this.ynFSZBObj.dengji = -1;
            this.btnArray5.push(this.ynFSZBObj);
            this.initCharPanel(5,"6");
         }
         else if(!param1 && this.ynFSZBButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.ynFSZB != null && this.ynFSZB.parent != null)
            {
               this.ynFSZB.parent.removeChild(this.ynFSZB);
            }
            this.ynFSZBButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.ynFSZBButton != null && this.ynFSZBButton.parent != null)
            {
               this.ynFSZBButton.parent.removeChild(this.ynFSZBButton);
            }
            _loc2_ = this.btnArray5.indexOf(this.ynFSZBObj);
            if(_loc2_ >= 0)
            {
               this.btnArray5.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showFSZB() : void
      {
         this.initCharPanel(5,"6");
      }
      
      public function requestShowFSZB() : void
      {
         dispatchEvent(new BaseEvent(REQUEST_FSZB));
      }
      
      public function setFSZBItems(param1:Array, param2:int, param3:int, param4:int) : void
      {
         this.ynFSZB.setXunZhang(param1,param2,param3,param4,true);
      }
      
      public function permitWZZB(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.ynWZZBButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.ynWZZB,0);
            this.ynWZZBButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.ynWZZBButton);
            this.ynWZZBObj = new Object();
            this.ynWZZBObj.neirong = this.ynWZZB;
            this.ynWZZBObj.biaoqian = this.ynWZZBButton;
            this.ynWZZBObj.name = "19";
            this.ynWZZBObj.isShow = true;
            this.ynWZZBObj.dengji = -1;
            this.btnArray1.push(this.ynWZZBObj);
            this.initCharPanel(1,"19");
         }
         else if(!param1 && this.ynWZZBButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.ynWZZB != null && this.ynWZZB.parent != null)
            {
               this.ynWZZB.parent.removeChild(this.ynWZZB);
            }
            this.ynWZZBButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.ynWZZBButton != null && this.ynWZZBButton.parent != null)
            {
               this.ynWZZBButton.parent.removeChild(this.ynWZZBButton);
            }
            _loc2_ = this.btnArray1.indexOf(this.ynWZZBObj);
            if(_loc2_ >= 0)
            {
               this.btnArray1.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showWZZB() : void
      {
         this.initCharPanel(1,"19");
      }
      
      public function requestShowWZZB() : void
      {
         dispatchEvent(new BaseEvent(REQUEST_WZZB));
      }
      
      public function setWZZBItems(param1:Array, param2:int, param3:int, param4:int) : void
      {
         this.ynWZZB.setXunZhang(param1,param2,param3,param4,true);
      }
      
      public function set_HuTaoZhen(param1:Array) : void
      {
         this.hutaozhen.set_HuTaoZhen(param1);
      }
      
      public function permitHuTaoZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(4,"18");
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
            _loc2_ = this.btnArray4.indexOf(this.objHuTaoZhen);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowHuTaoZhen() : void
      {
         dispatchEvent(new BaseEvent(HUTAOZHEN));
      }
      
      public function showHuTaoZhen() : void
      {
         this.initCharPanel(4,"18");
      }
      
      public function setHuTaoZhenInitialize(param1:HuTaoZhenVO) : void
      {
         this.hutaozhen.setInitialize(true,param1);
      }
      
      public function setHuTaoZhenLingwuInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:int, param8:int) : void
      {
         this.hutaozhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setHuTaoZhenLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.hutaozhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setHuTaoZhenLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.hutaozhen.setGoods(param1,param2);
      }
      
      public function setHuTaoZhenLingwuBtn(param1:Boolean) : void
      {
         this.hutaozhen.setTuPoBtn(param1);
      }
      
      public function showHuTaoZhenLingWuPanel(param1:Boolean) : void
      {
         this.hutaozhen.showTuPoPanel(param1);
      }
      
      public function isHuTaoZhentupoCanvasShow() : Boolean
      {
         return this.hutaozhen.isTupoCanvasShow();
      }
      
      public function set_YunLongZhen(param1:Array) : void
      {
         this.yunlongzhen.set_YunLongZhen(param1);
      }
      
      public function permitYunLongZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(4,"19");
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
            _loc2_ = this.btnArray4.indexOf(this.objYunLongZhen);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowYunLongZhen() : void
      {
         dispatchEvent(new BaseEvent(YUNLONGZHEN));
      }
      
      public function showYunLongZhen() : void
      {
         this.initCharPanel(4,"19");
      }
      
      public function setYunLongZhenInitialize(param1:YunLongZhenVO) : void
      {
         this.yunlongzhen.setInitialize(true,param1);
      }
      
      public function setYunLongZhenLingwuInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:int, param8:int) : void
      {
         this.yunlongzhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setYunLongZhenLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.yunlongzhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setYunLongZhenLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.yunlongzhen.setGoods(param1,param2);
      }
      
      public function setYunLongZhenLingwuBtn(param1:Boolean) : void
      {
         this.yunlongzhen.setTuPoBtn(param1);
      }
      
      public function showYunLongZhenLingWuPanel(param1:Boolean) : void
      {
         this.yunlongzhen.showTuPoPanel(param1);
      }
      
      public function isYunLongZhentupoCanvasShow() : Boolean
      {
         return this.yunlongzhen.isTupoCanvasShow();
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
         this.xiantiangong.setinitilizeUI(true,param1);
      }
      
      public function showXianTianGongTupoPanel(param1:*) : void
      {
         this.xiantiangong.showTuPoPanel(param1);
      }
      
      public function setXianTianGongTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.xiantiangong.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setXianTianGongZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.xiantiangong.setZhufuzhi(param1,param2,param3);
      }
      
      public function setXianTianGongGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.xiantiangong.setGoods(param1,param2);
      }
      
      public function setXianTianGongBtn(param1:Boolean) : void
      {
         this.xiantiangong.setTuPoBtn(param1);
      }
      
      public function permitXianTianGong(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(2,"26");
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
            _loc2_ = this.btnArray2.indexOf(this.objXianTianGong);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowXianTianGong() : void
      {
         dispatchEvent(new BaseEvent(XIANTIANGONG));
      }
      
      public function isXianTianGongLVShow() : Boolean
      {
         return this.xiantiangong.isTupoCanvasShow();
      }
      
      public function isXianTianGongShow() : Boolean
      {
         return this.xiantiangong.visible;
      }
      
      public function permitPangXieZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.pangxiezhenButton.hasEventListener(MouseEvent.CLICK))
         {
            this.pangxiezhen.setParent = this;
            addChildAt(this.pangxiezhen,0);
            this.pangxiezhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.pangxiezhenButton);
            this.pangXieZhenObj = new Object();
            this.pangXieZhenObj.neirong = this.pangxiezhen;
            this.pangXieZhenObj.biaoqian = this.pangxiezhenButton;
            this.pangXieZhenObj.name = "20";
            this.pangXieZhenObj.isShow = true;
            this.pangXieZhenObj.dengji = -1;
            this.btnArray4.push(this.pangXieZhenObj);
            this.initCharPanel(4,"20");
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
            _loc2_ = this.btnArray4.indexOf(this.pangXieZhenObj);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowPangXieZhen() : void
      {
         dispatchEvent(new BaseEvent(PANGXIEZHEN));
      }
      
      public function showPangXieZhen() : void
      {
         this.initCharPanel(4,"20");
      }
      
      public function setPangXieZhenInitialize(param1:PangXieZhenVO) : void
      {
         this.pangxiezhen.setInitialize(true,param1);
      }
      
      public function setPangXieZhenLingwuInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:int, param8:int) : void
      {
         this.pangxiezhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setPangXieZhenLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.pangxiezhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setPangXieZhenLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.pangxiezhen.setGoods(param1,param2);
      }
      
      public function setPangXieZhenLingwuBtn(param1:Boolean) : void
      {
         this.pangxiezhen.setTuPoBtn(param1);
      }
      
      public function showPangXieZhenLingWuPanel(param1:Boolean) : void
      {
         this.pangxiezhen.showTuPoPanel(param1);
      }
      
      public function isPangXieZhentupoCanvasShow() : Boolean
      {
         return this.pangxiezhen.isTupoCanvasShow();
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
         this.xuedaoxinfa.setinitilizeUI(true,param1);
      }
      
      public function showXueDaoXinFaTupoPanel(param1:*) : void
      {
         this.xuedaoxinfa.showTuPoPanel(param1);
      }
      
      public function setXueDaoXinFaTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.xuedaoxinfa.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setXueDaoXinFaZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.xuedaoxinfa.setZhufuzhi(param1,param2,param3);
      }
      
      public function setXueDaoXinFaGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.xuedaoxinfa.setGoods(param1,param2);
      }
      
      public function setXueDaoXinFaBtn(param1:Boolean) : void
      {
         this.xuedaoxinfa.setTuPoBtn(param1);
      }
      
      public function permitXueDaoXinFa(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(2,"27");
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
            _loc2_ = this.btnArray2.indexOf(this.objXueDaoXinFa);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowXueDaoXinFa() : void
      {
         dispatchEvent(new BaseEvent(XUEDAOXINFA));
      }
      
      public function isXueDaoXinFaLVShow() : Boolean
      {
         return this.xuedaoxinfa.isTupoCanvasShow();
      }
      
      public function isXueDaoXinFaShow() : Boolean
      {
         return this.xuedaoxinfa.visible;
      }
      
      public function showHuYiJueXing() : void
      {
         this.initCharPanel(3,"8");
      }
      
      public function setHuYiJueXingInit(param1:HuYiJueXingVO) : void
      {
         this.huyijuexing.setinitilizeUI(true,param1);
      }
      
      public function showHuYiJueXingTupoPanel(param1:*) : void
      {
         this.huyijuexing.showTuPoPanel(param1);
      }
      
      public function setHuYiJueXingTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.huyijuexing.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setHuYiJueXingZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.huyijuexing.setZhufuzhi(param1,param2,param3);
      }
      
      public function setHuYiJueXingGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.huyijuexing.setGoods(param1,param2);
      }
      
      public function setHuYiJueXingBtn(param1:Boolean) : void
      {
         this.huyijuexing.setTuPoBtn(param1);
      }
      
      public function permitHuYiJueXing(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(3,"8");
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
            _loc2_ = this.btnArray3.indexOf(this.objHuYiJueXing);
            if(_loc2_ >= 0)
            {
               this.btnArray3.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowHuYiJueXing() : void
      {
         dispatchEvent(new BaseEvent(HUYIJUEXING));
      }
      
      public function isHuYiJueXingLVShow() : Boolean
      {
         return this.huyijuexing.isTupoCanvasShow();
      }
      
      public function isHuYiJueXingShow() : Boolean
      {
         return this.huyijuexing.visible;
      }
      
      public function permitDiZaiZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(4,"23");
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
            _loc2_ = this.btnArray4.indexOf(this.objDiZaiZhen);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowDiZaiZhen() : void
      {
         dispatchEvent(new BaseEvent(DIZAIZHEN));
      }
      
      public function showDiZaiZhen() : void
      {
         this.initCharPanel(4,"23");
      }
      
      public function setDiZaiZhenInitialize(param1:DiZaiZhenVO) : void
      {
         this.dizaizhen.setInitialize(true,param1);
      }
      
      public function setDiZaiZhenLingwuInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:int, param8:int) : void
      {
         this.dizaizhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setDiZaiZhenLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.dizaizhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setDiZaiZhenLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.dizaizhen.setGoods(param1,param2);
      }
      
      public function setDiZaiZhenLingwuBtn(param1:Boolean) : void
      {
         this.dizaizhen.setTuPoBtn(param1);
      }
      
      public function showDiZaiZhenLingWuPanel(param1:Boolean) : void
      {
         this.dizaizhen.showTuPoPanel(param1);
      }
      
      public function isDiZaiZhentupoCanvasShow() : Boolean
      {
         return this.dizaizhen.isTupoCanvasShow();
      }
      
      public function permitFengYangZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(4,"24");
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
            _loc2_ = this.btnArray4.indexOf(this.objFengYangZhen);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowFengYangZhen() : void
      {
         dispatchEvent(new BaseEvent(FENGYANGZHEN));
      }
      
      public function showFengYangZhen() : void
      {
         this.initCharPanel(4,"24");
      }
      
      public function setFengYangZhenInitialize(param1:FengYangZhenVO) : void
      {
         this.fengyangzhen.setInitialize(true,param1);
      }
      
      public function setFengYangZhenLingwuInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:int, param8:int) : void
      {
         this.fengyangzhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setFengYangZhenLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.fengyangzhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setFengYangZhenLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.fengyangzhen.setGoods(param1,param2);
      }
      
      public function setFengYangZhenLingwuBtn(param1:Boolean) : void
      {
         this.fengyangzhen.setTuPoBtn(param1);
      }
      
      public function showFengYangZhenLingWuPanel(param1:Boolean) : void
      {
         this.fengyangzhen.showTuPoPanel(param1);
      }
      
      public function isFengYangZhentupoCanvasShow() : Boolean
      {
         return this.fengyangzhen.isTupoCanvasShow();
      }
      
      public function showLongYaJueXing() : void
      {
         this.initCharPanel(3,"9");
      }
      
      public function setLongYaJueXingInit(param1:LongYaJueXingVO) : void
      {
         this.longyajuexing.setinitilizeUI(true,param1);
      }
      
      public function showLongYaJueXingTupoPanel(param1:*) : void
      {
         this.longyajuexing.showTuPoPanel(param1);
      }
      
      public function setLongYaJueXingTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.longyajuexing.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setLongYaJueXingZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.longyajuexing.setZhufuzhi(param1,param2,param3);
      }
      
      public function setLongYaJueXingGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.longyajuexing.setGoods(param1,param2);
      }
      
      public function setLongYaJueXingBtn(param1:Boolean) : void
      {
         this.longyajuexing.setTuPoBtn(param1);
      }
      
      public function permitLongYaJueXing(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(3,"9");
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
            _loc2_ = this.btnArray3.indexOf(this.objLongYaJueXing);
            if(_loc2_ >= 0)
            {
               this.btnArray3.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowLongYaJueXing() : void
      {
         dispatchEvent(new BaseEvent(LONGYAJUEXING));
      }
      
      public function isLongYaJueXingLVShow() : Boolean
      {
         return this.longyajuexing.isTupoCanvasShow();
      }
      
      public function isLongYaJueXingShow() : Boolean
      {
         return this.longyajuexing.visible;
      }
      
      public function showQuanShenJueXing() : void
      {
         this.initCharPanel(3,"10");
      }
      
      public function setQuanShenJueXingInit(param1:QuanShenJueXingVO) : void
      {
         this.quanshenjuexing.setinitilizeUI(true,param1);
      }
      
      public function showQuanShenJueXingTupoPanel(param1:*) : void
      {
         this.quanshenjuexing.showTuPoPanel(param1);
      }
      
      public function setQuanShenJueXingTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.quanshenjuexing.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setQuanShenJueXingZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.quanshenjuexing.setZhufuzhi(param1,param2,param3);
      }
      
      public function setQuanShenJueXingGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.quanshenjuexing.setGoods(param1,param2);
      }
      
      public function setQuanShenJueXingBtn(param1:Boolean) : void
      {
         this.quanshenjuexing.setTuPoBtn(param1);
      }
      
      public function permitQuanShenJueXing(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(3,"10");
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
            _loc2_ = this.btnArray3.indexOf(this.objQuanShenJueXing);
            if(_loc2_ >= 0)
            {
               this.btnArray3.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowQuanShenJueXing() : void
      {
         dispatchEvent(new BaseEvent(QUANSHENJUEXING));
      }
      
      public function isQuanShenJueXingLVShow() : Boolean
      {
         return this.quanshenjuexing.isTupoCanvasShow();
      }
      
      public function isQuanShenJueXingShow() : Boolean
      {
         return this.quanshenjuexing.visible;
      }
      
      public function permitWuDuZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(4,"25");
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
            _loc2_ = this.btnArray4.indexOf(this.objWuDuZhen);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowWuDuZhen() : void
      {
         dispatchEvent(new BaseEvent(WUDUZHEN));
      }
      
      public function showWuDuZhen() : void
      {
         this.initCharPanel(4,"25");
      }
      
      public function setWuDuZhenInit(param1:int, param2:Array, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:int, param9:Boolean, param10:int, param11:Boolean, param12:Boolean, param13:Boolean) : void
      {
         this.wuduzhen.setPanel(false,param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13);
      }
      
      public function setWuDuZhenTuPoPanel(param1:int, param2:Goods, param3:int, param4:int, param5:int, param6:int, param7:int = 0) : void
      {
         this.wuduzhen.setTupoPanel(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function showWuDuZhenTupo(param1:Boolean) : void
      {
         this.wuduzhen.showTupoPanel(param1);
      }
      
      public function setWuDuZhenTupoBtn(param1:Boolean) : void
      {
         this.wuduzhen.setTuPoPanelBtn(param1);
      }
      
      public function isShowWuDuZhenTupoPanel() : Boolean
      {
         return this.wuduzhen.isShowTupo();
      }
      
      public function showLongYinJueXing() : void
      {
         this.initCharPanel(3,"11");
      }
      
      public function setLongYinJueXingInit(param1:LongYinJueXingVO) : void
      {
         this.longyinjuexing.setinitilizeUI(true,param1);
      }
      
      public function showLongYinJueXingTupoPanel(param1:*) : void
      {
         this.longyinjuexing.showTuPoPanel(param1);
      }
      
      public function setLongYinJueXingTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.longyinjuexing.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setLongYinJueXingZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.longyinjuexing.setZhufuzhi(param1,param2,param3);
      }
      
      public function setLongYinJueXingGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.longyinjuexing.setGoods(param1,param2);
      }
      
      public function setLongYinJueXingBtn(param1:Boolean) : void
      {
         this.longyinjuexing.setTuPoBtn(param1);
      }
      
      public function permitLongYinJueXing(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(3,"11");
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
            _loc2_ = this.btnArray3.indexOf(this.objLongYinJueXing);
            if(_loc2_ >= 0)
            {
               this.btnArray3.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowLongYinJueXing() : void
      {
         dispatchEvent(new BaseEvent(LONGYINJUEXING));
      }
      
      public function isLongYinJueXingLVShow() : Boolean
      {
         return this.longyinjuexing.isTupoCanvasShow();
      }
      
      public function isLongYinJueXingShow() : Boolean
      {
         return this.longyinjuexing.visible;
      }
      
      public function showShenXingBaiBian() : void
      {
         this.initCharPanel(2,"28");
      }
      
      public function setShenXingBaiBianInit(param1:ShenXingBaiBianVO) : void
      {
         this.shenxingbaibian.setinitilizeUI(true,param1);
      }
      
      public function showShenXingBaiBianTupoPanel(param1:*) : void
      {
         this.shenxingbaibian.showTuPoPanel(param1);
      }
      
      public function setShenXingBaiBianTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.shenxingbaibian.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setShenXingBaiBianZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.shenxingbaibian.setZhufuzhi(param1,param2,param3);
      }
      
      public function setShenXingBaiBianGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.shenxingbaibian.setGoods(param1,param2);
      }
      
      public function setShenXingBaiBianBtn(param1:Boolean) : void
      {
         this.shenxingbaibian.setTuPoBtn(param1);
      }
      
      public function permitShenXingBaiBian(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.shenxingbaibianButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.shenxingbaibian,0);
            this.shenxingbaibianButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.shenxingbaibianButton);
            this.shenxingbaibianObj = new Object();
            this.shenxingbaibianObj.neirong = this.shenxingbaibian;
            this.shenxingbaibianObj.biaoqian = this.shenxingbaibianButton;
            this.shenxingbaibianObj.name = "28";
            this.shenxingbaibianObj.isShow = true;
            this.shenxingbaibianObj.dengji = -1;
            this.btnArray2.push(this.shenxingbaibianObj);
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(2,"28");
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
            _loc2_ = this.btnArray2.indexOf(this.shenxingbaibianObj);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowShenXingBaiBian() : void
      {
         dispatchEvent(new BaseEvent(SHENXINGBAIBIAN));
      }
      
      public function isShenXingBaiBianLVShow() : Boolean
      {
         return this.shenxingbaibian.isTupoCanvasShow();
      }
      
      public function isShenXingBaiBianShow() : Boolean
      {
         return this.shenxingbaibian.visible;
      }
      
      public function showLangHunDun() : void
      {
         this.initCharPanel(3,"12");
      }
      
      public function setLangHunDunInit(param1:LangHunDunVO) : void
      {
         this.langhundun.setinitilizeUI(true,param1);
      }
      
      public function setLangHunDunZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.langhundun.setZhufuzhi(param1,param2,param3);
      }
      
      public function setLangHunDunBtn(param1:Boolean) : void
      {
         this.langhundun.setTuPoBtn(param1);
      }
      
      public function permitLangHunDun(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.langhundunButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.langhundun,0);
            this.langhundunButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.langhundunButton);
            this.langhundunObj = new Object();
            this.langhundunObj.neirong = this.langhundun;
            this.langhundunObj.biaoqian = this.langhundunButton;
            this.langhundunObj.name = "12";
            this.langhundunObj.isShow = true;
            this.langhundunObj.dengji = -1;
            this.btnArray3.push(this.langhundunObj);
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(3,"12");
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
            _loc2_ = this.btnArray3.indexOf(this.langhundunObj);
            if(_loc2_ >= 0)
            {
               this.btnArray3.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowLangHunDun() : void
      {
         dispatchEvent(new BaseEvent(LANGHUNDUN));
      }
      
      public function isLangHunDunShow() : Boolean
      {
         return this.langhundun.visible;
      }
      
      public function showRulaishenzhang() : void
      {
         this.initCharPanel(2,"29");
      }
      
      public function setRulaishenzhangInit(param1:RuLaiShenZhangVO) : void
      {
         this.rulaishenzhang.setInitialize(true,param1);
      }
      
      public function showRulaishenzhangTupoPanel(param1:Boolean) : void
      {
         this.rulaishenzhang.onShowLv(param1);
      }
      
      public function setRulaishenzhangTupoInitialize(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.rulaishenzhang.setRulaishenzhangTupoInitialize(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setRulaishenzhangZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.rulaishenzhang.setRulaishenzhangLingwuZhufuzhi(param1,param2,param3);
      }
      
      public function setRulaishenzhangGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.rulaishenzhang.setRulaishenzhangLingwuGoods(param1,param2);
      }
      
      public function setRulaishenzhangBtn(param1:Boolean) : void
      {
         this.rulaishenzhang.setRulaishenzhangLingwuBtn(param1);
      }
      
      public function permitRulaishenzhang(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.rulaishenzhangButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.rulaishenzhang,0);
            this.rulaishenzhangButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.rulaishenzhangButton);
            this.objRuLaiShenZhang = new Object();
            this.objRuLaiShenZhang.neirong = this.rulaishenzhang;
            this.objRuLaiShenZhang.biaoqian = this.rulaishenzhangButton;
            this.objRuLaiShenZhang.name = "29";
            this.objRuLaiShenZhang.isShow = true;
            this.objRuLaiShenZhang.dengji = -1;
            this.btnArray2.push(this.objRuLaiShenZhang);
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(2,"29");
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
            _loc2_ = this.btnArray2.indexOf(this.objRuLaiShenZhang);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowRulaishenzhang() : void
      {
         dispatchEvent(new BaseEvent(GETRULAISHENZHANG));
      }
      
      public function isRulaishenzhangLVShow() : Boolean
      {
         return this.rulaishenzhang.isRulaishenzhangtupoCanvasShow();
      }
      
      public function isRulaishenzhangShow() : Boolean
      {
         return this.rulaishenzhang.visible;
      }
      
      public function requestShowLongWenKeHua() : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_LONGWENKEHUA_PANEL,-1);
      }
      
      public function showLuoYingShenJianZhang() : void
      {
         this.initCharPanel(2,"30");
      }
      
      public function setLuoYingShenJianZhangInit(param1:LuoYingShenJianZhangVO) : void
      {
         this.luoyingshenjianzhang.setinitilizeUI(true,param1);
      }
      
      public function showLuoYingShenJianZhangTupoPanel(param1:*) : void
      {
         this.luoyingshenjianzhang.showTuPoPanel(param1);
      }
      
      public function setLuoYingShenJianZhangTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.luoyingshenjianzhang.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setLuoYingShenJianZhangZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.luoyingshenjianzhang.setZhufuzhi(param1,param2,param3);
      }
      
      public function setLuoYingShenJianZhangGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.luoyingshenjianzhang.setGoods(param1,param2);
      }
      
      public function setLuoYingShenJianZhangBtn(param1:Boolean) : void
      {
         this.luoyingshenjianzhang.setTuPoBtn(param1);
      }
      
      public function permitLuoYingShenJianZhang(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.luoyingshenjianzhangButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.luoyingshenjianzhang,0);
            this.luoyingshenjianzhangButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.luoyingshenjianzhangButton);
            this.luoyingshenjianzhangObj = new Object();
            this.luoyingshenjianzhangObj.neirong = this.luoyingshenjianzhang;
            this.luoyingshenjianzhangObj.biaoqian = this.luoyingshenjianzhangButton;
            this.luoyingshenjianzhangObj.name = "30";
            this.luoyingshenjianzhangObj.isShow = true;
            this.luoyingshenjianzhangObj.dengji = -1;
            this.btnArray2.push(this.luoyingshenjianzhangObj);
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(2,"30");
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
            _loc2_ = this.btnArray2.indexOf(this.luoyingshenjianzhangObj);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowLuoYingShenJianZhang() : void
      {
         dispatchEvent(new BaseEvent(LUOYINGSHENJIANZHANG));
      }
      
      public function isLuoYingShenJianZhangLVShow() : Boolean
      {
         return this.luoyingshenjianzhang.isTupoCanvasShow();
      }
      
      public function isLuoYingShenJianZhangShow() : Boolean
      {
         return this.luoyingshenjianzhang.visible;
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
         this.bazhentu.setinitilizeUI(true,param1);
      }
      
      public function showBaZhenTuTupoPanel(param1:*) : void
      {
         this.bazhentu.showTuPoPanel(param1);
      }
      
      public function setBaZhenTuTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.bazhentu.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setBaZhenTuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.bazhentu.setZhufuzhi(param1,param2,param3);
      }
      
      public function setBaZhenTuGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.bazhentu.setGoods(param1,param2);
      }
      
      public function setBaZhenTuBtn(param1:Boolean) : void
      {
         this.bazhentu.setTuPoBtn(param1);
      }
      
      public function permitBaZhenTu(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.bazhentuButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.bazhentu,0);
            this.bazhentuButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.bazhentuButton);
            this.bazhentuObj = new Object();
            this.bazhentuObj.neirong = this.bazhentu;
            this.bazhentuObj.biaoqian = this.bazhentuButton;
            this.bazhentuObj.name = "26";
            this.bazhentuObj.isShow = true;
            this.bazhentuObj.dengji = -1;
            this.btnArray4.push(this.bazhentuObj);
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(4,"26");
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
            _loc2_ = this.btnArray4.indexOf(this.bazhentuObj);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowBaZhenTu() : void
      {
         dispatchEvent(new BaseEvent(BAZHENTU));
      }
      
      public function isBaZhenTuLVShow() : Boolean
      {
         return this.bazhentu.isTupoCanvasShow();
      }
      
      public function isBaZhenTuShow() : Boolean
      {
         return this.bazhentu.visible;
      }
      
      public function showDuGuQiuBai() : void
      {
         this.initCharPanel(5,"3");
      }
      
      public function setDuGuQiuBaiInit(param1:DuGuQiuBaiVO) : void
      {
         this.duguqiubai.setinitilizeUI(true,param1);
      }
      
      public function setDuGuQiuBaiZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.duguqiubai.setZhufuzhi(param1,param2,param3);
      }
      
      public function setDuGuQiuBaiGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.duguqiubai.setGoods(param1,param2);
      }
      
      public function setDuGuQiuBaiBtn(param1:Boolean) : void
      {
         this.duguqiubai.setTuPoBtn(param1);
      }
      
      public function permitDuGuQiuBai(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.duguqiubaiButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.duguqiubai,0);
            this.duguqiubaiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer5.addChild(this.duguqiubaiButton);
            this.duguqiubaiObj = new Object();
            this.duguqiubaiObj.neirong = this.duguqiubai;
            this.duguqiubaiObj.biaoqian = this.duguqiubaiButton;
            this.duguqiubaiObj.eventType = DUGUQIUBAI;
            this.duguqiubaiObj.name = "3";
            this.duguqiubaiObj.isShow = true;
            this.duguqiubaiObj.dengji = -1;
            this.btnArray5.push(this.duguqiubaiObj);
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(5,"3");
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
            _loc2_ = this.btnArray5.indexOf(this.duguqiubaiObj);
            if(_loc2_ >= 0)
            {
               this.btnArray5.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowDuGuQiuBai() : void
      {
         dispatchEvent(new BaseEvent(DUGUQIUBAI));
      }
      
      public function isDuGuQiuBaiShow() : Boolean
      {
         return this.duguqiubai.visible;
      }
      
      public function reBtnLable() : String
      {
         return this.duguqiubai.reBtnLable();
      }
      
      public function set_XuanTieJianFa(param1:Array) : void
      {
         this.xuantiejianfa.set_XuanTieJianFa(param1);
      }
      
      public function showXuanTieJianFa() : void
      {
         this.initCharPanel(2,"31");
      }
      
      public function setXuanTieJianFaInit(param1:XuanTieJianFaVO) : void
      {
         this.xuantiejianfa.setinitilizeUI(true,param1);
      }
      
      public function showXuanTieJianFaTupoPanel(param1:*) : void
      {
         this.xuantiejianfa.showTuPoPanel(param1);
      }
      
      public function setXuanTieJianFaTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.xuantiejianfa.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setXuanTieJianFaZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.xuantiejianfa.setZhufuzhi(param1,param2,param3);
      }
      
      public function setXuanTieJianFaGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.xuantiejianfa.setGoods(param1,param2);
      }
      
      public function setXuanTieJianFaBtn(param1:Boolean) : void
      {
         this.xuantiejianfa.setTuPoBtn(param1);
      }
      
      public function permitXuanTieJianFa(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.xuantiejianfaButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.xuantiejianfa,0);
            this.xuantiejianfaButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.xuantiejianfaButton);
            this.xuantiejianfaObj = new Object();
            this.xuantiejianfaObj.neirong = this.xuantiejianfa;
            this.xuantiejianfaObj.biaoqian = this.xuantiejianfaButton;
            this.xuantiejianfaObj.name = "31";
            this.xuantiejianfaObj.isShow = true;
            this.xuantiejianfaObj.dengji = -1;
            this.btnArray2.push(this.xuantiejianfaObj);
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(2,"31");
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
            _loc2_ = this.btnArray2.indexOf(this.xuantiejianfaObj);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowXuanTieJianFa() : void
      {
         dispatchEvent(new BaseEvent(XUANTIEJIANFA));
      }
      
      public function isXuanTieJianFaLVShow() : Boolean
      {
         return this.xuantiejianfa.isTupoCanvasShow();
      }
      
      public function isXuanTieJianFaShow() : Boolean
      {
         return this.xuantiejianfa.visible;
      }
      
      public function set_ChangShengJue(param1:Array) : void
      {
         this.changshengjue.set_ChangShengJue(param1);
      }
      
      public function showChangShengJue() : void
      {
         this.initCharPanel(2,"32");
      }
      
      public function setChangShengJueInit(param1:ChangShengJueVO) : void
      {
         this.changshengjue.setinitilizeUI(true,param1);
      }
      
      public function showChangShengJueTupoPanel(param1:*) : void
      {
         this.changshengjue.showTuPoPanel(param1);
      }
      
      public function setChangShengJueTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.changshengjue.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setChangShengJueZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.changshengjue.setZhufuzhi(param1,param2,param3);
      }
      
      public function setChangShengJueGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.changshengjue.setGoods(param1,param2);
      }
      
      public function setChangShengJueBtn(param1:Boolean) : void
      {
         this.changshengjue.setTuPoBtn(param1);
      }
      
      public function permitChangShengJue(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.changshengjueButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.changshengjue,0);
            this.changshengjueButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.changshengjueButton);
            this.changshengjueObj = new Object();
            this.changshengjueObj.neirong = this.changshengjue;
            this.changshengjueObj.biaoqian = this.changshengjueButton;
            this.changshengjueObj.name = "32";
            this.changshengjueObj.isShow = true;
            this.changshengjueObj.dengji = -1;
            this.btnArray2.push(this.changshengjueObj);
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(2,"32");
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
            _loc2_ = this.btnArray2.indexOf(this.changshengjueObj);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowChangShengJue() : void
      {
         dispatchEvent(new BaseEvent(CHANGSHENGJUE));
      }
      
      public function isChangShengJueLVShow() : Boolean
      {
         return this.changshengjue.isTupoCanvasShow();
      }
      
      public function isChangShengJueShow() : Boolean
      {
         return this.changshengjue.visible;
      }
      
      public function showWanHunZhen() : void
      {
         this.initCharPanel(4,"27");
      }
      
      public function setWanHunZhenInit(param1:WanHunZhenVO) : void
      {
         this.wanhunzhen.setinitilizeUI(true,param1);
      }
      
      public function showWanHunZhenTupoPanel(param1:*) : void
      {
         this.wanhunzhen.showTuPoPanel(param1);
      }
      
      public function setWanHunZhenTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.wanhunzhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setWanHunZhenZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.wanhunzhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setWanHunZhenGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.wanhunzhen.setGoods(param1,param2);
      }
      
      public function setWanHunZhenBtn(param1:Boolean) : void
      {
         this.wanhunzhen.setTuPoBtn(param1);
      }
      
      public function permitWanHunZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.wanhunzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.wanhunzhen,0);
            this.wanhunzhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.wanhunzhenButton);
            this.wanhunzhenObj = new Object();
            this.wanhunzhenObj.neirong = this.wanhunzhen;
            this.wanhunzhenObj.biaoqian = this.wanhunzhenButton;
            this.wanhunzhenObj.name = "27";
            this.wanhunzhenObj.isShow = true;
            this.wanhunzhenObj.dengji = -1;
            this.btnArray4.push(this.wanhunzhenObj);
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(4,"27");
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
            _loc2_ = this.btnArray4.indexOf(this.wanhunzhenObj);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowWanHunZhen() : void
      {
         dispatchEvent(new BaseEvent(WANHUNZHEN));
      }
      
      public function isWanHunZhenLVShow() : Boolean
      {
         return this.wanhunzhen.isTupoCanvasShow();
      }
      
      public function isWanHunZhenShow() : Boolean
      {
         return this.wanhunzhen.visible;
      }
      
      public function setLayout(param1:Boolean) : void
      {
         this.charContainer.setLayout(param1);
         this.setTabBarLayout(param1);
      }
      
      public function showWoDeMenPai() : void
      {
         this.bitmap.visible = false;
         this.initCharPanel(6,"1");
      }
      
      public function setWoDeMenPaiInit(param1:MenPai) : void
      {
         this.woDeMenPai.setWoDeMenPaiInit(true,param1);
      }
      
      public function requstMenPai() : void
      {
         dispatchEvent(new Event(WODEMENPAI));
         this.showBtnByPage(6,0,false);
         this.LeftButtonContainer6.visible = false;
         this.bitmap.visible = false;
         this.setTabBar(6);
      }
      
      public function setWoDeMenPaiAvatar(param1:BitmapData) : void
      {
         this.woDeMenPai.avatar = param1;
      }
      
      public function showWoDeMenPaiResult() : void
      {
         this.woDeMenPai.showMen();
      }
      
      public function permitChuanGong(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.woDeChuanGongButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.woDeChuanGong,0);
            this.woDeChuanGongButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer1.addChild(this.woDeChuanGongButton);
            this.btnArray1.push(this.woDeChuanGongObj);
            this.initCharPanel(1,"16");
         }
         else if(!param1 && this.woDeChuanGongButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.woDeChuanGong != null && this.woDeChuanGong.parent != null)
            {
               this.woDeChuanGong.parent.removeChild(this.woDeChuanGong);
            }
            this.woDeChuanGongButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.woDeChuanGongButton != null && this.woDeChuanGongButton.parent != null)
            {
               this.woDeChuanGongButton.parent.removeChild(this.woDeChuanGongButton);
            }
            _loc2_ = this.btnArray1.indexOf(this.woDeChuanGongObj);
            if(_loc2_ >= 0)
            {
               this.btnArray1.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestChuanGong() : void
      {
         dispatchEvent(new BaseEvent(WODECHUANGONG));
      }
      
      public function showChuanGong(param1:Boolean = false) : void
      {
         this.initCharPanel(1,"16");
      }
      
      public function setChuanGongInit(param1:Goods, param2:Array, param3:Array, param4:Array) : void
      {
         this.woDeChuanGong.setPanel(param1,param2,param3,param4);
      }
      
      public function setChuanGongResult(param1:int, param2:int, param3:int) : void
      {
         this.woDeChuanGong.setResult(param1,param2,param3);
      }
      
      public function requestShowCangBaoGe() : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_XUNZHANG_PANEL,-1);
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
            _loc3_ = this.btnArray1.indexOf(this.cangbaogeObj);
            if(_loc3_ >= 0)
            {
               this.btnArray1.splice(_loc3_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function setTabBarLayout(param1:Boolean) : void
      {
         if(!param1)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("角色"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("功法"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("兵器"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("阵法"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("传奇"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("龙纹刻画"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("门派"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("我的荣誉"),this.onTabClick);
            this.permitCangBaoGe(true);
            this.permitWuxiakapai(false);
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
            this.permitWuxiakapai(false);
            this.permitCangBaoGe(true);
            this.permitXunzhangzhanshi(false);
         }
      }
      
      public function permitFunction(param1:int, param2:Boolean) : void
      {
         var _loc3_:int = param1;
         switch(0)
         {
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function removeDisplayObject(param1:DisplayObject) : void
      {
         if(param1 != null && param1.parent != null)
         {
            param1.parent.removeChild(param1);
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
      
      public function bofangZhenyanouyinYanhua() : void
      {
         this.zhenyanshouyin.bofangYanhua();
      }
      
      public function setZhenYanShouYinAutoBtn(param1:Boolean) : void
      {
         this.zhenyanshouyin.setAutoBtn(param1);
      }
      
      public function permitZhenYanShouYin(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(2,"33");
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
            _loc2_ = this.btnArray2.indexOf(this.zhenyanshouyinObj);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowZhenYanShouYin() : void
      {
         dispatchEvent(new BaseEvent(ZHENYANSHOUYIN));
      }
      
      public function isZhenYanShouYinShow() : Boolean
      {
         return this.zhenyanshouyin.visible;
      }
      
      public function showWoDeRongYu() : void
      {
         this.initCharPanel(7,"1");
         this.bitmap.visible = false;
      }
      
      public function setWoDeRongYuInit(param1:Object, param2:Array) : void
      {
         this.woderongyu.setinitilizeUI(param1,param2);
      }
      
      public function setLongyuandian(param1:int) : void
      {
         this.woderongyu.setinitilizeUIlongyuandian(param1);
      }
      
      public function setWoDeRongYuEnableFun(param1:Boolean) : void
      {
         this.woderongyu.setEnableFun(param1);
      }
      
      public function requestShowWoDeRongYu() : void
      {
         dispatchEvent(new BaseEvent(WODERONGYU));
         this.showBtnByPage(7,0,false);
         this.LeftButtonContainer7.visible = false;
         this.bitmap.visible = false;
         this.setTabBar(7);
      }
      
      public function isWoDeRongYuShow() : Boolean
      {
         return this.woderongyu.visible;
      }
      
      public function showZhenLongQiJu() : void
      {
         this.initCharPanel(4,"28");
      }
      
      public function setZhenLongQiJuInit(param1:ZhenLongQiJuVO) : void
      {
         this.zhenlongqiju.setinitilizeUI(true,param1);
      }
      
      public function showZhenLongQiJuTupoPanel(param1:*) : void
      {
         this.zhenlongqiju.showTuPoPanel(param1);
      }
      
      public function setZhenLongQiJuTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.zhenlongqiju.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhenLongQiJuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.zhenlongqiju.setZhufuzhi(param1,param2,param3);
      }
      
      public function setZhenLongQiJuGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.zhenlongqiju.setGoods(param1,param2);
      }
      
      public function setZhenLongQiJuBtn(param1:Boolean) : void
      {
         this.zhenlongqiju.setTuPoBtn(param1);
      }
      
      public function permitZhenLongQiJu(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.zhenlongqijuButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.zhenlongqiju,0);
            this.zhenlongqijuButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.zhenlongqijuButton);
            this.zhenlongqijuObj = new Object();
            this.zhenlongqijuObj.neirong = this.zhenlongqiju;
            this.zhenlongqijuObj.biaoqian = this.zhenlongqijuButton;
            this.zhenlongqijuObj.name = "28";
            this.zhenlongqijuObj.isShow = true;
            this.zhenlongqijuObj.dengji = -1;
            this.btnArray4.push(this.zhenlongqijuObj);
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
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
            _loc2_ = this.btnArray4.indexOf(this.zhenlongqijuObj);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowZhenLongQiJu() : void
      {
         dispatchEvent(new BaseEvent(ZHENLONGQIJU));
      }
      
      public function isZhenLongQiJuLVShow() : Boolean
      {
         return this.zhenlongqiju.isTupoCanvasShow();
      }
      
      public function isZhenLongQiJuShow() : Boolean
      {
         return this.zhenlongqiju.visible;
      }
      
      public function showShengSiFu() : void
      {
         this.initCharPanel(2,"34");
      }
      
      public function setShengSiFuInit(param1:ShengSiFuVO) : void
      {
         this.shengsifu.setinitilizeUI(true,param1);
      }
      
      public function showShengSiFuTupoPanel(param1:*) : void
      {
         this.shengsifu.showTuPoPanel(param1);
      }
      
      public function setShengSiFuTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.shengsifu.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setShengSiFuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.shengsifu.setZhufuzhi(param1,param2,param3);
      }
      
      public function setShengSiFuGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.shengsifu.setGoods(param1,param2);
      }
      
      public function setShengSiFuBtn(param1:Boolean) : void
      {
         this.shengsifu.setTuPoBtn(param1);
      }
      
      public function permitShengSiFu(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.shengsifuButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.shengsifu,0);
            this.shengsifuButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.shengsifuButton);
            this.shengsifuObj = new Object();
            this.shengsifuObj.neirong = this.shengsifu;
            this.shengsifuObj.biaoqian = this.shengsifuButton;
            this.shengsifuObj.name = "34";
            this.shengsifuObj.isShow = true;
            this.shengsifuObj.dengji = -1;
            this.btnArray2.push(this.shengsifuObj);
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(2,"34");
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
            _loc2_ = this.btnArray2.indexOf(this.shengsifuObj);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowShengSiFu() : void
      {
         dispatchEvent(new BaseEvent(SHENGSIFU));
      }
      
      public function isShengSiFuLVShow() : Boolean
      {
         return this.shengsifu.isTupoCanvasShow();
      }
      
      public function isShengSiFuShow() : Boolean
      {
         return this.shengsifu.visible;
      }
      
      public function showTaoHuaZhen() : void
      {
         this.initCharPanel(4,"29");
      }
      
      public function setTaoHuaZhenInit(param1:TaoHuaZhenVO) : void
      {
         this.taohuazhen.setinitilizeUI(true,param1);
      }
      
      public function showTaoHuaZhenTupoPanel(param1:*) : void
      {
         this.taohuazhen.showTuPoPanel(param1);
      }
      
      public function setTaoHuaZhenTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.taohuazhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setTaoHuaZhenZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.taohuazhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setTaoHuaZhenGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.taohuazhen.setGoods(param1,param2);
      }
      
      public function setTaoHuaZhenBtn(param1:Boolean) : void
      {
         this.taohuazhen.setTuPoBtn(param1);
      }
      
      public function permitTaoHuaZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.taohuazhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.taohuazhen,0);
            this.taohuazhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.taohuazhenButton);
            this.taohuazhenObj = new Object();
            this.taohuazhenObj.neirong = this.taohuazhen;
            this.taohuazhenObj.biaoqian = this.taohuazhenButton;
            this.taohuazhenObj.name = "29";
            this.taohuazhenObj.isShow = true;
            this.taohuazhenObj.dengji = -1;
            this.btnArray4.push(this.taohuazhenObj);
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
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
            _loc2_ = this.btnArray4.indexOf(this.taohuazhenObj);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowTaoHuaZhen() : void
      {
         dispatchEvent(new BaseEvent(TAOHUAZHEN));
      }
      
      public function isTaoHuaZhenLVShow() : Boolean
      {
         return this.taohuazhen.isTupoCanvasShow();
      }
      
      public function isTaoHuaZhenShow() : Boolean
      {
         return this.taohuazhen.visible;
      }
      
      public function showXiaKeXing() : void
      {
         this.initCharPanel(5,"4");
      }
      
      public function showlihua() : void
      {
         this.xiakexing.showlihua();
      }
      
      public function setXiaKeXingInit(param1:XiaKeXingVO, param2:Array) : void
      {
         this.xiakexing.setinitilizeUI(true,param1,param2);
      }
      
      public function permitXiaKeXing(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.xiakexingButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.xiakexing,0);
            this.xiakexingButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer5.addChild(this.xiakexingButton);
            this.xiakexingObj = new Object();
            this.xiakexingObj.neirong = this.xiakexing;
            this.xiakexingObj.biaoqian = this.xiakexingButton;
            this.xiakexingObj.eventType = XIAKEXING;
            this.xiakexingObj.name = "4";
            this.xiakexingObj.isShow = true;
            this.xiakexingObj.dengji = -1;
            this.btnArray5.push(this.xiakexingObj);
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(5,"4");
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
            _loc2_ = this.btnArray5.indexOf(this.xiakexingObj);
            if(_loc2_ >= 0)
            {
               this.btnArray5.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowXiaKeXing() : void
      {
         dispatchEvent(new BaseEvent(XIAKEXING));
      }
      
      public function isXiaKeXingShow() : Boolean
      {
         return this.xiakexing.visible;
      }
      
      public function permitMoLingZhiYi(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(3,"13");
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
            _loc2_ = this.btnArray3.indexOf(this.objMoLingZhiYi);
            if(_loc2_ >= 0)
            {
               this.btnArray3.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowMoLingZhiYi() : void
      {
         dispatchEvent(new BaseEvent(MOLINGZHIYI));
      }
      
      public function showMoLingZhiYi(param1:Boolean = false) : void
      {
         this.initCharPanel(3,"13");
      }
      
      public function setMoLingZhiYiInitialize(param1:MoLingZhiYiVO) : void
      {
         this.molingzhiyi.setInitialize(param1,true);
      }
      
      public function setMoLingZhiYiJiHuo(param1:Boolean) : void
      {
         this.molingzhiyi.setJiHuo(param1);
      }
      
      public function MoLingZhiYiShow(param1:Boolean) : void
      {
         this.molingzhiyi.showMoLingZhiYi(param1);
      }
      
      public function setMoLingZhiYiLingwuInitialize(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.molingzhiyi.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setMoLingZhiYiLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.molingzhiyi.setZhufuzhi(param1,param2,param3);
      }
      
      public function setMoLingZhiYiLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.molingzhiyi.setGoods(param1,param2);
      }
      
      public function setMoLingZhiYiLingwuBtn(param1:Boolean) : void
      {
         this.molingzhiyi.setTuPoBtn(param1);
      }
      
      public function showMoLingZhiYiLingWuPanel(param1:Boolean) : void
      {
         this.molingzhiyi.showTuPoPanel(param1);
      }
      
      public function isMoLingZhiYitupoCanvasShow() : Boolean
      {
         return this.molingzhiyi.isTupoCanvasShow();
      }
      
      public function MoLingZhiYicomposeSuccess() : void
      {
         this.molingzhiyi.showlihua();
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
         this.fumozhangfa.setinitilizeUI(true,param1);
      }
      
      public function showFuMoZhangFaTupoPanel(param1:*) : void
      {
         this.fumozhangfa.showTuPoPanel(param1);
      }
      
      public function setFuMoZhangFaTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.fumozhangfa.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setFuMoZhangFaZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.fumozhangfa.setZhufuzhi(param1,param2,param3);
      }
      
      public function setFuMoZhangFaGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.fumozhangfa.setGoods(param1,param2);
      }
      
      public function setFuMoZhangFaBtn(param1:Boolean) : void
      {
         this.fumozhangfa.setTuPoBtn(param1);
      }
      
      public function permitFuMoZhangFa(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.fumozhangfaButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.fumozhangfa,0);
            this.fumozhangfaButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.fumozhangfaButton);
            this.fumozhangfaObj = new Object();
            this.fumozhangfaObj.neirong = this.fumozhangfa;
            this.fumozhangfaObj.biaoqian = this.fumozhangfaButton;
            this.fumozhangfaObj.name = "35";
            this.fumozhangfaObj.isShow = true;
            this.fumozhangfaObj.dengji = -1;
            this.btnArray2.push(this.fumozhangfaObj);
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(2,"35");
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
            _loc2_ = this.btnArray2.indexOf(this.fumozhangfaObj);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowFuMoZhangFa() : void
      {
         dispatchEvent(new BaseEvent(FUMOZHANGFA));
      }
      
      public function isFuMoZhangFaLVShow() : Boolean
      {
         return this.fumozhangfa.isTupoCanvasShow();
      }
      
      public function isFuMoZhangFaShow() : Boolean
      {
         return this.fumozhangfa.visible;
      }
      
      public function showYuNvSuXinJianFa() : void
      {
         this.initCharPanel(2,"36");
      }
      
      public function setYuNvSuXinJianFaInit(param1:YuNvSuXinJianFaVO) : void
      {
         this.yunvsuxinjianfa.setinitilizeUI(true,param1);
      }
      
      public function showYuNvSuXinJianFaTupoPanel(param1:*) : void
      {
         this.yunvsuxinjianfa.showTuPoPanel(param1);
      }
      
      public function setYuNvSuXinJianFaTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.yunvsuxinjianfa.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setYuNvSuXinJianFaZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.yunvsuxinjianfa.setZhufuzhi(param1,param2,param3);
      }
      
      public function setYuNvSuXinJianFaGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.yunvsuxinjianfa.setGoods(param1,param2);
      }
      
      public function setYuNvSuXinJianFaBtn(param1:Boolean) : void
      {
         this.yunvsuxinjianfa.setTuPoBtn(param1);
      }
      
      public function permitYuNvSuXinJianFa(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.yunvsuxinjianfaButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.yunvsuxinjianfa,0);
            this.yunvsuxinjianfaButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.yunvsuxinjianfaButton);
            this.yunvsuxinjianfaObj = new Object();
            this.yunvsuxinjianfaObj.neirong = this.yunvsuxinjianfa;
            this.yunvsuxinjianfaObj.biaoqian = this.yunvsuxinjianfaButton;
            this.yunvsuxinjianfaObj.name = "36";
            this.yunvsuxinjianfaObj.isShow = true;
            this.yunvsuxinjianfaObj.dengji = -1;
            this.btnArray2.push(this.yunvsuxinjianfaObj);
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(2,"36");
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
            _loc2_ = this.btnArray2.indexOf(this.yunvsuxinjianfaObj);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowYuNvSuXinJianFa() : void
      {
         dispatchEvent(new BaseEvent(YUNVSUXINJIANFA));
      }
      
      public function isYuNvSuXinJianFaLVShow() : Boolean
      {
         return this.yunvsuxinjianfa.isTupoCanvasShow();
      }
      
      public function isYuNvSuXinJianFaShow() : Boolean
      {
         return this.yunvsuxinjianfa.visible;
      }
      
      public function showLieKongJueXing() : void
      {
         this.initCharPanel(3,"14");
      }
      
      public function setLieKongJueXingInit(param1:LieKongJueXingVO) : void
      {
         this.liekongjuexing.setinitilizeUI(true,param1);
      }
      
      public function showLieKongJueXingTupoPanel(param1:*) : void
      {
         this.liekongjuexing.showTuPoPanel(param1);
      }
      
      public function setLieKongJueXingTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.liekongjuexing.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setLieKongJueXingZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.liekongjuexing.setZhufuzhi(param1,param2,param3);
      }
      
      public function setLieKongJueXingGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.liekongjuexing.setGoods(param1,param2);
      }
      
      public function setLieKongJueXingBtn(param1:Boolean) : void
      {
         this.liekongjuexing.setTuPoBtn(param1);
      }
      
      public function permitLieKongJueXing(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(3,"14");
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
            _loc2_ = this.btnArray3.indexOf(this.objLieKongJueXing);
            if(_loc2_ >= 0)
            {
               this.btnArray3.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowLieKongJueXing() : void
      {
         dispatchEvent(new BaseEvent(LIEKONGJUEXING));
      }
      
      public function isLieKongJueXingLVShow() : Boolean
      {
         return this.liekongjuexing.isTupoCanvasShow();
      }
      
      public function isLieKongJueXingShow() : Boolean
      {
         return this.liekongjuexing.visible;
      }
      
      public function showTianYuYanMeng() : void
      {
         this.initCharPanel(4,"30");
      }
      
      public function setTianYuYanMengInit(param1:TianYuYanMengVO) : void
      {
         this.tianyuyanmeng.setinitilizeUI(true,param1);
      }
      
      public function showTianYuYanMengTupoPanel(param1:*) : void
      {
         this.tianyuyanmeng.showTuPoPanel(param1);
      }
      
      public function setTianYuYanMengTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.tianyuyanmeng.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setTianYuYanMengZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.tianyuyanmeng.setZhufuzhi(param1,param2,param3);
      }
      
      public function setTianYuYanMengGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.tianyuyanmeng.setGoods(param1,param2);
      }
      
      public function setTianYuYanMengBtn(param1:Boolean) : void
      {
         this.tianyuyanmeng.setTuPoBtn(param1);
      }
      
      public function permitTianYuYanMeng(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.tianyuyanmengButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.tianyuyanmeng,0);
            this.tianyuyanmengButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.tianyuyanmengButton);
            this.tianyuyanmengObj = new Object();
            this.tianyuyanmengObj.neirong = this.tianyuyanmeng;
            this.tianyuyanmengObj.biaoqian = this.tianyuyanmengButton;
            this.tianyuyanmengObj.name = "30";
            this.tianyuyanmengObj.isShow = true;
            this.tianyuyanmengObj.dengji = -1;
            this.btnArray4.push(this.tianyuyanmengObj);
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(4,"30");
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
            _loc2_ = this.btnArray4.indexOf(this.tianyuyanmengObj);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowTianYuYanMeng() : void
      {
         dispatchEvent(new BaseEvent(TIANYUYANMENG));
      }
      
      public function isTianYuYanMengLVShow() : Boolean
      {
         return this.tianyuyanmeng.isTupoCanvasShow();
      }
      
      public function isTianYuYanMengShow() : Boolean
      {
         return this.tianyuyanmeng.visible;
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
         this.tianshanliuyangzhang.setinitilizeUI(true,param1);
      }
      
      public function showTianShanLiuYangZhangTupoPanel(param1:*) : void
      {
         this.tianshanliuyangzhang.showTuPoPanel(param1);
      }
      
      public function setTianShanLiuYangZhangTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.tianshanliuyangzhang.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setTianShanLiuYangZhangZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.tianshanliuyangzhang.setZhufuzhi(param1,param2,param3);
      }
      
      public function setTianShanLiuYangZhangGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.tianshanliuyangzhang.setGoods(param1,param2);
      }
      
      public function setTianShanLiuYangZhangBtn(param1:Boolean) : void
      {
         this.tianshanliuyangzhang.setTuPoBtn(param1);
      }
      
      public function permitTianShanLiuYangZhang(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.tianshanliuyangzhangButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.tianshanliuyangzhang,0);
            this.tianshanliuyangzhangButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.tianshanliuyangzhangButton);
            this.tianshanliuyangzhangObj = new Object();
            this.tianshanliuyangzhangObj.neirong = this.tianshanliuyangzhang;
            this.tianshanliuyangzhangObj.biaoqian = this.tianshanliuyangzhangButton;
            this.tianshanliuyangzhangObj.name = "37";
            this.tianshanliuyangzhangObj.isShow = true;
            this.tianshanliuyangzhangObj.dengji = -1;
            this.btnArray2.push(this.tianshanliuyangzhangObj);
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(2,"37");
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
            _loc2_ = this.btnArray2.indexOf(this.tianshanliuyangzhangObj);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowTianShanLiuYangZhang() : void
      {
         dispatchEvent(new BaseEvent(TIANSHANLIUYANGZHANG));
      }
      
      public function isTianShanLiuYangZhangLVShow() : Boolean
      {
         return this.tianshanliuyangzhang.isTupoCanvasShow();
      }
      
      public function isTianShanLiuYangZhangShow() : Boolean
      {
         return this.tianshanliuyangzhang.visible;
      }
      
      public function set_MingJiaoZhangWuJi(param1:Array) : void
      {
         this.aojianshenjiangji.set_MingJiaoZhangWuJi(param1);
      }
      
      public function showAoJianShenJiangJi() : void
      {
         this.initCharPanel(3,"15");
      }
      
      public function aojianshenjiangCl(param1:Boolean) : void
      {
         this.aojianshenjiangji.showTuPoPanel(param1);
      }
      
      public function set_AoJianShenJiangJi(param1:Array) : void
      {
         this.aojianshenjiangji.set_AoJianShenJiangXunZhang(param1);
      }
      
      public function setAoJianShenJiangJiInit(param1:AoJianShenJiangJiVO) : void
      {
         this.aojianshenjiangji.setinitilizeUI(true,param1);
      }
      
      public function permitAoJianShenJiangJi(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
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
            _loc2_ = this.btnArray3.indexOf(this.objAoJianShenJiangJi);
            if(_loc2_ >= 0)
            {
               this.btnArray3.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowAoJianShenJiangJi() : void
      {
         dispatchEvent(new BaseEvent(AOJIANSHENJIANGJI));
      }
      
      public function isAoJianShenJiangJiShow() : Boolean
      {
         return this.aojianshenjiangji.visible;
      }
      
      public function showDuoMingShiSanJian() : void
      {
         this.initCharPanel(2,"38");
      }
      
      public function setDuoMingShiSanJianInit(param1:DuoMingShiSanJianVo) : void
      {
         this.duomingshisanjian.setinitilizeUI(true,param1);
      }
      
      public function showDuoMingShiSanJianTupoPanel(param1:*) : void
      {
         this.duomingshisanjian.showTuPoPanel(param1);
      }
      
      public function setDuoMingShiSanJianTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.duomingshisanjian.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setDuoMingShiSanJianZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.duomingshisanjian.setZhufuzhi(param1,param2,param3);
      }
      
      public function setDuoMingShiSanJianGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.duomingshisanjian.setGoods(param1,param2);
      }
      
      public function setDuoMingShiSanJianBtn(param1:Boolean) : void
      {
         this.duomingshisanjian.setTuPoBtn(param1);
      }
      
      public function permitDuoMingShiSanJian(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.duomingshisanjianButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.duomingshisanjian,0);
            this.duomingshisanjianButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.duomingshisanjianButton);
            this.objDuomingshisanjian = new Object();
            this.objDuomingshisanjian.neirong = this.duomingshisanjian;
            this.objDuomingshisanjian.biaoqian = this.duomingshisanjianButton;
            this.objDuomingshisanjian.name = "38";
            this.objDuomingshisanjian.isShow = true;
            this.objDuomingshisanjian.dengji = -1;
            this.btnArray2.push(this.objDuomingshisanjian);
            this.initCharPanel(2,"38");
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
            _loc2_ = this.btnArray2.indexOf(this.objDuomingshisanjian);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowDuoMingShiSanJian() : void
      {
         dispatchEvent(new BaseEvent(DUOMINGSHISANJIAN));
      }
      
      public function isDuoMingShiSanJianLVShow() : Boolean
      {
         return this.duomingshisanjian.isTupoCanvasShow();
      }
      
      public function isDuoMingShiSanJianShow() : Boolean
      {
         return this.duomingshisanjian.visible;
      }
      
      public function requestShowWuXiaKaPai() : void
      {
         PipeManager.sendMsg(PipeConstants.REQUEST_WUXIAKAPAI,-1);
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
            this.wuxiakapaiObj.name = "17";
            this.wuxiakapaiObj.isShow = true;
            this.wuxiakapaiObj.dengji = -1;
            this.btnArray1.push(this.wuxiakapaiObj);
            this.initCharPanel(1,"17");
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
      
      public function permitRijinlun(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            _loc2_ = this.btnArray3.indexOf(this.objRijinlun);
            if(_loc2_ >= 0)
            {
               this.btnArray3.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
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
      
      public function setRijinlunLingwuInitialize(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.rijinlun.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setRijinlunLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.rijinlun.setZhufuzhi(param1,param2,param3);
      }
      
      public function setRijinlunLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.rijinlun.setGoods(param1,param2);
      }
      
      public function setRijinlunLingwuBtn(param1:Boolean) : void
      {
         this.rijinlun.setTuPoBtn(param1);
      }
      
      public function showRijinlunLingWuPanel(param1:Boolean) : void
      {
         this.rijinlun.showTuPoPanel(param1);
      }
      
      public function isRijinluntupoCanvasShow() : Boolean
      {
         return this.rijinlun.isTupoCanvasShow();
      }
      
      public function RijinlunShow(param1:int) : void
      {
         this.rijinlun.showRijinlun(param1);
      }
      
      public function set_Rijinlun(param1:Array) : void
      {
         this.rijinlun.set_Rijinlun(param1);
      }
      
      public function showKongMingQuan() : void
      {
         this.initCharPanel(2,"39");
      }
      
      public function setKongMingQuanInit(param1:KongMingQuanVo) : void
      {
         this.kongmingquan.setinitilizeUI(true,param1);
      }
      
      public function showKongMingQuanTupoPanel(param1:Boolean) : void
      {
         this.kongmingquan.showTuPoPanel(param1);
      }
      
      public function setKongMingQuanTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.kongmingquan.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setKongMingQuanZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.kongmingquan.setZhufuzhi(param1,param2,param3);
      }
      
      public function setKongMingQuanGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.kongmingquan.setGoods(param1,param2);
      }
      
      public function setKongMingQuanBtn(param1:Boolean) : void
      {
         this.kongmingquan.setTuPoBtn(param1);
      }
      
      public function permitKongMingQuan(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.kongmingquanButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.kongmingquan,0);
            this.kongmingquanButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.kongmingquanButton);
            this.objKongmingquan = new Object();
            this.objKongmingquan.neirong = this.kongmingquan;
            this.objKongmingquan.biaoqian = this.kongmingquanButton;
            this.objKongmingquan.name = "39";
            this.objKongmingquan.isShow = true;
            this.objKongmingquan.dengji = -1;
            this.btnArray2.push(this.objKongmingquan);
            this.initCharPanel(2,"39");
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
            _loc2_ = this.btnArray2.indexOf(this.objKongmingquan);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowKongMingQuan() : void
      {
         dispatchEvent(new BaseEvent(KONGMINGQUAN));
      }
      
      public function isKongMingQuanLVShow() : Boolean
      {
         return this.kongmingquan.isTupoCanvasShow();
      }
      
      public function isKongMingQuanShow() : Boolean
      {
         return this.kongmingquan.visible;
      }
      
      public function set_XueYinJueXing(param1:Array) : void
      {
         this.xueyinjuexing.set_XueYinJueXing(param1);
      }
      
      public function showXueYinJueXing() : void
      {
         this.initCharPanel(3,"17");
      }
      
      public function setXueYinJueXingInit(param1:XueYinJueXingVO) : void
      {
         this.xueyinjuexing.setinitilizeUI(true,param1);
      }
      
      public function showXueYinJueXingTupoPanel(param1:*) : void
      {
         this.xueyinjuexing.showTuPoPanel(param1);
      }
      
      public function setXueYinJueXingTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.xueyinjuexing.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setXueYinJueXingZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.xueyinjuexing.setZhufuzhi(param1,param2,param3);
      }
      
      public function setXueYinJueXingGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.xueyinjuexing.setGoods(param1,param2);
      }
      
      public function setXueYinJueXingBtn(param1:Boolean) : void
      {
         this.xueyinjuexing.setTuPoBtn(param1);
      }
      
      public function permitXueYinJueXing(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(3,"17");
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
            _loc2_ = this.btnArray3.indexOf(this.objXueYinJueXing);
            if(_loc2_ >= 0)
            {
               this.btnArray3.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowXueYinJueXing() : void
      {
         dispatchEvent(new BaseEvent(XUEYINJUEXING));
      }
      
      public function isXueYinJueXingLVShow() : Boolean
      {
         return this.xueyinjuexing.isTupoCanvasShow();
      }
      
      public function isXueYinJueXingShow() : Boolean
      {
         return this.xueyinjuexing.visible;
      }
      
      public function set_HuaShanLunJian(param1:Array) : void
      {
         this.huashanlunjian.set_HuaShanLunJian(param1);
      }
      
      public function showHuaShanLunJian() : void
      {
         this.initCharPanel(5,"5");
      }
      
      public function setHuashanlunjianInit(param1:int, param2:Object, param3:int, param4:int, param5:String, param6:String, param7:String) : void
      {
         this.huashanlunjian.setInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function permitHuashanlunjian(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.huashanlunjianButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.huashanlunjian,0);
            this.huashanlunjianButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer5.addChild(this.huashanlunjianButton);
            this.objHuashanlunjian = new Object();
            this.objHuashanlunjian.neirong = this.huashanlunjian;
            this.objHuashanlunjian.biaoqian = this.huashanlunjianButton;
            this.objHuashanlunjian.eventType = HUASHANLUNJIAN;
            this.objHuashanlunjian.name = "5";
            this.objHuashanlunjian.isShow = true;
            this.objHuashanlunjian.dengji = -1;
            this.btnArray5.push(this.objHuashanlunjian);
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(5,"5");
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
            _loc2_ = this.btnArray5.indexOf(this.objHuashanlunjian);
            if(_loc2_ >= 0)
            {
               this.btnArray5.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowHuashanlunjian() : void
      {
         dispatchEvent(new BaseEvent(HUASHANLUNJIAN));
      }
      
      public function isHuashanlunjianShow() : Boolean
      {
         return this.huashanlunjian.visible;
      }
      
      public function showHuashanlunjianTupoPanel(param1:Boolean) : void
      {
         this.huashanlunjian.showTupoPanel(param1);
      }
      
      public function settHuashanlunjianTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.huashanlunjian.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function settHuashanlunjianZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.huashanlunjian.setZhufuzhi(param1,param2,param3);
      }
      
      public function settHuashanlunjianGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.huashanlunjian.setTupoGoods(param1,param2);
      }
      
      public function setHuashanlunjianBtn(param1:Boolean) : void
      {
         this.huashanlunjian.setTuPoBtn(param1);
      }
      
      public function huashanlunjianTupoShow() : Boolean
      {
         return this.huashanlunjian.isTupoCanvasShow();
      }
      
      public function permitYuejinlun(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            _loc2_ = this.btnArray3.indexOf(this.objYuejinlun);
            if(_loc2_ >= 0)
            {
               this.btnArray3.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowYuejinlun() : void
      {
         dispatchEvent(new BaseEvent(YUEJINLUN));
      }
      
      public function showYuejinlun() : void
      {
         this.initCharPanel(3,"18");
      }
      
      public function setYuejinlunInitialize(param1:int, param2:int, param3:int, param4:String, param5:String, param6:String, param7:int, param8:String) : void
      {
         this.yuejinlun.setData(true,param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setYuejinlunLingwuInitialize(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.yuejinlun.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setYuejinlunLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.yuejinlun.setZhufuzhi(param1,param2,param3);
      }
      
      public function setYuejinlunLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.yuejinlun.setGoods(param1,param2);
      }
      
      public function setYuejinlunLingwuBtn(param1:Boolean) : void
      {
         this.yuejinlun.setTuPoBtn(param1);
      }
      
      public function showYuejinlunLingWuPanel(param1:Boolean) : void
      {
         this.yuejinlun.showTuPoPanel(param1);
      }
      
      public function isYuejinluntupoCanvasShow() : Boolean
      {
         return this.yuejinlun.isTupoCanvasShow();
      }
      
      public function YuejinlunShow(param1:int) : void
      {
         this.yuejinlun.showYuejinlun(param1);
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
         this.hanbingshenzhang.setinitilizeUI(true,param1);
      }
      
      public function showHanBingShenZhangTupoPanel(param1:*) : void
      {
         this.hanbingshenzhang.showTuPoPanel(param1);
      }
      
      public function setHanBingShenZhangTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.hanbingshenzhang.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setHanBingShenZhangZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.hanbingshenzhang.setZhufuzhi(param1,param2,param3);
      }
      
      public function setHanBingShenZhangGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.hanbingshenzhang.setGoods(param1,param2);
      }
      
      public function setHanBingShenZhangBtn(param1:Boolean) : void
      {
         this.hanbingshenzhang.setTuPoBtn(param1);
      }
      
      public function permitHanBingShenZhang(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.hanbingshenzhangButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.hanbingshenzhang,0);
            this.hanbingshenzhangButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.hanbingshenzhangButton);
            this.objHanbingshenzhang = new Object();
            this.objHanbingshenzhang.neirong = this.hanbingshenzhang;
            this.objHanbingshenzhang.biaoqian = this.hanbingshenzhangButton;
            this.objHanbingshenzhang.name = "40";
            this.objHanbingshenzhang.isShow = true;
            this.objHanbingshenzhang.dengji = -1;
            this.btnArray2.push(this.objHanbingshenzhang);
            this.initCharPanel(2,"40");
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
            _loc2_ = this.btnArray2.indexOf(this.objHanbingshenzhang);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowHanBingShenZhang() : void
      {
         dispatchEvent(new BaseEvent(HANBINGSHENZHANG));
      }
      
      public function isHanBingShenZhangLVShow() : Boolean
      {
         return this.hanbingshenzhang.isTupoCanvasShow();
      }
      
      public function isHanBingShenZhangShow() : Boolean
      {
         return this.hanbingshenzhang.visible;
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
         this.lingxiyizhi.setinitilizeUI(true,param1);
      }
      
      public function showLingXiYiZhiTupoPanel(param1:*) : void
      {
         this.lingxiyizhi.showTuPoPanel(param1);
      }
      
      public function setLingXiYiZhiTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.lingxiyizhi.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setLingXiYiZhiZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.lingxiyizhi.setZhufuzhi(param1,param2,param3);
      }
      
      public function setLingXiYiZhiGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.lingxiyizhi.setGoods(param1,param2);
      }
      
      public function setLingXiYiZhiBtn(param1:Boolean) : void
      {
         this.lingxiyizhi.setTuPoBtn(param1);
      }
      
      public function permitLingXiYiZhi(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.lingxiyizhiButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.lingxiyizhi,0);
            this.lingxiyizhiButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer2.addChild(this.lingxiyizhiButton);
            this.lingxiyizhiObj = new Object();
            this.lingxiyizhiObj.neirong = this.lingxiyizhi;
            this.lingxiyizhiObj.biaoqian = this.lingxiyizhiButton;
            this.lingxiyizhiObj.name = "41";
            this.lingxiyizhiObj.isShow = true;
            this.lingxiyizhiObj.dengji = -1;
            this.btnArray2.push(this.lingxiyizhiObj);
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(2,"41");
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
            _loc2_ = this.btnArray2.indexOf(this.lingxiyizhiObj);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowLingXiYiZhi() : void
      {
         dispatchEvent(new BaseEvent(LINGXIYIZHI));
      }
      
      public function isLingXiYiZhiLVShow() : Boolean
      {
         return this.lingxiyizhi.isTupoCanvasShow();
      }
      
      public function isLingXiYiZhiShow() : Boolean
      {
         return this.lingxiyizhi.visible;
      }
      
      public function set_YNliulongzhuangbei(param1:Array) : void
      {
         this.ynliulongzhuangbei.set_Equip(param1,true);
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
         this.ynliulongzhuangbei.setData(param1,param2,param3,true);
      }
      
      public function YNliulongzhuangbeiVisible() : Boolean
      {
         return this.ynliulongzhuangbei.visible;
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
      
      public function YNJingLingVisible() : Boolean
      {
         return this.ynJingLing.visible;
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
         this.ynGuiHun.setData(param1,true);
      }
      
      public function YNGuiHunVisible() : Boolean
      {
         return this.ynGuiHun.visible;
      }
      
      public function YNGuiHunGoodsChange() : void
      {
         this.ynGuiHun.goodschange();
      }
      
      public function set_YNJinfengdiao(param1:Array) : void
      {
         this.ynJinfengdiao.set_Equip(param1);
      }
      
      public function permitYNJinfengdiao(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.ynjinfengdiaoButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.ynJinfengdiao,0);
            this.ynjinfengdiaoButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.ynjinfengdiaoButton);
            this.ynjinfengdiaoObj = new Object();
            this.ynjinfengdiaoObj.neirong = this.ynJinfengdiao;
            this.ynjinfengdiaoObj.biaoqian = this.ynjinfengdiaoButton;
            this.ynjinfengdiaoObj.name = "20";
            this.ynjinfengdiaoObj.isShow = true;
            this.ynjinfengdiaoObj.dengji = -1;
            this.btnArray3.push(this.ynjinfengdiaoObj);
            this.initCharPanel(3,"20");
         }
         else if(!param1 && this.ynjinfengdiaoButton.hasEventListener(MouseEvent.CLICK))
         {
            if(this.ynJinfengdiao != null && this.ynJinfengdiao.parent != null)
            {
               this.ynJinfengdiao.parent.removeChild(this.ynJinfengdiao);
            }
            this.ynjinfengdiaoButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.ynjinfengdiaoButton != null && this.ynjinfengdiaoButton.parent != null)
            {
               this.ynjinfengdiaoButton.parent.removeChild(this.ynjinfengdiaoButton);
            }
            _loc2_ = this.btnArray3.indexOf(this.ynjinfengdiaoObj);
            if(_loc2_ >= 0)
            {
               this.btnArray3.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function showYNJinfengdiao() : void
      {
         this.initCharPanel(3,"20");
      }
      
      public function requestShowYNJinfengdiao() : void
      {
         dispatchEvent(new BaseEvent(YNJINFENGDIAO));
      }
      
      public function setYNJinfengdiao(param1:Array, param2:String, param3:String) : void
      {
         this.ynJinfengdiao.setData(param1,param2,param3,true);
      }
      
      public function YNJinfengdiaoVisible() : Boolean
      {
         return this.ynJinfengdiao.visible;
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
         this.xingxiuzhen.setinitilizeUI(true,param1);
      }
      
      public function showXingXiuZhenTupoPanel(param1:*) : void
      {
         this.xingxiuzhen.showTuPoPanel(param1);
      }
      
      public function setXingXiuZhenTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.xingxiuzhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setXingXiuZhenZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.xingxiuzhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setXingXiuZhenGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.xingxiuzhen.setGoods(param1,param2);
      }
      
      public function setXingXiuZhenBtn(param1:Boolean) : void
      {
         this.xingxiuzhen.setTuPoBtn(param1);
      }
      
      public function permitXingXiuZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.xingxiuzhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.xingxiuzhen,0);
            this.xingxiuzhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.xingxiuzhenButton);
            this.xingxiuzhenObj = new Object();
            this.xingxiuzhenObj.neirong = this.xingxiuzhen;
            this.xingxiuzhenObj.biaoqian = this.xingxiuzhenButton;
            this.xingxiuzhenObj.name = "31";
            this.xingxiuzhenObj.isShow = true;
            this.xingxiuzhenObj.dengji = -1;
            this.btnArray4.push(this.xingxiuzhenObj);
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(4,"31");
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
            _loc2_ = this.btnArray4.indexOf(this.xingxiuzhenObj);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowXingXiuZhen() : void
      {
         dispatchEvent(new BaseEvent(XINGXIUZHEN));
      }
      
      public function isXingXiuZhenLVShow() : Boolean
      {
         return this.xingxiuzhen.isTupoCanvasShow();
      }
      
      public function isXingXiuZhenShow() : Boolean
      {
         return this.xingxiuzhen.visible;
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
         this.xingxiuzhen1.setinitilizeUI(true,param1);
      }
      
      public function showXingXiuZhen1TupoPanel(param1:*) : void
      {
         this.xingxiuzhen1.showTuPoPanel(param1);
      }
      
      public function setXingXiuZhen1TupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.xingxiuzhen1.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setXingXiuZhen1Zhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.xingxiuzhen1.setZhufuzhi(param1,param2,param3);
      }
      
      public function setXingXiuZhen1Goods(param1:Goods, param2:Boolean = true) : void
      {
         this.xingxiuzhen1.setGoods(param1,param2);
      }
      
      public function setXingXiuZhen1Btn(param1:Boolean) : void
      {
         this.xingxiuzhen1.setTuPoBtn(param1);
      }
      
      public function permitXingXiuZhen1(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.xingxiuzhen1Button.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.xingxiuzhen1,0);
            this.xingxiuzhen1Button.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.xingxiuzhen1Button);
            this.xingxiuzhen1Obj = new Object();
            this.xingxiuzhen1Obj.neirong = this.xingxiuzhen1;
            this.xingxiuzhen1Obj.biaoqian = this.xingxiuzhen1Button;
            this.xingxiuzhen1Obj.name = "35";
            this.xingxiuzhen1Obj.isShow = true;
            this.xingxiuzhen1Obj.dengji = -1;
            this.btnArray4.push(this.xingxiuzhen1Obj);
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(4,"35");
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
            _loc2_ = this.btnArray4.indexOf(this.xingxiuzhen1Obj);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowXingXiuZhen1() : void
      {
         dispatchEvent(new BaseEvent(XINGXIUZHEN1));
      }
      
      public function isXingXiuZhen1LVShow() : Boolean
      {
         return this.xingxiuzhen1.isTupoCanvasShow();
      }
      
      public function isXingXiuZhen1Show() : Boolean
      {
         return this.xingxiuzhen1.visible;
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
         this.qishazhen.setinitilizeUI(true,param1);
      }
      
      public function showQiShaZhenTupoPanel(param1:*) : void
      {
         this.qishazhen.showTuPoPanel(param1);
      }
      
      public function setQiShaZhenTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.qishazhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setQiShaZhenZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.qishazhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setQiShaZhenGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.qishazhen.setGoods(param1,param2);
      }
      
      public function setQiShaZhenBtn(param1:Boolean) : void
      {
         this.qishazhen.setTuPoBtn(param1);
      }
      
      public function permitQiShaZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.qishazhenButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.qishazhen,0);
            this.qishazhenButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer4.addChild(this.qishazhenButton);
            this.objQishazhen = new Object();
            this.objQishazhen.neirong = this.qishazhen;
            this.objQishazhen.biaoqian = this.qishazhenButton;
            this.objQishazhen.name = "32";
            this.objQishazhen.isShow = true;
            this.objQishazhen.dengji = -1;
            this.btnArray4.push(this.objQishazhen);
            this.initCharPanel(4,"32");
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
            _loc2_ = this.btnArray4.indexOf(this.objQishazhen);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowQiShaZhen() : void
      {
         dispatchEvent(new BaseEvent(QISHAZHEN));
      }
      
      public function isQiShaZhenLVShow() : Boolean
      {
         return this.qishazhen.isTupoCanvasShow();
      }
      
      public function isQiShaZhenShow() : Boolean
      {
         return this.qishazhen.visible;
      }
      
      public function showFuWenKeHua() : void
      {
         this.initCharPanel(4,"33");
      }
      
      public function permitFuWenKeHua(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(4,"33");
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
            _loc2_ = this.btnArray4.indexOf(this.objFuWenKeHua);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestFuWenKeHua() : void
      {
         dispatchEvent(new BaseEvent(FUWENKEHUA));
      }
      
      public function initFuWenKeHuaPanel(param1:int, param2:int, param3:Array, param4:int, param5:int, param6:int) : void
      {
         this.fuWenKeHua.setinitilizeUI(true,param1,param2,param3,param4,param5,param6);
      }
      
      public function setFuWenData(param1:int, param2:int, param3:String, param4:String, param5:int, param6:Boolean, param7:Boolean, param8:int = 0, param9:int = 0) : void
      {
         this.fuWenKeHua.setFuWenData(true,param1,param2,param3,param4,param5,param6,param7,param8,param9);
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
         this.liangyiweichenzhen.setinitilizeUI(true,param1);
      }
      
      public function showLiangYiWeiChenZhenTupoPanel(param1:*) : void
      {
         this.liangyiweichenzhen.showTuPoPanel(param1);
      }
      
      public function setLiangYiWeiChenZhenTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.liangyiweichenzhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setLiangYiWeiChenZhenZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.liangyiweichenzhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setLiangYiWeiChenZhenGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.liangyiweichenzhen.setGoods(param1,param2);
      }
      
      public function setLiangYiWeiChenZhenBtn(param1:Boolean) : void
      {
         this.liangyiweichenzhen.setTuPoBtn(param1);
      }
      
      public function permitLiangYiWeiChenZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(4,"34");
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
            _loc2_ = this.btnArray4.indexOf(this.objLiangYiWeiChenZhen);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowLiangYiWeiChenZhen() : void
      {
         dispatchEvent(new BaseEvent(LIANGYIWEICHENZHEN));
      }
      
      public function isLiangYiWeiChenZhenLVShow() : Boolean
      {
         return this.liangyiweichenzhen.isTupoCanvasShow();
      }
      
      public function isLiangYiWeiChenZhenShow() : Boolean
      {
         return this.liangyiweichenzhen.visible;
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
         this.sijuejianzhen.setinitilizeUI(true,param1);
      }
      
      public function showSiJueJianZhenTupoPanel(param1:*) : void
      {
         this.sijuejianzhen.showTuPoPanel(param1);
      }
      
      public function setSiJueJianZhenTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.sijuejianzhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setSiJueJianZhenZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.sijuejianzhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setSiJueJianZhenGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.sijuejianzhen.setGoods(param1,param2);
      }
      
      public function setSiJueJianZhenBtn(param1:Boolean) : void
      {
         this.sijuejianzhen.setTuPoBtn(param1);
      }
      
      public function permitSiJueJianZhen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.initCharPanel(4,"36");
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
            _loc2_ = this.btnArray4.indexOf(this.objSiJueJianZhen);
            if(_loc2_ >= 0)
            {
               this.btnArray4.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowSiJueJianZhen() : void
      {
         dispatchEvent(new BaseEvent(SIJUEJIANZHEN));
      }
      
      public function isSiJueJianZhenLVShow() : Boolean
      {
         return this.sijuejianzhen.isTupoCanvasShow();
      }
      
      public function isSiJueJianZhenShow() : Boolean
      {
         return this.sijuejianzhen.visible;
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
      
      public function permitXiangYangZhiZhan(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.xiangyangzhizhanButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.xiangyangzhizhan,0);
            this.xiangyangzhizhanButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer5.addChild(this.xiangyangzhizhanButton);
            this.objXiangYangZhiZhan = new Object();
            this.objXiangYangZhiZhan.neirong = this.xiangyangzhizhan;
            this.objXiangYangZhiZhan.biaoqian = this.xiangyangzhizhanButton;
            this.objXiangYangZhiZhan.eventType = XIANGYANGZHIZHAN;
            this.objXiangYangZhiZhan.name = "9";
            this.objXiangYangZhiZhan.isShow = true;
            this.objXiangYangZhiZhan.dengji = -1;
            this.btnArray5.push(this.objXiangYangZhiZhan);
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
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
            _loc2_ = this.btnArray5.indexOf(this.objXiangYangZhiZhan);
            if(_loc2_ >= 0)
            {
               this.btnArray5.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowXiangYangZhiZhan() : void
      {
         dispatchEvent(new BaseEvent(XIANGYANGZHIZHAN));
      }
      
      public function isXiangYangZhiZhanShow() : Boolean
      {
         return this.xiangyangzhizhan.visible;
      }
      
      public function showXiangYangZhiZhanTupoPanel(param1:Boolean) : void
      {
         this.xiangyangzhizhan.showTupoPanel(param1);
      }
      
      public function settXiangYangZhiZhanTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.xiangyangzhizhan.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function settXiangYangZhiZhanZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.xiangyangzhizhan.setZhufuzhi(param1,param2,param3);
      }
      
      public function settXiangYangZhiZhanGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.xiangyangzhizhan.setTupoGoods(param1,param2);
      }
      
      public function setXiangYangZhiZhanBtn(param1:Boolean) : void
      {
         this.xiangyangzhizhan.setTuPoBtn(param1);
      }
      
      public function xiangyangzhizhanTupoShow() : Boolean
      {
         return this.xiangyangzhizhan.isTupoCanvasShow();
      }
      
      public function showJingLeiQiang() : void
      {
         this.initCharPanel(3,"21");
      }
      
      public function setJingLeiQiangInit(param1:JingLeiQiangVo) : void
      {
         this.jingleiqiang.setinitilizeUI(true,param1);
      }
      
      public function showJingLeiQiangTupoPanel(param1:*) : void
      {
         this.jingleiqiang.showTuPoPanel(param1);
      }
      
      public function setJingLeiQiangTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.jingleiqiang.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setJingLeiQiangZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.jingleiqiang.setZhufuzhi(param1,param2,param3);
      }
      
      public function setJingLeiQiangGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.jingleiqiang.setGoods(param1,param2);
      }
      
      public function setJingLeiQiangBtn(param1:Boolean) : void
      {
         this.jingleiqiang.setTuPoBtn(param1);
      }
      
      public function permitJingLeiQiang(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.jingleiqiangButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.jingleiqiang,0);
            this.jingleiqiangButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.jingleiqiangButton);
            this.jingleiqiangObj = new Object();
            this.jingleiqiangObj.neirong = this.jingleiqiang;
            this.jingleiqiangObj.biaoqian = this.jingleiqiangButton;
            this.jingleiqiangObj.name = "21";
            this.jingleiqiangObj.isShow = true;
            this.jingleiqiangObj.dengji = -1;
            this.btnArray3.push(this.jingleiqiangObj);
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(3,"21");
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
            _loc2_ = this.btnArray3.indexOf(this.jingleiqiangObj);
            if(_loc2_ >= 0)
            {
               this.btnArray3.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowJingLeiQiang() : void
      {
         dispatchEvent(new BaseEvent(JINGLEIQIANG));
      }
      
      public function isJingLeiQiangLVShow() : Boolean
      {
         return this.jingleiqiang.isTupoCanvasShow();
      }
      
      public function isJingLeiQiangShow() : Boolean
      {
         return this.jingleiqiang.visible;
      }
      
      public function showMingYuGong() : void
      {
         this.initCharPanel(2,"43");
      }
      
      public function initializateMingYuGong(param1:Object) : void
      {
         this.mingyugong.setData(param1,true);
      }
      
      public function setMingYuGongTuPo(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.mingyugong.setInitialize(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setMingYuGongZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.mingyugong.setZhufuzhi(param1,param2,param3);
      }
      
      public function setMingYuGongGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.mingyugong.setGoods(param1,param2);
      }
      
      public function setMingYuGongBtn(param1:Boolean) : void
      {
         this.mingyugong.setBtn(param1);
      }
      
      public function showMingYuGongTuPoPanel(param1:*) : void
      {
         this.mingyugong.onShowLv(param1);
      }
      
      public function isMingYuGongTuPoShow() : Boolean
      {
         return this.mingyugong.isMingYuGongtupoCanvasShow();
      }
      
      public function requestMingYuGong() : void
      {
         dispatchEvent(new Event(GETMINGYUGONG));
      }
      
      public function setMingYuGongAvatar(param1:BitmapData) : void
      {
         this.mingyugong.avatar = param1;
      }
      
      public function set_RongQingAiYi(param1:Array) : void
      {
         this.mingyugong.set_RongQingAiYi(param1);
      }
      
      public function showTuLongDao() : void
      {
         this.initCharPanel(3,"22");
      }
      
      public function setTuLongDaoInit(param1:TuLongDaoVO) : void
      {
         this.tulongdao.setinitilizeUI(true,param1);
      }
      
      public function showTuLongDaoTupoPanel(param1:*) : void
      {
         this.tulongdao.showTuPoPanel(param1);
      }
      
      public function setTuLongDaoTupoPanel(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.tulongdao.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setTuLongDaoZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.tulongdao.setZhufuzhi(param1,param2,param3);
      }
      
      public function setTuLongDaoGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.tulongdao.setGoods(param1,param2);
      }
      
      public function setTuLongDaoBtn(param1:Boolean) : void
      {
         this.tulongdao.setTuPoBtn(param1);
      }
      
      public function permitTuLongDao(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.tulongdaoButton.hasEventListener(MouseEvent.CLICK))
         {
            addChildAt(this.tulongdao,0);
            this.tulongdaoButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer3.addChild(this.tulongdaoButton);
            this.tulongdaoObj = new Object();
            this.tulongdaoObj.neirong = this.tulongdao;
            this.tulongdaoObj.biaoqian = this.tulongdaoButton;
            this.tulongdaoObj.name = "22";
            this.tulongdaoObj.isShow = true;
            this.tulongdaoObj.dengji = -1;
            this.btnArray3.push(this.tulongdaoObj);
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
            this.initCharPanel(3,"22");
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
            _loc2_ = this.btnArray3.indexOf(this.tulongdaoObj);
            if(_loc2_ >= 0)
            {
               this.btnArray3.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowTuLongDao() : void
      {
         dispatchEvent(new BaseEvent(GETTULONGDAO));
      }
      
      public function isTuLongDaoLVShow() : Boolean
      {
         return this.tulongdao.isTupoCanvasShow();
      }
      
      public function isTuLongDaoShow() : Boolean
      {
         return this.tulongdao.visible;
      }
      
      public function permitJinSheJianFa(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
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
            _loc2_ = this.btnArray2.indexOf(this.objJinSheJianFa);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
      }
      
      public function showJinSheJianFa() : void
      {
         this.initCharPanel(2,"42");
      }
      
      public function initializateJinSheJianFa(param1:JinSheJianFaVO) : void
      {
         this.jinSheJianFa.initializateJinSheJianFa(param1,true);
      }
      
      public function setJinSheJianFaTuPo(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.jinSheJianFa.setInitialize(param1,param2,param3,param4,param5,param6);
      }
      
      public function setJinSheJianFaZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.jinSheJianFa.setZhufuzhi(param1,param2,param3);
      }
      
      public function setJinSheJianFaGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.jinSheJianFa.setGoods(param1,param2);
      }
      
      public function setJinSheJianFaBtn(param1:Boolean) : void
      {
         this.jinSheJianFa.setBtn(param1);
      }
      
      public function showJinSheJianFaTuPoPanel(param1:*) : void
      {
         this.jinSheJianFa.onShowLv(param1);
      }
      
      public function isJinSheJianFaTuPoShow() : Boolean
      {
         return this.jinSheJianFa.isTuPoCanvasShow();
      }
      
      public function requestJinSheJianFa() : void
      {
         dispatchEvent(new Event(GETJINSHEJIANFA));
      }
      
      public function showCuqiankungfu() : void
      {
         this.initCharPanel(2,"44");
      }
      
      public function setCuqiankungfuInit(param1:CuQianKungFuVO) : void
      {
         this.cuqiankungfu.setInitialize(true,param1);
      }
      
      public function showFeedBackPanel(param1:Boolean, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         this.cuqiankungfu.showFeedBackPanel(param1,param2,param3,param4,param5,param6);
      }
      
      public function permitCuqiankungfu(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
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
            _loc2_ = this.btnArray2.indexOf(this.objCuQianKungFu);
            if(_loc2_ >= 0)
            {
               this.btnArray2.splice(_loc2_,1);
            }
         }
      }
      
      public function requestShowCuqiankungfu() : void
      {
         dispatchEvent(new BaseEvent(GETCUQIANKUNGFU));
      }
      
      public function isCuqiankungfuLVShow() : Boolean
      {
         return true;
      }
      
      public function isCuqiankungfuShow() : Boolean
      {
         return this.cuqiankungfu.visible;
      }
      
      public function setCuQianKungFuJinduNum(param1:int, param2:int, param3:int, param4:Boolean) : *
      {
         this.cuqiankungfu.setJinduNum(param1,param2,param3,param4);
      }
      
      public function permitQingDieShuangRen(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
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
            _loc2_ = this.btnArray3.indexOf(this.objQingDieShuangRen);
            if(_loc2_ >= 0)
            {
               this.btnArray3.splice(_loc2_,1);
            }
         }
      }
      
      public function showQingDieShuangRen() : void
      {
         this.initCharPanel(3,"23");
      }
      
      public function initializateQingDieShuangRen(param1:QingDieShuangRenVO) : void
      {
         this.qingdieshuangren.initializateQingDieShuangRen(param1);
      }
      
      public function setQingDieShuangRenTuPo(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.qingdieshuangren.setInitialize(param1,param2,param3,param4,param5,param6);
      }
      
      public function setQingDieShuangRenZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.qingdieshuangren.setZhufuzhi(param1,param2,param3);
      }
      
      public function setQingDieShuangRenGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.qingdieshuangren.setGoods(param1,param2);
      }
      
      public function setQingDieShuangRenBtn(param1:Boolean) : void
      {
         this.qingdieshuangren.setBtn(param1);
      }
      
      public function showQingDieShuangRenTuPoPanel(param1:*) : void
      {
         this.qingdieshuangren.onShowLv(param1);
      }
      
      public function isQingDieShuangRenTuPoShow() : Boolean
      {
         return this.qingdieshuangren.isTuPoCanvasShow();
      }
      
      public function requestQingDieShuangRen() : void
      {
         dispatchEvent(new Event(GETQINGDIESHUANGREN));
      }
      
      public function showMenPaiJueXue() : void
      {
         this.initCharPanel(5,"10");
      }
      
      public function setMenPaiJueXueBtn(param1:Boolean) : void
      {
      }
      
      public function permitMenPaiJueXue(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.menpaijuexueButton.hasEventListener(MouseEvent.CLICK))
         {
            this.menpaijuexueButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer5.addChild(this.menpaijuexueButton);
            this.objMenPaiJueXue = new Object();
            this.objMenPaiJueXue.neirong = this.menpaijuexue;
            this.objMenPaiJueXue.biaoqian = this.menpaijuexueButton;
            this.objMenPaiJueXue.eventType = MENPAIJUEXUE;
            this.objMenPaiJueXue.name = "10";
            this.objMenPaiJueXue.isShow = true;
            this.objMenPaiJueXue.dengji = -1;
            this.btnArray5.push(this.objMenPaiJueXue);
            this.initCharPanel(5,"10");
         }
         else if(!param1 && this.menpaijuexueButton.hasEventListener(MouseEvent.CLICK))
         {
            this.menpaijuexueButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.menpaijuexueButton != null && this.menpaijuexueButton.parent != null)
            {
               this.menpaijuexueButton.parent.removeChild(this.menpaijuexueButton);
            }
            _loc2_ = this.btnArray5.indexOf(this.objMenPaiJueXue);
            if(_loc2_ >= 0)
            {
               this.btnArray5.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowMenPaiJueXue() : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_MENPAIJUEXUE_PANEL);
      }
      
      public function isMenPaiJueXueShow() : Boolean
      {
         return this.menpaijuexue.visible;
      }
      
      public function showMenPaiNeiFa() : void
      {
         this.initCharPanel(5,"11");
      }
      
      public function setMenPaiNeiFaBtn(param1:Boolean) : void
      {
      }
      
      public function permitMenPaiNeiFa(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.menpaineifaButton.hasEventListener(MouseEvent.CLICK))
         {
            this.menpaineifaButton.addEventListener(MouseEvent.CLICK,this.onButtonClick);
            this.LeftButtonContainer5.addChild(this.menpaineifaButton);
            this.objMenPaiNeiFa = new Object();
            this.objMenPaiNeiFa.neirong = this.menpaineifa;
            this.objMenPaiNeiFa.biaoqian = this.menpaineifaButton;
            this.objMenPaiNeiFa.eventType = MENPAINEIFA;
            this.objMenPaiNeiFa.name = "11";
            this.objMenPaiNeiFa.isShow = true;
            this.objMenPaiNeiFa.dengji = -1;
            this.btnArray5.push(this.objMenPaiNeiFa);
            this.initCharPanel(5,"11");
         }
         else if(!param1 && this.menpaineifaButton.hasEventListener(MouseEvent.CLICK))
         {
            this.menpaineifaButton.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
            if(this.menpaineifaButton != null && this.menpaineifaButton.parent != null)
            {
               this.menpaineifaButton.parent.removeChild(this.menpaineifaButton);
            }
            _loc2_ = this.btnArray5.indexOf(this.objMenPaiNeiFa);
            if(_loc2_ >= 0)
            {
               this.btnArray5.splice(_loc2_,1);
            }
         }
         this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
      }
      
      public function requestShowMenPaiNeiFa() : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_MENPAINEIFA_PANEL);
      }
      
      public function isMenPaiNeiFaShow() : Boolean
      {
         return this.menpaijuexue.visible;
      }
      
      public function permitCangJianXuanTian(param1:Boolean) : void
      {
         var _loc2_:int = 0;
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
            this.setIsShowBiaoqian(GameInstance.mainCharData.attributeInfo.lv);
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
            _loc2_ = this.btnArray3.indexOf(this.objCangJianXuanTian);
            if(_loc2_ >= 0)
            {
               this.btnArray3.splice(_loc2_,1);
            }
         }
      }
      
      public function showCangJianXuanTian() : void
      {
         this.initCharPanel(3,"24");
      }
      
      public function initializateCangJianXuanTian(param1:CangJianXuanTianVO) : void
      {
         this.cangjianxuantian.initializateCangJianXuanTian(param1);
      }
      
      public function setCangJianXuanTianTuPo(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:int) : void
      {
         this.cangjianxuantian.setInitialize(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setCangJianXuanTianZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.cangjianxuantian.setZhufuzhi(param1,param2,param3);
      }
      
      public function setCangJianXuanTianGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.cangjianxuantian.setGoods(param1,param2);
      }
      
      public function setCangJianXuanTianBtn(param1:Boolean) : void
      {
         this.cangjianxuantian.setBtn(param1);
      }
      
      public function showCangJianXuanTianTuPoPanel(param1:*) : void
      {
         this.cangjianxuantian.onShowLv(param1);
      }
      
      public function isCangJianXuanTianTuPoShow() : Boolean
      {
         return this.cangjianxuantian.isTuPoCanvasShow();
      }
      
      public function requestCangJianXuanTian() : void
      {
         dispatchEvent(new Event(GETCANGJIANXUANTIAN));
      }
   }
}

