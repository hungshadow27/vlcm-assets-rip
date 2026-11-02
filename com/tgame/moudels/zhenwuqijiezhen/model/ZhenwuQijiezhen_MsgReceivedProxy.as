package com.tgame.moudels.zhenwuqijiezhen.model
{
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.zhenwuqijiezhen.model.info.ZhenWuQiJieZhenVO;
   import com.tgame.moudels.zhenwuqijiezhen.view.ZhenwuQijiezhen_Mediator;
   import com.tgame.moudels.zhenwuqijiezhen.view.ZhenwuQijiezhen_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ZhenwuQijiezhen_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "ZhenwuQijiezhen_MsgReceivedProxy";
      
      private var mainCharZhenWuQiJieZhenVO:ZhenWuQiJieZhenVO;
      
      private var _zhenwuqijiezhen_Mediator:ZhenwuQijiezhen_Mediator;
      
      private var _targetMediator:ZhenwuQijiezhen_TargetMediator;
      
      public function ZhenwuQijiezhen_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get zhenwuqijiezhen_Mediator() : ZhenwuQijiezhen_Mediator
      {
         if(!this._zhenwuqijiezhen_Mediator)
         {
            this._zhenwuqijiezhen_Mediator = facade.retrieveMediator(ZhenwuQijiezhen_Mediator.NAME) as ZhenwuQijiezhen_Mediator;
         }
         return this._zhenwuqijiezhen_Mediator;
      }
      
      private function get targetPlaneMediator() : ZhenwuQijiezhen_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(ZhenwuQijiezhen_TargetMediator.NAME) as ZhenwuQijiezhen_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([60952,60954,60956],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([60952,60954,60956],NAME);
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
      
      public function received_60952(param1:ByteArray) : void
      {
         var _loc2_:int = 0;
         ZLog.add("60952：返回请求玩家真武七截阵详细数据");
         if(!this.mainCharZhenWuQiJieZhenVO)
         {
            this.mainCharZhenWuQiJieZhenVO = new ZhenWuQiJieZhenVO();
         }
         _loc2_ = param1.readInt();
         this.mainCharZhenWuQiJieZhenVO.miaoshu = param1.readUTF();
         this.mainCharZhenWuQiJieZhenVO.nowLookingID = param1.readByte();
         this.mainCharZhenWuQiJieZhenVO.nowLookingName = param1.readUTF();
         this.mainCharZhenWuQiJieZhenVO.nowID = param1.readByte();
         this.mainCharZhenWuQiJieZhenVO.act = param1.readInt();
         this.mainCharZhenWuQiJieZhenVO.actNum = param1.readByte();
         this.mainCharZhenWuQiJieZhenVO.def = param1.readInt();
         this.mainCharZhenWuQiJieZhenVO.defNum = param1.readByte();
         this.mainCharZhenWuQiJieZhenVO.hp = param1.readInt();
         this.mainCharZhenWuQiJieZhenVO.hpNum = param1.readByte();
         this.mainCharZhenWuQiJieZhenVO.bj = param1.readInt();
         this.mainCharZhenWuQiJieZhenVO.bjNum = param1.readByte();
         this.mainCharZhenWuQiJieZhenVO.sb = param1.readInt();
         this.mainCharZhenWuQiJieZhenVO.sbNum = param1.readByte();
         var _loc3_:int = param1.readInt();
         this.mainCharZhenWuQiJieZhenVO.skill = new Skill(_loc3_);
         this.mainCharZhenWuQiJieZhenVO.isLearn = Boolean(param1.readByte() == 1);
         this.mainCharZhenWuQiJieZhenVO.wugongStr = param1.readUTF();
         this.mainCharZhenWuQiJieZhenVO.isZhenwuZonggang = Boolean(param1.readByte() == 1);
         this.mainCharZhenWuQiJieZhenVO.isZhenwuFuti = Boolean(param1.readByte() == 1);
         this.mainCharZhenWuQiJieZhenVO.isZuoQi = Boolean(param1.readByte() == 1);
         this.mainCharZhenWuQiJieZhenVO.isWuQi = Boolean(param1.readByte() == 1);
         this.mainCharZhenWuQiJieZhenVO.isWuQi2 = Boolean(param1.readByte() == 1);
         this.mainCharZhenWuQiJieZhenVO.isZuoQi2 = Boolean(param1.readByte() == 1);
         if(_loc2_ == -1)
         {
            this.zhenwuqijiezhen_Mediator.upDataPanel(this.mainCharZhenWuQiJieZhenVO);
         }
         else
         {
            this.targetPlaneMediator.upDataPanel(_loc2_,this.mainCharZhenWuQiJieZhenVO);
         }
      }
      
      public function received_60954(param1:ByteArray) : void
      {
         ZLog.add("60954：真武七截阵升级查询返回");
         var _loc2_:String = param1.readUTF();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.zhenwuqijiezhen_Mediator.upDateZhenWuQiJieZhenLV(_loc6_,_loc7_,_loc4_,_loc5_,_loc8_,_loc3_,_loc2_);
      }
      
      public function received_60956(param1:ByteArray) : void
      {
         ZLog.add("60956：真武七截阵领悟成功失败");
         var _loc2_:int = param1.readByte();
         this.zhenwuqijiezhen_Mediator.upDateZhenWuQiJieZhenLVComplete(_loc2_);
      }
   }
}

