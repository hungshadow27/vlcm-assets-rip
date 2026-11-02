package com.tgame.moudels.kuafuLeitai.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.kuafuLeitai.model.KuafuLeitai_MsgSenderProxy;
   import com.tgame.shell.view.components.KuaFuLeiTaiPanel;
   import com.tgame.shell.view.components.kuafuleitai.KuafuleitaiResultPanel;
   import com.tgame.shell.view.components.kuafuleitai.KuafuleitaiShuomingPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class KuafuLeitai_Mediator extends Mediator
   {
      
      public static const NAME:String = "KuafuLeitai_Mediator";
      
      private var leitai:KuafuleitaiShuomingPanel;
      
      private var jieguoXml:XML;
      
      private var _msg_sender:KuafuLeitai_MsgSenderProxy;
      
      public function KuafuLeitai_Mediator()
      {
         super(NAME);
      }
      
      private function get msg_sender() : KuafuLeitai_MsgSenderProxy
      {
         if(!this._msg_sender)
         {
            this._msg_sender = facade.retrieveProxy(KuafuLeitai_MsgSenderProxy.NAME) as KuafuLeitai_MsgSenderProxy;
         }
         return this._msg_sender;
      }
      
      protected function get leitaiPanel() : KuafuleitaiResultPanel
      {
         return GameInstance.uiInstance.kuafuleitaiResultPanel;
      }
      
      protected function get panel() : KuaFuLeiTaiPanel
      {
         return GameInstance.uiInstance.kuaFuLeiTaiPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(KuaFuLeiTaiPanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,addToStage);
            panel.addEventListener(KuaFuLeiTaiPanel.LEITAIBUTTON_CLICK,mainCharArrtibutePlaneHandle);
            panel.addEventListener(KuaFuLeiTaiPanel.JINRULEITAI,mainCharArrtibutePlaneHandle);
            panel.addEventListener(KuaFuLeiTaiPanel.KUAFUBAOGUO,mainCharArrtibutePlaneHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(KuaFuLeiTaiPanel,function():void
         {
            panel.removeEventListener(Event.ADDED_TO_STAGE,addToStage);
            panel.addEventListener(KuaFuLeiTaiPanel.LEITAIBUTTON_CLICK,mainCharArrtibutePlaneHandle);
            panel.addEventListener(KuaFuLeiTaiPanel.JINRULEITAI,mainCharArrtibutePlaneHandle);
            panel.addEventListener(KuaFuLeiTaiPanel.KUAFUBAOGUO,mainCharArrtibutePlaneHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(KuafuleitaiResultPanel,function():void
         {
            leitaiPanel.addEventListener(Event.ADDED_TO_STAGE,addToStageJieguo);
            leitaiPanel.addEventListener(KuafuleitaiResultPanel.LEAVE_LEITAI,mainCharArrtibutePlaneHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(KuafuleitaiResultPanel,function():void
         {
            leitaiPanel.removeEventListener(Event.ADDED_TO_STAGE,addToStageJieguo);
            leitaiPanel.addEventListener(KuafuleitaiResultPanel.LEAVE_LEITAI,mainCharArrtibutePlaneHandle);
         });
      }
      
      private function addToStage(param1:Event) : void
      {
         this.msg_sender.send_54551();
      }
      
      private function addToStageJieguo(param1:Event) : void
      {
         this.leitaiPanel.setResultList(this.jieguoXml);
      }
      
      private function mainCharArrtibutePlaneHandle(param1:Event) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case KuaFuLeiTaiPanel.LEITAIBUTTON_CLICK:
               _loc3_ = int((param1 as BaseEvent).data as String);
               this.msg_sender.send_54553(_loc3_);
               break;
            case KuaFuLeiTaiPanel.JINRULEITAI:
               _loc4_ = int((param1 as BaseEvent).data as int);
               this.msg_sender.send_54555(_loc4_);
               break;
            case KuaFuLeiTaiPanel.KUAFUBAOGUO:
               PipeManager.sendMsg(PipeConstants.MAINUI_KUAFU_GUIZHE_QUERY,3);
               if(!Fun.isVisible(GameInstance.uiInstance._backpack))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
               }
               if(!Fun.isVisible(GameInstance.uiInstance._kuafuLunjianBackpack))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_KUAFU_BACKPACK);
               }
               ResizeManager.showDoublePanel(GameInstance.uiInstance.kuafuLunjianBackpack,GameInstance.uiInstance.backpack);
               break;
            case KuafuleitaiResultPanel.LEAVE_LEITAI:
               PipeManager.sendMsg(PipeConstants.LIKAI_KUAFU_LEITAI);
         }
      }
      
      public function setBiaoqian(param1:Array) : void
      {
         this.panel.setLeftButtons(param1);
      }
      
      public function setData(param1:XML) : void
      {
         this.panel.setLeiTaiData(param1);
      }
      
      public function settime1(param1:int) : void
      {
         this.panel.setDaojishi(param1);
      }
      
      public function settime2(param1:Number, param2:Number) : void
      {
         this.panel.setShijianduan(param1,param2);
      }
      
      public function showGuizhe() : void
      {
         if(!this.leitai)
         {
            this.leitai = new KuafuleitaiShuomingPanel();
         }
         this.leitai.visible = true;
         GameInstance.uiInstance.uiContainer.addChild(this.leitai);
         this.leitai.x = (GameConfig.sceneWidth - this.leitai.width) / 2;
         this.leitai.y = (GameConfig.sceneHeight - this.leitai.height) / 2;
      }
      
      public function setJieguo(param1:XML) : void
      {
         this.jieguoXml = param1;
         PipeManager.sendMsg(PipeConstants.SHOW_KUAFU_LEITAI_JIEGUO);
      }
   }
}

