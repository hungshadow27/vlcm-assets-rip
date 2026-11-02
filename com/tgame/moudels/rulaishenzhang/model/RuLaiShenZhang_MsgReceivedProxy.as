package com.tgame.moudels.rulaishenzhang.model
{
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.rulaishenzhang.model.info.RuLaiShenZhangVO;
   import com.tgame.moudels.rulaishenzhang.view.RuLaiShenZhang_MaincharPlaneMediator;
   import com.tgame.moudels.rulaishenzhang.view.RuLaiShenZhang_TargetCharPlaneMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class RuLaiShenZhang_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "RuLaiShenZhang_MsgReceivedProxy";
      
      private var rulaishenzhangVO:RuLaiShenZhangVO;
      
      private var _Rulaishenzhang_Mediator:RuLaiShenZhang_MaincharPlaneMediator;
      
      private var _targetMediator:RuLaiShenZhang_TargetCharPlaneMediator;
      
      public function RuLaiShenZhang_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get ruLaiShenZhang_Mediator() : RuLaiShenZhang_MaincharPlaneMediator
      {
         if(!this._Rulaishenzhang_Mediator)
         {
            this._Rulaishenzhang_Mediator = facade.retrieveMediator(RuLaiShenZhang_MaincharPlaneMediator.NAME) as RuLaiShenZhang_MaincharPlaneMediator;
         }
         return this._Rulaishenzhang_Mediator;
      }
      
      private function get targetPlaneMediator() : RuLaiShenZhang_TargetCharPlaneMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(RuLaiShenZhang_TargetCharPlaneMediator.NAME) as RuLaiShenZhang_TargetCharPlaneMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([72822,72824,72826],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([72822,72824,72826],NAME);
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
      
      public function received_72822(param1:ByteArray) : void
      {
         ZLog.add("72822：如来神掌面板信息接收");
         var _loc2_:int = param1.readInt();
         if(!this.rulaishenzhangVO)
         {
            this.rulaishenzhangVO = new RuLaiShenZhangVO();
         }
         this.rulaishenzhangVO.nowID = param1.readInt();
         this.rulaishenzhangVO.nowLookingID = param1.readInt();
         this.rulaishenzhangVO.nowLookingName = param1.readUTF();
         this.rulaishenzhangVO.isKnow = param1.readByte() == 0 ? false : true;
         this.rulaishenzhangVO.act = param1.readDouble();
         this.rulaishenzhangVO.def = param1.readDouble();
         this.rulaishenzhangVO.hp = param1.readDouble();
         this.rulaishenzhangVO.mp = param1.readDouble();
         this.rulaishenzhangVO.cp = param1.readDouble();
         this.rulaishenzhangVO.miaoshu = param1.readUTF();
         this.rulaishenzhangVO.skill = new Skill(param1.readInt());
         this.rulaishenzhangVO.skill.isLearn = param1.readByte();
         if(_loc2_ == -1)
         {
            this.ruLaiShenZhang_Mediator.upDataPanel(this.rulaishenzhangVO);
         }
         else
         {
            this.targetPlaneMediator.upDataPanel(_loc2_,this.rulaishenzhangVO);
         }
      }
      
      public function received_72824(param1:ByteArray) : void
      {
         ZLog.add("72824：返回如来神掌突破信息");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.ruLaiShenZhang_Mediator.setTupoPanel(_loc2_,_loc5_,_loc6_,_loc7_,_loc3_,_loc4_,_loc8_);
      }
      
      public function received_72826(param1:ByteArray) : void
      {
         ZLog.add("72826: 返回突破先如来神掌结果");
         var _loc2_:int = param1.readByte();
         this.ruLaiShenZhang_Mediator.upDateRulaishenzhangLVComplete(_loc2_);
      }
   }
}

