package com.tgame.moudels.cuqiankungfu.model
{
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.cuqiankungfu.model.info.CuQianKungFuVO;
   import com.tgame.moudels.cuqiankungfu.view.CuQianKungFu_MaincharPlaneMediator;
   import com.tgame.moudels.cuqiankungfu.view.CuQianKungFu_TargetCharPlaneMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class CuQianKungFu_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "CuQianKungFu_MsgReceivedProxy";
      
      private var cuqiankungfuVO:CuQianKungFuVO;
      
      private var _cuQianKungFu_Mediator:CuQianKungFu_MaincharPlaneMediator;
      
      private var _targetMediator:CuQianKungFu_TargetCharPlaneMediator;
      
      public function CuQianKungFu_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get cuQianKungFu_Mediator() : CuQianKungFu_MaincharPlaneMediator
      {
         if(!this._cuQianKungFu_Mediator)
         {
            this._cuQianKungFu_Mediator = facade.retrieveMediator(CuQianKungFu_MaincharPlaneMediator.NAME) as CuQianKungFu_MaincharPlaneMediator;
         }
         return this._cuQianKungFu_Mediator;
      }
      
      private function get targetPlaneMediator() : CuQianKungFu_TargetCharPlaneMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(CuQianKungFu_TargetCharPlaneMediator.NAME) as CuQianKungFu_TargetCharPlaneMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([73452,73454],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([73452,73454],NAME);
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
      
      public function received_73452(param1:ByteArray) : void
      {
         ZLog.add("73452：粗浅功夫面板信息接收");
         var _loc2_:int = param1.readInt();
         if(!this.cuqiankungfuVO)
         {
            this.cuqiankungfuVO = new CuQianKungFuVO();
         }
         this.cuqiankungfuVO.nowID = param1.readInt();
         this.cuqiankungfuVO.nowLookingID = param1.readInt();
         this.cuqiankungfuVO.nowLookingName = param1.readUTF();
         this.cuqiankungfuVO.act = param1.readDouble();
         this.cuqiankungfuVO.def = param1.readDouble();
         this.cuqiankungfuVO.hp = param1.readDouble();
         this.cuqiankungfuVO.bj = param1.readDouble();
         this.cuqiankungfuVO.sb = param1.readDouble();
         this.cuqiankungfuVO.miaoshu = param1.readUTF();
         this.cuqiankungfuVO.skill = new Skill(param1.readInt());
         this.cuqiankungfuVO.skill.isLearn = param1.readByte();
         this.cuqiankungfuVO.nowChallenge = param1.readInt();
         this.cuqiankungfuVO.maxChallenge = param1.readInt();
         this.cuqiankungfuVO.isFire = param1.readByte() > 0 ? true : false;
         this.cuqiankungfuVO.tili = param1.readInt();
         this.cuqiankungfuVO.saodiValid = param1.readByte() > 0 ? true : false;
         if(_loc2_ == -1)
         {
            this.cuQianKungFu_Mediator.upDataPanel(this.cuqiankungfuVO);
         }
         else
         {
            this.targetPlaneMediator.upDataPanel(_loc2_,this.cuqiankungfuVO);
         }
      }
      
      public function received_73454(param1:ByteArray) : void
      {
         ZLog.add("73454: 返回挑战粗浅功夫结果");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         this.cuQianKungFu_Mediator.upDateCuqiankungfuLVComplete(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_);
      }
   }
}

