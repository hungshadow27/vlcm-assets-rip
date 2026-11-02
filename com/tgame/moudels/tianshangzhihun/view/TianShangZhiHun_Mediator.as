package com.tgame.moudels.tianshangzhihun.view
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
   import com.tgame.moudels.tianshangzhihun.TianShangZhiHun_ApplicationFacade;
   import com.tgame.moudels.tianshangzhihun.model.TianShangZhiHun_MsgSenderProxy;
   import com.tgame.shell.view.components.TianShangZhiHunShengJiePanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class TianShangZhiHun_Mediator extends Mediator
   {
      
      public static const NAME:String = "TianShangZhiHun_Mediator";
      
      private var goo:Goods;
      
      private var _senderProxy:TianShangZhiHun_MsgSenderProxy;
      
      private var equip1:Goods;
      
      private var equip2:Goods;
      
      private var equipNum:int = 0;
      
      public function TianShangZhiHun_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : TianShangZhiHun_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(TianShangZhiHun_MsgSenderProxy.NAME) as TianShangZhiHun_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get tianshangzhihunPanel() : TianShangZhiHunShengJiePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.tianshangzhihun);
         }
         return viewComponent as TianShangZhiHunShengJiePanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [TianShangZhiHun_ApplicationFacade.SHOW_TIANSHANGZHIHUN_SHENGJIE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case TianShangZhiHun_ApplicationFacade.SHOW_TIANSHANGZHIHUN_SHENGJIE:
               this.goo = _loc2_ as Goods;
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TianShangZhiHunShengJiePanel,function():void
         {
            tianshangzhihunPanel.addEventListener(Event.ADDED_TO_STAGE,handler);
            tianshangzhihunPanel.addEventListener(TianShangZhiHunShengJiePanel.UI_TIANSHANGZHIHUN_GET_ZHUANGBEI_CLICK,handler);
            tianshangzhihunPanel.addEventListener(TianShangZhiHunShengJiePanel.UI_TIANSHANGZHIHUN_SET_ZHUANGBEI_CLICK,handler);
            tianshangzhihunPanel.addEventListener(TianShangZhiHunShengJiePanel.UI_TIANSHANGZHIHUN_HECHENG_CLICK,handler);
            tianshangzhihunPanel.addEventListener(TianShangZhiHunShengJiePanel.UI_TIANSHENZHIHUN_CLOSE_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TianShangZhiHunShengJiePanel,function():void
         {
            tianshangzhihunPanel.removeEventListener(Event.ADDED_TO_STAGE,handler);
            tianshangzhihunPanel.removeEventListener(TianShangZhiHunShengJiePanel.UI_TIANSHANGZHIHUN_GET_ZHUANGBEI_CLICK,handler);
            tianshangzhihunPanel.removeEventListener(TianShangZhiHunShengJiePanel.UI_TIANSHANGZHIHUN_SET_ZHUANGBEI_CLICK,handler);
            tianshangzhihunPanel.addEventListener(TianShangZhiHunShengJiePanel.UI_TIANSHANGZHIHUN_HECHENG_CLICK,handler);
            tianshangzhihunPanel.addEventListener(TianShangZhiHunShengJiePanel.UI_TIANSHENZHIHUN_CLOSE_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc4_:Object = null;
         var _loc5_:Array = null;
         var _loc6_:Goods = null;
         var _loc7_:Goods = null;
         var _loc2_:String = param1.type;
         var _loc3_:BaseEvent = param1 as BaseEvent;
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.data;
         }
         switch(_loc2_)
         {
            case Event.ADDED_TO_STAGE:
               break;
            case TianShangZhiHunShengJiePanel.UI_TIANSHANGZHIHUN_GET_ZHUANGBEI_CLICK:
               this.equipNum = 0;
               PipeManager.sendMsg(PipeConstants.USE_BAG,1);
               this.resumMouseStatus();
               this.tianshangzhihunPanel.getItem();
               break;
            case TianShangZhiHunShengJiePanel.UI_TIANSHANGZHIHUN_SET_ZHUANGBEI_CLICK:
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.openBackpack();
               this.changeMouseStatus();
               break;
            case TianShangZhiHunShengJiePanel.UI_TIANSHANGZHIHUN_HECHENG_CLICK:
               _loc5_ = _loc4_ as Array;
               if(_loc5_.length == 2)
               {
                  _loc6_ = _loc5_[0] as Goods;
                  _loc7_ = _loc5_[1] as Goods;
                  if(_loc6_ == null || _loc7_ == null)
                  {
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入两件装备进行升阶！"),false);
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入两件装备进行升阶！"),false);
                     return;
                  }
                  if(_loc6_.id != _loc7_.id)
                  {
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入两件相同等级的装备进行升阶！"),false);
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入两件相同等级的装备进行升阶！"),false);
                     return;
                  }
                  this.senderProxy.send_71811([_loc6_.id,1]);
                  break;
               }
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入两件装备进行升阶！"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入两件装备进行升阶！"),false);
               return;
               break;
            case TianShangZhiHunShengJiePanel.UI_TIANSHENZHIHUN_CLOSE_CLICK:
               this.closePanel();
         }
      }
      
      private function itemToPanel(param1:ItemFace, param2:Goods = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Goods = null;
         ++this.equipNum;
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
               --this.equipNum;
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
               return;
            }
            if(param2.res.kind != GoodsKind.K2)
            {
               --this.equipNum;
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("您所放入的物品类型不是装备"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("您所放入的物品类型不是装备"),false);
               return;
            }
            if(!this.goo)
            {
               return;
            }
            if(ItemPositionRange.POSITION_TIANSHANGZHIHUN_Arr.indexOf(param2.id) == -1 && ItemPositionRange.ZUOQIPIJIA_ARRAY.indexOf(param2.id) == -1)
            {
               --this.equipNum;
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("该装备有误或已达到顶级，请重新选择！"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("该装备有误或已达到顶级，请重新选择！"),false);
               return;
            }
         }
         if(Boolean(param2) && Boolean(param2.res) && param2.res.kind == GoodsKind.K2)
         {
            PipeManager.sendMsg(PipeConstants.USE_BAG,0);
            if(this.equipNum == 1)
            {
               this.equip1 = param2;
               this.tianshangzhihunPanel.setItem1(this.equip1);
            }
            else if(this.equipNum == 2)
            {
               this.equip2 = param2;
               if(this.equip1.position == this.equip2.position)
               {
                  --this.equipNum;
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("不可选择同一件装备!"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("不可选择同一件装备!"),false);
                  return;
               }
               if(this.equip1.id != this.equip2.id)
               {
                  --this.equipNum;
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请选择相同等级的装备!"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请选择相同等级的装备!"),false);
                  return;
               }
               this.tianshangzhihunPanel.setItem2(this.equip2);
               _loc3_ = 0;
               if(ItemPositionRange.POSITION_TIANSHANGZHIHUN_Arr.indexOf(this.equip2.id) != -1)
               {
                  _loc3_ = ItemPositionRange.POSITION_TIANSHANGZHIHUN_Arr.indexOf(this.equip2.id);
                  if(_loc3_ == 9)
                  {
                     _loc4_ = new Goods(721773);
                  }
                  else
                  {
                     _loc4_ = new Goods(int(ItemPositionRange.POSITION_TIANSHANGZHIHUN_Arr[_loc3_ + 1]));
                  }
               }
               else if(ItemPositionRange.ZUOQIPIJIA_ARRAY.indexOf(this.equip2.id) != -1)
               {
                  _loc3_ = ItemPositionRange.ZUOQIPIJIA_ARRAY.indexOf(this.equip2.id);
                  if(_loc3_ == 3)
                  {
                     _loc4_ = new Goods(306210);
                  }
                  else
                  {
                     _loc4_ = new Goods(int(ItemPositionRange.ZUOQIPIJIA_ARRAY[_loc3_ + 1]));
                  }
               }
               this.tianshangzhihunPanel.setItem(_loc4_);
            }
            if(this.equipNum > 1)
            {
               this.mouseToNormal();
               this.equipNum = 0;
            }
            return;
         }
         --this.equipNum;
         NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("您所放入的物品类型不是装备"),false);
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("您所放入的物品类型不是装备"),false);
      }
      
      private function openBackpack() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         ResizeManager.showDoublePanel(this.tianshangzhihunPanel,GameInstance.uiInstance.backpack);
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
            TCursorManager.removeLockOnMouseStatus();
         }
      }
      
      public function closePanel() : void
      {
         this.equipNum = 0;
         this.tianshangzhihunPanel.close();
         this.resumMouseStatus();
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
      }
      
      public function getItem() : void
      {
         this.tianshangzhihunPanel.getItem();
      }
   }
}

