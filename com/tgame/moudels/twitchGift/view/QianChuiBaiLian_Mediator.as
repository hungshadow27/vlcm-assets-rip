package com.tgame.moudels.twitchGift.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.util.LayoutManager;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.GoodsKind;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.mall.model.vo.MallLunJianGoodsVO;
   import com.tgame.moudels.twitchGift.TwitchGift_ApplicationFacade;
   import com.tgame.moudels.twitchGift.model.TwitchGift_MsgSendProxy;
   import com.tgame.shell.view.components.QianchuiBailianPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class QianChuiBaiLian_Mediator extends Mediator
   {
      
      public static const NAME:String = "QianChuiBaiLian_Mediator";
      
      private static const chuiZiColorToIDArr:Array = [3003,3004,3005,3006];
      
      private var useChuiZiID:int;
      
      private var loaderBuff:LoadBuffer;
      
      private var equip:Goods;
      
      private var isAuto:Boolean = false;
      
      private var useMenu:int;
      
      private var gameStatus:int;
      
      private var testGameStatus:int;
      
      private var autoEquipUpdataTimer:Timer;
      
      private var mallLunJianGoodsVO:MallLunJianGoodsVO;
      
      private var _msgSenderProxy:TwitchGift_MsgSendProxy;
      
      public function QianChuiBaiLian_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get panel() : QianchuiBailianPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.qianChuiBaiLianPanel);
         }
         return viewComponent as QianchuiBailianPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [TwitchGift_ApplicationFacade.GOODS_CHANGED,TwitchGift_ApplicationFacade.SHOW_QIAN_CHUI_BAI_LIAN_PLANE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case TwitchGift_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(GameInstance.uiInstance.qianChuiBaiLianPanel))
               {
                  this.panel.setGoods(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.useChuiZiID,true));
               }
               break;
            case TwitchGift_ApplicationFacade.SHOW_QIAN_CHUI_BAI_LIAN_PLANE:
               this.useChuiZiID = _loc2_ as int;
               this.addLoadBuffer();
               this.msgSenderProxy.send_53501(this.useChuiZiID);
               this.msgSenderProxy.send_53515(this.useChuiZiID);
               if(this.useChuiZiID == 3003)
               {
                  this.msgSenderProxy.send_53517(3003);
               }
               this.panel.setEnabled2(false);
         }
      }
      
      public function setPanelOpenStatus(param1:int, param2:Array, param3:int) : void
      {
         this.gameStatus = param1;
         var _loc4_:int = chuiZiColorToIDArr.indexOf(this.useChuiZiID);
         this.panel.setFuzengGoods([],-1);
         if(param1 == 0)
         {
            return;
         }
         if(param1 == 1)
         {
            this.panel.SetInitialize(true,_loc4_);
            this.panel.setGoods(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.useChuiZiID,true));
         }
         else
         {
            this.panel.SetInitialize(false,_loc4_);
            this.panel.setGoods(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.useChuiZiID,true));
            this.panel.setFuzengGoods(param2,param3);
            this.panel.setEnabled1(false);
         }
         this.removeLoaderBuff();
      }
      
      public function setMallLunJianGoodsVO(param1:MallLunJianGoodsVO) : void
      {
         this.mallLunJianGoodsVO = param1;
      }
      
      public function setGiftNum(param1:int, param2:Number) : void
      {
         this.panel.setFuzengDuanzaozhi(param1,param2);
      }
      
      public function setGift(param1:String, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:Goods = new Goods(this.useChuiZiID);
         this.panel.setFuzengShuxing(_loc6_.res.name,param1,param2,param3,param4,param5);
      }
      
      public function setGaiLv(param1:int, param2:String) : void
      {
         this.gameStatus = this.testGameStatus;
         if(param1 < 0)
         {
            this.isAuto = false;
            this.panel.setZidongBtnFun(true);
            this.panel.setEnabled1(true);
            this.panel.setEnabled2(true);
            return;
         }
         this.panel.setJilv(param1,100,param2);
         this.panel.setItem(this.equip);
      }
      
      public function isEquipUpDataOk(param1:int, param2:int, param3:Array, param4:int) : void
      {
         var _loc5_:Goods = null;
         if(param1 == -1)
         {
            this.gameStatus = 1;
            this.panel.setXuliFun(true);
            this.isAuto = false;
            this.panel.setZidongBtnFun(true);
            this.panel.setEnabled1(true);
            this.panel.setEnabled2(true);
            this.panel.setFuzengGoods([],-1);
         }
         else
         {
            if(this.useChuiZiID == 3003 || this.useChuiZiID == 3004 || this.useChuiZiID == 3005 || this.useChuiZiID == 3006)
            {
               this.gameStatus = 1;
               this.panel.setEnabled1(true);
               this.panel.setEnabled2(true);
               this.panel.setXuliFun(true);
            }
            else
            {
               this.gameStatus = 2;
               this.panel.setXuliFun(false);
               this.panel.setFuzengGoods(param3,param4);
            }
            _loc5_ = param2 == 0 ? this.equip : GameInstance.mainCharData.goodsInfo.getGoodsByPosition(param2);
            this.itemToPanel(null,_loc5_);
         }
         if(this.isAuto)
         {
            this.panel.setEnabled1(false);
            this.panel.setEnabled2(false);
            if(this.useChuiZiID == 3003 || this.useChuiZiID == 3004 || this.useChuiZiID == 3005 || this.useChuiZiID == 3006)
            {
               this.autoEquipUpdataTime(1000,this.autoEquipUpdataTimerComplete);
               return;
            }
            this.autoEquipUpdataTime(1500,this.autoEquipUpdataTimerComplete);
         }
      }
      
      public function upDataAndGiftComplete(param1:int) : void
      {
         if(param1 == 0)
         {
            this.gameStatus = 2;
            this.panel.setXuliFun(false);
            this.panel.setEnabled1(true);
            this.panel.setEnabled2(true);
            this.isAuto = false;
            this.panel.setZidongBtnFun(true);
         }
         else
         {
            this.gameStatus = 1;
            this.panel.setXuliFun(true);
            this.panel.TurnClose();
         }
         if(this.isAuto)
         {
            this.autoEquipUpdataTime(1500,this.autoEquipUpdataTimerComplete);
         }
         else
         {
            this.panel.setEnabled1(true);
         }
      }
      
      public function getUseChuiZiColor() : int
      {
         return this.useChuiZiID;
      }
      
      public function setFriendVilue(param1:Array) : void
      {
         this.panel.setFriendVilue(param1);
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(QianchuiBailianPanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,panelAddedToStage);
            panel.addEventListener(QianchuiBailianPanel.UI_QIANCHUIBAILIAN_XULI_CLICK,qianChuiBaiLianHandle);
            panel.addEventListener(QianchuiBailianPanel.UI_QIANCHUIBAILIAN_SET_ZHUANGBEI_CLICK,qianChuiBaiLianHandle);
            panel.addEventListener(QianchuiBailianPanel.UI_QIANCHUIBAILIAN_GET_ZHUANGBEI_CLICK,qianChuiBaiLianHandle);
            panel.addEventListener(QianchuiBailianPanel.UI_QIANCHUIBAILIAN_XUANZHEXIANG_CLICK,qianChuiBaiLianHandle);
            panel.addEventListener(QianchuiBailianPanel.UI_QIANCHUIBAILIAN_XUANZHECHUI_CLICK,qianChuiBaiLianHandle);
            panel.addEventListener(QianchuiBailianPanel.UI_QIANCHUIBAILIAN_ZIDONG_CLICK,qianChuiBaiLianHandle);
            panel.addEventListener(QianchuiBailianPanel.UI_QIANCHUIBAILIAN_HUANJIANGLI_CLICK,qianChuiBaiLianHandle);
            panel.addEventListener(QianchuiBailianPanel.UI_QIANCHUIBAILIAN_LINGQU_JINGYAN_CLICK,qianChuiBaiLianHandle);
            panel.addEventListener(QianchuiBailianPanel.UI_QIANCHUIBAILIAN_GOUMAI_GOODS_CLICK,qianChuiBaiLianHandle);
            panel.addEventListener(QianchuiBailianPanel.UI_QIANCHUIBAILIAN_LINGQU_ZHENZI_CLICK,qianChuiBaiLianHandle);
            panel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(QianchuiBailianPanel,function():void
         {
            panel.removeEventListener(Event.ADDED_TO_STAGE,panelAddedToStage);
            panel.removeEventListener(QianchuiBailianPanel.UI_QIANCHUIBAILIAN_XULI_CLICK,qianChuiBaiLianHandle);
            panel.removeEventListener(QianchuiBailianPanel.UI_QIANCHUIBAILIAN_SET_ZHUANGBEI_CLICK,qianChuiBaiLianHandle);
            panel.removeEventListener(QianchuiBailianPanel.UI_QIANCHUIBAILIAN_GET_ZHUANGBEI_CLICK,qianChuiBaiLianHandle);
            panel.removeEventListener(QianchuiBailianPanel.UI_QIANCHUIBAILIAN_XUANZHEXIANG_CLICK,qianChuiBaiLianHandle);
            panel.removeEventListener(QianchuiBailianPanel.UI_QIANCHUIBAILIAN_XUANZHECHUI_CLICK,qianChuiBaiLianHandle);
            panel.removeEventListener(QianchuiBailianPanel.UI_QIANCHUIBAILIAN_ZIDONG_CLICK,qianChuiBaiLianHandle);
            panel.removeEventListener(QianchuiBailianPanel.UI_QIANCHUIBAILIAN_HUANJIANGLI_CLICK,qianChuiBaiLianHandle);
            panel.removeEventListener(QianchuiBailianPanel.UI_QIANCHUIBAILIAN_LINGQU_JINGYAN_CLICK,qianChuiBaiLianHandle);
            panel.removeEventListener(QianchuiBailianPanel.UI_QIANCHUIBAILIAN_GOUMAI_GOODS_CLICK,qianChuiBaiLianHandle);
            panel.removeEventListener(QianchuiBailianPanel.UI_QIANCHUIBAILIAN_LINGQU_ZHENZI_CLICK,qianChuiBaiLianHandle);
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
      }
      
      private function qianChuiBaiLianHandle(param1:Event) : void
      {
         var baseE:BaseEvent = null;
         var n:int = 0;
         var gds:Goods = null;
         var e:Event = param1;
         var next:Function = function():void
         {
            var g:Goods = new Goods(useChuiZiID);
            var name:String = g.res.name;
            FAlert.show(LanResManager.getLanTextWords(QianChuiBaiLian_Mediator,"您希望使用自动锻造功能吗使用自动锻造功能后系统将会为您自动使用背包中的全部锤1",[name,name]),"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  if(gameStatus == 1)
                  {
                     gameStatus = 3;
                     send53505();
                     panel.playAutoMC();
                  }
                  if(gameStatus == 2)
                  {
                     gameStatus = 3;
                     send53507();
                  }
                  panel.setEnabled1(false);
                  panel.setEnabled2(false);
                  panel.setZidongBtnFun(false);
                  isAuto = true;
               }
            });
         };
         baseE = e as BaseEvent;
         var data:Object = {};
         switch(e.type)
         {
            case QianchuiBailianPanel.UI_QIANCHUIBAILIAN_XULI_CLICK:
               if(baseE.data == 1)
               {
                  if(!this.equip)
                  {
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入装备"),false);
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入装备"),false);
                     return;
                  }
                  gds = GameInstance.mainCharData.goodsInfo.getBangDingFaceGoodsByID(this.useChuiZiID,true,true);
                  if(gds.count > 0 && this.equip.bind == 0)
                  {
                     FAlert.show(LanResManager.getLanCommonTextWords("您使用了绑定材料，操作成功后装备将与您绑定。要继续本操作吗？"),"",2,function(param1:FAlertEvent):void
                     {
                        if(param1.eventData == FAlert.OK)
                        {
                           panel.setEnabled1(false);
                           gameStatus = 3;
                           send53505();
                        }
                     });
                  }
                  else
                  {
                     this.panel.setEnabled1(false);
                     this.gameStatus = 3;
                     this.send53505();
                  }
               }
               else
               {
                  this.gameStatus = 3;
                  this.send53507();
               }
               break;
            case QianchuiBailianPanel.UI_QIANCHUIBAILIAN_SET_ZHUANGBEI_CLICK:
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.openBackpack();
               this.changeMouseStatus();
               break;
            case QianchuiBailianPanel.UI_QIANCHUIBAILIAN_GET_ZHUANGBEI_CLICK:
               PipeManager.sendMsg(PipeConstants.USE_BAG,1);
               this.resumMouseStatus();
               this.panel.getItem();
               this.panel.setJilv(0,100,"");
               this.equip = null;
               this.isAuto = false;
               this.panel.setEnabled1(true);
               this.panel.setEnabled2(false);
               this.panel.setZidongBtnFun(true);
               break;
            case QianchuiBailianPanel.UI_QIANCHUIBAILIAN_XUANZHEXIANG_CLICK:
               this.useMenu = int(baseE.data as String);
               this.send53503();
               break;
            case QianchuiBailianPanel.UI_QIANCHUIBAILIAN_XUANZHECHUI_CLICK:
               n = int(chuiZiColorToIDArr[int(baseE.data as String)]);
               if(n == this.useChuiZiID)
               {
                  return;
               }
               this.useChuiZiID = n;
               this.panel.setGoods(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.useChuiZiID,true));
               this.addLoadBuffer();
               this.msgSenderProxy.send_53501(this.useChuiZiID);
               this.send53503();
               this.msgSenderProxy.send_53515(this.useChuiZiID);
               if(this.useChuiZiID == 3003)
               {
                  this.msgSenderProxy.send_53517(3003);
               }
               break;
            case QianchuiBailianPanel.UI_QIANCHUIBAILIAN_ZIDONG_CLICK:
               if(baseE.data)
               {
                  this.isAuto = false;
                  this.panel.setEnabled1(true);
                  if(this.equip)
                  {
                     this.panel.setEnabled2(true);
                  }
                  else
                  {
                     this.panel.setEnabled2(false);
                  }
                  this.panel.setZidongBtnFun(true);
                  return;
               }
               if(this.gameStatus == 0)
               {
                  return;
               }
               if(!this.equip)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入装备"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入装备"),false);
                  return;
               }
               gds = GameInstance.mainCharData.goodsInfo.getBangDingFaceGoodsByID(this.useChuiZiID,true,true);
               if(gds.count > 0 && this.equip.bind == 0)
               {
                  FAlert.show(LanResManager.getLanCommonTextWords("您使用了绑定材料，操作成功后装备将与您绑定。要继续本操作吗？"),"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        next();
                     }
                  });
               }
               else
               {
                  next();
               }
               break;
            case QianchuiBailianPanel.UI_QIANCHUIBAILIAN_HUANJIANGLI_CLICK:
               this.msgSenderProxy.send_53511();
               this.panel.showFirendPanel();
               break;
            case QianchuiBailianPanel.UI_QIANCHUIBAILIAN_LINGQU_JINGYAN_CLICK:
               this.msgSenderProxy.send_53509(this.useChuiZiID);
               break;
            case QianchuiBailianPanel.UI_QIANCHUIBAILIAN_GOUMAI_GOODS_CLICK:
               if(this.useChuiZiID == 3003)
               {
                  PipeManager.sendMsg(PipeConstants.BUY_MALL_SHENGWANG,this.mallLunJianGoodsVO);
               }
               else
               {
                  PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[this.useChuiZiID,0]);
               }
               break;
            case QianchuiBailianPanel.UI_QIANCHUIBAILIAN_LINGQU_ZHENZI_CLICK:
               this.msgSenderProxy.send_53513();
         }
      }
      
      private function panelAddedToStage(param1:Event) : void
      {
      }
      
      private function panelClose(param1:Event) : void
      {
         this.removeLoaderBuff();
         this.panel.getItem();
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         this.resumMouseStatus();
         this.equip = null;
         this.useChuiZiID = 0;
         LayoutManager.getInstance().removeLayoutObject(this.panel);
         LayoutManager.getInstance().removeLayoutObject(GameInstance.uiInstance._backpack);
         this.panel.setFuzengGoods([],-1);
      }
      
      private function itemToPanel(param1:ItemFace, param2:Goods = null) : void
      {
         if(!param1 && !param2)
         {
            return;
         }
         if(!param2)
         {
            param2 = param1.getBaseItem() as Goods;
         }
         if(param2)
         {
            if(!ItemPositionRange.inBag(param2.position))
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
               return;
            }
            if(param2.res.kind != GoodsKind.K2)
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("您所放入的物品类型不是装备"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("您所放入的物品类型不是装备"),false);
               return;
            }
         }
         if(Boolean(param2) && Boolean(param2.res) && param2.res.kind == GoodsKind.K2)
         {
            this.equip = param2;
            PipeManager.sendMsg(PipeConstants.USE_BAG,0);
            this.send53503();
            this.testGameStatus = this.gameStatus;
            this.gameStatus = 3;
            this.mouseToNormal();
            this.panel.setEnabled2(true);
            return;
         }
         NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("您所放入的物品类型不是装备"),false);
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("您所放入的物品类型不是装备"),false);
      }
      
      private function send53503() : void
      {
         if(!this.equip)
         {
            this.panel.setEnabled1(true);
            this.panel.setEnabled2(true);
            this.panel.setZidongBtnFun(true);
            return;
         }
         var _loc1_:Object = {};
         _loc1_.XY = this.equip.position;
         _loc1_.ID = this.equip.id;
         _loc1_.useMenu = this.useMenu;
         _loc1_.useChuiZiID = this.useChuiZiID;
         this.msgSenderProxy.send_53503(_loc1_);
      }
      
      private function send53505() : void
      {
         if(!this.equip)
         {
            this.panel.setEnabled1(true);
            this.panel.setEnabled2(true);
            this.panel.setZidongBtnFun(true);
            return;
         }
         this.gameStatus = 3;
         var _loc1_:Object = {};
         _loc1_.XY = this.equip.position;
         _loc1_.ID = this.equip.id;
         _loc1_.useMenu = this.useMenu;
         _loc1_.useChuiZiID = this.useChuiZiID;
         this.msgSenderProxy.send_53505(_loc1_);
      }
      
      private function send53507() : void
      {
         this.msgSenderProxy.send_53507(this.useChuiZiID);
      }
      
      private function changeMouseStatus() : void
      {
         TCursorManager.showCursor(TCursorManager.CURSOR_SHOUXING,true);
         TCursorManager.seleteItemOnOtherPanel();
         TCursorManager.lockOnMouseStatus();
      }
      
      private function resumMouseStatus() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = null;
            TCursorManager.removeLockOnMouseStatus();
            TCursorManager.resumMouse();
         }
      }
      
      private function mouseToNormal() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = function a(param1:*):void
            {
            };
            TCursorManager.mouseToNormal();
         }
      }
      
      private function openBackpack() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         ResizeManager.showDoublePanel(this.panel,GameInstance.uiInstance.backpack);
      }
      
      private function addLoadBuffer() : void
      {
         this.removeLoaderBuff();
         this.loaderBuff = LoadBuffer.show(GameInstance.uiInstance.qianChuiBaiLianPanel);
      }
      
      private function removeLoaderBuff() : void
      {
         if(this.loaderBuff)
         {
            this.loaderBuff.close();
         }
         this.loaderBuff = null;
      }
      
      private function autoEquipUpdataTime(param1:int, param2:Function) : void
      {
         this.autoEquipUpdataTimer = new Timer(param1,1);
         this.autoEquipUpdataTimer.start();
         this.autoEquipUpdataTimer.addEventListener(TimerEvent.TIMER,param2);
      }
      
      private function autoEquipUpdataTimerComplete(param1:TimerEvent) : void
      {
         if(this.isAuto)
         {
            if(this.gameStatus == 1)
            {
               this.gameStatus = 3;
               this.send53505();
               this.panel.playAutoMC();
            }
            if(this.gameStatus == 2)
            {
               this.gameStatus = 3;
               this.send53507();
            }
         }
         this.autoEquipUpdataTimer = null;
      }
      
      private function get msgSenderProxy() : TwitchGift_MsgSendProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(TwitchGift_MsgSendProxy.NAME) as TwitchGift_MsgSendProxy;
         }
         return this._msgSenderProxy;
      }
   }
}

