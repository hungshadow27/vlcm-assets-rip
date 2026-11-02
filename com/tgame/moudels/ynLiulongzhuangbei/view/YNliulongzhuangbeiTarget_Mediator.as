package com.tgame.moudels.ynLiulongzhuangbei.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.ynLiulongzhuangbei.model.YNliulongzhuangbei_MsgSendProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YNliulongzhuangbeiTarget_Mediator extends Mediator
   {
      
      public static const NAME:String = "YNliulongzhuangbeiTarget_Mediator";
      
      private var _senderProxy:YNliulongzhuangbei_MsgSendProxy;
      
      private var playID:int = -1;
      
      public function YNliulongzhuangbeiTarget_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      private function get senderProxy() : YNliulongzhuangbei_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YNliulongzhuangbei_MsgSendProxy.NAME) as YNliulongzhuangbei_MsgSendProxy;
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
      
      public function get panel() : TargetAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.targetAttribute);
         }
         return viewComponent as TargetAttribute;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            panel.addEventListener(TargetAttribute.LIULONGZHUANGBEI,onHandle);
            panel.addEventListener(TargetAttribute.JINGLINGQIXUAN,onHandle);
            panel.addEventListener(TargetAttribute.GUIHUN,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            panel.removeEventListener(TargetAttribute.LIULONGZHUANGBEI,onHandle);
            panel.removeEventListener(TargetAttribute.JINGLINGQIXUAN,onHandle);
            panel.removeEventListener(TargetAttribute.GUIHUN,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case TargetAttribute.LIULONGZHUANGBEI:
               this.senderProxy.send_80481(GameInstance.lookPlayerID);
               this.setData("","");
               break;
            case TargetAttribute.JINGLINGQIXUAN:
               this.senderProxy.send_83191(GameInstance.lookPlayerID);
               break;
            case TargetAttribute.GUIHUN:
               this.senderProxy.send_83361(GameInstance.lookPlayerID);
         }
      }
      
      public function setData(param1:String, param2:String) : void
      {
         this.panel.showYNliulongzhuangbei();
         this.panel.setYNliulongzhuangbei(GameInstance.lookPlayerData.goodsInfo.goodsBagArr,param1,param2);
      }
      
      public function setYNJingLing(param1:Object) : void
      {
         this.panel.showYNJingLing();
         this.panel.setYNJingLing(param1);
      }
      
      public function setYNGuiHun(param1:Object) : void
      {
         this.panel.showYNGuiHun();
         this.panel.setYNGuiHun(param1);
         this.panel.set_GuiHun(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

