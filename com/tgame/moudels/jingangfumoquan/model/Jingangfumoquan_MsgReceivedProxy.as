package com.tgame.moudels.jingangfumoquan.model
{
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.jingangfumoquan.model.info.JingangfumoquanVo;
   import com.tgame.moudels.jingangfumoquan.view.Jingangfumoquan_PanelMediator;
   import com.tgame.moudels.jingangfumoquan.view.Jingangfumoquan_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Jingangfumoquan_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Jingangfumoquan_MsgReceivedProxy";
      
      private var _JinguangfumoMediator:Jingangfumoquan_PanelMediator;
      
      private var _targetMediator:Jingangfumoquan_TargetPanelMediator;
      
      public function Jingangfumoquan_MsgReceivedProxy()
      {
         super(NAME);
      }
      
      public function get jinGangfumoquanMediator() : Jingangfumoquan_PanelMediator
      {
         if(!this._JinguangfumoMediator)
         {
            this._JinguangfumoMediator = facade.retrieveMediator(Jingangfumoquan_PanelMediator.NAME) as Jingangfumoquan_PanelMediator;
         }
         return this._JinguangfumoMediator;
      }
      
      private function get targetPlaneMediator() : Jingangfumoquan_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(Jingangfumoquan_TargetPanelMediator.NAME) as Jingangfumoquan_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([61662,61664,61666],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([61662,61664,61666],NAME);
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
      
      public function received_61662(param1:ByteArray) : void
      {
         ZLog.add("61662：金刚伏魔圈信息接收");
         var _loc2_:int = param1.readInt();
         var _loc3_:JingangfumoquanVo = new JingangfumoquanVo();
         _loc3_.nowID = param1.readInt();
         _loc3_.nowLookingID = param1.readInt();
         _loc3_.nowLookingName = param1.readUTF();
         _loc3_.miaoshu = param1.readUTF();
         _loc3_.jbShuxingStr = param1.readUTF();
         _loc3_.tsShuxingStr = param1.readUTF();
         _loc3_.skill = new Skill(param1.readInt());
         _loc3_.skill.isLearn = param1.readByte();
         var _loc4_:int = param1.readByte();
         var _loc5_:int = param1.readInt();
         _loc3_.isTeXiao = Boolean(param1.readByte());
         if(_loc2_ == -1)
         {
            this.jinGangfumoquanMediator.upDataPanel(_loc3_,_loc4_,_loc5_);
         }
         else
         {
            this.targetPlaneMediator.upDataPanel(_loc2_,_loc3_,_loc4_,_loc5_);
         }
      }
      
      public function received_61664(param1:ByteArray) : void
      {
         ZLog.add("61664\t\t返回斗转星移突破数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:String = param1.readUTF();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         this.jinGangfumoquanMediator.upDateDouZhuanXingYiLV(_loc2_,_loc3_,_loc5_,_loc6_,_loc7_,_loc4_);
      }
      
      public function received_61666(param1:ByteArray) : void
      {
         ZLog.add("61666\t\t返回突破金刚伏魔圈结果");
         var _loc2_:int = param1.readByte();
         this.jinGangfumoquanMediator.upDateDouZhuanXingYiLVComplete(_loc2_);
      }
   }
}

