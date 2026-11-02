package com.tgame.moudels.ganjiangmoye.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.ganjiangmoye.model.GanJiangMoYe_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class GanJiangMoYe_Mediator extends Mediator
   {
      
      public static const NAME:String = "GanJiangMoYe_Mediator";
      
      private var _senderProxy:GanJiangMoYe_MsgSenderProxy;
      
      public function GanJiangMoYe_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : GanJiangMoYe_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(GanJiangMoYe_MsgSenderProxy.NAME) as GanJiangMoYe_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get mainCharArrtibutePlane() : CharAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.charAttribute);
         }
         return viewComponent as CharAttribute;
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
         UIEventsRegisterManager.addUIRegisterEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.addEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETGANJIANGMOYE,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_GANJIANGMOYE_DUANZAO_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_GANJIANGMOYE_HUANHUA_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETGANJIANGMOYE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_GANJIANGMOYE_DUANZAO_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_GANJIANGMOYE_HUANHUA_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.REMOVED_FROM_STAGE:
               this.setGuan();
               break;
            case CharAttribute.GETGANJIANGMOYE:
               this.senderProxy.send_61013(-1);
               break;
            case CharAttribute.UI_GANJIANGMOYE_DUANZAO_CLICK:
               this.senderProxy.send_61017(_loc2_.data);
               this.senderProxy.send_61013(-1);
               break;
            case CharAttribute.UI_GANJIANGMOYE_HUANHUA_CLICK:
               this.senderProxy.send_61015(_loc2_.data);
               this.senderProxy.send_61013(-1);
         }
      }
      
      public function setPanel(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int, param13:int, param14:int, param15:Boolean, param16:Boolean, param17:Boolean, param18:Boolean, param19:Boolean) : void
      {
         this.mainCharArrtibutePlane.showGanJiangMoYe();
         var _loc20_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param11,true);
         this.mainCharArrtibutePlane.setinitilizeUI(true,param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,_loc20_,param12,param13,param14,param15,param16,param17,param18,param19);
         var _loc21_:Array = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_GANJIANGMOYE_RIYUESHENJIAN] != undefined)
         {
            _loc21_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_GANJIANGMOYE_RIYUESHENJIAN]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_GANJIANGMOYE_XIALVTUMO] != undefined)
         {
            _loc21_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_GANJIANGMOYE_XIALVTUMO]);
         }
         this.mainCharArrtibutePlane.set_GanJiangMoYe(_loc21_);
      }
      
      public function gouxuan(param1:Boolean, param2:Boolean) : void
      {
         this.mainCharArrtibutePlane.GjMygouxuan(param1,param2);
      }
      
      public function setHuanHua(param1:int, param2:int) : void
      {
         this.mainCharArrtibutePlane.setDuiJianWaiXing(param1,param2);
      }
      
      public function setQiangHua(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : void
      {
         this.mainCharArrtibutePlane.setShuxingJiacheng(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setGuan() : void
      {
         this.mainCharArrtibutePlane.setGuan();
      }
      
      public function sucess_zhuzao(param1:int) : void
      {
         if(param1 == 1)
         {
            this.mainCharArrtibutePlane.setQiangHuaYanHua(true);
         }
         else
         {
            this.mainCharArrtibutePlane.setQiangHuaYanHua(false);
         }
      }
   }
}

