package com.tgame.moudels.xiaoyaoyufeng.model
{
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.xiaoyaoyufeng.model.info.XiaoYaoYuFengVO;
   import com.tgame.moudels.xiaoyaoyufeng.view.XiaoYaoYuFengJiNengSheZhi_Mediator;
   import com.tgame.moudels.xiaoyaoyufeng.view.XiaoYaoYuFeng_Mediator;
   import com.tgame.moudels.xiaoyaoyufeng.view.XiaoYaoYuFeng_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XiaoYaoYuFeng_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "XiaoYaoYuFeng_MsgReceivedProxy";
      
      private var _mainPanelMediator:XiaoYaoYuFeng_Mediator;
      
      private var _targetMediator:XiaoYaoYuFeng_TargetPanelMediator;
      
      private var _jinengMediator:XiaoYaoYuFengJiNengSheZhi_Mediator;
      
      public function XiaoYaoYuFeng_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get mainPanelMediator() : XiaoYaoYuFeng_Mediator
      {
         if(!this._mainPanelMediator)
         {
            this._mainPanelMediator = facade.retrieveMediator(XiaoYaoYuFeng_Mediator.NAME) as XiaoYaoYuFeng_Mediator;
         }
         return this._mainPanelMediator;
      }
      
      private function get targetPlaneMediator() : XiaoYaoYuFeng_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(XiaoYaoYuFeng_TargetPanelMediator.NAME) as XiaoYaoYuFeng_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      private function get jinengPlaneMediator() : XiaoYaoYuFengJiNengSheZhi_Mediator
      {
         if(!this._jinengMediator)
         {
            this._jinengMediator = facade.retrieveMediator(XiaoYaoYuFengJiNengSheZhi_Mediator.NAME) as XiaoYaoYuFengJiNengSheZhi_Mediator;
         }
         return this._jinengMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([70002,70004,70006,70008,70010],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([70002,70004,70006,70008,70010],NAME);
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
      
      public function received_70002(param1:ByteArray) : void
      {
         ZLog.add("70002：返回玩家逍遥御风详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:XiaoYaoYuFengVO = new XiaoYaoYuFengVO();
         _loc3_.miaoshu = param1.readUTF();
         _loc3_.nowLookingName = param1.readUTF();
         _loc3_.nowLookingID = param1.readByte();
         _loc3_.nowID = param1.readByte();
         _loc3_.act = param1.readInt();
         _loc3_.def = param1.readInt();
         _loc3_.hp = param1.readInt();
         _loc3_.nl = param1.readInt();
         _loc3_.tl = param1.readInt();
         _loc3_.skillid = param1.readInt();
         _loc3_.isLearn = Boolean(param1.readByte() == 1);
         _loc3_.isZidong = Boolean(param1.readByte() == 1);
         _loc3_.isDouble = Boolean(param1.readByte() == 1);
         if(_loc2_ == -1)
         {
            this.mainPanelMediator.upDataPanel(_loc3_);
         }
         else
         {
            this.targetPlaneMediator.upDataPanel(_loc2_,_loc3_);
         }
      }
      
      public function received_70004(param1:ByteArray) : void
      {
         ZLog.add("70004\t\t返回逍遥御风突破数据");
         var _loc2_:String = param1.readUTF();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mainPanelMediator.upDateXiaoYaoYuFengLV(_loc6_,_loc7_,_loc4_,_loc5_,_loc8_,_loc3_,_loc2_);
      }
      
      public function received_70006(param1:ByteArray) : void
      {
         ZLog.add("70006\t\t返回突破逍遥御风结果");
         var _loc2_:int = param1.readByte();
         this.mainPanelMediator.upDateXiaoYaoYuFengLVComplete(_loc2_);
      }
      
      public function received_70008(param1:ByteArray) : void
      {
         var _loc7_:int = 0;
         var _loc8_:Skill = null;
         ZLog.add("70008\t\t返回技能设置面板之自身技能");
         var _loc2_:Array = [];
         var _loc3_:int = param1.readInt();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc7_ = param1.readInt();
            _loc8_ = new Skill(_loc7_);
            _loc8_.isLearn = 1;
            _loc2_.push(_loc8_);
            _loc4_++;
         }
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         this.jinengPlaneMediator.setZishenSkill(_loc2_,_loc5_,_loc6_);
      }
      
      public function received_70010(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Skill = null;
         ZLog.add("70010\t\t返回技能设置面板之使用技能");
         var _loc2_:Array = [];
         var _loc3_:int = param1.readInt();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readInt();
            _loc6_ = param1.readInt();
            _loc7_ = new Skill(_loc5_,_loc6_);
            _loc7_.isLearn = 1;
            _loc2_.push(_loc7_);
            _loc4_++;
         }
         this.jinengPlaneMediator.setShiyongSkill(_loc2_);
      }
   }
}

