package com.tgame.moudels.qingrenjiesonghuabang.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.qingrenjiesonghuabang.model.QingRenJieSongHuaBang_MsgSenderProxy;
   import com.tgame.shell.view.components.QingRenJie_SongHuaBangPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class QingRenJieSongHuaBang_Mediator extends Mediator
   {
      
      public static const NAME:String = "QingRenJieSongHuaBang_Mediator";
      
      public function QingRenJieSongHuaBang_Mediator(param1:String = null, param2:Object = null)
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
      
      public function get panel() : QingRenJie_SongHuaBangPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.qingrenjieSongHuaBangPanel);
         }
         return viewComponent as QingRenJie_SongHuaBangPanel;
      }
      
      public function get senderProxy() : QingRenJieSongHuaBang_MsgSenderProxy
      {
         return facade.retrieveProxy(QingRenJieSongHuaBang_MsgSenderProxy.NAME) as QingRenJieSongHuaBang_MsgSenderProxy;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(QingRenJie_SongHuaBangPanel,function():void
         {
            panel.addEventListener(QingRenJie_SongHuaBangPanel.UI_QINGRENJIESONGHUABANG_SHOW_NANSHENBANG,panelHandle);
            panel.addEventListener(QingRenJie_SongHuaBangPanel.UI_QINGRENJIESONGHUABANG_SHOW_NVSHENBANG,panelHandle);
            panel.addEventListener(QingRenJie_SongHuaBangPanel.UI_QINGRENJIESONGHUABANG_SHANGYIYE_CLICK,panelHandle);
            panel.addEventListener(QingRenJie_SongHuaBangPanel.UI_QINGRENJIESONGHUABANG_XIAYIYE_CLICK,panelHandle);
            panel.addEventListener(QingRenJie_SongHuaBangPanel.UI_QINGRENJIESONGHUABANG_BIANSHEN_CLICK,panelHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(QingRenJie_SongHuaBangPanel,function():void
         {
            panel.removeEventListener(QingRenJie_SongHuaBangPanel.UI_QINGRENJIESONGHUABANG_SHOW_NANSHENBANG,panelHandle);
            panel.removeEventListener(QingRenJie_SongHuaBangPanel.UI_QINGRENJIESONGHUABANG_SHOW_NVSHENBANG,panelHandle);
            panel.removeEventListener(QingRenJie_SongHuaBangPanel.UI_QINGRENJIESONGHUABANG_SHANGYIYE_CLICK,panelHandle);
            panel.removeEventListener(QingRenJie_SongHuaBangPanel.UI_QINGRENJIESONGHUABANG_XIAYIYE_CLICK,panelHandle);
            panel.removeEventListener(QingRenJie_SongHuaBangPanel.UI_QINGRENJIESONGHUABANG_BIANSHEN_CLICK,panelHandle);
         });
      }
      
      private function panelHandle(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case QingRenJie_SongHuaBangPanel.UI_QINGRENJIESONGHUABANG_SHOW_NANSHENBANG:
               this.senderProxy.send_72707([1,1]);
               break;
            case QingRenJie_SongHuaBangPanel.UI_QINGRENJIESONGHUABANG_SHOW_NVSHENBANG:
               this.senderProxy.send_72707([0,1]);
               break;
            case QingRenJie_SongHuaBangPanel.UI_QINGRENJIESONGHUABANG_SHANGYIYE_CLICK:
               _loc3_ = _loc2_.data as Array;
               this.senderProxy.send_72707(_loc3_);
               break;
            case QingRenJie_SongHuaBangPanel.UI_QINGRENJIESONGHUABANG_XIAYIYE_CLICK:
               _loc3_ = _loc2_.data as Array;
               this.senderProxy.send_72707(_loc3_);
               break;
            case QingRenJie_SongHuaBangPanel.UI_QINGRENJIESONGHUABANG_BIANSHEN_CLICK:
               _loc4_ = _loc2_.data as Array;
               this.senderProxy.send_72709(_loc4_);
         }
      }
      
      public function setSonghuabang(param1:Array, param2:Number, param3:int, param4:int) : void
      {
         this.panel.setInitialize(param1,param2,param3,param4);
      }
   }
}

