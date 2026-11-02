package com.tgame.moudels.yuncheng.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.yuncheng.model.YunCheng_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.utils.setTimeout;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YunCheng_Mediator extends Mediator
   {
      
      public static const NAME:String = "YunCheng_Mediator";
      
      public var no:int = 0;
      
      private var arrZodiac:Array = new Array();
      
      private var _msgSenderProxy:YunCheng_MsgSenderProxy;
      
      public function YunCheng_Mediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : YunCheng_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(YunCheng_MsgSenderProxy.NAME) as YunCheng_MsgSenderProxy;
         }
         return this._msgSenderProxy;
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
         UIEventsRegisterManager.addUIRegisterEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETYUNCHENG,requestYunChengInfoHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.YUNCHENG_JIHUO,requestYunChengJiHuoHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETYUNCHENG,requestYunChengInfoHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.YUNCHENG_JIHUO,requestYunChengJiHuoHandler);
         });
      }
      
      private function requestYunChengInfoHandler(param1:Event) : void
      {
         this.msgSenderProxy.send_54201();
      }
      
      private function requestYunChengJiHuoHandler(param1:BaseEvent) : void
      {
         this.no = int(param1.data);
         this.msgSenderProxy.send_54203(this.no);
      }
      
      public function refillYunChengData(param1:int, param2:Boolean, param3:Array) : void
      {
         var n:int = param1;
         var isYunchengJihuo:Boolean = param2;
         var r:Array = param3;
         if(this.arrZodiac.length < 12)
         {
            return;
         }
         this.mainCharArrtibutePlane.setMcYuncheng(n);
         this.arrZodiac[n - 1].zhuangtai = 2;
         if(n < 12)
         {
            this.arrZodiac[n].zhuangtai = 1;
         }
         setTimeout(function():void
         {
            updateYunChengPanel(arrZodiac,isYunchengJihuo,r);
         },500);
      }
      
      public function updateYunChengPanel(param1:Array, param2:Boolean, param3:Array, param4:int = -1, param5:int = 0, param6:Number = 0) : void
      {
         this.arrZodiac = param1;
         this.mainCharArrtibutePlane.setYunInitializeYuncheng(this.arrZodiac,param5,param6);
         if(param4 >= 1 && param4 <= 12)
         {
            this.mainCharArrtibutePlane.setTime(param4);
         }
         this.mainCharArrtibutePlane.showYunCheng();
         this.mainCharArrtibutePlane.setYunchengJihuo(param2,param3);
         var _loc7_:Array = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_YUNCHENG_SHENGXIAOFUBENLING] != undefined)
         {
            _loc7_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_YUNCHENG_SHENGXIAOFUBENLING]);
         }
         this.mainCharArrtibutePlane.set_YunCheng(_loc7_);
      }
      
      public function setYunChengZuoQi(param1:Boolean, param2:Boolean) : void
      {
         this.mainCharArrtibutePlane.setYunChengZuoQi(param1,param2);
      }
   }
}

