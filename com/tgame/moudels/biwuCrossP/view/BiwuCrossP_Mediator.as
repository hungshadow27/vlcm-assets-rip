package com.tgame.moudels.biwuCrossP.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.mount.MountRes;
   import com.tgame.common.res.mount.MountResManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.vo.character.PurePlayer;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.character.info.AvatarInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.AvatarManager;
   import com.tgame.manager.ExchangePositionManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.biwuCrossP.BiwuCrossP_ApplicationFacade;
   import com.tgame.moudels.biwuCrossP.model.BiwuCrossP_MsgSenderProxy;
   import com.tgame.shell.view.components.BiwuCrossPlatform_Panel;
   import com.tgame.shell.view.components.BiwuDuijueCrossP_Panel;
   import com.tgame.shell.view.components.conquerPanel;
   import com.zcp.common.timer.vo.TimerData;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import com.zcp.manager.TimerManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class BiwuCrossP_Mediator extends Mediator
   {
      
      public static const NAME:String = "BiwuCrossP_Mediator";
      
      private var loaderBuff:LoadBuffer;
      
      private var _timerData:TimerData;
      
      private var _curMsgType:int;
      
      private var listSelectID:int = 0;
      
      private var nowPanel:String = "";
      
      private var nowPageNum:int = 1;
      
      private var nowPageNum_History:int = 1;
      
      private var nowPageNum_History2:int = 1;
      
      private var maxPageNum:int = 1;
      
      private var maxPageNum_History:int = 1;
      
      private var maxPageNum_History2:int = 1;
      
      private var selectedZhuWeiArr:Array;
      
      private var showingListArr:Array = [];
      
      private var isZhuWeiBtnClick:Boolean = true;
      
      private var char_avatar_zizeng:int = 0;
      
      private var goodId:int = 0;
      
      private var _msgSenderProxy:BiwuCrossP_MsgSenderProxy;
      
      public function BiwuCrossP_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      protected function get biwuCrossPlatform_Panel() : BiwuCrossPlatform_Panel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.biwuCrossPlatformPanel);
         }
         return viewComponent as BiwuCrossPlatform_Panel;
      }
      
      protected function get biwuDuijueCrossP_Panel() : BiwuDuijueCrossP_Panel
      {
         return GameInstance.uiInstance.biwuDuijueCrossP_Panel;
      }
      
      protected function get conquerP() : conquerPanel
      {
         return GameInstance.uiInstance.bossRefurbishPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [BiwuCrossP_ApplicationFacade.SHOW_BIWU_CROSSPLATFORM_PANEL,BiwuCrossP_ApplicationFacade.SHOW_BIWUDUIJUE_CROSSPLATFORM_PANEL,BiwuCrossP_ApplicationFacade.KUA_FU_RANK_DATA_RECEIVED,BiwuCrossP_ApplicationFacade.GET_CONQUER_HISTORY_DATA,BiwuCrossP_ApplicationFacade.KUAFU_STATUS];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case BiwuCrossP_ApplicationFacade.SHOW_BIWUDUIJUE_CROSSPLATFORM_PANEL:
               if(!Fun.isVisible(GameInstance.uiInstance._biwuDuijueCrossP_Panel))
               {
                  this.msgSenderProxy.send_55561();
               }
               break;
            case BiwuCrossP_ApplicationFacade.KUA_FU_RANK_DATA_RECEIVED:
               _loc3_ = _loc2_ as Array;
               _loc4_ = int(_loc3_[2]);
               this.setPlayerEquipOrRide(_loc3_[0],_loc3_[1],_loc3_[2]);
               break;
            case BiwuCrossP_ApplicationFacade.GET_CONQUER_HISTORY_DATA:
               _loc5_ = _loc2_ as int;
               if(_loc5_ == 1)
               {
                  this.nowPageNum_History2 = 1;
               }
               if(_loc5_ == 2)
               {
                  --this.nowPageNum_History2;
               }
               if(_loc5_ == 3)
               {
                  ++this.nowPageNum_History2;
               }
               if(_loc5_ == 4)
               {
                  this.nowPageNum_History2 = this.maxPageNum_History2;
               }
               if(this.nowPageNum_History2 < 1)
               {
                  this.nowPageNum_History2 = 1;
               }
               if(this.nowPageNum_History2 > this.maxPageNum_History2)
               {
                  this.nowPageNum_History2 = this.maxPageNum_History2;
               }
               this.msgSenderProxy.send_55579(this.nowPageNum_History2,1);
               break;
            case BiwuCrossP_ApplicationFacade.KUAFU_STATUS:
               _loc6_ = _loc2_ as Boolean;
               if(_loc6_)
               {
                  if(Fun.isVisible(GameInstance.uiInstance.biwuCrossPlatformPanel))
                  {
                     this.biwuCrossPlatform_Panel.visible = false;
                  }
                  GameInstance.uiInstance.mainUI.setBiwuDahuiBtnVisible(false);
               }
         }
      }
      
      private function get msgSenderProxy() : BiwuCrossP_MsgSenderProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(BiwuCrossP_MsgSenderProxy.NAME) as BiwuCrossP_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      public function downTimeFun(param1:int, param2:int) : void
      {
         this.timerComplete();
         this._curMsgType = param1;
         if(param2 <= 0)
         {
            NoticeManager.notify(NoticeManager.CENTER_UP,"",false);
            return;
         }
         this._timerData = TimerManager.createExactTimer(param2,param2,0,this.timerUpdate,this.timerComplete,1);
      }
      
      private function timerComplete() : void
      {
         if(this._timerData)
         {
            TimerManager.deleteTimer(this._timerData);
            this._timerData = null;
         }
      }
      
      private function timerUpdate(param1:Number) : void
      {
         if(param1 < 0)
         {
            NoticeManager.notify(NoticeManager.CENTER_UP,LanResManager.getLanCommonTextWords("处理中请稍后"),false);
            return;
         }
         var _loc2_:String = "";
         var _loc3_:String = Math.floor(param1 / 60) + LanResManager.getLanCommonTextWords("分");
         var _loc4_:String = Math.floor(param1) % 60 + LanResManager.getLanCommonTextWords("秒");
         if(this._curMsgType == 1)
         {
            _loc2_ = LanResManager.getLanCommonTextWords("距离战斗开始还有：") + _loc3_ + _loc4_;
         }
         else if(this._curMsgType == 2)
         {
            _loc2_ = LanResManager.getLanCommonTextWords("距离战斗结束还有：") + _loc3_ + _loc4_;
         }
         else if(this._curMsgType == 3)
         {
            _loc2_ = LanResManager.getLanCommonTextWords("传回原服倒计时：") + _loc3_ + _loc4_;
         }
         NoticeManager.notify(NoticeManager.CENTER_UP,_loc2_,false);
      }
      
      public function setDatas(param1:Object) : void
      {
         GameInstance.uiInstance.uiContainer.addChild(this.biwuDuijueCrossP_Panel);
         this.biwuDuijueCrossP_Panel.x = (GameConfig.sceneWidth - this.biwuDuijueCrossP_Panel.width) / 2;
         this.biwuDuijueCrossP_Panel.y = (GameConfig.sceneHeight - this.biwuDuijueCrossP_Panel.height) / 2;
         param1.goodId = this.goodId;
         this.biwuDuijueCrossP_Panel.setInitialize(param1);
         this.biwuDuijueCrossP_Panel.visible = true;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(BiwuCrossPlatform_Panel,function():void
         {
            biwuCrossPlatform_Panel.addEventListener(Event.ADDED_TO_STAGE,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.addEventListener(BiwuCrossPlatform_Panel.UI_BIWUDAHUI_SHOW,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.addEventListener(BiwuCrossPlatform_Panel.UI_BAOMING_BTN_CLICK,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.addEventListener(BiwuCrossPlatform_Panel.UI_BIWUDAHUI_DUIJUELIUCHENGTU_BTN_CLICK,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.addEventListener(BiwuCrossPlatform_Panel.UI_KUAFUBAOGUO_BTN_CLICK,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.addEventListener(BiwuCrossPlatform_Panel.UI_BIWUDAHUI_CHUANRU,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.addEventListener(BiwuCrossPlatform_Panel.UI_BIWUDAHUI_GUIZECHAXUN_BTN_CLICK,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.addEventListener(BiwuCrossPlatform_Panel.UI_BIWUDAHUI_LINGJIANG_BTN_CLICK,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.addEventListener(BiwuCrossPlatform_Panel.UI_BIWUDAHUI_SHIJIANGUIZE_BTN_CLICK,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.addEventListener(BiwuCrossPlatform_Panel.UI_BIWUDAHUI_ZHUWEIOK_BTN_CLICK,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.addEventListener(BiwuCrossPlatform_Panel.UI_BIWUDAHUIPANEL_LIST_GET_PAGE,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.addEventListener(BiwuCrossPlatform_Panel.UI_BIWUDAHUI_LIST_ID,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.addEventListener(BiwuCrossPlatform_Panel.UI_BIWUDAHUI_GUANZHAN_BTN_CLICK,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.addEventListener(BiwuCrossPlatform_Panel.UI_BAOMING_BTN_CLICK,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.addEventListener(BiwuCrossPlatform_Panel.UI_HISTORYPANEL_LIST_GET_PAGE,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.addEventListener(FCloseEvent.CLOSE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(BiwuCrossPlatform_Panel,function():void
         {
            biwuCrossPlatform_Panel.removeEventListener(Event.ADDED_TO_STAGE,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.removeEventListener(BiwuCrossPlatform_Panel.UI_BIWUDAHUI_SHOW,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.removeEventListener(BiwuCrossPlatform_Panel.UI_BAOMING_BTN_CLICK,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.removeEventListener(BiwuCrossPlatform_Panel.UI_BIWUDAHUI_DUIJUELIUCHENGTU_BTN_CLICK,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.removeEventListener(BiwuCrossPlatform_Panel.UI_KUAFUBAOGUO_BTN_CLICK,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.removeEventListener(BiwuCrossPlatform_Panel.UI_BIWUDAHUI_CHUANRU,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.removeEventListener(BiwuCrossPlatform_Panel.UI_BIWUDAHUI_GUIZECHAXUN_BTN_CLICK,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.removeEventListener(BiwuCrossPlatform_Panel.UI_BIWUDAHUI_LINGJIANG_BTN_CLICK,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.removeEventListener(BiwuCrossPlatform_Panel.UI_BIWUDAHUI_SHIJIANGUIZE_BTN_CLICK,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.removeEventListener(BiwuCrossPlatform_Panel.UI_BIWUDAHUI_ZHUWEIOK_BTN_CLICK,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.removeEventListener(BiwuCrossPlatform_Panel.UI_BIWUDAHUIPANEL_LIST_GET_PAGE,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.removeEventListener(BiwuCrossPlatform_Panel.UI_BIWUDAHUI_LIST_ID,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.removeEventListener(BiwuCrossPlatform_Panel.UI_BIWUDAHUI_GUANZHAN_BTN_CLICK,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.removeEventListener(BiwuCrossPlatform_Panel.UI_BAOMING_BTN_CLICK,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.removeEventListener(BiwuCrossPlatform_Panel.UI_HISTORYPANEL_LIST_GET_PAGE,biwuCrossPlatformHandle);
            biwuCrossPlatform_Panel.removeEventListener(FCloseEvent.CLOSE,panelClose);
         });
      }
      
      private function biwuCrossPlatformHandle(param1:*) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case Event.ADDED_TO_STAGE:
               this.msgSenderProxy.send_55563();
               break;
            case BiwuCrossPlatform_Panel.UI_BIWUDAHUI_SHOW:
               this.listSelectID = 0;
               this.selectedZhuWeiArr = null;
               this.showBiWuDaHui();
               break;
            case BiwuCrossPlatform_Panel.UI_KUAFUBAOGUO_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.MAINUI_KUAFU_GUIZHE_QUERY,3);
               break;
            case BiwuCrossPlatform_Panel.UI_BIWUDAHUI_CHUANRU:
               this.msgSenderProxy.send_55559();
               break;
            case BiwuCrossPlatform_Panel.UI_BIWUDAHUI_DUIJUELIUCHENGTU_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_BIWUDUIJUE_CROSSPLATFORM_PANEL);
               break;
            case BiwuCrossPlatform_Panel.UI_BIWUDAHUI_GUIZECHAXUN_BTN_CLICK:
               break;
            case BiwuCrossPlatform_Panel.UI_BIWUDAHUI_LINGJIANG_BTN_CLICK:
               this.msgSenderProxy.send_55557();
               break;
            case BiwuCrossPlatform_Panel.UI_BIWUDAHUI_SHIJIANGUIZE_BTN_CLICK:
               break;
            case BiwuCrossPlatform_Panel.UI_BIWUDAHUI_ZHUWEIOK_BTN_CLICK:
               _loc3_ = param1.data as Array;
               this.isZhuWeiBtnClick = true;
               this.msgSenderProxy.send_55555([_loc3_[0],_loc3_[1],_loc3_[2]]);
               break;
            case BiwuCrossPlatform_Panel.UI_BIWUDAHUIPANEL_LIST_GET_PAGE:
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
               this.msgSenderProxy.send_55551(this.nowPageNum);
               break;
            case BiwuCrossPlatform_Panel.UI_BIWUDAHUI_LIST_ID:
               _loc4_ = param1.data as Array;
               if(this.listSelectID == int(_loc4_[0]))
               {
                  return;
               }
               this.listSelectID = int(_loc4_[0]);
               PipeManager.sendMsg(PipeConstants.KUA_FU_RANK_DATA_SEND,{
                  "id":int(_loc4_[0]),
                  "index":OtherConst.RANK_KUAPINGTAI_BIWUDAHUI,
                  "qufu":_loc4_[1],
                  "pingtai":_loc4_[2]
               });
               break;
            case BiwuCrossPlatform_Panel.UI_HISTORYPANEL_LIST_GET_PAGE:
               if(param1.data == 1)
               {
                  this.nowPageNum_History = 1;
               }
               if(param1.data == 2)
               {
                  --this.nowPageNum_History;
               }
               if(param1.data == 3)
               {
                  ++this.nowPageNum_History;
               }
               if(param1.data == 4)
               {
                  this.nowPageNum_History = this.maxPageNum_History;
               }
               if(this.nowPageNum_History < 1)
               {
                  this.nowPageNum_History = 1;
               }
               if(this.nowPageNum_History > this.maxPageNum_History)
               {
                  this.nowPageNum_History = this.maxPageNum_History;
               }
               this.msgSenderProxy.send_55579(this.nowPageNum_History);
               break;
            case BiwuCrossPlatform_Panel.UI_BIWUDAHUI_GUANZHAN_BTN_CLICK:
               _loc3_ = param1.data as Array;
               this.msgSenderProxy.send_55567([_loc3_[0],_loc3_[2],_loc3_[1]]);
               break;
            case BiwuCrossPlatform_Panel.UI_BAOMING_BTN_CLICK:
               this.msgSenderProxy.send_55565();
         }
      }
      
      private function showBiWuDaHui() : void
      {
         this.nowPanel = BiwuCrossPlatform_Panel.UI_BIWUDAHUI_SHOW;
         this.biwuCrossPlatform_Panel.showBiwudahui();
         this.nowPageNum = 1;
         this.msgSenderProxy.send_55551(1);
         this.msgSenderProxy.send_55563();
      }
      
      public function setData(param1:Object) : void
      {
         this.biwuCrossPlatform_Panel.setData(param1);
         this.goodId = param1.goodId;
      }
      
      public function setBiWuDaHuiZhuWeiComplete(param1:int, param2:int, param3:String, param4:int) : void
      {
         if(this.showingListArr.indexOf(param4) == -1 || !Fun.isVisible(GameInstance.uiInstance._biwuCrossPlatformPanel))
         {
            return;
         }
         this.selectedZhuWeiArr = [param4,param3,param2];
         this.msgSenderProxy.send_55551(this.nowPageNum);
      }
      
      public function setBiWuDaHuiGiftComplete(param1:int) : void
      {
      }
      
      public function setBiWuDaHuiList32(param1:Object) : void
      {
         this.maxPageNum = param1.count;
         this.biwuCrossPlatform_Panel.setPageList(this.nowPageNum,this.maxPageNum,this.nowPageNum == 1 ? true : false,this.maxPageNum == this.nowPageNum ? true : false);
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
         this.biwuCrossPlatform_Panel.setShangbangs(param1.shangbang == 0 ? false : true,param1.lingjiang == 0 ? false : true);
         if(Boolean(this.selectedZhuWeiArr) && this.isZhuWeiBtnClick)
         {
            this.biwuCrossPlatform_Panel.setInitialize(param1.r,_loc2_);
            PipeManager.sendMsg(PipeConstants.KUA_FU_RANK_DATA_SEND,{
               "id":this.selectedZhuWeiArr[0],
               "index":OtherConst.RANK_KUAPINGTAI_BIWUDAHUI,
               "qufu":this.selectedZhuWeiArr[1],
               "pingtai":this.selectedZhuWeiArr[2]
            });
         }
         else
         {
            this.biwuCrossPlatform_Panel.setInitialize(param1.r,0);
            PipeManager.sendMsg(PipeConstants.KUA_FU_RANK_DATA_SEND,{
               "id":param1.r[0].id,
               "index":OtherConst.RANK_KUAPINGTAI_BIWUDAHUI,
               "qufu":param1.r[0].qufu,
               "pingtai":param1.r[0].pingtai
            });
         }
      }
      
      public function setBiWuDaHuiHistoryList(param1:Object) : void
      {
         this.maxPageNum_History = param1.count;
         this.maxPageNum_History2 = param1.count;
         if(param1.panelNo == 0 && this.biwuCrossPlatform_Panel != null)
         {
            this.biwuCrossPlatform_Panel.setPageList_History(this.nowPageNum_History,this.maxPageNum_History,this.nowPageNum_History == 1 ? true : false,this.maxPageNum_History == this.nowPageNum_History ? true : false);
            this.biwuCrossPlatform_Panel.setInitialize_History(param1.r,0);
         }
         if(param1.panelNo == 1 && this.conquerP != null)
         {
            this.conquerP.setPageList_History(this.nowPageNum_History2,this.maxPageNum_History2,this.nowPageNum_History2 == 1 ? true : false,this.maxPageNum_History2 == this.nowPageNum_History2 ? true : false);
            this.conquerP.setInitialize_History(param1.r,0);
         }
      }
      
      private function panelClose(param1:FCloseEvent = null) : void
      {
      }
      
      public function setPlayerEquipOrRide(param1:Boolean, param2:Object, param3:int) : void
      {
         var _loc9_:Goods = null;
         if(!Fun.isVisible(GameInstance.uiInstance.biwuCrossPlatformPanel))
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
            this.biwuCrossPlatform_Panel.setICOWuhuns(0,false,false,0,false,0,false,false,0);
            this.biwuCrossPlatform_Panel.setICOXiantians(false,0,0,-1);
            this.biwuCrossPlatform_Panel.setICOHuXinYaos(false);
            this.biwuCrossPlatform_Panel.setICONiXis(false);
            this.biwuCrossPlatform_Panel.setICORoutis(false);
            this.biwuCrossPlatform_Panel.setStarState(false,0,false,0,false,0,false,0,false,0,false,0,false,0,false,0);
            this.biwuCrossPlatform_Panel.setSiShengShouState(0,0,0,0);
            this.setCharAvatar(null,param3);
            return;
         }
         var _loc6_:Array = ExchangePositionManager.getEquipStatus(param2.equipArr);
         var _loc7_:Array = ExchangePositionManager.getSiShengShouStatus(param2.equipArr);
         if(param3 == OtherConst.RANK_KUAPINGTAI_BIWUDAHUI)
         {
            if(_loc6_.length > 0)
            {
               this.biwuCrossPlatform_Panel.setStarState(_loc6_[0][0],_loc6_[0][1],_loc6_[1][0],_loc6_[1][1],_loc6_[2][0],_loc6_[2][1],_loc6_[3][0],_loc6_[3][1],_loc6_[4][0],_loc6_[4][1],_loc6_[5][0],_loc6_[5][1],_loc6_[6][0],_loc6_[6][1],_loc6_[7][0],_loc6_[7][1]);
            }
            else
            {
               this.biwuCrossPlatform_Panel.setStarState(false,0,false,0,false,0,false,0,false,0,false,0,false,0,false,0);
            }
            if(param2.taoZhuang)
            {
               this.biwuCrossPlatform_Panel.setSiShengShouState(12,12,12,12);
            }
            else if(_loc7_.length > 0)
            {
               this.biwuCrossPlatform_Panel.setSiShengShouState(_loc7_[0],_loc7_[1],_loc7_[2],_loc7_[3]);
            }
            else
            {
               this.biwuCrossPlatform_Panel.setSiShengShouState(0,0,0,0);
            }
         }
         if(param2.yupeiID)
         {
            _loc9_ = new Goods(param2.yupeiID);
            _loc9_.position = _loc9_.res.position;
            _loc9_.roleID = param2.id;
         }
         if(param3 == OtherConst.RANK_KUAPINGTAI_BIWUDAHUI)
         {
            this.biwuCrossPlatform_Panel.setICOXiantians(param2.isXTWJ,param2.TSNL,param2.ShenNongBaiChaoDanSta,param2.qianNengXinFaSta);
         }
         if(param3 == OtherConst.RANK_KUAPINGTAI_BIWUDAHUI)
         {
            this.biwuCrossPlatform_Panel.setICOHuXinYaos(param2.HuXinYao);
         }
         if(param3 == OtherConst.RANK_KUAPINGTAI_BIWUDAHUI)
         {
            this.biwuCrossPlatform_Panel.setICONiXis(param2.niXiStatus);
         }
         if(param3 == OtherConst.RANK_KUAPINGTAI_BIWUDAHUI)
         {
            this.biwuCrossPlatform_Panel.setICOFengHuangs(param2.fengHuang);
         }
         if(param3 == OtherConst.RANK_KUAPINGTAI_BIWUDAHUI)
         {
            this.biwuCrossPlatform_Panel.setICORoutis(param2.isRTJS);
         }
         if(param3 == OtherConst.RANK_KUAPINGTAI_BIWUDAHUI)
         {
            this.biwuCrossPlatform_Panel.setICOWuhuns(param2.wuhun,param2.wuHunShengJiDan,param2.huohundan,param2.wuhunshendan,param2.longhunwupo,param2.longhunshendan,param2.shenfumiji,param2.isNeitishenqi,param2.neitishenqi);
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
            if(index == OtherConst.RANK_KUAPINGTAI_BIWUDAHUI)
            {
               biwuCrossPlatform_Panel.setavatars(param2);
            }
            if($pPlayer.avatarInfo.needChangeAvatarXY)
            {
               biwuCrossPlatform_Panel.setAvaterXY(true);
            }
         };
         if(index == OtherConst.RANK_KUAPINGTAI_BIWUDAHUI)
         {
            this.biwuCrossPlatform_Panel.setavatars(null);
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
                  param3.avatarInfo.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,_loc10_.id_m),AvatarPartType.MOUNT);
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
   }
}

