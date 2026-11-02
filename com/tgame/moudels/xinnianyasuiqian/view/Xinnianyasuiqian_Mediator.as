package com.tgame.moudels.xinnianyasuiqian.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.HeadResChange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.xinnianyasuiqian.Xinnianyasuiqian_ApplicationFacade;
   import com.tgame.moudels.xinnianyasuiqian.model.Xinnianyasuiqian_MsgSenderProxy;
   import com.tgame.shell.view.components.utils.UITools;
   import com.tgame.shell.view.components.xinnianyasuiqian.XinnianyasuiqianPaihangbangPanel;
   import com.tgame.shell.view.components.xinnianyasuiqian.XinnianyasuiqianPanel;
   import com.tgame.shell.view.components.xinnianyasuiqian.Xinnianyasuiqian_ChaXunWanJiaPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Xinnianyasuiqian_Mediator extends Mediator
   {
      
      public static const NAME:String = "Xinnianyasuiqian_Mediator";
      
      public function Xinnianyasuiqian_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function onRemove() : void
      {
      }
      
      public function get panel() : Xinnianyasuiqian_ChaXunWanJiaPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.xinnianyasuiqianChaXunWanJiaPanel);
         }
         return viewComponent as Xinnianyasuiqian_ChaXunWanJiaPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Xinnianyasuiqian_ApplicationFacade.YN_SHOW_XINNIANYASUIQIAN2017];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Xinnianyasuiqian_ApplicationFacade.YN_SHOW_XINNIANYASUIQIAN2017:
               _loc3_ = int(_loc2_);
               if(!Fun.isVisible(GameInstance.uiInstance.xinnianyasuiqianPanel))
               {
                  GameInstance.uiInstance.xinnianyasuiqianPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.xinnianyasuiqianPanel.width / 2;
                  GameInstance.uiInstance.xinnianyasuiqianPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.xinnianyasuiqianPanel.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.xinnianyasuiqianPanel);
               }
         }
      }
      
      public function get senderProxy() : Xinnianyasuiqian_MsgSenderProxy
      {
         return facade.retrieveProxy(Xinnianyasuiqian_MsgSenderProxy.NAME) as Xinnianyasuiqian_MsgSenderProxy;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(Xinnianyasuiqian_ChaXunWanJiaPanel,function():void
         {
            panel.addEventListener(Xinnianyasuiqian_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_CHAXUNBTN_CLICK,panelHandle);
            panel.addEventListener(Xinnianyasuiqian_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_SHANGYIYEBTN_CLICK,panelHandle);
            panel.addEventListener(Xinnianyasuiqian_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_XIAYIYEBTN_CLICK,panelHandle);
            panel.addEventListener(Xinnianyasuiqian_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_WOYAOSONGHUABTN_CLICK,panelHandle);
            panel.addEventListener(Xinnianyasuiqian_ChaXunWanJiaPanel.UI_38HUODONG_CHAXUNWANJIA_SNOGHUA_CLICK,panelHandle);
            panel.addEventListener(Xinnianyasuiqian_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_FANGRUBTN_CLICK,panelHandle);
            panel.addEventListener(Xinnianyasuiqian_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_SONGHUABTN_CLICK,panelHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(Xinnianyasuiqian_ChaXunWanJiaPanel,function():void
         {
            panel.removeEventListener(Xinnianyasuiqian_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_CHAXUNBTN_CLICK,panelHandle);
            panel.removeEventListener(Xinnianyasuiqian_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_SHANGYIYEBTN_CLICK,panelHandle);
            panel.removeEventListener(Xinnianyasuiqian_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_XIAYIYEBTN_CLICK,panelHandle);
            panel.removeEventListener(Xinnianyasuiqian_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_WOYAOSONGHUABTN_CLICK,panelHandle);
            panel.removeEventListener(Xinnianyasuiqian_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_FANGRUBTN_CLICK,panelHandle);
            panel.removeEventListener(Xinnianyasuiqian_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_SONGHUABTN_CLICK,panelHandle);
            panel.removeEventListener(Xinnianyasuiqian_ChaXunWanJiaPanel.UI_38HUODONG_CHAXUNWANJIA_SNOGHUA_CLICK,panelHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(XinnianyasuiqianPanel,function():void
         {
            GameInstance.uiInstance.xinnianyasuiqianPanel.addEventListener(XinnianyasuiqianPaihangbangPanel.LINGQUJIANGLI,panelHandle);
            GameInstance.uiInstance.xinnianyasuiqianPanel.addEventListener(XinnianyasuiqianPaihangbangPanel.PAIHANGBANG,panelHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(XinnianyasuiqianPanel,function():void
         {
            GameInstance.uiInstance.xinnianyasuiqianPanel.removeEventListener(XinnianyasuiqianPaihangbangPanel.LINGQUJIANGLI,panelHandle);
            GameInstance.uiInstance.xinnianyasuiqianPanel.removeEventListener(XinnianyasuiqianPaihangbangPanel.PAIHANGBANG,panelHandle);
         });
      }
      
      private function panelHandle(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case Xinnianyasuiqian_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_CHAXUNBTN_CLICK:
               _loc3_ = _loc2_.data as Array;
               this.senderProxy.send_82031(_loc3_);
               break;
            case Xinnianyasuiqian_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_SHANGYIYEBTN_CLICK:
               _loc3_ = _loc2_.data as Array;
               this.senderProxy.send_82031(_loc3_);
               break;
            case Xinnianyasuiqian_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_XIAYIYEBTN_CLICK:
               _loc3_ = _loc2_.data as Array;
               this.senderProxy.send_82031(_loc3_);
               break;
            case Xinnianyasuiqian_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_WOYAOSONGHUABTN_CLICK:
               _loc4_ = _loc2_.data as Array;
               _loc5_ = int(_loc4_[0]);
               _loc6_ = int(_loc4_[1]);
               this.senderProxy.send_82033(_loc5_);
               break;
            case Xinnianyasuiqian_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_FANGRUBTN_CLICK:
               this.changeMouseStatus();
               this.openBackpack();
               break;
            case Xinnianyasuiqian_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_SONGHUABTN_CLICK:
               _loc7_ = _loc2_.data as Array;
               this.senderProxy.send_82035(_loc7_);
               this.resumMouseStatus();
               break;
            case Xinnianyasuiqian_ChaXunWanJiaPanel.UI_38HUODONG_CHAXUNWANJIA_SNOGHUA_CLICK:
               _loc8_ = _loc2_.data as Array;
               _loc6_ = 0;
               if(_loc8_[1] == 5)
               {
                  _loc6_ = 1;
               }
               else if(_loc8_[1] == 6)
               {
                  _loc6_ = 2;
               }
               _loc7_ = _loc2_.data as Array;
               this.senderProxy.send_82035(_loc7_);
               break;
            case XinnianyasuiqianPaihangbangPanel.PAIHANGBANG:
               this.senderProxy.send_82037();
               break;
            case XinnianyasuiqianPaihangbangPanel.LINGQUJIANGLI:
               this.senderProxy.send_82039();
         }
      }
      
      public function wanjiaList(param1:Array, param2:int) : void
      {
         this.panel.setList(param1,param2);
      }
      
      public function songhuaMianban(param1:String, param2:int, param3:String, param4:int) : void
      {
         this.panel.setSonghuamianban(param1,HeadResChange.headResChangeToString(param2),param3,HeadResChange.headResChangeToString(param4));
      }
      
      private function changeMouseStatus() : void
      {
         TCursorManager.chickItemToPanelFun = function(param1:ItemFace):void
         {
            var _loc2_:Goods = param1.getItem() as Goods;
            if(_loc2_.id == 41618 || _loc2_.id == 722836)
            {
               panel.setXianhua(_loc2_);
            }
         };
         TCursorManager.showCursor(TCursorManager.CURSOR_XUANZEHUA);
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
      
      public function openBackpack() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         ResizeManager.showDoublePanel(this.panel,GameInstance.uiInstance.backpack);
      }
      
      public function setfuqitongxinpaihangbang(param1:Object) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.xinnianyasuiqianpaihangbangPanel))
         {
            UITools.showPanel(GameInstance.uiInstance.xinnianyasuiqianpaihangbangPanel);
         }
         GameInstance.uiInstance.xinnianyasuiqianpaihangbangPanel.setdata(param1);
      }
   }
}

