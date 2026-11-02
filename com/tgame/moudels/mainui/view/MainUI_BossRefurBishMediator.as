package com.tgame.moudels.mainui.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.mount.MountRes;
   import com.tgame.common.res.mount.MountResManager;
   import com.tgame.common.staticdata.HeadResChange;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.staticdata.SpecialNPCID;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.vo.character.PurePlayer;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.character.info.AvatarInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.AvatarManager;
   import com.tgame.manager.ExchangePositionManager;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.mainui.MainUI_ApplicationFacade;
   import com.tgame.moudels.mainui.model.MainUI_MsgSendProxy;
   import com.tgame.shell.view.components.BiwuCrossPlatform_Panel;
   import com.tgame.shell.view.components.KuaFuZhanChangPanel;
   import com.tgame.shell.view.components.conquerPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.timer.vo.TimerData;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import com.zcp.manager.TimerManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class MainUI_BossRefurBishMediator extends Mediator
   {
      
      public static const NAME:String = "MainUI_BossRefurBishMediator";
      
      private var avatar_zizeng:int = 0;
      
      private var loaderBuff:LoadBuffer;
      
      private var kuaFuDataArr:Array;
      
      private var listSelectID:int = 0;
      
      private var char_avatar_zizeng:int = 0;
      
      private var char_avatar_zizeng_3v3:int = 0;
      
      private var mount_avatar_zizeng:int = 0;
      
      private var nowPanel:String = "";
      
      private var nowPageNum:int = 1;
      
      private var nowPageNum_History:int = 1;
      
      private var maxPageNum:int = 1;
      
      private var maxPageNum_History:int = 1;
      
      private var tempPlayerID:int;
      
      private var addedToStageFun:Function;
      
      private var selectedZhuWeiArr:Array;
      
      private var showingListArr:Array = [];
      
      private var isZhuWeiBtnClick:Boolean = true;
      
      private var _querenBaomingTime:TimerData;
      
      private var _querenCount:int;
      
      private var nowPageOfFuQi:Number;
      
      private var maxPageOfFuQi:Number;
      
      private var _msgSenderProxy:MainUI_MsgSendProxy;
      
      private var char_avatar_zizengFuQi:int = 0;
      
      public function MainUI_BossRefurBishMediator()
      {
         super(NAME);
      }
      
      protected function get bossRefurbishPlane() : conquerPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.bossRefurbishPanel);
         }
         return viewComponent as conquerPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [MainUI_ApplicationFacade.KUA_FU_RANK_DATA_RECEIVED,MainUI_ApplicationFacade.RANK_CHONGBAI_BISHI_DATA,MainUI_ApplicationFacade.NPC_REQ_FUNCTION,MainUI_ApplicationFacade.BIWUDAHU_ZHUWEI,MainUI_ApplicationFacade.UPDATE_BAOSHI_TIME,MainUI_ApplicationFacade.LIKAI_KUAFU_LEITAI,MainUI_ApplicationFacade.YINCHANG_ZHAN,MainUI_ApplicationFacade.SHOW_BIWUDAHUI_PANEL,MainUI_ApplicationFacade.YN_YUENANHUODONGYOUHUA_CLICK];
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case MainUI_ApplicationFacade.KUA_FU_RANK_DATA_RECEIVED:
               _loc3_ = _loc2_ as Array;
               _loc4_ = int(_loc3_[2]);
               this.setPlayerEquipOrRide(_loc3_[0],_loc3_[1],_loc3_[2]);
               break;
            case MainUI_ApplicationFacade.RANK_CHONGBAI_BISHI_DATA:
               _loc3_ = _loc2_ as Array;
               if(_loc3_[0] >= 0 && _loc3_[1] >= 0 && this.tempPlayerID == this.listSelectID)
               {
                  this.bossRefurbishPlane.setCongBaiAndBiShi(_loc3_[0],_loc3_[1]);
               }
               break;
            case MainUI_ApplicationFacade.NPC_REQ_FUNCTION:
               _loc5_ = Number(_loc2_);
               if(_loc5_ == NpcFunctionType.BIWUDAHUI_BAOMING)
               {
                  this.msgSenderProxy.send_53865();
               }
               if(_loc5_ == NpcFunctionType.BIWUDAHUI_SHUOMING)
               {
                  if(Fun.isVisible(GameInstance.uiInstance._bossRefurbishPanel))
                  {
                     this.bossRefurbishPlane.dispatchEvent(new BaseEvent(conquerPanel.UI_BIWUDAHUI_SHOW));
                     return;
                  }
                  this.addedToStageFun = this.showBiWuDaHui;
                  PipeManager.sendMsg(PipeConstants.SHOW_BOSS_REFURBISH_PANEL);
               }
               if(_loc5_ == NpcFunctionType.XIANGYANGZHANCHANG_SHUOMING)
               {
                  this.bossRefurbishPlane.showXiangYangGuiZe();
               }
               if(_loc5_ == NpcFunctionType.JOIN_KUAFU_ZHANCHANG_BY_NPC)
               {
                  this.msgSenderProxy.send_51961();
               }
               break;
            case MainUI_ApplicationFacade.BIWUDAHU_ZHUWEI:
               _loc3_ = _loc2_ as Array;
               this.isZhuWeiBtnClick = false;
               this.msgSenderProxy.send_53855([_loc3_[1],_loc3_[0]]);
               break;
            case MainUI_ApplicationFacade.UPDATE_BAOSHI_TIME:
               GameInstance.uiInstance.mainUI.updateBaoShiJianShangTimer(_loc2_.timer);
               break;
            case MainUI_ApplicationFacade.LIKAI_KUAFU_LEITAI:
               this.msgSenderProxy.send_53871();
               break;
            case MainUI_ApplicationFacade.YINCHANG_ZHAN:
               if(_loc2_ as Boolean == true)
               {
                  GameInstance.uiInstance.mainUI.hideZhan();
               }
               break;
            case MainUI_ApplicationFacade.SHOW_BIWUDAHUI_PANEL:
               this.listSelectID = 0;
               this.selectedZhuWeiArr = null;
               this.showBiWuDaHui();
               break;
            case MainUI_ApplicationFacade.YN_YUENANHUODONGYOUHUA_CLICK:
               if(int(_loc2_) == 2)
               {
                  this.msgSenderProxy.send_40033({
                     "id":1,
                     "str":""
                  });
               }
         }
      }
      
      public function bossRefurBishTianXiaNo1(param1:Array) : void
      {
         this.kuaFuDataArr = param1;
         if(this.listSelectID == 0 && param1.length > 0)
         {
            this.listSelectID = param1[0].id;
            PipeManager.sendMsg(PipeConstants.KUA_FU_RANK_DATA_SEND,{
               "id":this.listSelectID,
               "index":OtherConst.RANK_KUAFU_ID,
               "qufu":param1[0].qufu
            });
         }
         this.bossRefurbishPlane.setKuafuInitialize(param1);
         this.removeLoaderBuff();
      }
      
      public function bossRefurBishMyStatus(param1:int, param2:int) : void
      {
         this.bossRefurbishPlane.setShangbang(param1,param2,param2 > 0 ? true : false);
      }
      
      public function bossRefurBish3v3(param1:int, param2:int, param3:Array) : void
      {
         this.maxPageNum = param1;
         var _loc4_:XML = <list></list>;
         var _loc5_:Boolean = this.nowPageNum == 1 ? true : false;
         var _loc6_:Boolean = this.nowPageNum == this.maxPageNum ? true : false;
         var _loc7_:String = param2 == 0 ? LanResManager.getLanCommonTextWords("未上榜") : "" + param2;
         var _loc8_:int = 0;
         while(_loc8_ < param3.length)
         {
            _loc4_.appendChild(<node label={param3[_loc8_][0]} NO={param3[_loc8_][4]} player={param3[_loc8_][1]} count={param3[_loc8_][2]} mountID={param3[_loc8_][3]}/>);
            _loc8_++;
         }
         var _loc9_:Boolean = this.nowPageNum == 1 ? true : false;
         this.bossRefurbishPlane.setTitle(_loc9_,LanResManager.getLanCommonTextWords("姓名"),LanResManager.getLanCommonTextWords("本周曾获论剑声望本周曾获论剑声望"));
         this.bossRefurbishPlane.setList(_loc4_,_loc7_,this.nowPageNum,this.maxPageNum,_loc5_,_loc6_);
         if(param3.length == 0)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("暂无数据"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("暂无数据"),false);
            this.bossRefurbishPlane.setJingjiClear();
            this.removeLoaderBuff();
            return;
         }
         this.listSelectID = param3[0][0];
         this.removeLoaderBuff();
      }
      
      public function bossRefurBishMyStatus3v3(param1:int, param2:int) : void
      {
         this.bossRefurbishPlane.setJianJiShangbang(param1,param2,param2 > 0 ? true : false);
      }
      
      public function setBiWuDaHuiList32(param1:Object) : void
      {
         this.maxPageNum = param1.count;
         this.bossRefurbishPlane.setPageList(this.nowPageNum,this.maxPageNum,this.nowPageNum == 1 ? true : false,this.maxPageNum == this.nowPageNum ? true : false);
         this.showingListArr = [];
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < param1.r.length)
         {
            this.showingListArr[this.showingListArr.length] = param1.r[_loc3_].id;
            if(Boolean(this.selectedZhuWeiArr) && param1.r[_loc3_].id == this.selectedZhuWeiArr[0])
            {
               _loc2_ = _loc3_;
            }
            _loc3_++;
         }
         this.bossRefurbishPlane.setShangbangs(param1.shangbang == 0 ? false : true,param1.lingjiang == 0 ? false : true);
         if(Boolean(this.selectedZhuWeiArr) && this.isZhuWeiBtnClick)
         {
            this.bossRefurbishPlane.setInitialize(param1.r,_loc2_);
            PipeManager.sendMsg(PipeConstants.KUA_FU_RANK_DATA_SEND,{
               "id":this.selectedZhuWeiArr[0],
               "index":OtherConst.RANK_KUAFU_BIWUDAHUI,
               "qufu":this.selectedZhuWeiArr[1]
            });
         }
         else
         {
            this.bossRefurbishPlane.setInitialize(param1.r,0);
            PipeManager.sendMsg(PipeConstants.KUA_FU_RANK_DATA_SEND,{
               "id":param1.r[0].id,
               "index":OtherConst.RANK_KUAFU_BIWUDAHUI,
               "qufu":param1.r[0].qufu
            });
         }
      }
      
      public function setData(param1:String) : void
      {
         this.bossRefurbishPlane.setTime(param1);
      }
      
      public function setBiWuDaHuiZhuWeiComplete(param1:int, param2:String, param3:int) : void
      {
         if(this.showingListArr.indexOf(param3) == -1 || !Fun.isVisible(GameInstance.uiInstance._bossRefurbishPanel))
         {
            return;
         }
         this.selectedZhuWeiArr = [param3,param2];
         this.msgSenderProxy.send_53851(this.nowPageNum);
      }
      
      public function setBiWuDaHuiGiftComplete(param1:int) : void
      {
      }
      
      public function setShowButton(param1:int) : void
      {
         GameInstance.uiInstance.mainUI.isShowBiwuDahui(param1);
      }
      
      public function gameEnd(param1:String) : void
      {
         var name:String = param1;
         FAlert.okLabel = LanResManager.getLanCommonTextWords("传回原服");
         FAlert.cancelLabel = LanResManager.getLanCommonTextWords("关闭面板");
         FAlert.show(LanResManager.getLanCommonTextWords("比赛结束，恭喜") + name + LanResManager.getLanCommonTextWords("晋级！"),"",2,function(param1:FAlertEvent):void
         {
            if(param1.eventData == FAlert.OK)
            {
               msgSenderProxy.send_53871();
            }
         });
      }
      
      public function setShowBaoShiJianShangInfo(param1:int, param2:int = 0, param3:int = 0) : void
      {
         GameInstance.uiInstance.mainUI.isShowBaoShiJianShangInfo(param1,param2,param3);
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(conquerPanel,function():void
         {
            bossRefurbishPlane.addEventListener(Event.ADDED_TO_STAGE,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_SHOW,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_BAOGUOYUSHOUYI,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_LINGQUJIANGLI_ID,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_LIST_ID,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_SHENGWANGSHANGDIAN,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_LUNJIANTAI,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_CONQUERPANEL_3V3JINGJICHANG_SHOW,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_CONQUERPANEL_3V3JINGJICHANG_SHOW,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_JINGJIPANEL_lINGQUJIAGNLI_BTN_CLICK,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_JINGJIPANEL_LIST_GET_PAGE,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_JINGJIPANEL_JINGJIGUIZECHAXUN_BTN_CLICK,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_JINGJIPANEL_SHENGWANGSHANGDIANGOUWU_BTN_CLICK,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_JINGJIPANEL_LIST_GET_PAGE,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_JINGJIPANEL_LIST_MUTUAL,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_JINGJIPANEL_PARTICULAR_INFO_SHOW,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_BIWUDAHUI_SHOW,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_BIWUDAHUI_BAOGUOSHOUYIQUHUI_BTN_CLICK,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_BIWUDAHUI_CHUANRU,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_BIWUDAHUI_DUIJUELIUCHENGTU_BTN_CLICK,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_BIWUDAHUI_GUIZECHAXUN_BTN_CLICK,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_BIWUDAHUI_LINGJIANG_BTN_CLICK,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_BIWUDAHUI_SHIJIANGUIZE_BTN_CLICK,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_BIWUDAHUI_ZHUWEIOK_BTN_CLICK,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_BIWUDAHUIPANEL_LIST_GET_PAGE,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_BIWUDAHUI_LIST_ID,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_BIWUDAHUI_GUANZHAN_BTN_CLICK,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_XIANGYANGZHANCHANGPANEL_SHOW,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_XIANGYANGZHANCHANG_BAOGUOSHOUYIQUHUI_BTN_CLICK,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_XIANGYANGZHANCHANG_BAOMING,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_XIANGYANGZHANCHANG_AGAIN,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_YN_XIANGYANGZHANCHANGRANK,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_KUAPINGTAI_HISTORY_SHOW,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(BiwuCrossPlatform_Panel.UI_HISTORYPANEL_LIST_GET_PAGE,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_FUQI_SHOW,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_FUQI_START_CLICK,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_FUQI_GIFT_CLICK,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_FUQI_SHOW_BY_PAGE,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_FUQI_SHOW_AVATAR,bossRefurbishHandle);
            bossRefurbishPlane.addEventListener(conquerPanel.UI_FUQI_SHOP_CLICK,bossRefurbishHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(conquerPanel,function():void
         {
            bossRefurbishPlane.removeEventListener(Event.ADDED_TO_STAGE,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_SHOW,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_BAOGUOYUSHOUYI,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_LINGQUJIANGLI_ID,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_LIST_ID,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_SHENGWANGSHANGDIAN,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_LUNJIANTAI,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_CONQUERPANEL_3V3JINGJICHANG_SHOW,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_JINGJIPANEL_lINGQUJIAGNLI_BTN_CLICK,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_JINGJIPANEL_LIST_GET_PAGE,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_JINGJIPANEL_JINGJIGUIZECHAXUN_BTN_CLICK,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_JINGJIPANEL_SHENGWANGSHANGDIANGOUWU_BTN_CLICK,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_JINGJIPANEL_LIST_GET_PAGE,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_JINGJIPANEL_LIST_MUTUAL,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_JINGJIPANEL_PARTICULAR_INFO_SHOW,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_BIWUDAHUI_SHOW,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_BIWUDAHUI_BAOGUOSHOUYIQUHUI_BTN_CLICK,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_BIWUDAHUI_CHUANRU,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_BIWUDAHUI_DUIJUELIUCHENGTU_BTN_CLICK,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_BIWUDAHUI_GUIZECHAXUN_BTN_CLICK,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_BIWUDAHUI_LINGJIANG_BTN_CLICK,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_BIWUDAHUI_SHIJIANGUIZE_BTN_CLICK,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_BIWUDAHUI_ZHUWEIOK_BTN_CLICK,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_BIWUDAHUIPANEL_LIST_GET_PAGE,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_BIWUDAHUI_LIST_ID,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_BIWUDAHUI_GUANZHAN_BTN_CLICK,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_XIANGYANGZHANCHANGPANEL_SHOW,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_XIANGYANGZHANCHANG_BAOGUOSHOUYIQUHUI_BTN_CLICK,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_XIANGYANGZHANCHANG_BAOMING,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_XIANGYANGZHANCHANG_AGAIN,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_YN_XIANGYANGZHANCHANGRANK,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_KUAPINGTAI_HISTORY_SHOW,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(BiwuCrossPlatform_Panel.UI_HISTORYPANEL_LIST_GET_PAGE,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_FUQI_SHOW,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_FUQI_START_CLICK,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_FUQI_GIFT_CLICK,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_FUQI_SHOW_BY_PAGE,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_FUQI_SHOW_AVATAR,bossRefurbishHandle);
            bossRefurbishPlane.removeEventListener(conquerPanel.UI_FUQI_SHOP_CLICK,bossRefurbishHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(KuaFuZhanChangPanel,function():void
         {
            GameInstance.uiInstance.teamKuaFuZhanChangPanel.addEventListener(KuaFuZhanChangPanel.UI_XIANGYANGZHANCHANGBAOMING_ACCEDEBTN,xiangyangBaoming_acc);
            GameInstance.uiInstance.teamKuaFuZhanChangPanel.addEventListener(KuaFuZhanChangPanel.UI_XIANGYANGZHANCHANG_REFUSEBTN,xiangyangBaoming_ref);
         });
         UIEventsRegisterManager.addUIRemovedEvent(KuaFuZhanChangPanel,function():void
         {
            GameInstance.uiInstance.teamKuaFuZhanChangPanel.addEventListener(KuaFuZhanChangPanel.UI_XIANGYANGZHANCHANGBAOMING_ACCEDEBTN,xiangyangBaoming_acc);
            GameInstance.uiInstance.teamKuaFuZhanChangPanel.addEventListener(KuaFuZhanChangPanel.UI_XIANGYANGZHANCHANG_REFUSEBTN,xiangyangBaoming_ref);
         });
      }
      
      private function panelClose(param1:Event) : void
      {
         this.selectedZhuWeiArr = null;
         this.kuaFuDataArr = null;
         this.listSelectID = 0;
      }
      
      private function bossRefurbishHandle(param1:*) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:Object = null;
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case Event.ADDED_TO_STAGE:
               break;
            case conquerPanel.UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_SHOW:
               if(Boolean(this.addedToStageFun))
               {
                  this.addedToStageFun();
                  this.addedToStageFun = null;
                  return;
               }
               if(this.nowPanel == conquerPanel.UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_SHOW)
               {
                  return;
               }
               this.listSelectID = 0;
               this.nowPanel = conquerPanel.UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_SHOW;
               this.kuaFuDataArr = null;
               this.bossRefurbishPlane.showKuafu();
               if(!this.kuaFuDataArr)
               {
                  this.msgSenderProxy.send_40023({
                     "id":1,
                     "str":""
                  });
               }
               this.msgSenderProxy.send_40025();
               this.addLoadBuffer();
               break;
            case conquerPanel.UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_BAOGUOYUSHOUYI:
               PipeManager.sendMsg(PipeConstants.MAINUI_KUAFU_GUIZHE_QUERY,3);
               break;
            case conquerPanel.UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_LINGQUJIANGLI_ID:
               this.msgSenderProxy.send_40027();
               break;
            case conquerPanel.UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_LIST_ID:
               _loc4_ = param1.data as Array;
               if(this.listSelectID != _loc4_[0])
               {
                  this.listSelectID = _loc4_[0];
                  PipeManager.sendMsg(PipeConstants.KUA_FU_RANK_DATA_SEND,{
                     "id":this.listSelectID,
                     "index":OtherConst.RANK_KUAFU_ID,
                     "qufu":_loc4_[1]
                  });
               }
               break;
            case conquerPanel.UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_LUNJIANTAI:
               if(ReloginManager.isInKuafu)
               {
                  NoticeManager.notify(NoticeManager.FOOT,"跨服服务器中，禁用此功能");
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"跨服服务器中，禁用此功能");
                  return;
               }
               MainCharSeachPathManager.mainCharWalk(SpecialNPCID.XIANG_YANG_CHENG_FANG_YU_SHI);
               break;
            case conquerPanel.UI_CONQUERPANEL_KUAFULUNJIANTIANXIADIYI_SHENGWANGSHANGDIAN:
               PipeManager.sendMsg(PipeConstants.SET_MAINCHAR_MALL,2);
               break;
            case conquerPanel.UI_CONQUERPANEL_3V3JINGJICHANG_SHOW:
               if(this.nowPanel == conquerPanel.UI_CONQUERPANEL_3V3JINGJICHANG_SHOW)
               {
                  return;
               }
               this.listSelectID = 0;
               this.nowPanel = conquerPanel.UI_CONQUERPANEL_3V3JINGJICHANG_SHOW;
               this.kuaFuDataArr = null;
               this.bossRefurbishPlane.showJingjichang();
               this.nowPageNum = 1;
               if(!this.kuaFuDataArr)
               {
                  this.msgSenderProxy.send_40033({
                     "id":1,
                     "str":""
                  });
               }
               this.msgSenderProxy.send_40035();
               break;
            case conquerPanel.UI_JINGJIPANEL_LIST_GET_PAGE:
               if(param1.data == 1)
               {
                  this.nowPageNum = 1;
               }
               if(param1.data == 2)
               {
                  --this.nowPageNum;
               }
               if(param1.data == 3)
               {
                  ++this.nowPageNum;
               }
               if(param1.data == 4)
               {
                  this.nowPageNum = this.maxPageNum;
               }
               if(this.nowPageNum < 1)
               {
                  this.nowPageNum = 1;
               }
               if(this.nowPageNum > this.maxPageNum)
               {
                  this.nowPageNum = this.maxPageNum;
               }
               this.msgSenderProxy.send_40033({
                  "id":this.nowPageNum,
                  "str":""
               });
               this.addLoadBuffer();
               break;
            case conquerPanel.UI_JINGJIPANEL_PARTICULAR_INFO_SHOW:
               _loc5_ = param1.data;
               if(this.listSelectID != _loc5_.playerID)
               {
                  this.listSelectID = _loc5_.playerID;
                  PipeManager.sendMsg(PipeConstants.KUA_FU_RANK_DATA_SEND,{
                     "id":this.listSelectID,
                     "index":OtherConst.RANK_KUAFU_3V3
                  });
               }
               break;
            case conquerPanel.UI_JINGJIPANEL_LIST_MUTUAL:
               PipeManager.sendMsg(PipeConstants.CHONGBAI_BISHI,{
                  "id":this.listSelectID,
                  "type":(param1.data as int == 2 ? 0 : 1),
                  "action":OtherConst.RANK_KUAFU_3V3
               });
               this.tempPlayerID = this.listSelectID;
               break;
            case conquerPanel.UI_JINGJIPANEL_lINGQUJIAGNLI_BTN_CLICK:
               this.msgSenderProxy.send_40037();
               break;
            case conquerPanel.UI_JINGJIPANEL_JINGJIGUIZECHAXUN_BTN_CLICK:
               break;
            case conquerPanel.UI_JINGJIPANEL_SHENGWANGSHANGDIANGOUWU_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.SET_MAINCHAR_MALL,2);
               break;
            case conquerPanel.UI_BIWUDAHUI_SHOW:
               this.listSelectID = 0;
               this.selectedZhuWeiArr = null;
               this.showBiWuDaHui();
               break;
            case conquerPanel.UI_BIWUDAHUI_BAOGUOSHOUYIQUHUI_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.MAINUI_KUAFU_GUIZHE_QUERY,3);
               break;
            case conquerPanel.UI_BIWUDAHUI_CHUANRU:
               this.msgSenderProxy.send_53859();
               break;
            case conquerPanel.UI_BIWUDAHUI_DUIJUELIUCHENGTU_BTN_CLICK:
               if(!Fun.isVisible(GameInstance.uiInstance._biwuDuijuePanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_BIWUDUIJUE_PANEL);
               }
               break;
            case conquerPanel.UI_BIWUDAHUI_GUIZECHAXUN_BTN_CLICK:
               break;
            case conquerPanel.UI_BIWUDAHUI_LINGJIANG_BTN_CLICK:
               this.msgSenderProxy.send_53857();
               break;
            case conquerPanel.UI_BIWUDAHUI_SHIJIANGUIZE_BTN_CLICK:
               break;
            case conquerPanel.UI_BIWUDAHUI_ZHUWEIOK_BTN_CLICK:
               _loc3_ = param1.data as Array;
               this.isZhuWeiBtnClick = true;
               this.msgSenderProxy.send_53855([_loc3_[1],_loc3_[0]]);
               break;
            case conquerPanel.UI_BIWUDAHUIPANEL_LIST_GET_PAGE:
               this.selectedZhuWeiArr = null;
               if(param1.data == 1)
               {
                  this.nowPageNum = 1;
               }
               if(param1.data == 2)
               {
                  --this.nowPageNum;
               }
               if(param1.data == 3)
               {
                  ++this.nowPageNum;
               }
               if(param1.data == 4)
               {
                  this.nowPageNum = this.maxPageNum;
               }
               if(this.nowPageNum < 1)
               {
                  this.nowPageNum = 1;
               }
               if(this.nowPageNum > this.maxPageNum)
               {
                  this.nowPageNum = this.maxPageNum;
               }
               this.msgSenderProxy.send_53851(this.nowPageNum);
               break;
            case conquerPanel.UI_BIWUDAHUI_LIST_ID:
               _loc4_ = param1.data as Array;
               if(this.listSelectID == int(_loc4_[0]))
               {
                  return;
               }
               this.listSelectID = int(_loc4_[0]);
               PipeManager.sendMsg(PipeConstants.KUA_FU_RANK_DATA_SEND,{
                  "id":int(_loc4_[0]),
                  "index":OtherConst.RANK_KUAFU_BIWUDAHUI,
                  "qufu":_loc4_[1]
               });
               break;
            case conquerPanel.UI_BIWUDAHUI_GUANZHAN_BTN_CLICK:
               _loc3_ = param1.data as Array;
               this.msgSenderProxy.send_53867([_loc3_[1],_loc3_[0]]);
               break;
            case conquerPanel.UI_XIANGYANGZHANCHANGPANEL_SHOW:
               this.showXiangYangZhanChang();
               break;
            case conquerPanel.UI_XIANGYANGZHANCHANG_BAOGUOSHOUYIQUHUI_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.MAINUI_KUAFU_GUIZHE_QUERY,3);
               break;
            case conquerPanel.UI_XIANGYANGZHANCHANG_BAOMING:
               this.msgSenderProxy.send_51961();
               break;
            case conquerPanel.UI_XIANGYANGZHANCHANG_AGAIN:
               this.msgSenderProxy.send_51971();
               break;
            case conquerPanel.UI_YN_XIANGYANGZHANCHANGRANK:
               PipeManager.sendMsg(PipeConstants.YN_REQUEST_XIANGYANGZHANCHANGRANK_DATA);
               break;
            case conquerPanel.UI_KUAPINGTAI_HISTORY_SHOW:
               this.showKuapingtaiHistory();
               break;
            case BiwuCrossPlatform_Panel.UI_HISTORYPANEL_LIST_GET_PAGE:
               PipeManager.sendMsg(PipeConstants.GET_CONQUER_HISTORY_DATA,param1.data);
               break;
            case conquerPanel.UI_FUQI_SHOW:
               this.nowPanel = conquerPanel.UI_FUQI_SHOW;
               this.msgSenderProxy.send_61041(1);
               break;
            case conquerPanel.UI_FUQI_START_CLICK:
               this.msgSenderProxy.send_61047();
               break;
            case conquerPanel.UI_FUQI_GIFT_CLICK:
               this.msgSenderProxy.send_61045();
               break;
            case conquerPanel.UI_FUQI_SHOW_BY_PAGE:
               if(param1.data == 1)
               {
                  this.nowPageOfFuQi = 1;
               }
               if(param1.data == 2)
               {
                  --this.nowPageOfFuQi;
               }
               if(param1.data == 3)
               {
                  ++this.nowPageOfFuQi;
               }
               if(param1.data == 4)
               {
                  this.nowPageOfFuQi = this.maxPageOfFuQi;
               }
               if(this.nowPageOfFuQi < 1)
               {
                  this.nowPageOfFuQi = 1;
               }
               if(this.nowPageOfFuQi > this.maxPageOfFuQi)
               {
                  this.nowPageOfFuQi = this.maxPageOfFuQi;
               }
               this.msgSenderProxy.send_61041(this.nowPageOfFuQi);
               break;
            case conquerPanel.UI_FUQI_SHOW_AVATAR:
               this.msgSenderProxy.send_61043(param1.data as Array);
               break;
            case conquerPanel.UI_FUQI_SHOP_CLICK:
               PipeManager.sendMsg(PipeConstants.SET_MAINCHAR_MALL,5);
         }
      }
      
      private function showBiWuDaHui() : void
      {
         this.nowPanel = conquerPanel.UI_BIWUDAHUI_SHOW;
         this.bossRefurbishPlane.showBiwudahui();
         this.nowPageNum = 1;
         this.msgSenderProxy.send_53851(1);
         this.msgSenderProxy.send_53863();
      }
      
      private function addLoadBuffer() : void
      {
         this.removeLoaderBuff();
         this.loaderBuff = LoadBuffer.show(this.bossRefurbishPlane);
      }
      
      private function removeLoaderBuff() : void
      {
         if(this.loaderBuff)
         {
            this.loaderBuff.close();
         }
         this.loaderBuff = null;
      }
      
      private function get msgSenderProxy() : MainUI_MsgSendProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(MainUI_MsgSendProxy.NAME) as MainUI_MsgSendProxy;
         }
         return this._msgSenderProxy;
      }
      
      public function setPlayerEquipOrRide(param1:Boolean, param2:Object, param3:int) : void
      {
         var _loc9_:Goods = null;
         if(!Fun.isVisible(GameInstance.uiInstance.bossRefurbishPanel))
         {
            return;
         }
         var _loc4_:Boolean = param2 == null ? false : true;
         var _loc5_:int = 0;
         if(this.nowPageNum == 1)
         {
            _loc5_ = 14;
         }
         if(!_loc4_)
         {
            this.bossRefurbishPlane.setItem([],null,_loc5_,0,0,_loc4_,0);
            this.bossRefurbishPlane.setICOXiantian(false,0,0,-1);
            this.bossRefurbishPlane.setICOHuXinYao(false);
            this.bossRefurbishPlane.setICONiXi(false);
            this.bossRefurbishPlane.setICOXiantian3V3(false,0,0,-1);
            this.bossRefurbishPlane.setICOHuXinYao3V3(false);
            this.bossRefurbishPlane.setICONiXi3V3(false);
            this.bossRefurbishPlane.setICORouti(false);
            this.bossRefurbishPlane.setICOWuhun(0,false,false,0,false,0,false,false,0);
            this.bossRefurbishPlane.setICORouti3V3(false);
            this.bossRefurbishPlane.setICOState(false,0,false,0,false,0,false,0,false,0,false,0,false,0,false,0);
            this.bossRefurbishPlane.setJianJiICOState(false,0,false,0,false,0,false,0,false,0,false,0,false,0,false,0);
            this.bossRefurbishPlane.setICOXiantians(false,0,0,-1);
            this.bossRefurbishPlane.setICOHuXinYaos(false);
            this.bossRefurbishPlane.setICONiXis(false);
            this.bossRefurbishPlane.setICORoutis(false);
            this.bossRefurbishPlane.setStarState(false,0,false,0,false,0,false,0,false,0,false,0,false,0,false,0);
            this.bossRefurbishPlane.setSiShengShouState(0,0,0,0);
            this.setCharAvatar(null,param3);
            return;
         }
         if(param3 == OtherConst.RANK_KUAFU_3V3)
         {
            this.bossRefurbishPlane.setItem(param2.equipArr,param2.avatar,_loc5_,param2.congbaiCount,param2.bishiCount,_loc4_,param2.useIng_Weapon_id);
         }
         if(param3 == OtherConst.RANK_KUAFU_ID)
         {
            param2.equipArr[param2.equipArr.length] = new Goods(116401);
         }
         var _loc6_:Array = ExchangePositionManager.getEquipStatus(param2.equipArr);
         var _loc7_:Array = ExchangePositionManager.getSiShengShouStatus(param2.equipArr);
         if(param3 == OtherConst.RANK_KUAFU_ID)
         {
            if(_loc6_.length > 0)
            {
               this.bossRefurbishPlane.setICOState(_loc6_[0][0],_loc6_[0][1],_loc6_[1][0],_loc6_[1][1],_loc6_[2][0],_loc6_[2][1],_loc6_[3][0],_loc6_[3][1],_loc6_[4][0],_loc6_[4][1],_loc6_[5][0],_loc6_[5][1],_loc6_[6][0],_loc6_[6][1],_loc6_[7][0],_loc6_[7][1]);
            }
            else
            {
               this.bossRefurbishPlane.setICOState(false,0,false,0,false,0,false,0,false,0,false,0,false,0,false,0);
            }
            if(param2.taoZhuang)
            {
               this.bossRefurbishPlane.setSiShengShouState(12,12,12,12);
            }
            else if(_loc7_.length > 0)
            {
               this.bossRefurbishPlane.setSiShengShouState(_loc7_[0],_loc7_[1],_loc7_[2],_loc7_[3]);
            }
            else
            {
               this.bossRefurbishPlane.setSiShengShouState(0,0,0,0);
            }
         }
         if(param3 == OtherConst.RANK_KUAFU_3V3)
         {
            if(_loc6_.length > 0)
            {
               this.bossRefurbishPlane.setJianJiICOState(_loc6_[0][0],_loc6_[0][1],_loc6_[1][0],_loc6_[1][1],_loc6_[2][0],_loc6_[2][1],_loc6_[3][0],_loc6_[3][1],_loc6_[4][0],_loc6_[4][1],_loc6_[5][0],_loc6_[5][1],_loc6_[6][0],_loc6_[6][1],_loc6_[7][0],_loc6_[7][1]);
            }
            else
            {
               this.bossRefurbishPlane.setJianJiICOState(false,0,false,0,false,0,false,0,false,0,false,0,false,0,false,0);
            }
            if(param2.taoZhuang)
            {
               this.bossRefurbishPlane.setSiShengShouState(12,12,12,12);
            }
            else if(_loc7_.length > 0)
            {
               this.bossRefurbishPlane.setSiShengShouState(_loc7_[0],_loc7_[1],_loc7_[2],_loc7_[3]);
            }
            else
            {
               this.bossRefurbishPlane.setSiShengShouState(0,0,0,0);
            }
         }
         if(param3 == OtherConst.RANK_KUAFU_BIWUDAHUI)
         {
            if(_loc6_.length > 0)
            {
               this.bossRefurbishPlane.setStarState(_loc6_[0][0],_loc6_[0][1],_loc6_[1][0],_loc6_[1][1],_loc6_[2][0],_loc6_[2][1],_loc6_[3][0],_loc6_[3][1],_loc6_[4][0],_loc6_[4][1],_loc6_[5][0],_loc6_[5][1],_loc6_[6][0],_loc6_[6][1],_loc6_[7][0],_loc6_[7][1]);
            }
            else
            {
               this.bossRefurbishPlane.setStarState(false,0,false,0,false,0,false,0,false,0,false,0,false,0,false,0);
            }
            if(param2.taoZhuang)
            {
               this.bossRefurbishPlane.setSiShengShouState(12,12,12,12);
            }
            else if(_loc7_.length > 0)
            {
               this.bossRefurbishPlane.setSiShengShouState(_loc7_[0],_loc7_[1],_loc7_[2],_loc7_[3]);
            }
            else
            {
               this.bossRefurbishPlane.setSiShengShouState(0,0,0,0);
            }
         }
         if(param2.yupeiID)
         {
            _loc9_ = new Goods(param2.yupeiID);
            _loc9_.position = _loc9_.res.position;
            _loc9_.roleID = param2.id;
            if(param3 == OtherConst.RANK_KUAFU_ID)
            {
               this.bossRefurbishPlane.setYupei(_loc9_);
            }
            if(param3 == OtherConst.RANK_KUAFU_3V3)
            {
               this.bossRefurbishPlane.setJingjiYupei(_loc9_);
            }
         }
         if(param3 == OtherConst.RANK_KUAFU_ID)
         {
            this.bossRefurbishPlane.setICOXiantian(param2.isXTWJ,param2.TSNL,param2.ShenNongBaiChaoDanSta,param2.qianNengXinFaSta);
         }
         if(param3 == OtherConst.RANK_KUAFU_3V3)
         {
            this.bossRefurbishPlane.setICOXiantian3V3(param2.isXTWJ,param2.TSNL,param2.ShenNongBaiChaoDanSta,param2.qianNengXinFaSta);
         }
         if(param3 == OtherConst.RANK_KUAFU_BIWUDAHUI)
         {
            this.bossRefurbishPlane.setICOXiantians(param2.isXTWJ,param2.TSNL,param2.ShenNongBaiChaoDanSta,param2.qianNengXinFaSta);
         }
         if(param3 == OtherConst.RANK_KUAFU_ID)
         {
            this.bossRefurbishPlane.setICOHuXinYao(param2.HuXinYao);
         }
         if(param3 == OtherConst.RANK_KUAFU_3V3)
         {
            this.bossRefurbishPlane.setICOHuXinYao3V3(param2.HuXinYao);
         }
         if(param3 == OtherConst.RANK_KUAFU_BIWUDAHUI)
         {
            this.bossRefurbishPlane.setICOHuXinYaos(param2.HuXinYao);
         }
         if(param3 == OtherConst.RANK_KUAFU_ID)
         {
            this.bossRefurbishPlane.setICONiXi(param2.niXiStatus);
         }
         if(param3 == OtherConst.RANK_KUAFU_3V3)
         {
            this.bossRefurbishPlane.setICONiXi3V3(param2.niXiStatus);
         }
         if(param3 == OtherConst.RANK_KUAFU_BIWUDAHUI)
         {
            this.bossRefurbishPlane.setICONiXis(param2.niXiStatus);
         }
         if(param3 == OtherConst.RANK_KUAFU_ID)
         {
            this.bossRefurbishPlane.setICOFengHuang(param2.fengHuang);
         }
         if(param3 == OtherConst.RANK_KUAFU_3V3)
         {
            this.bossRefurbishPlane.setICOFengHuang3V3(param2.fengHuang);
         }
         if(param3 == OtherConst.RANK_KUAFU_BIWUDAHUI)
         {
            this.bossRefurbishPlane.setICOFengHuangs(param2.fengHuang);
         }
         if(param3 == OtherConst.RANK_KUAFU_ID)
         {
            this.bossRefurbishPlane.setICORouti(param2.isRTJS);
         }
         if(param3 == OtherConst.RANK_KUAFU_3V3)
         {
            this.bossRefurbishPlane.setICORouti3V3(param2.isRTJS);
         }
         if(param3 == OtherConst.RANK_KUAFU_BIWUDAHUI)
         {
            this.bossRefurbishPlane.setICORoutis(param2.isRTJS);
         }
         if(param3 == OtherConst.RANK_KUAFU_ID)
         {
            this.bossRefurbishPlane.setICOWuhun(param2.wuhun,param2.wuHunShengJiDan,param2.huohundan,param2.wuhunshendan,param2.longhunwupo,param2.longhunshendan,param2.shenfumiji,param2.isNeitishenqi,param2.neitishenqi);
         }
         if(param3 == OtherConst.RANK_KUAFU_3V3)
         {
            this.bossRefurbishPlane.setICOWuhun3V3(param2.wuhun,param2.wuHunShengJiDan,param2.huohundan,param2.wuhunshendan,param2.longhunwupo,param2.longhunshendan,param2.shenfumiji,param2.isNeitishenqi,param2.neitishenqi);
         }
         if(param3 == OtherConst.RANK_KUAFU_BIWUDAHUI)
         {
            this.bossRefurbishPlane.setICOWuhuns(param2.wuhun,param2.wuHunShengJiDan,param2.huohundan,param2.wuhunshendan,param2.longhunwupo,param2.longhunshendan,param2.shenfumiji,param2.isNeitishenqi,param2.neitishenqi);
         }
         var _loc8_:PurePlayer = new PurePlayer();
         _loc8_.isOnMount = param2.isOnMount;
         _loc8_.id = param2.id;
         param2.mountID = param2.mountID ? param2.mountID : -1;
         _loc8_.avatarInfo.useIng_Weapon_id = param2.useIng_Weapon_id;
         _loc8_.avatarInfo.isFeixing = param2.isFeixing;
         _loc8_.avatarInfo.isFeixing_huanzhuang_Id = param2.isFeixing_huanzhuang_Id;
         _loc8_.avatarInfo.isFeixing_wuhun_Id = param2.isFeixing_wuhun_Id;
         _loc8_ = this.setPurePlayer(param2.mountID,param2.partyID,_loc8_,param2.equipArr,param2.usingFashion,param2.useAvatarType);
         this.setCharAvatar(_loc8_,param3);
      }
      
      private function setCharAvatar(param1:PurePlayer, param2:int) : void
      {
         var apdArr:Array;
         var callBack:Function = null;
         var $pPlayer:PurePlayer = param1;
         var index:int = param2;
         callBack = function(param1:*, param2:BitmapData):void
         {
            if(param1 != $pPlayer.id + "_" + char_avatar_zizeng)
            {
               return;
            }
            if(index == OtherConst.RANK_KUAFU_ID)
            {
               bossRefurbishPlane.setKuafuAvatar(param2,$pPlayer.avatarInfo.needChangeAvatarXY);
            }
            if(index == OtherConst.RANK_KUAFU_3V3)
            {
               bossRefurbishPlane.setJingjiAavatar(param2,$pPlayer.avatarInfo.needChangeAvatarXY);
            }
            if(index == OtherConst.RANK_KUAFU_BIWUDAHUI)
            {
               bossRefurbishPlane.setavatars(param2,$pPlayer.avatarInfo.needChangeAvatarXY);
            }
         };
         if(index == OtherConst.RANK_KUAFU_ID)
         {
            this.bossRefurbishPlane.setKuafuAvatar(null);
         }
         if(index == OtherConst.RANK_KUAFU_3V3)
         {
            this.bossRefurbishPlane.setJingjiAavatar(null);
         }
         if(index == OtherConst.RANK_KUAFU_BIWUDAHUI)
         {
            this.bossRefurbishPlane.setavatars(null);
         }
         if(!$pPlayer)
         {
            return;
         }
         apdArr = $pPlayer.avatarInfo.getSimpleAPDList($pPlayer.isOnMount);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($pPlayer.id + "_" + ++this.char_avatar_zizeng,callBack,apdArr);
      }
      
      private function setPurePlayer(param1:int, param2:int, param3:PurePlayer, param4:Array, param5:int = 0, param6:int = 0) : PurePlayer
      {
         var _loc10_:MountRes = null;
         var _loc11_:int = 0;
         var _loc12_:GoodsRes = null;
         var _loc7_:AttributeInfo = param3.attributeInfo;
         var _loc8_:AvatarInfo = param3.avatarInfo;
         _loc7_.partyID = param2;
         _loc8_.usingFashion = param5;
         _loc8_.useAvatarType = param6;
         if(param1 > 0)
         {
            if(_loc8_.usingFashion == 1)
            {
               _loc8_.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,SpecialGoodsID.HUANGJIN_SHENGLONG_ID),AvatarPartType.MOUNT);
            }
            else if(_loc8_.useAvatarType > 0)
            {
               _loc8_.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,AvatarManager.getAvatarIdByType(param6)),AvatarPartType.MOUNT);
            }
            else
            {
               _loc10_ = MountResManager.getMountRes(param1);
               if(_loc10_ != null)
               {
                  _loc8_.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,_loc10_.id_m),AvatarPartType.MOUNT);
               }
            }
            _loc8_.lastMountId = param1;
         }
         var _loc9_:int = 0;
         while(_loc9_ < param4.length)
         {
            _loc11_ = (param4[_loc9_] as Goods).id;
            _loc12_ = GoodsResManager.getGoodsRes(_loc11_);
            if(_loc12_ != null)
            {
               AvatarManager.dressAvatarData(_loc8_,_loc12_.position,_loc12_.id_m,_loc7_.getSex());
            }
            _loc9_++;
         }
         return param3;
      }
      
      private function showXiangYangZhanChang() : void
      {
         this.nowPanel = conquerPanel.UI_XIANGYANGZHANCHANGPANEL_SHOW;
         this.bossRefurbishPlane.showXiangYangZhanChang();
      }
      
      private function showKuapingtaiHistory() : void
      {
         this.nowPanel = conquerPanel.UI_KUAPINGTAI_HISTORY_SHOW;
         this.bossRefurbishPlane.showKuapingtaiHistory();
      }
      
      public function setZhan(param1:Boolean, param2:String = "") : void
      {
         if(param1)
         {
            if(Fun.isVisible(GameInstance.uiInstance._teamKuaFuZhanChangPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TEAM_INSTANCE_PANEL_XIANGYANGZHANCHANG);
            }
            GameInstance.uiInstance.mainUI.showZhan(param2);
         }
         else
         {
            GameInstance.uiInstance.mainUI.hideZhan();
         }
      }
      
      private function xiangyangBaoming_acc(param1:BaseEvent) : void
      {
         this.msgSenderProxy.send_51965(1);
      }
      
      private function xiangyangBaoming_ref(param1:BaseEvent) : void
      {
         this.msgSenderProxy.send_51965(0);
      }
      
      public function received_querenBaoming(param1:String, param2:int, param3:String, param4:String, param5:int, param6:Array) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._teamKuaFuZhanChangPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_TEAM_INSTANCE_PANEL_XIANGYANGZHANCHANG);
         }
         if(this._querenBaomingTime == null)
         {
            this.startQuerenBaomingTime();
         }
         GameInstance.uiInstance.teamKuaFuZhanChangPanel.initBaomingInfo(HeadResChange.headResChangeToString(param5),param1,param2,param3,param4);
         GameInstance.uiInstance.teamKuaFuZhanChangPanel.setMemberArr(param6);
      }
      
      public function startQuerenBaomingTime() : void
      {
         var timerHandler:Function = null;
         timerHandler = function(param1:TimerEvent = null):void
         {
            --_querenCount;
            GameInstance.uiInstance.teamKuaFuZhanChangPanel.setCountDownFun(_querenCount);
         };
         this._querenCount = 15;
         GameInstance.uiInstance.teamKuaFuZhanChangPanel.setCountDownFun(this._querenCount);
         this._querenBaomingTime = TimerManager.createTimer(1000,15,timerHandler,null,this.stopQuerenBaomingTime);
      }
      
      public function stopQuerenBaomingTime(param1:TimerEvent = null) : void
      {
         if(this._querenBaomingTime != null)
         {
            TimerManager.deleteTimer(this._querenBaomingTime);
            this._querenBaomingTime = null;
         }
      }
      
      public function setFuQiRank(param1:int, param2:int, param3:Array, param4:int, param5:Boolean) : void
      {
         this.nowPanel = conquerPanel.UI_FUQI_SHOW;
         this.maxPageOfFuQi = param2;
         this.nowPageOfFuQi = param1;
         this.bossRefurbishPlane.showFuQiJingJi();
         this.bossRefurbishPlane.setFuQiRank(param1,param2,param3,param4,param5);
      }
      
      public function showFuQiAvatar(param1:Array) : void
      {
         var _loc3_:Object = null;
         var _loc4_:PurePlayer = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_];
            _loc4_ = new PurePlayer();
            _loc4_.isOnMount = _loc3_.isOnMount;
            _loc4_.id = _loc3_.id;
            _loc4_.avatarInfo.usingFashion = _loc3_.usingFashion;
            _loc4_.avatarInfo.useAvatarType = _loc3_.useAvatarType;
            _loc3_.mountID = _loc3_.mountID ? _loc3_.mountID : -1;
            _loc4_.avatarInfo.isFeixing = _loc3_.isFeixing;
            _loc4_ = this.setPurePlayer(_loc3_.mountID,_loc3_.partyID,_loc4_,_loc3_.equipArr);
            this.setFuQiCharAvatar(_loc4_);
            _loc2_++;
         }
      }
      
      private function setFuQiCharAvatar(param1:PurePlayer) : void
      {
         var apdArr:Array;
         var callBack:Function = null;
         var $pPlayer:PurePlayer = param1;
         callBack = function(param1:*, param2:BitmapData):void
         {
            bossRefurbishPlane.setFuQiAvatar($pPlayer.id,param2,$pPlayer.avatarInfo.needChangeAvatarXY);
         };
         if(!$pPlayer)
         {
            return;
         }
         this.bossRefurbishPlane.setFuQiAvatar($pPlayer.id,null);
         apdArr = $pPlayer.avatarInfo.getSimpleAPDList($pPlayer.isOnMount,$pPlayer.attributeInfo.getSex());
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($pPlayer.id + "_" + ++this.char_avatar_zizengFuQi,callBack,apdArr);
      }
   }
}

