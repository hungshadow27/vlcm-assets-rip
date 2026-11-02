package com.tgame.moudels.jinSheJianFa.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.jinSheJianFa.model.info.JinSheJianFaVO;
   import com.tgame.moudels.jinSheJianFa.view.JinSheJianFa_Mediator;
   import com.tgame.moudels.jinSheJianFa.view.JinSheJianFa_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class JinSheJianFa_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "JinSheJianFa_MsgReceivedProxy";
      
      private var vo:JinSheJianFaVO;
      
      private var _mainChar_Mediator:JinSheJianFa_Mediator;
      
      private var _targetMediator:JinSheJianFa_TargetPanelMediator;
      
      public function JinSheJianFa_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get mainChar_Mediator() : JinSheJianFa_Mediator
      {
         if(!this._mainChar_Mediator)
         {
            this._mainChar_Mediator = facade.retrieveMediator(JinSheJianFa_Mediator.NAME) as JinSheJianFa_Mediator;
         }
         return this._mainChar_Mediator;
      }
      
      private function get targetPlaneMediator() : JinSheJianFa_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(JinSheJianFa_TargetPanelMediator.NAME) as JinSheJianFa_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([74672,74674,74676],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([74672,74674,74676],NAME);
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
      
      public function received_74672(param1:ByteArray) : void
      {
         ZLog.add("74672\t\t金蛇剑法信息返回");
         var _loc2_:int = param1.readInt();
         this.vo = new JinSheJianFaVO();
         this.vo.nowID = param1.readByte();
         this.vo.nowLookingID = param1.readByte();
         this.vo.nowLookingName = param1.readUTF();
         this.vo.isKnow = param1.readByte() == 1;
         this.vo.act = param1.readDouble();
         this.vo.def = param1.readDouble();
         this.vo.hp = param1.readDouble();
         this.vo.baoJi = param1.readDouble();
         this.vo.shanBi = param1.readDouble();
         this.vo.jiNengId = param1.readInt();
         this.vo.isCanUse = param1.readByte() == 1;
         this.vo.skill = new Skill(this.vo.jiNengId);
         this.vo.isCheck1 = Boolean(param1.readByte());
         if(_loc2_ == -1)
         {
            this.mainChar_Mediator.upDataJinSheJianFaPanel(this.vo);
         }
         else if(_loc2_ == GameInstance.lookPlayerID)
         {
            this.targetPlaneMediator.upDataJinSheJianFaPanel(this.vo);
         }
      }
      
      public function received_74674(param1:ByteArray) : void
      {
         ZLog.add("74674\t\t金蛇剑法领悟查询结果");
         var _loc2_:String = "";
         var _loc3_:String = "";
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:String = param1.readUTF();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         this.mainChar_Mediator.upDataLingWuPanel(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
      }
      
      public function received_74676(param1:ByteArray) : void
      {
         ZLog.add("74676\t\t金蛇剑法申请领悟结果");
         var _loc2_:int = param1.readByte();
         this.mainChar_Mediator.upDataJinSheJianFaLVComplete(_loc2_);
      }
   }
}

