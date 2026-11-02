package com.tgame.moudels.moxue.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.attribute.view.Attribute_TargetCharAttributePlaneMediator;
   import com.tgame.moudels.moxue.view.MoXue_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.common.utils.Fun;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class MoXue_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "MoXue_MsgReceivedProxy";
      
      private var _afkMediator:MoXue_Mediator;
      
      private var _targetCharAttributePlaneMediator:Attribute_TargetCharAttributePlaneMediator;
      
      public function MoXue_MsgReceivedProxy()
      {
         super(NAME);
      }
      
      private function get moxueDollMediator() : MoXue_Mediator
      {
         if(!this._afkMediator)
         {
            this._afkMediator = facade.retrieveMediator(MoXue_Mediator.NAME) as MoXue_Mediator;
         }
         return this._afkMediator;
      }
      
      private function get targetCharAttributePlaneMediator() : Attribute_TargetCharAttributePlaneMediator
      {
         if(!this._targetCharAttributePlaneMediator)
         {
            this._targetCharAttributePlaneMediator = facade.retrieveMediator(Attribute_TargetCharAttributePlaneMediator.NAME) as Attribute_TargetCharAttributePlaneMediator;
         }
         return this._targetCharAttributePlaneMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([59772,59774,59776],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([59772,59774,59776],NAME);
      }
      
      private function receivedMsgHandle(param1:Notification) : void
      {
         var _loc2_:* = param1.name;
         var _loc3_:ByteArray = param1.body as ByteArray;
         if(this.hasOwnProperty("received_" + _loc2_))
         {
            this["received_" + _loc2_](_loc3_);
         }
         else
         {
            ZLog.add("协议号" + _loc2_ + "不存在");
         }
      }
      
      public function received_59772(param1:ByteArray) : void
      {
         ZLog.add("59772：返回魔血娃娃界面");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         this.moxueDollMediator.openMoxuePanel();
         this.moxueDollMediator.initMoxuePanel(_loc2_,_loc3_,_loc4_,_loc5_);
      }
      
      public function received_59774(param1:ByteArray) : void
      {
         ZLog.add("59774：返回魔血娃娃灌注结果");
         if(!Fun.isVisible(GameInstance.uiInstance.moxueDollPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MOXUE_DOLL_PANEL);
         }
         this.moxueDollMediator.setNullGuanzhu();
      }
      
      public function received_59776(param1:ByteArray) : void
      {
         ZLog.add("59776：返回魔血娃娃提取结果");
         if(!Fun.isVisible(GameInstance.uiInstance.moxueDollPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MOXUE_DOLL_PANEL);
         }
         this.moxueDollMediator.setNullTiqu();
      }
   }
}

