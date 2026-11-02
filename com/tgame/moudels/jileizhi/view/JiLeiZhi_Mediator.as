package com.tgame.moudels.jileizhi.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.jileizhi.model.JiLeiZhi_MsgSenderProxy;
   import com.tgame.shell.view.components.JiLeiZhiPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class JiLeiZhi_Mediator extends Mediator
   {
      
      public static const NAME:String = "JiLeiZhi_Mediator";
      
      private var lingType:int;
      
      private var _senderProxy:JiLeiZhi_MsgSenderProxy;
      
      public function JiLeiZhi_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : JiLeiZhi_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(JiLeiZhi_MsgSenderProxy.NAME) as JiLeiZhi_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get jileizhiPanel() : JiLeiZhiPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.jileizhi);
         }
         return viewComponent as JiLeiZhiPanel;
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
         UIEventsRegisterManager.addUIRegisterEvent(JiLeiZhiPanel,function():void
         {
            jileizhiPanel.addEventListener(Event.ADDED_TO_STAGE,handler);
            jileizhiPanel.addEventListener(JiLeiZhiPanel.UI_JILEIZHI_DUIHUAN_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(JiLeiZhiPanel,function():void
         {
            jileizhiPanel.removeEventListener(Event.ADDED_TO_STAGE,handler);
            jileizhiPanel.removeEventListener(JiLeiZhiPanel.UI_JILEIZHI_DUIHUAN_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc4_:Object = null;
         var _loc2_:String = param1.type;
         var _loc3_:BaseEvent = param1 as BaseEvent;
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.data;
         }
         switch(_loc2_)
         {
            case Event.ADDED_TO_STAGE:
               this.senderProxy.send_12131();
               break;
            case JiLeiZhiPanel.UI_JILEIZHI_DUIHUAN_CLICK:
               this.senderProxy.send_12133(_loc4_);
         }
      }
      
      public function setInit(param1:Array, param2:int, param3:String, param4:String) : void
      {
         var _loc7_:Goods = null;
         var _loc5_:Object = new Object();
         var _loc6_:XML = <list/>;
         for each(_loc5_ in param1)
         {
            _loc7_ = new Goods(_loc5_.goodid);
            _loc6_.appendChild(<node id={_loc5_.id} goodid={_loc5_.goodid} bigRes={_loc7_.getBigICOPath()} num={_loc5_.num} desc={_loc5_.desc} price={_loc5_.price}/>);
         }
         this.jileizhiPanel.setInitialize(param2,_loc6_,param3,param4);
      }
      
      public function showPanel() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.jileizhi))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_JILEIZHI_PANEL);
         }
      }
   }
}

