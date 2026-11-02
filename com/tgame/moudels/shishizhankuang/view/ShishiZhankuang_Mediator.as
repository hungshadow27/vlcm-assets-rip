package com.tgame.moudels.shishizhankuang.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.shishizhankuang.model.Shishizhankuang_MsgSenderProxy;
   import com.tgame.shell.view.components.ShishiZhankuangPanel;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ShishiZhankuang_Mediator extends Mediator
   {
      
      public static const NAME:String = "ShishiZhankuang_Mediator";
      
      private var _msgSenderProxy:Shishizhankuang_MsgSenderProxy;
      
      public function ShishiZhankuang_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : Shishizhankuang_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Shishizhankuang_MsgSenderProxy.NAME) as Shishizhankuang_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      protected function get shiShiZhanKuangPanel() : ShishiZhankuangPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.shiShiZhanKuangPanel);
         }
         return viewComponent as ShishiZhankuangPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ShishiZhankuangPanel,function():void
         {
            shiShiZhanKuangPanel.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ShishiZhankuangPanel,function():void
         {
            shiShiZhanKuangPanel.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
         });
      }
      
      private function onAddToStage(param1:Event) : void
      {
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case Event.ADDED_TO_STAGE:
               this.msgSenderProxy.send_51963();
         }
      }
      
      public function setShishiZhanKuangPanelData(param1:int, param2:int, param3:int, param4:int, param5:Array, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Number, param12:Array) : void
      {
         if(!Fun.isVisible(this.shiShiZhanKuangPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_SHI_SHI_ZHAN_KUANG);
         }
         this.shiShiZhanKuangPanel.setJifen(param1,param2);
         this.shiShiZhanKuangPanel.setRenshu(param3,param4);
         this.shiShiZhanKuangPanel.setData(param5);
         this.shiShiZhanKuangPanel.setBossHP(param8,param9,param10,param11);
         this.shiShiZhanKuangPanel.setBossSta(param6,param7);
         this.shiShiZhanKuangPanel.setQianfenSta(param12);
      }
   }
}

