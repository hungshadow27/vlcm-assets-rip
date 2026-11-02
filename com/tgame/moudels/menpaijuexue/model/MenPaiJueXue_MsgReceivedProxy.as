package com.tgame.moudels.menpaijuexue.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.menpaijuexue.model.info.MenPaiJueXueVo;
   import com.tgame.moudels.menpaijuexue.view.MenPaiJueXue_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class MenPaiJueXue_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "MenPaiJueXue_MsgReceivedProxy";
      
      private var _xiangruishouhu_Mediator:MenPaiJueXue_Mediator;
      
      public function MenPaiJueXue_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([81202,81204],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([81202,81204],NAME);
      }
      
      private function get xiangruishouhu_Mediator() : MenPaiJueXue_Mediator
      {
         if(!this._xiangruishouhu_Mediator)
         {
            this._xiangruishouhu_Mediator = facade.retrieveMediator(MenPaiJueXue_Mediator.NAME) as MenPaiJueXue_Mediator;
         }
         return this._xiangruishouhu_Mediator;
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
      
      public function received_81202(param1:ByteArray) : void
      {
         ZLog.add("81202\t\t返回面板信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:MenPaiJueXueVo = new MenPaiJueXueVo();
         _loc3_.nowID = param1.readInt();
         _loc3_.nowLookingID = param1.readInt();
         _loc3_.xingxing = param1.readInt();
         _loc3_.act = param1.readDouble();
         _loc3_.def = param1.readDouble();
         _loc3_.hp = param1.readDouble();
         _loc3_.baoji = param1.readDouble();
         _loc3_.shanbi = param1.readDouble();
         var _loc4_:int = param1.readInt();
         _loc3_.skillid = _loc4_;
         _loc3_.menpai = param1.readInt();
         _loc3_.isLearn = Boolean(param1.readByte() == 1);
         _loc3_.goods = param1.readInt();
         _loc3_.xiaohao = param1.readInt();
         this.xiangruishouhu_Mediator.setPanel(_loc3_);
      }
      
      public function received_81204(param1:ByteArray) : void
      {
         ZLog.add("81204 \t返回面板信息");
         var _loc2_:int = param1.readInt();
         this.xiangruishouhu_Mediator.setSkillPanel(_loc2_);
      }
   }
}

