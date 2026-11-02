package com.tgame.moudels.equipPudding.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.GoodsKind;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.equipPudding.EquipPudding_ApplicationFacade;
   import com.tgame.moudels.equipPudding.model.EquipPudding_MsgSendProxy;
   import com.tgame.shell.view.components.huodong.SiShengShouKeWenPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Equip_KeWenMediator extends Mediator
   {
      
      public static const NAME:String = "Equip_KeWenMediator";
      
      private var _msgSenderProxy:EquipPudding_MsgSendProxy;
      
      public var _id:int = 0;
      
      public var _position:int = 0;
      
      public var equip:Goods;
      
      private var _sishengshouKeWen:SiShengShouKeWenPanel;
      
      public function Equip_KeWenMediator()
      {
         super(NAME);
      }
      
      public function get panel() : SiShengShouKeWenPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.sishengshouKeWenPanel);
         }
         return viewComponent as SiShengShouKeWenPanel;
      }
      
      private function get msgSenderProxy() : EquipPudding_MsgSendProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(EquipPudding_MsgSendProxy.NAME) as EquipPudding_MsgSendProxy;
         }
         return this._msgSenderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [EquipPudding_ApplicationFacade.SHOW_SISHENGSHOUKEWEN_PANEL1];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case EquipPudding_ApplicationFacade.SHOW_SISHENGSHOUKEWEN_PANEL1:
               PipeManager.sendMsg(PipeConstants.SHOW_SISHENGSHOUKEWEN_PANEL);
               this.msgSenderProxy.send_57101(1);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(SiShengShouKeWenPanel,function():void
         {
            panel.addEventListener(SiShengShouKeWenPanel.UI_DAZAOZHUANGBEICLICK,kehuaPanelHandel);
            panel.addEventListener(SiShengShouKeWenPanel.UI_REMOVEZHUANGBEICLICK,kehuaPanelHandel);
            panel.addEventListener(SiShengShouKeWenPanel.UI_FANGRUZHUANGBEICLICK,kehuaPanelHandel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(SiShengShouKeWenPanel,function():void
         {
            panel.removeEventListener(SiShengShouKeWenPanel.UI_DAZAOZHUANGBEICLICK,kehuaPanelHandel);
            panel.removeEventListener(SiShengShouKeWenPanel.UI_REMOVEZHUANGBEICLICK,kehuaPanelHandel);
            panel.removeEventListener(SiShengShouKeWenPanel.UI_FANGRUZHUANGBEICLICK,kehuaPanelHandel);
         });
      }
      
      private function kehuaPanelHandel(param1:Event) : void
      {
         var _loc2_:String = param1.type;
         var _loc3_:Object = (param1 as BaseEvent).data;
         switch(_loc2_)
         {
            case SiShengShouKeWenPanel.UI_DAZAOZHUANGBEICLICK:
               if(this.equip != null)
               {
                  this.msgSenderProxy.send_57105([1,this.equip.position,_loc3_]);
               }
               break;
            case SiShengShouKeWenPanel.UI_REMOVEZHUANGBEICLICK:
               if(this.equip != null)
               {
                  this.msgSenderProxy.send_57107([this.equip.position]);
               }
               break;
            case SiShengShouKeWenPanel.UI_FANGRUZHUANGBEICLICK:
               if(_loc3_ == 2)
               {
                  this.panel.setGoods();
                  this.panelClose();
                  return;
               }
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.openBackpack();
               this.changeMouseStatus();
         }
      }
      
      private function itemToPanel(param1:ItemFace, param2:Goods = null) : void
      {
         var _loc3_:Object = {};
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
            this.msgSenderProxy.send_57103(param2.position);
         }
         this.equip = param2;
         this.mouseToNormal();
      }
      
      private function panelClose(param1:* = null) : void
      {
         this.panel.setGoods();
         this.resumMouseStatus();
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
      
      public function SetGoods(param1:int, param2:int) : void
      {
         var _loc3_:Goods = new Goods(param1);
         _loc3_.roleID = GameInstance.mainChar.id;
         _loc3_.position = this.equip.position;
         var _loc4_:Goods = new Goods(param2);
         _loc4_.roleID = GameInstance.mainChar.id;
         _loc4_.position = this.equip.position;
         this.panel.setGoods(_loc3_,_loc4_);
      }
      
      public function setArr(param1:Array) : void
      {
         var _loc4_:Goods = null;
         var _loc2_:Array = new Array();
         var _loc3_:* = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = new Goods(param1[_loc3_]);
            _loc2_.push(_loc4_);
            _loc3_++;
         }
         this.panel.setGoodArr(_loc2_);
         this.panel.showRemoveBtn();
      }
      
      public function Result(param1:int) : void
      {
         if(param1 == 1)
         {
            this.panel.bofangDuguYanhua(1);
            this.panel.setGoods();
         }
         else
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("打造失败"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("打造失败"),false);
         }
      }
      
      public function Result2(param1:int) : void
      {
         if(param1 == 1)
         {
            this.panel.bofangDuguYanhua(2);
            this.panel.setGoods();
         }
         else
         {
            NoticeManager.notify(NoticeManager.FOOT,"去除失败",false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"去除失败",false);
         }
      }
      
      public function showPanel() : void
      {
      }
   }
}

