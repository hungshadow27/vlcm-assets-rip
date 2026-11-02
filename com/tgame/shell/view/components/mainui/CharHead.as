package com.tgame.shell.view.components.mainui
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.timer.vo.TimerData;
   import com.zcp.manager.LoaderManager;
   import com.zcp.manager.TimerManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.GlowFilter;
   import flash.geom.Rectangle;
   import flash.text.*;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class CharHead extends Sprite
   {
      
      private var headContainer:Sprite;
      
      public var head:Bitmap;
      
      public var redBar:ColorBar;
      
      public var blueBar:ColorBar;
      
      public var yellowBar:ColorBar;
      
      public var charName:FTextArea;
      
      public var level:FTextArea;
      
      public var leaderIco:Bitmap;
      
      public var pkBtn:FSimpleButton;
      
      private var pkContainer:FCanvas;
      
      private var peaceBtn:FSimpleButton;
      
      private var teamBtn:FSimpleButton;
      
      private var partyBtn:FSimpleButton;
      
      private var allBtn:FSimpleButton;
      
      private var peaceCheck:FCheckBox;
      
      private var teamCheck:FCheckBox;
      
      private var partyCheck:FCheckBox;
      
      private var allCheck:FCheckBox;
      
      private var autoBtn:FSimpleButton;
      
      private var regulateContainer:Sprite;
      
      private var redRegulateBtn:FSimpleButton;
      
      private var blutRegulateBtn:FSimpleButton;
      
      private var yellowRegulateBtn:FSimpleButton;
      
      private var comboEffect:MovieClip;
      
      private var fireEffect:MovieClip;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var changeHeadCanvas:FCanvas;
      
      private var boyHeadContainer:Sprite;
      
      private var grilHeadContainer:Sprite;
      
      private var headCloseBtn:FSimpleButton;
      
      private var zhanBtn:FSimpleButton;
      
      private var shiShiZhanKuangBtn:FSimpleButton;
      
      private var kuaFuBaoGuoBtn:FSimpleButton;
      
      private var fbColorBarBg:DisplayObject;
      
      private var fbPureColor:MovieClip;
      
      private var fbOrangeColor:MovieClip;
      
      private var mcPureSpr:Sprite;
      
      private var mcOrangeSpr:Sprite;
      
      private var ftPure:FTextArea;
      
      private var ftOrange:FTextArea;
      
      private var fbSpr:Sprite;
      
      private var pureSpr:Sprite;
      
      private var orangeSpr:Sprite;
      
      private var moxueCircle:MovieClip;
      
      private var wanfaBtn:FSimpleButton;
      
      private var optionBtn:FSimpleButton;
      
      private var xianshiCanvas:Sprite;
      
      private var xianshiText:FTextArea;
      
      public var xianshiBtn:FSimpleButton;
      
      private var xianshiTimer:TimerData;
      
      private var yasuiqianCanvas:Sprite;
      
      private var yasuiqianText:FTextArea;
      
      public var yasuiqianBtn:FSimpleButton;
      
      private var yasuiqianTimer:Timer;
      
      private var time:int;
      
      private var stratTime:int;
      
      private var biwuCrossPlatformBtn:FSimpleButton;
      
      private var ciShaShuoMingBtn:FSimpleButton;
      
      private var aojianZhengbaBtn:FSimpleButton;
      
      private var QianDaoBtn:FSimpleButton;
      
      private var JiLeiZhiBtn:FSimpleButton;
      
      public var juBaoPenBtn:FSimpleButton;
      
      private var danTiaoWangBtn:FSimpleButton;
      
      private var yeWaiBossBtn:FSimpleButton;
      
      private var tianJiangXiangRuiBtn:FSimpleButton;
      
      private var biWuZhaoQinBtn:FSimpleButton;
      
      private var xinMoBtn:FSimpleButton;
      
      private var ynRankBtn:FSimpleButton;
      
      private var ynJubaopenBtn:FSimpleButton;
      
      private var ynJubaopenBtn1:FSimpleButton;
      
      private var ynjvbaopenBtn2:NewSkinButton;
      
      private var ynjvbaopenBtn3:NewSkinButton;
      
      private var ynjvbaopenBtn5:NewSkinButton;
      
      private var ynShijiebeiBtn:FSimpleButton;
      
      private var yn888ShopBtn:FSimpleButton;
      
      private var ynXingyunzhuanpanBtn:FSimpleButton;
      
      private var wanbaogeBtn:FSimpleButton;
      
      private var huangTuBayeBtn:FSimpleButton;
      
      private var btnSpr:Sprite;
      
      private var btnShow:FSimpleButton;
      
      private var btnHide:FSimpleButton;
      
      private var wangzhezhibangBtn:FSimpleButton;
      
      private var wangzhezhibangGuizeBtn:FSimpleButton;
      
      private var ynOnlineBtn:FSimpleButton;
      
      private var zhizhanzhishangBtn:FSimpleButton;
      
      private var ynRichangBtn:FSimpleButton;
      
      private var ynFengdengjieBtn:FSimpleButton;
      
      private var ynXinshouBtn:FSimpleButton;
      
      private var ynChristmasBtn:FSimpleButton;
      
      private var ynLongzhizhufuBtn:FSimpleButton;
      
      private var ynChristmasGiftBtn:FSimpleButton;
      
      private var ynChristmasHuodongBtn:FSimpleButton;
      
      private var ynWebBtn1:FSimpleButton;
      
      private var ynJinshenHuodongBtn:FSimpleButton;
      
      private var ynWulinShenbingBtn:FSimpleButton;
      
      private var yn38jieBtn:FSimpleButton;
      
      private var ynRoseBtn:FSimpleButton;
      
      private var ynLianyaoBtn:FSimpleButton;
      
      private var ynXiongWangBtn:FSimpleButton;
      
      private var ynYXDXBtn:FSimpleButton;
      
      private var ynMIKBtn:FSimpleButton;
      
      private var ynShiziBtn:FSimpleButton;
      
      private var ynLHCZBtn:FSimpleButton;
      
      private var ynSCCZBtn:NewSkinButton;
      
      private var yuanXiaoJieBtn:NewSkinButton;
      
      private var yurenjieBtn:FSimpleButton;
      
      private var fengzhengjieBtn:NewSkinButton;
      
      private var doudizhuBtn:FSimpleButton;
      
      private var duanwujieBtn:FSimpleButton;
      
      private var qixijieBtn:NewSkinButton;
      
      private var woHuCangLongBtn:FSimpleButton;
      
      private var wishingTreeBtn:FSimpleButton;
      
      private var newyearBtn:FSimpleButton;
      
      private var fabaoBtn:FSimpleButton;
      
      private var shiJieBeiBtn:NewSkinButton;
      
      private var shengxiaoBtn:FSimpleButton;
      
      private var tunShiTianDiBtn:NewSkinButton;
      
      private var buchangfubenBtn:FSimpleButton;
      
      private var xiaozhukuaipaoBtn:NewSkinButton;
      
      private var ynBookRankBtn:FSimpleButton;
      
      private var yn2015zhongqiuBtn:FSimpleButton;
      
      private var ynXsksBtn:FSimpleButton;
      
      private var ynQHZSBtn:FSimpleButton;
      
      private var ynQHZSBtn2:FSimpleButton;
      
      private var ynQHZSBtn3:FSimpleButton;
      
      private var ynQHZSBtn4:FSimpleButton;
      
      private var yn2016CGBtn:FSimpleButton;
      
      private var yn2016onlineBtn:NewSkinButton;
      
      private var yn2016DLBtn:FSimpleButton;
      
      private var yn2016newyearBtn:FSimpleButton;
      
      private var yn2016yuanxiaoBtn:NewSkinButton;
      
      private var yn201638huodongBtn:NewSkinButton;
      
      private var yn201638huodong1Btn:NewSkinButton;
      
      private var yn2016zhuanpanBtn:NewSkinButton;
      
      private var ynChongzhidafa:NewSkinButton;
      
      private var ynBaimeiguiBtn:NewSkinButton;
      
      private var ynWZZBBtn:NewSkinButton;
      
      private var ynZMQZBtn:NewSkinButton;
      
      private var ynSBBKSYBtn:NewSkinButton;
      
      private var ynXSKSBtn:NewSkinButton;
      
      private var ynWZWZBtn:NewSkinButton;
      
      private var ynASSLBtn:NewSkinButton;
      
      private var ynDDSQBtn:NewSkinButton;
      
      private var ynXFBtn:NewSkinButton;
      
      private var longfengdangpuBtn:NewSkinButton;
      
      private var vipMc:MovieClip;
      
      private var vipMcSpr:Sprite;
      
      private var ynXWHDBtn:NewSkinButton;
      
      private var ynChongzhiBtn:FSimpleButton;
      
      private var duiXueRenBtn:NewSkinButton;
      
      private var yn18:DisplayObject;
      
      private var ynXFHDBtn:NewSkinButton;
      
      private var ynXianHeZhanGongBtn:NewSkinButton;
      
      private var ynJieFangRiBtn:NewSkinButton;
      
      private var ynWuYiBtn:NewSkinButton;
      
      private var ynYouHuiBtn:NewSkinButton;
      
      private var ynXianglonghutiButton:NewSkinButton;
      
      private var ynouzhouzuqiuButton:NewSkinButton;
      
      private var ertongjieBtn:NewSkinButton;
      
      private var zhongQiuJieBtn:NewSkinButton;
      
      private var moxueNow:int;
      
      private var moxueMax:int;
      
      private var showBtn:NewSkinButton;
      
      private var hideBtn:NewSkinButton;
      
      private var wushenBtn:NewSkinButton;
      
      private var youhui519Btn:NewSkinButton;
      
      private var cjqhBtn:NewSkinButton;
      
      private var yn61huodongBtn:NewSkinButton;
      
      private var ynouzhouzuqiu2Button:NewSkinButton;
      
      private var ynKillBee:NewSkinButton;
      
      private var ynDuanWuBtn:NewSkinButton;
      
      private var ynBiFangChuShiBtn:NewSkinButton;
      
      private var ynYouHui2Btn:NewSkinButton;
      
      private var ynSuperStrongBtn:NewSkinButton;
      
      private var yn2016zuqiuBtn:NewSkinButton;
      
      private var ynQiseyiseBtn:NewSkinButton;
      
      private var ynZhienBtn:NewSkinButton;
      
      private var ynZhuilongxueshaBtn:NewSkinButton;
      
      private var ynLongjingzhibaoBtn:NewSkinButton;
      
      private var ynZhengdouBtn:NewSkinButton;
      
      private var ynWuzhuanghudouBtn:NewSkinButton;
      
      private var ynKaizhanBtn:NewSkinButton;
      
      private var ynWangbangBtn:NewSkinButton;
      
      private var ynSongmanxinaiBtn:NewSkinButton;
      
      private var ynXiatiankuaileBtn:NewSkinButton;
      
      private var ynXiatiankuaile2Btn:NewSkinButton;
      
      private var ynXiatiankuaile3Btn:NewSkinButton;
      
      private var ynXiatiankuaile4Btn:NewSkinButton;
      
      private var ynHuangrugeshiBtn:NewSkinButton;
      
      private var ynSilingdazhanBtn:NewSkinButton;
      
      private var ynDazaoshenbingBtn:NewSkinButton;
      
      private var ynTiandinghunpoBtn:NewSkinButton;
      
      private var ynZhouqicailuBtn:NewSkinButton;
      
      private var ynLongjinglibaoBtn:NewSkinButton;
      
      private var ynZongjuesaiduihuanBtn:NewSkinButton;
      
      private var ynGaoshouwushuangBtn:NewSkinButton;
      
      private var ynShengzhanshiBtn:NewSkinButton;
      
      private var ynLiehuoshengxieBtn:NewSkinButton;
      
      private var ynWujuegongfaBtn:NewSkinButton;
      
      private var ynShenmiliwuBtn:NewSkinButton;
      
      private var hunqianmengrao:NewSkinButton;
      
      private var lexinchuji:NewSkinButton;
      
      private var ynZhouyihuodongBtn:NewSkinButton;
      
      private var ynZhouerhuodongBtn:NewSkinButton;
      
      private var ynZhouerhuodong2Btn:NewSkinButton;
      
      private var ynZhousanhuodongBtn:NewSkinButton;
      
      private var ynZhousihuodongBtn:NewSkinButton;
      
      private var ynZhouwuhuodongBtn:NewSkinButton;
      
      private var ynZhouliuhuodongBtn:NewSkinButton;
      
      private var ynZhourihuodongBtn:NewSkinButton;
      
      private var ynMeirihuodong3Btn:NewSkinButton;
      
      private var ynYulanhejieBtn:NewSkinButton;
      
      private var ynJingsuidongxiaBtn:NewSkinButton;
      
      private var ynQiziquanzhenjiaoBtn:NewSkinButton;
      
      private var ynKaizhenyuanBtn:NewSkinButton;
      
      private var ynKaizhenyuan3Btn:NewSkinButton;
      
      private var ynBayuediBtn:NewSkinButton;
      
      private var ynXianglongjingBtn:NewSkinButton;
      
      private var ynQijianyingxiongBtn:NewSkinButton;
      
      private var ynGuoqinghuodongBtn:NewSkinButton;
      
      private var ynPaihangbangBtn:NewSkinButton;
      
      private var ynYingxiongshijianBtn:NewSkinButton;
      
      private var ynChongjiuzhiyangBtn:NewSkinButton;
      
      private var ynYuelungujiBtn:NewSkinButton;
      
      private var ynXiangyangyueseBtn:NewSkinButton;
      
      private var ynQunyingquhuiBtn:NewSkinButton;
      
      private var ynWushenBtn:NewSkinButton;
      
      private var ynWushen2Btn:NewSkinButton;
      
      private var ynXichuanhongmianbaihuapaoBtn:NewSkinButton;
      
      private var ynShenmilibaoBtn:NewSkinButton;
      
      private var ynKaizhenyuan2Btn:NewSkinButton;
      
      private var ynWangzhezhengxiongBtn:NewSkinButton;
      
      private var ynZhongjizuoqishendanBtn:NewSkinButton;
      
      private var ynZhongjizuoqishendan2Btn:NewSkinButton;
      
      private var ynZuoqipeichangBtn:NewSkinButton;
      
      private var ynWangbangchuzhanBtn:NewSkinButton;
      
      private var ynWeixilibaoBtn:NewSkinButton;
      
      private var ynJiuyuediBtn:NewSkinButton;
      
      private var ynQiongjinzhanyiBtn:NewSkinButton;
      
      private var ynFanliBtn:NewSkinButton;
      
      private var ynFuqitongxinBtn:NewSkinButton;
      
      private var ynSilongtianzhuaBtn:NewSkinButton;
      
      private var ynWuseduohuaBtn:NewSkinButton;
      
      private var ynYuenanfunvjieBtn:NewSkinButton;
      
      private var ynLonghunBtn:NewSkinButton;
      
      private var ynLonghun2Btn:NewSkinButton;
      
      private var ynLonghun3Btn:NewSkinButton;
      
      private var ynZhanjipiaodangBtn:NewSkinButton;
      
      private var ynAojianwunianBtn:NewSkinButton;
      
      private var ynTianmajianBtn:NewSkinButton;
      
      private var ynWunianzhimengBtn:NewSkinButton;
      
      private var ynWunianzhienBtn:NewSkinButton;
      
      private var ynTianmidangaoBtn:NewSkinButton;
      
      private var ynShengrizhoujiBtn:NewSkinButton;
      
      private var ynWujinkuaileBtn:NewSkinButton;
      
      private var ynBaguaiwushendunBtn:NewSkinButton;
      
      private var ynTupowugongBtn:NewSkinButton;
      
      private var ynLiupaijingjiBtn:NewSkinButton;
      
      private var ynLiumaijianBtn:NewSkinButton;
      
      private var ynXunshixuedaoBtn:NewSkinButton;
      
      private var ynYidazunshiBtn:NewSkinButton;
      
      private var ynYingbinzhouliBtn:NewSkinButton;
      
      private var ynWangzheBtn:NewSkinButton;
      
      private var ynZhouwuguangliangBtn:NewSkinButton;
      
      private var ynwuhunjianBtn:NewSkinButton;
      
      private var ynDingfengshenshouBtn:NewSkinButton;
      
      private var ynTianxiangwangzheBtn:NewSkinButton;
      
      private var ynQisehuluBtn:NewSkinButton;
      
      private var ynBansuizuqiuduiBtn:NewSkinButton;
      
      private var ynDingfengzhouqiBtn:NewSkinButton;
      
      private var ynZhentianshenqiBtn:NewSkinButton;
      
      private var ynLongjingzhangBtn:NewSkinButton;
      
      private var ynFeilongjingBtn:NewSkinButton;
      
      private var ynFeilongjing2Btn:NewSkinButton;
      
      private var ynFeilongjing3Btn:NewSkinButton;
      
      private var ynBanjuesailingjiangBtn:NewSkinButton;
      
      private var ynXunzhaobaozangBtn:NewSkinButton;
      
      private var ynJingxijinpiaodaliBtn:NewSkinButton;
      
      private var ynZhentianjiBtn:NewSkinButton;
      
      private var ynHuashanlunjianBtn:NewSkinButton;
      
      private var ynHuashanwuzhangBtn:NewSkinButton;
      
      private var ynTianxueshenbingBtn:NewSkinButton;
      
      private var ynShengdanjinpiaoBtn:NewSkinButton;
      
      private var ynShengdanjieBtn:NewSkinButton;
      
      private var ynZhenbaogeBtn:NewSkinButton;
      
      private var ynZhenbaoge2Btn:NewSkinButton;
      
      private var ynTaohuajiuBtn:NewSkinButton;
      
      private var ynTaohuajiu2Btn:NewSkinButton;
      
      private var ynTaohuajiu3Btn:NewSkinButton;
      
      private var ynKaichunwanfuBtn:NewSkinButton;
      
      private var ynXinnianlibaoBtn:NewSkinButton;
      
      private var ynXianglongchaojiBtn:NewSkinButton;
      
      private var ynXianglongchaoji2Btn:NewSkinButton;
      
      private var ynXianglongchaoji3Btn:NewSkinButton;
      
      private var ynTengtianyuBtn:NewSkinButton;
      
      private var ynTengtianyuBtn2:NewSkinButton;
      
      private var ynWeiyongwushuangBtn:NewSkinButton;
      
      private var ynWujinjindingriBtn:NewSkinButton;
      
      private var ynWujinjindingri2Btn:NewSkinButton;
      
      private var ynWujinjindingri3Btn:NewSkinButton;
      
      private var ynXinnianyasuiqianBtn:NewSkinButton;
      
      private var ynFangyanhuaBtn:NewSkinButton;
      
      private var ynZaowangBtn:NewSkinButton;
      
      private var ynChunjie123Btn:NewSkinButton;
      
      private var ynXiongjiquanBtn:NewSkinButton;
      
      private var ynChunjieduilianBtn:NewSkinButton;
      
      private var ynGaishishenlongBtn:NewSkinButton;
      
      private var ynGuguchengqinBtn:NewSkinButton;
      
      private var ynYuanyangxishuiBtn:NewSkinButton;
      
      private var ynjvbaopen6Btn:NewSkinButton;
      
      private var ynTianyuchanBtn:NewSkinButton;
      
      private var ynTianshenshiBtn:NewSkinButton;
      
      private var ynQixingzhuangbeiBtn:NewSkinButton;
      
      private var ynLingDanZhenPin1Btn:NewSkinButton;
      
      private var ynLingDanZhenPin2Btn:NewSkinButton;
      
      private var ynLingDanZhenPin3Btn:NewSkinButton;
      
      private var ynErYueDiBtn:NewSkinButton;
      
      private var ynXiangYangDuiJue1Btn:NewSkinButton;
      
      private var ynXiangYangDuiJue2Btn:NewSkinButton;
      
      private var ynXiangYangDuiJue3Btn:NewSkinButton;
      
      private var ynWuJinJianBtn:NewSkinButton;
      
      private var ynYingXiongChuBaoBtn:NewSkinButton;
      
      private var moxueBtn:NewSkinButton;
      
      private var guosetianxiangBtn:NewSkinButton;
      
      private var ynwudushengzhenBtn:NewSkinButton;
      
      private var jiangHunBtn:NewSkinButton;
      
      private var Jueshijiaren1Btn:NewSkinButton;
      
      private var Jueshijiaren2Btn:NewSkinButton;
      
      private var Jueshijiaren3Btn:NewSkinButton;
      
      private var AiqingtangguoBtn:NewSkinButton;
      
      private var AidehuibaoBtn:NewSkinButton;
      
      private var ZhongyuanbaobiaoBtn:NewSkinButton;
      
      private var ouleBtn:NewSkinButton;
      
      private var ynyurenjieBtn:NewSkinButton;
      
      private var xiongwangdaliBtn:NewSkinButton;
      
      private var TiandaoBtn:NewSkinButton;
      
      private var ZhuixunxianglongBtn:NewSkinButton;
      
      private var YouhuizhouqiBtn:NewSkinButton;
      
      private var ynSanYueDiBtn:NewSkinButton;
      
      private var ynShenghuoBtn:NewSkinButton;
      
      private var ynShenfengBtn:NewSkinButton;
      
      private var ynWulinzhibaoBtn:NewSkinButton;
      
      private var ynWangzhezhibang5Btn:NewSkinButton;
      
      private var ynBumiezhuqueBtn:NewSkinButton;
      
      private var ynJingyingjuhuiBtn:NewSkinButton;
      
      private var ynKaizhan5Btn:NewSkinButton;
      
      private var duanwujie2015Btn:NewSkinButton;
      
      private var ynQuanlongBtn:NewSkinButton;
      
      private var ynWulinmijiBtn:NewSkinButton;
      
      private var ynTianshizhouqiBtn:NewSkinButton;
      
      private var ynSiyuediBtn:NewSkinButton;
      
      private var ynZhanshenzhongyuanBtn:NewSkinButton;
      
      private var ynDajieyouhuiBtn:NewSkinButton;
      
      private var ynNantianhaoqiBtn:NewSkinButton;
      
      private var ynRongguanBtn:NewSkinButton;
      
      private var btnBaGuaZhen:NewSkinButton;
      
      private var ynZhenpinShangchengBtn:NewSkinButton;
      
      private var ynJuezhanShangchengBtn:NewSkinButton;
      
      private var ynFodanBtn:NewSkinButton;
      
      private var ynWulindazhanBtn:NewSkinButton;
      
      private var ynYXMingchengBtn:NewSkinButton;
      
      private var ynWandulingBtn:NewSkinButton;
      
      private var ynJianghuluwuBtn:NewSkinButton;
      
      private var ynWuduBtn:NewSkinButton;
      
      private var ynDuiJuezhouqiBtn:NewSkinButton;
      
      private var yn0519Btn:NewSkinButton;
      
      private var ynErtongjieBtn:NewSkinButton;
      
      private var ynTangmenjuejiBtn:NewSkinButton;
      
      private var ynLianbaojianBtn:NewSkinButton;
      
      private var ynJianshexiangyangBtn:NewSkinButton;
      
      private var ynKuangbaoBtn:NewSkinButton;
      
      private var ynDianfengzhouqiBtn:NewSkinButton;
      
      private var ynQingzhuBtn:NewSkinButton;
      
      private var ynMeitianyouhuiBtn:NewSkinButton;
      
      private var ynShenfeng1Btn:NewSkinButton;
      
      private var ynShenfeng2Btn:NewSkinButton;
      
      private var ynZhenpinShangcheng2Btn:NewSkinButton;
      
      private var ynJuezhanShangcheng2Btn:NewSkinButton;
      
      private var ynMeitianyouhui2Btn:NewSkinButton;
      
      private var ynHuoyueBtn:NewSkinButton;
      
      private var shijianshalouBtn:NewSkinButton;
      
      private var ynwudushengzhen1Btn:NewSkinButton;
      
      private var ynwudushengzhen2Btn:NewSkinButton;
      
      private var ynTengtianyu3Btn:NewSkinButton;
      
      private var ynjingye1Btn:NewSkinButton;
      
      private var ynLiuyueyuanmanBtn:NewSkinButton;
      
      private var ynLiuyueqingzhuBtn:NewSkinButton;
      
      private var ynFangfengzheng170621Btn:NewSkinButton;
      
      private var ynLiuyuediBtn:NewSkinButton;
      
      private var ynChewuquanBtn:NewSkinButton;
      
      private var ynwudushengzhen3Btn:NewSkinButton;
      
      private var ynwudushengzhen4Btn:NewSkinButton;
      
      private var ynwudushengzhen5Btn:NewSkinButton;
      
      private var ynwudushengzhen6Btn:NewSkinButton;
      
      private var ynMeitianchongzhilibaoBtn:NewSkinButton;
      
      private var ynShenshougumuBtn:NewSkinButton;
      
      private var ynFeilongshenbaoBtn:NewSkinButton;
      
      private var ynDishiBtn:NewSkinButton;
      
      private var ynNewTengtianyu1Btn:NewSkinButton;
      
      private var ynNewTengtianyu2Btn:NewSkinButton;
      
      private var ynNewTengtianyu3Btn:NewSkinButton;
      
      private var ynNewTengtianyu4Btn:NewSkinButton;
      
      private var ynNewTengtianyu5Btn:NewSkinButton;
      
      private var ynNewTengtianyu6Btn:NewSkinButton;
      
      private var ynNewTengtianyu7Btn:NewSkinButton;
      
      private var ynNewTengtianyu8Btn:NewSkinButton;
      
      private var ynNewTengtianyu9Btn:NewSkinButton;
      
      private var ynNewTengtianyu10Btn:NewSkinButton;
      
      private var ynNewTengtianyu11Btn:NewSkinButton;
      
      private var ynNewTengtianyu12Btn:NewSkinButton;
      
      private var ynNewTengtianyu13Btn:NewSkinButton;
      
      private var ynNewTengtianyu14Btn:NewSkinButton;
      
      private var ynWei300Btn:NewSkinButton;
      
      private var ynFeishengjingjieBtn:NewSkinButton;
      
      private var ynShouchongshijianBtn:NewSkinButton;
      
      private var ynMoshizhouqiBtn:NewSkinButton;
      
      private var ynXiatianzhienBtn:NewSkinButton;
      
      private var ynBayuetouBtn:NewSkinButton;
      
      private var ynTonglefeishengjingjieBtn:NewSkinButton;
      
      private var ynZhanzhengBtn:NewSkinButton;
      
      private var ynBuchangBtn:NewSkinButton;
      
      private var ynMobingjingongBtn:NewSkinButton;
      
      private var ynZhouqiyouhuiBtn:NewSkinButton;
      
      private var ynGumuzhengdouBtn:NewSkinButton;
      
      private var ynShenbingzhouqiBtn:NewSkinButton;
      
      private var ynWulinshendibaoBtn1:NewSkinButton;
      
      private var ynWulinshendibaoBtn2:NewSkinButton;
      
      private var ynWulinshendibaoBtn3:NewSkinButton;
      
      private var ynWulinshendibaoBtn4:NewSkinButton;
      
      private var ynWulinshendibaoBtn5:NewSkinButton;
      
      private var ynWulinshendibaoBtn6:NewSkinButton;
      
      private var ynWulinshendibaoBtn7:NewSkinButton;
      
      private var ynWulinshendibaoBtn8:NewSkinButton;
      
      private var yn1908Btn:NewSkinButton;
      
      private var ynQixihuodongBtn:NewSkinButton;
      
      private var ynNiulangzhinvBtn:NewSkinButton;
      
      private var ynLibaozhouqiBtn:NewSkinButton;
      
      private var ynShijian902Btn:NewSkinButton;
      
      private var ynYulianjieBtn:NewSkinButton;
      
      private var ynYingxionglianBtn:NewSkinButton;
      
      private var ynQiaolianjiumuBtn:NewSkinButton;
      
      private var ynChongjiuhuodongBtn:NewSkinButton;
      
      private var ynWulinzhenyuanBtn:NewSkinButton;
      
      private var ynKaixueqiqiuBtn:NewSkinButton;
      
      private var ynQiqiuBtn:NewSkinButton;
      
      private var yitiantulongBtn:NewSkinButton;
      
      private var ynHuozhenjiashiBtn:NewSkinButton;
      
      private var ynXuanwuxingjunBtn:NewSkinButton;
      
      private var ynJingyingbicaiBtn:NewSkinButton;
      
      private var ynWangbangzhengxiongBtn:NewSkinButton;
      
      private var ynWangzhehuodongBtn:NewSkinButton;
      
      private var ynLiujianBtn:NewSkinButton;
      
      private var ynZhongqiuhuodongBtn:NewSkinButton;
      
      private var ynBaihuxingjunBtn:NewSkinButton;
      
      private var ynZhongqiu2017Btn:NewSkinButton;
      
      private var ynWuduqirenBtn:NewSkinButton;
      
      private var ynQinglongxingjunBtn:NewSkinButton;
      
      private var ynLihejueBtn:NewSkinButton;
      
      private var yn10yueyouhuiBtn:NewSkinButton;
      
      private var ynMeitianchongzhilibao2Btn:NewSkinButton;
      
      private var ynPJubaopen2Btn:FSimpleButton;
      
      private var ynGJubaopen2Btn:FSimpleButton;
      
      private var ynCJubaopen2Btn:NewSkinButton;
      
      private var ynZhuquexingjunBtn:NewSkinButton;
      
      private var ynZengsongnvrenBtn:NewSkinButton;
      
      private var yn20171020Btn:NewSkinButton;
      
      private var ynSuixinxiaofeiBtn:NewSkinButton;
      
      private var yn2017FunvjieBtn:NewSkinButton;
      
      private var yn2017LiunianhuodongBtn:NewSkinButton;
      
      private var yn2017LiunianpeibanBtn:NewSkinButton;
      
      private var yn2017GanenliunianBtn:NewSkinButton;
      
      private var yn2017ShengrizhouqiBtn:NewSkinButton;
      
      private var yn2017HuazhuangdasaiBtn:NewSkinButton;
      
      private var yn2017WeixiwulinBtn:NewSkinButton;
      
      private var yn2017HuazhuanghuodongBtn:NewSkinButton;
      
      private var yn2017XuantiezhixingBtn:NewSkinButton;
      
      private var yn20170601ShijianBtn:NewSkinButton;
      
      private var yn2017ShangrenBtn:NewSkinButton;
      
      private var yn2017QinglongxingjunfuwenBtn:NewSkinButton;
      
      private var yn2017NeiligaishiBtn:NewSkinButton;
      
      private var yn2017ChaojixianglongzhouqiBtn:NewSkinButton;
      
      private var yn2017JiaoshijieBtn:NewSkinButton;
      
      private var yn2017ShuanglongzhanBtn:NewSkinButton;
      
      private var yn2017ZhenpinzhouqiBtn:NewSkinButton;
      
      private var yn1205shijianBtn:NewSkinButton;
      
      private var yn1212shijianBtn:NewSkinButton;
      
      private var ynYitianbaojinzhouqiBtn:NewSkinButton;
      
      private var yn1219shijianBtn:NewSkinButton;
      
      private var ynWangjidianliBtn:NewSkinButton;
      
      private var ynYinshechudongBtn:NewSkinButton;
      
      private var yn1226shijianBtn:NewSkinButton;
      
      private var ynShengdanchongmanBtn:NewSkinButton;
      
      private var ynDuixuerenBtn:NewSkinButton;
      
      private var yn5quxinshoulibaoBtn:NewSkinButton;
      
      private var ynWanshixingBtn:NewSkinButton;
      
      private var ynQianghuajinshenBtn:NewSkinButton;
      
      private var ynChuzhanBtn:NewSkinButton;
      
      private var ynGengxinbuchanghuodongBtn:NewSkinButton;
      
      private var ynPeiyangdianfengshouBtn:NewSkinButton;
      
      private var btnDingFengZhuanPan:NewSkinButton;
      
      private var btnYiTianTuLongDao:NewSkinButton;
      
      private var btnTianRenHe:NewSkinButton;
      
      private var btnJiZaoJie:NewSkinButton;
      
      private var btnZaoye:NewSkinButton;
      
      private var btnRongQingAiYi:NewSkinButton;
      
      private var btnShuangLongZhan3:NewSkinButton;
      
      private var btnChaoJiWuLinDaBao1:NewSkinButton;
      
      private var btnChaoJiWuLinDaBao2:NewSkinButton;
      
      private var btnChaoJiWuLinDaBao3:NewSkinButton;
      
      private var btnChaoJiWuLinDaBao4:NewSkinButton;
      
      private var btnChaoJiWuLinDaBao5:NewSkinButton;
      
      private var btnChaoJiWuLinDaBao6:NewSkinButton;
      
      private var btnSanHe:NewSkinButton;
      
      private var btnWuXuZhouQi:NewSkinButton;
      
      private var btn2018ChuYiErSan:NewSkinButton;
      
      private var btn2018XinShou:FSimpleButton;
      
      private var btn2018FuNvJie:NewSkinButton;
      
      private var btnJinShenZhouQi:NewSkinButton;
      
      private var btnNvErZengSong:NewSkinButton;
      
      private var btnBaiQiaoKeLi:NewSkinButton;
      
      private var btnDaHuangJinZhouQi:NewSkinButton;
      
      private var btnQingRenJieHuanLi:NewSkinButton;
      
      private var btnQiangHuaJinShen2:NewSkinButton;
      
      private var btnYuanBaoYouHui:NewSkinButton;
      
      private var btnYuRenJie2018:NewSkinButton;
      
      private var btnChangNianChongZhi1:NewSkinButton;
      
      private var btnChangNianChongZhi2:NewSkinButton;
      
      private var btnChangNianChongZhi3:NewSkinButton;
      
      private var btnChangNianChongZhi4:NewSkinButton;
      
      private var btnChangNianChongZhi5:NewSkinButton;
      
      private var btnChangNianChongZhi6:NewSkinButton;
      
      private var btnChangNianChongZhi7:NewSkinButton;
      
      private var btnChangNianChongZhi8:NewSkinButton;
      
      private var btnChangNianChongZhi9:NewSkinButton;
      
      private var btnChangNianChongZhi10:NewSkinButton;
      
      private var btnWuSeTangYuan:NewSkinButton;
      
      private var btnHanShiJie:NewSkinButton;
      
      private var btnDaShengZhouQi:NewSkinButton;
      
      private var btn2018LaoDongJie:NewSkinButton;
      
      private var btnLiXia2018:NewSkinButton;
      
      private var btnShuiGuoLeiJi:NewSkinButton;
      
      private var btn519HuoDong2018:NewSkinButton;
      
      private var btnTianXiaWuGongChuShaoLin:NewSkinButton;
      
      private var btnXiaRiShuiGuo:NewSkinButton;
      
      private var btnChaoJiZhouQi:NewSkinButton;
      
      private var btnYueXiaoFeiYueLingJiang:NewSkinButton;
      
      private var btnZhiZunChengHaoZhengDuo:NewSkinButton;
      
      private var btnTaoHuaZhiJing:NewSkinButton;
      
      private var btnQuanZhenXiaoYao:NewSkinButton;
      
      private var btnFeiShengJingJie:NewSkinButton;
      
      private var btnShiJieBei2018:NewSkinButton;
      
      private var btnBuBaiJinShen:NewSkinButton;
      
      private var btnLianXuBaoMing:NewSkinButton;
      
      private var btnDuanWu2018:NewSkinButton;
      
      private var btnXiaTianKuaiLe:NewSkinButton;
      
      private var btnHuanQiuKaiMu:NewSkinButton;
      
      private var btnMingJiaoZhiZun:NewSkinButton;
      
      private var btnYaoJue:NewSkinButton;
      
      private var btnZaiXianLeiJi:NewSkinButton;
      
      private var btnFeiShengShenBao:NewSkinButton;
      
      private var btnBuChang:NewSkinButton;
      
      private var btnZhengDuoZhan:NewSkinButton;
      
      private var btnDaGengXinHD:NewSkinButton;
      
      private var btnWangZheZQ:NewSkinButton;
      
      private var btnDuiHuanGN:NewSkinButton;
      
      private var btnXingYunXX:NewSkinButton;
      
      private var btnWangZheZhiBangHD:NewSkinButton;
      
      private var moshouzhanchangBtn:NewSkinButton;
      
      private var btnYingXiongHuoDong:NewSkinButton;
      
      private var btnHuanYingBaYue:NewSkinButton;
      
      private var btnMeiJiuPaiHang:NewSkinButton;
      
      private var btnNiangJiuHuoDong:NewSkinButton;
      
      private var btnYuLanZhouQi:NewSkinButton;
      
      private var btnYuLanZhiEn:NewSkinButton;
      
      private var btnGuoQingZhouQi:NewSkinButton;
      
      private var btnGuoQingZengSong:NewSkinButton;
      
      private var btnZiHaoZhanDou:NewSkinButton;
      
      private var btnYingJieGuoQing:NewSkinButton;
      
      private var btnSiGuiZhouQi:NewSkinButton;
      
      private var btnShuangJiuHuoDong:NewSkinButton;
      
      private var btnZhongQiuZengSong:NewSkinButton;
      
      private var btnZhongQiuTianBing:NewSkinButton;
      
      private var btnZhongQiuJie2018:NewSkinButton;
      
      private var btnZhongQiuZhouQi:NewSkinButton;
      
      private var btnShouJiGuWu:NewSkinButton;
      
      private var btnFeiShengJingJie2:NewSkinButton;
      
      private var btnQiuTianLiWu1:NewSkinButton;
      
      private var btnQiuTianLiWu2:NewSkinButton;
      
      private var btnShuangShiRiZi:NewSkinButton;
      
      private var ynWeixiBtn:NewSkinButton;
      
      private var btnBanBenYouHui:NewSkinButton;
      
      private var btnQiangHuaJinShen3:NewSkinButton;
      
      private var btnShuangLongZhan2:NewSkinButton;
      
      private var btnTianRenHe2:NewSkinButton;
      
      private var ynWeixi2Btn:NewSkinButton;
      
      private var btnBanBenYouHui2:NewSkinButton;
      
      private var btnQiangHuaJinShen4:NewSkinButton;
      
      private var btnQiangHuaJinShen5:NewSkinButton;
      
      private var btnQiangHuaJinShen6:NewSkinButton;
      
      private var btnShuangLongZhan4:NewSkinButton;
      
      private var btnTianRenHe3:NewSkinButton;
      
      private var btnTianRenHe4:NewSkinButton;
      
      private var btnTiaoZhanHuoDong:NewSkinButton;
      
      private var btnShouChongLiBao2:NewSkinButton;
      
      private var btnYingJieFuNvJie:NewSkinButton;
      
      private var btnZhouYiKuaiLe:NewSkinButton;
      
      private var btnZhouYiKuaiLe2:NewSkinButton;
      
      private var btnZhouMoReNao:NewSkinButton;
      
      private var btnTangguoduihuan:NewSkinButton;
      
      private var btnGongFaYouHui:NewSkinButton;
      
      private var btnGongFaYouHui2:NewSkinButton;
      
      private var btnWanShengYe:NewSkinButton;
      
      private var btnBaoShiYangCheng:NewSkinButton;
      
      private var btnDuanLianBaoShi:NewSkinButton;
      
      private var btnMeiRiChongZhi:NewSkinButton;
      
      private var btnMeiRiChongZhi2:NewSkinButton;
      
      private var btnXingXingPaiHang:NewSkinButton;
      
      private var btnShengRiZhouQi:NewSkinButton;
      
      private var btnShengRiYuKuai:NewSkinButton;
      
      private var btnShuangLongZhan5:NewSkinButton;
      
      private var btnShuangLongZhan6:NewSkinButton;
      
      private var btnShuangLongZhan7:NewSkinButton;
      
      private var btnShiTuLieShou:NewSkinButton;
      
      private var btnShiTuJie:NewSkinButton;
      
      private var btnTeShuLeiJi:NewSkinButton;
      
      private var btnXingYunYinSu:NewSkinButton;
      
      private var btnTeBieRiZi:NewSkinButton;
      
      private var btnDongTianLieBu:NewSkinButton;
      
      private var btnDongTianDuiHuan:NewSkinButton;
      
      private var btnShengDanLeiJi:NewSkinButton;
      
      private var btnShengDanKuaiLe:NewSkinButton;
      
      private var btnShengDanHuoDong:NewSkinButton;
      
      private var btnZhiZaoYanHua:NewSkinButton;
      
      private var btnXingZhuXinNian:NewSkinButton;
      
      private var btnNianDi2018:NewSkinButton;
      
      private var btnLiangTianLeiJi1:NewSkinButton;
      
      private var btnLiangTianLeiJi2:NewSkinButton;
      
      private var btnLiangTianLeiJi3:NewSkinButton;
      
      private var btnLiangTianLeiJi4:NewSkinButton;
      
      private var btnJiangHuZhan1:NewSkinButton;
      
      private var btnJiangHuZhan2:NewSkinButton;
      
      private var btnJiangHuZhan3:NewSkinButton;
      
      private var btnJiangHuZhan4:NewSkinButton;
      
      private var btnJiangHuZhan5:NewSkinButton;
      
      private var btnJiangHuZhan6:NewSkinButton;
      
      private var btnJiangHuZhan7:NewSkinButton;
      
      private var btnJiangHuZhan8:NewSkinButton;
      
      private var btnQiTianLeiJi:NewSkinButton;
      
      private var btnZhuangWangGuiTian:NewSkinButton;
      
      private var btnZhuangWangCiShu:NewSkinButton;
      
      private var btnZhuangWangJie:NewSkinButton;
      
      private var btnXinShouLeiJi:NewSkinButton;
      
      private var btnChunTianleiJi:NewSkinButton;
      
      private var btnChuYiHuoDong:NewSkinButton;
      
      private var btnChuErHuoDong:NewSkinButton;
      
      private var btnChuSanHuoDong:NewSkinButton;
      
      private var btnQingRenJie2019:NewSkinButton;
      
      private var btnLieShouHuoDong2:NewSkinButton;
      
      private var btnLieShouPaiHang2:NewSkinButton;
      
      private var btnYiTianLeiJi:NewSkinButton;
      
      private var btnFuNvJieHeLi:NewSkinButton;
      
      private var btnFuNvJiePaiHang:NewSkinButton;
      
      private var btnBaiSeQingRenJie:NewSkinButton;
      
      private var btnLieShouPaiHang22:NewSkinButton;
      
      private var btnYuRenJie2019:NewSkinButton;
      
      private var btnHanShiJie2019:NewSkinButton;
      
      private var btnZhiZunShenBao:NewSkinButton;
      
      private var btnZhiZunShenBao2:NewSkinButton;
      
      private var btnXiongWangJie:NewSkinButton;
      
      private var btnYingJieDaLi:NewSkinButton;
      
      private var btnShengGanHui:NewSkinButton;
      
      private var btnErTongJie2019:NewSkinButton;
      
      private var btnV400:NewSkinButton;
      
      private var btnXinBing:NewSkinButton;
      
      private var btnLiuYueDi2019:NewSkinButton;
      
      private var btn7YueJingYing:NewSkinButton;
      
      private var btnQiYueDi2019:NewSkinButton;
      
      private var btnQiXiJie2019:NewSkinButton;
      
      private var btnShuangQuan1:NewSkinButton;
      
      private var btnShuangQuan2:NewSkinButton;
      
      private var btnShuangQuan3:NewSkinButton;
      
      private var btnShuangQuan4:NewSkinButton;
      
      private var btnShuangQuan5:NewSkinButton;
      
      private var btnShuangQuan6:NewSkinButton;
      
      private var btnZhuaYuTu:NewSkinButton;
      
      private var btnLianXuDengLu:NewSkinButton;
      
      private var btnTeBieHuoDong:NewSkinButton;
      
      private var btnTeBieHuoDong2:NewSkinButton;
      
      private var btnGuoQingJie2019:NewSkinButton;
      
      private var btnBaYueYouHui:NewSkinButton;
      
      private var btnXiongBangZhan:NewSkinButton;
      
      private var btnNeiTi:NewSkinButton;
      
      private var btnZhongQiuShangYue:NewSkinButton;
      
      private var btn15tianyouhui:NewSkinButton;
      
      private var btnshangren:NewSkinButton;
      
      private var btnFuNvJie:NewSkinButton;
      
      private var btnVIP:NewSkinButton;
      
      private var xianMoZhiLuBtn:NewSkinButton;
      
      private var btnWanShengJie2019:NewSkinButton;
      
      private var btnHuoDong1120:NewSkinButton;
      
      private var btnDaZheKou:NewSkinButton;
      
      private var btnJingYingLeiJi:NewSkinButton;
      
      private var btnJingYingHuiLing:NewSkinButton;
      
      private var btnBaNianZhiMeng:NewSkinButton;
      
      private var btnBaNianFuWuQi:NewSkinButton;
      
      private var btnBaNianBir:NewSkinButton;
      
      private var btnShuang12:NewSkinButton;
      
      private var btn2019ShengDan:NewSkinButton;
      
      private var btnXueZhanFuWuQi:NewSkinButton;
      
      private var btnFanHuaFuWuQi:NewSkinButton;
      
      private var btnNianDi2019:NewSkinButton;
      
      private var btnXinNianKuaiLe2019:NewSkinButton;
      
      private var btnXiaoNianJie:NewSkinButton;
      
      private var btnChunTuanYuan:NewSkinButton;
      
      private var btnChunJie1:NewSkinButton;
      
      private var btnChunJie2:NewSkinButton;
      
      private var btnChunJie3:NewSkinButton;
      
      private var btnXinChunYingLu:NewSkinButton;
      
      private var btnJingYingLeiJi2:NewSkinButton;
      
      private var btnyuanxiaojie2019:NewSkinButton;
      
      private var btnqingrenjie2020:NewSkinButton;
      
      private var btnsanbajie2020:NewSkinButton;
      
      private var btnbaiseqingrenjie2:NewSkinButton;
      
      private var btnxiongwang2020:NewSkinButton;
      
      private var btnRongGuangDaRi:NewSkinButton;
      
      private var btnLeiJiZhengXiong:NewSkinButton;
      
      private var btnQiangGou16:NewSkinButton;
      
      private var btnDuanWuSanWang:NewSkinButton;
      
      private var btnDiWangLiHe:NewSkinButton;
      
      private var btnDiWangLiHe2:NewSkinButton;
      
      private var btnTianXiaQiZhen:NewSkinButton;
      
      private var btnTianXiaQiZhen2:NewSkinButton;
      
      private var btnXinShouQiZhen1:NewSkinButton;
      
      private var btnXinShouQiZhen2:NewSkinButton;
      
      private var btnXinShouQiZhen3:NewSkinButton;
      
      private var btnXinShouQiZhen4:NewSkinButton;
      
      private var btnZhongQiuWanLu:NewSkinButton;
      
      private var yuanwuBtn:NewSkinButton;
      
      private var jiuJieXingTuBtn:NewSkinButton;
      
      private var btnxinniandaji:NewSkinButton;
      
      private var btnwanshiruyi:NewSkinButton;
      
      private var btnankangxingwang:NewSkinButton;
      
      private var btncailugungun:NewSkinButton;
      
      private var btnshuangsiyouhui:NewSkinButton;
      
      private var btntehui2021:NewSkinButton;
      
      private var btnxinshouzhan:NewSkinButton;
      
      private var btnshengjifuli:NewSkinButton;
      
      private var btnxinshouzhan2:NewSkinButton;
      
      private var btn7tianlianxudenglu2022:NewSkinButton;
      
      private var btntebieleichong2022:NewSkinButton;
      
      private var wuhunBtn:NewSkinButton;
      
      private var btnDaliShangLi:NewSkinButton;
      
      private var btnChuSiHuoDong:NewSkinButton;
      
      private var btnLaYue28HuoDong:NewSkinButton;
      
      private var btnLaYue29HuoDong:NewSkinButton;
      
      private var btnLaYue30HuoDong:NewSkinButton;
      
      private var btnZhenPinZhiMeng1:NewSkinButton;
      
      private var btnZhenPinZhiMeng2:NewSkinButton;
      
      private var btnZhenPinZhiMeng3:NewSkinButton;
      
      private var btnZhenPinZhiMeng4:NewSkinButton;
      
      private var btnZhenPinZhiMeng5:NewSkinButton;
      
      private var btnZhenPinZhiMeng6:NewSkinButton;
      
      private var btnZhenPinZhiMeng7:NewSkinButton;
      
      private var btnLeTou:NewSkinButton;
      
      private var btnLeiChongLiWu:NewSkinButton;
      
      private var btnLianXuLeiChong:NewSkinButton;
      
      private var btnTianJiangBaoXiang:NewSkinButton;
      
      private var btnZhenPinZhiMeng8:NewSkinButton;
      
      private var btnZhenPinZhiMeng9:NewSkinButton;
      
      private var btnZhenPinZhiMeng10:NewSkinButton;
      
      private var btnZhenPinZhiMeng11:NewSkinButton;
      
      private var btnZhenPinZhiMeng12:NewSkinButton;
      
      private var btnZhenPinZhiMeng13:NewSkinButton;
      
      private var btnZhenPinZhiMeng14:NewSkinButton;
      
      private var btnLianXuLeiChong2:NewSkinButton;
      
      private var btnTianJiangBaoXiang2:NewSkinButton;
      
      private var btnKuangReXiaTian:NewSkinButton;
      
      private var btnss1youlan:NewSkinButton;
      
      private var btndayanliwu:NewSkinButton;
      
      private var btnZheKouShangDian:NewSkinButton;
      
      private var btnXiaoQiao:NewSkinButton;
      
      private var btnXinShangXian:NewSkinButton;
      
      private var btn2023xinshou:NewSkinButton;
      
      private var btnHuaZhuangHui:NewSkinButton;
      
      private var btnShiErZhouNian:NewSkinButton;
      
      private var btnZongLeiJi:NewSkinButton;
      
      private var btn2023LiDong:NewSkinButton;
      
      private var btn2023LiDongLeiJi:NewSkinButton;
      
      private var btnV632DengLuLingJiang:NewSkinButton;
      
      private var btnXueRenBaoZang:NewSkinButton;
      
      private var btnZheKouShangDian20140117:NewSkinButton;
      
      private var btnMaChao:NewSkinButton;
      
      private var btnYingChun2024:NewSkinButton;
      
      private var neiGongBtn:NewSkinButton;
      
      private var btnCaoJun:NewSkinButton;
      
      private var btnYouHui2888:NewSkinButton;
      
      private var btnChunJieDuiJiang:NewSkinButton;
      
      private var btnYuanXiaoJie2024:NewSkinButton;
      
      private var btn4Yue4:NewSkinButton;
      
      private var btnTeBieShangDian:NewSkinButton;
      
      private var btnMeiRiYouHui:NewSkinButton;
      
      private var btnLevelUp:NewSkinButton;
      
      private var btnZhouMoTeHui:NewSkinButton;
      
      private var btnHuiMengGe:NewSkinButton;
      
      private var _btnLayoutConfig:Array;
      
      public function CharHead()
      {
         var mc:Sprite;
         var barsContainer:Sprite;
         var fb:FLabel;
         var line:Bitmap;
         var $mask:Sprite;
         var ft:FTextArea = null;
         var w:int = 0;
         this._btnLayoutConfig = [{
            "btn":"xianshiBtn",
            "wrapper":"xianshiCanvas"
         },{"btn":"biwuCrossPlatformBtn"},{"btn":"ciShaShuoMingBtn"},{"btn":"aojianZhengbaBtn"},{
            "btn":"juBaoPenBtn",
            "special":true
         },{"btn":"danTiaoWangBtn"},{"btn":"yeWaiBossBtn"},{"btn":"tianJiangXiangRuiBtn"},{"btn":"biWuZhaoQinBtn"},{"btn":"xinMoBtn"},{"btn":"JiLeiZhiBtn"},{"btn":"huangTuBayeBtn"},{"btn":"ynRankBtn"},{"btn":"wanbaogeBtn"},{"btn":"fengzhengjieBtn"},{"btn":"ynJubaopenBtn"},{"btn":"ynJubaopenBtn1"},{"btn":"ynjvbaopenBtn2"},{"btn":"ynjvbaopenBtn3"},{"btn":"ynjvbaopenBtn5"},{"btn":"ynShijiebeiBtn"},{"btn":"yn888ShopBtn"},{"btn":"ynXingyunzhuanpanBtn"},{"btn":"ynChristmasBtn"},{"btn":"ynWebBtn1"},{"btn":"ynChristmasHuodongBtn"},{"btn":"ynChristmasGiftBtn"},{"btn":"ynLongzhizhufuBtn"},{"btn":"ynOnlineBtn"},{"btn":"zhizhanzhishangBtn"},{"btn":"ynRichangBtn"},{"btn":"ynFengdengjieBtn"},{"btn":"ynXinshouBtn"},{"btn":"yurenjieBtn"},{"btn":"doudizhuBtn"},{"btn":"duanwujieBtn"},{
            "btn":"yasuiqianBtn",
            "wrapper":"yasuiqianCanvas"
         },{"btn":"woHuCangLongBtn"},{"btn":"wishingTreeBtn"},{"btn":"shiJieBeiBtn"},{"btn":"shengxiaoBtn"},{"btn":"qixijieBtn"},{"btn":"tunShiTianDiBtn"},{"btn":"buchangfubenBtn"},{"btn":"zhongQiuJieBtn"},{"btn":"ynBookRankBtn"},{"btn":"ynWulinShenbingBtn"},{"btn":"yn201638huodong1Btn"},{"btn":"ynJinshenHuodongBtn"},{"btn":"yn38jieBtn"},{"btn":"ynRoseBtn"},{"btn":"ynLianyaoBtn"},{"btn":"wangzhezhibangBtn"},{"btn":"yuanXiaoJieBtn"},{"btn":"ynXiongWangBtn"},{"btn":"ynYXDXBtn"},{"btn":"ynMIKBtn"},{"btn":"ynShiziBtn"},{"btn":"ynLHCZBtn"},{"btn":"ynSCCZBtn"},{"btn":"yn2015zhongqiuBtn"},{"btn":"ynQHZSBtn"},{"btn":"ynQHZSBtn2"},{"btn":"ynQHZSBtn3"},{"btn":"ynQHZSBtn4"},{"btn":"xiaozhukuaipaoBtn"},{"btn":"duiXueRenBtn"},{"btn":"ynXsksBtn"},{"btn":"yn2016CGBtn"},{"btn":"yn2016DLBtn"},{"btn":"yn2016onlineBtn"},{"btn":"yn2016newyearBtn"},{"btn":"yn2016yuanxiaoBtn"},{"btn":"yn201638huodongBtn"},{"btn":"yn2016zhuanpanBtn"},{"btn":"ynChongzhidafa"},{"btn":"ynBaimeiguiBtn"},{"btn":"ynWZZBBtn"},{"btn":"ynZMQZBtn"}
         ,{"btn":"ynSBBKSYBtn"},{"btn":"ynXSKSBtn"},{"btn":"ynASSLBtn"},{"btn":"ynDDSQBtn"},{"btn":"ynWZWZBtn"},{"btn":"ynXFBtn"},{
            "btn":"longfengdangpuBtn",
            "child":"vipMcSpr",
            "childxy":[-4,-5]
         },{"btn":"ynXWHDBtn"},{"btn":"ynXFHDBtn"},{"btn":"ynXianglonghutiButton"},{"btn":"ynouzhouzuqiuButton"},{"btn":"ertongjieBtn"},{"btn":"wushenBtn"},{"btn":"ynXianHeZhanGongBtn"},{"btn":"ynJieFangRiBtn"},{"btn":"ynWuYiBtn"},{"btn":"ynYouHuiBtn"},{"btn":"youhui519Btn"},{"btn":"cjqhBtn"},{"btn":"yn61huodongBtn"},{"btn":"ynouzhouzuqiu2Button"},{"btn":"ynKillBee"},{"btn":"ynDuanWuBtn"},{"btn":"ynBiFangChuShiBtn"},{"btn":"ynYouHui2Btn"},{"btn":"ynSuperStrongBtn"},{"btn":"yn2016zuqiuBtn"},{"btn":"ynQiseyiseBtn"},{"btn":"ynZhienBtn"},{"btn":"ynZhuilongxueshaBtn"},{"btn":"ynLongjingzhibaoBtn"},{"btn":"ynZhengdouBtn"},{"btn":"ynWuzhuanghudouBtn"},{"btn":"ynKaizhanBtn"},{"btn":"ynWangbangBtn"},{"btn":"ynSongmanxinaiBtn"},{"btn":"ynXiatiankuaileBtn"},{"btn":"ynXiatiankuaile2Btn"},{"btn":"ynXiatiankuaile3Btn"},{"btn":"ynXiatiankuaile4Btn"},{"btn":"ynHuangrugeshiBtn"},{"btn":"ynSilingdazhanBtn"},{"btn":"ynDazaoshenbingBtn"},{"btn":"ynTiandinghunpoBtn"},{"btn":"ynLongjinglibaoBtn"},{"btn":"ynZongjuesaiduihuanBtn"}
         ,{"btn":"ynZhouqicailuBtn"},{"btn":"ynGaoshouwushuangBtn"},{"btn":"ynShengzhanshiBtn"},{"btn":"ynLiehuoshengxieBtn"},{"btn":"ynWujuegongfaBtn"},{"btn":"ynShenmiliwuBtn"},{"btn":"hunqianmengrao"},{"btn":"lexinchuji"},{"btn":"ynZhouyihuodongBtn"},{"btn":"ynZhouerhuodongBtn"},{"btn":"ynZhouerhuodong2Btn"},{"btn":"ynZhousanhuodongBtn"},{"btn":"ynZhousihuodongBtn"},{"btn":"ynZhouwuhuodongBtn"},{"btn":"ynZhouliuhuodongBtn"},{"btn":"ynZhourihuodongBtn"},{"btn":"ynMeirihuodong3Btn"},{"btn":"ynYulanhejieBtn"},{"btn":"ynJingsuidongxiaBtn"},{"btn":"ynKaizhenyuanBtn"},{"btn":"ynKaizhenyuan3Btn"},{"btn":"ynQiziquanzhenjiaoBtn"},{"btn":"ynBayuediBtn"},{"btn":"ynXianglongjingBtn"},{"btn":"ynQijianyingxiongBtn"},{"btn":"ynGuoqinghuodongBtn"},{"btn":"ynPaihangbangBtn"},{"btn":"ynYingxiongshijianBtn"},{"btn":"ynChongjiuzhiyangBtn"},{"btn":"ynYuelungujiBtn"},{"btn":"ynXiangyangyueseBtn"},{"btn":"ynQunyingquhuiBtn"},{"btn":"ynWushenBtn"},{"btn":"ynWushen2Btn"},{"btn":"ynXichuanhongmianbaihuapaoBtn"},{"btn":"ynShenmilibaoBtn"}
         ,{"btn":"ynKaizhenyuan2Btn"},{"btn":"ynWangzhezhengxiongBtn"},{"btn":"ynZhongjizuoqishendanBtn"},{"btn":"ynZhongjizuoqishendan2Btn"},{"btn":"ynZuoqipeichangBtn"},{"btn":"ynWangbangchuzhanBtn"},{"btn":"ynWeixilibaoBtn"},{"btn":"ynJiuyuediBtn"},{"btn":"ynQiongjinzhanyiBtn"},{"btn":"ynFanliBtn"},{"btn":"ynFuqitongxinBtn"},{"btn":"ynSilongtianzhuaBtn"},{"btn":"ynWuseduohuaBtn"},{"btn":"ynYuenanfunvjieBtn"},{"btn":"ynLonghunBtn"},{"btn":"ynLonghun2Btn"},{"btn":"ynLonghun3Btn"},{"btn":"ynZhanjipiaodangBtn"},{"btn":"ynAojianwunianBtn"},{"btn":"ynTianmajianBtn"},{"btn":"ynWunianzhimengBtn"},{"btn":"ynWunianzhienBtn"},{"btn":"ynTianmidangaoBtn"},{"btn":"ynShengrizhoujiBtn"},{"btn":"ynWujinkuaileBtn"},{"btn":"ynBaguaiwushendunBtn"},{"btn":"ynTupowugongBtn"},{"btn":"ynLiupaijingjiBtn"},{"btn":"ynLiumaijianBtn"},{"btn":"ynXunshixuedaoBtn"},{"btn":"ynYidazunshiBtn"},{"btn":"ynYingbinzhouliBtn"},{"btn":"ynWangzheBtn"},{"btn":"ynZhouwuguangliangBtn"},{"btn":"ynwuhunjianBtn"},{"btn":"ynDingfengshenshouBtn"}
         ,{"btn":"ynTianxiangwangzheBtn"},{"btn":"ynQisehuluBtn"},{"btn":"ynBansuizuqiuduiBtn"},{"btn":"ynDingfengzhouqiBtn"},{"btn":"ynZhentianshenqiBtn"},{"btn":"ynLongjingzhangBtn"},{"btn":"ynFeilongjingBtn"},{"btn":"ynFeilongjing2Btn"},{"btn":"ynFeilongjing3Btn"},{"btn":"ynBanjuesailingjiangBtn"},{"btn":"ynXunzhaobaozangBtn"},{"btn":"ynJingxijinpiaodaliBtn"},{"btn":"ynZhentianjiBtn"},{"btn":"ynHuashanlunjianBtn"},{"btn":"ynHuashanwuzhangBtn"},{"btn":"ynTianxueshenbingBtn"},{"btn":"ynShengdanjinpiaoBtn"},{"btn":"ynShengdanjieBtn"},{"btn":"ynZhenbaogeBtn"},{"btn":"ynTaohuajiuBtn"},{"btn":"ynTaohuajiu2Btn"},{"btn":"ynTaohuajiu3Btn"},{"btn":"ynKaichunwanfuBtn"},{"btn":"ynXinnianlibaoBtn"},{"btn":"ynXianglongchaojiBtn"},{"btn":"ynXianglongchaoji2Btn"},{"btn":"ynXianglongchaoji3Btn"},{"btn":"ynTengtianyuBtn"},{"btn":"ynTengtianyuBtn2"},{"btn":"ynWeiyongwushuangBtn"},{"btn":"ynWujinjindingriBtn"},{"btn":"ynWujinjindingri2Btn"},{"btn":"ynWujinjindingri3Btn"},{"btn":"ynXinnianyasuiqianBtn"},{"btn":"ynFangyanhuaBtn"}
         ,{"btn":"ynZaowangBtn"},{"btn":"ynChunjie123Btn"},{"btn":"ynXiongjiquanBtn"},{"btn":"ynChunjieduilianBtn"},{"btn":"ynGaishishenlongBtn"},{"btn":"ynGuguchengqinBtn"},{"btn":"ynYuanyangxishuiBtn"},{"btn":"ynjvbaopen6Btn"},{"btn":"ynTianyuchanBtn"},{"btn":"ynTianshenshiBtn"},{"btn":"ynQixingzhuangbeiBtn"},{"btn":"ynLingDanZhenPin1Btn"},{"btn":"ynLingDanZhenPin2Btn"},{"btn":"ynLingDanZhenPin3Btn"},{"btn":"ynErYueDiBtn"},{"btn":"ynXiangYangDuiJue1Btn"},{"btn":"ynXiangYangDuiJue2Btn"},{"btn":"ynXiangYangDuiJue3Btn"},{"btn":"ynWuJinJianBtn"},{"btn":"ynYingXiongChuBaoBtn"},{"btn":"moxueBtn"},{"btn":"guosetianxiangBtn"},{"btn":"ynwudushengzhenBtn"},{"btn":"jiangHunBtn"},{"btn":"Jueshijiaren1Btn"},{"btn":"Jueshijiaren2Btn"},{"btn":"Jueshijiaren3Btn"},{"btn":"AiqingtangguoBtn"},{"btn":"AidehuibaoBtn"},{"btn":"ZhongyuanbaobiaoBtn"},{"btn":"TiandaoBtn"},{"btn":"ZhuixunxianglongBtn"},{"btn":"YouhuizhouqiBtn"},{"btn":"ouleBtn"},{"btn":"ynyurenjieBtn"},{"btn":"xiongwangdaliBtn"},{"btn":"ynSanYueDiBtn"}
         ,{"btn":"ynShenghuoBtn"},{"btn":"ynShenfengBtn"},{"btn":"ynWulinzhibaoBtn"},{"btn":"ynWangzhezhibang5Btn"},{"btn":"ynBumiezhuqueBtn"},{"btn":"ynJingyingjuhuiBtn"},{"btn":"ynKaizhan5Btn"},{"btn":"duanwujie2015Btn"},{"btn":"ynQuanlongBtn"},{"btn":"ynWulinmijiBtn"},{"btn":"ynTianshizhouqiBtn"},{"btn":"ynSiyuediBtn"},{"btn":"ynZhanshenzhongyuanBtn"},{"btn":"ynDajieyouhuiBtn"},{"btn":"ynNantianhaoqiBtn"},{"btn":"ynRongguanBtn"},{"btn":"btnBaGuaZhen"},{"btn":"ynZhenpinShangchengBtn"},{"btn":"ynJuezhanShangchengBtn"},{"btn":"ynFodanBtn"},{"btn":"ynWulindazhanBtn"},{"btn":"ynYXMingchengBtn"},{"btn":"ynWandulingBtn"},{"btn":"ynJianghuluwuBtn"},{"btn":"ynWuduBtn"},{"btn":"ynDuiJuezhouqiBtn"},{"btn":"yn0519Btn"},{"btn":"ynErtongjieBtn"},{"btn":"ynTangmenjuejiBtn"},{"btn":"ynLianbaojianBtn"},{"btn":"ynJianshexiangyangBtn"},{"btn":"ynKuangbaoBtn"},{"btn":"ynDianfengzhouqiBtn"},{"btn":"ynQingzhuBtn"},{"btn":"ynMeitianyouhuiBtn"},{"btn":"ynShenfeng1Btn"},{"btn":"ynZhenpinShangcheng2Btn"},{"btn":"ynJuezhanShangcheng2Btn"}
         ,{"btn":"ynMeitianyouhui2Btn"},{"btn":"ynHuoyueBtn"},{"btn":"shijianshalouBtn"},{"btn":"ynwudushengzhen1Btn"},{"btn":"ynwudushengzhen2Btn"},{"btn":"ynTengtianyu3Btn"},{"btn":"ynjingye1Btn"},{"btn":"ynLiuyueyuanmanBtn"},{"btn":"ynLiuyueqingzhuBtn"},{"btn":"ynFangfengzheng170621Btn"},{"btn":"ynLiuyuediBtn"},{"btn":"ynChewuquanBtn"},{"btn":"ynwudushengzhen3Btn"},{"btn":"ynwudushengzhen4Btn"},{"btn":"ynwudushengzhen5Btn"},{"btn":"ynwudushengzhen6Btn"},{"btn":"ynMeitianchongzhilibaoBtn"},{"btn":"ynShenshougumuBtn"},{"btn":"ynFeilongshenbaoBtn"},{"btn":"ynDishiBtn"},{"btn":"ynNewTengtianyu1Btn"},{"btn":"ynNewTengtianyu2Btn"},{"btn":"ynNewTengtianyu3Btn"},{"btn":"ynNewTengtianyu4Btn"},{"btn":"ynNewTengtianyu5Btn"},{"btn":"ynNewTengtianyu6Btn"},{"btn":"ynNewTengtianyu7Btn"},{"btn":"ynWei300Btn"},{"btn":"ynFeishengjingjieBtn"},{"btn":"ynShouchongshijianBtn"},{"btn":"ynMoshizhouqiBtn"},{"btn":"ynXiatianzhienBtn"},{"btn":"ynBayuetouBtn"},{"btn":"ynTonglefeishengjingjieBtn"},{"btn":"ynZhanzhengBtn"}
         ,{"btn":"ynBuchangBtn"},{"btn":"ynMobingjingongBtn"},{"btn":"ynZhouqiyouhuiBtn"},{"btn":"ynShenbingzhouqiBtn"},{"btn":"ynGumuzhengdouBtn"},{"btn":"ynWulinshendibaoBtn1"},{"btn":"ynWulinshendibaoBtn2"},{"btn":"ynWulinshendibaoBtn3"},{"btn":"ynWulinshendibaoBtn4"},{"btn":"yn1908Btn"},{"btn":"ynQixihuodongBtn"},{"btn":"ynNiulangzhinvBtn"},{"btn":"ynLibaozhouqiBtn"},{"btn":"ynShijian902Btn"},{"btn":"ynYulianjieBtn"},{"btn":"ynWeixiBtn"},{"btn":"ynYingxionglianBtn"},{"btn":"ynQiaolianjiumuBtn"},{"btn":"ynChongjiuhuodongBtn"},{"btn":"ynWulinzhenyuanBtn"},{"btn":"ynKaixueqiqiuBtn"},{"btn":"ynQiqiuBtn"},{"btn":"yitiantulongBtn"},{"btn":"ynHuozhenjiashiBtn"},{"btn":"ynXuanwuxingjunBtn"},{"btn":"ynJingyingbicaiBtn"},{"btn":"ynWangbangzhengxiongBtn"},{"btn":"ynWangzhehuodongBtn"},{"btn":"ynLiujianBtn"},{"btn":"ynZhongqiuhuodongBtn"},{"btn":"ynBaihuxingjunBtn"},{"btn":"ynZhongqiu2017Btn"},{"btn":"ynNewTengtianyu8Btn"},{"btn":"ynNewTengtianyu9Btn"},{"btn":"ynNewTengtianyu10Btn"},{"btn":"ynNewTengtianyu11Btn"}
         ,{"btn":"ynNewTengtianyu12Btn"},{"btn":"ynNewTengtianyu13Btn"},{"btn":"ynNewTengtianyu14Btn"},{"btn":"ynWulinshendibaoBtn5"},{"btn":"ynWulinshendibaoBtn6"},{"btn":"ynWulinshendibaoBtn7"},{"btn":"ynWulinshendibaoBtn8"},{"btn":"ynShenfeng2Btn"},{"btn":"ynWuduqirenBtn"},{"btn":"ynQinglongxingjunBtn"},{"btn":"ynLihejueBtn"},{"btn":"yn10yueyouhuiBtn"},{"btn":"ynZhenbaoge2Btn"},{"btn":"ynMeitianchongzhilibao2Btn"},{"btn":"ynPJubaopen2Btn"},{"btn":"ynGJubaopen2Btn"},{"btn":"ynCJubaopen2Btn"},{"btn":"ynZhuquexingjunBtn"},{"btn":"ynZengsongnvrenBtn"},{"btn":"yn20171020Btn"},{"btn":"ynSuixinxiaofeiBtn"},{"btn":"yn2017FunvjieBtn"},{"btn":"yn2017LiunianhuodongBtn"},{"btn":"yn2017LiunianpeibanBtn"},{"btn":"yn2017GanenliunianBtn"},{"btn":"yn2017ShengrizhouqiBtn"},{"btn":"yn2017HuazhuangdasaiBtn"},{"btn":"yn2017WeixiwulinBtn"},{"btn":"yn2017HuazhuanghuodongBtn"},{"btn":"yn2017XuantiezhixingBtn"},{"btn":"yn20170601ShijianBtn"},{"btn":"yn2017ShangrenBtn"},{"btn":"yn2017QinglongxingjunfuwenBtn"},{"btn":"yn2017NeiligaishiBtn"}
         ,{"btn":"yn2017ChaojixianglongzhouqiBtn"},{"btn":"yn2017JiaoshijieBtn"},{"btn":"yn2017ShuanglongzhanBtn"},{"btn":"btnShuangLongZhan2"},{"btn":"btnShuangLongZhan3"},{"btn":"yn2017ZhenpinzhouqiBtn"},{"btn":"yn1205shijianBtn"},{"btn":"yn1212shijianBtn"},{"btn":"ynYitianbaojinzhouqiBtn"},{"btn":"yn1219shijianBtn"},{"btn":"ynWangjidianliBtn"},{"btn":"ynYinshechudongBtn"},{"btn":"yn1226shijianBtn"},{"btn":"ynShengdanchongmanBtn"},{"btn":"ynDuixuerenBtn"},{"btn":"yn5quxinshoulibaoBtn"},{"btn":"ynWanshixingBtn"},{"btn":"ynQianghuajinshenBtn"},{"btn":"ynChuzhanBtn"},{"btn":"ynGengxinbuchanghuodongBtn"},{"btn":"ynPeiyangdianfengshouBtn"},{"btn":"btnDingFengZhuanPan"},{"btn":"btnYiTianTuLongDao"},{"btn":"btnTianRenHe"},{"btn":"btnJiZaoJie"},{"btn":"btnZaoye"},{"btn":"btnRongQingAiYi"},{"btn":"btnChaoJiWuLinDaBao1"},{"btn":"btnChaoJiWuLinDaBao2"},{"btn":"btnChaoJiWuLinDaBao3"},{"btn":"btnChaoJiWuLinDaBao4"},{"btn":"btnChaoJiWuLinDaBao5"},{"btn":"btnChaoJiWuLinDaBao6"},{"btn":"btnSanHe"},{"btn":"btnWuXuZhouQi"}
         ,{"btn":"btn2018ChuYiErSan"},{"btn":"btn2018XinShou"},{"btn":"btn2018FuNvJie"},{"btn":"btnJinShenZhouQi"},{"btn":"btnNvErZengSong"},{"btn":"btnBaiQiaoKeLi"},{"btn":"btnDaHuangJinZhouQi"},{"btn":"btnQingRenJieHuanLi"},{"btn":"btnTianRenHe2"},{"btn":"btnQiangHuaJinShen2"},{"btn":"btnQiangHuaJinShen3"},{"btn":"btnYuanBaoYouHui"},{"btn":"btnYuRenJie2018"},{"btn":"btnChangNianChongZhi1"},{"btn":"btnChangNianChongZhi2"},{"btn":"btnChangNianChongZhi3"},{"btn":"btnChangNianChongZhi4"},{"btn":"btnChangNianChongZhi5"},{"btn":"btnWuSeTangYuan"},{"btn":"btnHanShiJie"},{"btn":"btnDaShengZhouQi"},{"btn":"btn2018LaoDongJie"},{"btn":"btnBanBenYouHui"},{"btn":"btnLiXia2018"},{"btn":"btnShuiGuoLeiJi"},{"btn":"btn519HuoDong2018"},{"btn":"btnTianXiaWuGongChuShaoLin"},{"btn":"btnXiaRiShuiGuo"},{"btn":"btnChaoJiZhouQi"},{"btn":"btnYueXiaoFeiYueLingJiang"},{"btn":"btnZhiZunChengHaoZhengDuo"},{"btn":"btnTaoHuaZhiJing"},{"btn":"btnQuanZhenXiaoYao"},{"btn":"btnFeiShengJingJie"},{"btn":"btnShiJieBei2018"},{"btn":"btnBuBaiJinShen"}
         ,{"btn":"btnLianXuBaoMing"},{"btn":"btnDuanWu2018"},{"btn":"btnXiaTianKuaiLe"},{"btn":"btnHuanQiuKaiMu"},{"btn":"btnMingJiaoZhiZun"},{"btn":"btnYaoJue"},{"btn":"btnZaiXianLeiJi"},{"btn":"btnFeiShengShenBao"},{"btn":"btnBuChang"},{"btn":"btnZhengDuoZhan"},{"btn":"btnDaGengXinHD"},{"btn":"btnWangZheZQ"},{"btn":"btnDuiHuanGN"},{"btn":"btnXingYunXX"},{"btn":"btnWangZheZhiBangHD"},{"btn":"moshouzhanchangBtn"},{"btn":"btnYingXiongHuoDong"},{"btn":"btnHuanYingBaYue"},{"btn":"btnMeiJiuPaiHang"},{"btn":"btnNiangJiuHuoDong"},{"btn":"btnYuLanZhouQi"},{"btn":"btnYuLanZhiEn"},{"btn":"btnGuoQingZhouQi"},{"btn":"btnGuoQingZengSong"},{"btn":"btnZiHaoZhanDou"},{"btn":"btnYingJieGuoQing"},{"btn":"btnSiGuiZhouQi"},{"btn":"btnShuangJiuHuoDong"},{"btn":"btnZhongQiuZengSong"},{"btn":"btnZhongQiuTianBing"},{"btn":"btnZhongQiuJie2018"},{"btn":"btnZhongQiuZhouQi"},{"btn":"btnShouJiGuWu"},{"btn":"btnQiuTianLiWu1"},{"btn":"btnQiuTianLiWu2"},{"btn":"btnShuangShiRiZi"},{"btn":"ynWeixi2Btn"},{"btn":"btnBanBenYouHui2"}
         ,{"btn":"btnFeiShengJingJie2"},{"btn":"btnChangNianChongZhi6"},{"btn":"btnChangNianChongZhi7"},{"btn":"btnChangNianChongZhi8"},{"btn":"btnChangNianChongZhi9"},{"btn":"btnChangNianChongZhi10"},{"btn":"btnQiangHuaJinShen4"},{"btn":"btnQiangHuaJinShen5"},{"btn":"btnQiangHuaJinShen6"},{"btn":"btnShuangLongZhan4"},{"btn":"btnTianRenHe3"},{"btn":"btnTianRenHe4"},{"btn":"btnTiaoZhanHuoDong"},{"btn":"btnShouChongLiBao2"},{"btn":"btnYingJieFuNvJie"},{"btn":"btnZhouYiKuaiLe"},{"btn":"btnZhouYiKuaiLe2"},{"btn":"btnZhouMoReNao"},{"btn":"btnTangguoduihuan"},{"btn":"btnGongFaYouHui"},{"btn":"btnGongFaYouHui2"},{"btn":"btnWanShengYe"},{"btn":"btnBaoShiYangCheng"},{"btn":"btnDuanLianBaoShi"},{"btn":"btnMeiRiChongZhi"},{"btn":"btnMeiRiChongZhi2"},{"btn":"btnXingXingPaiHang"},{"btn":"btnShengRiZhouQi"},{"btn":"btnShengRiYuKuai"},{"btn":"btnShuangLongZhan5"},{"btn":"btnShuangLongZhan6"},{"btn":"btnShuangLongZhan7"},{"btn":"btnShiTuLieShou"},{"btn":"btnShiTuJie"},{"btn":"btnTeShuLeiJi"},{"btn":"btnXingYunYinSu"}
         ,{"btn":"btnTeBieRiZi"},{"btn":"btnDongTianLieBu"},{"btn":"btnDongTianDuiHuan"},{"btn":"btnShengDanLeiJi"},{"btn":"btnShengDanKuaiLe"},{"btn":"btnShengDanHuoDong"},{"btn":"btnZhiZaoYanHua"},{"btn":"btnXingZhuXinNian"},{"btn":"btnNianDi2018"},{"btn":"btnLiangTianLeiJi1"},{"btn":"btnLiangTianLeiJi2"},{"btn":"btnLiangTianLeiJi3"},{"btn":"btnLiangTianLeiJi4"},{"btn":"btnJiangHuZhan1"},{"btn":"btnJiangHuZhan2"},{"btn":"btnJiangHuZhan3"},{"btn":"btnJiangHuZhan4"},{"btn":"btnJiangHuZhan5"},{"btn":"btnJiangHuZhan6"},{"btn":"btnJiangHuZhan7"},{"btn":"btnJiangHuZhan8"},{"btn":"btnQiTianLeiJi"},{"btn":"btnZhuangWangGuiTian"},{"btn":"btnZhuangWangCiShu"},{"btn":"btnZhuangWangJie"},{"btn":"btnXinShouLeiJi"},{"btn":"btnChunTianleiJi"},{"btn":"btnChuYiHuoDong"},{"btn":"btnChuErHuoDong"},{"btn":"btnChuSanHuoDong"},{"btn":"btnQingRenJie2019"},{"btn":"btnLieShouHuoDong2"},{"btn":"btnLieShouPaiHang2"},{"btn":"btnYiTianLeiJi"},{"btn":"btnFuNvJieHeLi"},{"btn":"btnFuNvJiePaiHang"},{"btn":"btnBaiSeQingRenJie"}
         ,{"btn":"btnLieShouPaiHang22"},{"btn":"btnYuRenJie2019"},{"btn":"btnHanShiJie2019"},{"btn":"btnZhiZunShenBao"},{"btn":"btnZhiZunShenBao2"},{"btn":"btnXiongWangJie"},{"btn":"btnYingJieDaLi"},{"btn":"btnShengGanHui"},{"btn":"btnErTongJie2019"},{"btn":"btnV400"},{"btn":"btnXinBing"},{"btn":"btnLiuYueDi2019"},{"btn":"btn7YueJingYing"},{"btn":"btnQiYueDi2019"},{"btn":"btnQiXiJie2019"},{"btn":"btnShuangQuan1"},{"btn":"btnShuangQuan2"},{"btn":"btnShuangQuan3"},{"btn":"btnShuangQuan4"},{"btn":"btnShuangQuan5"},{"btn":"btnShuangQuan6"},{"btn":"btnZhuaYuTu"},{"btn":"btnLianXuDengLu"},{"btn":"btnTeBieHuoDong"},{"btn":"btnTeBieHuoDong2"},{"btn":"btnGuoQingJie2019"},{"btn":"btnBaYueYouHui"},{"btn":"btnXiongBangZhan"},{"btn":"btnNeiTi"},{"btn":"btnZhongQiuShangYue"},{"btn":"btn15tianyouhui"},{"btn":"btnshangren"},{"btn":"btnFuNvJie"},{"btn":"xianMoZhiLuBtn"},{"btn":"btnWanShengJie2019"},{"btn":"btnHuoDong1120"},{"btn":"btnDaZheKou"},{"btn":"btnJingYingLeiJi"},{"btn":"btnJingYingHuiLing"},{"btn":"btnBaNianZhiMeng"}
         ,{"btn":"btnBaNianFuWuQi"},{"btn":"btnBaNianBir"},{"btn":"btnShuang12"},{"btn":"btn2019ShengDan"},{"btn":"btnXueZhanFuWuQi"},{"btn":"btnFanHuaFuWuQi"},{"btn":"btnNianDi2019"},{"btn":"btnXinNianKuaiLe2019"},{"btn":"btnXiaoNianJie"},{"btn":"btnChunTuanYuan"},{"btn":"btnChunJie1"},{"btn":"btnChunJie2"},{"btn":"btnChunJie3"},{"btn":"btnXinChunYingLu"},{"btn":"btnJingYingLeiJi2"},{"btn":"btnyuanxiaojie2019"},{"btn":"btnqingrenjie2020"},{"btn":"btnsanbajie2020"},{"btn":"btnbaiseqingrenjie2"},{"btn":"btnxiongwang2020"},{"btn":"btnRongGuangDaRi"},{"btn":"btnLeiJiZhengXiong"},{"btn":"btnQiangGou16"},{"btn":"btnDuanWuSanWang"},{"btn":"btnDiWangLiHe"},{"btn":"btnTianXiaQiZhen"},{"btn":"btnXinShouQiZhen1"},{"btn":"btnXinShouQiZhen2"},{"btn":"btnTianXiaQiZhen2"},{"btn":"btnXinShouQiZhen3"},{"btn":"btnXinShouQiZhen4"},{"btn":"btnZhongQiuWanLu"},{"btn":"yuanwuBtn"},{"btn":"jiuJieXingTuBtn"},{"btn":"btnxinniandaji"},{"btn":"btnwanshiruyi"},{"btn":"btnankangxingwang"},{"btn":"btncailugungun"},{"btn":"btnshuangsiyouhui"}
         ,{"btn":"btntehui2021"},{"btn":"btnxinshouzhan"},{"btn":"btnshengjifuli"},{"btn":"btnDiWangLiHe2"},{"btn":"btnxinshouzhan2"},{"btn":"btn7tianlianxudenglu2022"},{"btn":"btntebieleichong2022"},{"btn":"btnDaliShangLi"},{"btn":"wuhunBtn"},{"btn":"btnChuSiHuoDong"},{"btn":"btnLaYue28HuoDong"},{"btn":"btnLaYue29HuoDong"},{"btn":"btnLaYue30HuoDong"},{"btn":"btnZhenPinZhiMeng1"},{"btn":"btnZhenPinZhiMeng2"},{"btn":"btnZhenPinZhiMeng3"},{"btn":"btnZhenPinZhiMeng4"},{"btn":"btnZhenPinZhiMeng5"},{"btn":"btnZhenPinZhiMeng6"},{"btn":"btnZhenPinZhiMeng7"},{"btn":"btnLeTou"},{"btn":"btnLeiChongLiWu"},{"btn":"btnLianXuLeiChong"},{"btn":"btnTianJiangBaoXiang"},{"btn":"btnZhenPinZhiMeng8"},{"btn":"btnZhenPinZhiMeng9"},{"btn":"btnZhenPinZhiMeng10"},{"btn":"btnZhenPinZhiMeng11"},{"btn":"btnZhenPinZhiMeng12"},{"btn":"btnZhenPinZhiMeng13"},{"btn":"btnZhenPinZhiMeng14"},{"btn":"btnLianXuLeiChong2"},{"btn":"btnTianJiangBaoXiang2"},{"btn":"btnKuangReXiaTian"},{"btn":"btnss1youlan"},{"btn":"btn2023xinshou"},{"btn":"btndayanliwu"}
         ,{"btn":"btnZheKouShangDian"},{"btn":"btnXiaoQiao"},{"btn":"btnXinShangXian"},{"btn":"btnHuaZhuangHui"},{"btn":"btnShiErZhouNian"},{"btn":"btnZongLeiJi"},{"btn":"btn2023LiDong"},{"btn":"btn2023LiDongLeiJi"},{"btn":"btnV632DengLuLingJiang"},{"btn":"btnXueRenBaoZang"},{"btn":"btnZheKouShangDian20140117"},{"btn":"btnMaChao"},{"btn":"btnYingChun2024"},{"btn":"neiGongBtn"},{"btn":"btnCaoJun"},{"btn":"btnYouHui2888"},{"btn":"btnChunJieDuiJiang"},{"btn":"btnYuanXiaoJie2024"},{"btn":"btn4Yue4"},{"btn":"btnLevelUp"},{"btn":"btnZhouMoTeHui"},{"btn":"btnHuiMengGe"},{"btn":"btnTeBieShangDian"},{"btn":"btnMeiRiYouHui"}];
         super();
         addChild(StaticValue.getMCByClassName("ui.mainchar.head.bg"));
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         this.btnSpr = new Sprite();
         addChildAt(this.btnSpr,0);
         this.btnSpr.mouseEnabled = false;
         this.headContainer = new Sprite();
         addChild(this.headContainer);
         this.headContainer.addEventListener(MouseEvent.MOUSE_OVER,this.onHeadMouse);
         this.headContainer.addEventListener(MouseEvent.MOUSE_OUT,this.onHeadMouse);
         this.headContainer.addEventListener(MouseEvent.CLICK,this.onHeadMouse);
         this.head = new Bitmap(new BitmapData(60,60,false,0));
         this.headContainer.addChild(this.head);
         this.head.x = 5.5;
         this.head.y = 5.5;
         this.autoBtn = new FSimpleButton();
         this.autoBtn.skin = "autoBotton";
         this.autoBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("在线挂机打怪设置面板") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>(Ctrl+Z)</font><br>" + LanResManager.getLanCommonTextWords("开启/关闭自动打怪") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>(Z)</font></font>";
         addChild(this.autoBtn);
         this.autoBtn.x = 45;
         this.autoBtn.y = 70;
         this.autoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         mc = StaticValue.getMCByClassName("ui.mainchar.head.ui");
         addChild(mc);
         mc.mouseEnabled = false;
         mc.mouseChildren = false;
         barsContainer = new Sprite();
         barsContainer.x = 73;
         barsContainer.y = 33;
         barsContainer.graphics.beginFill(1,0);
         barsContainer.graphics.drawRect(0,0,132,30);
         barsContainer.graphics.endFill();
         barsContainer.addEventListener(MouseEvent.MOUSE_OVER,function():void
         {
            redBar.showNumber(true);
            blueBar.showNumber(true);
            yellowBar.showNumber(true);
         });
         barsContainer.addEventListener(MouseEvent.MOUSE_OUT,function():void
         {
            redBar.showNumber(false);
            blueBar.showNumber(false);
            yellowBar.showNumber(false);
         });
         addChild(barsContainer);
         this.redBar = new ColorBar(1,132,9,false,false,true,LanResManager.getLanCommonTextWords("当前血量"),LanResManager.getLanCommonTextWords("最大血量"),"<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("【可以左右拖动滑块改变自动恢复设置】") + "</font>");
         barsContainer.addChild(this.redBar);
         this.redBar.x = 73 - 73;
         this.redBar.y = 33 - 33;
         this.blueBar = new ColorBar(2,132,9,false,false,true,LanResManager.getLanCommonTextWords("当前内力"),LanResManager.getLanCommonTextWords("最大内力"),"<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("【可以左右拖动滑块改变自动恢复设置】") + "</font>");
         barsContainer.addChild(this.blueBar);
         this.blueBar.x = 73 - 73;
         this.blueBar.y = 47 - 33;
         this.yellowBar = new ColorBar(4,132,9,false,false,true,LanResManager.getLanCommonTextWords("当前体力"),LanResManager.getLanCommonTextWords("最大体力"),"<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("【可以左右拖动滑块改变自动恢复设置】") + "</font>");
         barsContainer.addChild(this.yellowBar);
         this.yellowBar.x = 73 - 73;
         this.yellowBar.y = 61 - 33;
         this.regulateContainer = new Sprite();
         addChild(this.regulateContainer);
         this.regulateContainer.x = 73;
         this.regulateContainer.y = 32;
         this.redRegulateBtn = new FSimpleButton();
         this.redRegulateBtn.skin = "regulateBar";
         this.redRegulateBtn.toolTip = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>0%</font>";
         this.regulateContainer.addChild(this.redRegulateBtn);
         this.redRegulateBtn.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.blutRegulateBtn = new FSimpleButton();
         this.blutRegulateBtn.skin = "regulateBar";
         this.blutRegulateBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>0%</font>";
         this.regulateContainer.addChild(this.blutRegulateBtn);
         this.blutRegulateBtn.y = 14;
         this.blutRegulateBtn.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.yellowRegulateBtn = new FSimpleButton();
         this.yellowRegulateBtn.skin = "regulateBar";
         this.yellowRegulateBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>0%</font>";
         this.regulateContainer.addChild(this.yellowRegulateBtn);
         this.yellowRegulateBtn.y = 28;
         this.yellowRegulateBtn.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.fbSpr = new Sprite();
         this.fbSpr.x = 110 - 3;
         this.fbSpr.y = 75 + 10;
         this.fbColorBarBg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/fabao/colorbar_bg.png",155,41);
         this.fbColorBarBg.x = 0;
         this.fbColorBarBg.y = 0;
         this.fbSpr.addChild(this.fbColorBarBg);
         this.fabaoBtn = new FSimpleButton();
         this.fabaoBtn.skin = "fabaoButton";
         this.fabaoBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击打开打开法宝系统") + "</font>";
         this.fbSpr.addChild(this.fabaoBtn);
         this.fabaoBtn.x = 10;
         this.fabaoBtn.y = 13;
         this.fabaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.mcPureSpr = new Sprite();
         this.fbSpr.addChild(this.mcPureSpr);
         this.mcPureSpr.graphics.beginFill(1,0);
         this.mcPureSpr.graphics.drawRect(0,0,120,10);
         this.mcPureSpr.graphics.endFill();
         this.mcPureSpr.x = 30;
         this.mcPureSpr.y = 10;
         this.mcOrangeSpr = new Sprite();
         this.mcOrangeSpr.graphics.beginFill(1,0);
         this.mcOrangeSpr.graphics.drawRect(0,0,95,10);
         this.mcOrangeSpr.graphics.endFill();
         this.mcOrangeSpr.x = 35;
         this.mcOrangeSpr.y = 21;
         this.fbSpr.addChild(this.mcOrangeSpr);
         this.ftPure = new FTextArea();
         this.ftPure.x = 70;
         this.ftPure.y = 5;
         this.ftPure.textColor = StaticValue.WHITE;
         this.fbSpr.addChild(this.ftPure);
         this.ftPure.visible = false;
         this.ftOrange = new FTextArea();
         this.ftOrange.x = 70;
         this.ftOrange.y = 20;
         this.ftOrange.textColor = StaticValue.WHITE;
         this.fbSpr.addChild(this.ftOrange);
         this.ftOrange.visible = false;
         this.pureSpr = new Sprite();
         this.pureSpr.graphics.beginFill(1,0);
         this.pureSpr.graphics.drawRect(0,0,125,10);
         this.pureSpr.graphics.endFill();
         this.pureSpr.x = 30;
         this.pureSpr.y = 10;
         this.fbSpr.addChild(this.pureSpr);
         this.pureSpr.addEventListener(MouseEvent.MOUSE_OVER,function():void
         {
            ftPure.visible = true;
         });
         this.pureSpr.addEventListener(MouseEvent.MOUSE_OUT,function():void
         {
            ftPure.visible = false;
         });
         this.pureSpr.addEventListener(MouseEvent.CLICK,this.onClick);
         this.pureSpr.addEventListener(MouseEvent.MOUSE_OVER,this.onfabaoPurTip);
         this.pureSpr.addEventListener(MouseEvent.MOUSE_OUT,this.onfabaoPurTip);
         this.orangeSpr = new Sprite();
         this.orangeSpr.graphics.beginFill(1,0);
         this.orangeSpr.graphics.drawRect(0,0,95,10);
         this.orangeSpr.graphics.endFill();
         this.orangeSpr.x = 35;
         this.orangeSpr.y = 21;
         this.fbSpr.addChild(this.orangeSpr);
         this.orangeSpr.addEventListener(MouseEvent.MOUSE_OVER,function():void
         {
            ftOrange.visible = true;
         });
         this.orangeSpr.addEventListener(MouseEvent.MOUSE_OVER,this.onfabaoOrgTip);
         this.orangeSpr.addEventListener(MouseEvent.MOUSE_OUT,this.onfabaoOrgTip);
         this.orangeSpr.addEventListener(MouseEvent.MOUSE_OUT,function():void
         {
            ftOrange.visible = false;
         });
         this.orangeSpr.addEventListener(MouseEvent.CLICK,this.onClick);
         this.leaderIco = StaticValue.getBitmapByClassName("ui.main.team.leader.ico");
         addChild(this.leaderIco);
         this.leaderIco.x = 210;
         this.leaderIco.y = 50;
         this.leaderIco.visible = false;
         this.charName = new FTextArea();
         with(this.charName)
         {
            filters = StaticValue.filter;
            width = 130;
            height = 20;
            x = 70;
            y = 10;
            defaultTextFormat = new TextFormat(null,null,16777215,true,null,null,null,null,"center");
            text = LanResManager.getLanCommonTextWords("玩家名字");
         }
         addChild(this.charName);
         this.level = new FTextArea();
         with(this.level)
         {
            filters = StaticValue.filter;
            width = 50;
            height = 18;
            x = 200;
            y = 10;
            defaultTextFormat = new TextFormat(null,12,StaticValue.ORANGE,true,null,null,null,null,"center");
            text = "LV:100";
         }
         addChild(this.level);
         this.comboEffect = StaticValue.getMCByClassName("ui.mainchar.combo.10.effect") as MovieClip;
         addChild(this.comboEffect);
         this.comboEffect.x = 204;
         this.comboEffect.y = 73;
         this.comboEffect.gotoAndStop(1);
         this.comboEffect.visible = false;
         this.comboEffect.addEventListener(MouseEvent.MOUSE_OVER,this.showTip);
         this.comboEffect.addEventListener(MouseEvent.MOUSE_OUT,this.showTip);
         this.fireEffect = StaticValue.getMCByClassName("ui.mainchar.effect.fire") as MovieClip;
         addChild(this.fireEffect);
         this.fireEffect.x = 182;
         this.fireEffect.y = 63;
         this.fireEffect.visible = false;
         this.pkBtn = new FSimpleButton();
         this.pkBtn.skin = "peacePKButton";
         addChild(this.pkBtn);
         this.pkBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前模式：") + LanResManager.getLanCommonTextWords("和平") + "<br>" + LanResManager.getLanCommonTextWords("不会对任何人造成伤害") + "</font><br><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击后可变更PK模式") + "</font>";
         addChild(this.pkBtn);
         this.pkBtn.x = 17;
         this.pkBtn.y = 75;
         this.pkBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.pkContainer = new FCanvas();
         this.pkContainer.skin = "menuBg";
         addChild(this.pkContainer);
         this.pkContainer.width = 570;
         this.pkContainer.height = 200;
         this.pkContainer.x = 17;
         this.pkContainer.y = 75 + this.pkBtn.height;
         this.pkContainer.visible = false;
         this.peaceBtn = new FSimpleButton();
         this.peaceBtn.skin = "peacePKButton";
         this.peaceBtn.x = 2;
         this.peaceBtn.y = 10;
         this.pkContainer.addChild(this.peaceBtn);
         this.peaceBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.peaceCheck = new FCheckBox();
         this.pkContainer.addChild(this.peaceCheck);
         this.peaceCheck.x = 543;
         this.peaceCheck.y = 13;
         this.peaceCheck.addEventListener(MouseEvent.CLICK,this.onClick);
         ft = new FTextArea();
         with(ft)
         {
            x = 10;
            y = 135;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = LanResManager.getLanTextWords(this,"选好PK模式后",[StaticValue.RED_HTML,StaticValue.GREEN_HTML,StaticValue.YELLOW_HTML]);
         }
         this.pkContainer.addChild(ft);
         w = w > ft.width ? w : int(ft.width);
         fb = new FLabel();
         with(fb)
         {
            x = 30;
            y = 15;
            filters = StaticValue.filter;
            textColor = StaticValue.YELLOW;
            text = LanResManager.getLanCommonTextWords("【和平模式】您无法对任何玩家发起PK，群攻不会误伤任何玩家");
         }
         this.pkContainer.addChild(fb);
         line = StaticValue.getBitmapByClassName("ui.line");
         line.width = w + 11;
         this.pkContainer.addChild(line);
         line.x = 2;
         line.y = 33;
         this.teamBtn = new FSimpleButton();
         this.teamBtn.skin = "teamPKButton";
         this.pkContainer.addChild(this.teamBtn);
         this.teamBtn.x = 2;
         this.teamBtn.y = 35;
         this.teamBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.teamCheck = new FCheckBox();
         this.pkContainer.addChild(this.teamCheck);
         this.teamCheck.x = 543;
         this.teamCheck.y = 38;
         this.teamCheck.addEventListener(MouseEvent.CLICK,this.onClick);
         fb = new FLabel();
         with(fb)
         {
            x = 30;
            y = 40;
            filters = StaticValue.filter;
            textColor = StaticValue.BLUE;
            text = LanResManager.getLanCommonTextWords("【组队模式】您无法对同队伍玩家发起PK，群攻不会误伤本队玩家");
         }
         this.pkContainer.addChild(fb);
         line = StaticValue.getBitmapByClassName("ui.line");
         line.width = w + 11;
         this.pkContainer.addChild(line);
         line.x = 2;
         line.y = 58;
         this.partyBtn = new FSimpleButton();
         this.partyBtn.skin = "partyPKButton";
         this.pkContainer.addChild(this.partyBtn);
         this.partyBtn.x = 2;
         this.partyBtn.y = 60;
         this.partyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.partyCheck = new FCheckBox();
         this.pkContainer.addChild(this.partyCheck);
         this.partyCheck.x = 543;
         this.partyCheck.y = 63;
         this.partyCheck.addEventListener(MouseEvent.CLICK,this.onClick);
         fb = new FLabel();
         with(fb)
         {
            x = 30;
            y = 65;
            filters = StaticValue.filter;
            textColor = StaticValue.GREEN;
            text = LanResManager.getLanCommonTextWords("【帮会模式】您无法对同帮会玩家发起PK，群攻不会误伤同帮玩家");
         }
         this.pkContainer.addChild(fb);
         line = StaticValue.getBitmapByClassName("ui.line");
         line.width = w + 11;
         this.pkContainer.addChild(line);
         line.x = 2;
         line.y = 83;
         this.allBtn = new FSimpleButton();
         this.allBtn.skin = "allPKButton";
         this.pkContainer.addChild(this.allBtn);
         this.allBtn.x = 2;
         this.allBtn.y = 85;
         this.allBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.allCheck = new FCheckBox();
         this.pkContainer.addChild(this.allCheck);
         this.allCheck.x = 543;
         this.allCheck.y = 88;
         this.allCheck.addEventListener(MouseEvent.CLICK,this.onClick);
         fb = new FLabel();
         with(fb)
         {
            x = 30;
            y = 90;
            filters = StaticValue.filter;
            textColor = StaticValue.RED;
            text = LanResManager.getLanCommonTextWords("【全体模式】您可以发起对任何玩家的PK，群攻会伤害其他任何玩家");
         }
         this.pkContainer.addChild(fb);
         line = StaticValue.getBitmapByClassName("ui.line");
         line.width = w + 11;
         this.pkContainer.addChild(line);
         line.x = 2;
         line.y = 108;
         fb = new FLabel();
         with(fb)
         {
            x = 176;
            y = 115;
            filters = StaticValue.filter;
            textColor = StaticValue.ORANGE;
            text = LanResManager.getLanCommonTextWords("【PK操作说明】");
         }
         this.pkContainer.addChild(fb);
         ft = new FTextArea();
         with(ft)
         {
            x = 10;
            y = 135;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = LanResManager.getLanTextWords(this,"选好PK模式后",[StaticValue.RED_HTML,StaticValue.GREEN_HTML,StaticValue.YELLOW_HTML]);
         }
         this.pkContainer.addChild(ft);
         this.pkContainer.height = ft.y + ft.height + 5;
         this.initHeadCanvas();
         this.zhanBtn = new FSimpleButton();
         this.zhanBtn.skin = "zhandouBtn";
         addChild(this.zhanBtn);
         this.zhanBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("单击可查看当前的战斗力情况。") + "</font>";
         addChild(this.zhanBtn);
         this.zhanBtn.x = -1;
         this.zhanBtn.y = 51;
         this.zhanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.moxueCircle = StaticValue.getMCByClassName("ui.main.function.red.circle") as MovieClip;
         this.moxueCircle.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "" + "</font>";
         addChild(this.moxueCircle);
         this.moxueCircle.x = 245;
         this.moxueCircle.y = 5;
         this.moxueCircle.gotoAndStop(50);
         this.moxueCircle.addEventListener(MouseEvent.MOUSE_OVER,this.onmoxueTip);
         this.moxueCircle.addEventListener(MouseEvent.MOUSE_OUT,this.onmoxueTip);
         this.shiShiZhanKuangBtn = new FSimpleButton();
         this.shiShiZhanKuangBtn.skin = "zhankuangBtn";
         addChild(this.shiShiZhanKuangBtn);
         this.shiShiZhanKuangBtn.x = 220;
         this.shiShiZhanKuangBtn.y = 70;
         this.shiShiZhanKuangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shiShiZhanKuangBtn.visible = false;
         this.kuaFuBaoGuoBtn = new FSimpleButton();
         this.kuaFuBaoGuoBtn.skin = "kuafubaoguoBtn";
         addChild(this.kuaFuBaoGuoBtn);
         this.kuaFuBaoGuoBtn.x = 148;
         this.kuaFuBaoGuoBtn.y = 134;
         this.kuaFuBaoGuoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.kuaFuBaoGuoBtn.visible = false;
         this.wanfaBtn = new FSimpleButton();
         this.wanfaBtn.skin = "wanfaShiyituButton";
         addChild(this.wanfaBtn);
         this.wanfaBtn.x = 220;
         this.wanfaBtn.y = 70 + 60;
         this.wanfaBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.wanfaBtn.visible = false;
         this.btnSpr = new Sprite();
         addChild(this.btnSpr);
         this.btnSpr.x = 300;
         this.btnSpr.y = 25;
         with(this.btnSpr.graphics)
         {
            beginFill(2003199,0);
            drawRect(0,0,380,365);
            endFill();
         }
         this.btnSpr.mouseEnabled = false;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 300;
         $mask.y = 0;
         with($mask.graphics)
         {
            beginFill(51543,0);
            drawRect(0,0,380,365);
            endFill();
         }
         this.btnSpr.mask = $mask;
         this.btnShow = new FSimpleButton();
         this.btnShow.skin = "previousButton";
         this.btnShow.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击隐藏按钮") + "</font>";
         addChild(this.btnShow);
         this.btnShow.x = 275;
         this.btnShow.y = 15;
         this.btnShow.addEventListener(MouseEvent.CLICK,this.onClick);
         this.wangzhezhibangGuizeBtn = new FSimpleButton();
         this.wangzhezhibangGuizeBtn.skin = "WZZB_GZ_Button";
         addChild(this.wangzhezhibangGuizeBtn);
         this.wangzhezhibangGuizeBtn.x = GameConfig.sceneWidth - 240;
         this.wangzhezhibangGuizeBtn.y = 120;
         this.wangzhezhibangGuizeBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.wangzhezhibangGuizeBtn.visible = false;
         this.optionBtn = new FSimpleButton();
         this.optionBtn.skin = "biaGuanBigButton";
         this.optionBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("领取闭关所获真气与经验") + "</font><font color=\'" + StaticValue.GREEN_HTML + "\'>(" + LanResManager.getLanCommonTextWords("快捷键：") + "A)</font>";
         this.optionBtn.x = 0;
         this.optionBtn.y = 0;
         this.optionBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.showBtn = new NewSkinButton();
         this.showBtn.skin = "show_Button";
         this.showBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击显示功能按钮") + "</font>";
         this.showBtn.x = 540;
         this.showBtn.y = 5;
         this.showBtn.visible = false;
         this.showBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.hideBtn = new NewSkinButton();
         this.hideBtn.skin = "hide_Button";
         this.hideBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击隐藏功能按钮") + "</font>";
         this.hideBtn.x = 540;
         this.hideBtn.y = 5;
         this.hideBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.setYN18BtnVisible(true);
         this.seQianDaoBtnVisible(true);
         this.setLongFengDangPuBtnVisible(true);
         this.btnVIP = new NewSkinButton();
         this.btnVIP.skin = "zhizunvip_Button";
         this.btnVIP.x = 15;
         this.btnVIP.y = 100;
         this.btnVIP.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onmoxueTip(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               addEventListener(MouseEvent.MOUSE_MOVE,this.onmoxueTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip1(LanResManager.getLanCommonTextWords("当前魔血：") + this.moxueNow + "/" + this.moxueMax + "<br />" + LanResManager.getLanCommonTextWords("击杀其他玩家可获得魔血1点") + "<br />" + LanResManager.getLanCommonTextWords("魔血用于使用血魔附体技能") + "<br />" + LanResManager.getLanCommonTextWords("可通过与其他玩家交易获得魔血道具"));
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               removeEventListener(MouseEvent.MOUSE_MOVE,this.onmoxueTip);
         }
      }
      
      private function onfabaoOrgTip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               addEventListener(MouseEvent.MOUSE_MOVE,this.onfabaoOrgTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "";
               _loc2_ += "<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("灵力值") + "<br>" + LanResManager.getLanCommonTextWords("玩家每在线10秒获得一次灵力值。") + "<br>" + LanResManager.getLanCommonTextWords("灵力值可用于强化法宝能力");
               _loc2_ += "</textformat>";
               this.showTip1(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               removeEventListener(MouseEvent.MOUSE_MOVE,this.onfabaoOrgTip);
         }
      }
      
      private function onfabaoPurTip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               addEventListener(MouseEvent.MOUSE_MOVE,this.onfabaoPurTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "";
               _loc2_ = "<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("法宝命脉内息") + "<br>" + LanResManager.getLanCommonTextWords("当法宝命脉内息 > 0时，") + "<br>" + LanResManager.getLanCommonTextWords("受到的任何伤害将不可超过自身生命最大值的5%") + "<br>" + LanResManager.getLanCommonTextWords("法宝命脉内息被打空后，自身法宝战斗能力会被极大削弱。") + "<br>" + LanResManager.getLanCommonTextWords("法宝技能无法触发") + "<br>" + LanResManager.getLanCommonTextWords("受到更多的生命伤害") + "<br>" + LanResManager.getLanCommonTextWords("法宝属性降为0") + "<br>" + LanResManager.getLanCommonTextWords("点击可开启灵力系统。") + "<br>" + LanResManager.getLanCommonTextWords("点击血条，则开启灵力界面");
               _loc2_ += "</textformat>";
               this.showTip1(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               removeEventListener(MouseEvent.MOUSE_MOVE,this.onfabaoPurTip);
         }
      }
      
      public function setMoXueValue(param1:int, param2:int) : void
      {
         this.moxueNow = param1;
         this.moxueMax = param2;
         this.moxueCircle.gotoAndStop(int(param1 / param2 * 100));
      }
      
      private function showTip1(param1:String) : void
      {
         this.tip.htmlText = param1;
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 6;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
         Tools.currentStage.addChild(this.tipCanvas);
         if(Tools.currentStage.mouseX + this.tipCanvas.width > Tools.currentStage.stageWidth)
         {
            this.tipCanvas.x = Tools.currentStage.mouseX - this.tipCanvas.width;
         }
         else
         {
            this.tipCanvas.x = Tools.currentStage.mouseX + 10;
         }
         if(Tools.currentStage.mouseY + this.tipCanvas.height > Tools.currentStage.stageHeight)
         {
            this.tipCanvas.y = Tools.currentStage.mouseY - this.tipCanvas.height;
         }
         else
         {
            this.tipCanvas.y = Tools.currentStage.mouseY + 10;
         }
      }
      
      public function showKuafubaoguoButton(param1:Boolean) : void
      {
         this.kuaFuBaoGuoBtn.visible = param1;
         if(!param1)
         {
            this.showShishizhankuangButton(false);
         }
      }
      
      public function showShishizhankuangButton(param1:Boolean) : void
      {
         this.shiShiZhanKuangBtn.visible = param1;
         this.kuaFuBaoGuoBtn.visible = param1;
         this.wanfaBtn.visible = param1;
      }
      
      public function showBiGuanButton(param1:Boolean) : void
      {
         this.optionBtn.visible = param1;
      }
      
      public function showWZZBGuizeButton(param1:Boolean) : void
      {
         this.wangzhezhibangGuizeBtn.visible = param1;
      }
      
      public function showAutoButton(param1:Boolean) : void
      {
         this.autoBtn.visible = param1;
      }
      
      private function initHeadCanvas() : void
      {
         var fb:FLabel;
         var headBg:F9GridBitmap;
         var i:int = 0;
         var j:int = 0;
         var img:Bitmap = null;
         var spr:Sprite = null;
         this.changeHeadCanvas = new FCanvas();
         this.changeHeadCanvas.skin = "menuBg";
         addChild(this.changeHeadCanvas);
         this.changeHeadCanvas.x = 70;
         this.changeHeadCanvas.y = 70;
         this.changeHeadCanvas.width = 380;
         this.changeHeadCanvas.height = 180;
         this.changeHeadCanvas.visible = false;
         this.headCloseBtn = new FSimpleButton();
         this.headCloseBtn.skin = "closeButton";
         this.changeHeadCanvas.addChild(this.headCloseBtn);
         this.headCloseBtn.x = 380 - this.headCloseBtn.width - 2;
         this.headCloseBtn.y = 2;
         this.headCloseBtn.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            changeHeadCanvas.visible = false;
         });
         fb = new FLabel();
         with(fb)
         {
            x = 30;
            y = 5;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("请选择头像");
         }
         this.changeHeadCanvas.addChild(fb);
         headBg = Tools.get9GridBitmpByName("createCharHeadImgBg");
         this.changeHeadCanvas.addChild(headBg);
         headBg.width = 360;
         headBg.height = 150;
         headBg.x = 10;
         headBg.y = 20;
         i = 0;
         while(i < 2)
         {
            j = 0;
            while(j < 5)
            {
               img = StaticValue.getBitmapByClassName("ui.login.create.headImg.slot");
               this.changeHeadCanvas.addChild(img);
               img.x = 16 + j * 70;
               img.y = 26 + i * 70;
               j++;
            }
            i++;
         }
         this.boyHeadContainer = new Sprite();
         this.changeHeadCanvas.addChild(this.boyHeadContainer);
         this.boyHeadContainer.x = 20;
         this.boyHeadContainer.y = 30;
         this.boyHeadContainer.addEventListener(MouseEvent.CLICK,this.onHeadClick);
         this.boyHeadContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onHeadMouseOver);
         i = 0;
         while(i < 2)
         {
            j = 0;
            while(j < 5)
            {
               img = StaticValue.getBitmapByClassName("ui.login.head.head_1_" + (i * 5 + j));
               spr = new Sprite();
               spr.name = "ui.login.head.head_1_" + (i * 5 + j);
               spr.x = j * 70;
               spr.y = i * 70;
               spr.addChild(img);
               this.boyHeadContainer.addChild(spr);
               j++;
            }
            i++;
         }
         this.grilHeadContainer = new Sprite();
         this.changeHeadCanvas.addChild(this.grilHeadContainer);
         this.grilHeadContainer.x = 20;
         this.grilHeadContainer.y = 30;
         this.grilHeadContainer.visible = false;
         this.grilHeadContainer.addEventListener(MouseEvent.CLICK,this.onHeadClick);
         this.grilHeadContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onHeadMouseOver);
         i = 0;
         while(i < 2)
         {
            j = 0;
            while(j < 5)
            {
               img = StaticValue.getBitmapByClassName("ui.login.head.head_3_" + (i * 5 + j));
               spr = new Sprite();
               spr.name = "ui.login.head.head_3_" + (i * 5 + j);
               spr.x = j * 70;
               spr.y = i * 70;
               spr.addChild(img);
               this.grilHeadContainer.addChild(spr);
               j++;
            }
            i++;
         }
      }
      
      private function onHeadMouseOver(param1:MouseEvent) : void
      {
         this.clearFilters(param1.currentTarget as Sprite);
         (param1.target as Sprite).filters = [new GlowFilter(StaticValue.BlUE50,1,4,4,16,BitmapFilterQuality.LOW)];
      }
      
      private function onHeadClick(param1:MouseEvent) : void
      {
         if(!(param1.target is Sprite) || (param1.target as Sprite).name == null || (param1.target as Sprite).name == "")
         {
            return;
         }
         this.changeHeadCanvas.visible = false;
         parent.dispatchEvent(new BaseEvent(MainUI.MAINUI_CHARHEAD_HEAD_IMG_CHANGE,"",(param1.target as Sprite).name));
      }
      
      private function clearFilters(param1:DisplayObjectContainer) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = param1.numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            param1.getChildAt(_loc2_).filters = [];
            _loc2_++;
         }
      }
      
      private function onHeadMouse(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击头像可更换头像") + "<br>" + "</textformat>";
               Tools.currentStage.addChild(this.tipCanvas);
               this.tipCanvas.width = this.tip.width + 4;
               this.tipCanvas.height = this.tip.height + 4;
               this.tipCanvas.x = Tools.currentStage.mouseX + 15;
               this.tipCanvas.y = Tools.currentStage.mouseY + 25;
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               break;
            case MouseEvent.CLICK:
               if(GameInstance.mainCharData.attributeInfo.getSex() == 1)
               {
                  this.boyHeadContainer.visible = true;
                  this.grilHeadContainer.visible = false;
               }
               else
               {
                  this.boyHeadContainer.visible = false;
                  this.grilHeadContainer.visible = true;
               }
               this.changeHeadCanvas.visible = true;
         }
      }
      
      private function showTip(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("每十连斩中的第十斩可以秒杀任意一只小怪") + "<br>" + LanResManager.getLanCommonTextWords("（善用本规则，可快速清理变异怪物，获得高倍经验回报）") + "</font><br>" + "</textformat>";
               Tools.currentStage.addChild(this.tipCanvas);
               this.tipCanvas.width = this.tip.width + 4;
               this.tipCanvas.height = this.tip.height + 4;
               this.tipCanvas.x = Tools.currentStage.mouseX + 15;
               this.tipCanvas.y = Tools.currentStage.mouseY + 25;
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
         }
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.redRegulateBtn:
               this.redRegulateBtn.startDrag(false,new Rectangle(-3,0,132,0));
               break;
            case this.blutRegulateBtn:
               this.blutRegulateBtn.startDrag(false,new Rectangle(-3,14,132,0));
               break;
            case this.yellowRegulateBtn:
               this.yellowRegulateBtn.startDrag(false,new Rectangle(-3,28,132,0));
         }
         Tools.currentStage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         Tools.currentStage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         this.redRegulateBtn.toolTip = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您的当前设置为：") + "<br>" + LanResManager.getLanCommonTextWords("血量低于") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + int((this.redRegulateBtn.x + 3) / 132 * 100) + "%</font>" + LanResManager.getLanCommonTextWords("自动使用生命恢复药") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("【可以左右拖动滑块改变自动恢复设置】") + "</font>";
         this.blutRegulateBtn.toolTip = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您的当前设置为：") + "<br>" + LanResManager.getLanCommonTextWords("内力低于") + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + int((this.blutRegulateBtn.x + 3) / 132 * 100) + "%</font>" + LanResManager.getLanCommonTextWords("自动使用内力恢复药") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("【可以左右拖动滑块改变自动恢复设置】") + "</font>";
         this.yellowRegulateBtn.toolTip = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您的当前设置为：") + "<br>" + LanResManager.getLanCommonTextWords("体力低于") + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + int((this.yellowRegulateBtn.x + 3) / 132 * 100) + "%</font>" + LanResManager.getLanCommonTextWords("自动使用体力恢复药") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("【可以左右拖动滑块改变自动恢复设置】") + "</font>";
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this.redRegulateBtn.stopDrag();
         this.redRegulateBtn.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.blutRegulateBtn.stopDrag();
         this.blutRegulateBtn.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.yellowRegulateBtn.stopDrag();
         this.yellowRegulateBtn.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         Tools.currentStage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         parent.dispatchEvent(new BaseEvent(MainUI.MAINUI_MAINCHAR_AUTO_VALUE_CHANGE,"",[int((this.redRegulateBtn.x + 3) / 132 * 100),int((this.blutRegulateBtn.x + 3) / 132 * 100),int((this.yellowRegulateBtn.x + 3) / 132 * 100)]));
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         /*
          * Decompilation error
          * Timeout (1 minute) was reached
          * Instruction count: 9820
          */
         throw new flash.errors.IllegalOperationError("Not decompiled due to timeout");
      }
      
      public function setPK(param1:int) : void
      {
         this.peaceCheck.selectState = this.teamCheck.selectState = this.partyCheck.selectState = this.allCheck.selectState = false;
         switch(param1)
         {
            case 0:
               this.pkBtn.skin = "peacePKButton";
               this.pkBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前模式：") + LanResManager.getLanCommonTextWords("和平") + "<br>" + LanResManager.getLanCommonTextWords("不会对任何人造成伤害") + "</font><br><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击后可变更PK模式") + "</font>";
               this.peaceCheck.selectState = true;
               break;
            case 1:
               this.pkBtn.skin = "teamPKButton";
               this.pkBtn.toolTip = "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前模式：") + LanResManager.getLanCommonTextWords("组队") + "<br>" + LanResManager.getLanCommonTextWords("不会对同队成员造成伤害") + "</font><br><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击后可变更PK模式") + "</font>";
               this.teamCheck.selectState = true;
               break;
            case 2:
               this.pkBtn.skin = "partyPKButton";
               this.pkBtn.toolTip = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前模式：") + LanResManager.getLanCommonTextWords("帮派") + "<br>" + LanResManager.getLanCommonTextWords("不会对帮派成员造成伤害") + "</font><br><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击后可变更PK模式") + "</font>";
               this.partyCheck.selectState = true;
               break;
            case 3:
               this.pkBtn.skin = "allPKButton";
               this.pkBtn.toolTip = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前模式：") + LanResManager.getLanCommonTextWords("全体") + "<br>" + LanResManager.getLanCommonTextWords("可以对任何人造成伤害") + "</font><br><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击后可变更PK模式") + "</font>";
               this.allCheck.selectState = true;
         }
      }
      
      public function setAutoValue(param1:int, param2:int, param3:int) : void
      {
         this.redRegulateBtn.toolTip = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您的当前设置为：") + "<br>" + LanResManager.getLanCommonTextWords("血量低于") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + param1 + "%</font>" + LanResManager.getLanCommonTextWords("自动使用生命恢复药") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("【可以左右拖动滑块改变自动恢复设置】") + "</font>";
         this.redRegulateBtn.x = param1 / 100 * 132 - 3;
         this.blutRegulateBtn.toolTip = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您的当前设置为：") + "<br>" + LanResManager.getLanCommonTextWords("内力低于") + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + param2 + "%</font>" + LanResManager.getLanCommonTextWords("自动使用内力恢复药") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("【可以左右拖动滑块改变自动恢复设置】") + "</font>";
         this.blutRegulateBtn.x = param2 / 100 * 132 - 3;
         this.yellowRegulateBtn.toolTip = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您的当前设置为：") + "<br>" + LanResManager.getLanCommonTextWords("体力低于") + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param3 + "%</font>" + LanResManager.getLanCommonTextWords("自动使用体力恢复药") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("【可以左右拖动滑块改变自动恢复设置】") + "</font>";
         this.yellowRegulateBtn.x = param3 / 100 * 132 - 3;
      }
      
      public function showComboEffect(param1:int) : void
      {
         if(param1 == 0)
         {
            this.comboEffect.visible = false;
         }
         else
         {
            this.comboEffect.visible = true;
            this.comboEffect.gotoAndStop(param1);
         }
         if(param1 == 10)
         {
            this.comboEffect.visible = false;
            this.fireEffect.visible = true;
            this.fireEffect.gotoAndPlay(1);
         }
      }
      
      public function setXianshiBtnVisible(param1:Boolean, param2:Number = 0) : void
      {
         var onUpdate:Function;
         var $show:Boolean = param1;
         var $lostTime:Number = param2;
         if($show)
         {
            if(this.xianshiCanvas == null)
            {
               this.xianshiCanvas = new Sprite();
               this.xianshiCanvas.mouseEnabled = false;
               this.xianshiCanvas.x = 0;
               this.xianshiCanvas.y = 8 - 8;
               this.xianshiText = new FTextArea();
               this.xianshiText.mouseEnabled = false;
               this.xianshiText.autoSize = TextFieldAutoSize.LEFT;
               this.xianshiText.filters = [new GlowFilter(16711680,0.5,2,2,15,BitmapFilterQuality.LOW)];
               this.xianshiText.x = -30;
               this.xianshiText.y = -24;
               this.xianshiCanvas.addChild(this.xianshiText);
               this.xianshiBtn = new FSimpleButton();
               this.xianshiBtn.y = 0;
               this.xianshiBtn.skin = "timeGift_btn";
               this.xianshiBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("限时礼包") + "</font>";
               this.xianshiCanvas.addChild(this.xianshiBtn);
            }
            if(this.xianshiCanvas.parent != this)
            {
               this.btnSpr.addChild(this.xianshiCanvas);
            }
            this.xianshiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            if(this.xianshiTimer != null)
            {
               TimerManager.deleteTimer(this.xianshiTimer);
               this.xianshiTimer = null;
            }
            if($lostTime > 0)
            {
               onUpdate = function(param1:Number):void
               {
                  var _loc2_:Function = Math.floor;
                  var _loc3_:int = _loc2_(param1 / 86400);
                  var _loc4_:int = _loc2_(param1 % 86400 / 3600);
                  var _loc5_:int = _loc2_(param1 % 86400 % 3600 / 60);
                  var _loc6_:String = "";
                  if(_loc3_ > 0)
                  {
                     _loc6_ += _loc3_ + LanResManager.getLanCommonTextWords("天");
                  }
                  if(_loc4_ > 0)
                  {
                     _loc6_ += _loc4_ + LanResManager.getLanCommonTextWords("小时");
                  }
                  if(_loc5_ > 0)
                  {
                     _loc6_ += _loc5_ + LanResManager.getLanCommonTextWords("分");
                  }
                  xianshiText.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("限时活动离结束仅剩：") + _loc6_ + "</font>";
               };
               this.xianshiTimer = TimerManager.createExactTimer($lostTime,$lostTime,0,onUpdate,null,60);
               onUpdate($lostTime);
            }
            else
            {
               this.xianshiText.htmlText = "";
            }
         }
         else
         {
            if(Boolean(this.xianshiCanvas) && this.xianshiCanvas.parent != null)
            {
               this.xianshiCanvas.parent.removeChild(this.xianshiCanvas);
            }
            if(this.xianshiBtn != null)
            {
               this.xianshiBtn.removeEventListener(MouseEvent.CLICK,this.onClick);
            }
            if(this.xianshiTimer != null)
            {
               TimerManager.deleteTimer(this.xianshiTimer);
               this.xianshiTimer = null;
            }
         }
         this.setAnniuPosition();
      }
      
      public function setBiwuDahuiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.biwuCrossPlatformBtn == null)
            {
               this.biwuCrossPlatformBtn = new FSimpleButton();
               this.biwuCrossPlatformBtn.skin = "kuapingtaiButton";
               this.biwuCrossPlatformBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("跨平台比武") + "</font><font color=\'" + StaticValue.GREEN_HTML + "\'></font>";
               this.btnSpr.addChild(this.biwuCrossPlatformBtn);
               this.biwuCrossPlatformBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.biwuCrossPlatformBtn.y = 34 - 8;
            this.biwuCrossPlatformBtn.visible = param1;
         }
         else if(Boolean(this.biwuCrossPlatformBtn) && Boolean(this.biwuCrossPlatformBtn.parent))
         {
            this.biwuCrossPlatformBtn.parent.removeChild(this.biwuCrossPlatformBtn);
            this.biwuCrossPlatformBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setCiShaBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ciShaShuoMingBtn == null)
            {
               this.ciShaShuoMingBtn = new FSimpleButton();
               this.ciShaShuoMingBtn.skin = "ciShaButton";
               this.ciShaShuoMingBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("刺杀任务") + "</font><font color=\'" + StaticValue.GREEN_HTML + "\'></font>";
               this.btnSpr.addChild(this.ciShaShuoMingBtn);
               this.ciShaShuoMingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ciShaShuoMingBtn.y = 34 - 1;
            this.ciShaShuoMingBtn.visible = param1;
         }
         else if(Boolean(this.ciShaShuoMingBtn) && Boolean(this.ciShaShuoMingBtn.parent))
         {
            this.ciShaShuoMingBtn.parent.removeChild(this.ciShaShuoMingBtn);
            this.ciShaShuoMingBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function seAojianZhengbaBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.aojianZhengbaBtn == null)
            {
               this.aojianZhengbaBtn = new FSimpleButton();
               this.aojianZhengbaBtn.skin = "zhengbaButton";
               this.aojianZhengbaBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("傲剑争霸，每天19:00—19:30开启，争夺【傲剑】，为你独尊！") + "</font><font color=\'" + StaticValue.GREEN_HTML + "\'></font>";
               this.btnSpr.addChild(this.aojianZhengbaBtn);
               this.aojianZhengbaBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.aojianZhengbaBtn.y = 34 - 1;
            this.aojianZhengbaBtn.visible = param1;
         }
         else if(Boolean(this.aojianZhengbaBtn) && Boolean(this.aojianZhengbaBtn.parent))
         {
            this.aojianZhengbaBtn.parent.removeChild(this.aojianZhengbaBtn);
            this.aojianZhengbaBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function createJuBaoPenBtn(param1:Boolean = false) : FSimpleButton
      {
         if(this.juBaoPenBtn == null)
         {
            this.juBaoPenBtn = new FSimpleButton();
            this.juBaoPenBtn.skin = "jubaopenButton";
            this.juBaoPenBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("聚宝盆") + "</font><font color=\'" + StaticValue.GREEN_HTML + "\'></font>";
            this.btnSpr.addChild(this.juBaoPenBtn);
            this.juBaoPenBtn.visible = false;
            this.juBaoPenBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         }
         this.setAnniuPosition(param1);
         return this.juBaoPenBtn;
      }
      
      public function hideJuBaoPenBtn() : void
      {
         if(Boolean(this.juBaoPenBtn) && Boolean(this.juBaoPenBtn.parent))
         {
            this.juBaoPenBtn.parent.removeChild(this.juBaoPenBtn);
            this.juBaoPenBtn = null;
         }
      }
      
      public function seQianDaoBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.QianDaoBtn == null)
            {
               this.QianDaoBtn = new FSimpleButton();
               this.QianDaoBtn.skin = "qiandaoButton";
               this.QianDaoBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击签到领奖") + "</font><font color=\'" + StaticValue.GREEN_HTML + "\'></font>";
               this.btnSpr.addChild(this.QianDaoBtn);
               this.QianDaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.QianDaoBtn.x = 0;
            this.QianDaoBtn.y = 0;
            this.QianDaoBtn.visible = param1;
         }
         else if(Boolean(this.QianDaoBtn) && Boolean(this.QianDaoBtn.parent))
         {
            this.QianDaoBtn.parent.removeChild(this.QianDaoBtn);
            this.QianDaoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setJiLeiZhiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.JiLeiZhiBtn == null)
            {
               this.JiLeiZhiBtn = new FSimpleButton();
               this.JiLeiZhiBtn.skin = "jileizhiButton";
               this.JiLeiZhiBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("积累值兑换") + "</font><font color=\'" + StaticValue.GREEN_HTML + "\'></font>";
               this.btnSpr.addChild(this.JiLeiZhiBtn);
               this.JiLeiZhiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.JiLeiZhiBtn.y = 34 - 1 - 4;
            this.JiLeiZhiBtn.visible = param1;
         }
         else if(Boolean(this.JiLeiZhiBtn) && Boolean(this.JiLeiZhiBtn.parent))
         {
            this.JiLeiZhiBtn.parent.removeChild(this.JiLeiZhiBtn);
            this.JiLeiZhiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setDanTiaoWangBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.danTiaoWangBtn == null)
            {
               this.danTiaoWangBtn = new FSimpleButton();
               this.danTiaoWangBtn.skin = "dantiaowangButton";
               this.danTiaoWangBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("每天13:00-13:30开启") + "</font>";
               this.btnSpr.addChild(this.danTiaoWangBtn);
               this.danTiaoWangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.danTiaoWangBtn.visible = param1;
         }
         else if(Boolean(this.danTiaoWangBtn) && Boolean(this.danTiaoWangBtn.parent))
         {
            this.danTiaoWangBtn.parent.removeChild(this.danTiaoWangBtn);
            this.danTiaoWangBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYeWaiBossBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yeWaiBossBtn == null)
            {
               this.yeWaiBossBtn = new FSimpleButton();
               this.yeWaiBossBtn.skin = "yewaibossBtn";
               this.yeWaiBossBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("每天8：30、12:30、17:30、23:30会刷新野外BOSS") + "</font>";
               this.btnSpr.addChild(this.yeWaiBossBtn);
               this.yeWaiBossBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yeWaiBossBtn.visible = param1;
         }
         else if(Boolean(this.yeWaiBossBtn) && Boolean(this.yeWaiBossBtn.parent))
         {
            this.yeWaiBossBtn.parent.removeChild(this.yeWaiBossBtn);
            this.yeWaiBossBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setTianJiangXiangRuiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.tianJiangXiangRuiBtn == null)
            {
               this.tianJiangXiangRuiBtn = new FSimpleButton();
               this.tianJiangXiangRuiBtn.skin = "tianJiangXiangruiBtn";
               this.tianJiangXiangRuiBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("每周六、日13：00~14:00；19:00~20:00") + "</font>";
               this.btnSpr.addChild(this.tianJiangXiangRuiBtn);
               this.tianJiangXiangRuiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.tianJiangXiangRuiBtn.visible = param1;
         }
         else if(Boolean(this.tianJiangXiangRuiBtn) && Boolean(this.tianJiangXiangRuiBtn.parent))
         {
            this.tianJiangXiangRuiBtn.parent.removeChild(this.tianJiangXiangRuiBtn);
            this.tianJiangXiangRuiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBiWuZhaoQinBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.biWuZhaoQinBtn == null)
            {
               this.biWuZhaoQinBtn = new FSimpleButton();
               this.biWuZhaoQinBtn.skin = "biwuzhaoqinBtn";
               this.biWuZhaoQinBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("比武招亲") + "</font>";
               this.btnSpr.addChild(this.biWuZhaoQinBtn);
               this.biWuZhaoQinBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.biWuZhaoQinBtn.visible = param1;
         }
         else if(Boolean(this.biWuZhaoQinBtn) && Boolean(this.biWuZhaoQinBtn.parent))
         {
            this.biWuZhaoQinBtn.parent.removeChild(this.biWuZhaoQinBtn);
            this.biWuZhaoQinBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setXinMoBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.xinMoBtn == null)
            {
               this.xinMoBtn = new FSimpleButton();
               this.xinMoBtn.skin = "xinMoBtn";
               this.xinMoBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("心魔降临") + "</font>";
               this.btnSpr.addChild(this.xinMoBtn);
               this.xinMoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.xinMoBtn.visible = param1;
         }
         else if(Boolean(this.xinMoBtn) && Boolean(this.xinMoBtn.parent))
         {
            this.xinMoBtn.parent.removeChild(this.xinMoBtn);
            this.xinMoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setHuangTuBaYeBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.huangTuBayeBtn == null)
            {
               this.huangTuBayeBtn = new FSimpleButton();
               this.huangTuBayeBtn.skin = "huangTuBaYeBtn";
               this.huangTuBayeBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("皇途霸业") + "</font>";
               this.btnSpr.addChild(this.huangTuBayeBtn);
               this.huangTuBayeBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.huangTuBayeBtn.visible = param1;
         }
         else if(Boolean(this.huangTuBayeBtn) && Boolean(this.huangTuBayeBtn.parent))
         {
            this.huangTuBayeBtn.parent.removeChild(this.huangTuBayeBtn);
            this.huangTuBayeBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setRankingBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynRankBtn == null)
            {
               this.ynRankBtn = new FSimpleButton();
               this.ynRankBtn.skin = "rankingYNBtn";
               this.ynRankBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("新服排行榜") + "</font>";
               this.btnSpr.addChild(this.ynRankBtn);
               this.ynRankBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynRankBtn.visible = param1;
         }
         else if(Boolean(this.ynRankBtn) && Boolean(this.ynRankBtn.parent))
         {
            this.ynRankBtn.parent.removeChild(this.ynRankBtn);
            this.ynRankBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setJubaopenBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynJubaopenBtn == null)
            {
               this.ynJubaopenBtn = new FSimpleButton();
               this.ynJubaopenBtn.skin = "jubaopenYNBtn";
               this.ynJubaopenBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("聚宝盆") + "</font>";
               this.btnSpr.addChild(this.ynJubaopenBtn);
               this.ynJubaopenBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynJubaopenBtn.visible = param1;
         }
         else if(Boolean(this.ynJubaopenBtn) && Boolean(this.ynJubaopenBtn.parent))
         {
            this.ynJubaopenBtn.parent.removeChild(this.ynJubaopenBtn);
            this.ynJubaopenBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setJubaopenBtnVisible1(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynJubaopenBtn1 == null)
            {
               this.ynJubaopenBtn1 = new FSimpleButton();
               this.ynJubaopenBtn1.skin = "jubaopenYNBtn1";
               this.ynJubaopenBtn1.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("高级聚宝盆") + "</font>";
               this.btnSpr.addChild(this.ynJubaopenBtn1);
               this.ynJubaopenBtn1.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynJubaopenBtn1.visible = param1;
         }
         else if(Boolean(this.ynJubaopenBtn1) && Boolean(this.ynJubaopenBtn1.parent))
         {
            this.ynJubaopenBtn1.parent.removeChild(this.ynJubaopenBtn1);
            this.ynJubaopenBtn1 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setJubaopenBtnVisible2(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynjvbaopenBtn2 == null)
            {
               this.ynjvbaopenBtn2 = new NewSkinButton();
               this.ynjvbaopenBtn2.skin = "jubaopen2018_Button";
               this.ynjvbaopenBtn2.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("超级聚宝盆") + "</font>";
               this.btnSpr.addChild(this.ynjvbaopenBtn2);
               this.ynjvbaopenBtn2.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynjvbaopenBtn2.visible = param1;
         }
         else if(Boolean(this.ynjvbaopenBtn2) && Boolean(this.ynjvbaopenBtn2.parent))
         {
            this.ynjvbaopenBtn2.parent.removeChild(this.ynjvbaopenBtn2);
            this.ynjvbaopenBtn2 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setJubaopenBtnVisible3(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynjvbaopenBtn3 == null)
            {
               this.ynjvbaopenBtn3 = new NewSkinButton();
               this.ynjvbaopenBtn3.skin = "ynjubaopenzhong";
               this.ynjvbaopenBtn3.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("聚宝盆中") + "</font>";
               this.btnSpr.addChild(this.ynjvbaopenBtn3);
               this.ynjvbaopenBtn3.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynjvbaopenBtn3.visible = param1;
         }
         else if(Boolean(this.ynjvbaopenBtn3) && Boolean(this.ynjvbaopenBtn3.parent))
         {
            this.ynjvbaopenBtn3.parent.removeChild(this.ynjvbaopenBtn3);
            this.ynjvbaopenBtn3 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setJubaopenBtnVisible5(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynjvbaopenBtn5 == null)
            {
               this.ynjvbaopenBtn5 = new NewSkinButton();
               this.ynjvbaopenBtn5.skin = "ynjubaopenzhong5";
               this.ynjvbaopenBtn5.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("黄金绿发") + "</font>";
               this.btnSpr.addChild(this.ynjvbaopenBtn5);
               this.ynjvbaopenBtn5.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynjvbaopenBtn5.visible = param1;
         }
         else if(Boolean(this.ynjvbaopenBtn5) && Boolean(this.ynjvbaopenBtn5.parent))
         {
            this.ynjvbaopenBtn5.parent.removeChild(this.ynjvbaopenBtn5);
            this.ynjvbaopenBtn5 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setJubaopenBtnVisible6(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynjvbaopen6Btn == null)
            {
               this.ynjvbaopen6Btn = new NewSkinButton();
               this.ynjvbaopen6Btn.skin = "ynjubaopenzhong6";
               this.ynjvbaopen6Btn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("黄金绿发下") + "</font>";
               this.btnSpr.addChild(this.ynjvbaopen6Btn);
               this.ynjvbaopen6Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynjvbaopen6Btn.visible = param1;
         }
         else if(Boolean(this.ynjvbaopen6Btn) && Boolean(this.ynjvbaopen6Btn.parent))
         {
            this.ynjvbaopen6Btn.parent.removeChild(this.ynjvbaopen6Btn);
            this.ynjvbaopen6Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYN888ShopBtnVisible(param1:Boolean) : void
      {
         param1 = false;
         if(param1)
         {
            if(this.yn888ShopBtn == null)
            {
               this.yn888ShopBtn = new FSimpleButton();
               this.yn888ShopBtn.skin = "yn888shopBtn";
               this.yn888ShopBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("888商城") + "</font>";
               this.btnSpr.addChild(this.yn888ShopBtn);
               this.yn888ShopBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn888ShopBtn.visible = param1;
         }
         else if(Boolean(this.yn888ShopBtn) && Boolean(this.yn888ShopBtn.parent))
         {
            this.yn888ShopBtn.parent.removeChild(this.yn888ShopBtn);
            this.yn888ShopBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNXingyuanzhuanpanBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXingyunzhuanpanBtn == null)
            {
               this.ynXingyunzhuanpanBtn = new FSimpleButton();
               this.ynXingyunzhuanpanBtn.skin = "ynXingyunZhuanpanBtn";
               this.btnSpr.addChild(this.ynXingyunzhuanpanBtn);
               this.ynXingyunzhuanpanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXingyunzhuanpanBtn.visible = param1;
         }
         else if(Boolean(this.ynXingyunzhuanpanBtn) && Boolean(this.ynXingyunzhuanpanBtn.parent))
         {
            this.ynXingyunzhuanpanBtn.parent.removeChild(this.ynXingyunzhuanpanBtn);
            this.ynXingyunzhuanpanBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNChristmasBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynChristmasBtn == null)
            {
               this.ynChristmasBtn = new FSimpleButton();
               this.ynChristmasBtn.skin = "sdtYNBtn";
               this.ynChristmasBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("圣诞贴") + "</font>";
               this.btnSpr.addChild(this.ynChristmasBtn);
               this.ynChristmasBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynChristmasBtn.visible = param1;
         }
         else if(Boolean(this.ynChristmasBtn) && Boolean(this.ynChristmasBtn.parent))
         {
            this.ynChristmasBtn.parent.removeChild(this.ynChristmasBtn);
            this.ynChristmasBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNWebBtn1Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWebBtn1 == null)
            {
               this.ynWebBtn1 = new FSimpleButton();
               this.ynWebBtn1.skin = "YNWebBtn1";
               this.btnSpr.addChild(this.ynWebBtn1);
               this.ynWebBtn1.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWebBtn1.visible = param1;
         }
         else if(Boolean(this.ynWebBtn1) && Boolean(this.ynWebBtn1.parent))
         {
            this.ynWebBtn1.parent.removeChild(this.ynWebBtn1);
            this.ynWebBtn1 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNLongzhizhufuBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynLongzhizhufuBtn == null)
            {
               this.ynLongzhizhufuBtn = new FSimpleButton();
               this.ynLongzhizhufuBtn.skin = "longzhizhufuYNBtn";
               this.ynLongzhizhufuBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙之祝福") + "</font>";
               this.btnSpr.addChild(this.ynLongzhizhufuBtn);
               this.ynLongzhizhufuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynLongzhizhufuBtn.visible = param1;
         }
         else if(Boolean(this.ynLongzhizhufuBtn) && Boolean(this.ynLongzhizhufuBtn.parent))
         {
            this.ynLongzhizhufuBtn.parent.removeChild(this.ynLongzhizhufuBtn);
            this.ynLongzhizhufuBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNChristmasGiftBtnVisible(param1:Boolean) : void
      {
         param1 = true;
         if(param1)
         {
            if(this.ynChristmasGiftBtn == null)
            {
               this.ynChristmasGiftBtn = new FSimpleButton();
               this.ynChristmasGiftBtn.skin = "yn2015ChristmasBtn";
               this.btnSpr.addChild(this.ynChristmasGiftBtn);
               this.ynChristmasGiftBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynChristmasGiftBtn.visible = param1;
         }
         else if(Boolean(this.ynChristmasGiftBtn) && Boolean(this.ynChristmasGiftBtn.parent))
         {
            this.ynChristmasGiftBtn.parent.removeChild(this.ynChristmasGiftBtn);
            this.ynChristmasGiftBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setShijieBeiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynShijiebeiBtn == null)
            {
               this.ynShijiebeiBtn = new FSimpleButton();
               this.ynShijiebeiBtn.skin = "ynWorldCupBtn";
               this.ynShijiebeiBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("世界杯排行榜") + "</font>";
               this.btnSpr.addChild(this.ynShijiebeiBtn);
               this.ynShijiebeiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynShijiebeiBtn.visible = param1;
         }
         else if(Boolean(this.ynShijiebeiBtn) && Boolean(this.ynShijiebeiBtn.parent))
         {
            this.ynShijiebeiBtn.parent.removeChild(this.ynShijiebeiBtn);
            this.ynShijiebeiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setFengZhengJieBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.fengzhengjieBtn == null)
            {
               this.fengzhengjieBtn = new NewSkinButton();
               this.fengzhengjieBtn.skin = "fengZhengJieButton";
               this.btnSpr.addChild(this.fengzhengjieBtn);
               this.fengzhengjieBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.fengzhengjieBtn.visible = param1;
         }
         else if(Boolean(this.fengzhengjieBtn) && Boolean(this.fengzhengjieBtn.parent))
         {
            this.fengzhengjieBtn.parent.removeChild(this.fengzhengjieBtn);
            this.fengzhengjieBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWanbaogeBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.wanbaogeBtn == null)
            {
               this.wanbaogeBtn = new FSimpleButton();
               this.wanbaogeBtn.skin = "wanbaogeButton";
               this.wanbaogeBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("万众瞩目，万宝阁荣耀回归") + "</font>";
               this.btnSpr.addChild(this.wanbaogeBtn);
               this.wanbaogeBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.wanbaogeBtn.visible = param1;
         }
         else if(Boolean(this.wanbaogeBtn) && Boolean(this.wanbaogeBtn.parent))
         {
            this.wanbaogeBtn.parent.removeChild(this.wanbaogeBtn);
            this.wanbaogeBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNonlineBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynOnlineBtn == null)
            {
               this.ynOnlineBtn = new FSimpleButton();
               this.ynOnlineBtn.skin = "ynOnlineBtn";
               this.ynOnlineBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("在线领奖") + "</font>";
               this.btnSpr.addChild(this.ynOnlineBtn);
               this.ynOnlineBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynOnlineBtn.visible = param1;
         }
         else if(Boolean(this.ynOnlineBtn) && Boolean(this.ynOnlineBtn.parent))
         {
            this.ynOnlineBtn.parent.removeChild(this.ynOnlineBtn);
            this.ynOnlineBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNRichangBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynRichangBtn == null)
            {
               this.ynRichangBtn = new FSimpleButton();
               this.ynRichangBtn.skin = "ynRichangBtn";
               this.ynRichangBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("日常面板") + "</font>";
               this.btnSpr.addChild(this.ynRichangBtn);
               this.ynRichangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynRichangBtn.visible = param1;
         }
         else if(Boolean(this.ynRichangBtn) && Boolean(this.ynRichangBtn.parent))
         {
            this.ynRichangBtn.parent.removeChild(this.ynRichangBtn);
            this.ynRichangBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNFengdengjieBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynFengdengjieBtn == null)
            {
               this.ynFengdengjieBtn = new FSimpleButton();
               this.ynFengdengjieBtn.skin = "ynFengdengBtn";
               this.ynFengdengjieBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("风灯节") + "</font>";
               this.btnSpr.addChild(this.ynFengdengjieBtn);
               this.ynFengdengjieBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynFengdengjieBtn.visible = param1;
         }
         else if(Boolean(this.ynFengdengjieBtn) && Boolean(this.ynFengdengjieBtn.parent))
         {
            this.ynFengdengjieBtn.parent.removeChild(this.ynFengdengjieBtn);
            this.ynFengdengjieBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNXinshouBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXinshouBtn == null)
            {
               this.ynXinshouBtn = new FSimpleButton();
               this.ynXinshouBtn.skin = "ynXinshouBtn";
               this.ynXinshouBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("新手活动") + "</font>";
               this.btnSpr.addChild(this.ynXinshouBtn);
               this.ynXinshouBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXinshouBtn.visible = param1;
         }
         else if(Boolean(this.ynXinshouBtn) && Boolean(this.ynXinshouBtn.parent))
         {
            this.ynXinshouBtn.parent.removeChild(this.ynXinshouBtn);
            this.ynXinshouBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNChristmasHuodongBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynChristmasHuodongBtn == null)
            {
               this.ynChristmasHuodongBtn = new FSimpleButton();
               this.ynChristmasHuodongBtn.skin = "yn2015ChristmasBtn1";
               this.ynChristmasHuodongBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("特殊活动") + "</font>";
               this.btnSpr.addChild(this.ynChristmasHuodongBtn);
               this.ynChristmasHuodongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynChristmasHuodongBtn.visible = param1;
         }
         else if(Boolean(this.ynChristmasHuodongBtn) && Boolean(this.ynChristmasHuodongBtn.parent))
         {
            this.ynChristmasHuodongBtn.parent.removeChild(this.ynChristmasHuodongBtn);
            this.ynChristmasHuodongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNJinshenHuodongBtnBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynJinshenHuodongBtn == null)
            {
               this.ynJinshenHuodongBtn = new FSimpleButton();
               this.ynJinshenHuodongBtn.skin = "ynJinshenHuodongBtn";
               this.btnSpr.addChild(this.ynJinshenHuodongBtn);
               this.ynJinshenHuodongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynJinshenHuodongBtn.visible = param1;
         }
         else if(Boolean(this.ynJinshenHuodongBtn) && Boolean(this.ynJinshenHuodongBtn.parent))
         {
            this.ynJinshenHuodongBtn.parent.removeChild(this.ynJinshenHuodongBtn);
            this.ynJinshenHuodongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNWuLinShenBingBtnBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWulinShenbingBtn == null)
            {
               this.ynWulinShenbingBtn = new FSimpleButton();
               this.ynWulinShenbingBtn.skin = "ynWuLinShenBingBtn";
               this.ynWulinShenbingBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("武林神兵") + "</font>";
               this.btnSpr.addChild(this.ynWulinShenbingBtn);
               this.ynWulinShenbingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWulinShenbingBtn.visible = param1;
         }
         else if(Boolean(this.ynWulinShenbingBtn) && Boolean(this.ynWulinShenbingBtn.parent))
         {
            this.ynWulinShenbingBtn.parent.removeChild(this.ynWulinShenbingBtn);
            this.ynWulinShenbingBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYN201638huodong1BtnBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn201638huodong1Btn == null)
            {
               this.yn201638huodong1Btn = new NewSkinButton();
               this.yn201638huodong1Btn.skin = "yn201638huodongButton1";
               this.btnSpr.addChild(this.yn201638huodong1Btn);
               this.yn201638huodong1Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn201638huodong1Btn.visible = param1;
         }
         else if(Boolean(this.yn201638huodong1Btn) && Boolean(this.yn201638huodong1Btn.parent))
         {
            this.yn201638huodong1Btn.parent.removeChild(this.yn201638huodong1Btn);
            this.yn201638huodong1Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNbaimeiguiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynBaimeiguiBtn == null)
            {
               this.ynBaimeiguiBtn = new NewSkinButton();
               this.ynBaimeiguiBtn.skin = "ynBMG_Button";
               this.btnSpr.addChild(this.ynBaimeiguiBtn);
               this.ynBaimeiguiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynBaimeiguiBtn.visible = param1;
         }
         else if(Boolean(this.ynBaimeiguiBtn) && Boolean(this.ynBaimeiguiBtn.parent))
         {
            this.ynBaimeiguiBtn.parent.removeChild(this.ynBaimeiguiBtn);
            this.ynBaimeiguiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNXSKSBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXSKSBtn == null)
            {
               this.ynXSKSBtn = new NewSkinButton();
               this.ynXSKSBtn.skin = "ynXSKS_Button";
               this.ynXSKSBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("玄说矿石") + "</font>";
               this.btnSpr.addChild(this.ynXSKSBtn);
               this.ynXSKSBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXSKSBtn.visible = param1;
         }
         else if(Boolean(this.ynXSKSBtn) && Boolean(this.ynXSKSBtn.parent))
         {
            this.ynXSKSBtn.parent.removeChild(this.ynXSKSBtn);
            this.ynXSKSBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNSBBKSYBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynSBBKSYBtn == null)
            {
               this.ynSBBKSYBtn = new NewSkinButton();
               this.ynSBBKSYBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("神兵不可思议") + "</font>";
               this.ynSBBKSYBtn.skin = "ynBKSY_Button";
               this.btnSpr.addChild(this.ynSBBKSYBtn);
               this.ynSBBKSYBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynSBBKSYBtn.visible = param1;
         }
         else if(Boolean(this.ynSBBKSYBtn) && Boolean(this.ynSBBKSYBtn.parent))
         {
            this.ynSBBKSYBtn.parent.removeChild(this.ynSBBKSYBtn);
            this.ynSBBKSYBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNASSLBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynASSLBtn == null)
            {
               this.ynASSLBtn = new NewSkinButton();
               this.ynASSLBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("傲神神龙") + "</font>";
               this.ynASSLBtn.skin = "ynASSL_Button";
               this.btnSpr.addChild(this.ynASSLBtn);
               this.ynASSLBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynASSLBtn.visible = param1;
         }
         else if(Boolean(this.ynASSLBtn) && Boolean(this.ynASSLBtn.parent))
         {
            this.ynASSLBtn.parent.removeChild(this.ynASSLBtn);
            this.ynASSLBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNDDSQBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynDDSQBtn == null)
            {
               this.ynDDSQBtn = new NewSkinButton();
               this.ynDDSQBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("锻打神器") + "</font>";
               this.ynDDSQBtn.skin = "ynDDSQ_Button";
               this.btnSpr.addChild(this.ynDDSQBtn);
               this.ynDDSQBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynDDSQBtn.visible = param1;
         }
         else if(Boolean(this.ynDDSQBtn) && Boolean(this.ynDDSQBtn.parent))
         {
            this.ynDDSQBtn.parent.removeChild(this.ynDDSQBtn);
            this.ynDDSQBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNWZWZBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWZWZBtn == null)
            {
               this.ynWZWZBtn = new NewSkinButton();
               this.ynWZWZBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("王者武装") + "</font>";
               this.ynWZWZBtn.skin = "ynWZWZ_Button";
               this.btnSpr.addChild(this.ynWZWZBtn);
               this.ynWZWZBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWZWZBtn.visible = param1;
         }
         else if(Boolean(this.ynWZWZBtn) && Boolean(this.ynWZWZBtn.parent))
         {
            this.ynWZWZBtn.parent.removeChild(this.ynWZWZBtn);
            this.ynWZWZBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNXFBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXFBtn == null)
            {
               this.ynXFBtn = new NewSkinButton();
               this.ynXFBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("血风") + "</font>";
               this.ynXFBtn.skin = "ynXFButton";
               this.btnSpr.addChild(this.ynXFBtn);
               this.ynXFBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXFBtn.visible = param1;
         }
         else if(Boolean(this.ynXFBtn) && Boolean(this.ynXFBtn.parent))
         {
            this.ynXFBtn.parent.removeChild(this.ynXFBtn);
            this.ynXFBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYN38JieBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn38jieBtn == null)
            {
               this.yn38jieBtn = new FSimpleButton();
               this.yn38jieBtn.skin = "yn38Btn";
               this.yn38jieBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("送花活动") + "</font>";
               this.btnSpr.addChild(this.yn38jieBtn);
               this.yn38jieBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn38jieBtn.visible = param1;
         }
         else if(Boolean(this.yn38jieBtn) && Boolean(this.yn38jieBtn.parent))
         {
            this.yn38jieBtn.parent.removeChild(this.yn38jieBtn);
            this.yn38jieBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNRoseBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynRoseBtn == null)
            {
               this.ynRoseBtn = new FSimpleButton();
               this.ynRoseBtn.skin = "ynRoseBtn";
               this.btnSpr.addChild(this.ynRoseBtn);
               this.ynRoseBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynRoseBtn.visible = param1;
         }
         else if(Boolean(this.ynRoseBtn) && Boolean(this.ynRoseBtn.parent))
         {
            this.ynRoseBtn.parent.removeChild(this.ynRoseBtn);
            this.ynRoseBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNLianyaoBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynLianyaoBtn == null)
            {
               this.ynLianyaoBtn = new FSimpleButton();
               this.ynLianyaoBtn.skin = "ynLianyaoBtn";
               this.btnSpr.addChild(this.ynLianyaoBtn);
               this.ynLianyaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynLianyaoBtn.visible = param1;
         }
         else if(Boolean(this.ynLianyaoBtn) && Boolean(this.ynLianyaoBtn.parent))
         {
            this.ynLianyaoBtn.parent.removeChild(this.ynLianyaoBtn);
            this.ynLianyaoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setZhiZhanZhiShangVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.zhizhanzhishangBtn == null)
            {
               this.zhizhanzhishangBtn = new FSimpleButton();
               this.zhizhanzhishangBtn.skin = "zhizhanzhishangButton";
               this.zhizhanzhishangBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("止战之殇") + "</font>";
               this.btnSpr.addChild(this.zhizhanzhishangBtn);
               this.zhizhanzhishangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.zhizhanzhishangBtn.y = 34 - 1 - 40;
            this.zhizhanzhishangBtn.visible = param1;
         }
         else if(Boolean(this.zhizhanzhishangBtn) && Boolean(this.zhizhanzhishangBtn.parent))
         {
            this.zhizhanzhishangBtn.parent.removeChild(this.zhizhanzhishangBtn);
            this.zhizhanzhishangBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setNewYearBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynYXDXBtn == null)
            {
               this.ynYXDXBtn = new FSimpleButton();
               this.ynYXDXBtn.skin = "ynYXDXBtn";
               this.ynYXDXBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("英雄雕像活动") + "</font>";
               this.btnSpr.addChild(this.ynYXDXBtn);
               this.ynYXDXBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynYXDXBtn.visible = param1;
         }
         else if(Boolean(this.ynYXDXBtn) && Boolean(this.ynYXDXBtn.parent))
         {
            this.ynYXDXBtn.parent.removeChild(this.ynYXDXBtn);
            this.ynYXDXBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYuRenJieBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yurenjieBtn == null)
            {
               this.yurenjieBtn = new FSimpleButton();
               this.yurenjieBtn.skin = "yuRenJieButton";
               this.yurenjieBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("4月1号，整蛊王活动正式开启") + "</font>";
               this.btnSpr.addChild(this.yurenjieBtn);
               this.yurenjieBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yurenjieBtn.visible = param1;
         }
         else if(Boolean(this.yurenjieBtn) && Boolean(this.yurenjieBtn.parent))
         {
            this.yurenjieBtn.parent.removeChild(this.yurenjieBtn);
            this.yurenjieBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setDouDiZhuBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.doudizhuBtn == null)
            {
               this.doudizhuBtn = new FSimpleButton();
               this.doudizhuBtn.skin = "doudizhuButton";
               this.doudizhuBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("5月1号至5月4号，斗黑心地主！拼小红花！") + "</font>";
               this.btnSpr.addChild(this.doudizhuBtn);
               this.doudizhuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.doudizhuBtn.visible = param1;
         }
         else if(Boolean(this.doudizhuBtn) && Boolean(this.doudizhuBtn.parent))
         {
            this.doudizhuBtn.parent.removeChild(this.doudizhuBtn);
            this.doudizhuBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setDuanWuJieBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.duanwujieBtn == null)
            {
               this.duanwujieBtn = new FSimpleButton();
               this.duanwujieBtn.skin = "duanwujieButton";
               this.duanwujieBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动日期：5月31日 00：00 - 6月2日 22：00") + "</font>";
               this.btnSpr.addChild(this.duanwujieBtn);
               this.duanwujieBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.duanwujieBtn.visible = param1;
         }
         else if(Boolean(this.duanwujieBtn) && Boolean(this.duanwujieBtn.parent))
         {
            this.duanwujieBtn.parent.removeChild(this.duanwujieBtn);
            this.duanwujieBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setQiXiJieBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.qixijieBtn == null)
            {
               this.qixijieBtn = new NewSkinButton();
               this.qixijieBtn.skin = "qixijieButton";
               this.qixijieBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动日期：8月1日 00：00 - 8月3日 24：00") + "</font>";
               this.btnSpr.addChild(this.qixijieBtn);
               this.qixijieBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.qixijieBtn.visible = param1;
         }
         else if(Boolean(this.qixijieBtn) && Boolean(this.qixijieBtn.parent))
         {
            this.qixijieBtn.parent.removeChild(this.qixijieBtn);
            this.qixijieBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWoHuCangLongBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.woHuCangLongBtn == null)
            {
               this.woHuCangLongBtn = new FSimpleButton();
               this.woHuCangLongBtn.skin = "woHuCangLongqButton";
               this.woHuCangLongBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("卧虎藏龙") + "</font>";
               this.btnSpr.addChild(this.woHuCangLongBtn);
               this.woHuCangLongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.woHuCangLongBtn.visible = param1;
         }
         else if(Boolean(this.woHuCangLongBtn) && Boolean(this.woHuCangLongBtn.parent))
         {
            this.woHuCangLongBtn.parent.removeChild(this.woHuCangLongBtn);
            this.woHuCangLongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWishingTreeBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.wishingTreeBtn == null)
            {
               this.wishingTreeBtn = new FSimpleButton();
               this.wishingTreeBtn.skin = "treeButton";
               this.wishingTreeBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("许愿树") + "</font>";
               this.btnSpr.addChild(this.wishingTreeBtn);
               this.wishingTreeBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.wishingTreeBtn.visible = param1;
         }
         else if(Boolean(this.wishingTreeBtn) && Boolean(this.wishingTreeBtn.parent))
         {
            this.wishingTreeBtn.parent.removeChild(this.wishingTreeBtn);
            this.wishingTreeBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setFabaoBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.fabaoBtn == null)
            {
               this.fabaoBtn = new FSimpleButton();
               this.fabaoBtn.skin = "duanwujieButton";
               addChild(this.fabaoBtn);
               this.fabaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.fabaoBtn.visible = param1;
         }
         else if(Boolean(this.fabaoBtn) && Boolean(this.fabaoBtn.parent))
         {
            this.fabaoBtn.parent.removeChild(this.fabaoBtn);
            this.fabaoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setShiJieBeiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.shiJieBeiBtn == null)
            {
               this.shiJieBeiBtn = new NewSkinButton();
               this.shiJieBeiBtn.skin = "shiJieBei_Button";
               this.btnSpr.addChild(this.shiJieBeiBtn);
               this.shiJieBeiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.shiJieBeiBtn.visible = param1;
         }
         else if(Boolean(this.shiJieBeiBtn) && Boolean(this.shiJieBeiBtn.parent))
         {
            this.shiJieBeiBtn.parent.removeChild(this.shiJieBeiBtn);
            this.shiJieBeiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setShengxiaoBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.shengxiaoBtn == null)
            {
               this.shengxiaoBtn = new FSimpleButton();
               this.shengxiaoBtn.skin = "shengxiao_Button";
               this.btnSpr.addChild(this.shengxiaoBtn);
               this.shengxiaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.shengxiaoBtn.visible = param1;
         }
         else if(Boolean(this.shengxiaoBtn) && Boolean(this.shengxiaoBtn.parent))
         {
            this.shengxiaoBtn.parent.removeChild(this.shengxiaoBtn);
            this.shengxiaoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setTunShiTianDiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.tunShiTianDiBtn == null)
            {
               this.tunShiTianDiBtn = new NewSkinButton();
               this.tunShiTianDiBtn.skin = "tunShiTianDi_btn";
               this.btnSpr.addChild(this.tunShiTianDiBtn);
               this.tunShiTianDiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.tunShiTianDiBtn.visible = param1;
         }
         else if(Boolean(this.tunShiTianDiBtn) && Boolean(this.tunShiTianDiBtn.parent))
         {
            this.tunShiTianDiBtn.parent.removeChild(this.tunShiTianDiBtn);
            this.tunShiTianDiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBuchangFubenBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.buchangfubenBtn == null)
            {
               this.buchangfubenBtn = new FSimpleButton();
               this.buchangfubenBtn.skin = "KOGM_Button";
               this.btnSpr.addChild(this.buchangfubenBtn);
               this.buchangfubenBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.buchangfubenBtn.visible = param1;
         }
         else if(Boolean(this.buchangfubenBtn) && Boolean(this.buchangfubenBtn.parent))
         {
            this.buchangfubenBtn.parent.removeChild(this.buchangfubenBtn);
            this.buchangfubenBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setZhongQiuJieBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.zhongQiuJieBtn == null)
            {
               this.zhongQiuJieBtn = new NewSkinButton();
               this.zhongQiuJieBtn.skin = "zhongQiuJieButton";
               this.zhongQiuJieBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动日期：9月6日 00：00 - 9月8日 22：00") + "</font>";
               this.btnSpr.addChild(this.zhongQiuJieBtn);
               this.zhongQiuJieBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.zhongQiuJieBtn.visible = param1;
         }
         else if(Boolean(this.zhongQiuJieBtn) && Boolean(this.zhongQiuJieBtn.parent))
         {
            this.zhongQiuJieBtn.parent.removeChild(this.zhongQiuJieBtn);
            this.zhongQiuJieBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNBookRankBtnVisible(param1:Boolean) : void
      {
         param1 = true;
         if(param1)
         {
            if(this.ynBookRankBtn == null)
            {
               this.ynBookRankBtn = new FSimpleButton();
               this.ynBookRankBtn.skin = "YNBookRankBtn";
               this.btnSpr.addChild(this.ynBookRankBtn);
               this.ynBookRankBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynBookRankBtn.visible = param1;
         }
         else if(Boolean(this.ynBookRankBtn) && Boolean(this.ynBookRankBtn.parent))
         {
            this.ynBookRankBtn.parent.removeChild(this.ynBookRankBtn);
            this.ynBookRankBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWangZheZhiBangBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.wangzhezhibangBtn == null)
            {
               this.wangzhezhibangBtn = new FSimpleButton();
               this.wangzhezhibangBtn.skin = "WZZB_MAIN_Button";
               this.btnSpr.addChild(this.wangzhezhibangBtn);
               this.wangzhezhibangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.wangzhezhibangBtn.visible = param1;
         }
         else if(Boolean(this.wangzhezhibangBtn) && Boolean(this.wangzhezhibangBtn.parent))
         {
            this.wangzhezhibangBtn.parent.removeChild(this.wangzhezhibangBtn);
            this.wangzhezhibangBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYuanXiaoJieBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yuanXiaoJieBtn == null)
            {
               this.yuanXiaoJieBtn = new NewSkinButton();
               this.yuanXiaoJieBtn.skin = "yuanXiaoJie_Button";
               this.btnSpr.addChild(this.yuanXiaoJieBtn);
               this.yuanXiaoJieBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yuanXiaoJieBtn.visible = param1;
         }
         else if(Boolean(this.yuanXiaoJieBtn) && Boolean(this.yuanXiaoJieBtn.parent))
         {
            this.yuanXiaoJieBtn.parent.removeChild(this.yuanXiaoJieBtn);
            this.yuanXiaoJieBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYaSuiQianBtnVisible(param1:Boolean, param2:int = 0) : void
      {
         if(param1)
         {
            if(this.yasuiqianCanvas == null)
            {
               this.yasuiqianCanvas = new Sprite();
               this.yasuiqianCanvas.mouseEnabled = false;
               this.yasuiqianCanvas.x = 0;
               this.yasuiqianCanvas.y = 0;
               this.yasuiqianText = new FTextArea();
               this.yasuiqianText.mouseEnabled = false;
               this.yasuiqianText.autoSize = TextFieldAutoSize.LEFT;
               this.yasuiqianText.filters = [new GlowFilter(16711680,0.5,2,2,15,BitmapFilterQuality.LOW)];
               this.yasuiqianText.x = -30 + 30 - 3;
               this.yasuiqianText.y = -24 + 25 + 40;
               this.yasuiqianCanvas.addChild(this.yasuiqianText);
               this.yasuiqianBtn = new FSimpleButton();
               this.yasuiqianBtn.y = 0;
               this.yasuiqianBtn.skin = "newyearMoneyButton";
               this.yasuiqianBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("连续在线5小时就可领取100元春节红包哦!") + "</font>";
               this.yasuiqianCanvas.addChild(this.yasuiqianBtn);
            }
            if(this.yasuiqianCanvas.parent != this)
            {
               this.btnSpr.addChild(this.yasuiqianCanvas);
            }
            this.yasuiqianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            this.time = param2;
            this.stratTime = getTimer();
            addEventListener(Event.ENTER_FRAME,this.onEnterFarme);
         }
         else
         {
            if(Boolean(this.yasuiqianCanvas) && this.yasuiqianCanvas.parent != null)
            {
               this.yasuiqianCanvas.parent.removeChild(this.yasuiqianCanvas);
            }
            if(this.yasuiqianBtn != null)
            {
               this.yasuiqianBtn.removeEventListener(MouseEvent.CLICK,this.onClick);
            }
         }
         this.setAnniuPosition();
      }
      
      public function setYNMIKBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynMIKBtn == null)
            {
               this.ynMIKBtn = new FSimpleButton();
               this.ynMIKBtn.skin = "ynMIKBtn";
               this.ynMIKBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("MIK足球排行榜") + "</font>";
               this.btnSpr.addChild(this.ynMIKBtn);
               this.ynMIKBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynMIKBtn.visible = param1;
         }
         else if(Boolean(this.ynMIKBtn) && Boolean(this.ynMIKBtn.parent))
         {
            this.ynMIKBtn.parent.removeChild(this.ynMIKBtn);
            this.ynMIKBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNlianhuanchongzhiBtnVisible(param1:Boolean, param2:int = 2230) : void
      {
         if(param1)
         {
            if(this.ynLHCZBtn == null)
            {
               this.ynLHCZBtn = new FSimpleButton();
               if(param2 == 2230)
               {
                  this.ynLHCZBtn.skin = "ynLHCZBtn1";
               }
               else if(param2 == 2231)
               {
                  this.ynLHCZBtn.skin = "ynLHCZBtn2";
               }
               else if(param2 == 2232)
               {
                  this.ynLHCZBtn.skin = "ynLHCZBtn3";
               }
               else if(param2 == 2233)
               {
                  this.ynLHCZBtn.skin = "ynLHCZBtn4";
               }
               this.btnSpr.addChild(this.ynLHCZBtn);
               this.ynLHCZBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynLHCZBtn.visible = param1;
         }
         else if(Boolean(this.ynLHCZBtn) && Boolean(this.ynLHCZBtn.parent))
         {
            this.ynLHCZBtn.parent.removeChild(this.ynLHCZBtn);
            this.ynLHCZBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNshoucichongzhiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynSCCZBtn == null)
            {
               this.ynSCCZBtn = new NewSkinButton();
               this.ynSCCZBtn.skin = "ynshouchong22";
               this.btnSpr.addChild(this.ynSCCZBtn);
               this.ynSCCZBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynSCCZBtn.visible = param1;
         }
         else if(Boolean(this.ynSCCZBtn) && Boolean(this.ynSCCZBtn.parent))
         {
            this.ynSCCZBtn.parent.removeChild(this.ynSCCZBtn);
            this.ynSCCZBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYN2015zhongqiuBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn2015zhongqiuBtn == null)
            {
               this.yn2015zhongqiuBtn = new FSimpleButton();
               this.yn2015zhongqiuBtn.skin = "yn2015ZQBtn_czfk";
               this.btnSpr.addChild(this.yn2015zhongqiuBtn);
               this.yn2015zhongqiuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn2015zhongqiuBtn.visible = param1;
         }
         else if(Boolean(this.yn2015zhongqiuBtn) && Boolean(this.yn2015zhongqiuBtn.parent))
         {
            this.yn2015zhongqiuBtn.parent.removeChild(this.yn2015zhongqiuBtn);
            this.yn2015zhongqiuBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNqianghuazhishenVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynQHZSBtn == null)
            {
               this.ynQHZSBtn = new FSimpleButton();
               this.ynQHZSBtn.skin = "ynQHZSBtn";
               this.btnSpr.addChild(this.ynQHZSBtn);
               this.ynQHZSBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynQHZSBtn.visible = param1;
         }
         else if(Boolean(this.ynQHZSBtn) && Boolean(this.ynQHZSBtn.parent))
         {
            this.ynQHZSBtn.parent.removeChild(this.ynQHZSBtn);
            this.ynQHZSBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNqianghuazhishen2Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynQHZSBtn2 == null)
            {
               this.ynQHZSBtn2 = new FSimpleButton();
               this.ynQHZSBtn2.skin = "ynQHZSBtn";
               this.btnSpr.addChild(this.ynQHZSBtn2);
               this.ynQHZSBtn2.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynQHZSBtn2.visible = param1;
         }
         else if(Boolean(this.ynQHZSBtn2) && Boolean(this.ynQHZSBtn2.parent))
         {
            this.ynQHZSBtn2.parent.removeChild(this.ynQHZSBtn2);
            this.ynQHZSBtn2 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNqianghuazhishen3Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynQHZSBtn3 == null)
            {
               this.ynQHZSBtn3 = new FSimpleButton();
               this.ynQHZSBtn3.skin = "ynQHZSBtn";
               this.btnSpr.addChild(this.ynQHZSBtn3);
               this.ynQHZSBtn3.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynQHZSBtn3.visible = param1;
         }
         else if(Boolean(this.ynQHZSBtn3) && Boolean(this.ynQHZSBtn3.parent))
         {
            this.ynQHZSBtn3.parent.removeChild(this.ynQHZSBtn3);
            this.ynQHZSBtn3 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNqianghuazhishen4Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynQHZSBtn4 == null)
            {
               this.ynQHZSBtn4 = new FSimpleButton();
               this.ynQHZSBtn4.skin = "ynQHZSBtn";
               this.btnSpr.addChild(this.ynQHZSBtn4);
               this.ynQHZSBtn4.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynQHZSBtn4.visible = param1;
         }
         else if(Boolean(this.ynQHZSBtn4) && Boolean(this.ynQHZSBtn4.parent))
         {
            this.ynQHZSBtn4.parent.removeChild(this.ynQHZSBtn4);
            this.ynQHZSBtn4 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNChongzhiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynChongzhiBtn == null)
            {
               this.ynChongzhiBtn = new FSimpleButton();
               this.ynChongzhiBtn.skin = "ynBtn_cz";
               this.ynChongzhiBtn.x = 135 + 100;
               this.ynChongzhiBtn.y = 80 - 30;
               addChild(this.ynChongzhiBtn);
               this.ynChongzhiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynChongzhiBtn.visible = param1;
         }
         else if(Boolean(this.ynChongzhiBtn) && Boolean(this.ynChongzhiBtn.parent))
         {
            this.ynChongzhiBtn.parent.removeChild(this.ynChongzhiBtn);
            this.ynChongzhiBtn = null;
         }
      }
      
      public function setYN18BtnVisible(param1:Boolean) : void
      {
         var $show:Boolean = param1;
         if($show)
         {
            if(this.yn18 == null)
            {
               this.yn18 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/18.swf");
               this.yn18.x = 135 + 110;
               this.yn18.y = 85;
               addChild(this.yn18);
            }
            this.yn18.visible = $show;
         }
         else if(Boolean(this.yn18) && Boolean(this.yn18.parent))
         {
            this.yn18.parent.removeChild(this.yn18);
            this.yn18 = null;
         }
         ToolTips.createToolTips(this.yn18,this,function(param1:*, param2:MouseEvent):String
         {
            var _loc3_:String = "";
            return "<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("18岁以下玩家禁止游戏！") + "</textformat>";
         });
      }
      
      public function setYNshiziBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynShiziBtn == null)
            {
               this.ynShiziBtn = new FSimpleButton();
               this.ynShiziBtn.skin = "ynShiziBtn";
               this.ynShiziBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("狮子排行榜") + "</font>";
               this.btnSpr.addChild(this.ynShiziBtn);
               this.ynShiziBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynShiziBtn.visible = param1;
         }
         else if(Boolean(this.ynShiziBtn) && Boolean(this.ynShiziBtn.parent))
         {
            this.ynShiziBtn.parent.removeChild(this.ynShiziBtn);
            this.ynShiziBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setXiaoZhuKuaiPaoBtnVisible(param1:Boolean) : void
      {
         if(this.xiaozhukuaipaoBtn == null)
         {
            this.xiaozhukuaipaoBtn = new NewSkinButton();
            this.xiaozhukuaipaoBtn.skin = "xzkp_Button";
            this.xiaozhukuaipaoBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("小猪快跑") + "</font>";
            this.btnSpr.addChild(this.xiaozhukuaipaoBtn);
            this.xiaozhukuaipaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         }
         else if(Boolean(this.xiaozhukuaipaoBtn) && Boolean(this.xiaozhukuaipaoBtn.parent))
         {
            this.xiaozhukuaipaoBtn.parent.removeChild(this.xiaozhukuaipaoBtn);
            this.xiaozhukuaipaoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setDuiXueRenBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.duiXueRenBtn == null)
            {
               this.duiXueRenBtn = new NewSkinButton();
               this.duiXueRenBtn.skin = "duixueren_Button";
               this.duiXueRenBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "" + "</font>";
               this.btnSpr.addChild(this.duiXueRenBtn);
               this.duiXueRenBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.duiXueRenBtn.visible = param1;
         }
         else if(Boolean(this.duiXueRenBtn) && Boolean(this.duiXueRenBtn.parent))
         {
            this.duiXueRenBtn.parent.removeChild(this.duiXueRenBtn);
            this.duiXueRenBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNshierdizhiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn2016yuanxiaoBtn == null)
            {
               this.yn2016yuanxiaoBtn = new NewSkinButton();
               this.yn2016yuanxiaoBtn.skin = "yn2016yxj";
               this.btnSpr.addChild(this.yn2016yuanxiaoBtn);
               this.yn2016yuanxiaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn2016yuanxiaoBtn.visible = param1;
         }
         else if(Boolean(this.yn2016yuanxiaoBtn) && Boolean(this.yn2016yuanxiaoBtn.parent))
         {
            this.yn2016yuanxiaoBtn.parent.removeChild(this.yn2016yuanxiaoBtn);
            this.yn2016yuanxiaoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYN201638huodongBtnBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn201638huodongBtn == null)
            {
               this.yn201638huodongBtn = new NewSkinButton();
               this.yn201638huodongBtn.skin = "yn201638huodongButton";
               this.btnSpr.addChild(this.yn201638huodongBtn);
               this.yn201638huodongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn201638huodongBtn.visible = param1;
         }
         else if(Boolean(this.yn201638huodongBtn) && Boolean(this.yn201638huodongBtn.parent))
         {
            this.yn201638huodongBtn.parent.removeChild(this.yn201638huodongBtn);
            this.yn201638huodongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNwzzbBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWZZBBtn == null)
            {
               this.ynWZZBBtn = new NewSkinButton();
               this.ynWZZBBtn.skin = "ynWZZB_Button";
               this.ynWZZBBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("王者之帮") + "</font>";
               this.btnSpr.addChild(this.ynWZZBBtn);
               this.ynWZZBBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWZZBBtn.visible = param1;
         }
         else if(Boolean(this.ynWZZBBtn) && Boolean(this.ynWZZBBtn.parent))
         {
            this.ynWZZBBtn.parent.removeChild(this.ynWZZBBtn);
            this.ynWZZBBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNzmqzBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZMQZBtn == null)
            {
               this.ynZMQZBtn = new NewSkinButton();
               this.ynZMQZBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("之梦钱庄") + "</font>";
               this.ynZMQZBtn.skin = "ynZMQZ_Button";
               this.btnSpr.addChild(this.ynZMQZBtn);
               this.ynZMQZBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZMQZBtn.visible = param1;
         }
         else if(Boolean(this.ynZMQZBtn) && Boolean(this.ynZMQZBtn.parent))
         {
            this.ynZMQZBtn.parent.removeChild(this.ynZMQZBtn);
            this.ynZMQZBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYN2016YNzhuanpanBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn2016zhuanpanBtn == null)
            {
               this.yn2016zhuanpanBtn = new NewSkinButton();
               this.yn2016zhuanpanBtn.skin = "yn201638huodongButton";
               this.yn2016zhuanpanBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("幸运转盘") + "</font>";
               this.btnSpr.addChild(this.yn2016zhuanpanBtn);
               this.yn2016zhuanpanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn2016zhuanpanBtn.visible = param1;
         }
         else if(Boolean(this.yn2016zhuanpanBtn) && Boolean(this.yn2016zhuanpanBtn.parent))
         {
            this.yn2016zhuanpanBtn.parent.removeChild(this.yn2016zhuanpanBtn);
            this.yn2016zhuanpanBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNchongzhidafaBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynChongzhidafa == null)
            {
               this.ynChongzhidafa = new NewSkinButton();
               this.ynChongzhidafa.skin = "ynCZDF_Button";
               this.btnSpr.addChild(this.ynChongzhidafa);
               this.ynChongzhidafa.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynChongzhidafa.visible = param1;
         }
         else if(Boolean(this.ynChongzhidafa) && Boolean(this.ynChongzhidafa.parent))
         {
            this.ynChongzhidafa.parent.removeChild(this.ynChongzhidafa);
            this.ynChongzhidafa = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNXueshikuangshaBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXsksBtn == null)
            {
               this.ynXsksBtn = new FSimpleButton();
               this.ynXsksBtn.skin = "ynxsksBtn";
               this.ynXsksBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "" + "</font>";
               this.btnSpr.addChild(this.ynXsksBtn);
               this.ynXsksBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXsksBtn.visible = param1;
         }
         else if(Boolean(this.ynXsksBtn) && Boolean(this.ynXsksBtn.parent))
         {
            this.ynXsksBtn.parent.removeChild(this.ynXsksBtn);
            this.ynXsksBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYN2016CGVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn2016CGBtn == null)
            {
               this.yn2016CGBtn = new FSimpleButton();
               this.yn2016CGBtn.skin = "ynQ2016CGBtn";
               this.btnSpr.addChild(this.yn2016CGBtn);
               this.yn2016CGBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn2016CGBtn.visible = param1;
         }
         else if(Boolean(this.yn2016CGBtn) && Boolean(this.yn2016CGBtn.parent))
         {
            this.yn2016CGBtn.parent.removeChild(this.yn2016CGBtn);
            this.yn2016CGBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYN2016DLVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn2016DLBtn == null)
            {
               this.yn2016DLBtn = new FSimpleButton();
               this.yn2016DLBtn.skin = "yn2016DLBtn";
               this.btnSpr.addChild(this.yn2016DLBtn);
               this.yn2016DLBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn2016DLBtn.visible = param1;
         }
         else if(Boolean(this.yn2016DLBtn) && Boolean(this.yn2016DLBtn.parent))
         {
            this.yn2016DLBtn.parent.removeChild(this.yn2016DLBtn);
            this.yn2016DLBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYN2016OnlineVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn2016onlineBtn == null)
            {
               this.yn2016onlineBtn = new NewSkinButton();
               this.yn2016onlineBtn.skin = "ynqitiandengluBtn";
               this.btnSpr.addChild(this.yn2016onlineBtn);
               this.yn2016onlineBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn2016onlineBtn.visible = param1;
         }
         else if(Boolean(this.yn2016onlineBtn) && Boolean(this.yn2016onlineBtn.parent))
         {
            this.yn2016onlineBtn.parent.removeChild(this.yn2016onlineBtn);
            this.yn2016onlineBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYN2016newyearVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn2016newyearBtn == null)
            {
               this.yn2016newyearBtn = new FSimpleButton();
               this.yn2016newyearBtn.skin = "yn2016newyear";
               this.btnSpr.addChild(this.yn2016newyearBtn);
               this.yn2016newyearBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn2016newyearBtn.visible = param1;
         }
         else if(Boolean(this.yn2016newyearBtn) && Boolean(this.yn2016newyearBtn.parent))
         {
            this.yn2016newyearBtn.parent.removeChild(this.yn2016newyearBtn);
            this.yn2016newyearBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setLongFengDangPuBtnVisible(param1:Boolean) : void
      {
         var $show:Boolean = param1;
         if(Boolean(this.vipMc) && this.vipMc.parent != null)
         {
            this.vipMc.parent.removeChild(this.vipMc);
         }
         if(this.vipMcSpr)
         {
            this.vipMcSpr.visible = $show;
         }
         if($show)
         {
            if(this.longfengdangpuBtn == null)
            {
               this.longfengdangpuBtn = new NewSkinButton();
               this.longfengdangpuBtn.skin = "lfdp_Button";
               this.longfengdangpuBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙凤当铺") + "</font>";
               this.btnSpr.addChild(this.longfengdangpuBtn);
               this.longfengdangpuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
               this.vipMcSpr = new Sprite();
               this.vipMcSpr.mouseChildren = false;
               this.vipMcSpr.mouseEnabled = false;
               this.btnSpr.addChild(this.vipMcSpr);
            }
            if(this.vipMc == null)
            {
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  vipMc = _loc2_.content as MovieClip;
                  if(vipMc)
                  {
                     vipMcSpr.addChild(vipMc);
                  }
               },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/longfengdangpu/texiao.swf");
            }
            else
            {
               this.vipMcSpr.addChild(this.vipMc);
            }
            this.longfengdangpuBtn.visible = $show;
         }
         else if(Boolean(this.longfengdangpuBtn) && Boolean(this.longfengdangpuBtn.parent))
         {
            this.longfengdangpuBtn.parent.removeChild(this.longfengdangpuBtn);
            this.longfengdangpuBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNXWHDVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXWHDBtn == null)
            {
               this.ynXWHDBtn = new NewSkinButton();
               this.ynXWHDBtn.skin = "ynXWHDBtn";
               this.btnSpr.addChild(this.ynXWHDBtn);
               this.ynXWHDBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXWHDBtn.visible = param1;
         }
         else if(Boolean(this.ynXWHDBtn) && Boolean(this.ynXWHDBtn.parent))
         {
            this.ynXWHDBtn.parent.removeChild(this.ynXWHDBtn);
            this.ynXWHDBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNXFHDVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXFHDBtn == null)
            {
               this.ynXFHDBtn = new NewSkinButton();
               this.ynXFHDBtn.skin = "yn2016512xiaofeiBtn";
               this.btnSpr.addChild(this.ynXFHDBtn);
               this.ynXFHDBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXFHDBtn.visible = param1;
         }
         else if(Boolean(this.ynXFHDBtn) && Boolean(this.ynXFHDBtn.parent))
         {
            this.ynXFHDBtn.parent.removeChild(this.ynXFHDBtn);
            this.ynXFHDBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setXLHTVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXianglonghutiButton == null)
            {
               this.ynXianglonghutiButton = new NewSkinButton();
               this.ynXianglonghutiButton.skin = "yn2016xianglonghutiBtn";
               this.btnSpr.addChild(this.ynXianglonghutiButton);
               this.ynXianglonghutiButton.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXianglonghutiButton.visible = param1;
         }
         else if(Boolean(this.ynXianglonghutiButton) && Boolean(this.ynXianglonghutiButton.parent))
         {
            this.ynXianglonghutiButton.parent.removeChild(this.ynXianglonghutiButton);
            this.ynXianglonghutiButton = null;
         }
         this.setAnniuPosition();
      }
      
      public function setOZZQVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynouzhouzuqiuButton == null)
            {
               this.ynouzhouzuqiuButton = new NewSkinButton();
               this.ynouzhouzuqiuButton.skin = "yn2016zuqiuBtn";
               this.btnSpr.addChild(this.ynouzhouzuqiuButton);
               this.ynouzhouzuqiuButton.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynouzhouzuqiuButton.visible = param1;
         }
         else if(Boolean(this.ynouzhouzuqiuButton) && Boolean(this.ynouzhouzuqiuButton.parent))
         {
            this.ynouzhouzuqiuButton.parent.removeChild(this.ynouzhouzuqiuButton);
            this.ynouzhouzuqiuButton = null;
         }
         this.setAnniuPosition();
      }
      
      public function setRTJVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ertongjieBtn == null)
            {
               this.ertongjieBtn = new NewSkinButton();
               this.ertongjieBtn.skin = "yn2016ertongjieBtn";
               this.btnSpr.addChild(this.ertongjieBtn);
               this.ertongjieBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ertongjieBtn.visible = param1;
         }
         else if(Boolean(this.ertongjieBtn) && Boolean(this.ertongjieBtn.parent))
         {
            this.ertongjieBtn.parent.removeChild(this.ertongjieBtn);
            this.ertongjieBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNWSZLVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.wushenBtn == null)
            {
               this.wushenBtn = new NewSkinButton();
               this.wushenBtn.skin = "yn2016wushenzhanlianBtn";
               this.btnSpr.addChild(this.wushenBtn);
               this.wushenBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.wushenBtn.visible = param1;
         }
         else if(Boolean(this.wushenBtn) && Boolean(this.wushenBtn.parent))
         {
            this.wushenBtn.parent.removeChild(this.wushenBtn);
            this.wushenBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNXianHeZhanGongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXianHeZhanGongBtn == null)
            {
               this.ynXianHeZhanGongBtn = new NewSkinButton();
               this.ynXianHeZhanGongBtn.skin = "ynzgxhBtn";
               this.btnSpr.addChild(this.ynXianHeZhanGongBtn);
               this.ynXianHeZhanGongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXianHeZhanGongBtn.visible = param1;
         }
         else if(Boolean(this.ynXianHeZhanGongBtn) && Boolean(this.ynXianHeZhanGongBtn.parent))
         {
            this.ynXianHeZhanGongBtn.parent.removeChild(this.ynXianHeZhanGongBtn);
            this.ynXianHeZhanGongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYN2016JieFangRiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynJieFangRiBtn == null)
            {
               this.ynJieFangRiBtn = new NewSkinButton();
               this.ynJieFangRiBtn.skin = "ynjiefangBtn";
               this.btnSpr.addChild(this.ynJieFangRiBtn);
               this.ynJieFangRiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynJieFangRiBtn.visible = param1;
         }
         else if(Boolean(this.ynJieFangRiBtn) && Boolean(this.ynJieFangRiBtn.parent))
         {
            this.ynJieFangRiBtn.parent.removeChild(this.ynJieFangRiBtn);
            this.ynJieFangRiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYN2016WuYiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWuYiBtn == null)
            {
               this.ynWuYiBtn = new NewSkinButton();
               this.ynWuYiBtn.skin = "yn2016wuyiBtn";
               this.btnSpr.addChild(this.ynWuYiBtn);
               this.ynWuYiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWuYiBtn.visible = param1;
         }
         else if(Boolean(this.ynWuYiBtn) && Boolean(this.ynWuYiBtn.parent))
         {
            this.ynWuYiBtn.parent.removeChild(this.ynWuYiBtn);
            this.ynWuYiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYN2016YouHuiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynYouHuiBtn == null)
            {
               this.ynYouHuiBtn = new NewSkinButton();
               this.ynYouHuiBtn.skin = "yn2016mtyhBtn";
               this.btnSpr.addChild(this.ynYouHuiBtn);
               this.ynYouHuiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynYouHuiBtn.visible = param1;
         }
         else if(Boolean(this.ynYouHuiBtn) && Boolean(this.ynYouHuiBtn.parent))
         {
            this.ynYouHuiBtn.parent.removeChild(this.ynYouHuiBtn);
            this.ynYouHuiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYN2016519YouHuiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.youhui519Btn == null)
            {
               this.youhui519Btn = new NewSkinButton();
               this.youhui519Btn.skin = "yn2016519youhuiBtn";
               this.btnSpr.addChild(this.youhui519Btn);
               this.youhui519Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.youhui519Btn.visible = param1;
         }
         else if(Boolean(this.youhui519Btn) && Boolean(this.youhui519Btn.parent))
         {
            this.youhui519Btn.parent.removeChild(this.youhui519Btn);
            this.youhui519Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYN2016cjqhVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.cjqhBtn == null)
            {
               this.cjqhBtn = new NewSkinButton();
               this.cjqhBtn.skin = "yn2016chaojiqianghuaBtn";
               this.btnSpr.addChild(this.cjqhBtn);
               this.cjqhBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.cjqhBtn.visible = param1;
         }
         else if(Boolean(this.cjqhBtn) && Boolean(this.cjqhBtn.parent))
         {
            this.cjqhBtn.parent.removeChild(this.cjqhBtn);
            this.cjqhBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYN201661Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn61huodongBtn == null)
            {
               this.yn61huodongBtn = new NewSkinButton();
               this.yn61huodongBtn.skin = "yn61huodongBtn";
               this.btnSpr.addChild(this.yn61huodongBtn);
               this.yn61huodongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn61huodongBtn.visible = param1;
         }
         else if(Boolean(this.yn61huodongBtn) && Boolean(this.yn61huodongBtn.parent))
         {
            this.yn61huodongBtn.parent.removeChild(this.yn61huodongBtn);
            this.yn61huodongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setOZZQ2Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynouzhouzuqiu2Button == null)
            {
               this.ynouzhouzuqiu2Button = new NewSkinButton();
               this.ynouzhouzuqiu2Button.skin = "yn2016zuqiuBtn";
               this.btnSpr.addChild(this.ynouzhouzuqiu2Button);
               this.ynouzhouzuqiu2Button.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynouzhouzuqiu2Button.visible = param1;
         }
         else if(Boolean(this.ynouzhouzuqiu2Button) && Boolean(this.ynouzhouzuqiu2Button.parent))
         {
            this.ynouzhouzuqiu2Button.parent.removeChild(this.ynouzhouzuqiu2Button);
            this.ynouzhouzuqiu2Button = null;
         }
         this.setAnniuPosition();
      }
      
      public function setMiemifengVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynKillBee == null)
            {
               this.ynKillBee = new NewSkinButton();
               this.ynKillBee.skin = "ynmiemifengBtn";
               this.btnSpr.addChild(this.ynKillBee);
               this.ynKillBee.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynKillBee.visible = param1;
         }
         else if(Boolean(this.ynKillBee) && Boolean(this.ynKillBee.parent))
         {
            this.ynKillBee.parent.removeChild(this.ynKillBee);
            this.ynKillBee = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNDuanwujieVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynDuanWuBtn == null)
            {
               this.ynDuanWuBtn = new NewSkinButton();
               this.ynDuanWuBtn.skin = "yn2016duanwuBtn";
               this.btnSpr.addChild(this.ynDuanWuBtn);
               this.ynDuanWuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynDuanWuBtn.visible = param1;
         }
         else if(Boolean(this.ynDuanWuBtn) && Boolean(this.ynDuanWuBtn.parent))
         {
            this.ynDuanWuBtn.parent.removeChild(this.ynDuanWuBtn);
            this.ynDuanWuBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNBifangchushiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynBiFangChuShiBtn == null)
            {
               this.ynBiFangChuShiBtn = new NewSkinButton();
               this.ynBiFangChuShiBtn.skin = "ynbifangBtn";
               this.btnSpr.addChild(this.ynBiFangChuShiBtn);
               this.ynBiFangChuShiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynBiFangChuShiBtn.visible = param1;
         }
         else if(Boolean(this.ynBiFangChuShiBtn) && Boolean(this.ynBiFangChuShiBtn.parent))
         {
            this.ynBiFangChuShiBtn.parent.removeChild(this.ynBiFangChuShiBtn);
            this.ynBiFangChuShiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNMeitianyouhui2Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynYouHui2Btn == null)
            {
               this.ynYouHui2Btn = new NewSkinButton();
               this.ynYouHui2Btn.skin = "yn2016mtyhBtn";
               this.btnSpr.addChild(this.ynYouHui2Btn);
               this.ynYouHui2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynYouHui2Btn.visible = param1;
         }
         else if(Boolean(this.ynYouHui2Btn) && Boolean(this.ynYouHui2Btn.parent))
         {
            this.ynYouHui2Btn.parent.removeChild(this.ynYouHui2Btn);
            this.ynYouHui2Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNSuperStrongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynSuperStrongBtn == null)
            {
               this.ynSuperStrongBtn = new NewSkinButton();
               this.ynSuperStrongBtn.skin = "yn2016chaojiqianghuaBtn";
               this.btnSpr.addChild(this.ynSuperStrongBtn);
               this.ynSuperStrongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynSuperStrongBtn.visible = param1;
         }
         else if(Boolean(this.ynSuperStrongBtn) && Boolean(this.ynSuperStrongBtn.parent))
         {
            this.ynSuperStrongBtn.parent.removeChild(this.ynSuperStrongBtn);
            this.ynSuperStrongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYN2016ZuqiuVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn2016zuqiuBtn == null)
            {
               this.yn2016zuqiuBtn = new NewSkinButton();
               this.yn2016zuqiuBtn.skin = "ynqiumiBtn";
               this.btnSpr.addChild(this.yn2016zuqiuBtn);
               this.yn2016zuqiuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn2016zuqiuBtn.visible = param1;
         }
         else if(Boolean(this.yn2016zuqiuBtn) && Boolean(this.yn2016zuqiuBtn.parent))
         {
            this.yn2016zuqiuBtn.parent.removeChild(this.yn2016zuqiuBtn);
            this.yn2016zuqiuBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNQiseyiseVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynQiseyiseBtn == null)
            {
               this.ynQiseyiseBtn = new NewSkinButton();
               this.ynQiseyiseBtn.skin = "ynqiseyiseBtn";
               this.btnSpr.addChild(this.ynQiseyiseBtn);
               this.ynQiseyiseBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynQiseyiseBtn.visible = param1;
         }
         else if(Boolean(this.ynQiseyiseBtn) && Boolean(this.ynQiseyiseBtn.parent))
         {
            this.ynQiseyiseBtn.parent.removeChild(this.ynQiseyiseBtn);
            this.ynQiseyiseBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNZhienVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhienBtn == null)
            {
               this.ynZhienBtn = new NewSkinButton();
               this.ynZhienBtn.skin = "ynzhienBtn";
               this.btnSpr.addChild(this.ynZhienBtn);
               this.ynZhienBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhienBtn.visible = param1;
         }
         else if(Boolean(this.ynZhienBtn) && Boolean(this.ynZhienBtn.parent))
         {
            this.ynZhienBtn.parent.removeChild(this.ynZhienBtn);
            this.ynZhienBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNZhuilongxueshaVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhuilongxueshaBtn == null)
            {
               this.ynZhuilongxueshaBtn = new NewSkinButton();
               this.ynZhuilongxueshaBtn.skin = "ynzhuilongxueshaBtn";
               this.btnSpr.addChild(this.ynZhuilongxueshaBtn);
               this.ynZhuilongxueshaBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhuilongxueshaBtn.visible = param1;
         }
         else if(Boolean(this.ynZhuilongxueshaBtn) && Boolean(this.ynZhuilongxueshaBtn.parent))
         {
            this.ynZhuilongxueshaBtn.parent.removeChild(this.ynZhuilongxueshaBtn);
            this.ynZhuilongxueshaBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNLongjingzhibaoVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynLongjingzhibaoBtn == null)
            {
               this.ynLongjingzhibaoBtn = new NewSkinButton();
               this.ynLongjingzhibaoBtn.skin = "ynlongjingzhibaoBtn";
               this.btnSpr.addChild(this.ynLongjingzhibaoBtn);
               this.ynLongjingzhibaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynLongjingzhibaoBtn.visible = param1;
         }
         else if(Boolean(this.ynLongjingzhibaoBtn) && Boolean(this.ynLongjingzhibaoBtn.parent))
         {
            this.ynLongjingzhibaoBtn.parent.removeChild(this.ynLongjingzhibaoBtn);
            this.ynLongjingzhibaoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNZhengdouVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhengdouBtn == null)
            {
               this.ynZhengdouBtn = new NewSkinButton();
               this.ynZhengdouBtn.skin = "ynzhengdouBtn";
               this.btnSpr.addChild(this.ynZhengdouBtn);
               this.ynZhengdouBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhengdouBtn.visible = param1;
         }
         else if(Boolean(this.ynZhengdouBtn) && Boolean(this.ynZhengdouBtn.parent))
         {
            this.ynZhengdouBtn.parent.removeChild(this.ynZhengdouBtn);
            this.ynZhengdouBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNWuzhuanghuzhuVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWuzhuanghudouBtn == null)
            {
               this.ynWuzhuanghudouBtn = new NewSkinButton();
               this.ynWuzhuanghudouBtn.skin = "ynwuzhuanghuzhuBtn";
               this.btnSpr.addChild(this.ynWuzhuanghudouBtn);
               this.ynWuzhuanghudouBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWuzhuanghudouBtn.visible = param1;
         }
         else if(Boolean(this.ynWuzhuanghudouBtn) && Boolean(this.ynWuzhuanghudouBtn.parent))
         {
            this.ynWuzhuanghudouBtn.parent.removeChild(this.ynWuzhuanghudouBtn);
            this.ynWuzhuanghudouBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNKaizhanVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynKaizhanBtn == null)
            {
               this.ynKaizhanBtn = new NewSkinButton();
               this.ynKaizhanBtn.skin = "ynkaizhanBtn";
               this.btnSpr.addChild(this.ynKaizhanBtn);
               this.ynKaizhanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynKaizhanBtn.visible = param1;
         }
         else if(Boolean(this.ynKaizhanBtn) && Boolean(this.ynKaizhanBtn.parent))
         {
            this.ynKaizhanBtn.parent.removeChild(this.ynKaizhanBtn);
            this.ynKaizhanBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNWangbangVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWangbangBtn == null)
            {
               this.ynWangbangBtn = new NewSkinButton();
               this.ynWangbangBtn.skin = "ynwangbangBtn";
               this.btnSpr.addChild(this.ynWangbangBtn);
               this.ynWangbangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWangbangBtn.visible = param1;
         }
         else if(Boolean(this.ynWangbangBtn) && Boolean(this.ynWangbangBtn.parent))
         {
            this.ynWangbangBtn.parent.removeChild(this.ynWangbangBtn);
            this.ynWangbangBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNSongmanxinaiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynSongmanxinaiBtn == null)
            {
               this.ynSongmanxinaiBtn = new NewSkinButton();
               this.ynSongmanxinaiBtn.skin = "ynsongmanxinaiBtn";
               this.btnSpr.addChild(this.ynSongmanxinaiBtn);
               this.ynSongmanxinaiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynSongmanxinaiBtn.visible = param1;
         }
         else if(Boolean(this.ynSongmanxinaiBtn) && Boolean(this.ynSongmanxinaiBtn.parent))
         {
            this.ynSongmanxinaiBtn.parent.removeChild(this.ynSongmanxinaiBtn);
            this.ynSongmanxinaiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNXiatiankuaileVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXiatiankuaileBtn == null)
            {
               this.ynXiatiankuaileBtn = new NewSkinButton();
               this.ynXiatiankuaileBtn.skin = "ynxiatiankuaileBtn";
               this.btnSpr.addChild(this.ynXiatiankuaileBtn);
               this.ynXiatiankuaileBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXiatiankuaileBtn.visible = param1;
         }
         else if(Boolean(this.ynXiatiankuaileBtn) && Boolean(this.ynXiatiankuaileBtn.parent))
         {
            this.ynXiatiankuaileBtn.parent.removeChild(this.ynXiatiankuaileBtn);
            this.ynXiatiankuaileBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNXiatiankuaile2Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXiatiankuaile2Btn == null)
            {
               this.ynXiatiankuaile2Btn = new NewSkinButton();
               this.ynXiatiankuaile2Btn.skin = "ynxiatiankuaileBtn";
               this.btnSpr.addChild(this.ynXiatiankuaile2Btn);
               this.ynXiatiankuaile2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXiatiankuaile2Btn.visible = param1;
         }
         else if(Boolean(this.ynXiatiankuaile2Btn) && Boolean(this.ynXiatiankuaile2Btn.parent))
         {
            this.ynXiatiankuaile2Btn.parent.removeChild(this.ynXiatiankuaile2Btn);
            this.ynXiatiankuaile2Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNXiatiankuaile3Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXiatiankuaile3Btn == null)
            {
               this.ynXiatiankuaile3Btn = new NewSkinButton();
               this.ynXiatiankuaile3Btn.skin = "ynxiatiankuaileBtn";
               this.btnSpr.addChild(this.ynXiatiankuaile3Btn);
               this.ynXiatiankuaile3Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXiatiankuaile3Btn.visible = param1;
         }
         else if(Boolean(this.ynXiatiankuaile3Btn) && Boolean(this.ynXiatiankuaile3Btn.parent))
         {
            this.ynXiatiankuaile3Btn.parent.removeChild(this.ynXiatiankuaile3Btn);
            this.ynXiatiankuaile3Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNXiatiankuaile4Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXiatiankuaile4Btn == null)
            {
               this.ynXiatiankuaile4Btn = new NewSkinButton();
               this.ynXiatiankuaile4Btn.skin = "ynxiatiankuaileBtn";
               this.btnSpr.addChild(this.ynXiatiankuaile4Btn);
               this.ynXiatiankuaile4Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXiatiankuaile4Btn.visible = param1;
         }
         else if(Boolean(this.ynXiatiankuaile4Btn) && Boolean(this.ynXiatiankuaile4Btn.parent))
         {
            this.ynXiatiankuaile4Btn.parent.removeChild(this.ynXiatiankuaile4Btn);
            this.ynXiatiankuaile4Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNHuangrugeshiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynHuangrugeshiBtn == null)
            {
               this.ynHuangrugeshiBtn = new NewSkinButton();
               this.ynHuangrugeshiBtn.skin = "ynhuangrugeshiBtn";
               this.btnSpr.addChild(this.ynHuangrugeshiBtn);
               this.ynHuangrugeshiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynHuangrugeshiBtn.visible = param1;
         }
         else if(Boolean(this.ynHuangrugeshiBtn) && Boolean(this.ynHuangrugeshiBtn.parent))
         {
            this.ynHuangrugeshiBtn.parent.removeChild(this.ynHuangrugeshiBtn);
            this.ynHuangrugeshiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNSilingdazhanVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynSilingdazhanBtn == null)
            {
               this.ynSilingdazhanBtn = new NewSkinButton();
               this.ynSilingdazhanBtn.skin = "ynsilingdazhanBtn";
               this.btnSpr.addChild(this.ynSilingdazhanBtn);
               this.ynSilingdazhanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynSilingdazhanBtn.visible = param1;
         }
         else if(Boolean(this.ynSilingdazhanBtn) && Boolean(this.ynSilingdazhanBtn.parent))
         {
            this.ynSilingdazhanBtn.parent.removeChild(this.ynSilingdazhanBtn);
            this.ynSilingdazhanBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNDazaoshenbingVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynDazaoshenbingBtn == null)
            {
               this.ynDazaoshenbingBtn = new NewSkinButton();
               this.ynDazaoshenbingBtn.skin = "yndazaoshenbingBtn";
               this.btnSpr.addChild(this.ynDazaoshenbingBtn);
               this.ynDazaoshenbingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynDazaoshenbingBtn.visible = param1;
         }
         else if(Boolean(this.ynDazaoshenbingBtn) && Boolean(this.ynDazaoshenbingBtn.parent))
         {
            this.ynDazaoshenbingBtn.parent.removeChild(this.ynDazaoshenbingBtn);
            this.ynDazaoshenbingBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNTiandinghunpoVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynTiandinghunpoBtn == null)
            {
               this.ynTiandinghunpoBtn = new NewSkinButton();
               this.ynTiandinghunpoBtn.skin = "yntiandinghunpoBtn";
               this.btnSpr.addChild(this.ynTiandinghunpoBtn);
               this.ynTiandinghunpoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynTiandinghunpoBtn.visible = param1;
         }
         else if(Boolean(this.ynTiandinghunpoBtn) && Boolean(this.ynTiandinghunpoBtn.parent))
         {
            this.ynTiandinghunpoBtn.parent.removeChild(this.ynTiandinghunpoBtn);
            this.ynTiandinghunpoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNLongjinglibaoVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynLongjinglibaoBtn == null)
            {
               this.ynLongjinglibaoBtn = new NewSkinButton();
               this.ynLongjinglibaoBtn.skin = "ynlongjinglibaoBtn";
               this.btnSpr.addChild(this.ynLongjinglibaoBtn);
               this.ynLongjinglibaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynLongjinglibaoBtn.visible = param1;
         }
         else if(Boolean(this.ynLongjinglibaoBtn) && Boolean(this.ynLongjinglibaoBtn.parent))
         {
            this.ynLongjinglibaoBtn.parent.removeChild(this.ynLongjinglibaoBtn);
            this.ynLongjinglibaoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNZongjuesaiduihuanVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZongjuesaiduihuanBtn == null)
            {
               this.ynZongjuesaiduihuanBtn = new NewSkinButton();
               this.ynZongjuesaiduihuanBtn.skin = "ynzongjuesaiduihuanBtn";
               this.btnSpr.addChild(this.ynZongjuesaiduihuanBtn);
               this.ynZongjuesaiduihuanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZongjuesaiduihuanBtn.visible = param1;
         }
         else if(Boolean(this.ynZongjuesaiduihuanBtn) && Boolean(this.ynZongjuesaiduihuanBtn.parent))
         {
            this.ynZongjuesaiduihuanBtn.parent.removeChild(this.ynZongjuesaiduihuanBtn);
            this.ynZongjuesaiduihuanBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNZhouqicailuVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhouqicailuBtn == null)
            {
               this.ynZhouqicailuBtn = new NewSkinButton();
               this.ynZhouqicailuBtn.skin = "ynzhouqicailuBtn";
               this.btnSpr.addChild(this.ynZhouqicailuBtn);
               this.ynZhouqicailuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhouqicailuBtn.visible = param1;
         }
         else if(Boolean(this.ynZhouqicailuBtn) && Boolean(this.ynZhouqicailuBtn.parent))
         {
            this.ynZhouqicailuBtn.parent.removeChild(this.ynZhouqicailuBtn);
            this.ynZhouqicailuBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNGaoshouwushuangVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynGaoshouwushuangBtn == null)
            {
               this.ynGaoshouwushuangBtn = new NewSkinButton();
               this.ynGaoshouwushuangBtn.skin = "yngaoshouwushuangBtn";
               this.btnSpr.addChild(this.ynGaoshouwushuangBtn);
               this.ynGaoshouwushuangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynGaoshouwushuangBtn.visible = param1;
         }
         else if(Boolean(this.ynGaoshouwushuangBtn) && Boolean(this.ynGaoshouwushuangBtn.parent))
         {
            this.ynGaoshouwushuangBtn.parent.removeChild(this.ynGaoshouwushuangBtn);
            this.ynGaoshouwushuangBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNShengzhanshiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynShengzhanshiBtn == null)
            {
               this.ynShengzhanshiBtn = new NewSkinButton();
               this.ynShengzhanshiBtn.skin = "ynshengzhanshiBtn";
               this.btnSpr.addChild(this.ynShengzhanshiBtn);
               this.ynShengzhanshiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynShengzhanshiBtn.visible = param1;
         }
         else if(Boolean(this.ynShengzhanshiBtn) && Boolean(this.ynShengzhanshiBtn.parent))
         {
            this.ynShengzhanshiBtn.parent.removeChild(this.ynShengzhanshiBtn);
            this.ynShengzhanshiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNLiehuoshengxieVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynLiehuoshengxieBtn == null)
            {
               this.ynLiehuoshengxieBtn = new NewSkinButton();
               this.ynLiehuoshengxieBtn.skin = "ynliehuoshengxieBtn";
               this.btnSpr.addChild(this.ynLiehuoshengxieBtn);
               this.ynLiehuoshengxieBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynLiehuoshengxieBtn.visible = param1;
         }
         else if(Boolean(this.ynLiehuoshengxieBtn) && Boolean(this.ynLiehuoshengxieBtn.parent))
         {
            this.ynLiehuoshengxieBtn.parent.removeChild(this.ynLiehuoshengxieBtn);
            this.ynLiehuoshengxieBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNWujuegongfaVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWujuegongfaBtn == null)
            {
               this.ynWujuegongfaBtn = new NewSkinButton();
               this.ynWujuegongfaBtn.skin = "ynwujuegongfaBtn";
               this.btnSpr.addChild(this.ynWujuegongfaBtn);
               this.ynWujuegongfaBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWujuegongfaBtn.visible = param1;
         }
         else if(Boolean(this.ynWujuegongfaBtn) && Boolean(this.ynWujuegongfaBtn.parent))
         {
            this.ynWujuegongfaBtn.parent.removeChild(this.ynWujuegongfaBtn);
            this.ynWujuegongfaBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNShenmiliwuVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynShenmiliwuBtn == null)
            {
               this.ynShenmiliwuBtn = new NewSkinButton();
               this.ynShenmiliwuBtn.skin = "ynshenmiliwuBtn";
               this.btnSpr.addChild(this.ynShenmiliwuBtn);
               this.ynShenmiliwuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynShenmiliwuBtn.visible = param1;
         }
         else if(Boolean(this.ynShenmiliwuBtn) && Boolean(this.ynShenmiliwuBtn.parent))
         {
            this.ynShenmiliwuBtn.parent.removeChild(this.ynShenmiliwuBtn);
            this.ynShenmiliwuBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNhunqianmengVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.hunqianmengrao == null)
            {
               this.hunqianmengrao = new NewSkinButton();
               this.hunqianmengrao.skin = "hunqianmengrao";
               this.btnSpr.addChild(this.hunqianmengrao);
               this.hunqianmengrao.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.hunqianmengrao.visible = param1;
         }
         else if(Boolean(this.hunqianmengrao) && Boolean(this.hunqianmengrao.parent))
         {
            this.hunqianmengrao.parent.removeChild(this.hunqianmengrao);
            this.hunqianmengrao = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNlexinchujiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.lexinchuji == null)
            {
               this.lexinchuji = new NewSkinButton();
               this.lexinchuji.skin = "lexinchuji";
               this.btnSpr.addChild(this.lexinchuji);
               this.lexinchuji.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.lexinchuji.visible = param1;
         }
         else if(Boolean(this.lexinchuji) && Boolean(this.lexinchuji.parent))
         {
            this.lexinchuji.parent.removeChild(this.lexinchuji);
            this.lexinchuji = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNZhouyihuodongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhouyihuodongBtn == null)
            {
               this.ynZhouyihuodongBtn = new NewSkinButton();
               this.ynZhouyihuodongBtn.skin = "yn2016Zhouyihuodong";
               this.btnSpr.addChild(this.ynZhouyihuodongBtn);
               this.ynZhouyihuodongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhouyihuodongBtn.visible = param1;
         }
         else if(Boolean(this.ynZhouyihuodongBtn) && Boolean(this.ynZhouyihuodongBtn.parent))
         {
            this.ynZhouyihuodongBtn.parent.removeChild(this.ynZhouyihuodongBtn);
            this.ynZhouyihuodongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNZhouerhuodongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhouerhuodongBtn == null)
            {
               this.ynZhouerhuodongBtn = new NewSkinButton();
               this.ynZhouerhuodongBtn.skin = "yn2016zhouerhuodong";
               this.btnSpr.addChild(this.ynZhouerhuodongBtn);
               this.ynZhouerhuodongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhouerhuodongBtn.visible = param1;
         }
         else if(Boolean(this.ynZhouerhuodongBtn) && Boolean(this.ynZhouerhuodongBtn.parent))
         {
            this.ynZhouerhuodongBtn.parent.removeChild(this.ynZhouerhuodongBtn);
            this.ynZhouerhuodongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNZhouerhuodong2Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhouerhuodong2Btn == null)
            {
               this.ynZhouerhuodong2Btn = new NewSkinButton();
               this.ynZhouerhuodong2Btn.skin = "yn2016zhouerhuodong";
               this.btnSpr.addChild(this.ynZhouerhuodong2Btn);
               this.ynZhouerhuodong2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhouerhuodong2Btn.visible = param1;
         }
         else if(Boolean(this.ynZhouerhuodong2Btn) && Boolean(this.ynZhouerhuodong2Btn.parent))
         {
            this.ynZhouerhuodong2Btn.parent.removeChild(this.ynZhouerhuodong2Btn);
            this.ynZhouerhuodong2Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNZhousanhuodongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhousanhuodongBtn == null)
            {
               this.ynZhousanhuodongBtn = new NewSkinButton();
               this.ynZhousanhuodongBtn.skin = "yn2016zhousanhuodong";
               this.btnSpr.addChild(this.ynZhousanhuodongBtn);
               this.ynZhousanhuodongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhousanhuodongBtn.visible = param1;
         }
         else if(Boolean(this.ynZhousanhuodongBtn) && Boolean(this.ynZhousanhuodongBtn.parent))
         {
            this.ynZhousanhuodongBtn.parent.removeChild(this.ynZhousanhuodongBtn);
            this.ynZhousanhuodongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNZhousihuodongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhousihuodongBtn == null)
            {
               this.ynZhousihuodongBtn = new NewSkinButton();
               this.ynZhousihuodongBtn.skin = "yn2016zhousihuodong";
               this.btnSpr.addChild(this.ynZhousihuodongBtn);
               this.ynZhousihuodongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhousihuodongBtn.visible = param1;
         }
         else if(Boolean(this.ynZhousihuodongBtn) && Boolean(this.ynZhousihuodongBtn.parent))
         {
            this.ynZhousihuodongBtn.parent.removeChild(this.ynZhousihuodongBtn);
            this.ynZhousihuodongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNzhouwuhuodongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhouwuhuodongBtn == null)
            {
               this.ynZhouwuhuodongBtn = new NewSkinButton();
               this.ynZhouwuhuodongBtn.skin = "yn2016zhouwuhuodong";
               this.btnSpr.addChild(this.ynZhouwuhuodongBtn);
               this.ynZhouwuhuodongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhouwuhuodongBtn.visible = param1;
         }
         else if(Boolean(this.ynZhouwuhuodongBtn) && Boolean(this.ynZhouwuhuodongBtn.parent))
         {
            this.ynZhouwuhuodongBtn.parent.removeChild(this.ynZhouwuhuodongBtn);
            this.ynZhouwuhuodongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNZhouliuhuodongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhouliuhuodongBtn == null)
            {
               this.ynZhouliuhuodongBtn = new NewSkinButton();
               this.ynZhouliuhuodongBtn.skin = "yn2016zhouliuhuodong";
               this.btnSpr.addChild(this.ynZhouliuhuodongBtn);
               this.ynZhouliuhuodongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhouliuhuodongBtn.visible = param1;
         }
         else if(Boolean(this.ynZhouliuhuodongBtn) && Boolean(this.ynZhouliuhuodongBtn.parent))
         {
            this.ynZhouliuhuodongBtn.parent.removeChild(this.ynZhouliuhuodongBtn);
            this.ynZhouliuhuodongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNZhourihuodongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhourihuodongBtn == null)
            {
               this.ynZhourihuodongBtn = new NewSkinButton();
               this.ynZhourihuodongBtn.skin = "yn2016zhourihuodong";
               this.btnSpr.addChild(this.ynZhourihuodongBtn);
               this.ynZhourihuodongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhourihuodongBtn.visible = param1;
         }
         else if(Boolean(this.ynZhourihuodongBtn) && Boolean(this.ynZhourihuodongBtn.parent))
         {
            this.ynZhourihuodongBtn.parent.removeChild(this.ynZhourihuodongBtn);
            this.ynZhourihuodongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNmeiriyouhui3Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynMeirihuodong3Btn == null)
            {
               this.ynMeirihuodong3Btn = new NewSkinButton();
               this.ynMeirihuodong3Btn.skin = "yn2016mtyhBtn";
               this.btnSpr.addChild(this.ynMeirihuodong3Btn);
               this.ynMeirihuodong3Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynMeirihuodong3Btn.visible = param1;
         }
         else if(Boolean(this.ynMeirihuodong3Btn) && Boolean(this.ynMeirihuodong3Btn.parent))
         {
            this.ynMeirihuodong3Btn.parent.removeChild(this.ynMeirihuodong3Btn);
            this.ynMeirihuodong3Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNyulanhejieVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynYulanhejieBtn == null)
            {
               this.ynYulanhejieBtn = new NewSkinButton();
               this.ynYulanhejieBtn.skin = "yn2016yulanpenjie";
               this.btnSpr.addChild(this.ynYulanhejieBtn);
               this.ynYulanhejieBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynYulanhejieBtn.visible = param1;
         }
         else if(Boolean(this.ynYulanhejieBtn) && Boolean(this.ynYulanhejieBtn.parent))
         {
            this.ynYulanhejieBtn.parent.removeChild(this.ynYulanhejieBtn);
            this.ynYulanhejieBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNJingsuidongxiaVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynJingsuidongxiaBtn == null)
            {
               this.ynJingsuidongxiaBtn = new NewSkinButton();
               this.ynJingsuidongxiaBtn.skin = "ynjingsuidongxia";
               this.btnSpr.addChild(this.ynJingsuidongxiaBtn);
               this.ynJingsuidongxiaBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynJingsuidongxiaBtn.visible = param1;
         }
         else if(Boolean(this.ynJingsuidongxiaBtn) && Boolean(this.ynJingsuidongxiaBtn.parent))
         {
            this.ynJingsuidongxiaBtn.parent.removeChild(this.ynJingsuidongxiaBtn);
            this.ynJingsuidongxiaBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNKaizhenyuanVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynKaizhenyuanBtn == null)
            {
               this.ynKaizhenyuanBtn = new NewSkinButton();
               this.ynKaizhenyuanBtn.skin = "ynkaizhenyuan";
               this.btnSpr.addChild(this.ynKaizhenyuanBtn);
               this.ynKaizhenyuanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynKaizhenyuanBtn.visible = param1;
         }
         else if(Boolean(this.ynKaizhenyuanBtn) && Boolean(this.ynKaizhenyuanBtn.parent))
         {
            this.ynKaizhenyuanBtn.parent.removeChild(this.ynKaizhenyuanBtn);
            this.ynKaizhenyuanBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNKaizhenyuan3Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynKaizhenyuan3Btn == null)
            {
               this.ynKaizhenyuan3Btn = new NewSkinButton();
               this.ynKaizhenyuan3Btn.skin = "ynkaizhenyuan";
               this.btnSpr.addChild(this.ynKaizhenyuan3Btn);
               this.ynKaizhenyuan3Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynKaizhenyuan3Btn.visible = param1;
         }
         else if(Boolean(this.ynKaizhenyuan3Btn) && Boolean(this.ynKaizhenyuan3Btn.parent))
         {
            this.ynKaizhenyuan3Btn.parent.removeChild(this.ynKaizhenyuan3Btn);
            this.ynKaizhenyuan3Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNQiziquanzhenjiaoVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynQiziquanzhenjiaoBtn == null)
            {
               this.ynQiziquanzhenjiaoBtn = new NewSkinButton();
               this.ynQiziquanzhenjiaoBtn.skin = "ynqiziquanzhenjiao";
               this.btnSpr.addChild(this.ynQiziquanzhenjiaoBtn);
               this.ynQiziquanzhenjiaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynQiziquanzhenjiaoBtn.visible = param1;
         }
         else if(Boolean(this.ynQiziquanzhenjiaoBtn) && Boolean(this.ynQiziquanzhenjiaoBtn.parent))
         {
            this.ynQiziquanzhenjiaoBtn.parent.removeChild(this.ynQiziquanzhenjiaoBtn);
            this.ynQiziquanzhenjiaoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNBayuediVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynBayuediBtn == null)
            {
               this.ynBayuediBtn = new NewSkinButton();
               this.ynBayuediBtn.skin = "ynbayuedi";
               this.btnSpr.addChild(this.ynBayuediBtn);
               this.ynBayuediBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynBayuediBtn.visible = param1;
         }
         else if(Boolean(this.ynBayuediBtn) && Boolean(this.ynBayuediBtn.parent))
         {
            this.ynBayuediBtn.parent.removeChild(this.ynBayuediBtn);
            this.ynBayuediBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNQijianyingxiongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynQijianyingxiongBtn == null)
            {
               this.ynQijianyingxiongBtn = new NewSkinButton();
               this.ynQijianyingxiongBtn.skin = "ynqijianyingxiong";
               this.btnSpr.addChild(this.ynQijianyingxiongBtn);
               this.ynQijianyingxiongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynQijianyingxiongBtn.visible = param1;
         }
         else if(Boolean(this.ynQijianyingxiongBtn) && Boolean(this.ynQijianyingxiongBtn.parent))
         {
            this.ynQijianyingxiongBtn.parent.removeChild(this.ynQijianyingxiongBtn);
            this.ynQijianyingxiongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNGuoqinghuodongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynGuoqinghuodongBtn == null)
            {
               this.ynGuoqinghuodongBtn = new NewSkinButton();
               this.ynGuoqinghuodongBtn.skin = "ynguoqinghuodong";
               this.btnSpr.addChild(this.ynGuoqinghuodongBtn);
               this.ynGuoqinghuodongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynGuoqinghuodongBtn.visible = param1;
         }
         else if(Boolean(this.ynGuoqinghuodongBtn) && Boolean(this.ynGuoqinghuodongBtn.parent))
         {
            this.ynGuoqinghuodongBtn.parent.removeChild(this.ynGuoqinghuodongBtn);
            this.ynGuoqinghuodongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNPaihangbangVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynPaihangbangBtn == null)
            {
               this.ynPaihangbangBtn = new NewSkinButton();
               this.ynPaihangbangBtn.skin = "ynpaihangbang";
               this.btnSpr.addChild(this.ynPaihangbangBtn);
               this.ynPaihangbangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynPaihangbangBtn.visible = param1;
         }
         else if(Boolean(this.ynPaihangbangBtn) && Boolean(this.ynPaihangbangBtn.parent))
         {
            this.ynPaihangbangBtn.parent.removeChild(this.ynPaihangbangBtn);
            this.ynPaihangbangBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNYingxiongshijianVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynYingxiongshijianBtn == null)
            {
               this.ynYingxiongshijianBtn = new NewSkinButton();
               this.ynYingxiongshijianBtn.skin = "ynyingxiongshijian";
               this.btnSpr.addChild(this.ynYingxiongshijianBtn);
               this.ynYingxiongshijianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynYingxiongshijianBtn.visible = param1;
         }
         else if(Boolean(this.ynYingxiongshijianBtn) && Boolean(this.ynYingxiongshijianBtn.parent))
         {
            this.ynYingxiongshijianBtn.parent.removeChild(this.ynYingxiongshijianBtn);
            this.ynYingxiongshijianBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNChongjiuzhiyangVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynChongjiuzhiyangBtn == null)
            {
               this.ynChongjiuzhiyangBtn = new NewSkinButton();
               this.ynChongjiuzhiyangBtn.skin = "ynchongjiuzhiyang";
               this.btnSpr.addChild(this.ynChongjiuzhiyangBtn);
               this.ynChongjiuzhiyangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynChongjiuzhiyangBtn.visible = param1;
         }
         else if(Boolean(this.ynChongjiuzhiyangBtn) && Boolean(this.ynChongjiuzhiyangBtn.parent))
         {
            this.ynChongjiuzhiyangBtn.parent.removeChild(this.ynChongjiuzhiyangBtn);
            this.ynChongjiuzhiyangBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNYuelungujiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynYuelungujiBtn == null)
            {
               this.ynYuelungujiBtn = new NewSkinButton();
               this.ynYuelungujiBtn.skin = "ynyuelunguji";
               this.btnSpr.addChild(this.ynYuelungujiBtn);
               this.ynYuelungujiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynYuelungujiBtn.visible = param1;
         }
         else if(Boolean(this.ynYuelungujiBtn) && Boolean(this.ynYuelungujiBtn.parent))
         {
            this.ynYuelungujiBtn.parent.removeChild(this.ynYuelungujiBtn);
            this.ynYuelungujiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNXiangyangyueseVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXiangyangyueseBtn == null)
            {
               this.ynXiangyangyueseBtn = new NewSkinButton();
               this.ynXiangyangyueseBtn.skin = "ynxiangyangyuese";
               this.btnSpr.addChild(this.ynXiangyangyueseBtn);
               this.ynXiangyangyueseBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXiangyangyueseBtn.visible = param1;
         }
         else if(Boolean(this.ynXiangyangyueseBtn) && Boolean(this.ynXiangyangyueseBtn.parent))
         {
            this.ynXiangyangyueseBtn.parent.removeChild(this.ynXiangyangyueseBtn);
            this.ynXiangyangyueseBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNQunyingquhuiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynQunyingquhuiBtn == null)
            {
               this.ynQunyingquhuiBtn = new NewSkinButton();
               this.ynQunyingquhuiBtn.skin = "ynqunyingquhui";
               this.btnSpr.addChild(this.ynQunyingquhuiBtn);
               this.ynQunyingquhuiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynQunyingquhuiBtn.visible = param1;
         }
         else if(Boolean(this.ynQunyingquhuiBtn) && Boolean(this.ynQunyingquhuiBtn.parent))
         {
            this.ynQunyingquhuiBtn.parent.removeChild(this.ynQunyingquhuiBtn);
            this.ynQunyingquhuiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNWushenVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWushenBtn == null)
            {
               this.ynWushenBtn = new NewSkinButton();
               this.ynWushenBtn.skin = "ynwushen";
               this.btnSpr.addChild(this.ynWushenBtn);
               this.ynWushenBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWushenBtn.visible = param1;
         }
         else if(Boolean(this.ynWushenBtn) && Boolean(this.ynWushenBtn.parent))
         {
            this.ynWushenBtn.parent.removeChild(this.ynWushenBtn);
            this.ynWushenBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNWushen2Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWushen2Btn == null)
            {
               this.ynWushen2Btn = new NewSkinButton();
               this.ynWushen2Btn.skin = "ynwushen";
               this.btnSpr.addChild(this.ynWushen2Btn);
               this.ynWushen2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWushen2Btn.visible = param1;
         }
         else if(Boolean(this.ynWushen2Btn) && Boolean(this.ynWushen2Btn.parent))
         {
            this.ynWushen2Btn.parent.removeChild(this.ynWushen2Btn);
            this.ynWushen2Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNXichuanhongmianbaihuapaoVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXichuanhongmianbaihuapaoBtn == null)
            {
               this.ynXichuanhongmianbaihuapaoBtn = new NewSkinButton();
               this.ynXichuanhongmianbaihuapaoBtn.skin = "ynxichuanhongmianbaihuapao";
               this.btnSpr.addChild(this.ynXichuanhongmianbaihuapaoBtn);
               this.ynXichuanhongmianbaihuapaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXichuanhongmianbaihuapaoBtn.visible = param1;
         }
         else if(Boolean(this.ynXichuanhongmianbaihuapaoBtn) && Boolean(this.ynXichuanhongmianbaihuapaoBtn.parent))
         {
            this.ynXichuanhongmianbaihuapaoBtn.parent.removeChild(this.ynXichuanhongmianbaihuapaoBtn);
            this.ynXichuanhongmianbaihuapaoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNShenmilibaoVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynShenmilibaoBtn == null)
            {
               this.ynShenmilibaoBtn = new NewSkinButton();
               this.ynShenmilibaoBtn.skin = "ynshenmilibao";
               this.btnSpr.addChild(this.ynShenmilibaoBtn);
               this.ynShenmilibaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynShenmilibaoBtn.visible = param1;
         }
         else if(Boolean(this.ynShenmilibaoBtn) && Boolean(this.ynShenmilibaoBtn.parent))
         {
            this.ynShenmilibaoBtn.parent.removeChild(this.ynShenmilibaoBtn);
            this.ynShenmilibaoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNKaizhenyuan2Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynKaizhenyuan2Btn == null)
            {
               this.ynKaizhenyuan2Btn = new NewSkinButton();
               this.ynKaizhenyuan2Btn.skin = "ynkaizhenyuan";
               this.btnSpr.addChild(this.ynKaizhenyuan2Btn);
               this.ynKaizhenyuan2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynKaizhenyuan2Btn.visible = param1;
         }
         else if(Boolean(this.ynKaizhenyuan2Btn) && Boolean(this.ynKaizhenyuan2Btn.parent))
         {
            this.ynKaizhenyuan2Btn.parent.removeChild(this.ynKaizhenyuan2Btn);
            this.ynKaizhenyuan2Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNWangzhezhengxiongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWangzhezhengxiongBtn == null)
            {
               this.ynWangzhezhengxiongBtn = new NewSkinButton();
               this.ynWangzhezhengxiongBtn.skin = "ynwangzhezhengxiong";
               this.btnSpr.addChild(this.ynWangzhezhengxiongBtn);
               this.ynWangzhezhengxiongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWangzhezhengxiongBtn.visible = param1;
         }
         else if(Boolean(this.ynWangzhezhengxiongBtn) && Boolean(this.ynWangzhezhengxiongBtn.parent))
         {
            this.ynWangzhezhengxiongBtn.parent.removeChild(this.ynWangzhezhengxiongBtn);
            this.ynWangzhezhengxiongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNZhongjizuoqishendanVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhongjizuoqishendanBtn == null)
            {
               this.ynZhongjizuoqishendanBtn = new NewSkinButton();
               this.ynZhongjizuoqishendanBtn.skin = "ynzhongjizuoqishendan";
               this.btnSpr.addChild(this.ynZhongjizuoqishendanBtn);
               this.ynZhongjizuoqishendanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhongjizuoqishendanBtn.visible = param1;
         }
         else if(Boolean(this.ynZhongjizuoqishendanBtn) && Boolean(this.ynZhongjizuoqishendanBtn.parent))
         {
            this.ynZhongjizuoqishendanBtn.parent.removeChild(this.ynZhongjizuoqishendanBtn);
            this.ynZhongjizuoqishendanBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNZhongjizuoqishendan2Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhongjizuoqishendan2Btn == null)
            {
               this.ynZhongjizuoqishendan2Btn = new NewSkinButton();
               this.ynZhongjizuoqishendan2Btn.skin = "ynzhongjizuoqishendan";
               this.btnSpr.addChild(this.ynZhongjizuoqishendan2Btn);
               this.ynZhongjizuoqishendan2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhongjizuoqishendan2Btn.visible = param1;
         }
         else if(Boolean(this.ynZhongjizuoqishendan2Btn) && Boolean(this.ynZhongjizuoqishendan2Btn.parent))
         {
            this.ynZhongjizuoqishendan2Btn.parent.removeChild(this.ynZhongjizuoqishendan2Btn);
            this.ynZhongjizuoqishendan2Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNZuoqipeichangVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZuoqipeichangBtn == null)
            {
               this.ynZuoqipeichangBtn = new NewSkinButton();
               this.ynZuoqipeichangBtn.skin = "ynzuoqipeichang";
               this.btnSpr.addChild(this.ynZuoqipeichangBtn);
               this.ynZuoqipeichangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZuoqipeichangBtn.visible = param1;
         }
         else if(Boolean(this.ynZuoqipeichangBtn) && Boolean(this.ynZuoqipeichangBtn.parent))
         {
            this.ynZuoqipeichangBtn.parent.removeChild(this.ynZuoqipeichangBtn);
            this.ynZuoqipeichangBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNWangbangchuzhanVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWangbangchuzhanBtn == null)
            {
               this.ynWangbangchuzhanBtn = new NewSkinButton();
               this.ynWangbangchuzhanBtn.skin = "ynwangbangchuzhan";
               this.btnSpr.addChild(this.ynWangbangchuzhanBtn);
               this.ynWangbangchuzhanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWangbangchuzhanBtn.visible = param1;
         }
         else if(Boolean(this.ynWangbangchuzhanBtn) && Boolean(this.ynWangbangchuzhanBtn.parent))
         {
            this.ynWangbangchuzhanBtn.parent.removeChild(this.ynWangbangchuzhanBtn);
            this.ynWangbangchuzhanBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNXianglongjingVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXianglongjingBtn == null)
            {
               this.ynXianglongjingBtn = new NewSkinButton();
               this.ynXianglongjingBtn.skin = "ynxianglongjing";
               this.btnSpr.addChild(this.ynXianglongjingBtn);
               this.ynXianglongjingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXianglongjingBtn.visible = param1;
         }
         else if(Boolean(this.ynXianglongjingBtn) && Boolean(this.ynXianglongjingBtn.parent))
         {
            this.ynXianglongjingBtn.parent.removeChild(this.ynXianglongjingBtn);
            this.ynXianglongjingBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNWeixilibaoVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWeixilibaoBtn == null)
            {
               this.ynWeixilibaoBtn = new NewSkinButton();
               this.ynWeixilibaoBtn.skin = "ynweixilibao";
               this.btnSpr.addChild(this.ynWeixilibaoBtn);
               this.ynWeixilibaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWeixilibaoBtn.visible = param1;
         }
         else if(Boolean(this.ynWeixilibaoBtn) && Boolean(this.ynWeixilibaoBtn.parent))
         {
            this.ynWeixilibaoBtn.parent.removeChild(this.ynWeixilibaoBtn);
            this.ynWeixilibaoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNJiuyuediVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynJiuyuediBtn == null)
            {
               this.ynJiuyuediBtn = new NewSkinButton();
               this.ynJiuyuediBtn.skin = "ynjiuyuedi";
               this.btnSpr.addChild(this.ynJiuyuediBtn);
               this.ynJiuyuediBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynJiuyuediBtn.visible = param1;
         }
         else if(Boolean(this.ynJiuyuediBtn) && Boolean(this.ynJiuyuediBtn.parent))
         {
            this.ynJiuyuediBtn.parent.removeChild(this.ynJiuyuediBtn);
            this.ynJiuyuediBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNQiongjinzhanyiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynQiongjinzhanyiBtn == null)
            {
               this.ynQiongjinzhanyiBtn = new NewSkinButton();
               this.ynQiongjinzhanyiBtn.skin = "ynqiongjinzhanyi";
               this.btnSpr.addChild(this.ynQiongjinzhanyiBtn);
               this.ynQiongjinzhanyiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynQiongjinzhanyiBtn.visible = param1;
         }
         else if(Boolean(this.ynQiongjinzhanyiBtn) && Boolean(this.ynQiongjinzhanyiBtn.parent))
         {
            this.ynQiongjinzhanyiBtn.parent.removeChild(this.ynQiongjinzhanyiBtn);
            this.ynQiongjinzhanyiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNFanliVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynFanliBtn == null)
            {
               this.ynFanliBtn = new NewSkinButton();
               this.ynFanliBtn.skin = "ynfanli";
               this.btnSpr.addChild(this.ynFanliBtn);
               this.ynFanliBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynFanliBtn.visible = param1;
         }
         else if(Boolean(this.ynFanliBtn) && Boolean(this.ynFanliBtn.parent))
         {
            this.ynFanliBtn.parent.removeChild(this.ynFanliBtn);
            this.ynFanliBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNFuqitongxinVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynFuqitongxinBtn == null)
            {
               this.ynFuqitongxinBtn = new NewSkinButton();
               this.ynFuqitongxinBtn.skin = "ynfuqitongxin";
               this.btnSpr.addChild(this.ynFuqitongxinBtn);
               this.ynFuqitongxinBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynFuqitongxinBtn.visible = param1;
         }
         else if(Boolean(this.ynFuqitongxinBtn) && Boolean(this.ynFuqitongxinBtn.parent))
         {
            this.ynFuqitongxinBtn.parent.removeChild(this.ynFuqitongxinBtn);
            this.ynFuqitongxinBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNSilongtianzhuaVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynSilongtianzhuaBtn == null)
            {
               this.ynSilongtianzhuaBtn = new NewSkinButton();
               this.ynSilongtianzhuaBtn.skin = "ynsilongtianzhua";
               this.btnSpr.addChild(this.ynSilongtianzhuaBtn);
               this.ynSilongtianzhuaBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynSilongtianzhuaBtn.visible = param1;
         }
         else if(Boolean(this.ynSilongtianzhuaBtn) && Boolean(this.ynSilongtianzhuaBtn.parent))
         {
            this.ynSilongtianzhuaBtn.parent.removeChild(this.ynSilongtianzhuaBtn);
            this.ynSilongtianzhuaBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNWuseduohuaVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWuseduohuaBtn == null)
            {
               this.ynWuseduohuaBtn = new NewSkinButton();
               this.ynWuseduohuaBtn.skin = "ynwuseduohua";
               this.btnSpr.addChild(this.ynWuseduohuaBtn);
               this.ynWuseduohuaBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWuseduohuaBtn.visible = param1;
         }
         else if(Boolean(this.ynWuseduohuaBtn) && Boolean(this.ynWuseduohuaBtn.parent))
         {
            this.ynWuseduohuaBtn.parent.removeChild(this.ynWuseduohuaBtn);
            this.ynWuseduohuaBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNYuenanfunvjieVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynYuenanfunvjieBtn == null)
            {
               this.ynYuenanfunvjieBtn = new NewSkinButton();
               this.ynYuenanfunvjieBtn.skin = "ynyuenanfunvjie";
               this.btnSpr.addChild(this.ynYuenanfunvjieBtn);
               this.ynYuenanfunvjieBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynYuenanfunvjieBtn.visible = param1;
         }
         else if(Boolean(this.ynYuenanfunvjieBtn) && Boolean(this.ynYuenanfunvjieBtn.parent))
         {
            this.ynYuenanfunvjieBtn.parent.removeChild(this.ynYuenanfunvjieBtn);
            this.ynYuenanfunvjieBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNLonghunVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynLonghunBtn == null)
            {
               this.ynLonghunBtn = new NewSkinButton();
               this.ynLonghunBtn.skin = "ynlonghun";
               this.btnSpr.addChild(this.ynLonghunBtn);
               this.ynLonghunBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynLonghunBtn.visible = param1;
         }
         else if(Boolean(this.ynLonghunBtn) && Boolean(this.ynLonghunBtn.parent))
         {
            this.ynLonghunBtn.parent.removeChild(this.ynLonghunBtn);
            this.ynLonghunBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNLonghun2Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynLonghun2Btn == null)
            {
               this.ynLonghun2Btn = new NewSkinButton();
               this.ynLonghun2Btn.skin = "ynlonghun";
               this.btnSpr.addChild(this.ynLonghun2Btn);
               this.ynLonghun2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynLonghun2Btn.visible = param1;
         }
         else if(Boolean(this.ynLonghun2Btn) && Boolean(this.ynLonghun2Btn.parent))
         {
            this.ynLonghun2Btn.parent.removeChild(this.ynLonghun2Btn);
            this.ynLonghun2Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNLonghun3Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynLonghun3Btn == null)
            {
               this.ynLonghun3Btn = new NewSkinButton();
               this.ynLonghun3Btn.skin = "ynlonghun";
               this.btnSpr.addChild(this.ynLonghun3Btn);
               this.ynLonghun3Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynLonghun3Btn.visible = param1;
         }
         else if(Boolean(this.ynLonghun3Btn) && Boolean(this.ynLonghun3Btn.parent))
         {
            this.ynLonghun3Btn.parent.removeChild(this.ynLonghun3Btn);
            this.ynLonghun3Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNZhanjipiaodangVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhanjipiaodangBtn == null)
            {
               this.ynZhanjipiaodangBtn = new NewSkinButton();
               this.ynZhanjipiaodangBtn.skin = "ynzhanjipiaodang";
               this.btnSpr.addChild(this.ynZhanjipiaodangBtn);
               this.ynZhanjipiaodangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhanjipiaodangBtn.visible = param1;
         }
         else if(Boolean(this.ynZhanjipiaodangBtn) && Boolean(this.ynZhanjipiaodangBtn.parent))
         {
            this.ynZhanjipiaodangBtn.parent.removeChild(this.ynZhanjipiaodangBtn);
            this.ynZhanjipiaodangBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNAojianwunianVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynAojianwunianBtn == null)
            {
               this.ynAojianwunianBtn = new NewSkinButton();
               this.ynAojianwunianBtn.skin = "ynaojianwunian";
               this.btnSpr.addChild(this.ynAojianwunianBtn);
               this.ynAojianwunianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynAojianwunianBtn.visible = param1;
         }
         else if(Boolean(this.ynAojianwunianBtn) && Boolean(this.ynAojianwunianBtn.parent))
         {
            this.ynAojianwunianBtn.parent.removeChild(this.ynAojianwunianBtn);
            this.ynAojianwunianBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNTianmajianVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynTianmajianBtn == null)
            {
               this.ynTianmajianBtn = new NewSkinButton();
               this.ynTianmajianBtn.skin = "yntianmajian";
               this.btnSpr.addChild(this.ynTianmajianBtn);
               this.ynTianmajianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynTianmajianBtn.visible = param1;
         }
         else if(Boolean(this.ynTianmajianBtn) && Boolean(this.ynTianmajianBtn.parent))
         {
            this.ynTianmajianBtn.parent.removeChild(this.ynTianmajianBtn);
            this.ynTianmajianBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNWunianzhimengVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWunianzhimengBtn == null)
            {
               this.ynWunianzhimengBtn = new NewSkinButton();
               this.ynWunianzhimengBtn.skin = "ynwunianzhimeng";
               this.btnSpr.addChild(this.ynWunianzhimengBtn);
               this.ynWunianzhimengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWunianzhimengBtn.visible = param1;
         }
         else if(Boolean(this.ynWunianzhimengBtn) && Boolean(this.ynWunianzhimengBtn.parent))
         {
            this.ynWunianzhimengBtn.parent.removeChild(this.ynWunianzhimengBtn);
            this.ynWunianzhimengBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNWunianzhienVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWunianzhienBtn == null)
            {
               this.ynWunianzhienBtn = new NewSkinButton();
               this.ynWunianzhienBtn.skin = "ynwunianzhien";
               this.btnSpr.addChild(this.ynWunianzhienBtn);
               this.ynWunianzhienBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWunianzhienBtn.visible = param1;
         }
         else if(Boolean(this.ynWunianzhienBtn) && Boolean(this.ynWunianzhienBtn.parent))
         {
            this.ynWunianzhienBtn.parent.removeChild(this.ynWunianzhienBtn);
            this.ynWunianzhienBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNTianmidangaoVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynTianmidangaoBtn == null)
            {
               this.ynTianmidangaoBtn = new NewSkinButton();
               this.ynTianmidangaoBtn.skin = "yntianmidangao";
               this.btnSpr.addChild(this.ynTianmidangaoBtn);
               this.ynTianmidangaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynTianmidangaoBtn.visible = param1;
         }
         else if(Boolean(this.ynTianmidangaoBtn) && Boolean(this.ynTianmidangaoBtn.parent))
         {
            this.ynTianmidangaoBtn.parent.removeChild(this.ynTianmidangaoBtn);
            this.ynTianmidangaoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNShengrizhoujiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynShengrizhoujiBtn == null)
            {
               this.ynShengrizhoujiBtn = new NewSkinButton();
               this.ynShengrizhoujiBtn.skin = "ynshengrizhouji";
               this.btnSpr.addChild(this.ynShengrizhoujiBtn);
               this.ynShengrizhoujiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynShengrizhoujiBtn.visible = param1;
         }
         else if(Boolean(this.ynShengrizhoujiBtn) && Boolean(this.ynShengrizhoujiBtn.parent))
         {
            this.ynShengrizhoujiBtn.parent.removeChild(this.ynShengrizhoujiBtn);
            this.ynShengrizhoujiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNWujinkuaileVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWujinkuaileBtn == null)
            {
               this.ynWujinkuaileBtn = new NewSkinButton();
               this.ynWujinkuaileBtn.skin = "ynwujinkuaile";
               this.btnSpr.addChild(this.ynWujinkuaileBtn);
               this.ynWujinkuaileBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWujinkuaileBtn.visible = param1;
         }
         else if(Boolean(this.ynWujinkuaileBtn) && Boolean(this.ynWujinkuaileBtn.parent))
         {
            this.ynWujinkuaileBtn.parent.removeChild(this.ynWujinkuaileBtn);
            this.ynWujinkuaileBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNBaguaiwushendunVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynBaguaiwushendunBtn == null)
            {
               this.ynBaguaiwushendunBtn = new NewSkinButton();
               this.ynBaguaiwushendunBtn.skin = "ynbaguaiwushendun";
               this.btnSpr.addChild(this.ynBaguaiwushendunBtn);
               this.ynBaguaiwushendunBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynBaguaiwushendunBtn.visible = param1;
         }
         else if(Boolean(this.ynBaguaiwushendunBtn) && Boolean(this.ynBaguaiwushendunBtn.parent))
         {
            this.ynBaguaiwushendunBtn.parent.removeChild(this.ynBaguaiwushendunBtn);
            this.ynBaguaiwushendunBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNTupowugongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynTupowugongBtn == null)
            {
               this.ynTupowugongBtn = new NewSkinButton();
               this.ynTupowugongBtn.skin = "yntupowugong";
               this.btnSpr.addChild(this.ynTupowugongBtn);
               this.ynTupowugongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynTupowugongBtn.visible = param1;
         }
         else if(Boolean(this.ynTupowugongBtn) && Boolean(this.ynTupowugongBtn.parent))
         {
            this.ynTupowugongBtn.parent.removeChild(this.ynTupowugongBtn);
            this.ynTupowugongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNLiupaijingjiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynLiupaijingjiBtn == null)
            {
               this.ynLiupaijingjiBtn = new NewSkinButton();
               this.ynLiupaijingjiBtn.skin = "ynliupaijingji";
               this.btnSpr.addChild(this.ynLiupaijingjiBtn);
               this.ynLiupaijingjiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynLiupaijingjiBtn.visible = param1;
         }
         else if(Boolean(this.ynLiupaijingjiBtn) && Boolean(this.ynLiupaijingjiBtn.parent))
         {
            this.ynLiupaijingjiBtn.parent.removeChild(this.ynLiupaijingjiBtn);
            this.ynLiupaijingjiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNLiumaijianVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynLiumaijianBtn == null)
            {
               this.ynLiumaijianBtn = new NewSkinButton();
               this.ynLiumaijianBtn.skin = "ynliumaijian";
               this.btnSpr.addChild(this.ynLiumaijianBtn);
               this.ynLiumaijianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynLiumaijianBtn.visible = param1;
         }
         else if(Boolean(this.ynLiumaijianBtn) && Boolean(this.ynLiumaijianBtn.parent))
         {
            this.ynLiumaijianBtn.parent.removeChild(this.ynLiumaijianBtn);
            this.ynLiumaijianBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNXunshixuedaoVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXunshixuedaoBtn == null)
            {
               this.ynXunshixuedaoBtn = new NewSkinButton();
               this.ynXunshixuedaoBtn.skin = "ynxunshixuedao";
               this.btnSpr.addChild(this.ynXunshixuedaoBtn);
               this.ynXunshixuedaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXunshixuedaoBtn.visible = param1;
         }
         else if(Boolean(this.ynXunshixuedaoBtn) && Boolean(this.ynXunshixuedaoBtn.parent))
         {
            this.ynXunshixuedaoBtn.parent.removeChild(this.ynXunshixuedaoBtn);
            this.ynXunshixuedaoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNYidazunshiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynYidazunshiBtn == null)
            {
               this.ynYidazunshiBtn = new NewSkinButton();
               this.ynYidazunshiBtn.skin = "ynyidazunshi";
               this.btnSpr.addChild(this.ynYidazunshiBtn);
               this.ynYidazunshiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynYidazunshiBtn.visible = param1;
         }
         else if(Boolean(this.ynYidazunshiBtn) && Boolean(this.ynYidazunshiBtn.parent))
         {
            this.ynYidazunshiBtn.parent.removeChild(this.ynYidazunshiBtn);
            this.ynYidazunshiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNYingbinzhouliVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynYingbinzhouliBtn == null)
            {
               this.ynYingbinzhouliBtn = new NewSkinButton();
               this.ynYingbinzhouliBtn.skin = "ynyingbinzhouli";
               this.btnSpr.addChild(this.ynYingbinzhouliBtn);
               this.ynYingbinzhouliBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynYingbinzhouliBtn.visible = param1;
         }
         else if(Boolean(this.ynYingbinzhouliBtn) && Boolean(this.ynYingbinzhouliBtn.parent))
         {
            this.ynYingbinzhouliBtn.parent.removeChild(this.ynYingbinzhouliBtn);
            this.ynYingbinzhouliBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNWangzheVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWangzheBtn == null)
            {
               this.ynWangzheBtn = new NewSkinButton();
               this.ynWangzheBtn.skin = "ynwangzhe";
               this.btnSpr.addChild(this.ynWangzheBtn);
               this.ynWangzheBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWangzheBtn.visible = param1;
         }
         else if(Boolean(this.ynWangzheBtn) && Boolean(this.ynWangzheBtn.parent))
         {
            this.ynWangzheBtn.parent.removeChild(this.ynWangzheBtn);
            this.ynWangzheBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNZhouwuguangliangVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhouwuguangliangBtn == null)
            {
               this.ynZhouwuguangliangBtn = new NewSkinButton();
               this.ynZhouwuguangliangBtn.skin = "ynzhouwuguangliang";
               this.btnSpr.addChild(this.ynZhouwuguangliangBtn);
               this.ynZhouwuguangliangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhouwuguangliangBtn.visible = param1;
         }
         else if(Boolean(this.ynZhouwuguangliangBtn) && Boolean(this.ynZhouwuguangliangBtn.parent))
         {
            this.ynZhouwuguangliangBtn.parent.removeChild(this.ynZhouwuguangliangBtn);
            this.ynZhouwuguangliangBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNWuhunjianVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynwuhunjianBtn == null)
            {
               this.ynwuhunjianBtn = new NewSkinButton();
               this.ynwuhunjianBtn.skin = "ynwuhunjian";
               this.btnSpr.addChild(this.ynwuhunjianBtn);
               this.ynwuhunjianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynwuhunjianBtn.visible = param1;
         }
         else if(Boolean(this.ynwuhunjianBtn) && Boolean(this.ynwuhunjianBtn.parent))
         {
            this.ynwuhunjianBtn.parent.removeChild(this.ynwuhunjianBtn);
            this.ynwuhunjianBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNDingfengshenshouVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynDingfengshenshouBtn == null)
            {
               this.ynDingfengshenshouBtn = new NewSkinButton();
               this.ynDingfengshenshouBtn.skin = "yndingfengshenshou";
               this.btnSpr.addChild(this.ynDingfengshenshouBtn);
               this.ynDingfengshenshouBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynDingfengshenshouBtn.visible = param1;
         }
         else if(Boolean(this.ynDingfengshenshouBtn) && Boolean(this.ynDingfengshenshouBtn.parent))
         {
            this.ynDingfengshenshouBtn.parent.removeChild(this.ynDingfengshenshouBtn);
            this.ynDingfengshenshouBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNTianxiangwangzheVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynTianxiangwangzheBtn == null)
            {
               this.ynTianxiangwangzheBtn = new NewSkinButton();
               this.ynTianxiangwangzheBtn.skin = "yntianxiangwangzhe";
               this.btnSpr.addChild(this.ynTianxiangwangzheBtn);
               this.ynTianxiangwangzheBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynTianxiangwangzheBtn.visible = param1;
         }
         else if(Boolean(this.ynTianxiangwangzheBtn) && Boolean(this.ynTianxiangwangzheBtn.parent))
         {
            this.ynTianxiangwangzheBtn.parent.removeChild(this.ynTianxiangwangzheBtn);
            this.ynTianxiangwangzheBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNQisehuluVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynQisehuluBtn == null)
            {
               this.ynQisehuluBtn = new NewSkinButton();
               this.ynQisehuluBtn.skin = "ynqisehulu";
               this.btnSpr.addChild(this.ynQisehuluBtn);
               this.ynQisehuluBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynQisehuluBtn.visible = param1;
         }
         else if(Boolean(this.ynQisehuluBtn) && Boolean(this.ynQisehuluBtn.parent))
         {
            this.ynQisehuluBtn.parent.removeChild(this.ynQisehuluBtn);
            this.ynQisehuluBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNBansuizuqiuduiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynBansuizuqiuduiBtn == null)
            {
               this.ynBansuizuqiuduiBtn = new NewSkinButton();
               this.ynBansuizuqiuduiBtn.skin = "ynbansuizuqiudui";
               this.btnSpr.addChild(this.ynBansuizuqiuduiBtn);
               this.ynBansuizuqiuduiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynBansuizuqiuduiBtn.visible = param1;
         }
         else if(Boolean(this.ynBansuizuqiuduiBtn) && Boolean(this.ynBansuizuqiuduiBtn.parent))
         {
            this.ynBansuizuqiuduiBtn.parent.removeChild(this.ynBansuizuqiuduiBtn);
            this.ynBansuizuqiuduiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNDingfengzhouqiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynDingfengzhouqiBtn == null)
            {
               this.ynDingfengzhouqiBtn = new NewSkinButton();
               this.ynDingfengzhouqiBtn.skin = "yndingfengzhouqi";
               this.btnSpr.addChild(this.ynDingfengzhouqiBtn);
               this.ynDingfengzhouqiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynDingfengzhouqiBtn.visible = param1;
         }
         else if(Boolean(this.ynDingfengzhouqiBtn) && Boolean(this.ynDingfengzhouqiBtn.parent))
         {
            this.ynDingfengzhouqiBtn.parent.removeChild(this.ynDingfengzhouqiBtn);
            this.ynDingfengzhouqiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNZhentianshenqiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhentianshenqiBtn == null)
            {
               this.ynZhentianshenqiBtn = new NewSkinButton();
               this.ynZhentianshenqiBtn.skin = "ynzhentianshenqi";
               this.btnSpr.addChild(this.ynZhentianshenqiBtn);
               this.ynZhentianshenqiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhentianshenqiBtn.visible = param1;
         }
         else if(Boolean(this.ynZhentianshenqiBtn) && Boolean(this.ynZhentianshenqiBtn.parent))
         {
            this.ynZhentianshenqiBtn.parent.removeChild(this.ynZhentianshenqiBtn);
            this.ynZhentianshenqiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNLongjingzhangVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynLongjingzhangBtn == null)
            {
               this.ynLongjingzhangBtn = new NewSkinButton();
               this.ynLongjingzhangBtn.skin = "ynlongjingzhang";
               this.btnSpr.addChild(this.ynLongjingzhangBtn);
               this.ynLongjingzhangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynLongjingzhangBtn.visible = param1;
         }
         else if(Boolean(this.ynLongjingzhangBtn) && Boolean(this.ynLongjingzhangBtn.parent))
         {
            this.ynLongjingzhangBtn.parent.removeChild(this.ynLongjingzhangBtn);
            this.ynLongjingzhangBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNFeilongjingVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynFeilongjingBtn == null)
            {
               this.ynFeilongjingBtn = new NewSkinButton();
               this.ynFeilongjingBtn.skin = "ynfeilongjing";
               this.btnSpr.addChild(this.ynFeilongjingBtn);
               this.ynFeilongjingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynFeilongjingBtn.visible = param1;
         }
         else if(Boolean(this.ynFeilongjingBtn) && Boolean(this.ynFeilongjingBtn.parent))
         {
            this.ynFeilongjingBtn.parent.removeChild(this.ynFeilongjingBtn);
            this.ynFeilongjingBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNFeilongjing2Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynFeilongjing2Btn == null)
            {
               this.ynFeilongjing2Btn = new NewSkinButton();
               this.ynFeilongjing2Btn.skin = "ynfeilongjing";
               this.btnSpr.addChild(this.ynFeilongjing2Btn);
               this.ynFeilongjing2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynFeilongjing2Btn.visible = param1;
         }
         else if(Boolean(this.ynFeilongjing2Btn) && Boolean(this.ynFeilongjing2Btn.parent))
         {
            this.ynFeilongjing2Btn.parent.removeChild(this.ynFeilongjing2Btn);
            this.ynFeilongjing2Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNFeilongjing3Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynFeilongjing3Btn == null)
            {
               this.ynFeilongjing3Btn = new NewSkinButton();
               this.ynFeilongjing3Btn.skin = "ynfeilongjing";
               this.btnSpr.addChild(this.ynFeilongjing3Btn);
               this.ynFeilongjing3Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynFeilongjing3Btn.visible = param1;
         }
         else if(Boolean(this.ynFeilongjing3Btn) && Boolean(this.ynFeilongjing3Btn.parent))
         {
            this.ynFeilongjing3Btn.parent.removeChild(this.ynFeilongjing3Btn);
            this.ynFeilongjing3Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNBanjuesailingjiangVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynBanjuesailingjiangBtn == null)
            {
               this.ynBanjuesailingjiangBtn = new NewSkinButton();
               this.ynBanjuesailingjiangBtn.skin = "ynbanjuesailingjiang";
               this.btnSpr.addChild(this.ynBanjuesailingjiangBtn);
               this.ynBanjuesailingjiangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynBanjuesailingjiangBtn.visible = param1;
         }
         else if(Boolean(this.ynBanjuesailingjiangBtn) && Boolean(this.ynBanjuesailingjiangBtn.parent))
         {
            this.ynBanjuesailingjiangBtn.parent.removeChild(this.ynBanjuesailingjiangBtn);
            this.ynBanjuesailingjiangBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNXunzhaobaozangVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXunzhaobaozangBtn == null)
            {
               this.ynXunzhaobaozangBtn = new NewSkinButton();
               this.ynXunzhaobaozangBtn.skin = "yndingfengzhouqi";
               this.btnSpr.addChild(this.ynXunzhaobaozangBtn);
               this.ynXunzhaobaozangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXunzhaobaozangBtn.visible = param1;
         }
         else if(Boolean(this.ynXunzhaobaozangBtn) && Boolean(this.ynXunzhaobaozangBtn.parent))
         {
            this.ynXunzhaobaozangBtn.parent.removeChild(this.ynXunzhaobaozangBtn);
            this.ynXunzhaobaozangBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNJingxijinpiaodaliVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynJingxijinpiaodaliBtn == null)
            {
               this.ynJingxijinpiaodaliBtn = new NewSkinButton();
               this.ynJingxijinpiaodaliBtn.skin = "ynjingxijinpiaodajiang";
               this.btnSpr.addChild(this.ynJingxijinpiaodaliBtn);
               this.ynJingxijinpiaodaliBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynJingxijinpiaodaliBtn.visible = param1;
         }
         else if(Boolean(this.ynJingxijinpiaodaliBtn) && Boolean(this.ynJingxijinpiaodaliBtn.parent))
         {
            this.ynJingxijinpiaodaliBtn.parent.removeChild(this.ynJingxijinpiaodaliBtn);
            this.ynJingxijinpiaodaliBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNZhentianjiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhentianjiBtn == null)
            {
               this.ynZhentianjiBtn = new NewSkinButton();
               this.ynZhentianjiBtn.skin = "ynzhentianji";
               this.btnSpr.addChild(this.ynZhentianjiBtn);
               this.ynZhentianjiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhentianjiBtn.visible = param1;
         }
         else if(Boolean(this.ynZhentianjiBtn) && Boolean(this.ynZhentianjiBtn.parent))
         {
            this.ynZhentianjiBtn.parent.removeChild(this.ynZhentianjiBtn);
            this.ynZhentianjiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNHuashanlunjianVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynHuashanlunjianBtn == null)
            {
               this.ynHuashanlunjianBtn = new NewSkinButton();
               this.ynHuashanlunjianBtn.skin = "ynhuashanlunjian";
               this.btnSpr.addChild(this.ynHuashanlunjianBtn);
               this.ynHuashanlunjianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynHuashanlunjianBtn.visible = param1;
         }
         else if(Boolean(this.ynHuashanlunjianBtn) && Boolean(this.ynHuashanlunjianBtn.parent))
         {
            this.ynHuashanlunjianBtn.parent.removeChild(this.ynHuashanlunjianBtn);
            this.ynHuashanlunjianBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNHuashanwuzhangVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynHuashanwuzhangBtn == null)
            {
               this.ynHuashanwuzhangBtn = new NewSkinButton();
               this.ynHuashanwuzhangBtn.skin = "ynhuashanwuzhang";
               this.btnSpr.addChild(this.ynHuashanwuzhangBtn);
               this.ynHuashanwuzhangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynHuashanwuzhangBtn.visible = param1;
         }
         else if(Boolean(this.ynHuashanwuzhangBtn) && Boolean(this.ynHuashanwuzhangBtn.parent))
         {
            this.ynHuashanwuzhangBtn.parent.removeChild(this.ynHuashanwuzhangBtn);
            this.ynHuashanwuzhangBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNTianxueshenbingVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynTianxueshenbingBtn == null)
            {
               this.ynTianxueshenbingBtn = new NewSkinButton();
               this.ynTianxueshenbingBtn.skin = "yntianxueshenbing";
               this.btnSpr.addChild(this.ynTianxueshenbingBtn);
               this.ynTianxueshenbingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynTianxueshenbingBtn.visible = param1;
         }
         else if(Boolean(this.ynTianxueshenbingBtn) && Boolean(this.ynTianxueshenbingBtn.parent))
         {
            this.ynTianxueshenbingBtn.parent.removeChild(this.ynTianxueshenbingBtn);
            this.ynTianxueshenbingBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNShengdanjinpiaoVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynShengdanjinpiaoBtn == null)
            {
               this.ynShengdanjinpiaoBtn = new NewSkinButton();
               this.ynShengdanjinpiaoBtn.skin = "ynshengdanjinpiao";
               this.btnSpr.addChild(this.ynShengdanjinpiaoBtn);
               this.ynShengdanjinpiaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynShengdanjinpiaoBtn.visible = param1;
         }
         else if(Boolean(this.ynShengdanjinpiaoBtn) && Boolean(this.ynShengdanjinpiaoBtn.parent))
         {
            this.ynShengdanjinpiaoBtn.parent.removeChild(this.ynShengdanjinpiaoBtn);
            this.ynShengdanjinpiaoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNZhenbaogeVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhenbaogeBtn == null)
            {
               this.ynZhenbaogeBtn = new NewSkinButton();
               this.ynZhenbaogeBtn.skin = "ynzhenbaoge";
               this.btnSpr.addChild(this.ynZhenbaogeBtn);
               this.ynZhenbaogeBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhenbaogeBtn.visible = param1;
         }
         else if(Boolean(this.ynZhenbaogeBtn) && Boolean(this.ynZhenbaogeBtn.parent))
         {
            this.ynZhenbaogeBtn.parent.removeChild(this.ynZhenbaogeBtn);
            this.ynZhenbaogeBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNTaohuajiuVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynTaohuajiuBtn == null)
            {
               this.ynTaohuajiuBtn = new NewSkinButton();
               this.ynTaohuajiuBtn.skin = "yntaohuajiu";
               this.btnSpr.addChild(this.ynTaohuajiuBtn);
               this.ynTaohuajiuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynTaohuajiuBtn.visible = param1;
         }
         else if(Boolean(this.ynTaohuajiuBtn) && Boolean(this.ynTaohuajiuBtn.parent))
         {
            this.ynTaohuajiuBtn.parent.removeChild(this.ynTaohuajiuBtn);
            this.ynTaohuajiuBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNTaohuajiu2Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynTaohuajiu2Btn == null)
            {
               this.ynTaohuajiu2Btn = new NewSkinButton();
               this.ynTaohuajiu2Btn.skin = "yntaohuajiu";
               this.btnSpr.addChild(this.ynTaohuajiu2Btn);
               this.ynTaohuajiu2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynTaohuajiu2Btn.visible = param1;
         }
         else if(Boolean(this.ynTaohuajiu2Btn) && Boolean(this.ynTaohuajiu2Btn.parent))
         {
            this.ynTaohuajiu2Btn.parent.removeChild(this.ynTaohuajiu2Btn);
            this.ynTaohuajiu2Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNTaohuajiu3Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynTaohuajiu3Btn == null)
            {
               this.ynTaohuajiu3Btn = new NewSkinButton();
               this.ynTaohuajiu3Btn.skin = "yntaohuajiu";
               this.btnSpr.addChild(this.ynTaohuajiu3Btn);
               this.ynTaohuajiu3Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynTaohuajiu3Btn.visible = param1;
         }
         else if(Boolean(this.ynTaohuajiu3Btn) && Boolean(this.ynTaohuajiu3Btn.parent))
         {
            this.ynTaohuajiu3Btn.parent.removeChild(this.ynTaohuajiu3Btn);
            this.ynTaohuajiu3Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNKaichunwanfuVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynKaichunwanfuBtn == null)
            {
               this.ynKaichunwanfuBtn = new NewSkinButton();
               this.ynKaichunwanfuBtn.skin = "ynkaichunwanfu";
               this.btnSpr.addChild(this.ynKaichunwanfuBtn);
               this.ynKaichunwanfuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynKaichunwanfuBtn.visible = param1;
         }
         else if(Boolean(this.ynKaichunwanfuBtn) && Boolean(this.ynKaichunwanfuBtn.parent))
         {
            this.ynKaichunwanfuBtn.parent.removeChild(this.ynKaichunwanfuBtn);
            this.ynKaichunwanfuBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNXinnianlibaoVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXinnianlibaoBtn == null)
            {
               this.ynXinnianlibaoBtn = new NewSkinButton();
               this.ynXinnianlibaoBtn.skin = "ynxinnianlibao";
               this.btnSpr.addChild(this.ynXinnianlibaoBtn);
               this.ynXinnianlibaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXinnianlibaoBtn.visible = param1;
         }
         else if(Boolean(this.ynXinnianlibaoBtn) && Boolean(this.ynXinnianlibaoBtn.parent))
         {
            this.ynXinnianlibaoBtn.parent.removeChild(this.ynXinnianlibaoBtn);
            this.ynXinnianlibaoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNShengdanjieVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynShengdanjieBtn == null)
            {
               this.ynShengdanjieBtn = new NewSkinButton();
               this.ynShengdanjieBtn.skin = "ynshengdanjie";
               this.btnSpr.addChild(this.ynShengdanjieBtn);
               this.ynShengdanjieBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynShengdanjieBtn.visible = param1;
         }
         else if(Boolean(this.ynShengdanjieBtn) && Boolean(this.ynShengdanjieBtn.parent))
         {
            this.ynShengdanjieBtn.parent.removeChild(this.ynShengdanjieBtn);
            this.ynShengdanjieBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNXianglongchaojiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXianglongchaojiBtn == null)
            {
               this.ynXianglongchaojiBtn = new NewSkinButton();
               this.ynXianglongchaojiBtn.skin = "ynxianglongchaoji";
               this.btnSpr.addChild(this.ynXianglongchaojiBtn);
               this.ynXianglongchaojiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXianglongchaojiBtn.visible = param1;
         }
         else if(Boolean(this.ynXianglongchaojiBtn) && Boolean(this.ynXianglongchaojiBtn.parent))
         {
            this.ynXianglongchaojiBtn.parent.removeChild(this.ynXianglongchaojiBtn);
            this.ynXianglongchaojiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNXianglongchaoji2Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXianglongchaoji2Btn == null)
            {
               this.ynXianglongchaoji2Btn = new NewSkinButton();
               this.ynXianglongchaoji2Btn.skin = "ynxianglongchaoji";
               this.btnSpr.addChild(this.ynXianglongchaoji2Btn);
               this.ynXianglongchaoji2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXianglongchaoji2Btn.visible = param1;
         }
         else if(Boolean(this.ynXianglongchaoji2Btn) && Boolean(this.ynXianglongchaoji2Btn.parent))
         {
            this.ynXianglongchaoji2Btn.parent.removeChild(this.ynXianglongchaoji2Btn);
            this.ynXianglongchaoji2Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNXianglongchaoji3Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXianglongchaoji3Btn == null)
            {
               this.ynXianglongchaoji3Btn = new NewSkinButton();
               this.ynXianglongchaoji3Btn.skin = "ynxianglongchaoji";
               this.btnSpr.addChild(this.ynXianglongchaoji3Btn);
               this.ynXianglongchaoji3Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXianglongchaoji3Btn.visible = param1;
         }
         else if(Boolean(this.ynXianglongchaoji3Btn) && Boolean(this.ynXianglongchaoji3Btn.parent))
         {
            this.ynXianglongchaoji3Btn.parent.removeChild(this.ynXianglongchaoji3Btn);
            this.ynXianglongchaoji3Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNTengtianyuVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynTengtianyuBtn == null)
            {
               this.ynTengtianyuBtn = new NewSkinButton();
               this.ynTengtianyuBtn.skin = "yntengtianyu";
               this.btnSpr.addChild(this.ynTengtianyuBtn);
               this.ynTengtianyuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynTengtianyuBtn.visible = param1;
         }
         else if(Boolean(this.ynTengtianyuBtn) && Boolean(this.ynTengtianyuBtn.parent))
         {
            this.ynTengtianyuBtn.parent.removeChild(this.ynTengtianyuBtn);
            this.ynTengtianyuBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNTengtianyu2Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynTengtianyuBtn2 == null)
            {
               this.ynTengtianyuBtn2 = new NewSkinButton();
               this.ynTengtianyuBtn2.skin = "yntengtianyu";
               this.btnSpr.addChild(this.ynTengtianyuBtn2);
               this.ynTengtianyuBtn2.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynTengtianyuBtn2.visible = param1;
         }
         else if(Boolean(this.ynTengtianyuBtn2) && Boolean(this.ynTengtianyuBtn2.parent))
         {
            this.ynTengtianyuBtn2.parent.removeChild(this.ynTengtianyuBtn2);
            this.ynTengtianyuBtn2 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNWeiyongwushuangVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWeiyongwushuangBtn == null)
            {
               this.ynWeiyongwushuangBtn = new NewSkinButton();
               this.ynWeiyongwushuangBtn.skin = "ynweiyongwushuang";
               this.btnSpr.addChild(this.ynWeiyongwushuangBtn);
               this.ynWeiyongwushuangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWeiyongwushuangBtn.visible = param1;
         }
         else if(Boolean(this.ynWeiyongwushuangBtn) && Boolean(this.ynWeiyongwushuangBtn.parent))
         {
            this.ynWeiyongwushuangBtn.parent.removeChild(this.ynWeiyongwushuangBtn);
            this.ynWeiyongwushuangBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNWujinjindingriVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWujinjindingriBtn == null)
            {
               this.ynWujinjindingriBtn = new NewSkinButton();
               this.ynWujinjindingriBtn.skin = "ynwujinjindingri";
               this.btnSpr.addChild(this.ynWujinjindingriBtn);
               this.ynWujinjindingriBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWujinjindingriBtn.visible = param1;
         }
         else if(Boolean(this.ynWujinjindingriBtn) && Boolean(this.ynWujinjindingriBtn.parent))
         {
            this.ynWujinjindingriBtn.parent.removeChild(this.ynWujinjindingriBtn);
            this.ynWujinjindingriBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNWujinjindingri2Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWujinjindingri2Btn == null)
            {
               this.ynWujinjindingri2Btn = new NewSkinButton();
               this.ynWujinjindingri2Btn.skin = "ynwujinjindingri";
               this.btnSpr.addChild(this.ynWujinjindingri2Btn);
               this.ynWujinjindingri2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWujinjindingri2Btn.visible = param1;
         }
         else if(Boolean(this.ynWujinjindingri2Btn) && Boolean(this.ynWujinjindingri2Btn.parent))
         {
            this.ynWujinjindingri2Btn.parent.removeChild(this.ynWujinjindingri2Btn);
            this.ynWujinjindingri2Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNWujinjindingri3Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWujinjindingri3Btn == null)
            {
               this.ynWujinjindingri3Btn = new NewSkinButton();
               this.ynWujinjindingri3Btn.skin = "ynwujinjindingri";
               this.btnSpr.addChild(this.ynWujinjindingri3Btn);
               this.ynWujinjindingri3Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWujinjindingri3Btn.visible = param1;
         }
         else if(Boolean(this.ynWujinjindingri3Btn) && Boolean(this.ynWujinjindingri3Btn.parent))
         {
            this.ynWujinjindingri3Btn.parent.removeChild(this.ynWujinjindingri3Btn);
            this.ynWujinjindingri3Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNXinnianyasuiqianVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXinnianyasuiqianBtn == null)
            {
               this.ynXinnianyasuiqianBtn = new NewSkinButton();
               this.ynXinnianyasuiqianBtn.skin = "ynxinnianyasuiqian";
               this.btnSpr.addChild(this.ynXinnianyasuiqianBtn);
               this.ynXinnianyasuiqianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXinnianyasuiqianBtn.visible = param1;
         }
         else if(Boolean(this.ynXinnianyasuiqianBtn) && Boolean(this.ynXinnianyasuiqianBtn.parent))
         {
            this.ynXinnianyasuiqianBtn.parent.removeChild(this.ynXinnianyasuiqianBtn);
            this.ynXinnianyasuiqianBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNFangyanhuaVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynFangyanhuaBtn == null)
            {
               this.ynFangyanhuaBtn = new NewSkinButton();
               this.ynFangyanhuaBtn.skin = "ynfangyanhua";
               this.btnSpr.addChild(this.ynFangyanhuaBtn);
               this.ynFangyanhuaBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynFangyanhuaBtn.visible = param1;
         }
         else if(Boolean(this.ynFangyanhuaBtn) && Boolean(this.ynFangyanhuaBtn.parent))
         {
            this.ynFangyanhuaBtn.parent.removeChild(this.ynFangyanhuaBtn);
            this.ynFangyanhuaBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNZaowangVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZaowangBtn == null)
            {
               this.ynZaowangBtn = new NewSkinButton();
               this.ynZaowangBtn.skin = "ynzaowang";
               this.btnSpr.addChild(this.ynZaowangBtn);
               this.ynZaowangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZaowangBtn.visible = param1;
         }
         else if(Boolean(this.ynZaowangBtn) && Boolean(this.ynZaowangBtn.parent))
         {
            this.ynZaowangBtn.parent.removeChild(this.ynZaowangBtn);
            this.ynZaowangBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNChunjie123Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynChunjie123Btn == null)
            {
               this.ynChunjie123Btn = new NewSkinButton();
               this.ynChunjie123Btn.skin = "ynchunjie123";
               this.btnSpr.addChild(this.ynChunjie123Btn);
               this.ynChunjie123Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynChunjie123Btn.visible = param1;
         }
         else if(Boolean(this.ynChunjie123Btn) && Boolean(this.ynChunjie123Btn.parent))
         {
            this.ynChunjie123Btn.parent.removeChild(this.ynChunjie123Btn);
            this.ynChunjie123Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNXiongjiquanVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXiongjiquanBtn == null)
            {
               this.ynXiongjiquanBtn = new NewSkinButton();
               this.ynXiongjiquanBtn.skin = "ynxiongjiquan";
               this.btnSpr.addChild(this.ynXiongjiquanBtn);
               this.ynXiongjiquanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXiongjiquanBtn.visible = param1;
         }
         else if(Boolean(this.ynXiongjiquanBtn) && Boolean(this.ynXiongjiquanBtn.parent))
         {
            this.ynXiongjiquanBtn.parent.removeChild(this.ynXiongjiquanBtn);
            this.ynXiongjiquanBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNChunjieduilianVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynChunjieduilianBtn == null)
            {
               this.ynChunjieduilianBtn = new NewSkinButton();
               this.ynChunjieduilianBtn.skin = "ynduilian";
               this.btnSpr.addChild(this.ynChunjieduilianBtn);
               this.ynChunjieduilianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynChunjieduilianBtn.visible = param1;
         }
         else if(Boolean(this.ynChunjieduilianBtn) && Boolean(this.ynChunjieduilianBtn.parent))
         {
            this.ynChunjieduilianBtn.parent.removeChild(this.ynChunjieduilianBtn);
            this.ynChunjieduilianBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNGaishishenlongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynGaishishenlongBtn == null)
            {
               this.ynGaishishenlongBtn = new NewSkinButton();
               this.ynGaishishenlongBtn.skin = "yngaishishenlong";
               this.btnSpr.addChild(this.ynGaishishenlongBtn);
               this.ynGaishishenlongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynGaishishenlongBtn.visible = param1;
         }
         else if(Boolean(this.ynGaishishenlongBtn) && Boolean(this.ynGaishishenlongBtn.parent))
         {
            this.ynGaishishenlongBtn.parent.removeChild(this.ynGaishishenlongBtn);
            this.ynGaishishenlongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNGuguchengqinVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynGuguchengqinBtn == null)
            {
               this.ynGuguchengqinBtn = new NewSkinButton();
               this.ynGuguchengqinBtn.skin = "ynguguchengqin";
               this.btnSpr.addChild(this.ynGuguchengqinBtn);
               this.ynGuguchengqinBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynGuguchengqinBtn.visible = param1;
         }
         else if(Boolean(this.ynGuguchengqinBtn) && Boolean(this.ynGuguchengqinBtn.parent))
         {
            this.ynGuguchengqinBtn.parent.removeChild(this.ynGuguchengqinBtn);
            this.ynGuguchengqinBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNYuanyangxishuiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynYuanyangxishuiBtn == null)
            {
               this.ynYuanyangxishuiBtn = new NewSkinButton();
               this.ynYuanyangxishuiBtn.skin = "ynyuanyangxishui";
               this.btnSpr.addChild(this.ynYuanyangxishuiBtn);
               this.ynYuanyangxishuiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynYuanyangxishuiBtn.visible = param1;
         }
         else if(Boolean(this.ynYuanyangxishuiBtn) && Boolean(this.ynYuanyangxishuiBtn.parent))
         {
            this.ynYuanyangxishuiBtn.parent.removeChild(this.ynYuanyangxishuiBtn);
            this.ynYuanyangxishuiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNTianyuchanVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynTianyuchanBtn == null)
            {
               this.ynTianyuchanBtn = new NewSkinButton();
               this.ynTianyuchanBtn.skin = "yntianyuchan";
               this.btnSpr.addChild(this.ynTianyuchanBtn);
               this.ynTianyuchanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynTianyuchanBtn.visible = param1;
         }
         else if(Boolean(this.ynTianyuchanBtn) && Boolean(this.ynTianyuchanBtn.parent))
         {
            this.ynTianyuchanBtn.parent.removeChild(this.ynTianyuchanBtn);
            this.ynTianyuchanBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNTianshenshiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynTianshenshiBtn == null)
            {
               this.ynTianshenshiBtn = new NewSkinButton();
               this.ynTianshenshiBtn.skin = "yntianshenshi";
               this.btnSpr.addChild(this.ynTianshenshiBtn);
               this.ynTianshenshiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynTianshenshiBtn.visible = param1;
         }
         else if(Boolean(this.ynTianshenshiBtn) && Boolean(this.ynTianshenshiBtn.parent))
         {
            this.ynTianshenshiBtn.parent.removeChild(this.ynTianshenshiBtn);
            this.ynTianshenshiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNQixingzhuangbeiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynQixingzhuangbeiBtn == null)
            {
               this.ynQixingzhuangbeiBtn = new NewSkinButton();
               this.ynQixingzhuangbeiBtn.skin = "ynqixingzhuangbei";
               this.btnSpr.addChild(this.ynQixingzhuangbeiBtn);
               this.ynQixingzhuangbeiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynQixingzhuangbeiBtn.visible = param1;
         }
         else if(Boolean(this.ynQixingzhuangbeiBtn) && Boolean(this.ynQixingzhuangbeiBtn.parent))
         {
            this.ynQixingzhuangbeiBtn.parent.removeChild(this.ynQixingzhuangbeiBtn);
            this.ynQixingzhuangbeiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNLingDanZhenPinVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynLingDanZhenPin1Btn == null)
            {
               this.ynLingDanZhenPin1Btn = new NewSkinButton();
               this.ynLingDanZhenPin1Btn.skin = "ynlingdanzhenpin";
               this.btnSpr.addChild(this.ynLingDanZhenPin1Btn);
               this.ynLingDanZhenPin1Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynLingDanZhenPin1Btn.visible = param1;
         }
         else if(Boolean(this.ynLingDanZhenPin1Btn) && Boolean(this.ynLingDanZhenPin1Btn.parent))
         {
            this.ynLingDanZhenPin1Btn.parent.removeChild(this.ynLingDanZhenPin1Btn);
            this.ynLingDanZhenPin1Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNLingDanZhenPin2Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynLingDanZhenPin2Btn == null)
            {
               this.ynLingDanZhenPin2Btn = new NewSkinButton();
               this.ynLingDanZhenPin2Btn.skin = "ynlingdanzhenpin";
               this.btnSpr.addChild(this.ynLingDanZhenPin2Btn);
               this.ynLingDanZhenPin2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynLingDanZhenPin2Btn.visible = param1;
         }
         else if(Boolean(this.ynLingDanZhenPin2Btn) && Boolean(this.ynLingDanZhenPin2Btn.parent))
         {
            this.ynLingDanZhenPin2Btn.parent.removeChild(this.ynLingDanZhenPin2Btn);
            this.ynLingDanZhenPin2Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNLingDanZhenPin3Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynLingDanZhenPin3Btn == null)
            {
               this.ynLingDanZhenPin3Btn = new NewSkinButton();
               this.ynLingDanZhenPin3Btn.skin = "ynlingdanzhenpin";
               this.btnSpr.addChild(this.ynLingDanZhenPin3Btn);
               this.ynLingDanZhenPin3Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynLingDanZhenPin3Btn.visible = param1;
         }
         else if(Boolean(this.ynLingDanZhenPin3Btn) && Boolean(this.ynLingDanZhenPin3Btn.parent))
         {
            this.ynLingDanZhenPin3Btn.parent.removeChild(this.ynLingDanZhenPin3Btn);
            this.ynLingDanZhenPin3Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNErYueDiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynErYueDiBtn == null)
            {
               this.ynErYueDiBtn = new NewSkinButton();
               this.ynErYueDiBtn.skin = "yneryuedi";
               this.btnSpr.addChild(this.ynErYueDiBtn);
               this.ynErYueDiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynErYueDiBtn.visible = param1;
         }
         else if(Boolean(this.ynErYueDiBtn) && Boolean(this.ynErYueDiBtn.parent))
         {
            this.ynErYueDiBtn.parent.removeChild(this.ynErYueDiBtn);
            this.ynErYueDiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNXiangYangDuiJue1Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXiangYangDuiJue1Btn == null)
            {
               this.ynXiangYangDuiJue1Btn = new NewSkinButton();
               this.ynXiangYangDuiJue1Btn.skin = "ynxiangyangduijue";
               this.btnSpr.addChild(this.ynXiangYangDuiJue1Btn);
               this.ynXiangYangDuiJue1Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXiangYangDuiJue1Btn.visible = param1;
         }
         else if(Boolean(this.ynXiangYangDuiJue1Btn) && Boolean(this.ynXiangYangDuiJue1Btn.parent))
         {
            this.ynXiangYangDuiJue1Btn.parent.removeChild(this.ynXiangYangDuiJue1Btn);
            this.ynXiangYangDuiJue1Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNXiangYangDuiJue2Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXiangYangDuiJue2Btn == null)
            {
               this.ynXiangYangDuiJue2Btn = new NewSkinButton();
               this.ynXiangYangDuiJue2Btn.skin = "ynxiangyangduijue";
               this.btnSpr.addChild(this.ynXiangYangDuiJue2Btn);
               this.ynXiangYangDuiJue2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXiangYangDuiJue2Btn.visible = param1;
         }
         else if(Boolean(this.ynXiangYangDuiJue2Btn) && Boolean(this.ynXiangYangDuiJue2Btn.parent))
         {
            this.ynXiangYangDuiJue2Btn.parent.removeChild(this.ynXiangYangDuiJue2Btn);
            this.ynXiangYangDuiJue2Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNXiangYangDuiJue3Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXiangYangDuiJue3Btn == null)
            {
               this.ynXiangYangDuiJue3Btn = new NewSkinButton();
               this.ynXiangYangDuiJue3Btn.skin = "ynxiangyangduijue";
               this.btnSpr.addChild(this.ynXiangYangDuiJue3Btn);
               this.ynXiangYangDuiJue3Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXiangYangDuiJue3Btn.visible = param1;
         }
         else if(Boolean(this.ynXiangYangDuiJue3Btn) && Boolean(this.ynXiangYangDuiJue3Btn.parent))
         {
            this.ynXiangYangDuiJue3Btn.parent.removeChild(this.ynXiangYangDuiJue3Btn);
            this.ynXiangYangDuiJue3Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNWuJinJianVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWuJinJianBtn == null)
            {
               this.ynWuJinJianBtn = new NewSkinButton();
               this.ynWuJinJianBtn.skin = "ynwujinjian";
               this.btnSpr.addChild(this.ynWuJinJianBtn);
               this.ynWuJinJianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWuJinJianBtn.visible = param1;
         }
         else if(Boolean(this.ynWuJinJianBtn) && Boolean(this.ynWuJinJianBtn.parent))
         {
            this.ynWuJinJianBtn.parent.removeChild(this.ynWuJinJianBtn);
            this.ynWuJinJianBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNYingXiongChuBaoVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynYingXiongChuBaoBtn == null)
            {
               this.ynYingXiongChuBaoBtn = new NewSkinButton();
               this.ynYingXiongChuBaoBtn.skin = "ynyingxiongchubao";
               this.btnSpr.addChild(this.ynYingXiongChuBaoBtn);
               this.ynYingXiongChuBaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynYingXiongChuBaoBtn.visible = param1;
         }
         else if(Boolean(this.ynYingXiongChuBaoBtn) && Boolean(this.ynYingXiongChuBaoBtn.parent))
         {
            this.ynYingXiongChuBaoBtn.parent.removeChild(this.ynYingXiongChuBaoBtn);
            this.ynYingXiongChuBaoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setMoXueBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.moxueBtn == null)
            {
               this.moxueBtn = new NewSkinButton();
               this.moxueBtn.skin = "moxuezhanchangBtn";
               this.moxueBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("大型战场，每周二、周五、周日全天24小时开放！") + "</font>";
               this.btnSpr.addChild(this.moxueBtn);
               this.moxueBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.moxueBtn.visible = param1;
         }
         else if(Boolean(this.moxueBtn) && Boolean(this.moxueBtn.parent))
         {
            this.moxueBtn.parent.removeChild(this.moxueBtn);
            this.moxueBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setGuoSeTianXiangBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.guosetianxiangBtn == null)
            {
               this.guosetianxiangBtn = new NewSkinButton();
               this.guosetianxiangBtn.skin = "guosetianxiangBtn";
               this.btnSpr.addChild(this.guosetianxiangBtn);
               this.guosetianxiangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.guosetianxiangBtn.visible = param1;
         }
         else if(Boolean(this.guosetianxiangBtn) && Boolean(this.guosetianxiangBtn.parent))
         {
            this.guosetianxiangBtn.parent.removeChild(this.guosetianxiangBtn);
            this.guosetianxiangBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWudushengzhenBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynwudushengzhenBtn == null)
            {
               this.ynwudushengzhenBtn = new NewSkinButton();
               this.ynwudushengzhenBtn.skin = "ynwudushengzhenBtn";
               this.btnSpr.addChild(this.ynwudushengzhenBtn);
               this.ynwudushengzhenBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynwudushengzhenBtn.visible = param1;
         }
         else if(Boolean(this.ynwudushengzhenBtn) && Boolean(this.ynwudushengzhenBtn.parent))
         {
            this.ynwudushengzhenBtn.parent.removeChild(this.ynwudushengzhenBtn);
            this.ynwudushengzhenBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setJiangHunBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.jiangHunBtn == null)
            {
               this.jiangHunBtn = new NewSkinButton();
               this.jiangHunBtn.skin = "jianghun_Button";
               this.jiangHunBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("三国将魂") + "</font>";
               this.btnSpr.addChild(this.jiangHunBtn);
               this.jiangHunBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.jiangHunBtn.visible = param1;
         }
         else if(Boolean(this.jiangHunBtn) && Boolean(this.jiangHunBtn.parent))
         {
            this.jiangHunBtn.parent.removeChild(this.jiangHunBtn);
            this.jiangHunBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setJueshijiaren1BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.Jueshijiaren1Btn == null)
            {
               this.Jueshijiaren1Btn = new NewSkinButton();
               this.Jueshijiaren1Btn.skin = "ynjueshijiarenBtn";
               this.btnSpr.addChild(this.Jueshijiaren1Btn);
               this.Jueshijiaren1Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.Jueshijiaren1Btn.visible = param1;
         }
         else if(Boolean(this.Jueshijiaren1Btn) && Boolean(this.Jueshijiaren1Btn.parent))
         {
            this.Jueshijiaren1Btn.parent.removeChild(this.Jueshijiaren1Btn);
            this.Jueshijiaren1Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setJueshijiaren2BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.Jueshijiaren2Btn == null)
            {
               this.Jueshijiaren2Btn = new NewSkinButton();
               this.Jueshijiaren2Btn.skin = "ynjueshijiarenBtn";
               this.btnSpr.addChild(this.Jueshijiaren2Btn);
               this.Jueshijiaren2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.Jueshijiaren2Btn.visible = param1;
         }
         else if(Boolean(this.Jueshijiaren2Btn) && Boolean(this.Jueshijiaren2Btn.parent))
         {
            this.Jueshijiaren2Btn.parent.removeChild(this.Jueshijiaren2Btn);
            this.Jueshijiaren2Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setJueshijiaren3BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.Jueshijiaren3Btn == null)
            {
               this.Jueshijiaren3Btn = new NewSkinButton();
               this.Jueshijiaren3Btn.skin = "ynjueshijiarenBtn";
               this.btnSpr.addChild(this.Jueshijiaren3Btn);
               this.Jueshijiaren3Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.Jueshijiaren3Btn.visible = param1;
         }
         else if(Boolean(this.Jueshijiaren3Btn) && Boolean(this.Jueshijiaren3Btn.parent))
         {
            this.Jueshijiaren3Btn.parent.removeChild(this.Jueshijiaren3Btn);
            this.Jueshijiaren3Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setAiqingtangguoBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.AiqingtangguoBtn == null)
            {
               this.AiqingtangguoBtn = new NewSkinButton();
               this.AiqingtangguoBtn.skin = "ynaiqingtangguoBtn";
               this.btnSpr.addChild(this.AiqingtangguoBtn);
               this.AiqingtangguoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.AiqingtangguoBtn.visible = param1;
         }
         else if(Boolean(this.AiqingtangguoBtn) && Boolean(this.AiqingtangguoBtn.parent))
         {
            this.AiqingtangguoBtn.parent.removeChild(this.AiqingtangguoBtn);
            this.AiqingtangguoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setAidehuibaoBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.AidehuibaoBtn == null)
            {
               this.AidehuibaoBtn = new NewSkinButton();
               this.AidehuibaoBtn.skin = "ynaidehuibaoBtn";
               this.btnSpr.addChild(this.AidehuibaoBtn);
               this.AidehuibaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.AidehuibaoBtn.visible = param1;
         }
         else if(Boolean(this.AidehuibaoBtn) && Boolean(this.AidehuibaoBtn.parent))
         {
            this.AidehuibaoBtn.parent.removeChild(this.AidehuibaoBtn);
            this.AidehuibaoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setZhongyuanbaobiaoBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ZhongyuanbaobiaoBtn == null)
            {
               this.ZhongyuanbaobiaoBtn = new NewSkinButton();
               this.ZhongyuanbaobiaoBtn.skin = "ynzhongyuanbaobiaoBtn";
               this.btnSpr.addChild(this.ZhongyuanbaobiaoBtn);
               this.ZhongyuanbaobiaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ZhongyuanbaobiaoBtn.visible = param1;
         }
         else if(Boolean(this.ZhongyuanbaobiaoBtn) && Boolean(this.ZhongyuanbaobiaoBtn.parent))
         {
            this.ZhongyuanbaobiaoBtn.parent.removeChild(this.ZhongyuanbaobiaoBtn);
            this.ZhongyuanbaobiaoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setOuleBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ouleBtn == null)
            {
               this.ouleBtn = new NewSkinButton();
               this.ouleBtn.skin = "ynouleBtn";
               this.btnSpr.addChild(this.ouleBtn);
               this.ouleBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ouleBtn.visible = param1;
         }
         else if(Boolean(this.ouleBtn) && Boolean(this.ouleBtn.parent))
         {
            this.ouleBtn.parent.removeChild(this.ouleBtn);
            this.ouleBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYurenjieBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynyurenjieBtn == null)
            {
               this.ynyurenjieBtn = new NewSkinButton();
               this.ynyurenjieBtn.skin = "ynyurenjieBtn";
               this.btnSpr.addChild(this.ynyurenjieBtn);
               this.ynyurenjieBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynyurenjieBtn.visible = param1;
         }
         else if(Boolean(this.ynyurenjieBtn) && Boolean(this.ynyurenjieBtn.parent))
         {
            this.ynyurenjieBtn.parent.removeChild(this.ynyurenjieBtn);
            this.ynyurenjieBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setXiongwangdaliBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.xiongwangdaliBtn == null)
            {
               this.xiongwangdaliBtn = new NewSkinButton();
               this.xiongwangdaliBtn.skin = "2018xiongwang_Button";
               this.btnSpr.addChild(this.xiongwangdaliBtn);
               this.xiongwangdaliBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.xiongwangdaliBtn.visible = param1;
         }
         else if(Boolean(this.xiongwangdaliBtn) && Boolean(this.xiongwangdaliBtn.parent))
         {
            this.xiongwangdaliBtn.parent.removeChild(this.xiongwangdaliBtn);
            this.xiongwangdaliBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setTiandaoBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.TiandaoBtn == null)
            {
               this.TiandaoBtn = new NewSkinButton();
               this.TiandaoBtn.skin = "yntiandaoBtn";
               this.btnSpr.addChild(this.TiandaoBtn);
               this.TiandaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.TiandaoBtn.visible = param1;
         }
         else if(Boolean(this.TiandaoBtn) && Boolean(this.TiandaoBtn.parent))
         {
            this.TiandaoBtn.parent.removeChild(this.TiandaoBtn);
            this.TiandaoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setZhuixunxianglongBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ZhuixunxianglongBtn == null)
            {
               this.ZhuixunxianglongBtn = new NewSkinButton();
               this.ZhuixunxianglongBtn.skin = "ynzhuixunxianglongBtn";
               this.btnSpr.addChild(this.ZhuixunxianglongBtn);
               this.ZhuixunxianglongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ZhuixunxianglongBtn.visible = param1;
         }
         else if(Boolean(this.ZhuixunxianglongBtn) && Boolean(this.ZhuixunxianglongBtn.parent))
         {
            this.ZhuixunxianglongBtn.parent.removeChild(this.ZhuixunxianglongBtn);
            this.ZhuixunxianglongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYouhuizhouqiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.YouhuizhouqiBtn == null)
            {
               this.YouhuizhouqiBtn = new NewSkinButton();
               this.YouhuizhouqiBtn.skin = "ynyouhuizhouqiBtn";
               this.btnSpr.addChild(this.YouhuizhouqiBtn);
               this.YouhuizhouqiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.YouhuizhouqiBtn.visible = param1;
         }
         else if(Boolean(this.YouhuizhouqiBtn) && Boolean(this.YouhuizhouqiBtn.parent))
         {
            this.YouhuizhouqiBtn.parent.removeChild(this.YouhuizhouqiBtn);
            this.YouhuizhouqiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNSanYueDiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynSanYueDiBtn == null)
            {
               this.ynSanYueDiBtn = new NewSkinButton();
               this.ynSanYueDiBtn.skin = "ynsanyuediBtn";
               this.btnSpr.addChild(this.ynSanYueDiBtn);
               this.ynSanYueDiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynSanYueDiBtn.visible = param1;
         }
         else if(Boolean(this.ynSanYueDiBtn) && Boolean(this.ynSanYueDiBtn.parent))
         {
            this.ynSanYueDiBtn.parent.removeChild(this.ynSanYueDiBtn);
            this.ynSanYueDiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNShenghuoVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynShenghuoBtn == null)
            {
               this.ynShenghuoBtn = new NewSkinButton();
               this.ynShenghuoBtn.skin = "ynshenghuoBtn";
               this.btnSpr.addChild(this.ynShenghuoBtn);
               this.ynShenghuoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynShenghuoBtn.visible = param1;
         }
         else if(Boolean(this.ynShenghuoBtn) && Boolean(this.ynShenghuoBtn.parent))
         {
            this.ynShenghuoBtn.parent.removeChild(this.ynShenghuoBtn);
            this.ynShenghuoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNShenfengVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynShenfengBtn == null)
            {
               this.ynShenfengBtn = new NewSkinButton();
               this.ynShenfengBtn.skin = "ynshenfengBtn";
               this.btnSpr.addChild(this.ynShenfengBtn);
               this.ynShenfengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynShenfengBtn.visible = param1;
         }
         else if(Boolean(this.ynShenfengBtn) && Boolean(this.ynShenfengBtn.parent))
         {
            this.ynShenfengBtn.parent.removeChild(this.ynShenfengBtn);
            this.ynShenfengBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNWulinzhibaoVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWulinzhibaoBtn == null)
            {
               this.ynWulinzhibaoBtn = new NewSkinButton();
               this.ynWulinzhibaoBtn.skin = "ynwulinzhibaoBtn";
               this.btnSpr.addChild(this.ynWulinzhibaoBtn);
               this.ynWulinzhibaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWulinzhibaoBtn.visible = param1;
         }
         else if(Boolean(this.ynWulinzhibaoBtn) && Boolean(this.ynWulinzhibaoBtn.parent))
         {
            this.ynWulinzhibaoBtn.parent.removeChild(this.ynWulinzhibaoBtn);
            this.ynWulinzhibaoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNWangzhezhibang5Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWangzhezhibang5Btn == null)
            {
               this.ynWangzhezhibang5Btn = new NewSkinButton();
               this.ynWangzhezhibang5Btn.skin = "ynwangzhezhibang5Btn";
               this.btnSpr.addChild(this.ynWangzhezhibang5Btn);
               this.ynWangzhezhibang5Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWangzhezhibang5Btn.visible = param1;
         }
         else if(Boolean(this.ynWangzhezhibang5Btn) && Boolean(this.ynWangzhezhibang5Btn.parent))
         {
            this.ynWangzhezhibang5Btn.parent.removeChild(this.ynWangzhezhibang5Btn);
            this.ynWangzhezhibang5Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNBumiezhuqueVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynBumiezhuqueBtn == null)
            {
               this.ynBumiezhuqueBtn = new NewSkinButton();
               this.ynBumiezhuqueBtn.skin = "ynbumiezhuqueBtn";
               this.btnSpr.addChild(this.ynBumiezhuqueBtn);
               this.ynBumiezhuqueBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynBumiezhuqueBtn.visible = param1;
         }
         else if(Boolean(this.ynBumiezhuqueBtn) && Boolean(this.ynBumiezhuqueBtn.parent))
         {
            this.ynBumiezhuqueBtn.parent.removeChild(this.ynBumiezhuqueBtn);
            this.ynBumiezhuqueBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNJingyingjuhuiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynJingyingjuhuiBtn == null)
            {
               this.ynJingyingjuhuiBtn = new NewSkinButton();
               this.ynJingyingjuhuiBtn.skin = "ynjingyingjuhuiBtn";
               this.btnSpr.addChild(this.ynJingyingjuhuiBtn);
               this.ynJingyingjuhuiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynJingyingjuhuiBtn.visible = param1;
         }
         else if(Boolean(this.ynJingyingjuhuiBtn) && Boolean(this.ynJingyingjuhuiBtn.parent))
         {
            this.ynJingyingjuhuiBtn.parent.removeChild(this.ynJingyingjuhuiBtn);
            this.ynJingyingjuhuiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYNKaizhan5Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynKaizhan5Btn == null)
            {
               this.ynKaizhan5Btn = new NewSkinButton();
               this.ynKaizhan5Btn.skin = "ynkaizhan5Btn";
               this.btnSpr.addChild(this.ynKaizhan5Btn);
               this.ynKaizhan5Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynKaizhan5Btn.visible = param1;
         }
         else if(Boolean(this.ynKaizhan5Btn) && Boolean(this.ynKaizhan5Btn.parent))
         {
            this.ynKaizhan5Btn.parent.removeChild(this.ynKaizhan5Btn);
            this.ynKaizhan5Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setDuanWuJie2015BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.duanwujie2015Btn == null)
            {
               this.duanwujie2015Btn = new NewSkinButton();
               this.duanwujie2015Btn.skin = "gwgc_Button";
               this.btnSpr.addChild(this.duanwujie2015Btn);
               this.duanwujie2015Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.duanwujie2015Btn.visible = param1;
         }
         else if(Boolean(this.duanwujie2015Btn) && Boolean(this.duanwujie2015Btn.parent))
         {
            this.duanwujie2015Btn.parent.removeChild(this.duanwujie2015Btn);
            this.duanwujie2015Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setQuanlongBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynQuanlongBtn == null)
            {
               this.ynQuanlongBtn = new NewSkinButton();
               this.ynQuanlongBtn.skin = "quanlongBtn";
               this.btnSpr.addChild(this.ynQuanlongBtn);
               this.ynQuanlongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynQuanlongBtn.visible = param1;
         }
         else if(Boolean(this.ynQuanlongBtn) && Boolean(this.ynQuanlongBtn.parent))
         {
            this.ynQuanlongBtn.parent.removeChild(this.ynQuanlongBtn);
            this.ynQuanlongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWulinmijiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWulinmijiBtn == null)
            {
               this.ynWulinmijiBtn = new NewSkinButton();
               this.ynWulinmijiBtn.skin = "wulinmijiBtn";
               this.btnSpr.addChild(this.ynWulinmijiBtn);
               this.ynWulinmijiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWulinmijiBtn.visible = param1;
         }
         else if(Boolean(this.ynWulinmijiBtn) && Boolean(this.ynWulinmijiBtn.parent))
         {
            this.ynWulinmijiBtn.parent.removeChild(this.ynWulinmijiBtn);
            this.ynWulinmijiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setTianshizhouqiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynTianshizhouqiBtn == null)
            {
               this.ynTianshizhouqiBtn = new NewSkinButton();
               this.ynTianshizhouqiBtn.skin = "tianshizhouqiBtn";
               this.btnSpr.addChild(this.ynTianshizhouqiBtn);
               this.ynTianshizhouqiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynTianshizhouqiBtn.visible = param1;
         }
         else if(Boolean(this.ynTianshizhouqiBtn) && Boolean(this.ynTianshizhouqiBtn.parent))
         {
            this.ynTianshizhouqiBtn.parent.removeChild(this.ynTianshizhouqiBtn);
            this.ynTianshizhouqiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setSiyuediBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynSiyuediBtn == null)
            {
               this.ynSiyuediBtn = new NewSkinButton();
               this.ynSiyuediBtn.skin = "siyuediBtn";
               this.btnSpr.addChild(this.ynSiyuediBtn);
               this.ynSiyuediBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynSiyuediBtn.visible = param1;
         }
         else if(Boolean(this.ynSiyuediBtn) && Boolean(this.ynSiyuediBtn.parent))
         {
            this.ynSiyuediBtn.parent.removeChild(this.ynSiyuediBtn);
            this.ynSiyuediBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setZhanshenzhongyuanBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhanshenzhongyuanBtn == null)
            {
               this.ynZhanshenzhongyuanBtn = new NewSkinButton();
               this.ynZhanshenzhongyuanBtn.skin = "zhanshenzhongyuanBtn";
               this.btnSpr.addChild(this.ynZhanshenzhongyuanBtn);
               this.ynZhanshenzhongyuanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhanshenzhongyuanBtn.visible = param1;
         }
         else if(Boolean(this.ynZhanshenzhongyuanBtn) && Boolean(this.ynZhanshenzhongyuanBtn.parent))
         {
            this.ynZhanshenzhongyuanBtn.parent.removeChild(this.ynZhanshenzhongyuanBtn);
            this.ynZhanshenzhongyuanBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setDajieyouhuiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynDajieyouhuiBtn == null)
            {
               this.ynDajieyouhuiBtn = new NewSkinButton();
               this.ynDajieyouhuiBtn.skin = "dajieyouhuiBtn";
               this.btnSpr.addChild(this.ynDajieyouhuiBtn);
               this.ynDajieyouhuiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynDajieyouhuiBtn.visible = param1;
         }
         else if(Boolean(this.ynDajieyouhuiBtn) && Boolean(this.ynDajieyouhuiBtn.parent))
         {
            this.ynDajieyouhuiBtn.parent.removeChild(this.ynDajieyouhuiBtn);
            this.ynDajieyouhuiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setNantianhaoqiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynNantianhaoqiBtn == null)
            {
               this.ynNantianhaoqiBtn = new NewSkinButton();
               this.ynNantianhaoqiBtn.skin = "chunjie26_Button";
               this.btnSpr.addChild(this.ynNantianhaoqiBtn);
               this.ynNantianhaoqiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynNantianhaoqiBtn.visible = param1;
         }
         else if(Boolean(this.ynNantianhaoqiBtn) && Boolean(this.ynNantianhaoqiBtn.parent))
         {
            this.ynNantianhaoqiBtn.parent.removeChild(this.ynNantianhaoqiBtn);
            this.ynNantianhaoqiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setRongguangBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynRongguanBtn == null)
            {
               this.ynRongguanBtn = new NewSkinButton();
               this.ynRongguanBtn.skin = "rongguangBtn";
               this.btnSpr.addChild(this.ynRongguanBtn);
               this.ynRongguanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynRongguanBtn.visible = param1;
         }
         else if(Boolean(this.ynRongguanBtn) && Boolean(this.ynRongguanBtn.parent))
         {
            this.ynRongguanBtn.parent.removeChild(this.ynRongguanBtn);
            this.ynRongguanBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setFodanBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynFodanBtn == null)
            {
               this.ynFodanBtn = new NewSkinButton();
               this.ynFodanBtn.skin = "fodanBtn";
               this.btnSpr.addChild(this.ynFodanBtn);
               this.ynFodanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynFodanBtn.visible = param1;
         }
         else if(Boolean(this.ynFodanBtn) && Boolean(this.ynFodanBtn.parent))
         {
            this.ynFodanBtn.parent.removeChild(this.ynFodanBtn);
            this.ynFodanBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWulindazhanBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWulindazhanBtn == null)
            {
               this.ynWulindazhanBtn = new NewSkinButton();
               this.ynWulindazhanBtn.skin = "wulindazhanBtn";
               this.btnSpr.addChild(this.ynWulindazhanBtn);
               this.ynWulindazhanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWulindazhanBtn.visible = param1;
         }
         else if(Boolean(this.ynWulindazhanBtn) && Boolean(this.ynWulindazhanBtn.parent))
         {
            this.ynWulindazhanBtn.parent.removeChild(this.ynWulindazhanBtn);
            this.ynWulindazhanBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYXMingchengBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynYXMingchengBtn == null)
            {
               this.ynYXMingchengBtn = new NewSkinButton();
               this.ynYXMingchengBtn.skin = "yingxiongmingchengBtn";
               this.btnSpr.addChild(this.ynYXMingchengBtn);
               this.ynYXMingchengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynYXMingchengBtn.visible = param1;
         }
         else if(Boolean(this.ynYXMingchengBtn) && Boolean(this.ynYXMingchengBtn.parent))
         {
            this.ynYXMingchengBtn.parent.removeChild(this.ynYXMingchengBtn);
            this.ynYXMingchengBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBaGuaZhenBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnBaGuaZhen == null)
            {
               this.btnBaGuaZhen = new NewSkinButton();
               this.btnBaGuaZhen.skin = "baguazhen_Button";
               this.btnSpr.addChild(this.btnBaGuaZhen);
               this.btnBaGuaZhen.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnBaGuaZhen.visible = param1;
         }
         else if(Boolean(this.btnBaGuaZhen) && Boolean(this.btnBaGuaZhen.parent))
         {
            this.btnBaGuaZhen.parent.removeChild(this.btnBaGuaZhen);
            this.btnBaGuaZhen = null;
         }
         this.setAnniuPosition();
      }
      
      public function setZhenpinShangchengBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhenpinShangchengBtn == null)
            {
               this.ynZhenpinShangchengBtn = new NewSkinButton();
               this.ynZhenpinShangchengBtn.skin = "zhenpinshangdianBtn";
               this.btnSpr.addChild(this.ynZhenpinShangchengBtn);
               this.ynZhenpinShangchengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhenpinShangchengBtn.visible = param1;
         }
         else if(Boolean(this.ynZhenpinShangchengBtn) && Boolean(this.ynZhenpinShangchengBtn.parent))
         {
            this.ynZhenpinShangchengBtn.parent.removeChild(this.ynZhenpinShangchengBtn);
            this.ynZhenpinShangchengBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setJuezhanShangchengBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynJuezhanShangchengBtn == null)
            {
               this.ynJuezhanShangchengBtn = new NewSkinButton();
               this.ynJuezhanShangchengBtn.skin = "juezhanshangdianBtn";
               this.btnSpr.addChild(this.ynJuezhanShangchengBtn);
               this.ynJuezhanShangchengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynJuezhanShangchengBtn.visible = param1;
         }
         else if(Boolean(this.ynJuezhanShangchengBtn) && Boolean(this.ynJuezhanShangchengBtn.parent))
         {
            this.ynJuezhanShangchengBtn.parent.removeChild(this.ynJuezhanShangchengBtn);
            this.ynJuezhanShangchengBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWandulingBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWandulingBtn == null)
            {
               this.ynWandulingBtn = new NewSkinButton();
               this.ynWandulingBtn.skin = "wandulingBtn";
               this.btnSpr.addChild(this.ynWandulingBtn);
               this.ynWandulingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWandulingBtn.visible = param1;
         }
         else if(Boolean(this.ynWandulingBtn) && Boolean(this.ynWandulingBtn.parent))
         {
            this.ynWandulingBtn.parent.removeChild(this.ynWandulingBtn);
            this.ynWandulingBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setJianghuluwuBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynJianghuluwuBtn == null)
            {
               this.ynJianghuluwuBtn = new NewSkinButton();
               this.ynJianghuluwuBtn.skin = "jianghulunwuBtn";
               this.btnSpr.addChild(this.ynJianghuluwuBtn);
               this.ynJianghuluwuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynJianghuluwuBtn.visible = param1;
         }
         else if(Boolean(this.ynJianghuluwuBtn) && Boolean(this.ynJianghuluwuBtn.parent))
         {
            this.ynJianghuluwuBtn.parent.removeChild(this.ynJianghuluwuBtn);
            this.ynJianghuluwuBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWuduBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWuduBtn == null)
            {
               this.ynWuduBtn = new NewSkinButton();
               this.ynWuduBtn.skin = "ynwudushengzhenBtn";
               this.btnSpr.addChild(this.ynWuduBtn);
               this.ynWuduBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWuduBtn.visible = param1;
         }
         else if(Boolean(this.ynWuduBtn) && Boolean(this.ynWuduBtn.parent))
         {
            this.ynWuduBtn.parent.removeChild(this.ynWuduBtn);
            this.ynWuduBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setDuijuezhouqiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynDuiJuezhouqiBtn == null)
            {
               this.ynDuiJuezhouqiBtn = new NewSkinButton();
               this.ynDuiJuezhouqiBtn.skin = "duiJueZhouQiBtn";
               this.btnSpr.addChild(this.ynDuiJuezhouqiBtn);
               this.ynDuiJuezhouqiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynDuiJuezhouqiBtn.visible = param1;
         }
         else if(Boolean(this.ynDuiJuezhouqiBtn) && Boolean(this.ynDuiJuezhouqiBtn.parent))
         {
            this.ynDuiJuezhouqiBtn.parent.removeChild(this.ynDuiJuezhouqiBtn);
            this.ynDuiJuezhouqiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function set0519BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn0519Btn == null)
            {
               this.yn0519Btn = new NewSkinButton();
               this.yn0519Btn.skin = "0519Btn";
               this.btnSpr.addChild(this.yn0519Btn);
               this.yn0519Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn0519Btn.visible = param1;
         }
         else if(Boolean(this.yn0519Btn) && Boolean(this.yn0519Btn.parent))
         {
            this.yn0519Btn.parent.removeChild(this.yn0519Btn);
            this.yn0519Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setErtongjieBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynErtongjieBtn == null)
            {
               this.ynErtongjieBtn = new NewSkinButton();
               this.ynErtongjieBtn.skin = "ynertongjieBtn";
               this.btnSpr.addChild(this.ynErtongjieBtn);
               this.ynErtongjieBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynErtongjieBtn.visible = param1;
         }
         else if(Boolean(this.ynErtongjieBtn) && Boolean(this.ynErtongjieBtn.parent))
         {
            this.ynErtongjieBtn.parent.removeChild(this.ynErtongjieBtn);
            this.ynErtongjieBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setTangmenjuejiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynTangmenjuejiBtn == null)
            {
               this.ynTangmenjuejiBtn = new NewSkinButton();
               this.ynTangmenjuejiBtn.skin = "yntangmenjuejiBtn";
               this.btnSpr.addChild(this.ynTangmenjuejiBtn);
               this.ynTangmenjuejiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynTangmenjuejiBtn.visible = param1;
         }
         else if(Boolean(this.ynTangmenjuejiBtn) && Boolean(this.ynTangmenjuejiBtn.parent))
         {
            this.ynTangmenjuejiBtn.parent.removeChild(this.ynTangmenjuejiBtn);
            this.ynTangmenjuejiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setLianbaojianBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynLianbaojianBtn == null)
            {
               this.ynLianbaojianBtn = new NewSkinButton();
               this.ynLianbaojianBtn.skin = "ynlianbaojianBtn";
               this.btnSpr.addChild(this.ynLianbaojianBtn);
               this.ynLianbaojianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynLianbaojianBtn.visible = param1;
         }
         else if(Boolean(this.ynLianbaojianBtn) && Boolean(this.ynLianbaojianBtn.parent))
         {
            this.ynLianbaojianBtn.parent.removeChild(this.ynLianbaojianBtn);
            this.ynLianbaojianBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setJianshexiangyangBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynJianshexiangyangBtn == null)
            {
               this.ynJianshexiangyangBtn = new NewSkinButton();
               this.ynJianshexiangyangBtn.skin = "ynjianshexiangyangBtn";
               this.btnSpr.addChild(this.ynJianshexiangyangBtn);
               this.ynJianshexiangyangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynJianshexiangyangBtn.visible = param1;
         }
         else if(Boolean(this.ynJianshexiangyangBtn) && Boolean(this.ynJianshexiangyangBtn.parent))
         {
            this.ynJianshexiangyangBtn.parent.removeChild(this.ynJianshexiangyangBtn);
            this.ynJianshexiangyangBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setKuangbaoBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynKuangbaoBtn == null)
            {
               this.ynKuangbaoBtn = new NewSkinButton();
               this.ynKuangbaoBtn.skin = "ynkuangbaoBtn";
               this.btnSpr.addChild(this.ynKuangbaoBtn);
               this.ynKuangbaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynKuangbaoBtn.visible = param1;
         }
         else if(Boolean(this.ynKuangbaoBtn) && Boolean(this.ynKuangbaoBtn.parent))
         {
            this.ynKuangbaoBtn.parent.removeChild(this.ynKuangbaoBtn);
            this.ynKuangbaoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setDianfengzhouqiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynDianfengzhouqiBtn == null)
            {
               this.ynDianfengzhouqiBtn = new NewSkinButton();
               this.ynDianfengzhouqiBtn.skin = "yndianfengzhouqiBtn";
               this.btnSpr.addChild(this.ynDianfengzhouqiBtn);
               this.ynDianfengzhouqiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynDianfengzhouqiBtn.visible = param1;
         }
         else if(Boolean(this.ynDianfengzhouqiBtn) && Boolean(this.ynDianfengzhouqiBtn.parent))
         {
            this.ynDianfengzhouqiBtn.parent.removeChild(this.ynDianfengzhouqiBtn);
            this.ynDianfengzhouqiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setQingzhuBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynQingzhuBtn == null)
            {
               this.ynQingzhuBtn = new NewSkinButton();
               this.ynQingzhuBtn.skin = "ynqingzhuBtn";
               this.btnSpr.addChild(this.ynQingzhuBtn);
               this.ynQingzhuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynQingzhuBtn.visible = param1;
         }
         else if(Boolean(this.ynQingzhuBtn) && Boolean(this.ynQingzhuBtn.parent))
         {
            this.ynQingzhuBtn.parent.removeChild(this.ynQingzhuBtn);
            this.ynQingzhuBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setMeitianyouhuiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynMeitianyouhuiBtn == null)
            {
               this.ynMeitianyouhuiBtn = new NewSkinButton();
               this.ynMeitianyouhuiBtn.skin = "ynmieqongBtn";
               this.btnSpr.addChild(this.ynMeitianyouhuiBtn);
               this.ynMeitianyouhuiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynMeitianyouhuiBtn.visible = param1;
         }
         else if(Boolean(this.ynMeitianyouhuiBtn) && Boolean(this.ynMeitianyouhuiBtn.parent))
         {
            this.ynMeitianyouhuiBtn.parent.removeChild(this.ynMeitianyouhuiBtn);
            this.ynMeitianyouhuiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setShenfengBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynShenfeng1Btn == null)
            {
               this.ynShenfeng1Btn = new NewSkinButton();
               this.ynShenfeng1Btn.skin = "ynshenfengBtn";
               this.btnSpr.addChild(this.ynShenfeng1Btn);
               this.ynShenfeng1Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynShenfeng1Btn.visible = param1;
         }
         else if(Boolean(this.ynShenfeng1Btn) && Boolean(this.ynShenfeng1Btn.parent))
         {
            this.ynShenfeng1Btn.parent.removeChild(this.ynShenfeng1Btn);
            this.ynShenfeng1Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setZhenpinShangcheng2BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhenpinShangcheng2Btn == null)
            {
               this.ynZhenpinShangcheng2Btn = new NewSkinButton();
               this.ynZhenpinShangcheng2Btn.skin = "zhenpinshangdianBtn";
               this.btnSpr.addChild(this.ynZhenpinShangcheng2Btn);
               this.ynZhenpinShangcheng2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhenpinShangcheng2Btn.visible = param1;
         }
         else if(Boolean(this.ynZhenpinShangcheng2Btn) && Boolean(this.ynZhenpinShangcheng2Btn.parent))
         {
            this.ynZhenpinShangcheng2Btn.parent.removeChild(this.ynZhenpinShangcheng2Btn);
            this.ynZhenpinShangcheng2Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setJuezhanShangcheng2BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynJuezhanShangcheng2Btn == null)
            {
               this.ynJuezhanShangcheng2Btn = new NewSkinButton();
               this.ynJuezhanShangcheng2Btn.skin = "juezhanshangdianBtn";
               this.btnSpr.addChild(this.ynJuezhanShangcheng2Btn);
               this.ynJuezhanShangcheng2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynJuezhanShangcheng2Btn.visible = param1;
         }
         else if(Boolean(this.ynJuezhanShangcheng2Btn) && Boolean(this.ynJuezhanShangcheng2Btn.parent))
         {
            this.ynJuezhanShangcheng2Btn.parent.removeChild(this.ynJuezhanShangcheng2Btn);
            this.ynJuezhanShangcheng2Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setMeitianyouhui2BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynMeitianyouhui2Btn == null)
            {
               this.ynMeitianyouhui2Btn = new NewSkinButton();
               this.ynMeitianyouhui2Btn.skin = "yn2016mtyhBtn";
               this.btnSpr.addChild(this.ynMeitianyouhui2Btn);
               this.ynMeitianyouhui2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynMeitianyouhui2Btn.visible = param1;
         }
         else if(Boolean(this.ynMeitianyouhui2Btn) && Boolean(this.ynMeitianyouhui2Btn.parent))
         {
            this.ynMeitianyouhui2Btn.parent.removeChild(this.ynMeitianyouhui2Btn);
            this.ynMeitianyouhui2Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setHuoyueBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynHuoyueBtn == null)
            {
               this.ynHuoyueBtn = new NewSkinButton();
               this.ynHuoyueBtn.skin = "ynhuoyueBtn";
               this.btnSpr.addChild(this.ynHuoyueBtn);
               this.ynHuoyueBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynHuoyueBtn.visible = param1;
         }
         else if(Boolean(this.ynHuoyueBtn) && Boolean(this.ynHuoyueBtn.parent))
         {
            this.ynHuoyueBtn.parent.removeChild(this.ynHuoyueBtn);
            this.ynHuoyueBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setShiJianShaLouBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.shijianshalouBtn == null)
            {
               this.shijianshalouBtn = new NewSkinButton();
               this.shijianshalouBtn.skin = "shijianshalou_shalou_Button";
               this.shijianshalouBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "Hạt bụi thời gian" + "</font>";
               this.btnSpr.addChild(this.shijianshalouBtn);
               this.shijianshalouBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.shijianshalouBtn.visible = param1;
         }
         else if(Boolean(this.shijianshalouBtn) && Boolean(this.shijianshalouBtn.parent))
         {
            this.shijianshalouBtn.parent.removeChild(this.shijianshalouBtn);
            this.shijianshalouBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWudushengzhen1BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynwudushengzhen1Btn == null)
            {
               this.ynwudushengzhen1Btn = new NewSkinButton();
               this.ynwudushengzhen1Btn.skin = "ynwudushengzhenBtn";
               this.btnSpr.addChild(this.ynwudushengzhen1Btn);
               this.ynwudushengzhen1Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynwudushengzhen1Btn.visible = param1;
         }
         else if(Boolean(this.ynwudushengzhen1Btn) && Boolean(this.ynwudushengzhen1Btn.parent))
         {
            this.ynwudushengzhen1Btn.parent.removeChild(this.ynwudushengzhen1Btn);
            this.ynwudushengzhen1Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWudushengzhen2BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynwudushengzhen2Btn == null)
            {
               this.ynwudushengzhen2Btn = new NewSkinButton();
               this.ynwudushengzhen2Btn.skin = "ynwudushengzhenBtn";
               this.btnSpr.addChild(this.ynwudushengzhen2Btn);
               this.ynwudushengzhen2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynwudushengzhen2Btn.visible = param1;
         }
         else if(Boolean(this.ynwudushengzhen2Btn) && Boolean(this.ynwudushengzhen2Btn.parent))
         {
            this.ynwudushengzhen2Btn.parent.removeChild(this.ynwudushengzhen2Btn);
            this.ynwudushengzhen2Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setTengtianyu3BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynTengtianyu3Btn == null)
            {
               this.ynTengtianyu3Btn = new NewSkinButton();
               this.ynTengtianyu3Btn.skin = "yntengtianyu";
               this.btnSpr.addChild(this.ynTengtianyu3Btn);
               this.ynTengtianyu3Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynTengtianyu3Btn.visible = param1;
         }
         else if(Boolean(this.ynTengtianyu3Btn) && Boolean(this.ynTengtianyu3Btn.parent))
         {
            this.ynTengtianyu3Btn.parent.removeChild(this.ynTengtianyu3Btn);
            this.ynTengtianyu3Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setJinye1BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynjingye1Btn == null)
            {
               this.ynjingye1Btn = new NewSkinButton();
               this.ynjingye1Btn.skin = "ynjinye";
               this.btnSpr.addChild(this.ynjingye1Btn);
               this.ynjingye1Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynjingye1Btn.visible = param1;
         }
         else if(Boolean(this.ynjingye1Btn) && Boolean(this.ynjingye1Btn.parent))
         {
            this.ynjingye1Btn.parent.removeChild(this.ynjingye1Btn);
            this.ynjingye1Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setLiuyueyuanmanBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynLiuyueyuanmanBtn == null)
            {
               this.ynLiuyueyuanmanBtn = new NewSkinButton();
               this.ynLiuyueyuanmanBtn.skin = "ynliuyueyuanman";
               this.btnSpr.addChild(this.ynLiuyueyuanmanBtn);
               this.ynLiuyueyuanmanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynLiuyueyuanmanBtn.visible = param1;
         }
         else if(Boolean(this.ynLiuyueyuanmanBtn) && Boolean(this.ynLiuyueyuanmanBtn.parent))
         {
            this.ynLiuyueyuanmanBtn.parent.removeChild(this.ynLiuyueyuanmanBtn);
            this.ynLiuyueyuanmanBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setLiuyueqingzhuVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynLiuyueqingzhuBtn == null)
            {
               this.ynLiuyueqingzhuBtn = new NewSkinButton();
               this.ynLiuyueqingzhuBtn.skin = "ynliuyueqingzhu";
               this.btnSpr.addChild(this.ynLiuyueqingzhuBtn);
               this.ynLiuyueqingzhuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynLiuyueqingzhuBtn.visible = param1;
         }
         else if(Boolean(this.ynLiuyueqingzhuBtn) && Boolean(this.ynLiuyueqingzhuBtn.parent))
         {
            this.ynLiuyueqingzhuBtn.parent.removeChild(this.ynLiuyueqingzhuBtn);
            this.ynLiuyueqingzhuBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setFangfengzheng170621Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynFangfengzheng170621Btn == null)
            {
               this.ynFangfengzheng170621Btn = new NewSkinButton();
               this.ynFangfengzheng170621Btn.skin = "ynfangfengzheng";
               this.btnSpr.addChild(this.ynFangfengzheng170621Btn);
               this.ynFangfengzheng170621Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynFangfengzheng170621Btn.visible = param1;
         }
         else if(Boolean(this.ynFangfengzheng170621Btn) && Boolean(this.ynFangfengzheng170621Btn.parent))
         {
            this.ynFangfengzheng170621Btn.parent.removeChild(this.ynFangfengzheng170621Btn);
            this.ynFangfengzheng170621Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setLiuyuediVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynLiuyuediBtn == null)
            {
               this.ynLiuyuediBtn = new NewSkinButton();
               this.ynLiuyuediBtn.skin = "11yuedi_Button";
               this.btnSpr.addChild(this.ynLiuyuediBtn);
               this.ynLiuyuediBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynLiuyuediBtn.visible = param1;
         }
         else if(Boolean(this.ynLiuyuediBtn) && Boolean(this.ynLiuyuediBtn.parent))
         {
            this.ynLiuyuediBtn.parent.removeChild(this.ynLiuyuediBtn);
            this.ynLiuyuediBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setChewuquanVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynChewuquanBtn == null)
            {
               this.ynChewuquanBtn = new NewSkinButton();
               this.ynChewuquanBtn.skin = "ynchewuquan";
               this.btnSpr.addChild(this.ynChewuquanBtn);
               this.ynChewuquanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynChewuquanBtn.visible = param1;
         }
         else if(Boolean(this.ynChewuquanBtn) && Boolean(this.ynChewuquanBtn.parent))
         {
            this.ynChewuquanBtn.parent.removeChild(this.ynChewuquanBtn);
            this.ynChewuquanBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWudushengzhen3BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynwudushengzhen3Btn == null)
            {
               this.ynwudushengzhen3Btn = new NewSkinButton();
               this.ynwudushengzhen3Btn.skin = "ynwudushengzhenBtn";
               this.btnSpr.addChild(this.ynwudushengzhen3Btn);
               this.ynwudushengzhen3Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynwudushengzhen3Btn.visible = param1;
         }
         else if(Boolean(this.ynwudushengzhen3Btn) && Boolean(this.ynwudushengzhen3Btn.parent))
         {
            this.ynwudushengzhen3Btn.parent.removeChild(this.ynwudushengzhen3Btn);
            this.ynwudushengzhen3Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWudushengzhen4BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynwudushengzhen4Btn == null)
            {
               this.ynwudushengzhen4Btn = new NewSkinButton();
               this.ynwudushengzhen4Btn.skin = "ynwudushengzhenBtn";
               this.btnSpr.addChild(this.ynwudushengzhen4Btn);
               this.ynwudushengzhen4Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynwudushengzhen4Btn.visible = param1;
         }
         else if(Boolean(this.ynwudushengzhen4Btn) && Boolean(this.ynwudushengzhen4Btn.parent))
         {
            this.ynwudushengzhen4Btn.parent.removeChild(this.ynwudushengzhen4Btn);
            this.ynwudushengzhen4Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWudushengzhen5BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynwudushengzhen5Btn == null)
            {
               this.ynwudushengzhen5Btn = new NewSkinButton();
               this.ynwudushengzhen5Btn.skin = "yntengtianyu22";
               this.btnSpr.addChild(this.ynwudushengzhen5Btn);
               this.ynwudushengzhen5Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynwudushengzhen5Btn.visible = param1;
         }
         else if(Boolean(this.ynwudushengzhen5Btn) && Boolean(this.ynwudushengzhen5Btn.parent))
         {
            this.ynwudushengzhen5Btn.parent.removeChild(this.ynwudushengzhen5Btn);
            this.ynwudushengzhen5Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWudushengzhen6BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynwudushengzhen6Btn == null)
            {
               this.ynwudushengzhen6Btn = new NewSkinButton();
               this.ynwudushengzhen6Btn.skin = "yntengtianyu22";
               this.btnSpr.addChild(this.ynwudushengzhen6Btn);
               this.ynwudushengzhen6Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynwudushengzhen6Btn.visible = param1;
         }
         else if(Boolean(this.ynwudushengzhen6Btn) && Boolean(this.ynwudushengzhen6Btn.parent))
         {
            this.ynwudushengzhen6Btn.parent.removeChild(this.ynwudushengzhen6Btn);
            this.ynwudushengzhen6Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setMeitianchongzhilibaoBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynMeitianchongzhilibaoBtn == null)
            {
               this.ynMeitianchongzhilibaoBtn = new NewSkinButton();
               this.ynMeitianchongzhilibaoBtn.skin = "ynmeitianchongzhilibao";
               this.btnSpr.addChild(this.ynMeitianchongzhilibaoBtn);
               this.ynMeitianchongzhilibaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynMeitianchongzhilibaoBtn.visible = param1;
         }
         else if(Boolean(this.ynMeitianchongzhilibaoBtn) && Boolean(this.ynMeitianchongzhilibaoBtn.parent))
         {
            this.ynMeitianchongzhilibaoBtn.parent.removeChild(this.ynMeitianchongzhilibaoBtn);
            this.ynMeitianchongzhilibaoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setShenshougumuBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynShenshougumuBtn == null)
            {
               this.ynShenshougumuBtn = new NewSkinButton();
               this.ynShenshougumuBtn.skin = "ynshenshougumu";
               this.btnSpr.addChild(this.ynShenshougumuBtn);
               this.ynShenshougumuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynShenshougumuBtn.visible = param1;
         }
         else if(Boolean(this.ynShenshougumuBtn) && Boolean(this.ynShenshougumuBtn.parent))
         {
            this.ynShenshougumuBtn.parent.removeChild(this.ynShenshougumuBtn);
            this.ynShenshougumuBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setFeilongshenbaoBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynFeilongshenbaoBtn == null)
            {
               this.ynFeilongshenbaoBtn = new NewSkinButton();
               this.ynFeilongshenbaoBtn.skin = "ynfeilong";
               this.btnSpr.addChild(this.ynFeilongshenbaoBtn);
               this.ynFeilongshenbaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynFeilongshenbaoBtn.visible = param1;
         }
         else if(Boolean(this.ynFeilongshenbaoBtn) && Boolean(this.ynFeilongshenbaoBtn.parent))
         {
            this.ynFeilongshenbaoBtn.parent.removeChild(this.ynFeilongshenbaoBtn);
            this.ynFeilongshenbaoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setDishiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynDishiBtn == null)
            {
               this.ynDishiBtn = new NewSkinButton();
               this.ynDishiBtn.skin = "yndishi";
               this.btnSpr.addChild(this.ynDishiBtn);
               this.ynDishiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynDishiBtn.visible = param1;
         }
         else if(Boolean(this.ynDishiBtn) && Boolean(this.ynDishiBtn.parent))
         {
            this.ynDishiBtn.parent.removeChild(this.ynDishiBtn);
            this.ynDishiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setNewTengtianyu1BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynNewTengtianyu1Btn == null)
            {
               this.ynNewTengtianyu1Btn = new NewSkinButton();
               this.ynNewTengtianyu1Btn.skin = "yntengtianyu22";
               this.btnSpr.addChild(this.ynNewTengtianyu1Btn);
               this.ynNewTengtianyu1Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynNewTengtianyu1Btn.visible = param1;
         }
         else if(Boolean(this.ynNewTengtianyu1Btn) && Boolean(this.ynNewTengtianyu1Btn.parent))
         {
            this.ynNewTengtianyu1Btn.parent.removeChild(this.ynNewTengtianyu1Btn);
            this.ynNewTengtianyu1Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setNewTengtianyu2BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynNewTengtianyu2Btn == null)
            {
               this.ynNewTengtianyu2Btn = new NewSkinButton();
               this.ynNewTengtianyu2Btn.skin = "yntengtianyu22";
               this.btnSpr.addChild(this.ynNewTengtianyu2Btn);
               this.ynNewTengtianyu2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynNewTengtianyu2Btn.visible = param1;
         }
         else if(Boolean(this.ynNewTengtianyu2Btn) && Boolean(this.ynNewTengtianyu2Btn.parent))
         {
            this.ynNewTengtianyu2Btn.parent.removeChild(this.ynNewTengtianyu2Btn);
            this.ynNewTengtianyu2Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setNewTengtianyu3BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynNewTengtianyu3Btn == null)
            {
               this.ynNewTengtianyu3Btn = new NewSkinButton();
               this.ynNewTengtianyu3Btn.skin = "yntengtianyu22";
               this.btnSpr.addChild(this.ynNewTengtianyu3Btn);
               this.ynNewTengtianyu3Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynNewTengtianyu3Btn.visible = param1;
         }
         else if(Boolean(this.ynNewTengtianyu3Btn) && Boolean(this.ynNewTengtianyu3Btn.parent))
         {
            this.ynNewTengtianyu3Btn.parent.removeChild(this.ynNewTengtianyu3Btn);
            this.ynNewTengtianyu3Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setNewTengtianyu4BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynNewTengtianyu4Btn == null)
            {
               this.ynNewTengtianyu4Btn = new NewSkinButton();
               this.ynNewTengtianyu4Btn.skin = "yntengtianyu22";
               this.btnSpr.addChild(this.ynNewTengtianyu4Btn);
               this.ynNewTengtianyu4Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynNewTengtianyu4Btn.visible = param1;
         }
         else if(Boolean(this.ynNewTengtianyu4Btn) && Boolean(this.ynNewTengtianyu4Btn.parent))
         {
            this.ynNewTengtianyu4Btn.parent.removeChild(this.ynNewTengtianyu4Btn);
            this.ynNewTengtianyu4Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setNewTengtianyu5BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynNewTengtianyu5Btn == null)
            {
               this.ynNewTengtianyu5Btn = new NewSkinButton();
               this.ynNewTengtianyu5Btn.skin = "yntengtianyu22";
               this.btnSpr.addChild(this.ynNewTengtianyu5Btn);
               this.ynNewTengtianyu5Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynNewTengtianyu5Btn.visible = param1;
         }
         else if(Boolean(this.ynNewTengtianyu5Btn) && Boolean(this.ynNewTengtianyu5Btn.parent))
         {
            this.ynNewTengtianyu5Btn.parent.removeChild(this.ynNewTengtianyu5Btn);
            this.ynNewTengtianyu5Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setNewTengtianyu6BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynNewTengtianyu6Btn == null)
            {
               this.ynNewTengtianyu6Btn = new NewSkinButton();
               this.ynNewTengtianyu6Btn.skin = "yntengtianyu22";
               this.btnSpr.addChild(this.ynNewTengtianyu6Btn);
               this.ynNewTengtianyu6Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynNewTengtianyu6Btn.visible = param1;
         }
         else if(Boolean(this.ynNewTengtianyu6Btn) && Boolean(this.ynNewTengtianyu6Btn.parent))
         {
            this.ynNewTengtianyu6Btn.parent.removeChild(this.ynNewTengtianyu6Btn);
            this.ynNewTengtianyu6Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setNewTengtianyu7BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynNewTengtianyu7Btn == null)
            {
               this.ynNewTengtianyu7Btn = new NewSkinButton();
               this.ynNewTengtianyu7Btn.skin = "yntengtianyu22";
               this.btnSpr.addChild(this.ynNewTengtianyu7Btn);
               this.ynNewTengtianyu7Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynNewTengtianyu7Btn.visible = param1;
         }
         else if(Boolean(this.ynNewTengtianyu7Btn) && Boolean(this.ynNewTengtianyu7Btn.parent))
         {
            this.ynNewTengtianyu7Btn.parent.removeChild(this.ynNewTengtianyu7Btn);
            this.ynNewTengtianyu7Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWei300BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWei300Btn == null)
            {
               this.ynWei300Btn = new NewSkinButton();
               this.ynWei300Btn.skin = "v300";
               this.btnSpr.addChild(this.ynWei300Btn);
               this.ynWei300Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWei300Btn.visible = param1;
         }
         else if(Boolean(this.ynWei300Btn) && Boolean(this.ynWei300Btn.parent))
         {
            this.ynWei300Btn.parent.removeChild(this.ynWei300Btn);
            this.ynWei300Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setFeishengjingjieBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynFeishengjingjieBtn == null)
            {
               this.ynFeishengjingjieBtn = new NewSkinButton();
               this.ynFeishengjingjieBtn.skin = "ynfeishengjingjie";
               this.btnSpr.addChild(this.ynFeishengjingjieBtn);
               this.ynFeishengjingjieBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynFeishengjingjieBtn.visible = param1;
         }
         else if(Boolean(this.ynFeishengjingjieBtn) && Boolean(this.ynFeishengjingjieBtn.parent))
         {
            this.ynFeishengjingjieBtn.parent.removeChild(this.ynFeishengjingjieBtn);
            this.ynFeishengjingjieBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setShouchongshijianBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynShouchongshijianBtn == null)
            {
               this.ynShouchongshijianBtn = new NewSkinButton();
               this.ynShouchongshijianBtn.skin = "ynshouchongshijian";
               this.btnSpr.addChild(this.ynShouchongshijianBtn);
               this.ynShouchongshijianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynShouchongshijianBtn.visible = param1;
         }
         else if(Boolean(this.ynShouchongshijianBtn) && Boolean(this.ynShouchongshijianBtn.parent))
         {
            this.ynShouchongshijianBtn.parent.removeChild(this.ynShouchongshijianBtn);
            this.ynShouchongshijianBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setMoshizhouqiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynMoshizhouqiBtn == null)
            {
               this.ynMoshizhouqiBtn = new NewSkinButton();
               this.ynMoshizhouqiBtn.skin = "ynmoshizhouqi";
               this.btnSpr.addChild(this.ynMoshizhouqiBtn);
               this.ynMoshizhouqiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynMoshizhouqiBtn.visible = param1;
         }
         else if(Boolean(this.ynMoshizhouqiBtn) && Boolean(this.ynMoshizhouqiBtn.parent))
         {
            this.ynMoshizhouqiBtn.parent.removeChild(this.ynMoshizhouqiBtn);
            this.ynMoshizhouqiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setXiatianzhienBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXiatianzhienBtn == null)
            {
               this.ynXiatianzhienBtn = new NewSkinButton();
               this.ynXiatianzhienBtn.skin = "ynxiatianzhien";
               this.btnSpr.addChild(this.ynXiatianzhienBtn);
               this.ynXiatianzhienBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXiatianzhienBtn.visible = param1;
         }
         else if(Boolean(this.ynXiatianzhienBtn) && Boolean(this.ynXiatianzhienBtn.parent))
         {
            this.ynXiatianzhienBtn.parent.removeChild(this.ynXiatianzhienBtn);
            this.ynXiatianzhienBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBayuetouBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynBayuetouBtn == null)
            {
               this.ynBayuetouBtn = new NewSkinButton();
               this.ynBayuetouBtn.skin = "ynbayuetou";
               this.btnSpr.addChild(this.ynBayuetouBtn);
               this.ynBayuetouBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynBayuetouBtn.visible = param1;
         }
         else if(Boolean(this.ynBayuetouBtn) && Boolean(this.ynBayuetouBtn.parent))
         {
            this.ynBayuetouBtn.parent.removeChild(this.ynBayuetouBtn);
            this.ynBayuetouBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setTonglefeishengjingjieBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynTonglefeishengjingjieBtn == null)
            {
               this.ynTonglefeishengjingjieBtn = new NewSkinButton();
               this.ynTonglefeishengjingjieBtn.skin = "yntonglefeishengjingjie";
               this.btnSpr.addChild(this.ynTonglefeishengjingjieBtn);
               this.ynTonglefeishengjingjieBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynTonglefeishengjingjieBtn.visible = param1;
         }
         else if(Boolean(this.ynTonglefeishengjingjieBtn) && Boolean(this.ynTonglefeishengjingjieBtn.parent))
         {
            this.ynTonglefeishengjingjieBtn.parent.removeChild(this.ynTonglefeishengjingjieBtn);
            this.ynTonglefeishengjingjieBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setZhanzhengBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhanzhengBtn == null)
            {
               this.ynZhanzhengBtn = new NewSkinButton();
               this.ynZhanzhengBtn.skin = "ynzhanzheng";
               this.btnSpr.addChild(this.ynZhanzhengBtn);
               this.ynZhanzhengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhanzhengBtn.visible = param1;
         }
         else if(Boolean(this.ynZhanzhengBtn) && Boolean(this.ynZhanzhengBtn.parent))
         {
            this.ynZhanzhengBtn.parent.removeChild(this.ynZhanzhengBtn);
            this.ynZhanzhengBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBuchangBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynBuchangBtn == null)
            {
               this.ynBuchangBtn = new NewSkinButton();
               this.ynBuchangBtn.skin = "ynbuchuang";
               this.btnSpr.addChild(this.ynBuchangBtn);
               this.ynBuchangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynBuchangBtn.visible = param1;
         }
         else if(Boolean(this.ynBuchangBtn) && Boolean(this.ynBuchangBtn.parent))
         {
            this.ynBuchangBtn.parent.removeChild(this.ynBuchangBtn);
            this.ynBuchangBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setMobingjingongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynMobingjingongBtn == null)
            {
               this.ynMobingjingongBtn = new NewSkinButton();
               this.ynMobingjingongBtn.skin = "ynmobingjingong";
               this.btnSpr.addChild(this.ynMobingjingongBtn);
               this.ynMobingjingongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynMobingjingongBtn.visible = param1;
         }
         else if(Boolean(this.ynMobingjingongBtn) && Boolean(this.ynMobingjingongBtn.parent))
         {
            this.ynMobingjingongBtn.parent.removeChild(this.ynMobingjingongBtn);
            this.ynMobingjingongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setZhouqiyouhuiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhouqiyouhuiBtn == null)
            {
               this.ynZhouqiyouhuiBtn = new NewSkinButton();
               this.ynZhouqiyouhuiBtn.skin = "ynzhouqiyouhui";
               this.btnSpr.addChild(this.ynZhouqiyouhuiBtn);
               this.ynZhouqiyouhuiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhouqiyouhuiBtn.visible = param1;
         }
         else if(Boolean(this.ynZhouqiyouhuiBtn) && Boolean(this.ynZhouqiyouhuiBtn.parent))
         {
            this.ynZhouqiyouhuiBtn.parent.removeChild(this.ynZhouqiyouhuiBtn);
            this.ynZhouqiyouhuiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setShenqizhouqiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynShenbingzhouqiBtn == null)
            {
               this.ynShenbingzhouqiBtn = new NewSkinButton();
               this.ynShenbingzhouqiBtn.skin = "ynshenqizhouqi";
               this.btnSpr.addChild(this.ynShenbingzhouqiBtn);
               this.ynShenbingzhouqiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynShenbingzhouqiBtn.visible = param1;
         }
         else if(Boolean(this.ynShenbingzhouqiBtn) && Boolean(this.ynShenbingzhouqiBtn.parent))
         {
            this.ynShenbingzhouqiBtn.parent.removeChild(this.ynShenbingzhouqiBtn);
            this.ynShenbingzhouqiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setGumuzhengdouVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynGumuzhengdouBtn == null)
            {
               this.ynGumuzhengdouBtn = new NewSkinButton();
               this.ynGumuzhengdouBtn.skin = "yngumuzhengdou";
               this.btnSpr.addChild(this.ynGumuzhengdouBtn);
               this.ynGumuzhengdouBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynGumuzhengdouBtn.visible = param1;
         }
         else if(Boolean(this.ynGumuzhengdouBtn) && Boolean(this.ynGumuzhengdouBtn.parent))
         {
            this.ynGumuzhengdouBtn.parent.removeChild(this.ynZhouqiyouhuiBtn);
            this.ynGumuzhengdouBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWulinshendibao1Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWulinshendibaoBtn1 == null)
            {
               this.ynWulinshendibaoBtn1 = new NewSkinButton();
               this.ynWulinshendibaoBtn1.skin = "ynwulinshendibao";
               this.btnSpr.addChild(this.ynWulinshendibaoBtn1);
               this.ynWulinshendibaoBtn1.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWulinshendibaoBtn1.visible = param1;
         }
         else if(Boolean(this.ynWulinshendibaoBtn1) && Boolean(this.ynWulinshendibaoBtn1.parent))
         {
            this.ynWulinshendibaoBtn1.parent.removeChild(this.ynWulinshendibaoBtn1);
            this.ynWulinshendibaoBtn1 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWulinshendibao2Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWulinshendibaoBtn2 == null)
            {
               this.ynWulinshendibaoBtn2 = new NewSkinButton();
               this.ynWulinshendibaoBtn2.skin = "ynwulinshendibao";
               this.btnSpr.addChild(this.ynWulinshendibaoBtn2);
               this.ynWulinshendibaoBtn2.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWulinshendibaoBtn2.visible = param1;
         }
         else if(Boolean(this.ynWulinshendibaoBtn2) && Boolean(this.ynWulinshendibaoBtn2.parent))
         {
            this.ynWulinshendibaoBtn2.parent.removeChild(this.ynWulinshendibaoBtn2);
            this.ynWulinshendibaoBtn2 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWulinshendibao3Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWulinshendibaoBtn3 == null)
            {
               this.ynWulinshendibaoBtn3 = new NewSkinButton();
               this.ynWulinshendibaoBtn3.skin = "ynwulinshendibao";
               this.btnSpr.addChild(this.ynWulinshendibaoBtn3);
               this.ynWulinshendibaoBtn3.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWulinshendibaoBtn3.visible = param1;
         }
         else if(Boolean(this.ynWulinshendibaoBtn3) && Boolean(this.ynWulinshendibaoBtn3.parent))
         {
            this.ynWulinshendibaoBtn3.parent.removeChild(this.ynWulinshendibaoBtn3);
            this.ynWulinshendibaoBtn3 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWulinshendibao4Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWulinshendibaoBtn4 == null)
            {
               this.ynWulinshendibaoBtn4 = new NewSkinButton();
               this.ynWulinshendibaoBtn4.skin = "ynwulinshendibao";
               this.btnSpr.addChild(this.ynWulinshendibaoBtn4);
               this.ynWulinshendibaoBtn4.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWulinshendibaoBtn4.visible = param1;
         }
         else if(Boolean(this.ynWulinshendibaoBtn4) && Boolean(this.ynWulinshendibaoBtn4.parent))
         {
            this.ynWulinshendibaoBtn4.parent.removeChild(this.ynWulinshendibaoBtn4);
            this.ynWulinshendibaoBtn4 = null;
         }
         this.setAnniuPosition();
      }
      
      public function set1908Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn1908Btn == null)
            {
               this.yn1908Btn = new NewSkinButton();
               this.yn1908Btn.skin = "yn1908";
               this.btnSpr.addChild(this.yn1908Btn);
               this.yn1908Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn1908Btn.visible = param1;
         }
         else if(Boolean(this.yn1908Btn) && Boolean(this.yn1908Btn.parent))
         {
            this.yn1908Btn.parent.removeChild(this.yn1908Btn);
            this.yn1908Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setQixihuodongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynQixihuodongBtn == null)
            {
               this.ynQixihuodongBtn = new NewSkinButton();
               this.ynQixihuodongBtn.skin = "ynqixihuodong";
               this.btnSpr.addChild(this.ynQixihuodongBtn);
               this.ynQixihuodongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynQixihuodongBtn.visible = param1;
         }
         else if(Boolean(this.ynQixihuodongBtn) && Boolean(this.ynQixihuodongBtn.parent))
         {
            this.ynQixihuodongBtn.parent.removeChild(this.ynQixihuodongBtn);
            this.ynQixihuodongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setNiulangzhinvVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynNiulangzhinvBtn == null)
            {
               this.ynNiulangzhinvBtn = new NewSkinButton();
               this.ynNiulangzhinvBtn.skin = "ynniulangzhinv";
               this.btnSpr.addChild(this.ynNiulangzhinvBtn);
               this.ynNiulangzhinvBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynNiulangzhinvBtn.visible = param1;
         }
         else if(Boolean(this.ynNiulangzhinvBtn) && Boolean(this.ynNiulangzhinvBtn.parent))
         {
            this.ynNiulangzhinvBtn.parent.removeChild(this.ynNiulangzhinvBtn);
            this.ynNiulangzhinvBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setLibaozhouqiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynLibaozhouqiBtn == null)
            {
               this.ynLibaozhouqiBtn = new NewSkinButton();
               this.ynLibaozhouqiBtn.skin = "libaozhouqi";
               this.btnSpr.addChild(this.ynLibaozhouqiBtn);
               this.ynLibaozhouqiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynLibaozhouqiBtn.visible = param1;
         }
         else if(Boolean(this.ynLibaozhouqiBtn) && Boolean(this.ynLibaozhouqiBtn.parent))
         {
            this.ynLibaozhouqiBtn.parent.removeChild(this.ynLibaozhouqiBtn);
            this.ynLibaozhouqiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setShijian902Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynShijian902Btn == null)
            {
               this.ynShijian902Btn = new NewSkinButton();
               this.ynShijian902Btn.skin = "shijian";
               this.btnSpr.addChild(this.ynShijian902Btn);
               this.ynShijian902Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynShijian902Btn.visible = param1;
         }
         else if(Boolean(this.ynShijian902Btn) && Boolean(this.ynShijian902Btn.parent))
         {
            this.ynShijian902Btn.parent.removeChild(this.ynShijian902Btn);
            this.ynShijian902Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYulianjieVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynYulianjieBtn == null)
            {
               this.ynYulianjieBtn = new NewSkinButton();
               this.ynYulianjieBtn.skin = "yulanjie";
               this.btnSpr.addChild(this.ynYulianjieBtn);
               this.ynYulianjieBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynYulianjieBtn.visible = param1;
         }
         else if(Boolean(this.ynYulianjieBtn) && Boolean(this.ynYulianjieBtn.parent))
         {
            this.ynYulianjieBtn.parent.removeChild(this.ynYulianjieBtn);
            this.ynYulianjieBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWexiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWeixiBtn == null)
            {
               this.ynWeixiBtn = new NewSkinButton();
               this.ynWeixiBtn.skin = "weixi";
               this.btnSpr.addChild(this.ynWeixiBtn);
               this.ynWeixiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWeixiBtn.visible = param1;
         }
         else if(Boolean(this.ynWeixiBtn) && Boolean(this.ynWeixiBtn.parent))
         {
            this.ynWeixiBtn.parent.removeChild(this.ynWeixiBtn);
            this.ynWeixiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setQiaolianjiumuVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynQiaolianjiumuBtn == null)
            {
               this.ynQiaolianjiumuBtn = new NewSkinButton();
               this.ynQiaolianjiumuBtn.skin = "qiaolianjiumu";
               this.btnSpr.addChild(this.ynQiaolianjiumuBtn);
               this.ynQiaolianjiumuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynQiaolianjiumuBtn.visible = param1;
         }
         else if(Boolean(this.ynQiaolianjiumuBtn) && Boolean(this.ynQiaolianjiumuBtn.parent))
         {
            this.ynQiaolianjiumuBtn.parent.removeChild(this.ynQiaolianjiumuBtn);
            this.ynQiaolianjiumuBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYingxionglianVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynYingxionglianBtn == null)
            {
               this.ynYingxionglianBtn = new NewSkinButton();
               this.ynYingxionglianBtn.skin = "yingxionglian";
               this.btnSpr.addChild(this.ynYingxionglianBtn);
               this.ynYingxionglianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynYingxionglianBtn.visible = param1;
         }
         else if(Boolean(this.ynYingxionglianBtn) && Boolean(this.ynYingxionglianBtn.parent))
         {
            this.ynYingxionglianBtn.parent.removeChild(this.ynYingxionglianBtn);
            this.ynYingxionglianBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setChongjiuhuodongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynChongjiuhuodongBtn == null)
            {
               this.ynChongjiuhuodongBtn = new NewSkinButton();
               this.ynChongjiuhuodongBtn.skin = "chongjiuhuodong";
               this.btnSpr.addChild(this.ynChongjiuhuodongBtn);
               this.ynChongjiuhuodongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynChongjiuhuodongBtn.visible = param1;
         }
         else if(Boolean(this.ynChongjiuhuodongBtn) && Boolean(this.ynChongjiuhuodongBtn.parent))
         {
            this.ynChongjiuhuodongBtn.parent.removeChild(this.ynChongjiuhuodongBtn);
            this.ynChongjiuhuodongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWulinzhenyuanVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWulinzhenyuanBtn == null)
            {
               this.ynWulinzhenyuanBtn = new NewSkinButton();
               this.ynWulinzhenyuanBtn.skin = "wulinzhenyuan";
               this.btnSpr.addChild(this.ynWulinzhenyuanBtn);
               this.ynWulinzhenyuanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWulinzhenyuanBtn.visible = param1;
         }
         else if(Boolean(this.ynWulinzhenyuanBtn) && Boolean(this.ynWulinzhenyuanBtn.parent))
         {
            this.ynWulinzhenyuanBtn.parent.removeChild(this.ynWulinzhenyuanBtn);
            this.ynWulinzhenyuanBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setKaixueqiqiuVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynKaixueqiqiuBtn == null)
            {
               this.ynKaixueqiqiuBtn = new NewSkinButton();
               this.ynKaixueqiqiuBtn.skin = "ruxueqiqiupaihang";
               this.btnSpr.addChild(this.ynKaixueqiqiuBtn);
               this.ynKaixueqiqiuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynKaixueqiqiuBtn.visible = param1;
         }
         else if(Boolean(this.ynKaixueqiqiuBtn) && Boolean(this.ynKaixueqiqiuBtn.parent))
         {
            this.ynKaixueqiqiuBtn.parent.removeChild(this.ynKaixueqiqiuBtn);
            this.ynKaixueqiqiuBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setQiqiuVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynQiqiuBtn == null)
            {
               this.ynQiqiuBtn = new NewSkinButton();
               this.ynQiqiuBtn.skin = "ruxueqiqiu";
               this.btnSpr.addChild(this.ynQiqiuBtn);
               this.ynQiqiuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynQiqiuBtn.visible = param1;
         }
         else if(Boolean(this.ynQiqiuBtn) && Boolean(this.ynQiqiuBtn.parent))
         {
            this.ynQiqiuBtn.parent.removeChild(this.ynQiqiuBtn);
            this.ynQiqiuBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setHuozhenjiashiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynHuozhenjiashiBtn == null)
            {
               this.ynHuozhenjiashiBtn = new NewSkinButton();
               this.ynHuozhenjiashiBtn.skin = "huozhenjiashiButton";
               this.btnSpr.addChild(this.ynHuozhenjiashiBtn);
               this.ynHuozhenjiashiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynHuozhenjiashiBtn.visible = param1;
         }
         else if(Boolean(this.ynHuozhenjiashiBtn) && Boolean(this.ynHuozhenjiashiBtn.parent))
         {
            this.ynHuozhenjiashiBtn.parent.removeChild(this.ynHuozhenjiashiBtn);
            this.ynHuozhenjiashiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setXuanswuxingjunVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynXuanwuxingjunBtn == null)
            {
               this.ynXuanwuxingjunBtn = new NewSkinButton();
               this.ynXuanwuxingjunBtn.skin = "xuanwuxingjunButton";
               this.btnSpr.addChild(this.ynXuanwuxingjunBtn);
               this.ynXuanwuxingjunBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynXuanwuxingjunBtn.visible = param1;
         }
         else if(Boolean(this.ynXuanwuxingjunBtn) && Boolean(this.ynXuanwuxingjunBtn.parent))
         {
            this.ynXuanwuxingjunBtn.parent.removeChild(this.ynXuanwuxingjunBtn);
            this.ynXuanwuxingjunBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setJingyingbicaiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynJingyingbicaiBtn == null)
            {
               this.ynJingyingbicaiBtn = new NewSkinButton();
               this.ynJingyingbicaiBtn.skin = "jingyingbicaiButton";
               this.btnSpr.addChild(this.ynJingyingbicaiBtn);
               this.ynJingyingbicaiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynJingyingbicaiBtn.visible = param1;
         }
         else if(Boolean(this.ynJingyingbicaiBtn) && Boolean(this.ynJingyingbicaiBtn.parent))
         {
            this.ynJingyingbicaiBtn.parent.removeChild(this.ynJingyingbicaiBtn);
            this.ynJingyingbicaiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYiTianTuLongBtnVisible(param1:Boolean, param2:int) : void
      {
         if(param1)
         {
            if(this.yitiantulongBtn == null)
            {
               this.yitiantulongBtn = new NewSkinButton();
               this.yitiantulongBtn.name = String(param2);
               this.yitiantulongBtn.skin = "yttlBtn";
               this.yitiantulongBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("倚天屠龙") + "</font>";
               this.btnSpr.addChild(this.yitiantulongBtn);
               this.yitiantulongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yitiantulongBtn.y = 34 - 1 - 40;
            this.yitiantulongBtn.visible = param1;
         }
         else if(Boolean(this.yitiantulongBtn) && Boolean(this.yitiantulongBtn.parent))
         {
            this.yitiantulongBtn.parent.removeChild(this.yitiantulongBtn);
            this.yitiantulongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWangbangzhengxiongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWangbangzhengxiongBtn == null)
            {
               this.ynWangbangzhengxiongBtn = new NewSkinButton();
               this.ynWangbangzhengxiongBtn.skin = "wangzhezhengxiongButton";
               this.btnSpr.addChild(this.ynWangbangzhengxiongBtn);
               this.ynWangbangzhengxiongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWangbangzhengxiongBtn.visible = param1;
         }
         else if(Boolean(this.ynWangbangzhengxiongBtn) && Boolean(this.ynWangbangzhengxiongBtn.parent))
         {
            this.ynWangbangzhengxiongBtn.parent.removeChild(this.ynWangbangzhengxiongBtn);
            this.ynWangbangzhengxiongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWangzhehuodongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWangzhehuodongBtn == null)
            {
               this.ynWangzhehuodongBtn = new NewSkinButton();
               this.ynWangzhehuodongBtn.skin = "wangzhehuodongButton";
               this.btnSpr.addChild(this.ynWangzhehuodongBtn);
               this.ynWangzhehuodongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWangzhehuodongBtn.visible = param1;
         }
         else if(Boolean(this.ynWangzhehuodongBtn) && Boolean(this.ynWangzhehuodongBtn.parent))
         {
            this.ynWangzhehuodongBtn.parent.removeChild(this.ynWangzhehuodongBtn);
            this.ynWangzhehuodongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setLiujianVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynLiujianBtn == null)
            {
               this.ynLiujianBtn = new NewSkinButton();
               this.ynLiujianBtn.skin = "liujianButton";
               this.btnSpr.addChild(this.ynLiujianBtn);
               this.ynLiujianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynLiujianBtn.visible = param1;
         }
         else if(Boolean(this.ynLiujianBtn) && Boolean(this.ynLiujianBtn.parent))
         {
            this.ynLiujianBtn.parent.removeChild(this.ynLiujianBtn);
            this.ynLiujianBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setZhongqiuhuodongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhongqiuhuodongBtn == null)
            {
               this.ynZhongqiuhuodongBtn = new NewSkinButton();
               this.ynZhongqiuhuodongBtn.skin = "zhongqiujieButton";
               this.btnSpr.addChild(this.ynZhongqiuhuodongBtn);
               this.ynZhongqiuhuodongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhongqiuhuodongBtn.visible = param1;
         }
         else if(Boolean(this.ynZhongqiuhuodongBtn) && Boolean(this.ynZhongqiuhuodongBtn.parent))
         {
            this.ynZhongqiuhuodongBtn.parent.removeChild(this.ynZhongqiuhuodongBtn);
            this.ynZhongqiuhuodongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBaihuxingjunVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynBaihuxingjunBtn == null)
            {
               this.ynBaihuxingjunBtn = new NewSkinButton();
               this.ynBaihuxingjunBtn.skin = "baihuxingjunButton";
               this.btnSpr.addChild(this.ynBaihuxingjunBtn);
               this.ynBaihuxingjunBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynBaihuxingjunBtn.visible = param1;
         }
         else if(Boolean(this.ynBaihuxingjunBtn) && Boolean(this.ynBaihuxingjunBtn.parent))
         {
            this.ynBaihuxingjunBtn.parent.removeChild(this.ynBaihuxingjunBtn);
            this.ynBaihuxingjunBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setZhongqiu2017Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhongqiu2017Btn == null)
            {
               this.ynZhongqiu2017Btn = new NewSkinButton();
               this.ynZhongqiu2017Btn.skin = "zhongqiu2017Button";
               this.btnSpr.addChild(this.ynZhongqiu2017Btn);
               this.ynZhongqiu2017Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhongqiu2017Btn.visible = param1;
         }
         else if(Boolean(this.ynZhongqiu2017Btn) && Boolean(this.ynZhongqiu2017Btn.parent))
         {
            this.ynZhongqiu2017Btn.parent.removeChild(this.ynZhongqiu2017Btn);
            this.ynZhongqiu2017Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setNewTengtianyu8BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynNewTengtianyu8Btn == null)
            {
               this.ynNewTengtianyu8Btn = new NewSkinButton();
               this.ynNewTengtianyu8Btn.skin = "yntengtianyu22";
               this.btnSpr.addChild(this.ynNewTengtianyu8Btn);
               this.ynNewTengtianyu8Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynNewTengtianyu8Btn.visible = param1;
         }
         else if(Boolean(this.ynNewTengtianyu8Btn) && Boolean(this.ynNewTengtianyu8Btn.parent))
         {
            this.ynNewTengtianyu8Btn.parent.removeChild(this.ynNewTengtianyu8Btn);
            this.ynNewTengtianyu8Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setNewTengtianyu9BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynNewTengtianyu9Btn == null)
            {
               this.ynNewTengtianyu9Btn = new NewSkinButton();
               this.ynNewTengtianyu9Btn.skin = "yntengtianyu22";
               this.btnSpr.addChild(this.ynNewTengtianyu9Btn);
               this.ynNewTengtianyu9Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynNewTengtianyu9Btn.visible = param1;
         }
         else if(Boolean(this.ynNewTengtianyu9Btn) && Boolean(this.ynNewTengtianyu9Btn.parent))
         {
            this.ynNewTengtianyu9Btn.parent.removeChild(this.ynNewTengtianyu9Btn);
            this.ynNewTengtianyu9Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setNewTengtianyu10BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynNewTengtianyu10Btn == null)
            {
               this.ynNewTengtianyu10Btn = new NewSkinButton();
               this.ynNewTengtianyu10Btn.skin = "yntengtianyu22";
               this.btnSpr.addChild(this.ynNewTengtianyu10Btn);
               this.ynNewTengtianyu10Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynNewTengtianyu10Btn.visible = param1;
         }
         else if(Boolean(this.ynNewTengtianyu10Btn) && Boolean(this.ynNewTengtianyu10Btn.parent))
         {
            this.ynNewTengtianyu10Btn.parent.removeChild(this.ynNewTengtianyu10Btn);
            this.ynNewTengtianyu10Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setNewTengtianyu11BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynNewTengtianyu11Btn == null)
            {
               this.ynNewTengtianyu11Btn = new NewSkinButton();
               this.ynNewTengtianyu11Btn.skin = "yntengtianyu22";
               this.btnSpr.addChild(this.ynNewTengtianyu11Btn);
               this.ynNewTengtianyu11Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynNewTengtianyu11Btn.visible = param1;
         }
         else if(Boolean(this.ynNewTengtianyu11Btn) && Boolean(this.ynNewTengtianyu11Btn.parent))
         {
            this.ynNewTengtianyu11Btn.parent.removeChild(this.ynNewTengtianyu11Btn);
            this.ynNewTengtianyu11Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setNewTengtianyu12BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynNewTengtianyu12Btn == null)
            {
               this.ynNewTengtianyu12Btn = new NewSkinButton();
               this.ynNewTengtianyu12Btn.skin = "yntengtianyu22";
               this.btnSpr.addChild(this.ynNewTengtianyu12Btn);
               this.ynNewTengtianyu12Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynNewTengtianyu12Btn.visible = param1;
         }
         else if(Boolean(this.ynNewTengtianyu12Btn) && Boolean(this.ynNewTengtianyu12Btn.parent))
         {
            this.ynNewTengtianyu12Btn.parent.removeChild(this.ynNewTengtianyu12Btn);
            this.ynNewTengtianyu12Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setNewTengtianyu13BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynNewTengtianyu13Btn == null)
            {
               this.ynNewTengtianyu13Btn = new NewSkinButton();
               this.ynNewTengtianyu13Btn.skin = "yntengtianyu22";
               this.btnSpr.addChild(this.ynNewTengtianyu13Btn);
               this.ynNewTengtianyu13Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynNewTengtianyu13Btn.visible = param1;
         }
         else if(Boolean(this.ynNewTengtianyu13Btn) && Boolean(this.ynNewTengtianyu13Btn.parent))
         {
            this.ynNewTengtianyu13Btn.parent.removeChild(this.ynNewTengtianyu13Btn);
            this.ynNewTengtianyu13Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setNewTengtianyu14BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynNewTengtianyu14Btn == null)
            {
               this.ynNewTengtianyu14Btn = new NewSkinButton();
               this.ynNewTengtianyu14Btn.skin = "yntengtianyu22";
               this.btnSpr.addChild(this.ynNewTengtianyu14Btn);
               this.ynNewTengtianyu14Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynNewTengtianyu14Btn.visible = param1;
         }
         else if(Boolean(this.ynNewTengtianyu14Btn) && Boolean(this.ynNewTengtianyu14Btn.parent))
         {
            this.ynNewTengtianyu14Btn.parent.removeChild(this.ynNewTengtianyu14Btn);
            this.ynNewTengtianyu14Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWulinshendibao5Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWulinshendibaoBtn5 == null)
            {
               this.ynWulinshendibaoBtn5 = new NewSkinButton();
               this.ynWulinshendibaoBtn5.skin = "ynwulinshendibao";
               this.btnSpr.addChild(this.ynWulinshendibaoBtn5);
               this.ynWulinshendibaoBtn5.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWulinshendibaoBtn5.visible = param1;
         }
         else if(Boolean(this.ynWulinshendibaoBtn5) && Boolean(this.ynWulinshendibaoBtn5.parent))
         {
            this.ynWulinshendibaoBtn5.parent.removeChild(this.ynWulinshendibaoBtn5);
            this.ynWulinshendibaoBtn5 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWulinshendibao6Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWulinshendibaoBtn6 == null)
            {
               this.ynWulinshendibaoBtn6 = new NewSkinButton();
               this.ynWulinshendibaoBtn6.skin = "ynwulinshendibao";
               this.btnSpr.addChild(this.ynWulinshendibaoBtn6);
               this.ynWulinshendibaoBtn6.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWulinshendibaoBtn6.visible = param1;
         }
         else if(Boolean(this.ynWulinshendibaoBtn6) && Boolean(this.ynWulinshendibaoBtn6.parent))
         {
            this.ynWulinshendibaoBtn6.parent.removeChild(this.ynWulinshendibaoBtn6);
            this.ynWulinshendibaoBtn6 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWulinshendibao7Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWulinshendibaoBtn7 == null)
            {
               this.ynWulinshendibaoBtn7 = new NewSkinButton();
               this.ynWulinshendibaoBtn7.skin = "ynwulinshendibao";
               this.btnSpr.addChild(this.ynWulinshendibaoBtn7);
               this.ynWulinshendibaoBtn7.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWulinshendibaoBtn7.visible = param1;
         }
         else if(Boolean(this.ynWulinshendibaoBtn7) && Boolean(this.ynWulinshendibaoBtn7.parent))
         {
            this.ynWulinshendibaoBtn7.parent.removeChild(this.ynWulinshendibaoBtn7);
            this.ynWulinshendibaoBtn7 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWulinshendibao8Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWulinshendibaoBtn8 == null)
            {
               this.ynWulinshendibaoBtn8 = new NewSkinButton();
               this.ynWulinshendibaoBtn8.skin = "ynwulinshendibao";
               this.btnSpr.addChild(this.ynWulinshendibaoBtn8);
               this.ynWulinshendibaoBtn8.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWulinshendibaoBtn8.visible = param1;
         }
         else if(Boolean(this.ynWulinshendibaoBtn8) && Boolean(this.ynWulinshendibaoBtn8.parent))
         {
            this.ynWulinshendibaoBtn8.parent.removeChild(this.ynWulinshendibaoBtn8);
            this.ynWulinshendibaoBtn8 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setShenfeng2BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynShenfeng2Btn == null)
            {
               this.ynShenfeng2Btn = new NewSkinButton();
               this.ynShenfeng2Btn.skin = "ynshenfengBtn";
               this.btnSpr.addChild(this.ynShenfeng2Btn);
               this.ynShenfeng2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynShenfeng2Btn.visible = param1;
         }
         else if(Boolean(this.ynShenfeng2Btn) && Boolean(this.ynShenfeng2Btn.parent))
         {
            this.ynShenfeng2Btn.parent.removeChild(this.ynShenfeng2Btn);
            this.ynShenfeng2Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWuduqirenVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWuduqirenBtn == null)
            {
               this.ynWuduqirenBtn = new NewSkinButton();
               this.ynWuduqirenBtn.skin = "wuduqirenButton";
               this.btnSpr.addChild(this.ynWuduqirenBtn);
               this.ynWuduqirenBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWuduqirenBtn.visible = param1;
         }
         else if(Boolean(this.ynWuduqirenBtn) && Boolean(this.ynWuduqirenBtn.parent))
         {
            this.ynWuduqirenBtn.parent.removeChild(this.ynWuduqirenBtn);
            this.ynWuduqirenBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setQinglongxingjunVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynQinglongxingjunBtn == null)
            {
               this.ynQinglongxingjunBtn = new NewSkinButton();
               this.ynQinglongxingjunBtn.skin = "qinglongxingjunButton";
               this.btnSpr.addChild(this.ynQinglongxingjunBtn);
               this.ynQinglongxingjunBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynQinglongxingjunBtn.visible = param1;
         }
         else if(Boolean(this.ynQinglongxingjunBtn) && Boolean(this.ynQinglongxingjunBtn.parent))
         {
            this.ynQinglongxingjunBtn.parent.removeChild(this.ynQinglongxingjunBtn);
            this.ynQinglongxingjunBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setLihejueVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynLihejueBtn == null)
            {
               this.ynLihejueBtn = new NewSkinButton();
               this.ynLihejueBtn.skin = "lihejueButton";
               this.btnSpr.addChild(this.ynLihejueBtn);
               this.ynLihejueBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynLihejueBtn.visible = param1;
         }
         else if(Boolean(this.ynLihejueBtn) && Boolean(this.ynLihejueBtn.parent))
         {
            this.ynLihejueBtn.parent.removeChild(this.ynLihejueBtn);
            this.ynLihejueBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function set10yueyouhuiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn10yueyouhuiBtn == null)
            {
               this.yn10yueyouhuiBtn = new NewSkinButton();
               this.yn10yueyouhuiBtn.skin = "shiyueyouhuizhouqiButton";
               this.btnSpr.addChild(this.yn10yueyouhuiBtn);
               this.yn10yueyouhuiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn10yueyouhuiBtn.visible = param1;
         }
         else if(Boolean(this.yn10yueyouhuiBtn) && Boolean(this.yn10yueyouhuiBtn.parent))
         {
            this.yn10yueyouhuiBtn.parent.removeChild(this.yn10yueyouhuiBtn);
            this.yn10yueyouhuiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setZhenbaoge2Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhenbaoge2Btn == null)
            {
               this.ynZhenbaoge2Btn = new NewSkinButton();
               this.ynZhenbaoge2Btn.skin = "ynzhenbaoge";
               this.btnSpr.addChild(this.ynZhenbaoge2Btn);
               this.ynZhenbaoge2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhenbaoge2Btn.visible = param1;
         }
         else if(Boolean(this.ynZhenbaoge2Btn) && Boolean(this.ynZhenbaoge2Btn.parent))
         {
            this.ynZhenbaoge2Btn.parent.removeChild(this.ynZhenbaoge2Btn);
            this.ynZhenbaoge2Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setMeitianchongzhilibao2BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynMeitianchongzhilibao2Btn == null)
            {
               this.ynMeitianchongzhilibao2Btn = new NewSkinButton();
               this.ynMeitianchongzhilibao2Btn.skin = "ynmeitianchongzhilibao";
               this.btnSpr.addChild(this.ynMeitianchongzhilibao2Btn);
               this.ynMeitianchongzhilibao2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynMeitianchongzhilibao2Btn.visible = param1;
         }
         else if(Boolean(this.ynMeitianchongzhilibao2Btn) && Boolean(this.ynMeitianchongzhilibao2Btn.parent))
         {
            this.ynMeitianchongzhilibao2Btn.parent.removeChild(this.ynMeitianchongzhilibao2Btn);
            this.ynMeitianchongzhilibao2Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setPJubaopeng2BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynPJubaopen2Btn == null)
            {
               this.ynPJubaopen2Btn = new FSimpleButton();
               this.ynPJubaopen2Btn.skin = "jubaopenYNBtn";
               this.ynPJubaopen2Btn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("聚宝盆") + "</font>";
               this.btnSpr.addChild(this.ynPJubaopen2Btn);
               this.ynPJubaopen2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynPJubaopen2Btn.visible = param1;
         }
         else if(Boolean(this.ynPJubaopen2Btn) && Boolean(this.ynPJubaopen2Btn.parent))
         {
            this.ynPJubaopen2Btn.parent.removeChild(this.ynPJubaopen2Btn);
            this.ynPJubaopen2Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setGJubaopeng2BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynGJubaopen2Btn == null)
            {
               this.ynGJubaopen2Btn = new FSimpleButton();
               this.ynGJubaopen2Btn.skin = "jubaopenYNBtn1";
               this.ynGJubaopen2Btn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("聚宝盆") + "</font>";
               this.btnSpr.addChild(this.ynGJubaopen2Btn);
               this.ynGJubaopen2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynGJubaopen2Btn.visible = param1;
         }
         else if(Boolean(this.ynGJubaopen2Btn) && Boolean(this.ynGJubaopen2Btn.parent))
         {
            this.ynGJubaopen2Btn.parent.removeChild(this.ynGJubaopen2Btn);
            this.ynGJubaopen2Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setCJubaopeng2BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynCJubaopen2Btn == null)
            {
               this.ynCJubaopen2Btn = new NewSkinButton();
               this.ynCJubaopen2Btn.skin = "yn2016chaojijvbaopen";
               this.ynCJubaopen2Btn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("聚宝盆") + "</font>";
               this.btnSpr.addChild(this.ynCJubaopen2Btn);
               this.ynCJubaopen2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynCJubaopen2Btn.visible = param1;
         }
         else if(Boolean(this.ynCJubaopen2Btn) && Boolean(this.ynCJubaopen2Btn.parent))
         {
            this.ynCJubaopen2Btn.parent.removeChild(this.ynCJubaopen2Btn);
            this.ynCJubaopen2Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setZhuquexingjunBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZhuquexingjunBtn == null)
            {
               this.ynZhuquexingjunBtn = new NewSkinButton();
               this.ynZhuquexingjunBtn.skin = "zhuquexingjunButton";
               this.btnSpr.addChild(this.ynZhuquexingjunBtn);
               this.ynZhuquexingjunBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZhuquexingjunBtn.visible = param1;
         }
         else if(Boolean(this.ynZhuquexingjunBtn) && Boolean(this.ynZhuquexingjunBtn.parent))
         {
            this.ynZhuquexingjunBtn.parent.removeChild(this.ynZhuquexingjunBtn);
            this.ynZhuquexingjunBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setZengsongnvrenBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynZengsongnvrenBtn == null)
            {
               this.ynZengsongnvrenBtn = new NewSkinButton();
               this.ynZengsongnvrenBtn.skin = "zengsongnvrenButton";
               this.btnSpr.addChild(this.ynZengsongnvrenBtn);
               this.ynZengsongnvrenBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynZengsongnvrenBtn.visible = param1;
         }
         else if(Boolean(this.ynZengsongnvrenBtn) && Boolean(this.ynZengsongnvrenBtn.parent))
         {
            this.ynZengsongnvrenBtn.parent.removeChild(this.ynZengsongnvrenBtn);
            this.ynZengsongnvrenBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function set20171020BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn20171020Btn == null)
            {
               this.yn20171020Btn = new NewSkinButton();
               this.yn20171020Btn.skin = "shijian20171020Button";
               this.btnSpr.addChild(this.yn20171020Btn);
               this.yn20171020Btn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn20171020Btn.visible = param1;
         }
         else if(Boolean(this.yn20171020Btn) && Boolean(this.yn20171020Btn.parent))
         {
            this.yn20171020Btn.parent.removeChild(this.yn20171020Btn);
            this.yn20171020Btn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setSuixinxiaofeiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynSuixinxiaofeiBtn == null)
            {
               this.ynSuixinxiaofeiBtn = new NewSkinButton();
               this.ynSuixinxiaofeiBtn.skin = "suixinxiaofeiButton";
               this.btnSpr.addChild(this.ynSuixinxiaofeiBtn);
               this.ynSuixinxiaofeiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynSuixinxiaofeiBtn.visible = param1;
         }
         else if(Boolean(this.ynSuixinxiaofeiBtn) && Boolean(this.ynSuixinxiaofeiBtn.parent))
         {
            this.ynSuixinxiaofeiBtn.parent.removeChild(this.ynSuixinxiaofeiBtn);
            this.ynSuixinxiaofeiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function set2017FunvjieBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn2017FunvjieBtn == null)
            {
               this.yn2017FunvjieBtn = new NewSkinButton();
               this.yn2017FunvjieBtn.skin = "yuenanfunvjieButton";
               this.btnSpr.addChild(this.yn2017FunvjieBtn);
               this.yn2017FunvjieBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn2017FunvjieBtn.visible = param1;
         }
         else if(Boolean(this.yn2017FunvjieBtn) && Boolean(this.yn2017FunvjieBtn.parent))
         {
            this.yn2017FunvjieBtn.parent.removeChild(this.yn2017FunvjieBtn);
            this.yn2017FunvjieBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function set2017LiunianhuodongBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn2017LiunianhuodongBtn == null)
            {
               this.yn2017LiunianhuodongBtn = new NewSkinButton();
               this.yn2017LiunianhuodongBtn.skin = "liunianhuodongButton";
               this.btnSpr.addChild(this.yn2017LiunianhuodongBtn);
               this.yn2017LiunianhuodongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn2017LiunianhuodongBtn.visible = param1;
         }
         else if(Boolean(this.yn2017LiunianhuodongBtn) && Boolean(this.yn2017LiunianhuodongBtn.parent))
         {
            this.yn2017LiunianhuodongBtn.parent.removeChild(this.yn2017LiunianhuodongBtn);
            this.yn2017LiunianhuodongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function set2017LiunianpeibanBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn2017LiunianpeibanBtn == null)
            {
               this.yn2017LiunianpeibanBtn = new NewSkinButton();
               this.yn2017LiunianpeibanBtn.skin = "liunianpeibanButton";
               this.btnSpr.addChild(this.yn2017LiunianpeibanBtn);
               this.yn2017LiunianpeibanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn2017LiunianpeibanBtn.visible = param1;
         }
         else if(Boolean(this.yn2017LiunianpeibanBtn) && Boolean(this.yn2017LiunianpeibanBtn.parent))
         {
            this.yn2017LiunianpeibanBtn.parent.removeChild(this.yn2017LiunianpeibanBtn);
            this.yn2017LiunianpeibanBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function set2017GanenliunianBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn2017GanenliunianBtn == null)
            {
               this.yn2017GanenliunianBtn = new NewSkinButton();
               this.yn2017GanenliunianBtn.skin = "ganenliunianButton";
               this.btnSpr.addChild(this.yn2017GanenliunianBtn);
               this.yn2017GanenliunianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn2017GanenliunianBtn.visible = param1;
         }
         else if(Boolean(this.yn2017GanenliunianBtn) && Boolean(this.yn2017GanenliunianBtn.parent))
         {
            this.yn2017GanenliunianBtn.parent.removeChild(this.yn2017GanenliunianBtn);
            this.yn2017GanenliunianBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function set2017ShengrizhouqiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn2017ShengrizhouqiBtn == null)
            {
               this.yn2017ShengrizhouqiBtn = new NewSkinButton();
               this.yn2017ShengrizhouqiBtn.skin = "shengrizhouqiButton";
               this.btnSpr.addChild(this.yn2017ShengrizhouqiBtn);
               this.yn2017ShengrizhouqiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn2017ShengrizhouqiBtn.visible = param1;
         }
         else if(Boolean(this.yn2017ShengrizhouqiBtn) && Boolean(this.yn2017ShengrizhouqiBtn.parent))
         {
            this.yn2017ShengrizhouqiBtn.parent.removeChild(this.yn2017ShengrizhouqiBtn);
            this.yn2017ShengrizhouqiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function set2017HuazhuangdasaiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn2017HuazhuangdasaiBtn == null)
            {
               this.yn2017HuazhuangdasaiBtn = new NewSkinButton();
               this.yn2017HuazhuangdasaiBtn.skin = "huazhuangdasaiButton";
               this.btnSpr.addChild(this.yn2017HuazhuangdasaiBtn);
               this.yn2017HuazhuangdasaiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn2017HuazhuangdasaiBtn.visible = param1;
         }
         else if(Boolean(this.yn2017HuazhuangdasaiBtn) && Boolean(this.yn2017HuazhuangdasaiBtn.parent))
         {
            this.yn2017HuazhuangdasaiBtn.parent.removeChild(this.yn2017HuazhuangdasaiBtn);
            this.yn2017HuazhuangdasaiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function set2017WeixiwulinBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn2017WeixiwulinBtn == null)
            {
               this.yn2017WeixiwulinBtn = new NewSkinButton();
               this.yn2017WeixiwulinBtn.skin = "weixiwulin2017Button";
               this.btnSpr.addChild(this.yn2017WeixiwulinBtn);
               this.yn2017WeixiwulinBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn2017WeixiwulinBtn.visible = param1;
         }
         else if(Boolean(this.yn2017WeixiwulinBtn) && Boolean(this.yn2017WeixiwulinBtn.parent))
         {
            this.yn2017WeixiwulinBtn.parent.removeChild(this.yn2017WeixiwulinBtn);
            this.yn2017WeixiwulinBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function set2017HuazhuanghuodongBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn2017HuazhuanghuodongBtn == null)
            {
               this.yn2017HuazhuanghuodongBtn = new NewSkinButton();
               this.yn2017HuazhuanghuodongBtn.skin = "huazhuanghuodongButton";
               this.btnSpr.addChild(this.yn2017HuazhuanghuodongBtn);
               this.yn2017HuazhuanghuodongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn2017HuazhuanghuodongBtn.visible = param1;
         }
         else if(Boolean(this.yn2017HuazhuanghuodongBtn) && Boolean(this.yn2017HuazhuanghuodongBtn.parent))
         {
            this.yn2017HuazhuanghuodongBtn.parent.removeChild(this.yn2017HuazhuanghuodongBtn);
            this.yn2017HuazhuanghuodongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function set2017XuantiezhixingzhouqiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn2017XuantiezhixingBtn == null)
            {
               this.yn2017XuantiezhixingBtn = new NewSkinButton();
               this.yn2017XuantiezhixingBtn.skin = "xuantiezhixingzhouqiButton";
               this.btnSpr.addChild(this.yn2017XuantiezhixingBtn);
               this.yn2017XuantiezhixingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn2017XuantiezhixingBtn.visible = param1;
         }
         else if(Boolean(this.yn2017XuantiezhixingBtn) && Boolean(this.yn2017XuantiezhixingBtn.parent))
         {
            this.yn2017XuantiezhixingBtn.parent.removeChild(this.yn2017XuantiezhixingBtn);
            this.yn2017XuantiezhixingBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function set20170601ShijianVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn20170601ShijianBtn == null)
            {
               this.yn20170601ShijianBtn = new NewSkinButton();
               this.yn20170601ShijianBtn.skin = "yuenan0601Button";
               this.btnSpr.addChild(this.yn20170601ShijianBtn);
               this.yn20170601ShijianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn20170601ShijianBtn.visible = param1;
         }
         else if(Boolean(this.yn20170601ShijianBtn) && Boolean(this.yn20170601ShijianBtn.parent))
         {
            this.yn20170601ShijianBtn.parent.removeChild(this.yn20170601ShijianBtn);
            this.yn20170601ShijianBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function set2017ShangrenVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn2017ShangrenBtn == null)
            {
               this.yn2017ShangrenBtn = new NewSkinButton();
               this.yn2017ShangrenBtn.skin = "shangren20180604_Button";
               this.btnSpr.addChild(this.yn2017ShangrenBtn);
               this.yn2017ShangrenBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn2017ShangrenBtn.visible = param1;
         }
         else if(Boolean(this.yn2017ShangrenBtn) && Boolean(this.yn2017ShangrenBtn.parent))
         {
            this.yn2017ShangrenBtn.parent.removeChild(this.yn2017ShangrenBtn);
            this.yn2017ShangrenBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setQinglongxingjunfuwenBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn2017QinglongxingjunfuwenBtn == null)
            {
               this.yn2017QinglongxingjunfuwenBtn = new NewSkinButton();
               this.yn2017QinglongxingjunfuwenBtn.skin = "qinglongxingjunfuwenButton";
               this.btnSpr.addChild(this.yn2017QinglongxingjunfuwenBtn);
               this.yn2017QinglongxingjunfuwenBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn2017QinglongxingjunfuwenBtn.visible = param1;
         }
         else if(Boolean(this.yn2017QinglongxingjunfuwenBtn) && Boolean(this.yn2017QinglongxingjunfuwenBtn.parent))
         {
            this.yn2017QinglongxingjunfuwenBtn.parent.removeChild(this.yn2017QinglongxingjunfuwenBtn);
            this.yn2017QinglongxingjunfuwenBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setNeiligaishiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn2017NeiligaishiBtn == null)
            {
               this.yn2017NeiligaishiBtn = new NewSkinButton();
               this.yn2017NeiligaishiBtn.skin = "neiligaishiButton";
               this.btnSpr.addChild(this.yn2017NeiligaishiBtn);
               this.yn2017NeiligaishiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn2017NeiligaishiBtn.visible = param1;
         }
         else if(Boolean(this.yn2017NeiligaishiBtn) && Boolean(this.yn2017NeiligaishiBtn.parent))
         {
            this.yn2017NeiligaishiBtn.parent.removeChild(this.yn2017NeiligaishiBtn);
            this.yn2017NeiligaishiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setChaojixianglongzhouqiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn2017ChaojixianglongzhouqiBtn == null)
            {
               this.yn2017ChaojixianglongzhouqiBtn = new NewSkinButton();
               this.yn2017ChaojixianglongzhouqiBtn.skin = "xianglong20180619_Button";
               this.btnSpr.addChild(this.yn2017ChaojixianglongzhouqiBtn);
               this.yn2017ChaojixianglongzhouqiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn2017ChaojixianglongzhouqiBtn.visible = param1;
         }
         else if(Boolean(this.yn2017ChaojixianglongzhouqiBtn) && Boolean(this.yn2017ChaojixianglongzhouqiBtn.parent))
         {
            this.yn2017ChaojixianglongzhouqiBtn.parent.removeChild(this.yn2017ChaojixianglongzhouqiBtn);
            this.yn2017ChaojixianglongzhouqiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function set2017JiaoshijieBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn2017JiaoshijieBtn == null)
            {
               this.yn2017JiaoshijieBtn = new NewSkinButton();
               this.yn2017JiaoshijieBtn.skin = "jiaoshijieButton";
               this.btnSpr.addChild(this.yn2017JiaoshijieBtn);
               this.yn2017JiaoshijieBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn2017JiaoshijieBtn.visible = param1;
         }
         else if(Boolean(this.yn2017JiaoshijieBtn) && Boolean(this.yn2017JiaoshijieBtn.parent))
         {
            this.yn2017JiaoshijieBtn.parent.removeChild(this.yn2017JiaoshijieBtn);
            this.yn2017JiaoshijieBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function set2017ShuanglongzhanBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn2017ShuanglongzhanBtn == null)
            {
               this.yn2017ShuanglongzhanBtn = new NewSkinButton();
               this.yn2017ShuanglongzhanBtn.skin = "shuanglongzhan20180604_Button";
               this.btnSpr.addChild(this.yn2017ShuanglongzhanBtn);
               this.yn2017ShuanglongzhanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn2017ShuanglongzhanBtn.visible = param1;
         }
         else if(Boolean(this.yn2017ShuanglongzhanBtn) && Boolean(this.yn2017ShuanglongzhanBtn.parent))
         {
            this.yn2017ShuanglongzhanBtn.parent.removeChild(this.yn2017ShuanglongzhanBtn);
            this.yn2017ShuanglongzhanBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setShuangLongZhan2BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnShuangLongZhan2 == null)
            {
               this.btnShuangLongZhan2 = new NewSkinButton();
               this.btnShuangLongZhan2.skin = "shuanglongzhanButton";
               this.btnSpr.addChild(this.btnShuangLongZhan2);
               this.btnShuangLongZhan2.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnShuangLongZhan2.visible = param1;
         }
         else if(Boolean(this.btnShuangLongZhan2) && Boolean(this.btnShuangLongZhan2.parent))
         {
            this.btnShuangLongZhan2.parent.removeChild(this.btnShuangLongZhan2);
            this.btnShuangLongZhan2 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setShuangLongZhan3BtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnShuangLongZhan3 == null)
            {
               this.btnShuangLongZhan3 = new NewSkinButton();
               this.btnShuangLongZhan3.skin = "shuanglongzhan20180604_Button";
               this.btnSpr.addChild(this.btnShuangLongZhan3);
               this.btnShuangLongZhan3.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnShuangLongZhan3.visible = param1;
         }
         else if(Boolean(this.btnShuangLongZhan3) && Boolean(this.btnShuangLongZhan3.parent))
         {
            this.btnShuangLongZhan3.parent.removeChild(this.btnShuangLongZhan3);
            this.btnShuangLongZhan3 = null;
         }
         this.setAnniuPosition();
      }
      
      public function set2017ZhenpinzhouqiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn2017ZhenpinzhouqiBtn == null)
            {
               this.yn2017ZhenpinzhouqiBtn = new NewSkinButton();
               this.yn2017ZhenpinzhouqiBtn.skin = "zhenpinzhouqiButton";
               this.btnSpr.addChild(this.yn2017ZhenpinzhouqiBtn);
               this.yn2017ZhenpinzhouqiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn2017ZhenpinzhouqiBtn.visible = param1;
         }
         else if(Boolean(this.yn2017ZhenpinzhouqiBtn) && Boolean(this.yn2017ZhenpinzhouqiBtn.parent))
         {
            this.yn2017ZhenpinzhouqiBtn.parent.removeChild(this.yn2017ZhenpinzhouqiBtn);
            this.yn2017ZhenpinzhouqiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function set1205ShijianBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn1205shijianBtn == null)
            {
               this.yn1205shijianBtn = new NewSkinButton();
               this.yn1205shijianBtn.skin = "shieryuewuhaoButton";
               this.btnSpr.addChild(this.yn1205shijianBtn);
               this.yn1205shijianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn1205shijianBtn.visible = param1;
         }
         else if(Boolean(this.yn1205shijianBtn) && Boolean(this.yn1205shijianBtn.parent))
         {
            this.yn1205shijianBtn.parent.removeChild(this.yn1205shijianBtn);
            this.yn1205shijianBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function set1212ShijianBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn1212shijianBtn == null)
            {
               this.yn1212shijianBtn = new NewSkinButton();
               this.yn1212shijianBtn.skin = "shieryueshierButton";
               this.btnSpr.addChild(this.yn1212shijianBtn);
               this.yn1212shijianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn1212shijianBtn.visible = param1;
         }
         else if(Boolean(this.yn1212shijianBtn) && Boolean(this.yn1212shijianBtn.parent))
         {
            this.yn1212shijianBtn.parent.removeChild(this.yn1212shijianBtn);
            this.yn1212shijianBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYitianbaojinzhouqiBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynYitianbaojinzhouqiBtn == null)
            {
               this.ynYitianbaojinzhouqiBtn = new NewSkinButton();
               this.ynYitianbaojinzhouqiBtn.skin = "yitianbaojinButton";
               this.btnSpr.addChild(this.ynYitianbaojinzhouqiBtn);
               this.ynYitianbaojinzhouqiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynYitianbaojinzhouqiBtn.visible = param1;
         }
         else if(Boolean(this.ynYitianbaojinzhouqiBtn) && Boolean(this.ynYitianbaojinzhouqiBtn.parent))
         {
            this.ynYitianbaojinzhouqiBtn.parent.removeChild(this.ynYitianbaojinzhouqiBtn);
            this.ynYitianbaojinzhouqiBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function set1219ShijianBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn1219shijianBtn == null)
            {
               this.yn1219shijianBtn = new NewSkinButton();
               this.yn1219shijianBtn.skin = "shieryueshijiuButton";
               this.btnSpr.addChild(this.yn1219shijianBtn);
               this.yn1219shijianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn1219shijianBtn.visible = param1;
         }
         else if(Boolean(this.yn1219shijianBtn) && Boolean(this.yn1219shijianBtn.parent))
         {
            this.yn1219shijianBtn.parent.removeChild(this.yn1219shijianBtn);
            this.yn1219shijianBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWangjidianliBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWangjidianliBtn == null)
            {
               this.ynWangjidianliBtn = new NewSkinButton();
               this.ynWangjidianliBtn.skin = "wangjidianliButton";
               this.btnSpr.addChild(this.ynWangjidianliBtn);
               this.ynWangjidianliBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWangjidianliBtn.visible = param1;
         }
         else if(Boolean(this.ynWangjidianliBtn) && Boolean(this.ynWangjidianliBtn.parent))
         {
            this.ynWangjidianliBtn.parent.removeChild(this.ynWangjidianliBtn);
            this.ynWangjidianliBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setYinshechudongBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynYinshechudongBtn == null)
            {
               this.ynYinshechudongBtn = new NewSkinButton();
               this.ynYinshechudongBtn.skin = "yinshechudongButton";
               this.btnSpr.addChild(this.ynYinshechudongBtn);
               this.ynYinshechudongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynYinshechudongBtn.visible = param1;
         }
         else if(Boolean(this.ynYinshechudongBtn) && Boolean(this.ynYinshechudongBtn.parent))
         {
            this.ynYinshechudongBtn.parent.removeChild(this.ynYinshechudongBtn);
            this.ynYinshechudongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function set1226shijianBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn1226shijianBtn == null)
            {
               this.yn1226shijianBtn = new NewSkinButton();
               this.yn1226shijianBtn.skin = "shieryueershiliuButton";
               this.btnSpr.addChild(this.yn1226shijianBtn);
               this.yn1226shijianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn1226shijianBtn.visible = param1;
         }
         else if(Boolean(this.yn1226shijianBtn) && Boolean(this.yn1226shijianBtn.parent))
         {
            this.yn1226shijianBtn.parent.removeChild(this.yn1226shijianBtn);
            this.yn1226shijianBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setShengdanchongmanBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynShengdanchongmanBtn == null)
            {
               this.ynShengdanchongmanBtn = new NewSkinButton();
               this.ynShengdanchongmanBtn.skin = "shengdanchongmanButton";
               this.btnSpr.addChild(this.ynShengdanchongmanBtn);
               this.ynShengdanchongmanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynShengdanchongmanBtn.visible = param1;
         }
         else if(Boolean(this.ynShengdanchongmanBtn) && Boolean(this.ynShengdanchongmanBtn.parent))
         {
            this.ynShengdanchongmanBtn.parent.removeChild(this.ynShengdanchongmanBtn);
            this.ynShengdanchongmanBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setDuixuerenBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynDuixuerenBtn == null)
            {
               this.ynDuixuerenBtn = new NewSkinButton();
               this.ynDuixuerenBtn.skin = "duixuerenButton";
               this.btnSpr.addChild(this.ynDuixuerenBtn);
               this.ynDuixuerenBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynDuixuerenBtn.visible = param1;
         }
         else if(Boolean(this.ynDuixuerenBtn) && Boolean(this.ynDuixuerenBtn.parent))
         {
            this.ynDuixuerenBtn.parent.removeChild(this.ynDuixuerenBtn);
            this.ynDuixuerenBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function set5quxinshoulibaoBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yn5quxinshoulibaoBtn == null)
            {
               this.yn5quxinshoulibaoBtn = new NewSkinButton();
               this.yn5quxinshoulibaoBtn.skin = "wuyuexinshoulibaoButton";
               this.btnSpr.addChild(this.yn5quxinshoulibaoBtn);
               this.yn5quxinshoulibaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.yn5quxinshoulibaoBtn.visible = param1;
         }
         else if(Boolean(this.yn5quxinshoulibaoBtn) && Boolean(this.yn5quxinshoulibaoBtn.parent))
         {
            this.yn5quxinshoulibaoBtn.parent.removeChild(this.yn5quxinshoulibaoBtn);
            this.yn5quxinshoulibaoBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setWanshihaoBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynWanshixingBtn == null)
            {
               this.ynWanshixingBtn = new NewSkinButton();
               this.ynWanshixingBtn.skin = "wanshixingButton";
               this.btnSpr.addChild(this.ynWanshixingBtn);
               this.ynWanshixingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynWanshixingBtn.visible = param1;
         }
         else if(Boolean(this.ynWanshixingBtn) && Boolean(this.ynWanshixingBtn.parent))
         {
            this.ynWanshixingBtn.parent.removeChild(this.ynWanshixingBtn);
            this.ynWanshixingBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setQianghuajinshenBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynQianghuajinshenBtn == null)
            {
               this.ynQianghuajinshenBtn = new NewSkinButton();
               this.ynQianghuajinshenBtn.skin = "qianghuajinshenButton";
               this.btnSpr.addChild(this.ynQianghuajinshenBtn);
               this.ynQianghuajinshenBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynQianghuajinshenBtn.visible = param1;
         }
         else if(Boolean(this.ynQianghuajinshenBtn) && Boolean(this.ynQianghuajinshenBtn.parent))
         {
            this.ynQianghuajinshenBtn.parent.removeChild(this.ynQianghuajinshenBtn);
            this.ynQianghuajinshenBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setChuzhanBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynChuzhanBtn == null)
            {
               this.ynChuzhanBtn = new NewSkinButton();
               this.ynChuzhanBtn.skin = "chuzhanButton";
               this.btnSpr.addChild(this.ynChuzhanBtn);
               this.ynChuzhanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynChuzhanBtn.visible = param1;
         }
         else if(Boolean(this.ynChuzhanBtn) && Boolean(this.ynChuzhanBtn.parent))
         {
            this.ynChuzhanBtn.parent.removeChild(this.ynChuzhanBtn);
            this.ynChuzhanBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setGengxinbuchangBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynGengxinbuchanghuodongBtn == null)
            {
               this.ynGengxinbuchanghuodongBtn = new NewSkinButton();
               this.ynGengxinbuchanghuodongBtn.skin = "gengxinbuchanghuodongButton";
               this.btnSpr.addChild(this.ynGengxinbuchanghuodongBtn);
               this.ynGengxinbuchanghuodongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynGengxinbuchanghuodongBtn.visible = param1;
         }
         else if(Boolean(this.ynGengxinbuchanghuodongBtn) && Boolean(this.ynGengxinbuchanghuodongBtn.parent))
         {
            this.ynGengxinbuchanghuodongBtn.parent.removeChild(this.ynGengxinbuchanghuodongBtn);
            this.ynGengxinbuchanghuodongBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setPeiyangdianfengshouBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ynPeiyangdianfengshouBtn == null)
            {
               this.ynPeiyangdianfengshouBtn = new NewSkinButton();
               this.ynPeiyangdianfengshouBtn.skin = "peiyangdianfengshouButton";
               this.btnSpr.addChild(this.ynPeiyangdianfengshouBtn);
               this.ynPeiyangdianfengshouBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.ynPeiyangdianfengshouBtn.visible = param1;
         }
         else if(Boolean(this.ynPeiyangdianfengshouBtn) && Boolean(this.ynPeiyangdianfengshouBtn.parent))
         {
            this.ynPeiyangdianfengshouBtn.parent.removeChild(this.ynPeiyangdianfengshouBtn);
            this.ynPeiyangdianfengshouBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnDingFengZhuanPanVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnDingFengZhuanPan == null)
            {
               this.btnDingFengZhuanPan = new NewSkinButton();
               this.btnDingFengZhuanPan.skin = "zhuanzhuanlebtn_Button";
               this.btnSpr.addChild(this.btnDingFengZhuanPan);
               this.btnDingFengZhuanPan.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnDingFengZhuanPan.visible = param1;
         }
         else if(Boolean(this.btnDingFengZhuanPan) && Boolean(this.btnDingFengZhuanPan.parent))
         {
            this.btnDingFengZhuanPan.parent.removeChild(this.btnDingFengZhuanPan);
            this.btnDingFengZhuanPan = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnYiTianTuLongDaoVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnYiTianTuLongDao == null)
            {
               this.btnYiTianTuLongDao = new NewSkinButton();
               this.btnYiTianTuLongDao.skin = "yttldButton";
               this.btnSpr.addChild(this.btnYiTianTuLongDao);
               this.btnYiTianTuLongDao.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnYiTianTuLongDao.visible = param1;
         }
         else if(Boolean(this.btnYiTianTuLongDao) && Boolean(this.btnYiTianTuLongDao.parent))
         {
            this.btnYiTianTuLongDao.parent.removeChild(this.btnYiTianTuLongDao);
            this.btnYiTianTuLongDao = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnTianRenHeVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnTianRenHe == null)
            {
               this.btnTianRenHe = new NewSkinButton();
               this.btnTianRenHe.skin = "tianrenhe20180604_Button";
               this.btnSpr.addChild(this.btnTianRenHe);
               this.btnTianRenHe.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnTianRenHe.visible = param1;
         }
         else if(Boolean(this.btnTianRenHe) && Boolean(this.btnTianRenHe.parent))
         {
            this.btnTianRenHe.parent.removeChild(this.btnTianRenHe);
            this.btnTianRenHe = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnJiZaoJieVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnJiZaoJie == null)
            {
               this.btnJiZaoJie = new NewSkinButton();
               this.btnJiZaoJie.skin = "zaojiebtn_Button";
               this.btnSpr.addChild(this.btnJiZaoJie);
               this.btnJiZaoJie.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnJiZaoJie.visible = param1;
         }
         else if(Boolean(this.btnJiZaoJie) && Boolean(this.btnJiZaoJie.parent))
         {
            this.btnJiZaoJie.parent.removeChild(this.btnJiZaoJie);
            this.btnJiZaoJie = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnZaoYeVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnZaoye == null)
            {
               this.btnZaoye = new NewSkinButton();
               this.btnZaoye.skin = "jizaojiebtn_Button";
               this.btnSpr.addChild(this.btnZaoye);
               this.btnZaoye.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnZaoye.visible = param1;
         }
         else if(Boolean(this.btnZaoye) && Boolean(this.btnZaoye.parent))
         {
            this.btnZaoye.parent.removeChild(this.btnZaoye);
            this.btnZaoye = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnRongQingAiYiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnRongQingAiYi == null)
            {
               this.btnRongQingAiYi = new NewSkinButton();
               this.btnRongQingAiYi.skin = "rongqingaiyi_Button";
               this.btnSpr.addChild(this.btnRongQingAiYi);
               this.btnRongQingAiYi.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnRongQingAiYi.visible = param1;
         }
         else if(Boolean(this.btnRongQingAiYi) && Boolean(this.btnRongQingAiYi.parent))
         {
            this.btnRongQingAiYi.parent.removeChild(this.btnRongQingAiYi);
            this.btnRongQingAiYi = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnChaoJiWuLinDabao1Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnChaoJiWuLinDaBao1 == null)
            {
               this.btnChaoJiWuLinDaBao1 = new NewSkinButton();
               this.btnChaoJiWuLinDaBao1.skin = "ynwulinshendibao";
               this.btnSpr.addChild(this.btnChaoJiWuLinDaBao1);
               this.btnChaoJiWuLinDaBao1.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnChaoJiWuLinDaBao1.visible = param1;
         }
         else if(Boolean(this.btnChaoJiWuLinDaBao1) && Boolean(this.btnChaoJiWuLinDaBao1.parent))
         {
            this.btnChaoJiWuLinDaBao1.parent.removeChild(this.btnChaoJiWuLinDaBao1);
            this.btnChaoJiWuLinDaBao1 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnChaoJiWuLinDabao2Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnChaoJiWuLinDaBao2 == null)
            {
               this.btnChaoJiWuLinDaBao2 = new NewSkinButton();
               this.btnChaoJiWuLinDaBao2.skin = "ynwulinshendibao";
               this.btnSpr.addChild(this.btnChaoJiWuLinDaBao2);
               this.btnChaoJiWuLinDaBao2.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnChaoJiWuLinDaBao2.visible = param1;
         }
         else if(Boolean(this.btnChaoJiWuLinDaBao2) && Boolean(this.btnChaoJiWuLinDaBao2.parent))
         {
            this.btnChaoJiWuLinDaBao2.parent.removeChild(this.btnChaoJiWuLinDaBao2);
            this.btnChaoJiWuLinDaBao2 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnChaoJiWuLinDabao3Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnChaoJiWuLinDaBao3 == null)
            {
               this.btnChaoJiWuLinDaBao3 = new NewSkinButton();
               this.btnChaoJiWuLinDaBao3.skin = "ynwulinshendibao";
               this.btnSpr.addChild(this.btnChaoJiWuLinDaBao3);
               this.btnChaoJiWuLinDaBao3.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnChaoJiWuLinDaBao3.visible = param1;
         }
         else if(Boolean(this.btnChaoJiWuLinDaBao3) && Boolean(this.btnChaoJiWuLinDaBao3.parent))
         {
            this.btnChaoJiWuLinDaBao3.parent.removeChild(this.btnChaoJiWuLinDaBao3);
            this.btnChaoJiWuLinDaBao3 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnChaoJiWuLinDabao4Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnChaoJiWuLinDaBao4 == null)
            {
               this.btnChaoJiWuLinDaBao4 = new NewSkinButton();
               this.btnChaoJiWuLinDaBao4.skin = "ynwulinshendibao";
               this.btnSpr.addChild(this.btnChaoJiWuLinDaBao4);
               this.btnChaoJiWuLinDaBao4.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnChaoJiWuLinDaBao4.visible = param1;
         }
         else if(Boolean(this.btnChaoJiWuLinDaBao4) && Boolean(this.btnChaoJiWuLinDaBao4.parent))
         {
            this.btnChaoJiWuLinDaBao4.parent.removeChild(this.btnChaoJiWuLinDaBao4);
            this.btnChaoJiWuLinDaBao4 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnChaoJiWuLinDabao5Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnChaoJiWuLinDaBao5 == null)
            {
               this.btnChaoJiWuLinDaBao5 = new NewSkinButton();
               this.btnChaoJiWuLinDaBao5.skin = "ynwulinshendibao";
               this.btnSpr.addChild(this.btnChaoJiWuLinDaBao5);
               this.btnChaoJiWuLinDaBao5.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnChaoJiWuLinDaBao5.visible = param1;
         }
         else if(Boolean(this.btnChaoJiWuLinDaBao5) && Boolean(this.btnChaoJiWuLinDaBao5.parent))
         {
            this.btnChaoJiWuLinDaBao5.parent.removeChild(this.btnChaoJiWuLinDaBao5);
            this.btnChaoJiWuLinDaBao5 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnChaoJiWuLinDabao6Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnChaoJiWuLinDaBao6 == null)
            {
               this.btnChaoJiWuLinDaBao6 = new NewSkinButton();
               this.btnChaoJiWuLinDaBao6.skin = "ynwulinshendibao";
               this.btnSpr.addChild(this.btnChaoJiWuLinDaBao6);
               this.btnChaoJiWuLinDaBao6.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnChaoJiWuLinDaBao6.visible = param1;
         }
         else if(Boolean(this.btnChaoJiWuLinDaBao6) && Boolean(this.btnChaoJiWuLinDaBao6.parent))
         {
            this.btnChaoJiWuLinDaBao6.parent.removeChild(this.btnChaoJiWuLinDaBao6);
            this.btnChaoJiWuLinDaBao6 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnSanHeVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnSanHe == null)
            {
               this.btnSanHe = new NewSkinButton();
               this.btnSanHe.skin = "sanhe_Button";
               this.btnSpr.addChild(this.btnSanHe);
               this.btnSanHe.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnSanHe.visible = param1;
         }
         else if(Boolean(this.btnSanHe) && Boolean(this.btnSanHe.parent))
         {
            this.btnSanHe.parent.removeChild(this.btnSanHe);
            this.btnSanHe = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnWuXuZhouQiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnWuXuZhouQi == null)
            {
               this.btnWuXuZhouQi = new NewSkinButton();
               this.btnWuXuZhouQi.skin = "wuxu_Button";
               this.btnSpr.addChild(this.btnWuXuZhouQi);
               this.btnWuXuZhouQi.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnWuXuZhouQi.visible = param1;
         }
         else if(Boolean(this.btnWuXuZhouQi) && Boolean(this.btnWuXuZhouQi.parent))
         {
            this.btnWuXuZhouQi.parent.removeChild(this.btnWuXuZhouQi);
            this.btnWuXuZhouQi = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnChuYiErSanVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btn2018ChuYiErSan == null)
            {
               this.btn2018ChuYiErSan = new NewSkinButton();
               this.btn2018ChuYiErSan.skin = "chuyi_Button";
               this.btnSpr.addChild(this.btn2018ChuYiErSan);
               this.btn2018ChuYiErSan.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btn2018ChuYiErSan.visible = param1;
         }
         else if(Boolean(this.btn2018ChuYiErSan) && Boolean(this.btn2018ChuYiErSan.parent))
         {
            this.btn2018ChuYiErSan.parent.removeChild(this.btn2018ChuYiErSan);
            this.btn2018ChuYiErSan = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnXinShou2018Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btn2018XinShou == null)
            {
               this.btn2018XinShou = new FSimpleButton();
               this.btn2018XinShou.skin = "ynXinshouBtn";
               this.btn2018XinShou.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("新手活动") + "</font>";
               this.btnSpr.addChild(this.btn2018XinShou);
               this.btn2018XinShou.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btn2018XinShou.visible = param1;
         }
         else if(Boolean(this.btn2018XinShou) && Boolean(this.btn2018XinShou.parent))
         {
            this.btn2018XinShou.parent.removeChild(this.btn2018XinShou);
            this.btn2018XinShou = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtn2018FuNvJieVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btn2018FuNvJie == null)
            {
               this.btn2018FuNvJie = new NewSkinButton();
               this.btn2018FuNvJie.skin = "2018funvjie_Button";
               this.btnSpr.addChild(this.btn2018FuNvJie);
               this.btn2018FuNvJie.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btn2018FuNvJie.visible = param1;
         }
         else if(Boolean(this.btn2018FuNvJie) && Boolean(this.btn2018FuNvJie.parent))
         {
            this.btn2018FuNvJie.parent.removeChild(this.btn2018FuNvJie);
            this.btn2018FuNvJie = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnJinShenZhouQiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnJinShenZhouQi == null)
            {
               this.btnJinShenZhouQi = new NewSkinButton();
               this.btnJinShenZhouQi.skin = "jinshenzhouqi_Button";
               this.btnSpr.addChild(this.btnJinShenZhouQi);
               this.btnJinShenZhouQi.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnJinShenZhouQi.visible = param1;
         }
         else if(Boolean(this.btnJinShenZhouQi) && Boolean(this.btnJinShenZhouQi.parent))
         {
            this.btnJinShenZhouQi.parent.removeChild(this.btnJinShenZhouQi);
            this.btnJinShenZhouQi = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnNvErZengSongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnNvErZengSong == null)
            {
               this.btnNvErZengSong = new NewSkinButton();
               this.btnNvErZengSong.skin = "nverzengsong_Button";
               this.btnSpr.addChild(this.btnNvErZengSong);
               this.btnNvErZengSong.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnNvErZengSong.visible = param1;
         }
         else if(Boolean(this.btnNvErZengSong) && Boolean(this.btnNvErZengSong.parent))
         {
            this.btnNvErZengSong.parent.removeChild(this.btnNvErZengSong);
            this.btnNvErZengSong = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnBaiQiaoKeLiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnBaiQiaoKeLi == null)
            {
               this.btnBaiQiaoKeLi = new NewSkinButton();
               this.btnBaiQiaoKeLi.skin = "baiqiaokeli_Button";
               this.btnSpr.addChild(this.btnBaiQiaoKeLi);
               this.btnBaiQiaoKeLi.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnBaiQiaoKeLi.visible = param1;
         }
         else if(Boolean(this.btnBaiQiaoKeLi) && Boolean(this.btnBaiQiaoKeLi.parent))
         {
            this.btnBaiQiaoKeLi.parent.removeChild(this.btnBaiQiaoKeLi);
            this.btnBaiQiaoKeLi = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnDaHuangJinZhouQiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnDaHuangJinZhouQi == null)
            {
               this.btnDaHuangJinZhouQi = new NewSkinButton();
               this.btnDaHuangJinZhouQi.skin = "dahuangjinzhouqi_Button";
               this.btnSpr.addChild(this.btnDaHuangJinZhouQi);
               this.btnDaHuangJinZhouQi.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnDaHuangJinZhouQi.visible = param1;
         }
         else if(Boolean(this.btnDaHuangJinZhouQi) && Boolean(this.btnDaHuangJinZhouQi.parent))
         {
            this.btnDaHuangJinZhouQi.parent.removeChild(this.btnDaHuangJinZhouQi);
            this.btnDaHuangJinZhouQi = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnQingRenJieHuanLiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnQingRenJieHuanLi == null)
            {
               this.btnQingRenJieHuanLi = new NewSkinButton();
               this.btnQingRenJieHuanLi.skin = "qingrenjiehuanli_Button";
               this.btnSpr.addChild(this.btnQingRenJieHuanLi);
               this.btnQingRenJieHuanLi.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnQingRenJieHuanLi.visible = param1;
         }
         else if(Boolean(this.btnQingRenJieHuanLi) && Boolean(this.btnQingRenJieHuanLi.parent))
         {
            this.btnQingRenJieHuanLi.parent.removeChild(this.btnQingRenJieHuanLi);
            this.btnQingRenJieHuanLi = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnTianRenHe2Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnTianRenHe2 == null)
            {
               this.btnTianRenHe2 = new NewSkinButton();
               this.btnTianRenHe2.skin = "tiarenheButton";
               this.btnSpr.addChild(this.btnTianRenHe2);
               this.btnTianRenHe2.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnTianRenHe2.visible = param1;
         }
         else if(Boolean(this.btnTianRenHe2) && Boolean(this.btnTianRenHe2.parent))
         {
            this.btnTianRenHe2.parent.removeChild(this.btnTianRenHe2);
            this.btnTianRenHe2 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnQiangHuaJinShen2Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnQiangHuaJinShen2 == null)
            {
               this.btnQiangHuaJinShen2 = new NewSkinButton();
               this.btnQiangHuaJinShen2.skin = "qianghuajinshenButton";
               this.btnSpr.addChild(this.btnQiangHuaJinShen2);
               this.btnQiangHuaJinShen2.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnQiangHuaJinShen2.visible = param1;
         }
         else if(Boolean(this.btnQiangHuaJinShen2) && Boolean(this.btnQiangHuaJinShen2.parent))
         {
            this.btnQiangHuaJinShen2.parent.removeChild(this.btnQiangHuaJinShen2);
            this.btnQiangHuaJinShen2 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnQiangHuaJinShen3Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnQiangHuaJinShen3 == null)
            {
               this.btnQiangHuaJinShen3 = new NewSkinButton();
               this.btnQiangHuaJinShen3.skin = "qianghuajinshenButton";
               this.btnSpr.addChild(this.btnQiangHuaJinShen3);
               this.btnQiangHuaJinShen3.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnQiangHuaJinShen3.visible = param1;
         }
         else if(Boolean(this.btnQiangHuaJinShen3) && Boolean(this.btnQiangHuaJinShen3.parent))
         {
            this.btnQiangHuaJinShen3.parent.removeChild(this.btnQiangHuaJinShen3);
            this.btnQiangHuaJinShen3 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnYuanBaoYouHuiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnYuanBaoYouHui == null)
            {
               this.btnYuanBaoYouHui = new NewSkinButton();
               this.btnYuanBaoYouHui.skin = "yuanbaoyouhui_Button";
               this.btnSpr.addChild(this.btnYuanBaoYouHui);
               this.btnYuanBaoYouHui.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnYuanBaoYouHui.visible = param1;
         }
         else if(Boolean(this.btnYuanBaoYouHui) && Boolean(this.btnYuanBaoYouHui.parent))
         {
            this.btnYuanBaoYouHui.parent.removeChild(this.btnYuanBaoYouHui);
            this.btnYuanBaoYouHui = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnYuRenJie2018Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnYuRenJie2018 == null)
            {
               this.btnYuRenJie2018 = new NewSkinButton();
               this.btnYuRenJie2018.skin = "yurenjie2018_Button";
               this.btnSpr.addChild(this.btnYuRenJie2018);
               this.btnYuRenJie2018.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnYuRenJie2018.visible = param1;
         }
         else if(Boolean(this.btnYuRenJie2018) && Boolean(this.btnYuRenJie2018.parent))
         {
            this.btnYuRenJie2018.parent.removeChild(this.btnYuRenJie2018);
            this.btnYuRenJie2018 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnChangNianChongZhi1Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnChangNianChongZhi1 == null)
            {
               this.btnChangNianChongZhi1 = new NewSkinButton();
               this.btnChangNianChongZhi1.skin = "changnianchongzhi_Button";
               this.btnSpr.addChild(this.btnChangNianChongZhi1);
               this.btnChangNianChongZhi1.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnChangNianChongZhi1.visible = param1;
         }
         else if(Boolean(this.btnChangNianChongZhi1) && Boolean(this.btnChangNianChongZhi1.parent))
         {
            this.btnChangNianChongZhi1.parent.removeChild(this.btnChangNianChongZhi1);
            this.btnChangNianChongZhi1 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnChangNianChongZhi2Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnChangNianChongZhi2 == null)
            {
               this.btnChangNianChongZhi2 = new NewSkinButton();
               this.btnChangNianChongZhi2.skin = "changnianchongzhi_Button";
               this.btnSpr.addChild(this.btnChangNianChongZhi2);
               this.btnChangNianChongZhi2.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnChangNianChongZhi2.visible = param1;
         }
         else if(Boolean(this.btnChangNianChongZhi2) && Boolean(this.btnChangNianChongZhi2.parent))
         {
            this.btnChangNianChongZhi2.parent.removeChild(this.btnChangNianChongZhi2);
            this.btnChangNianChongZhi2 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnChangNianChongZhi3Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnChangNianChongZhi3 == null)
            {
               this.btnChangNianChongZhi3 = new NewSkinButton();
               this.btnChangNianChongZhi3.skin = "changnianchongzhi_Button";
               this.btnSpr.addChild(this.btnChangNianChongZhi3);
               this.btnChangNianChongZhi3.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnChangNianChongZhi3.visible = param1;
         }
         else if(Boolean(this.btnChangNianChongZhi3) && Boolean(this.btnChangNianChongZhi3.parent))
         {
            this.btnChangNianChongZhi3.parent.removeChild(this.btnChangNianChongZhi3);
            this.btnChangNianChongZhi3 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnChangNianChongZhi4Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnChangNianChongZhi4 == null)
            {
               this.btnChangNianChongZhi4 = new NewSkinButton();
               this.btnChangNianChongZhi4.skin = "changnianchongzhi_Button";
               this.btnSpr.addChild(this.btnChangNianChongZhi4);
               this.btnChangNianChongZhi4.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnChangNianChongZhi4.visible = param1;
         }
         else if(Boolean(this.btnChangNianChongZhi4) && Boolean(this.btnChangNianChongZhi4.parent))
         {
            this.btnChangNianChongZhi4.parent.removeChild(this.btnChangNianChongZhi4);
            this.btnChangNianChongZhi4 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnChangNianChongZhi5Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnChangNianChongZhi5 == null)
            {
               this.btnChangNianChongZhi5 = new NewSkinButton();
               this.btnChangNianChongZhi5.skin = "changnianchongzhi_Button";
               this.btnSpr.addChild(this.btnChangNianChongZhi5);
               this.btnChangNianChongZhi5.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnChangNianChongZhi5.visible = param1;
         }
         else if(Boolean(this.btnChangNianChongZhi5) && Boolean(this.btnChangNianChongZhi5.parent))
         {
            this.btnChangNianChongZhi5.parent.removeChild(this.btnChangNianChongZhi5);
            this.btnChangNianChongZhi5 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnWuSeTangYuanVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnWuSeTangYuan == null)
            {
               this.btnWuSeTangYuan = new NewSkinButton();
               this.btnWuSeTangYuan.skin = "wusetangyuan_Button";
               this.btnSpr.addChild(this.btnWuSeTangYuan);
               this.btnWuSeTangYuan.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnWuSeTangYuan.visible = param1;
         }
         else if(Boolean(this.btnWuSeTangYuan) && Boolean(this.btnWuSeTangYuan.parent))
         {
            this.btnWuSeTangYuan.parent.removeChild(this.btnWuSeTangYuan);
            this.btnWuSeTangYuan = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnHanShiJieVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnHanShiJie == null)
            {
               this.btnHanShiJie = new NewSkinButton();
               this.btnHanShiJie.skin = "hanshjie_Button";
               this.btnSpr.addChild(this.btnHanShiJie);
               this.btnHanShiJie.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnHanShiJie.visible = param1;
         }
         else if(Boolean(this.btnHanShiJie) && Boolean(this.btnHanShiJie.parent))
         {
            this.btnHanShiJie.parent.removeChild(this.btnHanShiJie);
            this.btnHanShiJie = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnDaShengZhouQiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnDaShengZhouQi == null)
            {
               this.btnDaShengZhouQi = new NewSkinButton();
               this.btnDaShengZhouQi.skin = "dashengzhouqi_Button";
               this.btnSpr.addChild(this.btnDaShengZhouQi);
               this.btnDaShengZhouQi.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnDaShengZhouQi.visible = param1;
         }
         else if(Boolean(this.btnDaShengZhouQi) && Boolean(this.btnDaShengZhouQi.parent))
         {
            this.btnDaShengZhouQi.parent.removeChild(this.btnDaShengZhouQi);
            this.btnDaShengZhouQi = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtn2018LaoDongJieVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btn2018LaoDongJie == null)
            {
               this.btn2018LaoDongJie = new NewSkinButton();
               this.btn2018LaoDongJie.skin = "chunjie25_Button";
               this.btnSpr.addChild(this.btn2018LaoDongJie);
               this.btn2018LaoDongJie.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btn2018LaoDongJie.visible = param1;
         }
         else if(Boolean(this.btn2018LaoDongJie) && Boolean(this.btn2018LaoDongJie.parent))
         {
            this.btn2018LaoDongJie.parent.removeChild(this.btn2018LaoDongJie);
            this.btn2018LaoDongJie = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnBanBenYouHuiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnBanBenYouHui == null)
            {
               this.btnBanBenYouHui = new NewSkinButton();
               this.btnBanBenYouHui.skin = "banbenyouhui20180604_Button";
               this.btnSpr.addChild(this.btnBanBenYouHui);
               this.btnBanBenYouHui.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnBanBenYouHui.visible = param1;
         }
         else if(Boolean(this.btnBanBenYouHui) && Boolean(this.btnBanBenYouHui.parent))
         {
            this.btnBanBenYouHui.parent.removeChild(this.btnBanBenYouHui);
            this.btnBanBenYouHui = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnLiXia2018Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnLiXia2018 == null)
            {
               this.btnLiXia2018 = new NewSkinButton();
               this.btnLiXia2018.skin = "lixia2018_Button";
               this.btnSpr.addChild(this.btnLiXia2018);
               this.btnLiXia2018.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnLiXia2018.visible = param1;
         }
         else if(Boolean(this.btnLiXia2018) && Boolean(this.btnLiXia2018.parent))
         {
            this.btnLiXia2018.parent.removeChild(this.btnLiXia2018);
            this.btnLiXia2018 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnShuiGuoLeiJiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnShuiGuoLeiJi == null)
            {
               this.btnShuiGuoLeiJi = new NewSkinButton();
               this.btnShuiGuoLeiJi.skin = "shuiguoleiji_Button";
               this.btnSpr.addChild(this.btnShuiGuoLeiJi);
               this.btnShuiGuoLeiJi.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnShuiGuoLeiJi.visible = param1;
         }
         else if(Boolean(this.btnShuiGuoLeiJi) && Boolean(this.btnShuiGuoLeiJi.parent))
         {
            this.btnShuiGuoLeiJi.parent.removeChild(this.btnShuiGuoLeiJi);
            this.btnShuiGuoLeiJi = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtn519HuoDong2018Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btn519HuoDong2018 == null)
            {
               this.btn519HuoDong2018 = new NewSkinButton();
               this.btn519HuoDong2018.skin = "huodong519_Button";
               this.btnSpr.addChild(this.btn519HuoDong2018);
               this.btn519HuoDong2018.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btn519HuoDong2018.visible = param1;
         }
         else if(Boolean(this.btn519HuoDong2018) && Boolean(this.btn519HuoDong2018.parent))
         {
            this.btn519HuoDong2018.parent.removeChild(this.btn519HuoDong2018);
            this.btn519HuoDong2018 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnTianXiaWuGongChuShaoLinVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnTianXiaWuGongChuShaoLin == null)
            {
               this.btnTianXiaWuGongChuShaoLin = new NewSkinButton();
               this.btnTianXiaWuGongChuShaoLin.skin = "tianxiawugong_Button";
               this.btnSpr.addChild(this.btnTianXiaWuGongChuShaoLin);
               this.btnTianXiaWuGongChuShaoLin.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnTianXiaWuGongChuShaoLin.visible = param1;
         }
         else if(Boolean(this.btnTianXiaWuGongChuShaoLin) && Boolean(this.btnTianXiaWuGongChuShaoLin.parent))
         {
            this.btnTianXiaWuGongChuShaoLin.parent.removeChild(this.btnTianXiaWuGongChuShaoLin);
            this.btnTianXiaWuGongChuShaoLin = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnXiaRiShuiGuoVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnXiaRiShuiGuo == null)
            {
               this.btnXiaRiShuiGuo = new NewSkinButton();
               this.btnXiaRiShuiGuo.skin = "xiatianshuiguo_Button";
               this.btnSpr.addChild(this.btnXiaRiShuiGuo);
               this.btnXiaRiShuiGuo.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnXiaRiShuiGuo.visible = param1;
         }
         else if(Boolean(this.btnXiaRiShuiGuo) && Boolean(this.btnXiaRiShuiGuo.parent))
         {
            this.btnXiaRiShuiGuo.parent.removeChild(this.btnXiaRiShuiGuo);
            this.btnXiaRiShuiGuo = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnChaoJiZhouQiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnChaoJiZhouQi == null)
            {
               this.btnChaoJiZhouQi = new NewSkinButton();
               this.btnChaoJiZhouQi.skin = "chaojizhouqi20180604_Button";
               this.btnSpr.addChild(this.btnChaoJiZhouQi);
               this.btnChaoJiZhouQi.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnChaoJiZhouQi.visible = param1;
         }
         else if(Boolean(this.btnChaoJiZhouQi) && Boolean(this.btnChaoJiZhouQi.parent))
         {
            this.btnChaoJiZhouQi.parent.removeChild(this.btnChaoJiZhouQi);
            this.btnChaoJiZhouQi = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnYueXiaoFeiYueLingJiangVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnYueXiaoFeiYueLingJiang == null)
            {
               this.btnYueXiaoFeiYueLingJiang = new NewSkinButton();
               this.btnYueXiaoFeiYueLingJiang.skin = "yuexiaofei_Button";
               this.btnSpr.addChild(this.btnYueXiaoFeiYueLingJiang);
               this.btnYueXiaoFeiYueLingJiang.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnYueXiaoFeiYueLingJiang.visible = param1;
         }
         else if(Boolean(this.btnYueXiaoFeiYueLingJiang) && Boolean(this.btnYueXiaoFeiYueLingJiang.parent))
         {
            this.btnYueXiaoFeiYueLingJiang.parent.removeChild(this.btnYueXiaoFeiYueLingJiang);
            this.btnYueXiaoFeiYueLingJiang = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnZhiZunChengHaoZhengDuoVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnZhiZunChengHaoZhengDuo == null)
            {
               this.btnZhiZunChengHaoZhengDuo = new NewSkinButton();
               this.btnZhiZunChengHaoZhengDuo.skin = "zhizunchenghao_Button";
               this.btnSpr.addChild(this.btnZhiZunChengHaoZhengDuo);
               this.btnZhiZunChengHaoZhengDuo.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnZhiZunChengHaoZhengDuo.visible = param1;
         }
         else if(Boolean(this.btnZhiZunChengHaoZhengDuo) && Boolean(this.btnZhiZunChengHaoZhengDuo.parent))
         {
            this.btnZhiZunChengHaoZhengDuo.parent.removeChild(this.btnZhiZunChengHaoZhengDuo);
            this.btnZhiZunChengHaoZhengDuo = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnTaoHuaZhiJingVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnTaoHuaZhiJing == null)
            {
               this.btnTaoHuaZhiJing = new NewSkinButton();
               this.btnTaoHuaZhiJing.skin = "taohuazhijing_Button";
               this.btnSpr.addChild(this.btnTaoHuaZhiJing);
               this.btnTaoHuaZhiJing.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnTaoHuaZhiJing.visible = param1;
         }
         else if(Boolean(this.btnTaoHuaZhiJing) && Boolean(this.btnTaoHuaZhiJing.parent))
         {
            this.btnTaoHuaZhiJing.parent.removeChild(this.btnTaoHuaZhiJing);
            this.btnTaoHuaZhiJing = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnQuanZhenXiaoYaoVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnQuanZhenXiaoYao == null)
            {
               this.btnQuanZhenXiaoYao = new NewSkinButton();
               this.btnQuanZhenXiaoYao.skin = "quanzhenxiaoyao_Button";
               this.btnSpr.addChild(this.btnQuanZhenXiaoYao);
               this.btnQuanZhenXiaoYao.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnQuanZhenXiaoYao.visible = param1;
         }
         else if(Boolean(this.btnQuanZhenXiaoYao) && Boolean(this.btnQuanZhenXiaoYao.parent))
         {
            this.btnQuanZhenXiaoYao.parent.removeChild(this.btnQuanZhenXiaoYao);
            this.btnQuanZhenXiaoYao = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnFeiShengJingJieVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnFeiShengJingJie == null)
            {
               this.btnFeiShengJingJie = new NewSkinButton();
               this.btnFeiShengJingJie.skin = "feishengjingjie_Button";
               this.btnSpr.addChild(this.btnFeiShengJingJie);
               this.btnFeiShengJingJie.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnFeiShengJingJie.visible = param1;
         }
         else if(Boolean(this.btnFeiShengJingJie) && Boolean(this.btnFeiShengJingJie.parent))
         {
            this.btnFeiShengJingJie.parent.removeChild(this.btnFeiShengJingJie);
            this.btnFeiShengJingJie = null;
         }
         this.setAnniuPosition();
      }
      
      public function setbtnShiJieBei2018Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnShiJieBei2018 == null)
            {
               this.btnShiJieBei2018 = new NewSkinButton();
               this.btnShiJieBei2018.skin = "shijiebei2018_Button";
               this.btnSpr.addChild(this.btnShiJieBei2018);
               this.btnShiJieBei2018.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnShiJieBei2018.visible = param1;
         }
         else if(Boolean(this.btnShiJieBei2018) && Boolean(this.btnShiJieBei2018.parent))
         {
            this.btnShiJieBei2018.parent.removeChild(this.btnShiJieBei2018);
            this.btnShiJieBei2018 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setbtnBuBaiJinShenVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnBuBaiJinShen == null)
            {
               this.btnBuBaiJinShen = new NewSkinButton();
               this.btnBuBaiJinShen.skin = "quanzhenxiaoyao_Button";
               this.btnSpr.addChild(this.btnBuBaiJinShen);
               this.btnBuBaiJinShen.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnBuBaiJinShen.visible = param1;
         }
         else if(Boolean(this.btnBuBaiJinShen) && Boolean(this.btnBuBaiJinShen.parent))
         {
            this.btnBuBaiJinShen.parent.removeChild(this.btnBuBaiJinShen);
            this.btnBuBaiJinShen = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnLianXuBaoMingVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnLianXuBaoMing == null)
            {
               this.btnLianXuBaoMing = new NewSkinButton();
               this.btnLianXuBaoMing.skin = "lianxubaoming_Button";
               this.btnSpr.addChild(this.btnLianXuBaoMing);
               this.btnLianXuBaoMing.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnLianXuBaoMing.visible = param1;
         }
         else if(Boolean(this.btnLianXuBaoMing) && Boolean(this.btnLianXuBaoMing.parent))
         {
            this.btnLianXuBaoMing.parent.removeChild(this.btnLianXuBaoMing);
            this.btnLianXuBaoMing = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnDuanWuJie2018Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnDuanWu2018 == null)
            {
               this.btnDuanWu2018 = new NewSkinButton();
               this.btnDuanWu2018.skin = "duanwujie2019_Button";
               this.btnSpr.addChild(this.btnDuanWu2018);
               this.btnDuanWu2018.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnDuanWu2018.visible = param1;
         }
         else if(Boolean(this.btnDuanWu2018) && Boolean(this.btnDuanWu2018.parent))
         {
            this.btnDuanWu2018.parent.removeChild(this.btnDuanWu2018);
            this.btnDuanWu2018 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnXiaTianKuaiLeVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnXiaTianKuaiLe == null)
            {
               this.btnXiaTianKuaiLe = new NewSkinButton();
               this.btnXiaTianKuaiLe.skin = "xiatiankuaile_Button";
               this.btnSpr.addChild(this.btnXiaTianKuaiLe);
               this.btnXiaTianKuaiLe.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnXiaTianKuaiLe.visible = param1;
         }
         else if(Boolean(this.btnXiaTianKuaiLe) && Boolean(this.btnXiaTianKuaiLe.parent))
         {
            this.btnXiaTianKuaiLe.parent.removeChild(this.btnXiaTianKuaiLe);
            this.btnXiaTianKuaiLe = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnHuanQiukaiMuVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnHuanQiuKaiMu == null)
            {
               this.btnHuanQiuKaiMu = new NewSkinButton();
               this.btnHuanQiuKaiMu.skin = "huanqiukaimu_Button";
               this.btnSpr.addChild(this.btnHuanQiuKaiMu);
               this.btnHuanQiuKaiMu.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnHuanQiuKaiMu.visible = param1;
         }
         else if(Boolean(this.btnHuanQiuKaiMu) && Boolean(this.btnHuanQiuKaiMu.parent))
         {
            this.btnHuanQiuKaiMu.parent.removeChild(this.btnHuanQiuKaiMu);
            this.btnHuanQiuKaiMu = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnMingJiaoZhiZunVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnMingJiaoZhiZun == null)
            {
               this.btnMingJiaoZhiZun = new NewSkinButton();
               this.btnMingJiaoZhiZun.skin = "mingjiaozhizun_Button";
               this.btnSpr.addChild(this.btnMingJiaoZhiZun);
               this.btnMingJiaoZhiZun.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnMingJiaoZhiZun.visible = param1;
         }
         else if(Boolean(this.btnMingJiaoZhiZun) && Boolean(this.btnMingJiaoZhiZun.parent))
         {
            this.btnMingJiaoZhiZun.parent.removeChild(this.btnMingJiaoZhiZun);
            this.btnMingJiaoZhiZun = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnYaoJueHuoDongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnYaoJue == null)
            {
               this.btnYaoJue = new NewSkinButton();
               this.btnYaoJue.skin = "guihuabing_Button";
               this.btnSpr.addChild(this.btnYaoJue);
               this.btnYaoJue.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnYaoJue.visible = param1;
         }
         else if(Boolean(this.btnYaoJue) && Boolean(this.btnYaoJue.parent))
         {
            this.btnYaoJue.parent.removeChild(this.btnYaoJue);
            this.btnYaoJue = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnZaiXianLeiJiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnZaiXianLeiJi == null)
            {
               this.btnZaiXianLeiJi = new NewSkinButton();
               this.btnZaiXianLeiJi.skin = "banben20180619_Button";
               this.btnSpr.addChild(this.btnZaiXianLeiJi);
               this.btnZaiXianLeiJi.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnZaiXianLeiJi.visible = param1;
         }
         else if(Boolean(this.btnZaiXianLeiJi) && Boolean(this.btnZaiXianLeiJi.parent))
         {
            this.btnZaiXianLeiJi.parent.removeChild(this.btnZaiXianLeiJi);
            this.btnZaiXianLeiJi = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnFeiShengShenBaoVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnFeiShengShenBao == null)
            {
               this.btnFeiShengShenBao = new NewSkinButton();
               this.btnFeiShengShenBao.skin = "feishengshenbao_Button";
               this.btnSpr.addChild(this.btnFeiShengShenBao);
               this.btnFeiShengShenBao.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnFeiShengShenBao.visible = param1;
         }
         else if(Boolean(this.btnFeiShengShenBao) && Boolean(this.btnFeiShengShenBao.parent))
         {
            this.btnFeiShengShenBao.parent.removeChild(this.btnFeiShengShenBao);
            this.btnFeiShengShenBao = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnBuChangVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnBuChang == null)
            {
               this.btnBuChang = new NewSkinButton();
               this.btnBuChang.skin = "buchang_Button";
               this.btnSpr.addChild(this.btnBuChang);
               this.btnBuChang.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnBuChang.visible = param1;
         }
         else if(Boolean(this.btnBuChang) && Boolean(this.btnBuChang.parent))
         {
            this.btnBuChang.parent.removeChild(this.btnBuChang);
            this.btnBuChang = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnZhengDuoZhanVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnZhengDuoZhan == null)
            {
               this.btnZhengDuoZhan = new NewSkinButton();
               this.btnZhengDuoZhan.skin = "zhengduozhan_Button";
               this.btnSpr.addChild(this.btnZhengDuoZhan);
               this.btnZhengDuoZhan.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnZhengDuoZhan.visible = param1;
         }
         else if(Boolean(this.btnZhengDuoZhan) && Boolean(this.btnZhengDuoZhan.parent))
         {
            this.btnZhengDuoZhan.parent.removeChild(this.btnZhengDuoZhan);
            this.btnZhengDuoZhan = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnDaGengXinHuoDongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnDaGengXinHD == null)
            {
               this.btnDaGengXinHD = new NewSkinButton();
               this.btnDaGengXinHD.skin = "dagenxinHD_Button";
               this.btnSpr.addChild(this.btnDaGengXinHD);
               this.btnDaGengXinHD.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnDaGengXinHD.visible = param1;
         }
         else if(Boolean(this.btnDaGengXinHD) && Boolean(this.btnDaGengXinHD.parent))
         {
            this.btnDaGengXinHD.parent.removeChild(this.btnDaGengXinHD);
            this.btnDaGengXinHD = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnWangZheZhouQiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnWangZheZQ == null)
            {
               this.btnWangZheZQ = new NewSkinButton();
               this.btnWangZheZQ.skin = "wangzheZQ_Button";
               this.btnSpr.addChild(this.btnWangZheZQ);
               this.btnWangZheZQ.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnWangZheZQ.visible = param1;
         }
         else if(Boolean(this.btnWangZheZQ) && Boolean(this.btnWangZheZQ.parent))
         {
            this.btnWangZheZQ.parent.removeChild(this.btnWangZheZQ);
            this.btnWangZheZQ = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnDuiHuanGongNengVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnDuiHuanGN == null)
            {
               this.btnDuiHuanGN = new NewSkinButton();
               this.btnDuiHuanGN.skin = "duihuanGN_Button";
               this.btnSpr.addChild(this.btnDuiHuanGN);
               this.btnDuiHuanGN.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnDuiHuanGN.visible = param1;
         }
         else if(Boolean(this.btnDuiHuanGN) && Boolean(this.btnDuiHuanGN.parent))
         {
            this.btnDuiHuanGN.parent.removeChild(this.btnDuiHuanGN);
            this.btnDuiHuanGN = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnXingYunXingXingVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnXingYunXX == null)
            {
               this.btnXingYunXX = new NewSkinButton();
               this.btnXingYunXX.skin = "xingyunXX_Button";
               this.btnSpr.addChild(this.btnXingYunXX);
               this.btnXingYunXX.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnXingYunXX.visible = param1;
         }
         else if(Boolean(this.btnXingYunXX) && Boolean(this.btnXingYunXX.parent))
         {
            this.btnXingYunXX.parent.removeChild(this.btnXingYunXX);
            this.btnXingYunXX = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnWangZheZhiBangHDVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnWangZheZhiBangHD == null)
            {
               this.btnWangZheZhiBangHD = new NewSkinButton();
               this.btnWangZheZhiBangHD.skin = "wangbangHD_Button";
               this.btnSpr.addChild(this.btnWangZheZhiBangHD);
               this.btnWangZheZhiBangHD.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnWangZheZhiBangHD.visible = param1;
         }
         else if(Boolean(this.btnWangZheZhiBangHD) && Boolean(this.btnWangZheZhiBangHD.parent))
         {
            this.btnWangZheZhiBangHD.parent.removeChild(this.btnWangZheZhiBangHD);
            this.btnWangZheZhiBangHD = null;
         }
         this.setAnniuPosition();
      }
      
      public function setMoShouZhanChangBtnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.moshouzhanchangBtn == null)
            {
               this.moshouzhanchangBtn = new NewSkinButton();
               this.moshouzhanchangBtn.skin = "moshouzhanchang_Button";
               this.btnSpr.addChild(this.moshouzhanchangBtn);
               this.moshouzhanchangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.moshouzhanchangBtn.visible = param1;
         }
         else if(Boolean(this.moshouzhanchangBtn) && Boolean(this.moshouzhanchangBtn.parent))
         {
            this.moshouzhanchangBtn.parent.removeChild(this.moshouzhanchangBtn);
            this.moshouzhanchangBtn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnYingXiongHuoDongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnYingXiongHuoDong == null)
            {
               this.btnYingXiongHuoDong = new NewSkinButton();
               this.btnYingXiongHuoDong.skin = "yingxiongHD_Button";
               this.btnSpr.addChild(this.btnYingXiongHuoDong);
               this.btnYingXiongHuoDong.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnYingXiongHuoDong.visible = param1;
         }
         else if(Boolean(this.btnYingXiongHuoDong) && Boolean(this.btnYingXiongHuoDong.parent))
         {
            this.btnYingXiongHuoDong.parent.removeChild(this.btnYingXiongHuoDong);
            this.btnYingXiongHuoDong = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnHuanYingBaYueVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnHuanYingBaYue == null)
            {
               this.btnHuanYingBaYue = new NewSkinButton();
               this.btnHuanYingBaYue.skin = "12yuechu_Button";
               this.btnSpr.addChild(this.btnHuanYingBaYue);
               this.btnHuanYingBaYue.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnHuanYingBaYue.visible = param1;
         }
         else if(Boolean(this.btnHuanYingBaYue) && Boolean(this.btnHuanYingBaYue.parent))
         {
            this.btnHuanYingBaYue.parent.removeChild(this.btnHuanYingBaYue);
            this.btnHuanYingBaYue = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnMeiJiuPaiHangVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnMeiJiuPaiHang == null)
            {
               this.btnMeiJiuPaiHang = new NewSkinButton();
               this.btnMeiJiuPaiHang.skin = "meijiupaihang_Button";
               this.btnSpr.addChild(this.btnMeiJiuPaiHang);
               this.btnMeiJiuPaiHang.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnMeiJiuPaiHang.visible = param1;
         }
         else if(Boolean(this.btnMeiJiuPaiHang) && Boolean(this.btnMeiJiuPaiHang.parent))
         {
            this.btnMeiJiuPaiHang.parent.removeChild(this.btnMeiJiuPaiHang);
            this.btnMeiJiuPaiHang = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnNiangJiuHuoDongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnNiangJiuHuoDong == null)
            {
               this.btnNiangJiuHuoDong = new NewSkinButton();
               this.btnNiangJiuHuoDong.skin = "niangjiuhuodong_Button";
               this.btnSpr.addChild(this.btnNiangJiuHuoDong);
               this.btnNiangJiuHuoDong.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnNiangJiuHuoDong.visible = param1;
         }
         else if(Boolean(this.btnNiangJiuHuoDong) && Boolean(this.btnNiangJiuHuoDong.parent))
         {
            this.btnNiangJiuHuoDong.parent.removeChild(this.btnNiangJiuHuoDong);
            this.btnNiangJiuHuoDong = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnYuLanZhouQiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnYuLanZhouQi == null)
            {
               this.btnYuLanZhouQi = new NewSkinButton();
               this.btnYuLanZhouQi.skin = "yulanzhouqi_Button";
               this.btnSpr.addChild(this.btnYuLanZhouQi);
               this.btnYuLanZhouQi.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnYuLanZhouQi.visible = param1;
         }
         else if(Boolean(this.btnYuLanZhouQi) && Boolean(this.btnYuLanZhouQi.parent))
         {
            this.btnYuLanZhouQi.parent.removeChild(this.btnYuLanZhouQi);
            this.btnYuLanZhouQi = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnYuLanZhiEnVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnYuLanZhiEn == null)
            {
               this.btnYuLanZhiEn = new NewSkinButton();
               this.btnYuLanZhiEn.skin = "yulanzhien_Button";
               this.btnSpr.addChild(this.btnYuLanZhiEn);
               this.btnYuLanZhiEn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnYuLanZhiEn.visible = param1;
         }
         else if(Boolean(this.btnYuLanZhiEn) && Boolean(this.btnYuLanZhiEn.parent))
         {
            this.btnYuLanZhiEn.parent.removeChild(this.btnYuLanZhiEn);
            this.btnYuLanZhiEn = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnGuoQingZhouQiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnGuoQingZhouQi == null)
            {
               this.btnGuoQingZhouQi = new NewSkinButton();
               this.btnGuoQingZhouQi.skin = "guoqingzhouqi_Button";
               this.btnSpr.addChild(this.btnGuoQingZhouQi);
               this.btnGuoQingZhouQi.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnGuoQingZhouQi.visible = param1;
         }
         else if(Boolean(this.btnGuoQingZhouQi) && Boolean(this.btnGuoQingZhouQi.parent))
         {
            this.btnGuoQingZhouQi.parent.removeChild(this.btnGuoQingZhouQi);
            this.btnGuoQingZhouQi = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnGuoQingZengSongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnGuoQingZengSong == null)
            {
               this.btnGuoQingZengSong = new NewSkinButton();
               this.btnGuoQingZengSong.skin = "guoqingzengsong_Button";
               this.btnSpr.addChild(this.btnGuoQingZengSong);
               this.btnGuoQingZengSong.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnGuoQingZengSong.visible = param1;
         }
         else if(Boolean(this.btnGuoQingZengSong) && Boolean(this.btnGuoQingZengSong.parent))
         {
            this.btnGuoQingZengSong.parent.removeChild(this.btnGuoQingZengSong);
            this.btnGuoQingZengSong = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnZiHaoZhanDouVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnZiHaoZhanDou == null)
            {
               this.btnZiHaoZhanDou = new NewSkinButton();
               this.btnZiHaoZhanDou.skin = "yulanzhien_Button";
               this.btnSpr.addChild(this.btnZiHaoZhanDou);
               this.btnZiHaoZhanDou.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnZiHaoZhanDou.visible = param1;
         }
         else if(Boolean(this.btnZiHaoZhanDou) && Boolean(this.btnZiHaoZhanDou.parent))
         {
            this.btnZiHaoZhanDou.parent.removeChild(this.btnZiHaoZhanDou);
            this.btnZiHaoZhanDou = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnYingJieGuoQingVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnYingJieGuoQing == null)
            {
               this.btnYingJieGuoQing = new NewSkinButton();
               this.btnYingJieGuoQing.skin = "yingjieguoqing_Button";
               this.btnSpr.addChild(this.btnYingJieGuoQing);
               this.btnYingJieGuoQing.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnYingJieGuoQing.visible = param1;
         }
         else if(Boolean(this.btnYingJieGuoQing) && Boolean(this.btnYingJieGuoQing.parent))
         {
            this.btnYingJieGuoQing.parent.removeChild(this.btnYingJieGuoQing);
            this.btnYingJieGuoQing = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnSiGuiZhouQiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnSiGuiZhouQi == null)
            {
               this.btnSiGuiZhouQi = new NewSkinButton();
               this.btnSiGuiZhouQi.skin = "siguizhouqi_Button";
               this.btnSpr.addChild(this.btnSiGuiZhouQi);
               this.btnSiGuiZhouQi.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnSiGuiZhouQi.visible = param1;
         }
         else if(Boolean(this.btnSiGuiZhouQi) && Boolean(this.btnSiGuiZhouQi.parent))
         {
            this.btnSiGuiZhouQi.parent.removeChild(this.btnSiGuiZhouQi);
            this.btnSiGuiZhouQi = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnShuangJiuHuoDongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnShuangJiuHuoDong == null)
            {
               this.btnShuangJiuHuoDong = new NewSkinButton();
               this.btnShuangJiuHuoDong.skin = "shuangjiuhuodong_Button";
               this.btnSpr.addChild(this.btnShuangJiuHuoDong);
               this.btnShuangJiuHuoDong.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnShuangJiuHuoDong.visible = param1;
         }
         else if(Boolean(this.btnShuangJiuHuoDong) && Boolean(this.btnShuangJiuHuoDong.parent))
         {
            this.btnShuangJiuHuoDong.parent.removeChild(this.btnShuangJiuHuoDong);
            this.btnShuangJiuHuoDong = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnZhongQiuZengSongVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnZhongQiuZengSong == null)
            {
               this.btnZhongQiuZengSong = new NewSkinButton();
               this.btnZhongQiuZengSong.skin = "zhongqiuzengsong_Button";
               this.btnSpr.addChild(this.btnZhongQiuZengSong);
               this.btnZhongQiuZengSong.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnZhongQiuZengSong.visible = param1;
         }
         else if(Boolean(this.btnZhongQiuZengSong) && Boolean(this.btnZhongQiuZengSong.parent))
         {
            this.btnZhongQiuZengSong.parent.removeChild(this.btnZhongQiuZengSong);
            this.btnZhongQiuZengSong = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnZhongQiuTianBingVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnZhongQiuTianBing == null)
            {
               this.btnZhongQiuTianBing = new NewSkinButton();
               this.btnZhongQiuTianBing.skin = "zhongqiutianbing_Button";
               this.btnSpr.addChild(this.btnZhongQiuTianBing);
               this.btnZhongQiuTianBing.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnZhongQiuTianBing.visible = param1;
         }
         else if(Boolean(this.btnZhongQiuTianBing) && Boolean(this.btnZhongQiuTianBing.parent))
         {
            this.btnZhongQiuTianBing.parent.removeChild(this.btnZhongQiuTianBing);
            this.btnZhongQiuTianBing = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnZhongQiuJie2018Visible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnZhongQiuJie2018 == null)
            {
               this.btnZhongQiuJie2018 = new NewSkinButton();
               this.btnZhongQiuJie2018.skin = "zhongqiujie2018_Button";
               this.btnSpr.addChild(this.btnZhongQiuJie2018);
               this.btnZhongQiuJie2018.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnZhongQiuJie2018.visible = param1;
         }
         else if(Boolean(this.btnZhongQiuJie2018) && Boolean(this.btnZhongQiuJie2018.parent))
         {
            this.btnZhongQiuJie2018.parent.removeChild(this.btnZhongQiuJie2018);
            this.btnZhongQiuJie2018 = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnZhongQiuZhouQiVisible(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.btnZhongQiuZhouQi == null)
            {
               this.btnZhongQiuZhouQi = new NewSkinButton();
               this.btnZhongQiuZhouQi.skin = "zhongqiuzhouqi_Button";
               this.btnSpr.addChild(this.btnZhongQiuZhouQi);
               this.btnZhongQiuZhouQi.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            this.btnZhongQiuZhouQi.visible = param1;
         }
         else if(Boolean(this.btnZhongQiuZhouQi) && Boolean(this.btnZhongQiuZhouQi.parent))
         {
            this.btnZhongQiuZhouQi.parent.removeChild(this.btnZhongQiuZhouQi);
            this.btnZhongQiuZhouQi = null;
         }
         this.setAnniuPosition();
      }
      
      public function setBtnVisible(param1:int, param2:Boolean, param3:Boolean = false) : void
      {
         switch(param1)
         {
            case 2759:
               this.btnShouJiGuWu = this.createBtn(param3,param1,this.btnShouJiGuWu,param2,"shoujiguwu_Button");
               this.setAnniuPosition();
               break;
            case 2760:
               this.btnQiuTianLiWu1 = this.createBtn(param3,param1,this.btnQiuTianLiWu1,param2,"qiutianliwu_Button");
               this.setAnniuPosition();
               break;
            case 2761:
               this.btnQiuTianLiWu2 = this.createBtn(param3,param1,this.btnQiuTianLiWu2,param2,"qiutianliwu_Button");
               this.setAnniuPosition();
               break;
            case 2762:
               this.btnShuangShiRiZi = this.createBtn(param3,param1,this.btnShuangShiRiZi,param2,"shuangshirizi_Button");
               this.setAnniuPosition();
               break;
            case 2763:
               this.ynWeixi2Btn = this.createBtn(param3,param1,this.ynWeixi2Btn,param2,"weixi");
               this.setAnniuPosition();
               break;
            case 2764:
               this.btnBanBenYouHui2 = this.createBtn(param3,param1,this.btnBanBenYouHui2,param2,"banbenyouhui20180604_Button");
               this.setAnniuPosition();
               break;
            case 2765:
               this.btnFeiShengJingJie2 = this.createBtn(param3,param1,this.btnFeiShengJingJie2,param2,"feishengjingjie_Button");
               this.setAnniuPosition();
               break;
            case 2766:
               this.btnChangNianChongZhi6 = this.createBtn(param3,param1,this.btnChangNianChongZhi6,param2,"changnianchongzhi_Button");
               this.setAnniuPosition();
               break;
            case 2767:
               this.btnChangNianChongZhi7 = this.createBtn(param3,param1,this.btnChangNianChongZhi7,param2,"changnianchongzhi_Button");
               this.setAnniuPosition();
               break;
            case 2768:
               this.btnChangNianChongZhi8 = this.createBtn(param3,param1,this.btnChangNianChongZhi8,param2,"changnianchongzhi_Button");
               this.setAnniuPosition();
               break;
            case 2769:
               this.btnChangNianChongZhi9 = this.createBtn(param3,param1,this.btnChangNianChongZhi9,param2,"changnianchongzhi_Button");
               this.setAnniuPosition();
               break;
            case 2770:
               this.btnChangNianChongZhi10 = this.createBtn(param3,param1,this.btnChangNianChongZhi10,param2,"changnianchongzhi_Button");
               this.setAnniuPosition();
               break;
            case 2771:
               this.btnQiangHuaJinShen4 = this.createBtn(param3,param1,this.btnQiangHuaJinShen4,param2,"qianghuajinshenButton");
               this.setAnniuPosition();
               break;
            case 2772:
               this.btnQiangHuaJinShen5 = this.createBtn(param3,param1,this.btnQiangHuaJinShen5,param2,"qianghuajinshenButton");
               this.setAnniuPosition();
               break;
            case 2773:
               this.btnQiangHuaJinShen6 = this.createBtn(param3,param1,this.btnQiangHuaJinShen6,param2,"qianghuajinshenButton");
               this.setAnniuPosition();
               break;
            case 2774:
               this.btnShuangLongZhan4 = this.createBtn(param3,param1,this.btnShuangLongZhan4,param2,"shuanglongzhan20180604_Button");
               this.setAnniuPosition();
               break;
            case 2775:
               this.btnTianRenHe3 = this.createBtn(param3,param1,this.btnTianRenHe3,param2,"tiarenheButton");
               this.setAnniuPosition();
               break;
            case 2776:
               this.btnTianRenHe4 = this.createBtn(param3,param1,this.btnTianRenHe4,param2,"tiarenheButton");
               this.setAnniuPosition();
               break;
            case 2777:
               this.btnTiaoZhanHuoDong = this.createBtn(param3,param1,this.btnTiaoZhanHuoDong,param2,"tiaozhanhuodong_Button");
               this.setAnniuPosition();
               break;
            case 2778:
               this.btnShouChongLiBao2 = this.createBtn(param3,param1,this.btnShouChongLiBao2,param2,"shouchonglibao2_Button");
               this.setAnniuPosition();
               break;
            case 2779:
               this.btnYingJieFuNvJie = this.createBtn(param3,param1,this.btnYingJieFuNvJie,param2,"yingjiefunvjie_Button");
               this.setAnniuPosition();
               break;
            case 2780:
               this.btnZhouYiKuaiLe = this.createBtn(param3,param1,this.btnZhouYiKuaiLe,param2,"zhouyikuaile_Button");
               this.setAnniuPosition();
               break;
            case 2823:
               this.btnZhouYiKuaiLe2 = this.createBtn(param3,param1,this.btnZhouYiKuaiLe2,param2,"zhouyikuaile_Button");
               this.setAnniuPosition();
               break;
            case 2781:
               this.btnZhouMoReNao = this.createBtn(param3,param1,this.btnZhouMoReNao,param2,"zhoumorenao_Button");
               this.setAnniuPosition();
               break;
            case 2782:
               this.btnTangguoduihuan = this.createBtn(param3,param1,this.btnTangguoduihuan,param2,"tangguoduihuan_Button");
               this.setAnniuPosition();
               break;
            case 2783:
               this.btnGongFaYouHui = this.createBtn(param3,param1,this.btnGongFaYouHui,param2,"gongfayouhui_Button");
               this.setAnniuPosition();
               break;
            case 2830:
               this.btnGongFaYouHui2 = this.createBtn(param3,param1,this.btnGongFaYouHui2,param2,"gongfayouhui_Button");
               this.setAnniuPosition();
               break;
            case 2784:
               this.btnWanShengYe = this.createBtn(param3,param1,this.btnWanShengYe,param2,"wanshengye_Button");
               this.setAnniuPosition();
               break;
            case 2785:
               this.btnBaoShiYangCheng = this.createBtn(param3,param1,this.btnBaoShiYangCheng,param2,"baoshiyangcheng_Button");
               this.setAnniuPosition();
               break;
            case 2786:
               this.btnDuanLianBaoShi = this.createBtn(param3,param1,this.btnDuanLianBaoShi,param2,"duanlianbaoshi_Button");
               this.setAnniuPosition();
               break;
            case 2787:
               this.btnMeiRiChongZhi = this.createBtn(param3,param1,this.btnMeiRiChongZhi,param2,"meirichongzhi_Button");
               this.setAnniuPosition();
               break;
            case 2832:
               this.btnMeiRiChongZhi2 = this.createBtn(param3,param1,this.btnMeiRiChongZhi2,param2,"meirichongzhi_Button");
               this.setAnniuPosition();
               break;
            case 2788:
               this.btnXingXingPaiHang = this.createBtn(param3,param1,this.btnXingXingPaiHang,param2,"xingxingpaihang_Button");
               this.setAnniuPosition();
               break;
            case 2789:
               this.btnShengRiZhouQi = this.createBtn(param3,param1,this.btnShengRiZhouQi,param2,"shengrizhouqi2018_Button");
               this.setAnniuPosition();
               break;
            case 2790:
               this.btnShengRiYuKuai = this.createBtn(param3,param1,this.btnShengRiYuKuai,param2,"shengriyukuai2018_Button");
               this.setAnniuPosition();
               break;
            case 2791:
               this.btnShuangLongZhan5 = this.createBtn(param3,param1,this.btnShuangLongZhan5,param2,"shuanglongzhan20180604_Button");
               this.setAnniuPosition();
               break;
            case 2792:
               this.btnShuangLongZhan6 = this.createBtn(param3,param1,this.btnShuangLongZhan6,param2,"shuanglongzhan20180604_Button");
               this.setAnniuPosition();
               break;
            case 2793:
               this.btnShiTuLieShou = this.createBtn(param3,param1,this.btnShiTuLieShou,param2,"shitulieshou_Button");
               this.setAnniuPosition();
               break;
            case 2794:
               this.btnShiTuJie = this.createBtn(param3,param1,this.btnShiTuJie,param2,"shitujie_Button");
               this.setAnniuPosition();
               break;
            case 2795:
               this.btnShuangLongZhan7 = this.createBtn(param3,param1,this.btnShuangLongZhan7,param2,"shuanglongzhan20180604_Button");
               this.setAnniuPosition();
               break;
            case 2797:
               this.btnTeShuLeiJi = this.createBtn(param3,param1,this.btnTeShuLeiJi,param2,"newteshuleiji_Button");
               this.setAnniuPosition();
               break;
            case 2798:
               this.btnXingYunYinSu = this.createBtn(param3,param1,this.btnXingYunYinSu,param2,"xingyunyinsu_Button");
               this.setAnniuPosition();
               break;
            case 2799:
               this.btnDongTianLieBu = this.createBtn(param3,param1,this.btnDongTianLieBu,param2,"dongtianliebu_Button");
               this.setAnniuPosition();
               break;
            case 2800:
               this.btnTeBieRiZi = this.createBtn(param3,param1,this.btnTeBieRiZi,param2,"teshurizi_Button");
               this.setAnniuPosition();
               break;
            case 2801:
               this.btnDongTianDuiHuan = this.createBtn(param3,param1,this.btnDongTianDuiHuan,param2,"dongtianduihuan_Button");
               this.setAnniuPosition();
               break;
            case 2802:
               this.btnShengDanLeiJi = this.createBtn(param3,param1,this.btnShengDanLeiJi,param2,"shengdanleiji_Button");
               this.setAnniuPosition();
               break;
            case 2803:
               this.btnShengDanKuaiLe = this.createBtn(param3,param1,this.btnShengDanKuaiLe,param2,"shengdankuaile_Button");
               this.setAnniuPosition();
               break;
            case 2804:
               this.btnShengDanHuoDong = this.createBtn(param3,param1,this.btnShengDanHuoDong,param2,"shengdanhuodong1_Button");
               this.setAnniuPosition();
               break;
            case 2805:
               this.btnZhiZaoYanHua = this.createBtn(param3,param1,this.btnZhiZaoYanHua,param2,"zhizaoyanhua_Button");
               this.setAnniuPosition();
               break;
            case 2806:
               this.btnXingZhuXinNian = this.createBtn(param3,param1,this.btnXingZhuXinNian,param2,"xingzhuxinnian_Button");
               this.setAnniuPosition();
               break;
            case 2807:
               this.btnNianDi2018 = this.createBtn(param3,param1,this.btnNianDi2018,param2,"niandi2018_Button");
               this.setAnniuPosition();
               break;
            case 2808:
               this.btnLiangTianLeiJi1 = this.createBtn(param3,param1,this.btnLiangTianLeiJi1,param2,"liangtianleiji_Button");
               this.setAnniuPosition();
               break;
            case 2809:
               this.btnLiangTianLeiJi2 = this.createBtn(param3,param1,this.btnLiangTianLeiJi2,param2,"liangtianleiji_Button");
               this.setAnniuPosition();
               break;
            case 2822:
               this.btnLiangTianLeiJi3 = this.createBtn(param3,param1,this.btnLiangTianLeiJi3,param2,"liangtianleiji_Button");
               this.setAnniuPosition();
               break;
            case 2866:
               this.btnLiangTianLeiJi4 = this.createBtn(param3,param1,this.btnLiangTianLeiJi4,param2,"liangtianleiji_Button");
               this.setAnniuPosition();
               break;
            case 2810:
               this.btnJiangHuZhan1 = this.createBtn(param3,param1,this.btnJiangHuZhan1,param2,"jianghuzhan_Button");
               this.setAnniuPosition();
               break;
            case 2811:
               this.btnJiangHuZhan2 = this.createBtn(param3,param1,this.btnJiangHuZhan2,param2,"jianghuzhan_Button");
               this.setAnniuPosition();
               break;
            case 2812:
               this.btnJiangHuZhan3 = this.createBtn(param3,param1,this.btnJiangHuZhan3,param2,"jianghuzhan_Button");
               this.setAnniuPosition();
               break;
            case 2813:
               this.btnJiangHuZhan4 = this.createBtn(param3,param1,this.btnJiangHuZhan4,param2,"jianghuzhan_Button");
               this.setAnniuPosition();
               break;
            case 2831:
               this.btnJiangHuZhan5 = this.createBtn(param3,param1,this.btnJiangHuZhan5,param2,"jianghuzhan_Button");
               this.setAnniuPosition();
               break;
            case 2819:
               this.btnJiangHuZhan6 = this.createBtn(param3,param1,this.btnJiangHuZhan6,param2,"jianghuzhan_Button");
               this.setAnniuPosition();
               break;
            case 2820:
               this.btnJiangHuZhan7 = this.createBtn(param3,param1,this.btnJiangHuZhan7,param2,"jianghuzhan_Button");
               this.setAnniuPosition();
               break;
            case 2821:
               this.btnJiangHuZhan8 = this.createBtn(param3,param1,this.btnJiangHuZhan8,param2,"jianghuzhan_Button");
               this.setAnniuPosition();
               break;
            case 2814:
               this.btnQiTianLeiJi = this.createBtn(param3,param1,this.btnQiTianLeiJi,param2,"qitianleiji2019_Button");
               this.setAnniuPosition();
               break;
            case 2815:
               this.btnZhuangWangGuiTian = this.createBtn(param3,param1,this.btnZhuangWangGuiTian,param2,"zhuangwangguitian_Button");
               this.setAnniuPosition();
               break;
            case 2816:
               this.btnZhuangWangCiShu = this.createBtn(param3,param1,this.btnZhuangWangCiShu,param2,"zhuangwangcishu_Button");
               this.setAnniuPosition();
               break;
            case 2817:
               this.btnZhuangWangJie = this.createBtn(param3,param1,this.btnZhuangWangJie,param2,"zhuangwangjie_Button");
               this.setAnniuPosition();
               break;
            case 2824:
               this.btnXinShouLeiJi = this.createBtn(param3,param1,this.btnXinShouLeiJi,param2,"xinshouleiji_Button");
               this.setAnniuPosition();
               break;
            case 2826:
               this.btnChunTianleiJi = this.createBtn(param3,param1,this.btnChunTianleiJi,param2,"chuntianleiji_Button");
               this.setAnniuPosition();
               break;
            case 2827:
               this.btnChuYiHuoDong = this.createBtn(param3,param1,this.btnChuYiHuoDong,param2,"chunjie37_Button");
               this.setAnniuPosition();
               break;
            case 2828:
               this.btnChuErHuoDong = this.createBtn(param3,param1,this.btnChuErHuoDong,param2,"chunjie37_Button");
               this.setAnniuPosition();
               break;
            case 2829:
               this.btnChuSanHuoDong = this.createBtn(param3,param1,this.btnChuSanHuoDong,param2,"chunjie37_Button");
               this.setAnniuPosition();
               break;
            case 2833:
               this.btnQingRenJie2019 = this.createBtn(param3,param1,this.btnQingRenJie2019,param2,"qingrenjie2019_Button");
               this.setAnniuPosition();
               break;
            case 2834:
               this.btnLieShouHuoDong2 = this.createBtn(param3,param1,this.btnLieShouHuoDong2,param2,"lieshou22019_Button");
               this.setAnniuPosition();
               break;
            case 2835:
               this.btnLieShouPaiHang2 = this.createBtn(param3,param1,this.btnLieShouPaiHang2,param2,"lieshoupaihang22019_Button");
               this.setAnniuPosition();
               break;
            case 2836:
               this.btnYiTianLeiJi = this.createBtn(param3,param1,this.btnYiTianLeiJi,param2,"yitianleiji_Button");
               this.setAnniuPosition();
               break;
            case 2837:
               this.btnFuNvJieHeLi = this.createBtn(param3,param1,this.btnFuNvJieHeLi,param2,"funvheli2019_Button");
               this.setAnniuPosition();
               break;
            case 2838:
               this.btnFuNvJiePaiHang = this.createBtn(param3,param1,this.btnFuNvJiePaiHang,param2,"funvpaihang2019_Button");
               this.setAnniuPosition();
               break;
            case 2839:
               this.btnBaiSeQingRenJie = this.createBtn(param3,param1,this.btnBaiSeQingRenJie,param2,"baiseqingrenjie2019_Button");
               this.setAnniuPosition();
               break;
            case 2840:
               this.btnLieShouPaiHang22 = this.createBtn(param3,param1,this.btnLieShouPaiHang22,param2,"paihangbang20190320_Button");
               this.setAnniuPosition();
               break;
            case 2841:
               this.btnYuRenJie2019 = this.createBtn(param3,param1,this.btnYuRenJie2019,param2,"chunjie22_Button");
               this.setAnniuPosition();
               break;
            case 2842:
               this.btnHanShiJie2019 = this.createBtn(param3,param1,this.btnHanShiJie2019,param2,"chunjie23_Button");
               this.setAnniuPosition();
               break;
            case 2843:
               this.btnZhiZunShenBao = this.createBtn(param3,param1,this.btnZhiZunShenBao,param2,"zhizunshenbao_Button");
               this.setAnniuPosition();
               break;
            case 2867:
               this.btnZhiZunShenBao2 = this.createBtn(param3,param1,this.btnZhiZunShenBao2,param2,"zhizunshenbao_Button");
               this.setAnniuPosition();
               break;
            case 2844:
               this.btnXiongWangJie = this.createBtn(param3,param1,this.btnXiongWangJie,param2,"chunjie24_Button");
               this.setAnniuPosition();
               break;
            case 2845:
               this.btnYingJieDaLi = this.createBtn(param3,param1,this.btnYingJieDaLi,param2,"yingjiedali_Button");
               this.setAnniuPosition();
               break;
            case 2846:
               this.btnShengGanHui = this.createBtn(param3,param1,this.btnShengGanHui,param2,"shengganhui_Button");
               this.setAnniuPosition();
               break;
            case 2847:
               this.btnErTongJie2019 = this.createBtn(param3,param1,this.btnErTongJie2019,param2,"ertongjie2019_Button");
               this.setAnniuPosition();
               break;
            case 2848:
               this.btnV400 = this.createBtn(param3,param1,this.btnV400,param2,"v400youhui_Button");
               this.setAnniuPosition();
               break;
            case 2849:
               this.btnXinBing = this.createBtn(param3,param1,this.btnXinBing,param2,"v400youhui_Button");
               this.setAnniuPosition();
               break;
            case 2850:
               this.btnLiuYueDi2019 = this.createBtn(param3,param1,this.btnLiuYueDi2019,param2,"liuyuedi2019_Button");
               this.setAnniuPosition();
               break;
            case 2851:
               this.btn7YueJingYing = this.createBtn(param3,param1,this.btn7YueJingYing,param2,"qiyuejingying2019_Button");
               this.setAnniuPosition();
               break;
            case 2852:
               this.btnQiYueDi2019 = this.createBtn(param3,param1,this.btnQiYueDi2019,param2,"qiyuedi2019_Button");
               this.setAnniuPosition();
               break;
            case 2853:
               this.btnQiXiJie2019 = this.createBtn(param3,param1,this.btnQiXiJie2019,param2,"qixiji2019_Button");
               this.setAnniuPosition();
               break;
            case 2854:
               this.btnShuangQuan1 = this.createBtn(param3,param1,this.btnShuangQuan1,param2,"shuanqguan_Button");
               this.setAnniuPosition();
               break;
            case 2855:
               this.btnShuangQuan2 = this.createBtn(param3,param1,this.btnShuangQuan2,param2,"shuanqguan_Button");
               this.setAnniuPosition();
               break;
            case 2856:
               this.btnShuangQuan3 = this.createBtn(param3,param1,this.btnShuangQuan3,param2,"shuanqguan_Button");
               this.setAnniuPosition();
               break;
            case 2869:
               this.btnShuangQuan4 = this.createBtn(param3,param1,this.btnShuangQuan4,param2,"shuanqguan_Button");
               this.setAnniuPosition();
               break;
            case 2870:
               this.btnShuangQuan5 = this.createBtn(param3,param1,this.btnShuangQuan5,param2,"shuanqguan_Button");
               this.setAnniuPosition();
               break;
            case 2871:
               this.btnShuangQuan6 = this.createBtn(param3,param1,this.btnShuangQuan6,param2,"shuanqguan_Button");
               this.setAnniuPosition();
               break;
            case 2857:
               this.btnZhuaYuTu = this.createBtn(param3,param1,this.btnZhuaYuTu,param2,"shangren_Button");
               this.setAnniuPosition();
               break;
            case 2858:
               this.btnLianXuDengLu = this.createBtn(param3,param1,this.btnLianXuDengLu,false,"lianxudenglu_Button");
               this.setAnniuPosition();
               break;
            case 2859:
               this.btnTeBieHuoDong = this.createBtn(param3,param1,this.btnTeBieHuoDong,param2,"tebiehuodong_Button");
               this.setAnniuPosition();
               break;
            case 2860:
               this.btnTeBieHuoDong2 = this.createBtn(param3,param1,this.btnTeBieHuoDong2,param2,"tebiehuodong_Button");
               this.setAnniuPosition();
               break;
            case 2861:
               this.btnGuoQingJie2019 = this.createBtn(param3,param1,this.btnGuoQingJie2019,param2,"guoqingjie2019_Button");
               this.setAnniuPosition();
               break;
            case 2862:
               this.btnBaYueYouHui = this.createBtn(param3,param1,this.btnBaYueYouHui,param2,"bayueyouhui2019_Button");
               this.setAnniuPosition();
               break;
            case 2863:
               this.btnXiongBangZhan = this.createBtn(param3,param1,this.btnXiongBangZhan,param2,"xiongzhanbang_Button");
               this.setAnniuPosition();
               break;
            case 2864:
               this.btnNeiTi = this.createBtn(param3,param1,this.btnNeiTi,param2,"neiti_Button");
               this.setAnniuPosition();
               break;
            case 2865:
               this.btnZhongQiuShangYue = this.createBtn(param3,param1,this.btnZhongQiuShangYue,param2,"zhongqiushangyue_Button");
               this.setAnniuPosition();
               break;
            case 2868:
               this.btn15tianyouhui = this.createBtn(param3,param1,this.btn15tianyouhui,param2,"shiwutianyouhui_Button");
               this.setAnniuPosition();
               break;
            case 2872:
               this.btnshangren = this.createBtn(param3,param1,this.btnshangren,param2,"shangren20180604_Button");
               this.setAnniuPosition();
               break;
            case 2873:
               this.btnFuNvJie = this.createBtn(param3,param1,this.btnFuNvJie,param2,"yuenanfunvjie_Button");
               this.setAnniuPosition();
               break;
            case 2256:
               this.xianMoZhiLuBtn = this.createBtn(param3,param1,this.xianMoZhiLuBtn,param2,"xmzl_Button");
               this.setAnniuPosition();
               break;
            case 2874:
               this.btnWanShengJie2019 = this.createBtn(param3,param1,this.btnWanShengJie2019,param2,"wanshengjie2019_Button");
               this.setAnniuPosition();
               break;
            case 2875:
               this.btnHuoDong1120 = this.createBtn(param3,param1,this.btnHuoDong1120,param2,"huodong1120_Button");
               this.setAnniuPosition();
               break;
            case 2876:
               this.btnDaZheKou = this.createBtn(param3,param1,this.btnDaZheKou,param2,"dazhekou_Button");
               this.setAnniuPosition();
               break;
            case 2877:
               this.btnJingYingLeiJi = this.createBtn(param3,param1,this.btnJingYingLeiJi,param2,"jingyingleiji_Button");
               this.setAnniuPosition();
               break;
            case 2878:
               this.btnJingYingHuiLing = this.createBtn(param3,param1,this.btnJingYingHuiLing,param2,"jingyinghuiling_Button");
               this.setAnniuPosition();
               break;
            case 2879:
               this.btnBaNianZhiMeng = this.createBtn(param3,param1,this.btnBaNianZhiMeng,param2,"banianzhimeng_Button");
               this.setAnniuPosition();
               break;
            case 2880:
               this.btnBaNianFuWuQi = this.createBtn(param3,param1,this.btnBaNianFuWuQi,param2,"banianfuwuqi_Button");
               this.setAnniuPosition();
               break;
            case 2881:
               this.btnBaNianBir = this.createBtn(param3,param1,this.btnBaNianBir,param2,"banianshengri_Button");
               this.setAnniuPosition();
               break;
            case 2883:
               this.btnShuang12 = this.createBtn(param3,param1,this.btnShuang12,param2,"shuang12_Button");
               this.setAnniuPosition();
               break;
            case 2884:
               this.btn2019ShengDan = this.createBtn(param3,param1,this.btn2019ShengDan,param2,"shengdan2019_Button");
               this.setAnniuPosition();
               break;
            case 2885:
               this.btnXueZhanFuWuQi = this.createBtn(param3,param1,this.btnXueZhanFuWuQi,param2,"xuezhanfuwuqi_Button");
               this.setAnniuPosition();
               break;
            case 2886:
               this.btnFanHuaFuWuQi = this.createBtn(param3,param1,this.btnFanHuaFuWuQi,param2,"fanhuafuwuqi_Button");
               this.setAnniuPosition();
               break;
            case 2887:
               this.btnNianDi2019 = this.createBtn(param3,param1,this.btnNianDi2019,param2,"niandi2019_Button");
               this.setAnniuPosition();
               break;
            case 2888:
               this.btnXinNianKuaiLe2019 = this.createBtn(param3,param1,this.btnXinNianKuaiLe2019,param2,"xiannian2019_Button");
               this.setAnniuPosition();
               break;
            case 2889:
               this.btnXiaoNianJie = this.createBtn(param3,param1,this.btnXiaoNianJie,param2,"xiaonianjie_Button");
               this.setAnniuPosition();
               break;
            case 2890:
               this.btnChunTuanYuan = this.createBtn(param3,param1,this.btnChunTuanYuan,param2,"chuntuanyuan_Button");
               this.setAnniuPosition();
               break;
            case 2891:
               this.btnChunJie1 = this.createBtn(param3,param1,this.btnChunJie1,param2,"chunjie1_Button");
               this.setAnniuPosition();
               break;
            case 2892:
               this.btnChunJie2 = this.createBtn(param3,param1,this.btnChunJie2,param2,"chunjie2_Button");
               this.setAnniuPosition();
               break;
            case 2893:
               this.btnChunJie3 = this.createBtn(param3,param1,this.btnChunJie3,param2,"chunjie3_Button");
               this.setAnniuPosition();
               break;
            case 2894:
               this.btnXinChunYingLu = this.createBtn(param3,param1,this.btnXinChunYingLu,param2,"chunjie4_Button");
               this.setAnniuPosition();
               break;
            case 2895:
               this.btnJingYingLeiJi2 = this.createBtn(param3,param1,this.btnJingYingLeiJi2,param2,"jingyingleiji_Button");
               this.setAnniuPosition();
               break;
            case 2896:
               this.btnyuanxiaojie2019 = this.createBtn(param3,param1,this.btnyuanxiaojie2019,param2,"chunjie5_Button");
               this.setAnniuPosition();
               break;
            case 2897:
               this.btnqingrenjie2020 = this.createBtn(param3,param1,this.btnqingrenjie2020,param2,"chunjie6_Button");
               this.setAnniuPosition();
               break;
            case 2898:
               this.btnsanbajie2020 = this.createBtn(param3,param1,this.btnsanbajie2020,param2,"chunjie6_Button");
               this.setAnniuPosition();
               break;
            case 2899:
               this.btnbaiseqingrenjie2 = this.createBtn(param3,param1,this.btnbaiseqingrenjie2,param2,"chunjie7_Button");
               this.setAnniuPosition();
               break;
            case 2900:
               this.btnxiongwang2020 = this.createBtn(param3,param1,this.btnxiongwang2020,param2,"chunjie8_Button");
               this.setAnniuPosition();
               break;
            case 2901:
               this.btnRongGuangDaRi = this.createBtn(param3,param1,this.btnRongGuangDaRi,param2,"chunjie9_Button");
               this.setAnniuPosition();
               break;
            case 2902:
               this.btnLeiJiZhengXiong = this.createBtn(param3,param1,this.btnLeiJiZhengXiong,param2,"chunjie10_Button");
               this.setAnniuPosition();
               break;
            case 2903:
               this.btnQiangGou16 = this.createBtn(param3,param1,this.btnQiangGou16,param2,"chunjie11_Button");
               this.setAnniuPosition();
               break;
            case 2904:
               this.btnDuanWuSanWang = this.createBtn(param3,param1,this.btnDuanWuSanWang,param2,"chunjie12_Button");
               this.setAnniuPosition();
               break;
            case 2905:
               this.btnDiWangLiHe = this.createBtn(param3,param1,this.btnDiWangLiHe,param2,"chunjie30_Button");
               this.setAnniuPosition();
               break;
            case 2906:
               this.btnTianXiaQiZhen = this.createBtn(param3,param1,this.btnTianXiaQiZhen,param2,"chunjie32_Button");
               this.setAnniuPosition();
               break;
            case 2907:
               this.btnXinShouQiZhen1 = this.createBtn(param3,param1,this.btnXinShouQiZhen1,param2,"chunjie31_Button");
               this.setAnniuPosition();
               break;
            case 2908:
               this.btnXinShouQiZhen2 = this.createBtn(param3,param1,this.btnXinShouQiZhen2,param2,"chunjie33_Button");
               this.setAnniuPosition();
               break;
            case 2909:
               this.btnTianXiaQiZhen2 = this.createBtn(param3,param1,this.btnTianXiaQiZhen2,param2,"chunjie32_Button");
               this.setAnniuPosition();
               break;
            case 2910:
               this.btnXinShouQiZhen3 = this.createBtn(param3,param1,this.btnXinShouQiZhen3,param2,"chunjie31_Button");
               this.setAnniuPosition();
               break;
            case 2911:
               this.btnXinShouQiZhen4 = this.createBtn(param3,param1,this.btnXinShouQiZhen4,param2,"chunjie33_Button");
               this.setAnniuPosition();
               break;
            case 2912:
               this.btnZhongQiuWanLu = this.createBtn(param3,param1,this.btnZhongQiuWanLu,param2,"chunjie16_Button");
               this.setAnniuPosition();
               break;
            case 2736:
               this.yuanwuBtn = this.createBtn(param3,param1,this.yuanwuBtn,param2,"yuanwuButton");
               this.setAnniuPosition();
               break;
            case 2581:
               this.jiuJieXingTuBtn = this.createBtn(param3,param1,this.jiuJieXingTuBtn,param2,"jiujiexingtu_Button");
               this.setAnniuPosition();
               break;
            case 2913:
               this.btnxinniandaji = this.createBtn(param3,param1,this.btnxinniandaji,param2,"chunjie16_Button");
               this.setAnniuPosition();
               break;
            case 2914:
               this.btnwanshiruyi = this.createBtn(param3,param1,this.btnwanshiruyi,param2,"chunjie17_Button");
               this.setAnniuPosition();
               break;
            case 2915:
               this.btnankangxingwang = this.createBtn(param3,param1,this.btnankangxingwang,param2,"chunjie18_Button");
               this.setAnniuPosition();
               break;
            case 2916:
               this.btncailugungun = this.createBtn(param3,param1,this.btncailugungun,param2,"chunjie19_Button");
               this.setAnniuPosition();
               break;
            case 2917:
               this.btnshuangsiyouhui = this.createBtn(param3,param1,this.btnshuangsiyouhui,param2,"chunjie21_Button");
               this.setAnniuPosition();
               break;
            case 2918:
               this.btntehui2021 = this.createBtn(param3,param1,this.btntehui2021,param2,"chunjie27_Button");
               this.setAnniuPosition();
               break;
            case 2919:
               this.btnxinshouzhan = this.createBtn(param3,param1,this.btnxinshouzhan,param2,"chunjie28_Button");
               this.setAnniuPosition();
               break;
            case 2920:
               this.btnshengjifuli = this.createBtn(param3,param1,this.btnshengjifuli,param2,"chunjie29_Button");
               this.setAnniuPosition();
               break;
            case 2922:
               this.btnDiWangLiHe2 = this.createBtn(param3,param1,this.btnDiWangLiHe2,param2,"chunjie30_Button");
               this.setAnniuPosition();
               break;
            case 2921:
               this.btnxinshouzhan2 = this.createBtn(param3,param1,this.btnxinshouzhan2,param2,"chunjie28_Button");
               this.setAnniuPosition();
               break;
            case 2923:
               this.btn7tianlianxudenglu2022 = this.createBtn(param3,param1,this.btn7tianlianxudenglu2022,param2,"chunjie34_Button");
               this.setAnniuPosition();
               break;
            case 2924:
               this.btntebieleichong2022 = this.createBtn(param3,param1,this.btntebieleichong2022,param2,"chunjie35_Button");
               this.setAnniuPosition();
               break;
            case 2234:
               this.wuhunBtn = this.createBtn(param3,param1,this.wuhunBtn,param2,"wuhun_btn");
               this.setAnniuPosition();
               break;
            case 2925:
               this.btnDaliShangLi = this.createBtn(param3,param1,this.btnDaliShangLi,param2,"chunjie36_Button");
               this.setAnniuPosition();
               break;
            case 2926:
               this.btnChuSiHuoDong = this.createBtn(param3,param1,this.btnChuSiHuoDong,param2,"chunjie37_Button");
               this.setAnniuPosition();
               break;
            case 2927:
               this.btnLaYue28HuoDong = this.createBtn(param3,param1,this.btnLaYue28HuoDong,param2,"chunjie37_Button");
               this.setAnniuPosition();
               break;
            case 2928:
               this.btnLaYue29HuoDong = this.createBtn(param3,param1,this.btnLaYue29HuoDong,param2,"chunjie37_Button");
               this.setAnniuPosition();
               break;
            case 2929:
               this.btnLaYue30HuoDong = this.createBtn(param3,param1,this.btnLaYue30HuoDong,param2,"chunjie37_Button");
               this.setAnniuPosition();
               break;
            case 2930:
               this.btnZhenPinZhiMeng1 = this.createBtn(param3,param1,this.btnZhenPinZhiMeng1,param2,"chunjie75_Button");
               this.setAnniuPosition();
               break;
            case 2931:
               this.btnZhenPinZhiMeng2 = this.createBtn(param3,param1,this.btnZhenPinZhiMeng2,param2,"chunjie75_Button");
               this.setAnniuPosition();
               break;
            case 2932:
               this.btnZhenPinZhiMeng3 = this.createBtn(param3,param1,this.btnZhenPinZhiMeng3,param2,"chunjie75_Button");
               this.setAnniuPosition();
               break;
            case 2933:
               this.btnZhenPinZhiMeng4 = this.createBtn(param3,param1,this.btnZhenPinZhiMeng4,param2,"chunjie75_Button");
               this.setAnniuPosition();
               break;
            case 2934:
               this.btnZhenPinZhiMeng5 = this.createBtn(param3,param1,this.btnZhenPinZhiMeng5,param2,"chunjie75_Button");
               this.setAnniuPosition();
               break;
            case 2935:
               this.btnZhenPinZhiMeng6 = this.createBtn(param3,param1,this.btnZhenPinZhiMeng6,param2,"chunjie75_Button");
               this.setAnniuPosition();
               break;
            case 2936:
               this.btnZhenPinZhiMeng7 = this.createBtn(param3,param1,this.btnZhenPinZhiMeng7,param2,"chunjie75_Button");
               this.setAnniuPosition();
               break;
            case 2937:
               this.btnLeTou = this.createBtn(param3,param1,this.btnLeTou,param2,"chunjie39_Button");
               this.setAnniuPosition();
               break;
            case 2938:
               this.btnLeiChongLiWu = this.createBtn(param3,param1,this.btnLeiChongLiWu,param2,"chunjie40_Button");
               this.setAnniuPosition();
               break;
            case 2939:
               this.btnLianXuLeiChong = this.createBtn(param3,param1,this.btnLianXuLeiChong,param2,"chunjie41_Button");
               this.setAnniuPosition();
               break;
            case 2940:
               this.btnTianJiangBaoXiang = this.createBtn(param3,param1,this.btnTianJiangBaoXiang,param2,"chunjie42_Button");
               this.setAnniuPosition();
               break;
            case 2941:
               this.btnZhenPinZhiMeng8 = this.createBtn(param3,param1,this.btnZhenPinZhiMeng8,param2,"chunjie75_Button");
               this.setAnniuPosition();
               break;
            case 2942:
               this.btnZhenPinZhiMeng9 = this.createBtn(param3,param1,this.btnZhenPinZhiMeng9,param2,"chunjie75_Button");
               this.setAnniuPosition();
               break;
            case 2943:
               this.btnZhenPinZhiMeng10 = this.createBtn(param3,param1,this.btnZhenPinZhiMeng10,param2,"chunjie75_Button");
               this.setAnniuPosition();
               break;
            case 2944:
               this.btnZhenPinZhiMeng11 = this.createBtn(param3,param1,this.btnZhenPinZhiMeng11,param2,"chunjie75_Button");
               this.setAnniuPosition();
               break;
            case 2945:
               this.btnZhenPinZhiMeng12 = this.createBtn(param3,param1,this.btnZhenPinZhiMeng12,param2,"chunjie75_Button");
               this.setAnniuPosition();
               break;
            case 2946:
               this.btnZhenPinZhiMeng13 = this.createBtn(param3,param1,this.btnZhenPinZhiMeng13,param2,"chunjie75_Button");
               this.setAnniuPosition();
               break;
            case 2947:
               this.btnZhenPinZhiMeng14 = this.createBtn(param3,param1,this.btnZhenPinZhiMeng14,param2,"chunjie75_Button");
               this.setAnniuPosition();
               break;
            case 2948:
               this.btnLianXuLeiChong2 = this.createBtn(param3,param1,this.btnLianXuLeiChong2,param2,"chunjie41_Button");
               this.setAnniuPosition();
               break;
            case 2949:
               this.btnTianJiangBaoXiang2 = this.createBtn(param3,param1,this.btnTianJiangBaoXiang2,param2,"chunjie42_Button");
               this.setAnniuPosition();
               break;
            case 2950:
               this.btnKuangReXiaTian = this.createBtn(param3,param1,this.btnKuangReXiaTian,param2,"chunjie43_Button");
               this.setAnniuPosition();
               break;
            case 2951:
               this.btnss1youlan = this.createBtn(param3,param1,this.btnss1youlan,param2,"chunjie44_Button");
               this.setAnniuPosition();
               break;
            case 2957:
               this.btn2023xinshou = this.createBtn(param3,param1,this.btn2023xinshou,param2,"chunjie49_Button");
               this.setAnniuPosition();
               break;
            case 2953:
               this.btndayanliwu = this.createBtn(param3,param1,this.btndayanliwu,param2,"chunjie45_Button");
               this.setAnniuPosition();
               break;
            case 2954:
               this.btnZheKouShangDian = this.createBtn(param3,param1,this.btnZheKouShangDian,param2,"chunjie46_Button");
               this.setAnniuPosition();
               break;
            case 2955:
               this.btnXiaoQiao = this.createBtn(param3,param1,this.btnXiaoQiao,param2,"chunjie47_Button");
               this.setAnniuPosition();
               break;
            case 2956:
               this.btnXinShangXian = this.createBtn(param3,param1,this.btnXinShangXian,param2,"chunjie48_Button");
               this.setAnniuPosition();
               break;
            case 2958:
               this.btnHuaZhuangHui = this.createBtn(param3,param1,this.btnHuaZhuangHui,param2,"chunjie50_Button");
               this.setAnniuPosition();
               break;
            case 2959:
               this.btnShiErZhouNian = this.createBtn(param3,param1,this.btnShiErZhouNian,param2,"chunjie51_Button");
               this.setAnniuPosition();
               break;
            case 2960:
               this.btnZongLeiJi = this.createBtn(param3,param1,this.btnZongLeiJi,param2,"chunjie52_Button");
               this.setAnniuPosition();
               break;
            case 2961:
               this.btn2023LiDong = this.createBtn(param3,param1,this.btn2023LiDong,param2,"chunjie53_Button");
               this.setAnniuPosition();
               break;
            case 2962:
               this.btn2023LiDongLeiJi = this.createBtn(param3,param1,this.btn2023LiDongLeiJi,param2,"chunjie54_Button");
               this.setAnniuPosition();
               break;
            case 2963:
               this.btnV632DengLuLingJiang = this.createBtn(param3,param1,this.btnV632DengLuLingJiang,param2,"chunjie55_Button");
               this.setAnniuPosition();
               break;
            case 2964:
               this.btnXueRenBaoZang = this.createBtn(param3,param1,this.btnXueRenBaoZang,param2,"chunjie70_Button");
               this.setAnniuPosition();
               break;
            case 2965:
               this.btnZheKouShangDian20140117 = this.createBtn(param3,param1,this.btnZheKouShangDian20140117,param2,"chunjie46_Button");
               this.setAnniuPosition();
               break;
            case 2966:
               this.btnMaChao = this.createBtn(param3,param1,this.btnMaChao,param2,"chunjie59_Button");
               this.setAnniuPosition();
               break;
            case 2967:
               this.btnYingChun2024 = this.createBtn(param3,param1,this.btnYingChun2024,param2,"chunjie49_Button");
               this.setAnniuPosition();
               break;
            case 2387:
               this.neiGongBtn = this.createBtn(param3,param1,this.neiGongBtn,param2,"neigongButton");
               this.setAnniuPosition();
               break;
            case 2968:
               this.btnCaoJun = this.createBtn(param3,param1,this.btnCaoJun,param2,"chunjie60_Button");
               this.setAnniuPosition();
               break;
            case 2969:
               this.btnYouHui2888 = this.createBtn(param3,param1,this.btnYouHui2888,param2,"chunjie61_Button");
               this.setAnniuPosition();
               break;
            case 2970:
               this.btnChunJieDuiJiang = this.createBtn(param3,param1,this.btnChunJieDuiJiang,param2,"chunjie69_Button");
               this.setAnniuPosition();
               break;
            case 2971:
               this.btnYuanXiaoJie2024 = this.createBtn(param3,param1,this.btnYuanXiaoJie2024,param2,"chunjie71_Button");
               this.setAnniuPosition();
               break;
            case 2972:
               this.btn4Yue4 = this.createBtn(param3,param1,this.btn4Yue4,param2,"chunjie72_Button");
               this.setAnniuPosition();
               break;
            case 2973:
               this.btnTeBieShangDian = this.createBtn(param3,param1,this.btnTeBieShangDian,param2,"chunjie73_Button");
               this.setAnniuPosition();
               break;
            case 2974:
               this.btnMeiRiYouHui = this.createBtn(param3,param1,this.btnMeiRiYouHui,param2,"chunjie74_Button");
               this.setAnniuPosition();
               break;
            case 2975:
               this.btnLevelUp = this.createBtn(param3,param1,this.btnLevelUp,param2,"chunjie76_Button");
               this.setAnniuPosition();
               break;
            case 2976:
               this.btnZhouMoTeHui = this.createBtn(param3,param1,this.btnZhouMoTeHui,param2,"chunjie77_Button");
               this.setAnniuPosition();
               break;
            case 2977:
               this.btnHuiMengGe = this.createBtn(param3,param1,this.btnHuiMengGe,param2,"chunjie78_Button");
               this.setAnniuPosition();
         }
         this.setAnniuPosition();
      }
      
      private function createBtn(param1:Boolean, param2:int, param3:NewSkinButton, param4:Boolean, param5:String = "") : NewSkinButton
      {
         if(param4)
         {
            if(param3 == null)
            {
               param3 = new NewSkinButton();
               param3.skin = param5;
               this.btnSpr.addChild(param3);
               param3.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            param3.visible = param4;
            if(param1)
            {
               param3.drawRedPoint();
            }
            else
            {
               param3.clearRedPoint();
            }
         }
         else if(Boolean(param3) && Boolean(param3.parent))
         {
            param3.parent.removeChild(param3);
            param3 = null;
         }
         return param3;
      }
      
      private function onEnterFarme(param1:Event) : void
      {
         var _loc2_:int = 0;
         _loc2_ = (getTimer() - this.stratTime) / 1000;
         _loc2_ = this.time - _loc2_;
         if(_loc2_ > 0)
         {
            this.yasuiqianText.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + int(_loc2_ / 60 / 60) + "：" + int(_loc2_ / 60 % 60) + "：" + int(_loc2_ % 60) + "</font>";
         }
         else
         {
            this.yasuiqianText.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + "00：00：00" + "</font>";
            removeEventListener(Event.ENTER_FRAME,this.onEnterFarme);
         }
      }
      
      public function setAnniuPosition(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:Object = null;
         var _loc13_:* = undefined;
         var _loc14_:Boolean = false;
         _loc2_ = 50;
         _loc3_ = 45;
         _loc4_ = 10;
         _loc5_ = 10;
         _loc6_ = this.QianDaoBtn.x;
         _loc7_ = this.QianDaoBtn.y;
         _loc8_ = _loc6_;
         _loc9_ = _loc7_;
         _loc10_ = 1;
         _loc11_ = 7;
         for each(_loc12_ in this._btnLayoutConfig)
         {
            _loc13_ = this[_loc12_.btn];
            if((Boolean(_loc13_)) && Boolean(_loc13_.parent))
            {
               _loc14_ = false;
               if(_loc13_.visible)
               {
                  _loc14_ = true;
               }
               else if(_loc12_.special)
               {
                  _loc14_ = param1 || Boolean(_loc13_.visible);
               }
               if(_loc14_)
               {
                  if(++_loc10_ > _loc11_ - 1 && _loc10_ % (_loc11_ - 1) == 1)
                  {
                     _loc8_ = _loc6_;
                     _loc9_ += _loc3_ + _loc5_;
                  }
                  else
                  {
                     _loc8_ += _loc2_ + _loc4_;
                  }
                  if(_loc12_.wrapper)
                  {
                     this[_loc12_.wrapper].x = _loc8_;
                     this[_loc12_.wrapper].y = _loc9_;
                  }
                  else
                  {
                     _loc13_.x = _loc8_;
                     _loc13_.y = _loc9_;
                  }
                  if(_loc12_.child)
                  {
                     this[_loc12_.child].x = _loc8_ + _loc12_.childxy[0];
                     this[_loc12_.child].y = _loc9_ + _loc12_.childxy[1];
                  }
               }
            }
         }
      }
      
      public function setBtnShow(param1:Boolean) : void
      {
         if(param1)
         {
            this.btnShow.skin = "previousButton";
            this.btnShow.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击隐藏按钮") + "</font>";
            this.btnSpr.visible = param1;
            this.btnSpr.x = 300;
         }
         else
         {
            this.btnShow.skin = "nextButton";
            this.btnShow.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击显示按钮") + "</font>";
            this.btnSpr.x = -80;
         }
      }
      
      public function setBtnEnable(param1:Boolean) : void
      {
         if(param1)
         {
            this.redRegulateBtn.enabled = false;
            this.blutRegulateBtn.enabled = false;
            this.yellowRegulateBtn.enabled = false;
            this.autoBtn.enabled = false;
         }
         else
         {
            this.redRegulateBtn.enabled = true;
            this.blutRegulateBtn.enabled = true;
            this.yellowRegulateBtn.enabled = true;
            this.autoBtn.enabled = true;
         }
      }
      
      public function setPureColor(param1:int, param2:int, param3:int) : void
      {
         while(this.mcPureSpr.numChildren > 0)
         {
            this.mcPureSpr.removeChildAt(0);
         }
         this.ftPure.htmlText = param2 + "/" + param3;
         this.ftPure.x = 125 / 2 - this.ftPure.textWidth / 2 + 25;
         this.fbPureColor = StaticValue.getMCByClassName("ui.fabao.colorbar.pure") as MovieClip;
         this.mcPureSpr.addChild(this.fbPureColor);
         this.fbPureColor.x = 0 - 30;
         this.fbPureColor.y = 0 - 10;
         if(param1 > 50)
         {
            param1 = 50;
         }
         this.fbPureColor.gotoAndStop(param1);
      }
      
      public function setOrangeColor(param1:int, param2:int, param3:int) : void
      {
         while(this.mcOrangeSpr.numChildren > 0)
         {
            this.mcOrangeSpr.removeChildAt(0);
         }
         this.ftOrange.htmlText = String(param2);
         this.ftOrange.x = 95 / 2 - this.ftOrange.textWidth / 2 + 40;
         this.fbOrangeColor = StaticValue.getMCByClassName("ui.fabao.colorbar.orange") as MovieClip;
         this.mcOrangeSpr.addChild(this.fbOrangeColor);
         this.fbOrangeColor.x = 2 - 35;
         this.fbOrangeColor.y = 0 - 21;
         param1 /= 2;
         if(param1 > 50)
         {
            param1 = 51;
         }
         this.fbOrangeColor.gotoAndStop(param1);
      }
      
      public function setFaBaoVisible(param1:Boolean) : void
      {
         this.fbSpr.visible = param1;
      }
      
      public function setDiziButton(param1:Boolean) : void
      {
         if(param1)
         {
            this.seQianDaoBtnVisible(false);
            this.setZhiZhanZhiShangVisible(false);
            this.setYNRichangBtnVisible(true);
            this.setYNXinshouBtnVisible(false);
         }
         else
         {
            this.seQianDaoBtnVisible(true);
            this.setZhiZhanZhiShangVisible(true);
            this.setYNRichangBtnVisible(true);
            this.setYNXinshouBtnVisible(false);
         }
      }
   }
}

