package com.tgame.moudels.timebaozang.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.timebaozang.TimeBaoZang_ApplicationFacade;
   import com.tgame.moudels.timebaozang.model.TimeBaoZang_MsgSenderProxy;
   import com.tgame.shell.view.components.huodong.timeBaozangPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class TimeBaoZang_Mediator extends Mediator
   {
      
      public static const NAME:String = "TimeBaoZang_Mediator";
      
      private var _senderProxy:TimeBaoZang_MsgSenderProxy;
      
      public function TimeBaoZang_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : TimeBaoZang_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(TimeBaoZang_MsgSenderProxy.NAME) as TimeBaoZang_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get mainTimebaozangPlane() : timeBaozangPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.timeBaozhang);
         }
         return viewComponent as timeBaozangPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [TimeBaoZang_ApplicationFacade.SHOW_TIMEBAOZANG_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case TimeBaoZang_ApplicationFacade.SHOW_TIMEBAOZANG_PANEL:
               this.senderProxy.send_60911();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(timeBaozangPanel,function():void
         {
            mainTimebaozangPlane.addEventListener(timeBaozangPanel.UI_TIMEBAOZANG_DUIHUAN_CLICK,handler);
            mainTimebaozangPlane.addEventListener(timeBaozangPanel.UI_TIMEBAOZANG_CLOSE_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(timeBaozangPanel,function():void
         {
            mainTimebaozangPlane.removeEventListener(timeBaozangPanel.UI_TIMEBAOZANG_DUIHUAN_CLICK,handler);
            mainTimebaozangPlane.removeEventListener(timeBaozangPanel.UI_TIMEBAOZANG_CLOSE_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:int = 0;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case timeBaozangPanel.UI_TIMEBAOZANG_DUIHUAN_CLICK:
               _loc3_ = _loc2_.data as int;
               this.senderProxy.send_60913(_loc3_);
               break;
            case timeBaozangPanel.UI_TIMEBAOZANG_CLOSE_CLICK:
               this.senderProxy.send_60915();
         }
      }
      
      public function updateTimeBaoZangPanel(param1:Array, param2:int) : void
      {
         var _loc4_:Object = null;
         var _loc5_:XML = null;
         var _loc6_:Goods = null;
         var _loc7_:Goods = null;
         this.mainTimebaozangPlane.setTime(param2);
         var _loc3_:XML = <list/>;
         for each(_loc4_ in param1)
         {
            _loc5_ = <node mallId="商城id" goodsId="商品id" bigRes="小图标地址" goodsName="商品名称" goodsNum="商品数量" describe="物品描述最多25字" spId="碎片id" spName="碎片名称" spNum="碎片数量"/>;
            _loc6_ = new Goods(_loc4_.goodsId);
            _loc7_ = new Goods(_loc4_.spID);
            _loc5_.@mallId = _loc4_.mallId;
            _loc5_.@goodsId = _loc6_.id;
            _loc5_.@bigRes = _loc6_.getBigICOPath();
            _loc5_.@goodsName = _loc6_.res.name;
            _loc5_.@goodsNum = _loc4_.goodsNum;
            _loc5_.@describe = _loc6_.res.desc;
            _loc5_.@spId = _loc7_.id;
            _loc5_.@spName = _loc7_.res.name;
            _loc5_.@spNum = _loc4_.spNum;
            _loc3_.appendChild(_loc5_);
         }
         this.mainTimebaozangPlane.setList(_loc3_);
      }
      
      public function onClosePanel() : void
      {
         this.mainTimebaozangPlane.closePanel();
      }
   }
}

