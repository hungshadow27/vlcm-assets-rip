package com.tgame.moudels.jiangshanshejishizhixinxi.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.shell.view.components.HuangTuBaYeChaKanXinXiPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class JiangShangSheJiShiZHiXinXI_Mediator extends Mediator
   {
      
      public static const NAME:String = "JiangShangSheJiShiZHiXinXI_Mediator";
      
      public function JiangShangSheJiShiZHiXinXI_Mediator()
      {
         super(NAME);
      }
      
      protected function get panel() : HuangTuBaYeChaKanXinXiPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.huangTuBaYeChaKanXinXiPanel);
         }
         return viewComponent as HuangTuBaYeChaKanXinXiPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:String = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(HuangTuBaYeChaKanXinXiPanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,handler);
            panel.addEventListener(HuangTuBaYeChaKanXinXiPanel.UI_HUANGTUBAYE_CHAKAN_FANYE,handler);
            panel.addEventListener(HuangTuBaYeChaKanXinXiPanel.UI_HUANGTUBAYE_CHENGCHISHIZHI_FANYE,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(HuangTuBaYeChaKanXinXiPanel,function():void
         {
            panel.removeEventListener(HuangTuBaYeChaKanXinXiPanel.UI_HUANGTUBAYE_CHAKAN_FANYE,handler);
            panel.removeEventListener(HuangTuBaYeChaKanXinXiPanel.UI_HUANGTUBAYE_CHENGCHISHIZHI_FANYE,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               break;
            case HuangTuBaYeChaKanXinXiPanel.UI_HUANGTUBAYE_CHAKAN_FANYE:
               _loc3_ = _loc2_.data as int;
               PipeManager.sendMsg(PipeConstants.QINGQIUJIANGSHANSHEJI_CHAKANXINXI_FANYE,_loc3_);
               break;
            case HuangTuBaYeChaKanXinXiPanel.UI_HUANGTUBAYE_CHENGCHISHIZHI_FANYE:
               _loc4_ = _loc2_.data as Array;
               PipeManager.sendMsg(PipeConstants.QINGIUCHENGCHISHIZHI_CHAKANXINXI_FANYE,_loc4_);
         }
      }
   }
}

