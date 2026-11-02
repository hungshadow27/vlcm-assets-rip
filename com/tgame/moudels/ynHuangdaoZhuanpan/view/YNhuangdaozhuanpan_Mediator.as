package com.tgame.moudels.ynHuangdaoZhuanpan.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.ynHuangdaoZhuanpan.model.YNhuangdaozhuanpan_MsgSendProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YNhuangdaozhuanpan_Mediator extends Mediator
   {
      
      public static const NAME:String = "YNhuangdaozhuanpan_Mediator";
      
      private var _senderProxy:YNhuangdaozhuanpan_MsgSendProxy;
      
      private var playID:int = -1;
      
      public function YNhuangdaozhuanpan_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      private function get senderProxy() : YNhuangdaozhuanpan_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YNhuangdaozhuanpan_MsgSendProxy.NAME) as YNhuangdaozhuanpan_MsgSendProxy;
         }
         return this._senderProxy;
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
      
      public function get panel() : CharAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.charAttribute);
         }
         return viewComponent as CharAttribute;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(CharAttribute,function():void
         {
            panel.addEventListener(CharAttribute.REQUEST_YNHUANGDAO,onHandle);
            panel.addEventListener(CharAttribute.REQUEST_ZHUANPAN,onHandle);
            panel.addEventListener(CharAttribute.REQUEST_WZZB,onHandle);
            panel.addEventListener(CharAttribute.REQUEST_FSZB,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            panel.removeEventListener(CharAttribute.REQUEST_YNHUANGDAO,onHandle);
            panel.removeEventListener(CharAttribute.REQUEST_ZHUANPAN,onHandle);
            panel.removeEventListener(CharAttribute.REQUEST_WZZB,onHandle);
            panel.removeEventListener(CharAttribute.REQUEST_FSZB,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case CharAttribute.REQUEST_YNHUANGDAO:
               this.senderProxy.send_74275([-1,1]);
               break;
            case CharAttribute.REQUEST_ZHUANPAN:
               this.senderProxy.send_74275([-1,2]);
               break;
            case CharAttribute.REQUEST_WZZB:
               this.senderProxy.send_74275([-1,3]);
               break;
            case CharAttribute.REQUEST_FSZB:
               this.senderProxy.send_74275([-1,4]);
         }
      }
      
      public function showCharAttribute_Huangdao(param1:int, param2:Array, param3:int) : void
      {
         var _loc6_:Object = null;
         this.playID = param1;
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.panel.showHuangdao();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.panel);
         }
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < ItemPositionRange.POSITION_YUENAN_HUANGDAO_ID.length)
         {
            _loc6_ = new Object();
            _loc6_.id = ItemPositionRange.POSITION_YUENAN_HUANGDAO_ID[_loc5_][0];
            _loc6_.position = ItemPositionRange.POSITION_YUENAN_HUANGDAO_ID[_loc5_][1];
            _loc6_.state = param2[_loc5_];
            _loc4_.push(_loc6_);
            _loc5_++;
         }
         this.panel.setHuangdaoItems(_loc4_,param3,param1,1);
         this.panel.showHuangdao();
      }
      
      public function showCharAttribute_Zhuanpan(param1:int, param2:Array, param3:int) : void
      {
         var _loc6_:Object = null;
         this.playID = param1;
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.panel.showZhuanpan();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.panel);
         }
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < ItemPositionRange.POSITION_YUENAN_ZHUANPAN_ID.length)
         {
            _loc6_ = new Object();
            _loc6_.id = ItemPositionRange.POSITION_YUENAN_ZHUANPAN_ID[_loc5_][0];
            _loc6_.position = ItemPositionRange.POSITION_YUENAN_ZHUANPAN_ID[_loc5_][1];
            _loc6_.state = param2[_loc5_];
            _loc4_.push(_loc6_);
            _loc5_++;
         }
         this.panel.setZhuanpanItems(_loc4_,param3,param1,2);
         this.panel.showZhuanpan();
      }
      
      public function showCharAttribute_WZZB(param1:int, param2:Array, param3:int, param4:Array) : void
      {
         var _loc7_:Object = null;
         this.playID = param1;
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.panel.showWZZB();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.panel);
         }
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < 12)
         {
            _loc7_ = new Object();
            _loc7_.id = param4[_loc6_];
            _loc7_.position = ItemPositionRange.POSITION_YUENAN_ZHUANPAN_POSITION[_loc6_];
            _loc7_.state = param2[_loc6_];
            _loc5_.push(_loc7_);
            _loc6_++;
         }
         this.panel.setWZZBItems(_loc5_,param3,param1,3);
         this.panel.showWZZB();
      }
      
      public function showCharAttribute_FSZB(param1:int, param2:Array, param3:int, param4:Array) : void
      {
         var _loc7_:Object = null;
         this.playID = param1;
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.panel.showFSZB();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.panel);
         }
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < param4.length)
         {
            _loc7_ = new Object();
            _loc7_.id = param4[_loc6_];
            _loc7_.position = ItemPositionRange.POSITION_YUENAN_ZHUANPAN_POSITION[_loc6_];
            _loc7_.state = param2[_loc6_];
            _loc5_.push(_loc7_);
            _loc6_++;
         }
         this.panel.setFSZBItems(_loc5_,param3,param1,4);
         this.panel.showFSZB();
      }
   }
}

