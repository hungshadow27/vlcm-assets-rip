package com.tgame.moudels.yunvsuxinjianfa.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.yunvsuxinjianfa.model.info.YuNvSuXinJianFaVO;
   import com.tgame.moudels.yunvsuxinjianfa.view.YuNvSuXinJianFa_Mediator;
   import com.tgame.moudels.yunvsuxinjianfa.view.YuNvSuXinJianFa_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YuNvSuXinJianFa_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "YuNvSuXinJianFa_MsgReceivedProxy";
      
      private var _mianPanelMediator:YuNvSuXinJianFa_Mediator;
      
      private var _targetMediator:YuNvSuXinJianFa_TargetMediator;
      
      public function YuNvSuXinJianFa_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get mianPanelMediator() : YuNvSuXinJianFa_Mediator
      {
         if(!this._mianPanelMediator)
         {
            this._mianPanelMediator = facade.retrieveMediator(YuNvSuXinJianFa_Mediator.NAME) as YuNvSuXinJianFa_Mediator;
         }
         return this._mianPanelMediator;
      }
      
      private function get targetPlaneMediator() : YuNvSuXinJianFa_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(YuNvSuXinJianFa_TargetMediator.NAME) as YuNvSuXinJianFa_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([73682,73684,73686],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([73682,73684,73686],NAME);
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
            ZLog.add("协议号 " + _loc2_ + "不存在");
         }
      }
      
      public function received_73682(param1:ByteArray) : void
      {
         ZLog.add("73682：返回玩家玉女素心剑法详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:YuNvSuXinJianFaVO = new YuNvSuXinJianFaVO();
         _loc3_.nowID = param1.readInt();
         _loc3_.nowLookingID = param1.readInt();
         _loc3_.nowLookingName = param1.readUTF();
         _loc3_.miaoshu = param1.readUTF();
         _loc3_.act = param1.readDouble();
         _loc3_.def = param1.readDouble();
         _loc3_.hp = param1.readDouble();
         _loc3_.baoji = param1.readDouble();
         _loc3_.shanbi = param1.readDouble();
         var _loc4_:int = param1.readInt();
         _loc3_.skillid = _loc4_;
         _loc3_.isLearn = Boolean(param1.readByte() == 1);
         _loc3_.isDanTian = Boolean(param1.readByte() == 1);
         if(_loc2_ == -1)
         {
            this.mianPanelMediator.setPanel(_loc3_);
         }
         else
         {
            this.targetPlaneMediator.setPanel(_loc2_,_loc3_);
         }
      }
      
      public function received_73684(param1:ByteArray) : void
      {
         ZLog.add("73684：返回玉女素心剑法突破信息");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mianPanelMediator.setTupoPanel(_loc2_,_loc5_,_loc6_,_loc7_,_loc3_,_loc4_,_loc8_);
      }
      
      public function received_73686(param1:ByteArray) : void
      {
         ZLog.add("73686: 返回突破玉女素心剑法结果");
         var _loc2_:int = param1.readByte();
         this.mianPanelMediator.setTupoResult(_loc2_);
      }
   }
}

