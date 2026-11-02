package com.tgame.moudels.huangtubaye.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.huangtubaye.HuangTuBaYe_ApplicationFacade;
   import com.tgame.moudels.huangtubaye.model.HuangTuBaYe_MsgSenderProxy;
   import com.tgame.shell.view.components.HuangTuBaYePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class HuangTuBaYe_Mediator extends Mediator
   {
      
      public static const NAME:String = "HuangTuBaYe_Mediator";
      
      private var _senderProxy:HuangTuBaYe_MsgSenderProxy;
      
      public function HuangTuBaYe_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : HuangTuBaYe_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(HuangTuBaYe_MsgSenderProxy.NAME) as HuangTuBaYe_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get panel() : HuangTuBaYePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.huangTuBaYePanel);
         }
         return viewComponent as HuangTuBaYePanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [HuangTuBaYe_ApplicationFacade.QINGQIUJINRU_HANGTUPAYE_ZHANCHANG,HuangTuBaYe_ApplicationFacade.QINGQIUJIANGSHANSHEJI_CHAKANXINXI_FANYE,HuangTuBaYe_ApplicationFacade.QINGQIUJINRU_HANGTUPAYE_ZHANCHANG,HuangTuBaYe_ApplicationFacade.SEND_XIANJING];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case HuangTuBaYe_ApplicationFacade.QINGQIUJINRU_HANGTUPAYE_ZHANCHANG:
               this.senderProxy.send_71013(_loc2_ as int);
               break;
            case HuangTuBaYe_ApplicationFacade.QINGQIUJIANGSHANSHEJI_CHAKANXINXI_FANYE:
               this.senderProxy.send_71005(_loc2_ as int);
               break;
            case HuangTuBaYe_ApplicationFacade.SEND_XIANJING:
               _loc3_ = (_loc2_ as String).split(",");
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  this.senderProxy.send_71053(parseInt(_loc3_[_loc4_]));
                  _loc4_++;
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(HuangTuBaYePanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,handler);
            panel.addEventListener(HuangTuBaYePanel.UI_HUANGTUBAYE_SHOW_ZHENGZHANSIFANG,handler);
            panel.addEventListener(HuangTuBaYePanel.UI_HUANGTUBAYE_ZHENGZHANSIFANG_JINRU,handler);
            panel.addEventListener(HuangTuBaYePanel.UI_HUANGTUBAYE_SHOW_JIANGSHANSHEJI,handler);
            panel.addEventListener(HuangTuBaYePanel.UI_HUANGTUBAYE_JIANGSHANSHEJI_CHAKAN,handler);
            panel.addEventListener(HuangTuBaYePanel.UI_HUANGTUBAYE_CHAKAN_FANYE,handler);
            panel.addEventListener(HuangTuBaYePanel.UI_HUANGTUBAYE_JIANGSHANSHEJI_MOBAI,handler);
            panel.addEventListener(HuangTuBaYePanel.UI_HUANGTUBAYE_JIANGSHANSHEJI_LINGQU,handler);
            panel.addEventListener(HuangTuBaYePanel.UI_HUANGTUBAYE_JIANGSHANSHEJI_JIANGLI,handler);
            panel.addEventListener(HuangTuBaYePanel.UI_HUANGTUBAYE_ZHENGZHANSIFANG_JIHUOLONGMAI,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(HuangTuBaYePanel,function():void
         {
            panel.removeEventListener(HuangTuBaYePanel.UI_HUANGTUBAYE_SHOW_ZHENGZHANSIFANG,handler);
            panel.removeEventListener(HuangTuBaYePanel.UI_HUANGTUBAYE_ZHENGZHANSIFANG_JINRU,handler);
            panel.removeEventListener(HuangTuBaYePanel.UI_HUANGTUBAYE_SHOW_JIANGSHANSHEJI,handler);
            panel.removeEventListener(HuangTuBaYePanel.UI_HUANGTUBAYE_JIANGSHANSHEJI_CHAKAN,handler);
            panel.removeEventListener(HuangTuBaYePanel.UI_HUANGTUBAYE_CHAKAN_FANYE,handler);
            panel.removeEventListener(HuangTuBaYePanel.UI_HUANGTUBAYE_JIANGSHANSHEJI_MOBAI,handler);
            panel.removeEventListener(HuangTuBaYePanel.UI_HUANGTUBAYE_JIANGSHANSHEJI_LINGQU,handler);
            panel.removeEventListener(HuangTuBaYePanel.UI_HUANGTUBAYE_JIANGSHANSHEJI_JIANGLI,handler);
            panel.removeEventListener(HuangTuBaYePanel.UI_HUANGTUBAYE_ZHENGZHANSIFANG_JIHUOLONGMAI,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               this.senderProxy.send_71001();
               break;
            case HuangTuBaYePanel.UI_HUANGTUBAYE_SHOW_ZHENGZHANSIFANG:
               this.senderProxy.send_71001();
               break;
            case HuangTuBaYePanel.UI_HUANGTUBAYE_ZHENGZHANSIFANG_JINRU:
               this.senderProxy.send_71013(_loc2_.data);
               break;
            case HuangTuBaYePanel.UI_HUANGTUBAYE_ZHENGZHANSIFANG_JIHUOLONGMAI:
               PipeManager.sendMsg(PipeConstants.QINGQIUJIHUO_LONGMAI,_loc2_.data);
               break;
            case HuangTuBaYePanel.UI_HUANGTUBAYE_SHOW_JIANGSHANSHEJI:
               this.senderProxy.send_71003();
               break;
            case HuangTuBaYePanel.UI_HUANGTUBAYE_JIANGSHANSHEJI_CHAKAN:
               PipeManager.sendMsg(PipeConstants.SHOW_JIANGSHANSHEJI_CHAKAN_PLANE);
               this.senderProxy.send_71005(1);
               break;
            case HuangTuBaYePanel.UI_HUANGTUBAYE_CHAKAN_FANYE:
               this.senderProxy.send_71005(_loc2_.data);
               break;
            case HuangTuBaYePanel.UI_HUANGTUBAYE_JIANGSHANSHEJI_MOBAI:
               this.senderProxy.send_71007();
               break;
            case HuangTuBaYePanel.UI_HUANGTUBAYE_JIANGSHANSHEJI_LINGQU:
               this.senderProxy.send_71009();
               break;
            case HuangTuBaYePanel.UI_HUANGTUBAYE_JIANGSHANSHEJI_JIANGLI:
               this.senderProxy.send_71011();
         }
      }
      
      public function setPanel(param1:Array) : void
      {
         this.panel.setinitilizeUI(param1);
         this.panel.showZhengZhanSiFang();
      }
      
      public function setJiangShanPanel(param1:String, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Array) : void
      {
         this.panel.isJiangShanSheJi(param1,param2,param3,param4,param5,param6,param7);
         this.panel.showJiangShanSheJi();
      }
      
      public function setXinXiPanel(param1:Array, param2:int, param3:int) : void
      {
         this.panel.isJiangShanSheJiXinXi(param1,param2,param3);
      }
      
      public function setJiangLiPanel(param1:Array) : void
      {
         this.panel.isJiangShanSheJiJiangLi(param1);
      }
   }
}

