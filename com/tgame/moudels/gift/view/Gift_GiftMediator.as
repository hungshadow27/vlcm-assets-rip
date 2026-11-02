package com.tgame.moudels.gift.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.monster.MonsterRes;
   import com.tgame.common.res.monster.MonsterResManager;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.SpecialNPCID;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.ui.componets.Menu;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.HighEffectManager;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.gift.Gift_ApplicationFacade;
   import com.tgame.moudels.gift.model.GIFT_MsgSenderProxy;
   import com.tgame.shell.view.components.Backpack;
   import com.tgame.shell.view.components.GiftPanel;
   import com.tgame.shell.view.components.MainUI;
   import com.tgame.shell.view.components.WanJiaHuiKuiPanel;
   import com.tgame.shell.view.components.XianshiDajiangDuihuanPanel;
   import com.tgame.shell.view.components.feishengjingjie.YN2017FeishengjingjiePanel;
   import com.tgame.shell.view.components.funvjie2018.FuNvJiePaiHangPanel;
   import com.tgame.shell.view.components.fuqitongxin.YN2016FuqitongxinPaihangbangPanel;
   import com.tgame.shell.view.components.fuqitongxin.YN2016FuqitongxinPanel;
   import com.tgame.shell.view.components.huodong.ZhuangbeiHuishouPanel;
   import com.tgame.shell.view.components.kaixuepaihangbang.TijiaowupinPanel;
   import com.tgame.shell.view.components.kaixuepaihangbang.YN2016PaihangbangPanel;
   import com.tgame.shell.view.components.kaixueqiqiu.YN2017KaixueqiqiuPanel;
   import com.tgame.shell.view.components.lieshouhuodong.LieShouPaiHang2Panel;
   import com.tgame.shell.view.components.lieshouhuodong.LieShouPaiHangPanel;
   import com.tgame.shell.view.components.liunianhuodong.YNHuazhuangdasaiPanel;
   import com.tgame.shell.view.components.liupaijingji.YN2016LiupaijingjiPanel;
   import com.tgame.shell.view.components.lliuyueqingzhu.DengLuLingJiangV632Panel;
   import com.tgame.shell.view.components.lliuyueyuanman.ShengJieDaHuiKuiPanel;
   import com.tgame.shell.view.components.meijiupaihang.MeiJiuPaiHangPanel;
   import com.tgame.shell.view.components.meitianyouhui.YN2017Meitianyouhui2Panel;
   import com.tgame.shell.view.components.neiligaishi.YNNeiligaishiPanel;
   import com.tgame.shell.view.components.oule.YN2017OulePanel;
   import com.tgame.shell.view.components.party.PartyFlagHelpPanel;
   import com.tgame.shell.view.components.peiyangdianfengshou.YNPeiyangdianfengshouPanel;
   import com.tgame.shell.view.components.qicaipaihangbang.QicaitijiaowupinPanel;
   import com.tgame.shell.view.components.qicaipaihangbang.YN2016QicaiPaihangbangPanel;
   import com.tgame.shell.view.components.shouchongshijian.YN2017ShouchongshijianPanel;
   import com.tgame.shell.view.components.tengtianyu.YN2017Tengtianyu2Panel;
   import com.tgame.shell.view.components.tengtianyu.YN2017Tengtianyu3Panel;
   import com.tgame.shell.view.components.utils.UITools;
   import com.tgame.shell.view.components.v303.YNV303Panel;
   import com.tgame.shell.view.components.wudushengzhen.YN2017WudushengzhenPanel;
   import com.tgame.shell.view.components.xingxingpaihang.XingXingPaiHangPanel;
   import com.tgame.shell.view.components.yingbinzhouli.YN2016YingbinzhouliPanel;
   import com.tgame.shell.view.components.yingxiongmingcheng.YN2017YingXiongMingChengPanel;
   import com.tgame.shell.view.components.ynSpecial.YN2016HuoDongXiaoFeiPanel;
   import com.tgame.shell.view.components.ynSpecial.YN2016HuodongFanliPanel;
   import com.tgame.shell.view.components.ynSpecial.YN2016MengZhuZhuFuPanel;
   import com.tgame.shell.view.components.ynSpecial.YN2016WuShenzhanlianPanel;
   import com.tgame.shell.view.components.ynSpecial.YN2016XiaoFeiPanel;
   import com.tgame.shell.view.components.ynSpecial.YN2016ZhouqicailuPanel;
   import com.tgame.shell.view.components.ynSpecial.YNjinqianshuPanel;
   import com.tgame.shell.view.components.youhuizhouqi.YN2017YouHuiZhouQiPanel;
   import com.tgame.shell.view.components.zengsongnvren.YN2017ZengsongnvrenPanel;
   import com.tgame.shell.view.components.zhenbaoge.YN2016ZhenbaogePanel;
   import com.tgame.shell.view.components.zhengduozhan.ZhengDuoZhanPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Gift_GiftMediator extends Mediator
   {
      
      public static const NAME:String = "Gift_GiftMediator";
      
      private var guideId:int = 0;
      
      private var levelUpDataArr:Array;
      
      private var loginTime:String;
      
      private var witchFaceGrftArr:Array;
      
      private var nowShowPanel:String;
      
      private var inviteGiftObj:Object;
      
      private var onLineGiftObj:Object;
      
      private var loginGiftObj:Object;
      
      private var loaderBuff:LoadBuffer;
      
      private var islevelShan:Boolean = false;
      
      private var isInviteShan:Boolean = false;
      
      private var isFaceShan:Boolean = false;
      
      private var isLoginShan:Boolean = false;
      
      private var isOnLineShan:Boolean = false;
      
      private var isXianshiShan:Boolean = false;
      
      private var index:int;
      
      private var yaoQingGiftID:int;
      
      private var yaoQingGiftName:String;
      
      private var yaoQingGiftLV:int;
      
      private var yaoQingState:String;
      
      private var menu:Menu;
      
      private var baseEvent:MouseEvent;
      
      private var avatar_zizeng:int = 0;
      
      public var isALLActive:Boolean = false;
      
      private var activeSelectedIndex:int = 0;
      
      private var activeTestArr:Array;
      
      public var typeId:int;
      
      public var page:int;
      
      private var _msgSenderProxy:GIFT_MsgSenderProxy;
      
      private var _zhuangbeiHuishouPanel:ZhuangbeiHuishouPanel;
      
      private var _zhuangbeiHuishouType:int;
      
      private var _xianshidajiangduihuanPanel:XianshiDajiangDuihuanPanel;
      
      public function Gift_GiftMediator(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      protected function get giftPanel() : GiftPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.giftPanel);
         }
         return viewComponent as GiftPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function get msgSenderProxy() : GIFT_MsgSenderProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(GIFT_MsgSenderProxy.NAME) as GIFT_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Gift_ApplicationFacade.SHOW_ZHUANGBEI_HUISHOU_PANEL,Gift_ApplicationFacade.SHOW_LEIJIDENGLU,Gift_ApplicationFacade.SHOW_CONQUERPANEL_BOSS,Gift_ApplicationFacade.YN_REQUEST_HUODONG_PANEL,Gift_ApplicationFacade.YN_YUENANHUODONGYOUHUA_CLICK,Gift_ApplicationFacade.YN_XIAOFEI_REQUEST_INFO,Gift_ApplicationFacade.SHOW_YN2016HUODONGXIAOFEI,Gift_ApplicationFacade.SHOW_YN2016FANLIPANEL,Gift_ApplicationFacade.SHOW_YN2016SHENGRIZHOUJIPANEL,Gift_ApplicationFacade.SHOW_YN2016FUQITONGXINPANEL,Gift_ApplicationFacade.SHOW_YN2016ZHOUQICAILU,Gift_ApplicationFacade.SHOW_YN2016PAIHANGBANG,Gift_ApplicationFacade.SHOW_YN2016QICAIPAIHANGBANG,Gift_ApplicationFacade.SHOW_YN2016YINGXIONGSHIJIAN,Gift_ApplicationFacade.SHOW_YN2016YUELUNGUJI,Gift_ApplicationFacade.SHOW_YN2016CHONGJIUZHIYANG,Gift_ApplicationFacade.SHOW_YN2016WUSHENZHANLIAN,Gift_ApplicationFacade.SHOW_YN2016LIUPAIJINJIPLANE,Gift_ApplicationFacade.SHOW_YN2016YINGBINZHOULIPLANE,Gift_ApplicationFacade.SHOW_YN2016WUYUEGUANGLIANGPLANE,Gift_ApplicationFacade
         .SHOW_YN2016DINGFENGZHOUQIPLANE,Gift_ApplicationFacade.SHOW_YN2016HUASHANLUNJIANPLANE,Gift_ApplicationFacade.SHOW_YN2016SHENGDANJIEPLANE,Gift_ApplicationFacade.SHOW_YN2016SHENGDANJINPIAOPLANE,Gift_ApplicationFacade.SHOW_YN2016ZHENBAOGEPLANE,Gift_ApplicationFacade.SHOW_YN2017FANGYANHUAPANEL,Gift_ApplicationFacade.SHOW_YN2017ZAOWANGPANEL,Gift_ApplicationFacade.SHOW_CHUNJIE123_PLANE,Gift_ApplicationFacade.SHOW_YUANYANGXISHUI_PLANE,Gift_ApplicationFacade.SHOW_GUOSETIANXIANG_PLANE,Gift_ApplicationFacade.SHOW_AIDEHUIBAO_PANEL,Gift_ApplicationFacade.SHOW_YOUHUIZHOUQI_PANEL,Gift_ApplicationFacade.SHOW_OULE_PANEL,Gift_ApplicationFacade.SHOW_2017YURENJIE_PANEL,Gift_ApplicationFacade.SHOW_2017XIONGWANGDALI_PANEL,Gift_ApplicationFacade.SHOW_KAIZHAN5_PANEL,Gift_ApplicationFacade.SHOW_TIANSHIZHOUQI_PANEL,Gift_ApplicationFacade.SHOW_NANTIANHAOQI_PANEL,Gift_ApplicationFacade.SHOW_RONGGUANG_PANEL,Gift_ApplicationFacade.SHOW_FODAN_PANEL,Gift_ApplicationFacade.SHOW_YINGXIONGMINGCHENG_PANEL,Gift_ApplicationFacade
         .SHOW_DUIJUEZHOUQI_PANEL,Gift_ApplicationFacade.SHOW_LIUYIERTONGJIE_PANEL,Gift_ApplicationFacade.SHOW_0519_PANEL,Gift_ApplicationFacade.SHOW_KUANGBAO_PANEL,Gift_ApplicationFacade.SHOW_DIANFENGZHOUQI_PANEL,Gift_ApplicationFacade.SHOW_QINGZHU_PANEL,Gift_ApplicationFacade.SHOW_MEITIANYOUHUI_PANEL,Gift_ApplicationFacade.SHOW_SHENFENG_PANEL,Gift_ApplicationFacade.SHOW_SHENGZHEN_PANEL,Gift_ApplicationFacade.SHOW_JINYE_PANEL,Gift_ApplicationFacade.SHOW_LIUYUEYUANMAN_PANEL,Gift_ApplicationFacade.SHOW_LIUYUEQINGZHU_PANEL,Gift_ApplicationFacade.SHOW_MEITIANYOUHUIIBAO_PANEL,Gift_ApplicationFacade.SHOW_LIUYUEDI_PANEL,Gift_ApplicationFacade.SHOW_DISHI_PANEL,Gift_ApplicationFacade.SHOW_WEI300_PANEL,Gift_ApplicationFacade.SHOW_SHOUCHONGSHIJIAN_PANEL,Gift_ApplicationFacade.SHOW_MOSHIZHOUQI_PANEL,Gift_ApplicationFacade.SHOW_BAYUETOU_PANEL,Gift_ApplicationFacade.SHOW_TONGLEFEISHENGJINGJIE_PANEL,Gift_ApplicationFacade.SHOW_SHENQIZHOUQI_PANEL,Gift_ApplicationFacade.SHOW_XIATIANZHIEN_PANEL,Gift_ApplicationFacade
         .SHOW_1908_PANEL,Gift_ApplicationFacade.SHOW_QIXIHUODONG_PANEL,Gift_ApplicationFacade.SHOW_LIBAOZHOUQI_PANEL,Gift_ApplicationFacade.SHOW_SHIJIAN902_PANEL,Gift_ApplicationFacade.SHOW_YULANJIE_PANEL,Gift_ApplicationFacade.SHOW_HUANYINGWEIXI_PANEL,Gift_ApplicationFacade.SHOW_CHONGJIUHUODONG_PANEL,Gift_ApplicationFacade.SHOW_WULINZHENYUAN_PANEL,Gift_ApplicationFacade.SHOW_KAIXUEQIQIU_PANEL,Gift_ApplicationFacade.SHOW_HUOZHENJIASHI_PANEL,Gift_ApplicationFacade.SHOW_XUANWUXINGJUN_PANEL,Gift_ApplicationFacade.SHOW_WANGZHEZHENGXIONG_PANEL,Gift_ApplicationFacade.SHOW_WANGZHEHUODONG6_PANEL,Gift_ApplicationFacade.SHOW_BAIHUXINGJUN_PANEL,Gift_ApplicationFacade.SHOW_ZHONGQIU2017_PANEL,Gift_ApplicationFacade.SHOW_QINGLONGXINGJUN_PANEL,Gift_ApplicationFacade.SHOW_LIHEJUE_PANEL,Gift_ApplicationFacade.SHOW_10YUEYOUHUIZHOUQI_PANEL,Gift_ApplicationFacade.SHOW_MEITIANYOUHUIIBAO2_PANEL,Gift_ApplicationFacade.SHOW_ZHUQUEXINGJUN_PANEL,Gift_ApplicationFacade.SHOW_20171020_PANEL,Gift_ApplicationFacade.SHOW_ZENGSONGNVREN_PANEL
         ,Gift_ApplicationFacade.SHOW_SUIXINXIAOFEI_PANEL,Gift_ApplicationFacade.SHOW_LIUNIANHUODONG_PANEL,Gift_ApplicationFacade.SHOW_LIUNIANPEIBAN_PANEL,Gift_ApplicationFacade.SHOW_GANENLIUNIAN_PANEL,Gift_ApplicationFacade.SHOW_SHENGRIZHOUQI_PANEL,Gift_ApplicationFacade.SHOW_HUAZHUANGDASAI_PANEL,Gift_ApplicationFacade.SHOW_XUANTIEZHIXINGZHOUQI_PANEL,Gift_ApplicationFacade.SHOW_0601SHIJIAN_PANEL,Gift_ApplicationFacade.SHOW_QINGLONGXINGJUNFUWEN_PANEL,Gift_ApplicationFacade.SHOW_CHAOJIXIANGLONGZHOUQI_PANEL,Gift_ApplicationFacade.SHOW_2017JIAOSHIJIE_PANEL,Gift_ApplicationFacade.SHOW_2017SHUANGLONGZHAN_PANEL,Gift_ApplicationFacade.SHOW_2017ZHENPINZHOUQI_PANEL,Gift_ApplicationFacade.SHOW_20171205SHIJIAN_PANEL,Gift_ApplicationFacade.SHOW_20171212SHIJIAN_PANEL,Gift_ApplicationFacade.SHOW_YITIANBAOJINZHOUQI_PANEL,Gift_ApplicationFacade.SHOW_20171219SHIJIAN_PANEL,Gift_ApplicationFacade.SHOW_YINSHECHUDONG_PANEL,Gift_ApplicationFacade.SHOW_20171226SHIJIAN_PANEL,Gift_ApplicationFacade.SHOW_SHENGDANCHONGMAN_PANEL
         ,Gift_ApplicationFacade.SHOW_WANSHIXING_PANEL,Gift_ApplicationFacade.SHOW_QIANGHUAJINSHEN_PANEL,Gift_ApplicationFacade.SHOW_NEILIGAISHI_PANEL,Gift_ApplicationFacade.SHOW_PEIYANGDIANFENGSHOU_PANEL,Gift_ApplicationFacade.SHOW_YITIANTULONGDAO_PANEL,Gift_ApplicationFacade.SHOW_TIANRENHE_PANEL,Gift_ApplicationFacade.SHOW_RONGQINGAIYI_PANEL,Gift_ApplicationFacade.SHOW_2018FUNVJIE_PANEL,Gift_ApplicationFacade.SHOW_JINSHENZHOUQI_PANEL,Gift_ApplicationFacade.SHOW_BAIQIAOKELI_PANEL,Gift_ApplicationFacade.SHOW_DAJINSHENZHOUQI_PANEL,Gift_ApplicationFacade.SHOW_TIANRENHE2_PANEL,Gift_ApplicationFacade.SHOW_QIANGHUAJINSHEN2_PANEL,Gift_ApplicationFacade.SHOW_QIANGHUAJINSHEN3_PANEL,Gift_ApplicationFacade.SHOW_YUANBAOYOUHUI_PANEL,Gift_ApplicationFacade.SHOW_YURENJIE2018_PANEL,Gift_ApplicationFacade.SHOW_CHANGNIANCHONGZHI_PANEL,Gift_ApplicationFacade.SHOW_HANSHIJIE_PANEL,Gift_ApplicationFacade.SHOW_DASHENGZHOUQI_PANEL,Gift_ApplicationFacade.SHOW_2018LAODONGJIE_PANEL,Gift_ApplicationFacade.SHOW_BANBENYOUHUI_PANEL
         ,Gift_ApplicationFacade.SHOW_LIXIA2018_PANEL,Gift_ApplicationFacade.SHOW_SHUIGUOLEIJI_PANEL,Gift_ApplicationFacade.SHOW_519HUODONG2018_PANEL,Gift_ApplicationFacade.SHOW_TIANXIAWUGONGCHUSHAOLIN_PANEL,Gift_ApplicationFacade.SHOW_CHAOJIZHOUQI_PANEL,Gift_ApplicationFacade.SHOW_YUEXIAOFEIYUELINGJIANG_PANEL,Gift_ApplicationFacade.SHOW_ZHIZUNCHENGHAOZHENGDUO_PANEL,Gift_ApplicationFacade.SHOW_TAOHUAZHIJING_PANEL,Gift_ApplicationFacade.SHOW_QUANZHENXIAOYAO_PANEL,Gift_ApplicationFacade.SHOW_LIANXUBAOMING_PANEL,Gift_ApplicationFacade.SHOW_DUANWU2018_PANEL,Gift_ApplicationFacade.SHOW_XIATIANKUAILE_PANEL,Gift_ApplicationFacade.SHOW_HUANQIUKAIMU_PANEL,Gift_ApplicationFacade.SHOW_MINGJIAOZHIZUN_PANEL,Gift_ApplicationFacade.SHOW_FEISHENGSHENBAO_PANEL,Gift_ApplicationFacade.SHOW_ZHENGDUOZHAN_PANEL,Gift_ApplicationFacade.SHOW_DAGENGXINHUODONG_PANEL,Gift_ApplicationFacade.SHOW_WANGZHEZHOUQI_PANEL,Gift_ApplicationFacade.SHOW_YINGJIEFUNVJIE_PANEL,Gift_ApplicationFacade.SHOW_ZHOUYIKUAILE_PANEL,Gift_ApplicationFacade
         .SHOW_ZHOUMORENAO_PANEL,Gift_ApplicationFacade.SHOW_WANGZHEZHIBANGHD_PANEL,Gift_ApplicationFacade.SHOW_CHONGZHIDAY_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Goods = null;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Gift_ApplicationFacade.SHOW_ZHUANGBEI_HUISHOU_PANEL:
               if(this._zhuangbeiHuishouPanel == null)
               {
                  this._zhuangbeiHuishouPanel = new ZhuangbeiHuishouPanel();
                  UIEventsRegisterManager.registerUI(this._zhuangbeiHuishouPanel,ZhuangbeiHuishouPanel);
               }
               GameInstance.uiInstance.uiContainer.addChild(this._zhuangbeiHuishouPanel);
               this._zhuangbeiHuishouPanel.visible = true;
               this._zhuangbeiHuishouPanel.x = (GameInstance.stage.stageWidth - this._zhuangbeiHuishouPanel.panelWidth) / 2;
               this._zhuangbeiHuishouPanel.y = (GameInstance.stage.stageHeight - this._zhuangbeiHuishouPanel.panelHeight) / 2;
               this._zhuangbeiHuishouType = _loc2_.type;
               _loc3_ = new Goods(_loc2_.goodsID);
               _loc3_.count = _loc2_.goodsNum;
               this._zhuangbeiHuishouPanel.setRightGoods(_loc3_);
               break;
            case Gift_ApplicationFacade.SHOW_LEIJIDENGLU:
               if(!Fun.isVisible(this.giftPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_GIFT_PLANE);
               }
               this.giftPanel.LeijiDengluActive();
               break;
            case Gift_ApplicationFacade.SHOW_CONQUERPANEL_BOSS:
               if(!Fun.isVisible(this.giftPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_GIFT_PLANE);
               }
               this.giftPanel.YeWaiBossActive();
               break;
            case Gift_ApplicationFacade.YN_REQUEST_HUODONG_PANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.xianshiDajiangDuihuanPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_XIANSHIDAJIANGDUIHUAN);
               }
               GameInstance.uiInstance.xianshiDajiangDuihuanPanel.addTabBar(int(_loc2_));
               GameInstance.uiInstance.xianshiDajiangDuihuanPanel.setTabClick(int(_loc2_));
               break;
            case Gift_ApplicationFacade.YN_YUENANHUODONGYOUHUA_CLICK:
               this.YNopenPanel(int(_loc2_));
               break;
            case Gift_ApplicationFacade.YN_YUENANHUODONGYOUHUA_CLICK:
               this.YNopenPanel(int(_loc2_));
               break;
            case Gift_ApplicationFacade.YN_XIAOFEI_REQUEST_INFO:
               this.msgSenderProxy.send_81421();
               break;
            case Gift_ApplicationFacade.SHOW_YN2016HUODONGXIAOFEI:
               this.msgSenderProxy.send_81461();
               break;
            case Gift_ApplicationFacade.SHOW_YN2016FANLIPANEL:
               this.msgSenderProxy.send_81751();
               break;
            case Gift_ApplicationFacade.SHOW_YN2016SHENGRIZHOUJIPANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.ynshengrizhoujiPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.ynshengrizhoujiPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_YN2016FUQITONGXINPANEL:
               this.msgSenderProxy.send_81761();
               break;
            case Gift_ApplicationFacade.SHOW_YN2016ZHOUQICAILU:
               this.msgSenderProxy.send_81631();
               break;
            case Gift_ApplicationFacade.SHOW_YN2016PAIHANGBANG:
               this.msgSenderProxy.send_81711();
               break;
            case Gift_ApplicationFacade.SHOW_YN2016QICAIPAIHANGBANG:
               this.msgSenderProxy.send_81741();
               break;
            case Gift_ApplicationFacade.SHOW_YN2016YINGXIONGSHIJIAN:
               if(!Fun.isVisible(GameInstance.uiInstance.ynyingxiongshijianPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.ynyingxiongshijianPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_YN2016YUELUNGUJI:
               if(!Fun.isVisible(GameInstance.uiInstance.ynyuelungujiPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.ynyuelungujiPanel);
                  GameInstance.uiInstance.ynyuelungujiPanel.ImaVisible();
               }
               break;
            case Gift_ApplicationFacade.SHOW_YN2016CHONGJIUZHIYANG:
               if(!Fun.isVisible(GameInstance.uiInstance.ynchongjiuzhiyangPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.ynchongjiuzhiyangPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_YN2016WUSHENZHANLIAN:
               this.msgSenderProxy.send_81521([1]);
               break;
            case Gift_ApplicationFacade.SHOW_YN2016LIUPAIJINJIPLANE:
               this.msgSenderProxy.send_81821();
               break;
            case Gift_ApplicationFacade.SHOW_YN2016YINGBINZHOULIPLANE:
               this.msgSenderProxy.send_81841();
               break;
            case Gift_ApplicationFacade.SHOW_YN2016WUYUEGUANGLIANGPLANE:
               if(!Fun.isVisible(GameInstance.uiInstance.ynzhouwuguangliangPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.ynzhouwuguangliangPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_YN2016DINGFENGZHOUQIPLANE:
               if(!Fun.isVisible(GameInstance.uiInstance.yndingfengzhouqiPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.yndingfengzhouqiPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_YN2016HUASHANLUNJIANPLANE:
               if(!Fun.isVisible(GameInstance.uiInstance.ynhuashanlunjianPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.ynhuashanlunjianPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_YN2016SHENGDANJIEPLANE:
               if(!Fun.isVisible(GameInstance.uiInstance.ynshengdanjiePanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.ynshengdanjiePanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_YN2016SHENGDANJINPIAOPLANE:
               if(!Fun.isVisible(GameInstance.uiInstance.ynshengdanjinpiaoPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.ynshengdanjinpiaoPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_YN2016ZHENBAOGEPLANE:
               this.msgSenderProxy.send_81891(int(_loc2_));
               break;
            case Gift_ApplicationFacade.SHOW_YN2017FANGYANHUAPANEL:
               this.msgSenderProxy.send_83077();
               break;
            case Gift_ApplicationFacade.SHOW_YN2017ZAOWANGPANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.ynzaowangPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.ynzaowangPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_CHUNJIE123_PLANE:
               if(!Fun.isVisible(GameInstance.uiInstance.chunjie123Panel))
               {
                  UITools.showPanel(GameInstance.uiInstance.chunjie123Panel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_YUANYANGXISHUI_PLANE:
               if(!Fun.isVisible(GameInstance.uiInstance.yuanyangxishuiPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.yuanyangxishuiPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_GUOSETIANXIANG_PLANE:
               if(!Fun.isVisible(GameInstance.uiInstance.guosetianxiangPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.guosetianxiangPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_AIDEHUIBAO_PANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.aidehuibaoPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.aidehuibaoPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_YOUHUIZHOUQI_PANEL:
               this.msgSenderProxy.send_82111();
               break;
            case Gift_ApplicationFacade.SHOW_OULE_PANEL:
               this.msgSenderProxy.send_82131();
               break;
            case Gift_ApplicationFacade.SHOW_2017YURENJIE_PANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.ynyurenjiePanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.ynyurenjiePanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_2017XIONGWANGDALI_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.xiongwangdaliPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.xiongwangdaliPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_KAIZHAN5_PANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.kaizhan5Panel))
               {
                  UITools.showPanel(GameInstance.uiInstance.kaizhan5Panel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_TIANSHIZHOUQI_PANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.tianshizhouqiPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.tianshizhouqiPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_NANTIANHAOQI_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.nantianhaoqiPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.nantianhaoqiPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_RONGGUANG_PANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.rongguangPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.rongguangPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_FODAN_PANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.fodanPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.fodanPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_DUIJUEZHOUQI_PANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.duijuezhouqiPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.duijuezhouqiPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_LIUYIERTONGJIE_PANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.liuyiertongjiePanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.liuyiertongjiePanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_0519_PANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.$0519Panel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$0519Panel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_DIANFENGZHOUQI_PANEL:
               this.msgSenderProxy.send_82147();
               break;
            case Gift_ApplicationFacade.SHOW_QINGZHU_PANEL:
               this.msgSenderProxy.send_82149();
               break;
            case Gift_ApplicationFacade.SHOW_SHENFENG_PANEL:
               this.msgSenderProxy.send_82151(int(_loc2_));
               break;
            case Gift_ApplicationFacade.SHOW_YINGXIONGMINGCHENG_PANEL:
               this.msgSenderProxy.send_82141();
               break;
            case Gift_ApplicationFacade.SHOW_MEITIANYOUHUI_PANEL:
               this.msgSenderProxy.send_82201();
               break;
            case Gift_ApplicationFacade.SHOW_SHENGZHEN_PANEL:
               this.msgSenderProxy.send_82205(int(_loc2_));
               break;
            case Gift_ApplicationFacade.SHOW_JINYE_PANEL:
               this.msgSenderProxy.send_82207();
               break;
            case Gift_ApplicationFacade.SHOW_LIUYUEYUANMAN_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$liuyueyuanmanPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$liuyueyuanmanPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_LIUYUEQINGZHU_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$liuyueqingzhuPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$liuyueqingzhuPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_MEITIANYOUHUIIBAO_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$meitianchongzhilibaoPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$meitianchongzhilibaoPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_LIUYUEDI_PANEL:
               this.msgSenderProxy.send_82261();
               break;
            case Gift_ApplicationFacade.SHOW_DISHI_PANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.$dishiPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$dishiPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_WEI300_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$v300Panel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$v300Panel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_SHOUCHONGSHIJIAN_PANEL:
               this.msgSenderProxy.send_82301();
               break;
            case Gift_ApplicationFacade.SHOW_MOSHIZHOUQI_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$moshizhouqiPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$moshizhouqiPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_BAYUETOU_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$bayuetouPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$bayuetouPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_XIATIANZHIEN_PANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.$xiatianzhienPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$xiatianzhienPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_TONGLEFEISHENGJINGJIE_PANEL:
               this.msgSenderProxy.send_82311();
               break;
            case Gift_ApplicationFacade.SHOW_SHENQIZHOUQI_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$shenqizhouqiPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$shenqizhouqiPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_1908_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$1908Panel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$1908Panel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_QIXIHUODONG_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$qixihuodongPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$qixihuodongPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_LIBAOZHOUQI_PANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.$libaozhouqiPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$libaozhouqiPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_SHIJIAN902_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$shijian902Panel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$shijian902Panel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_YULANJIE_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$yulanjiePanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$yulanjiePanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_HUANYINGWEIXI_PANEL:
               this.msgSenderProxy.send_82361(int(_loc2_));
               break;
            case Gift_ApplicationFacade.SHOW_CHONGJIUHUODONG_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$chongjiuhuodongPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$chongjiuhuodongPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_WULINZHENYUAN_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$wulinzhenyuanPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$wulinzhenyuanPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_KAIXUEQIQIU_PANEL:
               this.msgSenderProxy.send_82381();
               break;
            case Gift_ApplicationFacade.SHOW_HUOZHENJIASHI_PANEL:
               this.msgSenderProxy.send_82401();
               break;
            case Gift_ApplicationFacade.SHOW_XUANWUXINGJUN_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$xuanwuxingjunPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$xuanwuxingjunPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_WANGZHEZHENGXIONG_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$wangzhezhengxiongPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$wangzhezhengxiongPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_BAIHUXINGJUN_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$baihuxingjunPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$baihuxingjunPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_ZHONGQIU2017_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$zhongqiu2017Panel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$zhongqiu2017Panel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_QINGLONGXINGJUN_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$qinglongxingjunPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$qinglongxingjunPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_LIHEJUE_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$lihejuePanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$lihejuePanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_10YUEYOUHUIZHOUQI_PANEL:
               this.msgSenderProxy.send_82433();
               break;
            case Gift_ApplicationFacade.SHOW_WANGZHEHUODONG6_PANEL:
               this.msgSenderProxy.send_82431();
               break;
            case Gift_ApplicationFacade.SHOW_MEITIANYOUHUIIBAO2_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$meitianchongzhilibao2Panel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$meitianchongzhilibao2Panel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_ZHUQUEXINGJUN_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$zhuquexingjunPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$zhuquexingjunPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_20171020_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$20171020Panel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$20171020Panel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_ZENGSONGNVREN_PANEL:
               this.msgSenderProxy.send_82461();
               break;
            case Gift_ApplicationFacade.SHOW_SUIXINXIAOFEI_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$suixinxiaofeiPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$suixinxiaofeiPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_LIUNIANHUODONG_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$liunianhuodongPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$liunianhuodongPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_LIUNIANPEIBAN_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$liunianpeibanPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$liunianpeibanPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_GANENLIUNIAN_PANEL:
               this.msgSenderProxy.send_82491();
               break;
            case Gift_ApplicationFacade.SHOW_SHENGRIZHOUQI_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$shengrizhouqiPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$shengrizhouqiPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_HUAZHUANGDASAI_PANEL:
               this.msgSenderProxy.send_82481();
               break;
            case Gift_ApplicationFacade.SHOW_XUANTIEZHIXINGZHOUQI_PANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.$xuantiezhixingzhouqiPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$xuantiezhixingzhouqiPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_0601SHIJIAN_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$0601Panel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$0601Panel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_QINGLONGXINGJUNFUWEN_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$qinglongxingjunfuwenPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$qinglongxingjunfuwenPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_CHAOJIXIANGLONGZHOUQI_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$chaojixianglongzhouqiPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$chaojixianglongzhouqiPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_2017JIAOSHIJIE_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$yuenan2017jiaoshijiePanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$yuenan2017jiaoshijiePanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_2017SHUANGLONGZHAN_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(int(_loc2_) == 1)
               {
                  this.msgSenderProxy.send_83097(18);
                  if(!Fun.isVisible(GameInstance.uiInstance.$shuanglongzhanPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.$shuanglongzhanPanel);
                  }
               }
               else if(int(_loc2_) == 74)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.shuangLongZhan2Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.shuangLongZhan2Panel);
                  }
                  GameInstance.uiInstance.shuangLongZhan2Panel.setDataGoods(74);
               }
               else if(int(_loc2_) == 3)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.shuangLongZhan3Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.shuangLongZhan3Panel);
                  }
               }
               else if(int(_loc2_) == 139)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.shuangLongZhan2Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.shuangLongZhan2Panel);
                  }
                  GameInstance.uiInstance.shuangLongZhan2Panel.setDataGoods(139);
               }
               else if(int(_loc2_) == 153)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.shuangLongZhan2Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.shuangLongZhan2Panel);
                  }
                  GameInstance.uiInstance.shuangLongZhan2Panel.setDataGoods(153);
               }
               else if(int(_loc2_) == 154)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.shuangLongZhan2Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.shuangLongZhan2Panel);
                  }
                  GameInstance.uiInstance.shuangLongZhan2Panel.setDataGoods(154);
               }
               else if(int(_loc2_) == 158)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.shuangLongZhan2Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.shuangLongZhan2Panel);
                  }
                  GameInstance.uiInstance.shuangLongZhan2Panel.setDataGoods(158);
               }
               break;
            case Gift_ApplicationFacade.SHOW_2017ZHENPINZHOUQI_PANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.$zhenpinzhouqiPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$zhenpinzhouqiPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_20171205SHIJIAN_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$1205shijianPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$1205shijianPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_20171212SHIJIAN_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$1212shijianPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$1212shijianPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_YITIANBAOJINZHOUQI_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$yitianbaojinzhouqiPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$yitianbaojinzhouqiPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_20171219SHIJIAN_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$1219shijianPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$1219shijianPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_YINSHECHUDONG_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$yinshechudongPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$yinshechudongPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_20171226SHIJIAN_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$1226shijianPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$1226shijianPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_SHENGDANCHONGMAN_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$shengdanchongmanPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$shengdanchongmanPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_WANSHIXING_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$wanshixingPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$wanshixingPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_QIANGHUAJINSHEN_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.$qianghuajinshenPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.$qianghuajinshenPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_NEILIGAISHI_PANEL:
               this.msgSenderProxy.send_82521();
               break;
            case Gift_ApplicationFacade.SHOW_PEIYANGDIANFENGSHOU_PANEL:
               this.msgSenderProxy.send_82611();
               break;
            case Gift_ApplicationFacade.SHOW_YITIANTULONGDAO_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.yiTianTuLongDaoPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.yiTianTuLongDaoPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_TIANRENHE_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.tianRenHePanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.tianRenHePanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_RONGQINGAIYI_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.rongQingAiYiPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.rongQingAiYiPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_2018FUNVJIE_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.fuNvJie2018Panel))
               {
                  UITools.showPanel(GameInstance.uiInstance.fuNvJie2018Panel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_JINSHENZHOUQI_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.jinShenZhouQiPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.jinShenZhouQiPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_BAIQIAOKELI_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.baiQiaoKeLiPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.baiQiaoKeLiPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_DAJINSHENZHOUQI_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.huangJinZhouQiPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.huangJinZhouQiPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_TIANRENHE2_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.tianRenHe2Panel))
               {
                  UITools.showPanel(GameInstance.uiInstance.tianRenHe2Panel);
               }
               GameInstance.uiInstance.tianRenHe2Panel.setDataGoods(int(_loc2_));
               break;
            case Gift_ApplicationFacade.SHOW_QIANGHUAJINSHEN2_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.qiangHuaJinShen2Panel))
               {
                  UITools.showPanel(GameInstance.uiInstance.qiangHuaJinShen2Panel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_QIANGHUAJINSHEN3_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.qiangHuaJinShen3Panel))
               {
                  UITools.showPanel(GameInstance.uiInstance.qiangHuaJinShen3Panel);
               }
               GameInstance.uiInstance.qiangHuaJinShen3Panel.setDataGoods(int(_loc2_));
               break;
            case Gift_ApplicationFacade.SHOW_YUANBAOYOUHUI_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.yuanBaoYouHuiPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.yuanBaoYouHuiPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_YURENJIE2018_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.yurenjie2018Panel))
               {
                  UITools.showPanel(GameInstance.uiInstance.yurenjie2018Panel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_CHANGNIANCHONGZHI_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.changNianChongZhiPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.changNianChongZhiPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_HANSHIJIE_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.hanShiJiePanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.hanShiJiePanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_DASHENGZHOUQI_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.daShengZhouQi))
               {
                  UITools.showPanel(GameInstance.uiInstance.daShengZhouQi);
               }
               break;
            case Gift_ApplicationFacade.SHOW_2018LAODONGJIE_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.laoDongJie2018))
               {
                  UITools.showPanel(GameInstance.uiInstance.laoDongJie2018);
               }
               break;
            case Gift_ApplicationFacade.SHOW_BANBENYOUHUI_PANEL:
               this.msgSenderProxy.send_82715(int(_loc2_));
               break;
            case Gift_ApplicationFacade.SHOW_LIXIA2018_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.liXia2018))
               {
                  UITools.showPanel(GameInstance.uiInstance.liXia2018);
               }
               break;
            case Gift_ApplicationFacade.SHOW_SHUIGUOLEIJI_PANEL:
               this.msgSenderProxy.send_83023();
               break;
            case Gift_ApplicationFacade.SHOW_519HUODONG2018_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.huoDong0519Panel))
               {
                  UITools.showPanel(GameInstance.uiInstance.huoDong0519Panel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_TIANXIAWUGONGCHUSHAOLIN_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.tianXiaWuGongChuShaoLinPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.tianXiaWuGongChuShaoLinPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_CHAOJIZHOUQI_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.chaoJiZhouQiPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.chaoJiZhouQiPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_YUEXIAOFEIYUELINGJIANG_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.yueXiaoFeiYueLingJiangPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.yueXiaoFeiYueLingJiangPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_ZHIZUNCHENGHAOZHENGDUO_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               this.msgSenderProxy.send_83031();
               if(!Fun.isVisible(GameInstance.uiInstance.zhiZunZhengDuoZhanPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.zhiZunZhengDuoZhanPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_TAOHUAZHIJING_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.taoHuaZhiJingPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.taoHuaZhiJingPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_QUANZHENXIAOYAO_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.quanZhenXiaoYaoPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.quanZhenXiaoYaoPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_LIANXUBAOMING_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.lianXuBaoMingPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.lianXuBaoMingPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_DUANWU2018_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.yingJieDuanWu2018Panel))
               {
                  UITools.showPanel(GameInstance.uiInstance.yingJieDuanWu2018Panel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_XIATIANKUAILE_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.xiaTianKuaiLePanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.xiaTianKuaiLePanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_HUANQIUKAIMU_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.huanQiuKaiMuPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.huanQiuKaiMuPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_MINGJIAOZHIZUN_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.mingJiaoZhiZunPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.mingJiaoZhiZunPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_FEISHENGSHENBAO_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.feiShengShenBaoPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.feiShengShenBaoPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_ZHENGDUOZHAN_PANEL:
               this.msgSenderProxy.send_83041();
               break;
            case Gift_ApplicationFacade.SHOW_DAGENGXINHUODONG_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.daGengXinHuoDongPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.daGengXinHuoDongPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_WANGZHEZHOUQI_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.wangZheZhouQiPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.wangZheZhouQiPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_YINGJIEFUNVJIE_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(!Fun.isVisible(GameInstance.uiInstance.yingjiefunvjiePanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.yingjiefunvjiePanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_ZHOUYIKUAILE_PANEL:
               if(int(_loc2_) == 144)
               {
                  this.msgSenderProxy.send_83091(1);
               }
               else if(int(_loc2_) == 183)
               {
                  this.msgSenderProxy.send_83091(2);
               }
               if(!Fun.isVisible(GameInstance.uiInstance.zhouyikuailePanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.zhouyikuailePanel);
               }
               GameInstance.uiInstance.zhouyikuailePanel.setType(int(_loc2_));
               break;
            case Gift_ApplicationFacade.SHOW_ZHOUMORENAO_PANEL:
               this.msgSenderProxy.send_83093();
               if(!Fun.isVisible(GameInstance.uiInstance.zhoumorenaoPanel))
               {
                  UITools.showPanel(GameInstance.uiInstance.zhoumorenaoPanel);
               }
               break;
            case Gift_ApplicationFacade.SHOW_WANGZHEZHIBANGHD_PANEL:
               PipeManager.sendMsg(PipeConstants.SEND_82241);
               if(int(_loc2_) == 108)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.wangZheZhiBangHDPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.wangZheZhiBangHDPanel);
                  }
               }
               else if(int(_loc2_) == 109)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.huanYingBaYuePanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.huanYingBaYuePanel);
                  }
               }
               else if(int(_loc2_) == 110)
               {
                  this.msgSenderProxy.send_83071(1);
               }
               else if(int(_loc2_) == 116)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.yuLanZhouQiPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.yuLanZhouQiPanel);
                  }
               }
               else if(int(_loc2_) == 117)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.yuLanZhiEnPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.yuLanZhiEnPanel);
                  }
               }
               else if(int(_loc2_) == 120)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.guoQingZhouQiPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.guoQingZhouQiPanel);
                  }
               }
               else if(int(_loc2_) == 121)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.guoQingZengSongPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.guoQingZengSongPanel);
                  }
               }
               else if(int(_loc2_) == 124)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.shuangJiuHuoDongPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.shuangJiuHuoDongPanel);
                  }
               }
               else if(int(_loc2_) == 127)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.zhongQiuZengSongPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.zhongQiuZengSongPanel);
                  }
               }
               else if(int(_loc2_) == 128)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.zhongQiuJie2018Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.zhongQiuJie2018Panel);
                  }
               }
               else if(int(_loc2_) == 129)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.zhongQiuZhouQiPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.zhongQiuZhouQiPanel);
                  }
               }
               else if(int(_loc2_) == 131)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.qiuTianLiWuPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.qiuTianLiWuPanel);
                  }
                  GameInstance.uiInstance.qiuTianLiWuPanel.setDataGoods(131);
               }
               else if(int(_loc2_) == 132)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.qiuTianLiWuPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.qiuTianLiWuPanel);
                  }
                  GameInstance.uiInstance.qiuTianLiWuPanel.setDataGoods(132);
               }
               else if(int(_loc2_) == 133)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.shuangShiHuoDongPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.shuangShiHuoDongPanel);
                  }
               }
               else if(int(_loc2_) == 146)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.gongFaYouHuiPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.gongFaYouHuiPanel);
                  }
                  GameInstance.uiInstance.gongFaYouHuiPanel.setType(146);
               }
               else if(int(_loc2_) == 190)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.gongFaYouHuiPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.gongFaYouHuiPanel);
                  }
                  GameInstance.uiInstance.gongFaYouHuiPanel.setType(190);
               }
               else if(int(_loc2_) == 147)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.wanShengYePanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.wanShengYePanel);
                  }
               }
               else if(int(_loc2_) == 148)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.baoShiYangChengPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.baoShiYangChengPanel);
                  }
               }
               else if(int(_loc2_) == 149 || int(_loc2_) == 192)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.meiRiChongZhiPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.meiRiChongZhiPanel);
                  }
                  GameInstance.uiInstance.meiRiChongZhiPanel.setDataGoods(int(_loc2_));
               }
               else if(int(_loc2_) == 150)
               {
                  this.msgSenderProxy.send_83071(2);
               }
               else if(int(_loc2_) == 151)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.shengRiZhouQiPanel2018))
                  {
                     UITools.showPanel(GameInstance.uiInstance.shengRiZhouQiPanel2018);
                  }
               }
               else if(int(_loc2_) == 152)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.shengRiYuKuaiPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.shengRiYuKuaiPanel);
                  }
               }
               else if(int(_loc2_) == 156)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.shiTuLieShouPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.shiTuLieShouPanel);
                  }
               }
               else if(int(_loc2_) == 157)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.shiTuJiePanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.shiTuJiePanel);
                  }
               }
               else if(int(_loc2_) == 159)
               {
                  this.msgSenderProxy.send_83097(1);
                  if(!Fun.isVisible(GameInstance.uiInstance.teShuLeiJi))
                  {
                     UITools.showPanel(GameInstance.uiInstance.teShuLeiJi);
                  }
               }
               else if(int(_loc2_) == 160)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.tebierizi))
                  {
                     UITools.showPanel(GameInstance.uiInstance.tebierizi);
                  }
               }
               else if(int(_loc2_) == 163)
               {
                  this.msgSenderProxy.send_83097(2);
                  if(!Fun.isVisible(GameInstance.uiInstance.shengDanLeiJi))
                  {
                     UITools.showPanel(GameInstance.uiInstance.shengDanLeiJi);
                  }
               }
               else if(int(_loc2_) == 164)
               {
                  this.msgSenderProxy.send_83097(4);
                  if(!Fun.isVisible(GameInstance.uiInstance.shengDanKuaiLe))
                  {
                     UITools.showPanel(GameInstance.uiInstance.shengDanKuaiLe);
                  }
               }
               else if(int(_loc2_) == 165)
               {
                  this.msgSenderProxy.send_83097(3);
                  if(!Fun.isVisible(GameInstance.uiInstance.shengDanHuoDong))
                  {
                     UITools.showPanel(GameInstance.uiInstance.shengDanHuoDong);
                  }
               }
               else if(int(_loc2_) == 166)
               {
                  this.msgSenderProxy.send_83097(5);
                  if(!Fun.isVisible(GameInstance.uiInstance.xingZhuXinNian))
                  {
                     UITools.showPanel(GameInstance.uiInstance.xingZhuXinNian);
                  }
               }
               else if(int(_loc2_) == 167)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.nianDi2018Dong))
                  {
                     UITools.showPanel(GameInstance.uiInstance.nianDi2018Dong);
                  }
               }
               else if(int(_loc2_) == 169)
               {
                  this.msgSenderProxy.send_83097(6);
                  if(!Fun.isVisible(GameInstance.uiInstance.liangTianLeiJi))
                  {
                     UITools.showPanel(GameInstance.uiInstance.liangTianLeiJi);
                  }
                  GameInstance.uiInstance.liangTianLeiJi.setDataGoods(169);
               }
               else if(int(_loc2_) == 170)
               {
                  this.msgSenderProxy.send_83097(7);
                  if(!Fun.isVisible(GameInstance.uiInstance.liangTianLeiJi))
                  {
                     UITools.showPanel(GameInstance.uiInstance.liangTianLeiJi);
                  }
                  GameInstance.uiInstance.liangTianLeiJi.setDataGoods(170);
               }
               else if(int(_loc2_) == 182)
               {
                  this.msgSenderProxy.send_83097(9);
                  if(!Fun.isVisible(GameInstance.uiInstance.liangTianLeiJi))
                  {
                     UITools.showPanel(GameInstance.uiInstance.liangTianLeiJi);
                  }
                  GameInstance.uiInstance.liangTianLeiJi.setDataGoods(182);
               }
               else if(int(_loc2_) == 226)
               {
                  this.msgSenderProxy.send_83097(33);
                  if(!Fun.isVisible(GameInstance.uiInstance.liangTianLeiJi))
                  {
                     UITools.showPanel(GameInstance.uiInstance.liangTianLeiJi);
                  }
                  GameInstance.uiInstance.liangTianLeiJi.setDataGoods(226);
               }
               else if(int(_loc2_) == 171 || int(_loc2_) == 172 || int(_loc2_) == 173 || int(_loc2_) == 174 || int(_loc2_) == 191 || int(_loc2_) == 179 || int(_loc2_) == 180 || int(_loc2_) == 181)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.jiangHuZhanPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.jiangHuZhanPanel);
                  }
                  GameInstance.uiInstance.jiangHuZhanPanel.setDataGoods(int(_loc2_));
               }
               else if(int(_loc2_) == 175)
               {
                  this.msgSenderProxy.send_83097(8);
                  if(!Fun.isVisible(GameInstance.uiInstance.qiTianLeiJi))
                  {
                     UITools.showPanel(GameInstance.uiInstance.qiTianLeiJi);
                  }
               }
               else if(int(_loc2_) == 176)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.zhuangWangGuiTianPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.zhuangWangGuiTianPanel);
                  }
               }
               else if(int(_loc2_) == 177)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.zhuangWangCiShuPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.zhuangWangCiShuPanel);
                  }
               }
               else if(int(_loc2_) == 178)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.zhuangWangJiePanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.zhuangWangJiePanel);
                  }
               }
               else if(int(_loc2_) == 184)
               {
                  this.msgSenderProxy.send_83097(10);
                  if(!Fun.isVisible(GameInstance.uiInstance.xinShouLeiJiPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.xinShouLeiJiPanel);
                  }
               }
               else if(int(_loc2_) == 186)
               {
                  this.msgSenderProxy.send_83097(11);
                  if(!Fun.isVisible(GameInstance.uiInstance.chunTianLeiJiPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.chunTianLeiJiPanel);
                  }
               }
               else if(int(_loc2_) == 187)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.chuYi2019Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.chuYi2019Panel);
                  }
               }
               else if(int(_loc2_) == 188)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.chuEr2019Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.chuEr2019Panel);
                  }
               }
               else if(int(_loc2_) == 189)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.chuSan2019Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.chuSan2019Panel);
                  }
               }
               else if(int(_loc2_) == 194)
               {
                  this.msgSenderProxy.send_83097(12);
                  if(!Fun.isVisible(GameInstance.uiInstance.qingRenJie2019Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.qingRenJie2019Panel);
                  }
               }
               else if(int(_loc2_) == 196)
               {
                  this.msgSenderProxy.send_83071(3);
               }
               else if(int(_loc2_) == 197)
               {
                  this.msgSenderProxy.send_83097(13);
                  if(!Fun.isVisible(GameInstance.uiInstance.yiTianLeiJiPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.yiTianLeiJiPanel);
                  }
               }
               else if(int(_loc2_) == 198)
               {
                  this.msgSenderProxy.send_83097(14);
                  if(!Fun.isVisible(GameInstance.uiInstance.fuNvJieHeLi))
                  {
                     UITools.showPanel(GameInstance.uiInstance.fuNvJieHeLi);
                  }
               }
               else if(int(_loc2_) == 199)
               {
                  this.msgSenderProxy.send_83071(4);
               }
               else if(int(_loc2_) == 200)
               {
                  this.msgSenderProxy.send_83097(15);
                  if(!Fun.isVisible(GameInstance.uiInstance.baiSeQingRenJiePanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.baiSeQingRenJiePanel);
                  }
               }
               else if(int(_loc2_) == 201)
               {
                  this.msgSenderProxy.send_83071(5);
               }
               else if(int(_loc2_) == 202)
               {
                  this.msgSenderProxy.send_83097(16);
                  if(!Fun.isVisible(GameInstance.uiInstance.yuRenJie2019Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.yuRenJie2019Panel);
                  }
               }
               else if(int(_loc2_) == 203)
               {
                  this.msgSenderProxy.send_83097(17);
                  if(!Fun.isVisible(GameInstance.uiInstance.hanShiJie2019Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.hanShiJie2019Panel);
                  }
               }
               else if(int(_loc2_) == 204)
               {
                  this.msgSenderProxy.send_83097(19);
                  if(!Fun.isVisible(GameInstance.uiInstance.zhiZunShenBaoPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.zhiZunShenBaoPanel);
                  }
                  GameInstance.uiInstance.zhiZunShenBaoPanel.setDataGoods(int(_loc2_));
               }
               else if(int(_loc2_) == 227)
               {
                  this.msgSenderProxy.send_83097(34);
                  if(!Fun.isVisible(GameInstance.uiInstance.zhiZunShenBaoPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.zhiZunShenBaoPanel);
                  }
                  GameInstance.uiInstance.zhiZunShenBaoPanel.setDataGoods(int(_loc2_));
               }
               else if(int(_loc2_) == 205)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.xiongWangJie2019Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.xiongWangJie2019Panel);
                  }
               }
               else if(int(_loc2_) == 206)
               {
                  this.msgSenderProxy.send_83097(21);
                  if(!Fun.isVisible(GameInstance.uiInstance.yingJieDaLiPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.yingJieDaLiPanel);
                  }
               }
               else if(int(_loc2_) == 207)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.shengGanHuiPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.shengGanHuiPanel);
                  }
               }
               else if(int(_loc2_) == 209)
               {
                  this.msgSenderProxy.send_83097(22);
                  if(!Fun.isVisible(GameInstance.uiInstance.erTongJiePanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.erTongJiePanel);
                  }
               }
               else if(int(_loc2_) == 210)
               {
                  this.msgSenderProxy.send_83097(23);
                  if(!Fun.isVisible(GameInstance.uiInstance.yingJieDuanWu2018Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.yingJieDuanWu2018Panel);
                  }
               }
               else if(int(_loc2_) == 212)
               {
                  this.msgSenderProxy.send_83097(24);
                  if(!Fun.isVisible(GameInstance.uiInstance.liuYueDi2019))
                  {
                     UITools.showPanel(GameInstance.uiInstance.liuYueDi2019);
                  }
               }
               else if(int(_loc2_) == 213)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.qiYueDi2019))
                  {
                     UITools.showPanel(GameInstance.uiInstance.qiYueDi2019);
                  }
               }
               else if(int(_loc2_) == 214)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.qixijie2019))
                  {
                     UITools.showPanel(GameInstance.uiInstance.qixijie2019);
                  }
               }
               else if(int(_loc2_) == 215 || int(_loc2_) == 216 || int(_loc2_) == 217 || int(_loc2_) == 230 || int(_loc2_) == 228 || int(_loc2_) == 229)
               {
                  if(int(_loc2_) == 215)
                  {
                     this.msgSenderProxy.send_83097(25);
                  }
                  else if(int(_loc2_) == 216)
                  {
                     this.msgSenderProxy.send_83097(26);
                  }
                  else if(int(_loc2_) == 217)
                  {
                     this.msgSenderProxy.send_83097(27);
                  }
                  else if(int(_loc2_) == 228)
                  {
                     this.msgSenderProxy.send_83097(35);
                  }
                  else if(int(_loc2_) == 229)
                  {
                     this.msgSenderProxy.send_83097(36);
                  }
                  else if(int(_loc2_) == 230)
                  {
                     this.msgSenderProxy.send_83097(37);
                  }
                  if(!Fun.isVisible(GameInstance.uiInstance.shuangquan))
                  {
                     UITools.showPanel(GameInstance.uiInstance.shuangquan);
                  }
                  GameInstance.uiInstance.shuangquan.setType(int(_loc2_));
               }
               else if(int(_loc2_) == 219)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.lianXuDengLuPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.lianXuDengLuPanel);
                  }
               }
               else if(int(_loc2_) == 220)
               {
                  this.msgSenderProxy.send_83097(28);
                  if(!Fun.isVisible(GameInstance.uiInstance.teBieHuoDong))
                  {
                     UITools.showPanel(GameInstance.uiInstance.teBieHuoDong);
                  }
                  GameInstance.uiInstance.teBieHuoDong.setDate(1);
               }
               else if(int(_loc2_) == 221)
               {
                  this.msgSenderProxy.send_83097(29);
                  if(!Fun.isVisible(GameInstance.uiInstance.teBieHuoDong))
                  {
                     UITools.showPanel(GameInstance.uiInstance.teBieHuoDong);
                  }
                  GameInstance.uiInstance.teBieHuoDong.setDate(2);
               }
               else if(int(_loc2_) == 222)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.guoqingjie2019))
                  {
                     UITools.showPanel(GameInstance.uiInstance.guoqingjie2019);
                  }
               }
               else if(int(_loc2_) == 223)
               {
                  this.msgSenderProxy.send_83097(30);
                  if(!Fun.isVisible(GameInstance.uiInstance.bayueyouhui2019))
                  {
                     UITools.showPanel(GameInstance.uiInstance.bayueyouhui2019);
                  }
               }
               else if(int(_loc2_) == 224)
               {
                  this.msgSenderProxy.send_83097(31);
                  if(!Fun.isVisible(GameInstance.uiInstance.xiongzhanbang))
                  {
                     UITools.showPanel(GameInstance.uiInstance.xiongzhanbang);
                  }
               }
               else if(int(_loc2_) == 225)
               {
                  this.msgSenderProxy.send_83097(32);
                  if(!Fun.isVisible(GameInstance.uiInstance.zhongqiushangyue))
                  {
                     UITools.showPanel(GameInstance.uiInstance.zhongqiushangyue);
                  }
               }
               else if(int(_loc2_) == 231)
               {
                  this.msgSenderProxy.send_83097(38);
                  if(!Fun.isVisible(GameInstance.uiInstance.shiwutianyouhui))
                  {
                     UITools.showPanel(GameInstance.uiInstance.shiwutianyouhui);
                  }
               }
               else if(int(_loc2_) == 232)
               {
                  this.msgSenderProxy.send_83097(39);
                  if(!Fun.isVisible(GameInstance.uiInstance.yuenanfunvjie))
                  {
                     UITools.showPanel(GameInstance.uiInstance.yuenanfunvjie);
                  }
               }
               else if(int(_loc2_) == 233)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.wanshengjie2019Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.wanshengjie2019Panel);
                  }
               }
               else if(int(_loc2_) == 234)
               {
                  this.msgSenderProxy.send_83097(40);
                  if(!Fun.isVisible(GameInstance.uiInstance.huodong1120Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.huodong1120Panel);
                  }
               }
               else if(int(_loc2_) == 235)
               {
                  this.msgSenderProxy.send_83097(41);
                  if(!Fun.isVisible(GameInstance.uiInstance.daZheKouPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.daZheKouPanel);
                  }
               }
               else if(int(_loc2_) == 236)
               {
                  this.msgSenderProxy.send_83097(42);
                  if(!Fun.isVisible(GameInstance.uiInstance.jingYingLeiJiPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.jingYingLeiJiPanel);
                     GameInstance.uiInstance.jingYingLeiJiPanel.setType(236);
                  }
               }
               else if(int(_loc2_) == 237)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.baNianZhiMengPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.baNianZhiMengPanel);
                  }
               }
               else if(int(_loc2_) == 239)
               {
                  this.msgSenderProxy.send_83097(42);
                  if(!Fun.isVisible(GameInstance.uiInstance.shuang12Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.shuang12Panel);
                  }
               }
               else if(int(_loc2_) == 241)
               {
                  this.msgSenderProxy.send_83097(43);
                  if(!Fun.isVisible(GameInstance.uiInstance.shenDanJie2019Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.shenDanJie2019Panel);
                  }
               }
               else if(int(_loc2_) == 243)
               {
                  this.msgSenderProxy.send_83097(44);
                  if(!Fun.isVisible(GameInstance.uiInstance.nianDi2019Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.nianDi2019Panel);
                  }
               }
               else if(int(_loc2_) == 244)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.xinNianKuaiLe2019Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.xinNianKuaiLe2019Panel);
                  }
               }
               else if(int(_loc2_) == 245)
               {
                  this.msgSenderProxy.send_83097(45);
                  if(!Fun.isVisible(GameInstance.uiInstance.xiaonianjiePanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.xiaonianjiePanel);
                  }
               }
               else if(int(_loc2_) == 247)
               {
                  this.msgSenderProxy.send_83097(46);
                  if(!Fun.isVisible(GameInstance.uiInstance.chuntuanyuanPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.chuntuanyuanPanel);
                  }
               }
               else if(int(_loc2_) == 248)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.chunjieyi))
                  {
                     UITools.showPanel(GameInstance.uiInstance.chunjieyi);
                  }
               }
               else if(int(_loc2_) == 249)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.chunjieer))
                  {
                     UITools.showPanel(GameInstance.uiInstance.chunjieer);
                  }
               }
               else if(int(_loc2_) == 250)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.chunjiesan))
                  {
                     UITools.showPanel(GameInstance.uiInstance.chunjiesan);
                  }
               }
               else if(int(_loc2_) == 251)
               {
                  this.msgSenderProxy.send_83097(47);
                  if(!Fun.isVisible(GameInstance.uiInstance.xinchunyinglu))
                  {
                     UITools.showPanel(GameInstance.uiInstance.xinchunyinglu);
                  }
               }
               else if(int(_loc2_) == 252)
               {
                  this.msgSenderProxy.send_83097(48);
                  if(!Fun.isVisible(GameInstance.uiInstance.jingYingLeiJiPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.jingYingLeiJiPanel);
                     GameInstance.uiInstance.jingYingLeiJiPanel.setType(252);
                  }
               }
               else if(int(_loc2_) == 254)
               {
                  this.msgSenderProxy.send_83097(49);
                  if(!Fun.isVisible(GameInstance.uiInstance.yuanxiaojie2019))
                  {
                     UITools.showPanel(GameInstance.uiInstance.yuanxiaojie2019);
                  }
               }
               else if(int(_loc2_) == 255)
               {
                  this.msgSenderProxy.send_83097(50);
                  if(!Fun.isVisible(GameInstance.uiInstance.qingrenjie2020))
                  {
                     UITools.showPanel(GameInstance.uiInstance.qingrenjie2020);
                  }
               }
               else if(int(_loc2_) == 256)
               {
                  this.msgSenderProxy.send_83097(51);
                  if(!Fun.isVisible(GameInstance.uiInstance.sanbajie2020))
                  {
                     UITools.showPanel(GameInstance.uiInstance.sanbajie2020);
                  }
               }
               else if(int(_loc2_) == 257)
               {
                  this.msgSenderProxy.send_83097(52);
                  if(!Fun.isVisible(GameInstance.uiInstance.baise2020))
                  {
                     UITools.showPanel(GameInstance.uiInstance.baise2020);
                  }
               }
               else if(int(_loc2_) == 258)
               {
                  this.msgSenderProxy.send_83097(53);
                  if(!Fun.isVisible(GameInstance.uiInstance.xiongwang2020))
                  {
                     UITools.showPanel(GameInstance.uiInstance.xiongwang2020);
                  }
               }
               else if(int(_loc2_) == 259)
               {
                  this.msgSenderProxy.send_83097(54);
                  if(!Fun.isVisible(GameInstance.uiInstance.guangrongdariPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.guangrongdariPanel);
                  }
               }
               else if(int(_loc2_) == 260)
               {
                  this.msgSenderProxy.send_83097(55);
                  if(!Fun.isVisible(GameInstance.uiInstance.leijizhengxiongPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.leijizhengxiongPanel);
                  }
               }
               else if(int(_loc2_) == 261)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.qianggou16Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.qianggou16Panel);
                  }
               }
               else if(int(_loc2_) == 262)
               {
                  this.msgSenderProxy.send_83097(56);
                  if(!Fun.isVisible(GameInstance.uiInstance.duanwusanwangPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.duanwusanwangPanel);
                  }
               }
               else if(int(_loc2_) == 263)
               {
                  this.msgSenderProxy.send_83097(57);
                  if(!Fun.isVisible(GameInstance.uiInstance.diwanglihePanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.diwanglihePanel);
                     GameInstance.uiInstance.diwanglihePanel.setType(263);
                  }
               }
               else if(int(_loc2_) == 282)
               {
                  this.msgSenderProxy.send_83097(66);
                  if(!Fun.isVisible(GameInstance.uiInstance.diwanglihe2Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.diwanglihe2Panel);
                     GameInstance.uiInstance.diwanglihe2Panel.setType(282);
                  }
               }
               else if(int(_loc2_) == 264)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.tianxiaqizhenPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.tianxiaqizhenPanel);
                  }
               }
               else if(int(_loc2_) == 265)
               {
                  this.msgSenderProxy.send_83097(58);
                  if(!Fun.isVisible(GameInstance.uiInstance.xinshouqizhen1Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.xinshouqizhen1Panel);
                     GameInstance.uiInstance.xinshouqizhen1Panel.setType(265);
                  }
               }
               else if(int(_loc2_) == 266)
               {
                  this.msgSenderProxy.send_83097(59);
                  if(!Fun.isVisible(GameInstance.uiInstance.xinshouqizhen2Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.xinshouqizhen2Panel);
                     GameInstance.uiInstance.xinshouqizhen2Panel.setType(266);
                  }
               }
               else if(int(_loc2_) == 269)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.tianxiaqizhen2Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.tianxiaqizhen2Panel);
                  }
               }
               else if(int(_loc2_) == 270)
               {
                  this.msgSenderProxy.send_83097(60);
                  if(!Fun.isVisible(GameInstance.uiInstance.xinshouqizhen3Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.xinshouqizhen3Panel);
                     GameInstance.uiInstance.xinshouqizhen3Panel.setType(270);
                  }
               }
               else if(int(_loc2_) == 271)
               {
                  this.msgSenderProxy.send_83097(61);
                  if(!Fun.isVisible(GameInstance.uiInstance.xinshouqizhen4Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.xinshouqizhen4Panel);
                     GameInstance.uiInstance.xinshouqizhen4Panel.setType(271);
                  }
               }
               else if(int(_loc2_) == 272)
               {
                  this.msgSenderProxy.send_83097(62);
                  if(!Fun.isVisible(GameInstance.uiInstance.zhongqiuwanluPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.zhongqiuwanluPanel);
                  }
               }
               else if(int(_loc2_) == 274)
               {
                  this.msgSenderProxy.send_83097(63);
                  if(!Fun.isVisible(GameInstance.uiInstance.xinniandajiPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.xinniandajiPanel);
                  }
               }
               else if(int(_loc2_) == 275)
               {
                  this.msgSenderProxy.send_83097(64);
                  if(!Fun.isVisible(GameInstance.uiInstance.wanshiruyiPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.wanshiruyiPanel);
                  }
               }
               else if(int(_loc2_) == 276)
               {
                  this.msgSenderProxy.send_83097(65);
                  if(!Fun.isVisible(GameInstance.uiInstance.ankangxingwangPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.ankangxingwangPanel);
                  }
               }
               else if(int(_loc2_) == 277)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.cailugungunPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.cailugungunPanel);
                  }
               }
               else if(int(_loc2_) == 278)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.shuangsiyouhuiPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.shuangsiyouhuiPanel);
                  }
               }
               else if(int(_loc2_) == 279)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.tehui2021Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.tehui2021Panel);
                  }
               }
               else if(int(_loc2_) == 280 || int(_loc2_) == 283)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.xinshouzhanPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.xinshouzhanPanel);
                     GameInstance.uiInstance.xinshouzhanPanel.setType(int(_loc2_));
                  }
               }
               else if(int(_loc2_) == 281)
               {
                  this.msgSenderProxy.send_83181(1);
               }
               else if(int(_loc2_) == 284)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.qitianlianxudenglu2022Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.qitianlianxudenglu2022Panel);
                  }
               }
               else if(int(_loc2_) == 285)
               {
                  this.msgSenderProxy.send_83097(67);
                  if(!Fun.isVisible(GameInstance.uiInstance.tebieleichong2022Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.tebieleichong2022Panel);
                  }
               }
               else if(int(_loc2_) == 289)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.chunJieSiPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.chunJieSiPanel);
                  }
               }
               else if(int(_loc2_) == 290)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.laYue28Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.laYue28Panel);
                  }
               }
               else if(int(_loc2_) == 291)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.laYue29Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.laYue29Panel);
                  }
               }
               else if(int(_loc2_) == 292)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.laYue30Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.laYue30Panel);
                  }
               }
               else if(int(_loc2_) == 294 || int(_loc2_) == 295 || int(_loc2_) == 296 || int(_loc2_) == 297 || int(_loc2_) == 298 || int(_loc2_) == 299)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.zhenPinZhiMengPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.zhenPinZhiMengPanel);
                     GameInstance.uiInstance.zhenPinZhiMengPanel.setType(int(_loc2_));
                  }
               }
               else if(int(_loc2_) == 293 || int(_loc2_) == 294 || int(_loc2_) == 295 || int(_loc2_) == 296 || int(_loc2_) == 297 || int(_loc2_) == 298 || int(_loc2_) == 299 || int(_loc2_) == 304 || int(_loc2_) == 305 || int(_loc2_) == 306 || int(_loc2_) == 307 || int(_loc2_) == 308 || int(_loc2_) == 309 || int(_loc2_) == 310)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.zhenPinZhiMengPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.zhenPinZhiMengPanel);
                     GameInstance.uiInstance.zhenPinZhiMengPanel.setType(int(_loc2_));
                  }
               }
               else if(int(_loc2_) == 303)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.letouPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.letouPanel);
                  }
               }
               else if(int(_loc2_) == 300)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.leiChongLiWuPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.leiChongLiWuPanel);
                  }
               }
               else if(int(_loc2_) == 301)
               {
                  this.msgSenderProxy.send_83097(68);
                  if(!Fun.isVisible(GameInstance.uiInstance.lianXuLeiChongPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.lianXuLeiChongPanel);
                     GameInstance.uiInstance.lianXuLeiChongPanel.setType(301);
                  }
               }
               else if(int(_loc2_) == 311)
               {
                  this.msgSenderProxy.send_83097(70);
                  if(!Fun.isVisible(GameInstance.uiInstance.lianXuLeiChongPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.lianXuLeiChongPanel);
                     GameInstance.uiInstance.lianXuLeiChongPanel.setType(311);
                  }
               }
               else if(int(_loc2_) == 302)
               {
                  this.msgSenderProxy.send_83097(69);
                  if(!Fun.isVisible(GameInstance.uiInstance.tianJiangBaoXiangPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.tianJiangBaoXiangPanel);
                     GameInstance.uiInstance.tianJiangBaoXiangPanel.setType(302);
                  }
               }
               else if(int(_loc2_) == 312)
               {
                  this.msgSenderProxy.send_83097(71);
                  if(!Fun.isVisible(GameInstance.uiInstance.tianJiangBaoXiangPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.tianJiangBaoXiangPanel);
                     GameInstance.uiInstance.tianJiangBaoXiangPanel.setType(312);
                  }
               }
               else if(int(_loc2_) == 313)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.daYanLiWuPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.daYanLiWuPanel);
                  }
               }
               else if(int(_loc2_) == 314)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.zheKouShangDianPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.zheKouShangDianPanel);
                  }
               }
               else if(int(_loc2_) == 315)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.xiaoQiaoPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.xiaoQiaoPanel);
                  }
               }
               else if(int(_loc2_) == 316)
               {
                  this.msgSenderProxy.send_83097(72);
                  if(!Fun.isVisible(GameInstance.uiInstance.xinShangXianPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.xinShangXianPanel);
                  }
               }
               else if(int(_loc2_) == 319)
               {
                  this.msgSenderProxy.send_83097(73);
                  if(!Fun.isVisible(GameInstance.uiInstance.shiErZhouNianQingZhuPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.shiErZhouNianQingZhuPanel);
                  }
               }
               else if(int(_loc2_) == 320)
               {
                  this.msgSenderProxy.send_83097(74);
                  if(!Fun.isVisible(GameInstance.uiInstance.zongLeiJiPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.zongLeiJiPanel);
                  }
               }
               else if(int(_loc2_) == 324)
               {
                  this.msgSenderProxy.send_83229();
                  if(!Fun.isVisible(GameInstance.uiInstance.liDongJiePanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.liDongJiePanel);
                  }
               }
               else if(int(_loc2_) == 325)
               {
                  this.msgSenderProxy.send_83097(75);
                  if(!Fun.isVisible(GameInstance.uiInstance.liDongLeiJiPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.liDongLeiJiPanel);
                  }
               }
               else if(int(_loc2_) == 326)
               {
                  this.msgSenderProxy.send_83097(76);
                  if(!Fun.isVisible(GameInstance.uiInstance.dengLuLingJiangPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.dengLuLingJiangPanel);
                  }
               }
               else if(int(_loc2_) == 327)
               {
                  this.msgSenderProxy.send_83097(77);
                  if(!Fun.isVisible(GameInstance.uiInstance.xueRenBaoZangPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.xueRenBaoZangPanel);
                  }
               }
               else if(int(_loc2_) == 328)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.zheKouShang20240116Dian))
                  {
                     UITools.showPanel(GameInstance.uiInstance.zheKouShang20240116Dian);
                  }
               }
               else if(int(_loc2_) == 329)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.maChaoPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.maChaoPanel);
                  }
               }
               else if(int(_loc2_) == 330)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.caoJunPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.caoJunPanel);
                  }
               }
               else if(int(_loc2_) == 331)
               {
                  this.msgSenderProxy.send_83097(78);
                  if(!Fun.isVisible(GameInstance.uiInstance.youHui2888Panel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.youHui2888Panel);
                  }
               }
               else if(int(_loc2_) == 332)
               {
                  this.msgSenderProxy.send_83097(79);
                  if(!Fun.isVisible(GameInstance.uiInstance.teBieShangDianPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.teBieShangDianPanel);
                  }
               }
               else if(int(_loc2_) == 333)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.meiriyouhguiPanel))
                  {
                     UITools.showPanel(GameInstance.uiInstance.meiriyouhguiPanel);
                  }
               }
               break;
            case Gift_ApplicationFacade.SHOW_CHONGZHIDAY_PANEL:
               this.msgSenderProxy.send_83097(_loc2_);
         }
      }
      
      public function showUseGiftPack(param1:int, param2:Object, param3:int) : void
      {
         this.index = param3;
         this.guideId = param1;
         var _loc4_:Boolean = GameInstance.mainCharData.attributeInfo.lv >= param2.lv ? true : false;
         GameInstance.uiInstance.backpack.showXinShouLiBao(param2.lv,param2.r,param2.tq,param2.yb,_loc4_);
      }
      
      public function getGiftInPack(param1:Boolean, param2:String) : void
      {
         if(param1)
         {
            FAlert.show(LanResManager.getLanTextWords(this,"物品已添加到包裹内",[StaticValue.WHITE_HTML]));
         }
         else
         {
            FAlert.show(LanResManager.getLanTextWords(this,"物品已添加到包裹内",[StaticValue.WHITE_HTML,param2]));
         }
      }
      
      public function getAllGift(param1:Array) : void
      {
      }
      
      public function showJianMian(param1:String, param2:Array) : void
      {
         this.loginTime = param1;
         this.witchFaceGrftArr = param2;
         if(this.nowShowPanel != GiftPanel.UI_GIFTPANEL_JIANMIAN_SHOW)
         {
            return;
         }
         var _loc3_:Date = new Date(Number(this.loginTime));
         this.giftPanel.setJianMianDataProvider(_loc3_,param2);
         this.removeLoaderBuff();
      }
      
      public function watchingFaceGiftStartTime(param1:int, param2:int, param3:String) : void
      {
         GameInstance.uiInstance.mainUI.setJianMianYouLi(param3,param2);
      }
      
      public function watchingFaceGiftStopTime(param1:int, param2:String) : void
      {
         GameInstance.uiInstance.mainUI.setJianMianYouLi(param2,0);
      }
      
      public function showInvite(param1:Object) : void
      {
      }
      
      public function inviteTenPlayer(param1:Array) : void
      {
         this.giftPanel.setYaoQingPlayer(param1);
      }
      
      public function getInviteGift(param1:int, param2:int) : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         if(param1 == 1 && Boolean(this.inviteGiftObj))
         {
            _loc3_ = this.inviteGiftObj.r;
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               if(param2 == _loc3_[_loc4_].id)
               {
                  _loc3_[_loc4_].isOpen = true;
                  this.showInvite(this.inviteGiftObj);
                  return;
               }
               _loc4_++;
            }
         }
      }
      
      public function showLoingGift(param1:Object) : void
      {
         this.loginGiftObj = param1;
         this.giftPanel.setDengLuYouLiDataProvider(param1.day,param1.r);
         this.removeLoaderBuff();
      }
      
      public function getLoginGift(param1:int) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         if(this.loginGiftObj)
         {
            _loc2_ = this.loginGiftObj.r;
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               if(param1 == _loc2_[_loc3_].id)
               {
                  _loc2_[_loc3_].isOpen = true;
                  this.showLoingGift(this.loginGiftObj);
                  return;
               }
               _loc3_++;
            }
         }
      }
      
      public function getLoginTime(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param1 < 0)
         {
            this.giftPanel.setZianXianData([{
               "minTime":15,
               "maxTime":15,
               "items":new Goods(7004),
               "drawTime":0
            },{
               "minTime":30,
               "maxTime":30,
               "items":new Goods(7004),
               "drawTime":0
            },{
               "minTime":60,
               "maxTime":60,
               "items":new Goods(7004),
               "drawTime":0
            },{
               "minTime":120,
               "maxTime":120,
               "items":new Goods(7004),
               "drawTime":0
            }]);
            return;
         }
         _loc2_ = 15 * 60 - param1;
         _loc3_ = 30 * 60 - param1;
         _loc4_ = 60 * 60 - param1;
         _loc5_ = 120 * 60 - param1;
         this.giftPanel.setZianXianData([{
            "minTime":int(param1 / 60),
            "maxTime":15,
            "items":new Goods(7004),
            "drawTime":_loc2_
         },{
            "minTime":int(param1 / 60),
            "maxTime":30,
            "items":new Goods(7004),
            "drawTime":_loc3_
         },{
            "minTime":int(param1 / 60),
            "maxTime":60,
            "items":new Goods(7004),
            "drawTime":_loc4_
         },{
            "minTime":int(param1 / 60),
            "maxTime":120,
            "items":new Goods(7004),
            "drawTime":_loc5_
         }]);
         this.removeLoaderBuff();
      }
      
      public function getGiftBtnEndabled(param1:Boolean) : void
      {
         this.giftPanel.setGetBtnEnabled(param1);
      }
      
      public function showOnLineGift(param1:Object) : void
      {
         this.onLineGiftObj = param1;
         this.giftPanel.setZaiXianYouLiDataProvider(param1.preTime,param1.yb,param1.time,param1.r);
         if(!this.giftPanel.returnBtn())
         {
            if(param1.yb == 0)
            {
               this.giftPanel.setFettle(3);
            }
            else
            {
               this.giftPanel.setFettle(1);
            }
         }
         else
         {
            this.giftPanel.setFettle(2);
         }
         this.removeLoaderBuff();
      }
      
      public function getOnLineTime(param1:int) : void
      {
         this.onLineGiftObj.time = param1;
         this.showOnLineGift(this.onLineGiftObj);
         this.removeLoaderBuff();
      }
      
      public function showRegistrationData(param1:Number, param2:Number, param3:Boolean) : void
      {
         this.giftPanel.qiandanFun(param1,param2,param3);
      }
      
      public function getActive(param1:Array) : void
      {
         if(this.activeSelectedIndex == 0)
         {
            if(!this.activeTestArr)
            {
               this.activeTestArr = param1;
            }
            else
            {
               param1 = this.activeTestArr.concat(param1);
               this.giftPanel.setActiveactiveInitialize(param1);
               this.activeTestArr = null;
               this.removeLoaderBuff();
            }
         }
         else
         {
            this.giftPanel.setActiveactiveInitialize(param1);
            this.removeLoaderBuff();
         }
      }
      
      public function setNewSpaper(param1:String) : void
      {
         this.giftPanel.setNewSpaperMsg(param1);
      }
      
      public function shanDong(param1:int) : void
      {
         switch(param1)
         {
            case 0:
               this.islevelShan = true;
               break;
            case 1:
               this.isFaceShan = true;
               break;
            case 2:
               this.isInviteShan = true;
               break;
            case 3:
               NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_GIFT_FLOOR,{"giftType":3});
               this.isLoginShan = true;
               break;
            case 4:
               NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_GIFT_FLOOR,{"giftType":4});
               this.isOnLineShan = true;
               break;
            case 5:
               this.isXianshiShan = true;
         }
         if(Fun.isVisible(GameInstance.uiInstance._giftPanel))
         {
            this.startShan();
         }
      }
      
      public function startShan() : void
      {
         if(this.islevelShan)
         {
            this.islevelShan = false;
         }
         if(this.isFaceShan)
         {
            this.isFaceShan = false;
         }
         if(this.isInviteShan)
         {
            this.isInviteShan = false;
         }
         if(this.isLoginShan)
         {
            this.isLoginShan = false;
         }
         if(this.isOnLineShan)
         {
            this.isOnLineShan = false;
         }
         if(this.isXianshiShan)
         {
            this.isXianshiShan = false;
         }
      }
      
      public function BossRefurBish(param1:Array) : void
      {
         this.giftPanel.setInitialize(param1);
         this.removeLoaderBuff();
      }
      
      public function addLoadBuffer() : void
      {
         this.removeLoaderBuff();
         this.loaderBuff = LoadBuffer.show(this.giftPanel);
      }
      
      public function removeLoaderBuff() : void
      {
         if(this.loaderBuff)
         {
            this.loaderBuff.close();
         }
         this.loaderBuff = null;
      }
      
      public function setHuoYue(param1:int, param2:int, param3:Boolean, param4:Array, param5:Array) : void
      {
         this.giftPanel.setList(param4);
         this.giftPanel.setGoods(param5);
         this.giftPanel.setInfo(param1,param2,param3);
      }
      
      public function getGiftComplete(param1:int) : void
      {
         if(param1 == 1)
         {
            this.msgSenderProxy.send_53781();
         }
      }
      
      public function setQianDao(param1:int, param2:String) : void
      {
         this.giftPanel.setSign(param1,param2);
         this.msgSenderProxy.send_53781();
      }
      
      public function setData() : void
      {
      }
      
      public function setZhou() : void
      {
      }
      
      public function setZhouLianXu() : void
      {
      }
      
      public function upLine(param1:int) : void
      {
         if(param1 == 1)
         {
            PipeManager.sendMsg(PipeConstants.SHOW_GIFT_PLANE);
            this.giftPanel.DeaultDayActivity();
         }
         else
         {
            PipeManager.sendMsg(PipeConstants.SHOW_WANJIAHUIKUI);
            GameInstance.uiInstance.wanjiahuikuiPanel.setICO(new Goods(12442),new Goods(7372));
         }
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ZhuangbeiHuishouPanel,function():void
         {
            _zhuangbeiHuishouPanel.addEventListener(ZhuangbeiHuishouPanel.UI_ZHUANGBEI_HUISHOU_OK,zhuangbeiHuishouHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ZhuangbeiHuishouPanel,function():void
         {
            _zhuangbeiHuishouPanel.addEventListener(ZhuangbeiHuishouPanel.UI_ZHUANGBEI_HUISHOU_OK,zhuangbeiHuishouHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(Backpack,function():void
         {
            GameInstance.uiInstance.backpack.addEventListener(Backpack.UI_BACKPACK_XINSHOULIBAO_OPEN,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(Backpack,function():void
         {
            GameInstance.uiInstance.backpack.removeEventListener(Backpack.UI_BACKPACK_XINSHOULIBAO_OPEN,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(MainUI,function():void
         {
            GameInstance.uiInstance.mainUI.addEventListener(MainUI.MAINUI_GIFT_BOX_CLICK,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(Backpack,function():void
         {
            GameInstance.uiInstance.mainUI.addEventListener(MainUI.MAINUI_GIFT_BOX_CLICK,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(WanJiaHuiKuiPanel,function():void
         {
            GameInstance.uiInstance.wanjiahuikuiPanel.addEventListener(WanJiaHuiKuiPanel.UI_LAOWANJIAHUIKUI_CLICK,mainCharBackpackHandle);
            GameInstance.uiInstance.wanjiahuikuiPanel.addEventListener(WanJiaHuiKuiPanel.UI_LAOWANJIAHUIKUIXUANZE_CLICK,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(WanJiaHuiKuiPanel,function():void
         {
            GameInstance.uiInstance.wanjiahuikuiPanel.removeEventListener(WanJiaHuiKuiPanel.UI_LAOWANJIAHUIKUI_CLICK,mainCharBackpackHandle);
            GameInstance.uiInstance.wanjiahuikuiPanel.removeEventListener(WanJiaHuiKuiPanel.UI_LAOWANJIAHUIKUIXUANZE_CLICK,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(GiftPanel,function():void
         {
            giftPanel.addEventListener(GiftPanel.UI_ACTIVE_SHOW,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.UI_NEWSPAPER_SHOW,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.UI_GIFTPANEL_ACTIVEACTIVECANVAS_CLECK,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.UI_GIFTPANEL_ACTIVEACTIVECANVAS_SELECT,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.UI_GIFTPANEL_JIANMIAN_SHOW,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.UI_GIFTPANEL_ZAIXIAN_SHOW,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.UI_GIFTPANEL_YAOQING_GET_BTN_CLICK,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.UI_GIFTPANEL_ZAIXIAN_GET_BTN_CLICK,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.UI_GIFTPANEL_DENGLUY_GET_BTN_CLICK,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.UI_GIFTPANEL_QIANDAO_GET_BTN_CLICK,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.CHAT_MENU_CLICK,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.UI_CONQUERPANEL_BOSS_LIST_CLICK,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.UI_CONQUERPANEL_BOSS_SHOW,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.UI_GIFTPANEL_SHOW_DAYACTIVITY_CLICK,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.UI_GIFTPANEL_DAYACTIVITY_GET_BTN_CLICK,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.UI_GIFTPANEL_DAYACTIVITY_TIME1_BTN_CLICK,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.UI_GIFTPANEL_DAYACTIVITY_TIME2_BTN_CLICK,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.UI_GIFTPANEL_DAYACTIVITY_TIME3_BTN_CLICK,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.UI_GIFTPANEL_SHOW_LEIJIDENGLU_CLICK,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.UI_GIFTPANEL_LEIJIDENGLU_CLICK,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.UI_RICHANGHUODONG_SHOW,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.UI_JINGCAIFUBEN_SHOW,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.UI_REXUEPK_SHOW,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.UI_GIFTPANEL_ACTIVE_PAGE_BTN_CLICK,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.UI_GUAJIWANCHENG_BTN_CLICK,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.UI_LIJIWANCHENG_LINGQUJIANGLI_BTN_CLICK,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.UI_XINZENGGUAJILAN_BTN_CLICK,mainCharBackpackHandle);
            giftPanel.addEventListener(GiftPanel.UI_YUENANHUODONGYOUHUA_CLICK,mainCharBackpackHandle);
            giftPanel.addEventListener(FCloseEvent.CLOSE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(GiftPanel,function():void
         {
            giftPanel.removeEventListener(GiftPanel.UI_ACTIVE_SHOW,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.UI_NEWSPAPER_SHOW,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.UI_GIFTPANEL_ACTIVEACTIVECANVAS_CLECK,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.UI_GIFTPANEL_ACTIVEACTIVECANVAS_SELECT,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.UI_GIFTPANEL_JIANMIAN_SHOW,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.UI_GIFTPANEL_ZAIXIAN_SHOW,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.UI_GIFTPANEL_YAOQING_GET_BTN_CLICK,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.UI_GIFTPANEL_ZAIXIAN_GET_BTN_CLICK,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.UI_GIFTPANEL_DENGLUY_GET_BTN_CLICK,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.UI_GIFTPANEL_QIANDAO_GET_BTN_CLICK,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.CHAT_MENU_CLICK,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.UI_CONQUERPANEL_BOSS_LIST_CLICK,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.UI_CONQUERPANEL_BOSS_SHOW,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.UI_GIFTPANEL_SHOW_DAYACTIVITY_CLICK,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.UI_GIFTPANEL_DAYACTIVITY_GET_BTN_CLICK,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.UI_GIFTPANEL_DAYACTIVITY_TIME1_BTN_CLICK,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.UI_GIFTPANEL_DAYACTIVITY_TIME2_BTN_CLICK,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.UI_GIFTPANEL_DAYACTIVITY_TIME3_BTN_CLICK,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.UI_GIFTPANEL_SHOW_LEIJIDENGLU_CLICK,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.UI_GIFTPANEL_LEIJIDENGLU_CLICK,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.UI_RICHANGHUODONG_SHOW,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.UI_JINGCAIFUBEN_SHOW,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.UI_REXUEPK_SHOW,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.UI_GIFTPANEL_ACTIVE_PAGE_BTN_CLICK,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.UI_GUAJIWANCHENG_BTN_CLICK,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.UI_LIJIWANCHENG_LINGQUJIANGLI_BTN_CLICK,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.UI_XINZENGGUAJILAN_BTN_CLICK,mainCharBackpackHandle);
            giftPanel.removeEventListener(GiftPanel.UI_YUENANHUODONGYOUHUA_CLICK,mainCharBackpackHandle);
            giftPanel.removeEventListener(FCloseEvent.CLOSE,panelClose);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YN2016XiaoFeiPanel,function():void
         {
            GameInstance.uiInstance.yn2016XiaoFeiPanel.addEventListener(YN2016XiaoFeiPanel.REQUEST_LINGQU,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2016XiaoFeiPanel,function():void
         {
            GameInstance.uiInstance.yn2016XiaoFeiPanel.removeEventListener(YN2016XiaoFeiPanel.REQUEST_LINGQU,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YN2016HuoDongXiaoFeiPanel,function():void
         {
            GameInstance.uiInstance.yn2016HuoDongXiaoFeiPanel.addEventListener(YN2016HuoDongXiaoFeiPanel.HUODONGXIAOFEI_LINGQU,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2016HuoDongXiaoFeiPanel,function():void
         {
            GameInstance.uiInstance.yn2016HuoDongXiaoFeiPanel.removeEventListener(YN2016HuoDongXiaoFeiPanel.HUODONGXIAOFEI_LINGQU,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YN2016HuodongFanliPanel,function():void
         {
            GameInstance.uiInstance.yn2016HuoDongfanliPanel.addEventListener(YN2016HuodongFanliPanel.HUODONGFANEL_LINGQU,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2016HuodongFanliPanel,function():void
         {
            GameInstance.uiInstance.yn2016HuoDongfanliPanel.removeEventListener(YN2016HuodongFanliPanel.HUODONGFANEL_LINGQU,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YN2016ZhouqicailuPanel,function():void
         {
            GameInstance.uiInstance.yn2016ZhouqicailuPanel.addEventListener(YN2016ZhouqicailuPanel.LINGQUJIANGLI,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2016ZhouqicailuPanel,function():void
         {
            GameInstance.uiInstance.yn2016ZhouqicailuPanel.removeEventListener(YN2016ZhouqicailuPanel.LINGQUJIANGLI,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YN2016PaihangbangPanel,function():void
         {
            GameInstance.uiInstance.ynkaixuepaihangbangPanel.addEventListener(YN2016PaihangbangPanel.LINGQUJIANGLI,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2016PaihangbangPanel,function():void
         {
            GameInstance.uiInstance.ynkaixuepaihangbangPanel.removeEventListener(YN2016PaihangbangPanel.LINGQUJIANGLI,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(TijiaowupinPanel,function():void
         {
            GameInstance.uiInstance.yntijiaowupinPanel.addEventListener(YN2016PaihangbangPanel.TIJIAOWUPIN,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TijiaowupinPanel,function():void
         {
            GameInstance.uiInstance.yntijiaowupinPanel.removeEventListener(YN2016PaihangbangPanel.TIJIAOWUPIN,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YN2016QicaiPaihangbangPanel,function():void
         {
            GameInstance.uiInstance.ynqicaipaihangbangPanel.addEventListener(YN2016QicaiPaihangbangPanel.LINGQUJIANGLI,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2016QicaiPaihangbangPanel,function():void
         {
            GameInstance.uiInstance.ynqicaipaihangbangPanel.removeEventListener(YN2016QicaiPaihangbangPanel.LINGQUJIANGLI,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(QicaitijiaowupinPanel,function():void
         {
            GameInstance.uiInstance.ynqicaitijiaowupinPanel.addEventListener(YN2016QicaiPaihangbangPanel.TIJIAOWUPIN,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(QicaitijiaowupinPanel,function():void
         {
            GameInstance.uiInstance.ynqicaitijiaowupinPanel.removeEventListener(YN2016QicaiPaihangbangPanel.TIJIAOWUPIN,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YN2016FuqitongxinPaihangbangPanel,function():void
         {
            GameInstance.uiInstance.ynfuqitongxinpaihangbangPanel.addEventListener(YN2016FuqitongxinPaihangbangPanel.LINGQUJIANGLI,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2016FuqitongxinPaihangbangPanel,function():void
         {
            GameInstance.uiInstance.ynfuqitongxinpaihangbangPanel.removeEventListener(YN2016FuqitongxinPaihangbangPanel.LINGQUJIANGLI,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YN2016FuqitongxinPanel,function():void
         {
            GameInstance.uiInstance.ynfuqitongxinPanel.addEventListener(YN2016FuqitongxinPaihangbangPanel.DUIHUANWUPIN,mainCharBackpackHandle);
            GameInstance.uiInstance.ynfuqitongxinPanel.addEventListener(YN2016FuqitongxinPaihangbangPanel.PAIHANGBANG,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2016FuqitongxinPanel,function():void
         {
            GameInstance.uiInstance.ynfuqitongxinPanel.removeEventListener(YN2016FuqitongxinPaihangbangPanel.DUIHUANWUPIN,mainCharBackpackHandle);
            GameInstance.uiInstance.ynfuqitongxinPanel.removeEventListener(YN2016FuqitongxinPaihangbangPanel.PAIHANGBANG,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YN2016WuShenzhanlianPanel,function():void
         {
            GameInstance.uiInstance.yn2016WushenzhanlianPanel.addEventListener(YN2016WuShenzhanlianPanel.WUSHEN_LINGQU,mainCharBackpackHandle);
            GameInstance.uiInstance.yn2016WushenzhanlianPanel.addEventListener(YN2016WuShenzhanlianPanel.WUSHEN_TIJIAO,mainCharBackpackHandle);
            GameInstance.uiInstance.yn2016WushenzhanlianPanel.addEventListener(YN2016WuShenzhanlianPanel.WUSHEN_FANYE,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2016WuShenzhanlianPanel,function():void
         {
            GameInstance.uiInstance.yn2016WushenzhanlianPanel.removeEventListener(YN2016WuShenzhanlianPanel.WUSHEN_LINGQU,mainCharBackpackHandle);
            GameInstance.uiInstance.yn2016WushenzhanlianPanel.removeEventListener(YN2016WuShenzhanlianPanel.WUSHEN_TIJIAO,mainCharBackpackHandle);
            GameInstance.uiInstance.yn2016WushenzhanlianPanel.removeEventListener(YN2016WuShenzhanlianPanel.WUSHEN_FANYE,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YNjinqianshuPanel,function():void
         {
            GameInstance.uiInstance.ynjinqianshuPanel.addEventListener(YNjinqianshuPanel.JINQIANSHULINGQV,mainCharBackpackHandle);
            GameInstance.uiInstance.ynjinqianshuPanel.addEventListener(YNjinqianshuPanel.JINQIANSHUTIJIAO,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YNjinqianshuPanel,function():void
         {
            GameInstance.uiInstance.ynjinqianshuPanel.removeEventListener(YNjinqianshuPanel.JINQIANSHULINGQV,mainCharBackpackHandle);
            GameInstance.uiInstance.ynjinqianshuPanel.removeEventListener(YNjinqianshuPanel.JINQIANSHUTIJIAO,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YN2016LiupaijingjiPanel,function():void
         {
            GameInstance.uiInstance.ynliupaijingjiPanel.addEventListener(YN2016LiupaijingjiPanel.LINGQUJIANGLI,mainCharBackpackHandle);
            GameInstance.uiInstance.ynliupaijingjiPanel.addEventListener(YN2016LiupaijingjiPanel.TIJIAOWUPIN,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2016LiupaijingjiPanel,function():void
         {
            GameInstance.uiInstance.ynliupaijingjiPanel.removeEventListener(YN2016LiupaijingjiPanel.LINGQUJIANGLI,mainCharBackpackHandle);
            GameInstance.uiInstance.ynliupaijingjiPanel.removeEventListener(YN2016LiupaijingjiPanel.TIJIAOWUPIN,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YN2016YingbinzhouliPanel,function():void
         {
            GameInstance.uiInstance.ynyingbinzhouliPanel.addEventListener(YN2016YingbinzhouliPanel.LINGQUJIANGLI,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2016YingbinzhouliPanel,function():void
         {
            GameInstance.uiInstance.ynyingbinzhouliPanel.removeEventListener(YN2016YingbinzhouliPanel.LINGQUJIANGLI,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YN2016ZhenbaogePanel,function():void
         {
            GameInstance.uiInstance.ynzhenbaogePanel.addEventListener(YN2016ZhenbaogePanel.ZHENBAOGEGOUMAI,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2016ZhenbaogePanel,function():void
         {
            GameInstance.uiInstance.ynzhenbaogePanel.removeEventListener(YN2016ZhenbaogePanel.ZHENBAOGEGOUMAI,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YN2016MengZhuZhuFuPanel,function():void
         {
            GameInstance.uiInstance.yn2016MengZhuZhuFuPanel.addEventListener(YN2016MengZhuZhuFuPanel.REQUEST_LINGQU,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2016MengZhuZhuFuPanel,function():void
         {
            GameInstance.uiInstance.yn2016MengZhuZhuFuPanel.removeEventListener(YN2016MengZhuZhuFuPanel.REQUEST_LINGQU,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YN2017YouHuiZhouQiPanel,function():void
         {
            GameInstance.uiInstance.youhuizhouqiPanel.addEventListener(YN2017YouHuiZhouQiPanel.LINGQU,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2017YouHuiZhouQiPanel,function():void
         {
            GameInstance.uiInstance.youhuizhouqiPanel.removeEventListener(YN2017YouHuiZhouQiPanel.LINGQU,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YN2017OulePanel,function():void
         {
            GameInstance.uiInstance.oulePanel.addEventListener(YN2017OulePanel.LINGQU,mainCharBackpackHandle);
            GameInstance.uiInstance.oulePanel.addEventListener(YN2017OulePanel.TIJIAO,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2017OulePanel,function():void
         {
            GameInstance.uiInstance.oulePanel.removeEventListener(YN2017OulePanel.LINGQU,mainCharBackpackHandle);
            GameInstance.uiInstance.oulePanel.removeEventListener(YN2017OulePanel.TIJIAO,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YN2017YingXiongMingChengPanel,function():void
         {
            GameInstance.uiInstance.yingxiongmingchengPanel.addEventListener(YN2017YingXiongMingChengPanel.LINGQUJIANGLI,mainCharBackpackHandle);
            GameInstance.uiInstance.yingxiongmingchengPanel.addEventListener(YN2017YingXiongMingChengPanel.DUIHUANWUPIN,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2017YingXiongMingChengPanel,function():void
         {
            GameInstance.uiInstance.yingxiongmingchengPanel.removeEventListener(YN2017YingXiongMingChengPanel.LINGQUJIANGLI,mainCharBackpackHandle);
            GameInstance.uiInstance.yingxiongmingchengPanel.removeEventListener(YN2017YingXiongMingChengPanel.DUIHUANWUPIN,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YN2017Meitianyouhui2Panel,function():void
         {
            GameInstance.uiInstance.$meitianyouhui2Panel.addEventListener(YN2017Meitianyouhui2Panel.MEITIANYOUHUI,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2017Meitianyouhui2Panel,function():void
         {
            GameInstance.uiInstance.$meitianyouhui2Panel.removeEventListener(YN2017Meitianyouhui2Panel.MEITIANYOUHUI,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YN2017WudushengzhenPanel,function():void
         {
            GameInstance.uiInstance.$shengzhenPanel.addEventListener(YN2017WudushengzhenPanel.WDSZ_LINGQU,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2017WudushengzhenPanel,function():void
         {
            GameInstance.uiInstance.$shengzhenPanel.removeEventListener(YN2017WudushengzhenPanel.WDSZ_LINGQU,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YN2017Tengtianyu2Panel,function():void
         {
            GameInstance.uiInstance.$shengzhen2Panel.addEventListener(YN2017Tengtianyu2Panel.WDSZ22_LINGQU,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2017Tengtianyu2Panel,function():void
         {
            GameInstance.uiInstance.$shengzhen2Panel.removeEventListener(YN2017Tengtianyu2Panel.WDSZ22_LINGQU,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YN2017FeishengjingjiePanel,function():void
         {
            GameInstance.uiInstance.$feishengjingjiePanel.addEventListener(YN2017FeishengjingjiePanel.WDSZ22_LINGQU,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2017FeishengjingjiePanel,function():void
         {
            GameInstance.uiInstance.$feishengjingjiePanel.removeEventListener(YN2017FeishengjingjiePanel.WDSZ22_LINGQU,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YN2017ShouchongshijianPanel,function():void
         {
            GameInstance.uiInstance.$shouchongshijianPanel.addEventListener(YN2017ShouchongshijianPanel.SCSJ_LINGQU,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2017ShouchongshijianPanel,function():void
         {
            GameInstance.uiInstance.$shouchongshijianPanel.removeEventListener(YN2017ShouchongshijianPanel.SCSJ_LINGQU,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YN2017Tengtianyu3Panel,function():void
         {
            GameInstance.uiInstance.$shengzhen3Panel.addEventListener(YN2017Tengtianyu3Panel.WDSZ23_LINGQU,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2017Tengtianyu3Panel,function():void
         {
            GameInstance.uiInstance.$shengzhen3Panel.removeEventListener(YN2017Tengtianyu3Panel.WDSZ23_LINGQU,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YNV303Panel,function():void
         {
            GameInstance.uiInstance.$V303Panel.addEventListener(YNV303Panel.V303_LINGQU,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YNV303Panel,function():void
         {
            GameInstance.uiInstance.$V303Panel.removeEventListener(YNV303Panel.V303_LINGQU,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YN2017KaixueqiqiuPanel,function():void
         {
            GameInstance.uiInstance.$kaixueqiqiuPanel.addEventListener(YN2017KaixueqiqiuPanel.QINGQIUKAIXUEQIQIULINGJIANG,mainCharBackpackHandle);
            GameInstance.uiInstance.$kaixueqiqiuPanel.addEventListener(YN2017KaixueqiqiuPanel.QINGQIUKAIXUEQIQIUTIJIAO,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2017KaixueqiqiuPanel,function():void
         {
            GameInstance.uiInstance.$kaixueqiqiuPanel.removeEventListener(YN2017KaixueqiqiuPanel.QINGQIUKAIXUEQIQIULINGJIANG,mainCharBackpackHandle);
            GameInstance.uiInstance.$kaixueqiqiuPanel.removeEventListener(YN2017KaixueqiqiuPanel.QINGQIUKAIXUEQIQIUTIJIAO,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YN2017ZengsongnvrenPanel,function():void
         {
            GameInstance.uiInstance.$zengsongnvrenPanel.addEventListener(YN2017ZengsongnvrenPanel.ZENGSONGNVRENPAIHANGBANGJIANGLI,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2017ZengsongnvrenPanel,function():void
         {
            GameInstance.uiInstance.$zengsongnvrenPanel.removeEventListener(YN2017ZengsongnvrenPanel.ZENGSONGNVRENPAIHANGBANGJIANGLI,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YNHuazhuangdasaiPanel,function():void
         {
            GameInstance.uiInstance.$huazhuangdasaiPanel.addEventListener(YNHuazhuangdasaiPanel.HUAZHUANGDASAI_CANYU,mainCharBackpackHandle);
            GameInstance.uiInstance.$huazhuangdasaiPanel.addEventListener(YNHuazhuangdasaiPanel.HUAZHUANGDASAI_CHAKAN,mainCharBackpackHandle);
            GameInstance.uiInstance.$huazhuangdasaiPanel.addEventListener(YNHuazhuangdasaiPanel.HUAZHUANGDASAI_FANYE,mainCharBackpackHandle);
            GameInstance.uiInstance.$huazhuangdasaiPanel.addEventListener(YNHuazhuangdasaiPanel.HUAZHUANGDASAI_LINGJIANG,mainCharBackpackHandle);
            GameInstance.uiInstance.$huazhuangdasaiPanel.addEventListener(YNHuazhuangdasaiPanel.HUAZHUANGDASAI_TOUPIAO,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YNHuazhuangdasaiPanel,function():void
         {
            GameInstance.uiInstance.$huazhuangdasaiPanel.removeEventListener(YNHuazhuangdasaiPanel.HUAZHUANGDASAI_CANYU,mainCharBackpackHandle);
            GameInstance.uiInstance.$huazhuangdasaiPanel.removeEventListener(YNHuazhuangdasaiPanel.HUAZHUANGDASAI_CHAKAN,mainCharBackpackHandle);
            GameInstance.uiInstance.$huazhuangdasaiPanel.removeEventListener(YNHuazhuangdasaiPanel.HUAZHUANGDASAI_FANYE,mainCharBackpackHandle);
            GameInstance.uiInstance.$huazhuangdasaiPanel.removeEventListener(YNHuazhuangdasaiPanel.HUAZHUANGDASAI_LINGJIANG,mainCharBackpackHandle);
            GameInstance.uiInstance.$huazhuangdasaiPanel.removeEventListener(YNHuazhuangdasaiPanel.HUAZHUANGDASAI_TOUPIAO,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YNNeiligaishiPanel,function():void
         {
            GameInstance.uiInstance.$neiligaishiPanel.addEventListener(YNNeiligaishiPanel.NEILIGAISHI_TIJIAOWUPIN,mainCharBackpackHandle);
            GameInstance.uiInstance.$neiligaishiPanel.addEventListener(YNNeiligaishiPanel.NEILIGAISHI_LINGQU,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YNNeiligaishiPanel,function():void
         {
            GameInstance.uiInstance.$neiligaishiPanel.removeEventListener(YNNeiligaishiPanel.NEILIGAISHI_TIJIAOWUPIN,mainCharBackpackHandle);
            GameInstance.uiInstance.$neiligaishiPanel.removeEventListener(YNNeiligaishiPanel.NEILIGAISHI_LINGQU,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YNPeiyangdianfengshouPanel,function():void
         {
            GameInstance.uiInstance.$peiyangdianfengshouPanel.addEventListener(YNPeiyangdianfengshouPanel.PEIYANGDIANFENGSHOU_LINGQUJIANGLI,mainCharBackpackHandle);
            GameInstance.uiInstance.$peiyangdianfengshouPanel.addEventListener(YNPeiyangdianfengshouPanel.PEIYANGDIANFENGSHOU_WEIYANG,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YNPeiyangdianfengshouPanel,function():void
         {
            GameInstance.uiInstance.$peiyangdianfengshouPanel.removeEventListener(YNPeiyangdianfengshouPanel.PEIYANGDIANFENGSHOU_LINGQUJIANGLI,mainCharBackpackHandle);
            GameInstance.uiInstance.$peiyangdianfengshouPanel.removeEventListener(YNPeiyangdianfengshouPanel.PEIYANGDIANFENGSHOU_WEIYANG,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(ZhengDuoZhanPanel,function():void
         {
            GameInstance.uiInstance.zhengDuoZhanPanel.addEventListener(ZhengDuoZhanPanel.ZHENGDUOZHAN_CLICK,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ZhengDuoZhanPanel,function():void
         {
            GameInstance.uiInstance.zhengDuoZhanPanel.removeEventListener(ZhengDuoZhanPanel.ZHENGDUOZHAN_CLICK,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(MeiJiuPaiHangPanel,function():void
         {
            GameInstance.uiInstance.meiJiuPaiHangPanel.addEventListener(MeiJiuPaiHangPanel.MEIJIUPAIHANG_CLICK,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MeiJiuPaiHangPanel,function():void
         {
            GameInstance.uiInstance.meiJiuPaiHangPanel.removeEventListener(MeiJiuPaiHangPanel.MEIJIUPAIHANG_CLICK,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(XingXingPaiHangPanel,function():void
         {
            GameInstance.uiInstance.xingXingPaiHangPanel.addEventListener(XingXingPaiHangPanel.MEIJIUPAIHANG_CLICK,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(XingXingPaiHangPanel,function():void
         {
            GameInstance.uiInstance.xingXingPaiHangPanel.removeEventListener(XingXingPaiHangPanel.MEIJIUPAIHANG_CLICK,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(LieShouPaiHangPanel,function():void
         {
            GameInstance.uiInstance.lieShouPaiHangPanel.addEventListener(LieShouPaiHangPanel.MEIJIUPAIHANG_CLICK,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(LieShouPaiHangPanel,function():void
         {
            GameInstance.uiInstance.lieShouPaiHangPanel.removeEventListener(LieShouPaiHangPanel.MEIJIUPAIHANG_CLICK,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(FuNvJiePaiHangPanel,function():void
         {
            GameInstance.uiInstance.fuNvJiePaiHang.addEventListener(FuNvJiePaiHangPanel.MEIJIUPAIHANG_CLICK,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(FuNvJiePaiHangPanel,function():void
         {
            GameInstance.uiInstance.fuNvJiePaiHang.removeEventListener(FuNvJiePaiHangPanel.MEIJIUPAIHANG_CLICK,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(LieShouPaiHang2Panel,function():void
         {
            GameInstance.uiInstance.lieShouPaiHang2Panel.addEventListener(LieShouPaiHang2Panel.MEIJIUPAIHANG_CLICK,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(LieShouPaiHang2Panel,function():void
         {
            GameInstance.uiInstance.lieShouPaiHang2Panel.removeEventListener(LieShouPaiHang2Panel.MEIJIUPAIHANG_CLICK,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(ShengJieDaHuiKuiPanel,function():void
         {
            GameInstance.uiInstance.shengjifuliPanel.addEventListener(ShengJieDaHuiKuiPanel.SHENGJIEDAHUIKUI_RECEIVE,mainCharBackpackHandle);
            GameInstance.uiInstance.shengjifuliPanel.addEventListener(ShengJieDaHuiKuiPanel.SHENGJIEDAHUIKUI_REQUEST,mainCharBackpackHandle);
            GameInstance.uiInstance.shengjifuliPanel.addEventListener(ShengJieDaHuiKuiPanel.SHENGJIEDAHUIKUI_LIBAO,mainCharBackpackHandle);
            GameInstance.uiInstance.shengjifuliPanel.addEventListener(ShengJieDaHuiKuiPanel.SHENGJIEDAHUIKUI_GONGFAJIHUO,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ShengJieDaHuiKuiPanel,function():void
         {
            GameInstance.uiInstance.shengjifuliPanel.removeEventListener(ShengJieDaHuiKuiPanel.SHENGJIEDAHUIKUI_RECEIVE,mainCharBackpackHandle);
            GameInstance.uiInstance.shengjifuliPanel.removeEventListener(ShengJieDaHuiKuiPanel.SHENGJIEDAHUIKUI_REQUEST,mainCharBackpackHandle);
            GameInstance.uiInstance.shengjifuliPanel.removeEventListener(ShengJieDaHuiKuiPanel.SHENGJIEDAHUIKUI_LIBAO,mainCharBackpackHandle);
            GameInstance.uiInstance.shengjifuliPanel.removeEventListener(ShengJieDaHuiKuiPanel.SHENGJIEDAHUIKUI_GONGFAJIHUO,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(DengLuLingJiangV632Panel,function():void
         {
            GameInstance.uiInstance.dengLuLingJiangPanel.addEventListener(Event.ADDED_TO_STAGE,dengluLingJiangHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(DengLuLingJiangV632Panel,function():void
         {
            GameInstance.uiInstance.dengLuLingJiangPanel.removeEventListener(Event.REMOVED_FROM_STAGE,dengluLingJiangHandler);
         });
      }
      
      private function dengluLingJiangHandler(param1:Event) : *
      {
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               break;
            case Event.REMOVED_FROM_STAGE:
               GameInstance.uiInstance.dengLuLingJiangPanel.removeHandler();
         }
      }
      
      private function panelClose(param1:FCloseEvent = null) : void
      {
         this.islevelShan = false;
         this.isInviteShan = false;
         this.isFaceShan = false;
         this.isLoginShan = false;
         this.isOnLineShan = false;
         this.isXianshiShan = false;
         this.nowShowPanel = "";
         this.removeLoaderBuff();
      }
      
      private function zhuangbeiHuishouHandle(param1:BaseEvent = null) : void
      {
         var _loc2_:Goods = param1.data as Goods;
         if(Boolean(_loc2_.position) && Boolean(_loc2_.id))
         {
            this.msgSenderProxy.send_53093({
               "type":this._zhuangbeiHuishouType,
               "pos":_loc2_.position,
               "id":_loc2_.id
            });
         }
      }
      
      private function mainCharBackpackHandle(param1:Event = null) : void
      {
         var baseE:BaseEvent = null;
         var id:int = 0;
         var tab_type:int = 0;
         var monsterKindID:int = 0;
         var monsterRes:MonsterRes = null;
         var r:Array = null;
         var types2:int = 0;
         var types3:int = 0;
         var types1:int = 0;
         var types:int = 0;
         var day:int = 0;
         var gjArray:Array = null;
         var ary:Array = null;
         var ty:int = 0;
         var e:Event = param1;
         var type:String = e.type;
         baseE = e as BaseEvent;
         switch(type)
         {
            case Backpack.UI_BACKPACK_XINSHOULIBAO_OPEN:
               this.msgSenderProxy.send_50703({
                  "id":this.guideId,
                  "index":this.index
               });
               break;
            case MainUI.MAINUI_GIFT_BOX_CLICK:
               this.msgSenderProxy.send_50717();
               break;
            case GiftPanel.UI_GIFTPANEL_JIANMIAN_SHOW:
               if(this.nowShowPanel == GiftPanel.UI_GIFTPANEL_JIANMIAN_SHOW)
               {
                  return;
               }
               this.nowShowPanel = GiftPanel.UI_GIFTPANEL_JIANMIAN_SHOW;
               this.giftPanel.showJianMian();
               this.msgSenderProxy.send_50741();
               this.msgSenderProxy.send_50755({"type":1});
               break;
            case GiftPanel.UI_GIFTPANEL_ZAIXIAN_SHOW:
               if(this.nowShowPanel == GiftPanel.UI_GIFTPANEL_ZAIXIAN_SHOW)
               {
                  return;
               }
               this.nowShowPanel = GiftPanel.UI_GIFTPANEL_ZAIXIAN_SHOW;
               this.giftPanel.showZaiXian();
               this.msgSenderProxy.send_50751();
               this.msgSenderProxy.send_50757();
               this.addLoadBuffer();
               break;
            case GiftPanel.UI_GIFTPANEL_YAOQING_GET_BTN_CLICK:
               id = baseE.data as int;
               this.msgSenderProxy.send_50733(id);
               break;
            case GiftPanel.UI_GIFTPANEL_DENGLUY_GET_BTN_CLICK:
               id = baseE.data as int;
               this.msgSenderProxy.send_50743(id);
               break;
            case GiftPanel.UI_GIFTPANEL_ZAIXIAN_GET_BTN_CLICK:
               this.msgSenderProxy.send_50753();
               break;
            case GiftPanel.UI_ACTIVE_SHOW:
               this.nowShowPanel = GiftPanel.UI_ACTIVE_SHOW;
               this.giftPanel.showShengJi();
               this.sendActiveMsg();
               this.addLoadBuffer();
               break;
            case GiftPanel.UI_GIFTPANEL_ACTIVEACTIVECANVAS_CLECK:
               this.isALLActive = baseE.data as Boolean;
               this.sendActiveMsg();
               this.addLoadBuffer();
               break;
            case GiftPanel.UI_GIFTPANEL_ACTIVEACTIVECANVAS_SELECT:
               if(this.activeSelectedIndex == baseE.data as int)
               {
                  return;
               }
               this.activeSelectedIndex = baseE.data as int;
               this.sendActiveMsg();
               this.addLoadBuffer();
               break;
            case GiftPanel.UI_NEWSPAPER_SHOW:
               if(this.nowShowPanel == GiftPanel.UI_NEWSPAPER_SHOW)
               {
                  return;
               }
               this.nowShowPanel = GiftPanel.UI_NEWSPAPER_SHOW;
               this.giftPanel.showNewSpaper();
               this.msgSenderProxy.send_50795();
               break;
            case GiftPanel.UI_GIFTPANEL_QIANDAO_GET_BTN_CLICK:
               this.msgSenderProxy.send_50759();
               break;
            case GiftPanel.UI_CONQUERPANEL_BOSS_LIST_CLICK:
               monsterKindID = baseE.data as int;
               monsterRes = MonsterResManager.getMonsterRes(monsterKindID);
               if(monsterRes != null)
               {
                  this.setAvatar(monsterRes);
               }
               break;
            case GiftPanel.CHAT_MENU_CLICK:
               r = baseE.data as Array;
               if(r[0] == 1 && r[1] != GameInstance.mainChar.id && r[1] != -1)
               {
                  GameInstance.uiInstance.mainUI.setPrivateChat(r[2]);
               }
               if(r[0] == 2 && r[1] != GameInstance.mainChar.id && r[1] != -1)
               {
                  GameInstance.lookPlayerID = r[1];
                  if(Fun.isVisible(GameInstance.uiInstance._targetAttribute))
                  {
                     PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
                  }
                  PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               }
               break;
            case GiftPanel.UI_CONQUERPANEL_BOSS_SHOW:
               if(this.nowShowPanel == GiftPanel.UI_CONQUERPANEL_BOSS_SHOW)
               {
                  return;
               }
               this.nowShowPanel = GiftPanel.UI_CONQUERPANEL_BOSS_SHOW;
               this.giftPanel.showBossXinxi();
               this.msgSenderProxy.send_40021();
               break;
            case GiftPanel.UI_GIFTPANEL_DAYACTIVITY_GET_BTN_CLICK:
               this.msgSenderProxy.send_53783(baseE.data as int);
               break;
            case GiftPanel.UI_GIFTPANEL_SHOW_DAYACTIVITY_CLICK:
               if(this.nowShowPanel == GiftPanel.UI_GIFTPANEL_SHOW_DAYACTIVITY_CLICK)
               {
                  return;
               }
               this.nowShowPanel = GiftPanel.UI_GIFTPANEL_SHOW_DAYACTIVITY_CLICK;
               this.giftPanel.showDayActivity();
               this.msgSenderProxy.send_50741();
               this.msgSenderProxy.send_50755({"type":1});
               this.msgSenderProxy.send_53781();
               this.msgSenderProxy.send_50751();
               this.msgSenderProxy.send_50757();
               break;
            case GiftPanel.UI_GIFTPANEL_DAYACTIVITY_TIME1_BTN_CLICK:
               this.msgSenderProxy.send_53785(1);
               break;
            case GiftPanel.UI_GIFTPANEL_DAYACTIVITY_TIME2_BTN_CLICK:
               this.msgSenderProxy.send_53785(2);
               break;
            case GiftPanel.UI_GIFTPANEL_DAYACTIVITY_TIME3_BTN_CLICK:
               this.msgSenderProxy.send_53785(3);
               break;
            case YNjinqianshuPanel.JINQIANSHULINGQV:
               types2 = baseE.data as int;
               this.msgSenderProxy.send_81665(types2);
               break;
            case YNjinqianshuPanel.JINQIANSHUTIJIAO:
               types3 = baseE.data as int;
               this.msgSenderProxy.send_81663(types3);
               break;
            case WanJiaHuiKuiPanel.UI_LAOWANJIAHUIKUIXUANZE_CLICK:
               types1 = baseE.data as int;
               GameInstance.uiInstance.wanjiahuikuiPanel.setType(types1);
               break;
            case WanJiaHuiKuiPanel.UI_LAOWANJIAHUIKUI_CLICK:
               types = baseE.data as int;
               if(types == 1)
               {
                  this.msgSenderProxy.send_53791(1);
                  GameInstance.uiInstance.wanjiahuikuiPanel.onClose();
               }
               else
               {
                  FAlert.cancelLabel = LanResManager.getLanCommonTextWords("重新选择");
                  FAlert.show(LanResManager.getLanCommonTextWords("如果选择新玩家，则永远不能再次获得老玩家奖励，确定要选择新玩家吗？"),"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        msgSenderProxy.send_53791(0);
                        GameInstance.uiInstance.wanjiahuikuiPanel.onClose();
                     }
                  });
               }
               break;
            case GiftPanel.UI_GIFTPANEL_SHOW_LEIJIDENGLU_CLICK:
               if(this.nowShowPanel == GiftPanel.UI_GIFTPANEL_SHOW_LEIJIDENGLU_CLICK)
               {
                  return;
               }
               this.nowShowPanel = GiftPanel.UI_GIFTPANEL_SHOW_LEIJIDENGLU_CLICK;
               this.giftPanel.showLeijidengluCanvas();
               this.msgSenderProxy.send_56031();
               break;
            case GiftPanel.UI_GIFTPANEL_LEIJIDENGLU_CLICK:
               day = baseE.data as int;
               this.msgSenderProxy.send_56033(day);
               break;
            case GiftPanel.UI_RICHANGHUODONG_SHOW:
               if(this.nowShowPanel == GiftPanel.UI_RICHANGHUODONG_SHOW)
               {
                  return;
               }
               this.nowShowPanel = GiftPanel.UI_RICHANGHUODONG_SHOW;
               tab_type = baseE.data as int;
               this.msgSenderProxy.send_58551(tab_type);
               this.giftPanel.showRichanghuodongPanel();
               break;
            case GiftPanel.UI_JINGCAIFUBEN_SHOW:
               if(this.nowShowPanel == GiftPanel.UI_JINGCAIFUBEN_SHOW)
               {
                  return;
               }
               this.nowShowPanel = GiftPanel.UI_JINGCAIFUBEN_SHOW;
               tab_type = baseE.data as int;
               this.msgSenderProxy.send_58551(tab_type);
               this.giftPanel.showRichanghuodongPanel();
               break;
            case GiftPanel.UI_REXUEPK_SHOW:
               if(this.nowShowPanel == GiftPanel.UI_REXUEPK_SHOW)
               {
                  return;
               }
               this.nowShowPanel = GiftPanel.UI_REXUEPK_SHOW;
               tab_type = baseE.data as int;
               this.msgSenderProxy.send_58551(tab_type);
               this.giftPanel.showRichanghuodongPanel();
               break;
            case GiftPanel.UI_GIFTPANEL_ACTIVE_PAGE_BTN_CLICK:
               day = baseE.data as int;
               this.msgSenderProxy.send_58553([this.typeId,this.page,day]);
               break;
            case GiftPanel.UI_GUAJIWANCHENG_BTN_CLICK:
               gjArray = baseE.data as Array;
               this.msgSenderProxy.send_58555([gjArray[0],gjArray[1],gjArray[2]]);
               break;
            case GiftPanel.UI_LIJIWANCHENG_LINGQUJIANGLI_BTN_CLICK:
               ary = baseE.data as Array;
               this.msgSenderProxy.send_58557([ary[0],ary[1]]);
               break;
            case GiftPanel.UI_XINZENGGUAJILAN_BTN_CLICK:
               this.msgSenderProxy.send_58559();
               break;
            case GiftPanel.UI_YUENANHUODONGYOUHUA_CLICK:
               ty = baseE.data as int;
               this.YNopenPanel(ty);
               break;
            case YN2016XiaoFeiPanel.REQUEST_LINGQU:
               this.msgSenderProxy.send_81423();
               break;
            case YN2016WuShenzhanlianPanel.WUSHEN_LINGQU:
               this.msgSenderProxy.send_81525();
               break;
            case YN2016WuShenzhanlianPanel.WUSHEN_TIJIAO:
               this.msgSenderProxy.send_81523();
               break;
            case YN2016WuShenzhanlianPanel.WUSHEN_FANYE:
               this.msgSenderProxy.send_81521([baseE.data as int]);
               break;
            case YN2016HuoDongXiaoFeiPanel.HUODONGXIAOFEI_LINGQU:
               this.msgSenderProxy.send_81463(baseE.data as Object);
               break;
            case YN2016HuodongFanliPanel.HUODONGFANEL_LINGQU:
               this.msgSenderProxy.send_81753(baseE.data as Object);
               break;
            case YN2016ZhouqicailuPanel.LINGQUJIANGLI:
               this.msgSenderProxy.send_81633(int(baseE.data));
               break;
            case YN2016PaihangbangPanel.LINGQUJIANGLI:
               this.msgSenderProxy.send_81715();
               break;
            case YN2016PaihangbangPanel.TIJIAOWUPIN:
               this.msgSenderProxy.send_81713(int(baseE.data));
               break;
            case YN2016MengZhuZhuFuPanel.REQUEST_LINGQU:
               this.msgSenderProxy.send_53095(79);
               break;
            case YN2016QicaiPaihangbangPanel.TIJIAOWUPIN:
               this.msgSenderProxy.send_81743(int(baseE.data));
               break;
            case YN2016QicaiPaihangbangPanel.LINGQUJIANGLI:
               this.msgSenderProxy.send_81745();
               break;
            case YN2016FuqitongxinPaihangbangPanel.DUIHUANWUPIN:
               this.msgSenderProxy.send_81763(baseE.data as int);
               break;
            case YN2016FuqitongxinPaihangbangPanel.PAIHANGBANG:
               this.msgSenderProxy.send_81765();
               break;
            case YN2016FuqitongxinPaihangbangPanel.LINGQUJIANGLI:
               this.msgSenderProxy.send_81767();
               break;
            case YN2016LiupaijingjiPanel.TIJIAOWUPIN:
               this.msgSenderProxy.send_81823();
               break;
            case YN2016LiupaijingjiPanel.LINGQUJIANGLI:
               this.msgSenderProxy.send_81825();
               break;
            case YN2016YingbinzhouliPanel.LINGQUJIANGLI:
               this.msgSenderProxy.send_81843(baseE.data as int);
               break;
            case YN2016ZhenbaogePanel.ZHENBAOGEGOUMAI:
               this.msgSenderProxy.send_81893(baseE.data as int);
               break;
            case YN2017YouHuiZhouQiPanel.LINGQU:
               this.msgSenderProxy.send_82113(baseE.data as int);
               break;
            case YN2017OulePanel.TIJIAO:
               this.msgSenderProxy.send_82135();
               break;
            case YN2017OulePanel.LINGQU:
               this.msgSenderProxy.send_82133();
               break;
            case YN2017YingXiongMingChengPanel.LINGQUJIANGLI:
               this.msgSenderProxy.send_82143();
               break;
            case YN2017YingXiongMingChengPanel.DUIHUANWUPIN:
               this.msgSenderProxy.send_82145();
               break;
            case YN2017Meitianyouhui2Panel.MEITIANYOUHUI:
               this.msgSenderProxy.send_82203(baseE.data as int);
               break;
            case YN2017WudushengzhenPanel.WDSZ_LINGQU:
               this.msgSenderProxy.send_82209(baseE.data[0]);
               break;
            case YN2017Tengtianyu2Panel.WDSZ22_LINGQU:
               this.msgSenderProxy.send_82209(baseE.data[0]);
               break;
            case YN2017FeishengjingjiePanel.WDSZ22_LINGQU:
               this.msgSenderProxy.send_82209(baseE.data[0]);
               break;
            case YN2017ShouchongshijianPanel.SCSJ_LINGQU:
               this.msgSenderProxy.send_82303();
               break;
            case YN2017Tengtianyu3Panel.WDSZ23_LINGQU:
               this.msgSenderProxy.send_82209(baseE.data[0]);
               break;
            case YNV303Panel.V303_LINGQU:
               this.msgSenderProxy.send_82209(baseE.data[0]);
               break;
            case YN2017KaixueqiqiuPanel.QINGQIUKAIXUEQIQIULINGJIANG:
               this.msgSenderProxy.send_82385(baseE.data);
               break;
            case YN2017KaixueqiqiuPanel.QINGQIUKAIXUEQIQIUTIJIAO:
               this.msgSenderProxy.send_82383(baseE.data);
               break;
            case YN2017ZengsongnvrenPanel.ZENGSONGNVRENPAIHANGBANGJIANGLI:
               this.msgSenderProxy.send_82463(baseE.data);
               break;
            case YNHuazhuangdasaiPanel.HUAZHUANGDASAI_FANYE:
               this.msgSenderProxy.send_82483(baseE.data);
               break;
            case YNHuazhuangdasaiPanel.HUAZHUANGDASAI_TOUPIAO:
               this.msgSenderProxy.send_82485(baseE.data);
               break;
            case YNHuazhuangdasaiPanel.HUAZHUANGDASAI_CANYU:
               this.msgSenderProxy.send_82487();
               break;
            case YNHuazhuangdasaiPanel.HUAZHUANGDASAI_LINGJIANG:
               this.msgSenderProxy.send_82489();
               break;
            case YNHuazhuangdasaiPanel.HUAZHUANGDASAI_CHAKAN:
               this.msgSenderProxy.send_20107(baseE.data);
               break;
            case YNNeiligaishiPanel.NEILIGAISHI_LINGQU:
               this.msgSenderProxy.send_82523(baseE.data);
               break;
            case YNNeiligaishiPanel.NEILIGAISHI_TIJIAOWUPIN:
               this.msgSenderProxy.send_82525();
               break;
            case YNPeiyangdianfengshouPanel.PEIYANGDIANFENGSHOU_WEIYANG:
               this.msgSenderProxy.send_82613(baseE.data);
               break;
            case YNPeiyangdianfengshouPanel.PEIYANGDIANFENGSHOU_LINGQUJIANGLI:
               this.msgSenderProxy.send_82615(baseE.data);
               break;
            case ZhengDuoZhanPanel.ZHENGDUOZHAN_CLICK:
               this.msgSenderProxy.send_83043(baseE.data as int);
               break;
            case LieShouPaiHangPanel.MEIJIUPAIHANG_CLICK:
            case MeiJiuPaiHangPanel.MEIJIUPAIHANG_CLICK:
            case XingXingPaiHangPanel.MEIJIUPAIHANG_CLICK:
            case FuNvJiePaiHangPanel.MEIJIUPAIHANG_CLICK:
            case LieShouPaiHang2Panel.MEIJIUPAIHANG_CLICK:
               this.msgSenderProxy.send_83073(baseE.data as Array);
               break;
            case ShengJieDaHuiKuiPanel.SHENGJIEDAHUIKUI_RECEIVE:
               this.msgSenderProxy.send_83183(baseE.data as Array);
               break;
            case ShengJieDaHuiKuiPanel.SHENGJIEDAHUIKUI_REQUEST:
               this.msgSenderProxy.send_83181(baseE.data as int);
               break;
            case ShengJieDaHuiKuiPanel.SHENGJIEDAHUIKUI_LIBAO:
               this.msgSenderProxy.send_83185(baseE.data as Array);
               break;
            case ShengJieDaHuiKuiPanel.SHENGJIEDAHUIKUI_GONGFAJIHUO:
               this.msgSenderProxy.send_83187(baseE.data as int);
         }
      }
      
      private function setAvatar(param1:MonsterRes) : void
      {
         var apdArr:Array;
         var apd:AvatarParamData;
         var callBack:Function = null;
         var $mr:MonsterRes = param1;
         callBack = function(param1:*, param2:BitmapData):void
         {
            if(param1 != $mr.id_kind + "_" + avatar_zizeng)
            {
               return;
            }
            giftPanel.setAvatar(param2);
         };
         this.giftPanel.setAvatar(null);
         apdArr = [];
         apd = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,$mr.id_m));
         apdArr.push(apd);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($mr.id_kind + "_" + ++this.avatar_zizeng,callBack,apdArr,1,CharStatusType.STAND,0);
      }
      
      private function sendActiveMsg() : void
      {
         if(this.activeSelectedIndex == 0)
         {
            this.msgSenderProxy.send_40041(this.isALLActive);
            this.msgSenderProxy.send_40043(this.isALLActive);
         }
         if(this.activeSelectedIndex == 1)
         {
            this.msgSenderProxy.send_40043(this.isALLActive);
         }
         if(this.activeSelectedIndex == 2)
         {
            this.msgSenderProxy.send_40041(this.isALLActive);
         }
      }
      
      public function showLeijiDenglu(param1:Array) : void
      {
         this.giftPanel.showLeijidengluCanvas();
         this.giftPanel.setLeijidengluData(param1);
      }
      
      public function showLeijidengluTab(param1:int, param2:int) : void
      {
         if(param1 == 1)
         {
            this.giftPanel.showleijidengluTab(true,param2);
         }
         else
         {
            this.giftPanel.showleijidengluTab(false,param2);
         }
      }
      
      public function showHuodong(param1:Array) : void
      {
         this.giftPanel.setHuodong(param1);
      }
      
      public function setPageCount(param1:int, param2:int) : void
      {
         this.giftPanel.setPageCount(param1,param2);
      }
      
      public function setActiveHodong(param1:int, param2:String) : void
      {
         this.giftPanel.setActiveHodong(param1,param2);
      }
      
      public function setGuajiPanel(param1:int, param2:int, param3:Array) : void
      {
         this.giftPanel.setGuajiPanel(param1,param2,param3);
      }
      
      public function onShowLv(param1:Boolean) : void
      {
         this.giftPanel.onShowLv(param1);
      }
      
      public function addGuajilanNum(param1:int, param2:int) : void
      {
         this.giftPanel.addGuajilanNum(param1,param2);
      }
      
      public function setYNActiveHodong(param1:int, param2:String) : void
      {
         this.giftPanel.setYNyouhua(param1,param2);
      }
      
      private function YNopenPanel(param1:int) : void
      {
         var _loc2_:PartyFlagHelpPanel = null;
         switch(param1)
         {
            case 1:
               _loc2_ = new PartyFlagHelpPanel();
               _loc2_.$parent = GameInstance.uiInstance.bangqiInfoPanel;
               UIEventsRegisterManager.registerUI(_loc2_,PartyFlagHelpPanel);
               if(!Fun.isVisible(_loc2_))
               {
                  GameInstance.uiInstance.uiContainer.addChild(_loc2_);
                  _loc2_.x = (GameConfig.sceneWidth - _loc2_.width) / 2;
                  _loc2_.y = (GameConfig.sceneHeight - _loc2_.height) / 2;
               }
               break;
            case 2:
               if(!Fun.isVisible(GameInstance.uiInstance._bossRefurbishPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_BOSS_REFURBISH_PANEL);
               }
               GameInstance.uiInstance.bossRefurbishPanel.showJingjichang();
               break;
            case 3:
               MainCharSeachPathManager.mainCharWalk(SpecialNPCID.XIANG_YANG_CHENG_FANG_YU_SHI);
               break;
            case 4:
               if(!Fun.isVisible(GameInstance.uiInstance._bossRefurbishPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_BOSS_REFURBISH_PANEL);
               }
               GameInstance.uiInstance.bossRefurbishPanel.showKuafu();
               break;
            case 5:
               if(!Fun.isVisible(GameInstance.uiInstance._bossRefurbishPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_BIWUDAHUI_PANEL);
               }
               break;
            case 6:
               if(!Fun.isVisible(this.giftPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_GIFT_PLANE);
               }
               this.giftPanel.showBossXinxi();
               this.msgSenderProxy.send_40021();
               break;
            case 8:
               if(!Fun.isVisible(GameInstance.uiInstance._bossRefurbishPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_BOSS_REFURBISH_PANEL);
               }
               GameInstance.uiInstance.bossRefurbishPanel.showXiangYangZhanChang();
         }
      }
      
      public function setXiaoFei(param1:int, param2:int, param3:int, param4:int) : void
      {
         GameInstance.uiInstance.yn2016XiaoFeiPanel.showPanel(param1,param2,param3,param4);
      }
      
      public function setwushenzhanlian(param1:Object) : void
      {
         UITools.showPanel(GameInstance.uiInstance.yn2016WushenzhanlianPanel);
         GameInstance.uiInstance.yn2016WushenzhanlianPanel.setData(param1);
      }
      
      public function setjinqianshu(param1:Object) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.ynjinqianshuPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.ynjinqianshuPanel);
         }
         GameInstance.uiInstance.ynjinqianshuPanel.setdata(param1);
      }
      
      public function setkaixuepaihangbang(param1:Object) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.ynkaixuepaihangbangPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.ynkaixuepaihangbangPanel);
         }
         GameInstance.uiInstance.ynkaixuepaihangbangPanel.setdata(param1);
      }
      
      public function setqicaipaihangbang(param1:Object) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.ynqicaipaihangbangPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.ynqicaipaihangbangPanel);
         }
         GameInstance.uiInstance.ynqicaipaihangbangPanel.setdata(param1);
      }
      
      public function setHuoDongXiaoFeiData(param1:Object) : void
      {
         UITools.showPanel(GameInstance.uiInstance.yn2016HuoDongXiaoFeiPanel);
         GameInstance.uiInstance.yn2016HuoDongXiaoFeiPanel.setHuoDongXiaoFeiData(param1);
      }
      
      public function setHuoDongFanliData(param1:Object) : void
      {
         UITools.showPanel(GameInstance.uiInstance.yn2016HuoDongfanliPanel);
         GameInstance.uiInstance.yn2016HuoDongfanliPanel.setHuoDongFanliData(param1);
      }
      
      public function setFuqitongxinData(param1:Object) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.ynfuqitongxinPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.ynfuqitongxinPanel);
         }
      }
      
      public function setZhouqicailuPanel(param1:Object) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.yn2016ZhouqicailuPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.yn2016ZhouqicailuPanel);
         }
         GameInstance.uiInstance.yn2016ZhouqicailuPanel.setData(param1);
      }
      
      public function setfuqitongxinpaihangbang(param1:Object) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.ynfuqitongxinpaihangbangPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.ynfuqitongxinpaihangbangPanel);
         }
         GameInstance.uiInstance.ynfuqitongxinpaihangbangPanel.setdata(param1);
      }
      
      public function setliupaijingjiPanel(param1:Array) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.ynliupaijingjiPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.ynliupaijingjiPanel);
         }
         GameInstance.uiInstance.ynliupaijingjiPanel.setData(param1);
      }
      
      public function setyingbinzhouliPanel(param1:Array) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.ynyingbinzhouliPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.ynyingbinzhouliPanel);
         }
         GameInstance.uiInstance.ynyingbinzhouliPanel.setData(param1);
      }
      
      public function setZhenbaogePanel(param1:String, param2:int, param3:Array) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.ynzhenbaogePanel))
         {
            UITools.showPanel(GameInstance.uiInstance.ynzhenbaogePanel);
         }
         GameInstance.uiInstance.ynzhenbaogePanel.setData(param1,param2,param3);
      }
      
      public function setYouhuizhouqiPanel(param1:Object) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.youhuizhouqiPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.youhuizhouqiPanel);
         }
         GameInstance.uiInstance.youhuizhouqiPanel.setData(param1);
      }
      
      public function setOulePanel(param1:int, param2:int) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.oulePanel))
         {
            UITools.showPanel(GameInstance.uiInstance.oulePanel);
         }
         GameInstance.uiInstance.oulePanel.setData(param1,param2);
      }
      
      public function setyingxiongmingchengPanel(param1:Object) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.yingxiongmingchengPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.yingxiongmingchengPanel);
         }
         GameInstance.uiInstance.yingxiongmingchengPanel.setData(param1);
      }
      
      public function setDianfengzhouqiPanel(param1:int, param2:int) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.$dianfengzhouqiPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.$dianfengzhouqiPanel);
         }
         GameInstance.uiInstance.$dianfengzhouqiPanel.setTime(param1,param2);
      }
      
      public function setQingzhu0606Panel(param1:int) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.$qingzhuPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.$qingzhuPanel);
         }
         GameInstance.uiInstance.$qingzhuPanel.setTime(param1);
      }
      
      public function setShenfengPanel(param1:Object) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.$shenfengPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.$shenfengPanel);
         }
         GameInstance.uiInstance.$shenfengPanel.setupData(param1);
      }
      
      public function setWulinshendibaoPanel(param1:Object) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.$wulinshendibaoPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.$wulinshendibaoPanel);
         }
         GameInstance.uiInstance.$wulinshendibaoPanel.setupData(param1);
      }
      
      public function setChaoJiWuLinDaBaoPanel(param1:Object) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.chaoJiWuLinDaBaoPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.chaoJiWuLinDaBaoPanel);
         }
         GameInstance.uiInstance.chaoJiWuLinDaBaoPanel.setupData(param1);
      }
      
      public function setMeitianyouhui2Panel(param1:Object) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.$meitianyouhui2Panel))
         {
            UITools.showPanel(GameInstance.uiInstance.$meitianyouhui2Panel);
         }
         GameInstance.uiInstance.$meitianyouhui2Panel.setDataGoods(param1);
      }
      
      public function setTengtianyuPanel(param1:int) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.$tengtianyuPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.$tengtianyuPanel);
         }
         GameInstance.uiInstance.$tengtianyuPanel.setDataGoods(param1);
      }
      
      public function setHuodongPanel(param1:Object) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.$shengzhenPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.$shengzhenPanel);
         }
         GameInstance.uiInstance.$shengzhenPanel.setData(param1);
      }
      
      public function setHuodong2Panel(param1:Object) : void
      {
         if(param1.type == 5 || param1.type == 8 || param1.type == 14 || param1.type == 17)
         {
            if(!Fun.isVisible(GameInstance.uiInstance.$shengzhen2Panel))
            {
               UITools.showPanel(GameInstance.uiInstance.$shengzhen2Panel);
            }
            GameInstance.uiInstance.$shengzhen2Panel.setData(param1);
         }
         else
         {
            if(!Fun.isVisible(GameInstance.uiInstance.$shengzhen3Panel))
            {
               UITools.showPanel(GameInstance.uiInstance.$shengzhen3Panel);
            }
            GameInstance.uiInstance.$shengzhen3Panel.setData(param1);
         }
      }
      
      public function setLiuyuediPanel(param1:int, param2:int) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.$liuyuediPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.$liuyuediPanel);
         }
         GameInstance.uiInstance.$liuyuediPanel.setDataGoods(param1,param2);
      }
      
      public function setFeishengjingjiePanel(param1:Object) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.$feishengjingjiePanel))
         {
            UITools.showPanel(GameInstance.uiInstance.$feishengjingjiePanel);
         }
         GameInstance.uiInstance.$feishengjingjiePanel.setData(param1);
      }
      
      public function setShouchongshijianPanel(param1:Object) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.$shouchongshijianPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.$shouchongshijianPanel);
         }
         GameInstance.uiInstance.$shouchongshijianPanel.setData(param1);
      }
      
      public function setTonglefeishengjingjiePanel(param1:Array) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.$tonglefeishengjingjie))
         {
            UITools.showPanel(GameInstance.uiInstance.$tonglefeishengjingjie);
         }
         GameInstance.uiInstance.$tonglefeishengjingjie.setDataGoods(param1);
      }
      
      public function setV303Panel(param1:Object) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.$V303Panel))
         {
            UITools.showPanel(GameInstance.uiInstance.$V303Panel);
         }
         GameInstance.uiInstance.$V303Panel.setData(param1);
      }
      
      public function setHuangyingweixiPanel(param1:int, param2:int) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.$weixiPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.$weixiPanel);
         }
         GameInstance.uiInstance.$weixiPanel.setData(param1,param2);
      }
      
      public function setKaixueqiqiuPanel(param1:Object) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.$kaixueqiqiuPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.$kaixueqiqiuPanel);
         }
         GameInstance.uiInstance.$kaixueqiqiuPanel.setData(param1);
      }
      
      public function sethuozhenjiashiPanel(param1:Array) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.$huozhenjiashiPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.$huozhenjiashiPanel);
         }
         GameInstance.uiInstance.$huozhenjiashiPanel.setData(param1);
      }
      
      public function setwangzhehuodongPanel(param1:Array) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.$wangzhehuodongPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.$wangzhehuodongPanel);
         }
         GameInstance.uiInstance.$wangzhehuodongPanel.setDataGoods(param1);
      }
      
      public function set10yueyouhuizhouqiPanel(param1:Array) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.$10yueyouhuiPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.$10yueyouhuiPanel);
         }
         GameInstance.uiInstance.$10yueyouhuiPanel.setDataGoods(param1);
      }
      
      public function setZengsongnvrenPanel(param1:Object) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.$zengsongnvrenPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.$zengsongnvrenPanel);
         }
         GameInstance.uiInstance.$zengsongnvrenPanel.setData(param1);
      }
      
      public function setHuazhuangdasaiPanel(param1:Object) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.$huazhuangdasaiPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.$huazhuangdasaiPanel);
         }
         GameInstance.uiInstance.$huazhuangdasaiPanel.setData(param1);
      }
      
      public function setHuazhuangdasaiList(param1:Array, param2:int) : void
      {
         GameInstance.uiInstance.$huazhuangdasaiPanel.setListData(param1,param2);
      }
      
      public function setGanenliunianLeijizhi(param1:int) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.$ganenliunianPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.$ganenliunianPanel);
         }
         GameInstance.uiInstance.$ganenliunianPanel.setNum(param1);
      }
      
      public function setNeiligaishiPanel(param1:Object) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.$neiligaishiPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.$neiligaishiPanel);
         }
         GameInstance.uiInstance.$neiligaishiPanel.setData(param1);
      }
      
      public function setXiaXueEef() : void
      {
         HighEffectManager.xiaxue_start(60);
      }
      
      public function setDianfengshouPanel(param1:Array) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.$peiyangdianfengshouPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.$peiyangdianfengshouPanel);
         }
         GameInstance.uiInstance.$peiyangdianfengshouPanel.setData(param1);
      }
      
      public function setBanBenYouHuiData(param1:int, param2:Array) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.banBenYouHui))
         {
            UITools.showPanel(GameInstance.uiInstance.banBenYouHui);
         }
         GameInstance.uiInstance.banBenYouHui.setDataGoods(param1,param2);
      }
      
      public function setShuiGuoLeiJiPanel(param1:int) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.shuiGuoLeiJiPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.shuiGuoLeiJiPanel);
         }
         GameInstance.uiInstance.shuiGuoLeiJiPanel.setNum(param1);
      }
      
      public function setZhiZunZhengDuoData(param1:Object) : void
      {
         GameInstance.uiInstance.zhiZunZhengDuoZhanPanel.setZhiZunZhengDuoData(param1);
      }
      
      public function setZhengDuoZhanData(param1:Object) : void
      {
         GameInstance.uiInstance.zhengDuoZhanPanel.setZhengDuoZhanData(param1);
         UITools.showPanel(GameInstance.uiInstance.zhengDuoZhanPanel);
      }
      
      public function setMeiJiuPaiHangData(param1:Object) : void
      {
         GameInstance.uiInstance.meiJiuPaiHangPanel.setMeiJiuPaiHangData(param1);
         UITools.showPanel(GameInstance.uiInstance.meiJiuPaiHangPanel);
      }
      
      public function setXingXingPaiHangData(param1:Object) : void
      {
         GameInstance.uiInstance.xingXingPaiHangPanel.setMeiJiuPaiHangData(param1);
         UITools.showPanel(GameInstance.uiInstance.xingXingPaiHangPanel);
      }
      
      public function setLieShouPaiHangData(param1:Object) : void
      {
         GameInstance.uiInstance.lieShouPaiHangPanel.setMeiJiuPaiHangData(param1);
         UITools.showPanel(GameInstance.uiInstance.lieShouPaiHangPanel);
      }
      
      public function setFuNvJiePaiHangData(param1:Object) : void
      {
         GameInstance.uiInstance.fuNvJiePaiHang.setMeiJiuPaiHangData(param1);
         UITools.showPanel(GameInstance.uiInstance.fuNvJiePaiHang);
      }
      
      public function setLieShouPaiHang2Data(param1:Object) : void
      {
         GameInstance.uiInstance.lieShouPaiHang2Panel.setMeiJiuPaiHangData(param1);
         UITools.showPanel(GameInstance.uiInstance.lieShouPaiHang2Panel);
      }
      
      public function setFangYanHuaData(param1:int) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.ynfangyanhuaPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.ynfangyanhuaPanel);
         }
         GameInstance.uiInstance.ynfangyanhuaPanel.setFangYanHuaData(param1);
      }
      
      public function setZhouyikuaileData(param1:int) : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._zhouyikuailePanel))
         {
            GameInstance.uiInstance.zhouyikuailePanel.setNum(param1);
         }
      }
      
      public function setZhoumorenaoData(param1:int) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.zhoumorenaoPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.zhoumorenaoPanel);
         }
         GameInstance.uiInstance.zhoumorenaoPanel.setNum(param1);
      }
      
      public function setteshuleijiData(param1:int, param2:int, param3:int = 0) : void
      {
         if(param1 == 1)
         {
            if(Fun.isVisible(GameInstance.uiInstance._teShuLeiJi))
            {
               GameInstance.uiInstance.teShuLeiJi.setNum(param2);
            }
         }
         else if(param1 == 2)
         {
            if(Fun.isVisible(GameInstance.uiInstance._shengDanLeiJi))
            {
               GameInstance.uiInstance.shengDanLeiJi.setNum(param2);
            }
         }
         else if(param1 == 3)
         {
            if(Fun.isVisible(GameInstance.uiInstance._shengDanHuoDong))
            {
               GameInstance.uiInstance.shengDanHuoDong.setNum(param2);
            }
         }
         else if(param1 == 4)
         {
            if(Fun.isVisible(GameInstance.uiInstance._shengDanKuaiLe))
            {
               GameInstance.uiInstance.shengDanKuaiLe.setNum(param2);
            }
         }
         else if(param1 == 5)
         {
            if(Fun.isVisible(GameInstance.uiInstance._xingZhuXinNian))
            {
               GameInstance.uiInstance.xingZhuXinNian.setNum(param2);
            }
         }
         else if(param1 == 6 || param1 == 7 || param1 == 9 || param1 == 33)
         {
            if(Fun.isVisible(GameInstance.uiInstance._liangTianLeiJi))
            {
               GameInstance.uiInstance.liangTianLeiJi.setNum(param2);
            }
         }
         else if(param1 == 8)
         {
            if(Fun.isVisible(GameInstance.uiInstance._qiTianLeiJi))
            {
               GameInstance.uiInstance.qiTianLeiJi.setNum(param2);
            }
         }
         else if(param1 == 10)
         {
            if(Fun.isVisible(GameInstance.uiInstance._xinShouLeiJiPanel))
            {
               GameInstance.uiInstance.xinShouLeiJiPanel.setNum(param2);
            }
         }
         else if(param1 == 11)
         {
            if(Fun.isVisible(GameInstance.uiInstance._chunTianLeiJiPanel))
            {
               GameInstance.uiInstance.chunTianLeiJiPanel.setNum(param2);
            }
         }
         else if(param1 == 12)
         {
            if(Fun.isVisible(GameInstance.uiInstance._qingRenJie2019Panel))
            {
               GameInstance.uiInstance.qingRenJie2019Panel.setNum(param2);
            }
         }
         else if(param1 == 13)
         {
            if(Fun.isVisible(GameInstance.uiInstance._yiTianLeiJiPanel))
            {
               GameInstance.uiInstance.yiTianLeiJiPanel.setNum(param2);
            }
         }
         else if(param1 == 14)
         {
            if(Fun.isVisible(GameInstance.uiInstance._fuNvJieHeLi))
            {
               GameInstance.uiInstance.fuNvJieHeLi.setNum(param2);
            }
         }
         else if(param1 == 15)
         {
            if(Fun.isVisible(GameInstance.uiInstance._baiSeQingRenJiePanel))
            {
               GameInstance.uiInstance.baiSeQingRenJiePanel.setNum(param2);
            }
         }
         else if(param1 == 16)
         {
            if(Fun.isVisible(GameInstance.uiInstance._yuRenJie2019Panel))
            {
            }
         }
         else if(param1 == 17)
         {
            if(Fun.isVisible(GameInstance.uiInstance._hanShiJie2019Panel))
            {
               GameInstance.uiInstance.hanShiJie2019Panel.setNum(param2);
            }
         }
         else if(param1 == 18)
         {
            if(Fun.isVisible(GameInstance.uiInstance._shuanglongzhanPanel))
            {
               GameInstance.uiInstance.$shuanglongzhanPanel.setNum(param2);
            }
         }
         else if(param1 == 19 || param1 == 34)
         {
            if(Fun.isVisible(GameInstance.uiInstance._zhiZunShenBaoPanel))
            {
               GameInstance.uiInstance.zhiZunShenBaoPanel.setNum(param2);
            }
         }
         else if(param1 == 21)
         {
            if(Fun.isVisible(GameInstance.uiInstance._yingJieDaLiPanel))
            {
               GameInstance.uiInstance.yingJieDaLiPanel.setNum(param2);
            }
         }
         else if(param1 == 22)
         {
            if(Fun.isVisible(GameInstance.uiInstance._erTongJiePanel))
            {
               GameInstance.uiInstance._erTongJiePanel.setNum(param2);
            }
         }
         else if(param1 == 23)
         {
            if(Fun.isVisible(GameInstance.uiInstance._yingJieDuanWu2018Panel))
            {
               GameInstance.uiInstance.yingJieDuanWu2018Panel.setNum(param2);
            }
         }
         else if(param1 != 24)
         {
            if(param1 == 25 || param1 == 26 || param1 == 27 || param1 == 35 || param1 == 36 || param1 == 37)
            {
               if(Fun.isVisible(GameInstance.uiInstance._shuangquan))
               {
                  GameInstance.uiInstance.shuangquan.setNum(param2);
               }
            }
            else if(param1 == 28 || param1 == 29)
            {
               if(Fun.isVisible(GameInstance.uiInstance._teBieHuoDong))
               {
                  GameInstance.uiInstance.teBieHuoDong.setNum(param2);
               }
            }
            else if(param1 == 30)
            {
               if(Fun.isVisible(GameInstance.uiInstance._bayueyouhui2019))
               {
                  GameInstance.uiInstance.bayueyouhui2019.setNum(param2);
               }
            }
            else if(param1 != 31)
            {
               if(param1 == 32)
               {
                  if(Fun.isVisible(GameInstance.uiInstance._zhongqiushangyue))
                  {
                     GameInstance.uiInstance.zhongqiushangyue.setNum(param2);
                  }
               }
               else if(param1 == 38)
               {
                  if(Fun.isVisible(GameInstance.uiInstance._shiwutianyouhui))
                  {
                     GameInstance.uiInstance.shiwutianyouhui.setNum(param2);
                  }
               }
               else if(param1 == 39)
               {
                  if(Fun.isVisible(GameInstance.uiInstance._yuenanfunvjie))
                  {
                     GameInstance.uiInstance.yuenanfunvjie.setNum(param2);
                  }
               }
               else if(param1 == 40)
               {
                  if(Fun.isVisible(GameInstance.uiInstance._huodong1120Panel))
                  {
                     GameInstance.uiInstance.huodong1120Panel.setNum(param2);
                  }
               }
               else if(param1 == 41)
               {
                  if(Fun.isVisible(GameInstance.uiInstance._daZheKouPanel))
                  {
                     GameInstance.uiInstance.daZheKouPanel.setNum(param2);
                  }
               }
               else if(param1 == 42 || param1 == 48)
               {
                  if(Fun.isVisible(GameInstance.uiInstance._jingYingLeiJiPanel))
                  {
                     GameInstance.uiInstance.jingYingLeiJiPanel.setNum(param2);
                  }
                  if(Fun.isVisible(GameInstance.uiInstance._shuang12Panel))
                  {
                     GameInstance.uiInstance.shuang12Panel.setNum(param2);
                  }
               }
               else if(param1 == 43)
               {
                  if(Fun.isVisible(GameInstance.uiInstance._shenDanJie2019Panel))
                  {
                     GameInstance.uiInstance.shenDanJie2019Panel.setNum(param2);
                  }
               }
               else if(param1 == 44)
               {
                  if(Fun.isVisible(GameInstance.uiInstance._nianDi2019Panel))
                  {
                     GameInstance.uiInstance.nianDi2019Panel.setNum(param2);
                  }
               }
               else if(param1 == 45)
               {
                  if(Fun.isVisible(GameInstance.uiInstance._xiaonianjiePanel))
                  {
                     GameInstance.uiInstance.xiaonianjiePanel.setNum(param2);
                  }
               }
               else if(param1 == 46)
               {
                  if(Fun.isVisible(GameInstance.uiInstance._chuntuanyuanPanel))
                  {
                     GameInstance.uiInstance.chuntuanyuanPanel.setNum(param2);
                  }
               }
               else if(param1 == 47)
               {
                  if(Fun.isVisible(GameInstance.uiInstance._xinchunyinglu))
                  {
                     GameInstance.uiInstance.xinchunyinglu.setNum(param2);
                  }
               }
               else if(param1 == 49)
               {
                  if(Fun.isVisible(GameInstance.uiInstance._yuanxiaojie2019))
                  {
                     GameInstance.uiInstance.yuanxiaojie2019.setNum(param2);
                  }
               }
               else if(param1 == 50)
               {
                  if(Fun.isVisible(GameInstance.uiInstance._qingrenjie2020))
                  {
                     GameInstance.uiInstance.qingrenjie2020.setNum(param2);
                  }
               }
               else if(param1 == 51)
               {
                  if(Fun.isVisible(GameInstance.uiInstance._sanbajie2020))
                  {
                     GameInstance.uiInstance.sanbajie2020.setNum(param2);
                  }
               }
               else if(param1 == 52)
               {
                  if(Fun.isVisible(GameInstance.uiInstance._baise2020))
                  {
                     GameInstance.uiInstance.baise2020.setNum(param2);
                  }
               }
               else if(param1 == 53)
               {
                  if(Fun.isVisible(GameInstance.uiInstance._xiongwang2020))
                  {
                     GameInstance.uiInstance.xiongwang2020.setNum(param2);
                  }
               }
               else if(param1 == 54)
               {
                  if(Fun.isVisible(GameInstance.uiInstance.guangrongdariPanel))
                  {
                     GameInstance.uiInstance.guangrongdariPanel.setNum(param2);
                  }
               }
               else if(param1 == 55)
               {
                  if(Fun.isVisible(GameInstance.uiInstance.leijizhengxiongPanel))
                  {
                     GameInstance.uiInstance.leijizhengxiongPanel.setNum(param2);
                  }
               }
               else if(param1 == 56)
               {
                  if(Fun.isVisible(GameInstance.uiInstance.duanwusanwangPanel))
                  {
                     GameInstance.uiInstance.duanwusanwangPanel.setNum(param2);
                  }
               }
               else if(param1 == 57 || param1 == 66)
               {
                  if(Fun.isVisible(GameInstance.uiInstance.diwanglihePanel))
                  {
                     GameInstance.uiInstance.diwanglihePanel.setNum(param2);
                  }
                  if(Fun.isVisible(GameInstance.uiInstance.diwanglihe2Panel))
                  {
                     GameInstance.uiInstance.diwanglihe2Panel.setNum(param2);
                  }
               }
               else if(param1 == 58 || param1 == 60)
               {
                  if(Fun.isVisible(GameInstance.uiInstance.xinshouqizhen1Panel))
                  {
                     GameInstance.uiInstance.xinshouqizhen1Panel.setNum(param2);
                  }
                  if(Fun.isVisible(GameInstance.uiInstance.xinshouqizhen3Panel))
                  {
                     GameInstance.uiInstance.xinshouqizhen3Panel.setNum(param2);
                  }
               }
               else if(param1 == 59 || param1 == 61)
               {
                  if(Fun.isVisible(GameInstance.uiInstance.xinshouqizhen2Panel))
                  {
                     GameInstance.uiInstance.xinshouqizhen2Panel.setNum(param2);
                  }
                  if(Fun.isVisible(GameInstance.uiInstance.xinshouqizhen4Panel))
                  {
                     GameInstance.uiInstance.xinshouqizhen4Panel.setNum(param2);
                  }
               }
               else if(param1 == 62)
               {
                  if(Fun.isVisible(GameInstance.uiInstance.zhongqiuwanluPanel))
                  {
                     GameInstance.uiInstance.zhongqiuwanluPanel.setNum(param2);
                  }
               }
               else if(param1 == 63)
               {
                  if(Fun.isVisible(GameInstance.uiInstance.xinniandajiPanel))
                  {
                     GameInstance.uiInstance.xinniandajiPanel.setNum(param2);
                  }
               }
               else if(param1 == 64)
               {
                  if(Fun.isVisible(GameInstance.uiInstance.wanshiruyiPanel))
                  {
                     GameInstance.uiInstance.wanshiruyiPanel.setNum(param2);
                  }
               }
               else if(param1 == 65)
               {
                  if(Fun.isVisible(GameInstance.uiInstance.ankangxingwangPanel))
                  {
                     GameInstance.uiInstance.ankangxingwangPanel.setNum(param2);
                  }
               }
               else if(param1 == 67)
               {
                  if(Fun.isVisible(GameInstance.uiInstance.tebieleichong2022Panel))
                  {
                     GameInstance.uiInstance.tebieleichong2022Panel.setNum(param2);
                  }
               }
               else if(param1 == 68 || param1 == 70)
               {
                  if(Fun.isVisible(GameInstance.uiInstance.lianXuLeiChongPanel))
                  {
                     GameInstance.uiInstance.lianXuLeiChongPanel.setLeiChongTianShu(param2);
                  }
               }
               else if(param1 == 69 || param1 == 71)
               {
                  if(Fun.isVisible(GameInstance.uiInstance.tianJiangBaoXiangPanel))
                  {
                     GameInstance.uiInstance.tianJiangBaoXiangPanel.setNum(param2);
                  }
               }
               else if(param1 == 72)
               {
                  if(Fun.isVisible(GameInstance.uiInstance.xinShangXianPanel))
                  {
                     GameInstance.uiInstance.xinShangXianPanel.setNum(param2);
                  }
               }
               else if(param1 == 73)
               {
                  if(Fun.isVisible(GameInstance.uiInstance.shiErZhouNianQingZhuPanel))
                  {
                  }
               }
               else if(param1 == 74)
               {
                  if(Fun.isVisible(GameInstance.uiInstance.zongLeiJiPanel))
                  {
                     GameInstance.uiInstance.zongLeiJiPanel.setNum(param2);
                  }
               }
               else if(param1 == 75)
               {
                  if(Fun.isVisible(GameInstance.uiInstance.liDongLeiJiPanel))
                  {
                     GameInstance.uiInstance.liDongLeiJiPanel.setNum(param2);
                  }
               }
               else if(param1 == 76)
               {
                  if(Fun.isVisible(GameInstance.uiInstance.dengLuLingJiangPanel))
                  {
                     GameInstance.uiInstance.dengLuLingJiangPanel.setNum(param2);
                  }
               }
               else if(param1 == 77)
               {
                  if(Fun.isVisible(GameInstance.uiInstance.xueRenBaoZangPanel))
                  {
                     GameInstance.uiInstance.xueRenBaoZangPanel.setNum(param2,param3);
                  }
               }
               else if(param1 == 78)
               {
                  if(Fun.isVisible(GameInstance.uiInstance.youHui2888Panel))
                  {
                     GameInstance.uiInstance.youHui2888Panel.setNum(param2);
                  }
               }
               else if(param1 == 79)
               {
                  if(Fun.isVisible(GameInstance.uiInstance.teBieShangDianPanel))
                  {
                     GameInstance.uiInstance.teBieShangDianPanel.setNum(param2);
                  }
               }
               else if(param1 == 81)
               {
                  if(Fun.isVisible(GameInstance.uiInstance.meiriyouhguiPanel))
                  {
                     GameInstance.uiInstance.meiriyouhguiPanel.setNum(param2);
                  }
               }
               else if(param1 >= 82 && param1 < 96)
               {
                  if(Fun.isVisible(GameInstance.uiInstance.zhenPinZhiMengPanel))
                  {
                     GameInstance.uiInstance.zhenPinZhiMengPanel.setNum(param2);
                  }
               }
            }
         }
      }
      
      public function setShengJieDaHuiKuiData(param1:Object) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.shengjifuliPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.shengjifuliPanel);
         }
         GameInstance.uiInstance.shengjifuliPanel.setShengJieDaHuiKuiData(param1);
      }
      
      public function setShengJieDaHuiKuiIsActive(param1:Object) : void
      {
         GameInstance.uiInstance.shengjifuliPanel.setShengJieDaHuiKuiIsActive(param1);
      }
      
      public function setLiDongJie2023(param1:Array) : void
      {
         GameInstance.uiInstance.liDongJiePanel.setNum(param1);
      }
   }
}

