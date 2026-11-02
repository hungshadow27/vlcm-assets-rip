package com.tgame.moudels.qingrenjie.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.HeadResChange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.qingrenjie.QingRenJieSongHua_ApplicationFacade;
   import com.tgame.moudels.qingrenjie.model.QingRenJieSongHua_MsgSenderProxy;
   import com.tgame.shell.view.components.QingRenJie_ChaXunWanJiaPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class QingRenJieSongHua_Mediator extends Mediator
   {
      
      public static const NAME:String = "QingRenJieSongHua_Mediator";
      
      public function QingRenJieSongHua_Mediator(param1:String = null, param2:Object = null)
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
      
      public function get panel() : QingRenJie_ChaXunWanJiaPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.qingrenjieChaXunWanJiaPanel);
         }
         return viewComponent as QingRenJie_ChaXunWanJiaPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [QingRenJieSongHua_ApplicationFacade.YN_SHOW_QINGRENJIEHUODONG2015];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case QingRenJieSongHua_ApplicationFacade.YN_SHOW_QINGRENJIEHUODONG2015:
               _loc3_ = int(_loc2_);
               if(!Fun.isVisible(GameInstance.uiInstance._ynqingrenjiePanel))
               {
                  GameInstance.uiInstance.ynqingrenjiePanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynqingrenjiePanel.width / 2;
                  GameInstance.uiInstance.ynqingrenjiePanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynqingrenjiePanel.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynqingrenjiePanel);
                  GameInstance.uiInstance.ynqingrenjiePanel.setType(_loc3_);
               }
         }
      }
      
      public function get senderProxy() : QingRenJieSongHua_MsgSenderProxy
      {
         return facade.retrieveProxy(QingRenJieSongHua_MsgSenderProxy.NAME) as QingRenJieSongHua_MsgSenderProxy;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(QingRenJie_ChaXunWanJiaPanel,function():void
         {
            panel.addEventListener(QingRenJie_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_CHAXUNBTN_CLICK,panelHandle);
            panel.addEventListener(QingRenJie_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_SHANGYIYEBTN_CLICK,panelHandle);
            panel.addEventListener(QingRenJie_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_XIAYIYEBTN_CLICK,panelHandle);
            panel.addEventListener(QingRenJie_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_WOYAOSONGHUABTN_CLICK,panelHandle);
            panel.addEventListener(QingRenJie_ChaXunWanJiaPanel.UI_38HUODONG_CHAXUNWANJIA_SNOGHUA_CLICK,panelHandle);
            panel.addEventListener(QingRenJie_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_FANGRUBTN_CLICK,panelHandle);
            panel.addEventListener(QingRenJie_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_SONGHUABTN_CLICK,panelHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(QingRenJie_ChaXunWanJiaPanel,function():void
         {
            panel.removeEventListener(QingRenJie_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_CHAXUNBTN_CLICK,panelHandle);
            panel.removeEventListener(QingRenJie_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_SHANGYIYEBTN_CLICK,panelHandle);
            panel.removeEventListener(QingRenJie_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_XIAYIYEBTN_CLICK,panelHandle);
            panel.removeEventListener(QingRenJie_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_WOYAOSONGHUABTN_CLICK,panelHandle);
            panel.removeEventListener(QingRenJie_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_FANGRUBTN_CLICK,panelHandle);
            panel.removeEventListener(QingRenJie_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_SONGHUABTN_CLICK,panelHandle);
            panel.removeEventListener(QingRenJie_ChaXunWanJiaPanel.UI_38HUODONG_CHAXUNWANJIA_SNOGHUA_CLICK,panelHandle);
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
            case QingRenJie_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_CHAXUNBTN_CLICK:
               _loc3_ = _loc2_.data as Array;
               this.senderProxy.send_72701(_loc3_);
               break;
            case QingRenJie_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_SHANGYIYEBTN_CLICK:
               _loc3_ = _loc2_.data as Array;
               this.senderProxy.send_72701(_loc3_);
               break;
            case QingRenJie_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_XIAYIYEBTN_CLICK:
               _loc3_ = _loc2_.data as Array;
               this.senderProxy.send_72701(_loc3_);
               break;
            case QingRenJie_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_WOYAOSONGHUABTN_CLICK:
               _loc4_ = _loc2_.data as Array;
               _loc5_ = int(_loc4_[0]);
               _loc6_ = int(_loc4_[1]);
               if(_loc6_ == 1 || _loc6_ == 3)
               {
                  this.senderProxy.send_72703(_loc5_);
               }
               else if(_loc6_ == 2)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.xinnianzhufu))
                  {
                     POPWindowManager.showWindow(GameInstance.uiInstance.xinnianzhufu);
                     GameInstance.uiInstance.xinnianzhufu.setPlayerID(_loc5_);
                  }
               }
               else if(_loc6_ == 4)
               {
                  PipeManager.sendMsg(PipeConstants.SEND_53095,[24,_loc5_]);
               }
               break;
            case QingRenJie_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_FANGRUBTN_CLICK:
               this.changeMouseStatus();
               this.openBackpack();
               break;
            case QingRenJie_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_SONGHUABTN_CLICK:
               _loc7_ = _loc2_.data as Array;
               this.senderProxy.send_72705(_loc7_);
               this.resumMouseStatus();
               break;
            case QingRenJie_ChaXunWanJiaPanel.UI_38HUODONG_CHAXUNWANJIA_SNOGHUA_CLICK:
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
               else if(_loc8_[1] == 8)
               {
                  this.senderProxy.send_82465([_loc8_[0]]);
               }
               else if(_loc8_[1] == 9)
               {
                  this.senderProxy.send_82485([_loc8_[0]]);
               }
               else if(_loc8_[1] == 10)
               {
                  this.senderProxy.send_83095([_loc8_[0]]);
               }
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
   }
}

