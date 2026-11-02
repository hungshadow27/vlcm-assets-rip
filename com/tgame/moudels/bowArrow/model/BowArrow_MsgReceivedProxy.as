package com.tgame.moudels.bowArrow.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.bowArrow.info.BowArrowCmpInfo;
   import com.tgame.moudels.bowArrow.info.BowArrowCmpResultInfo;
   import com.tgame.moudels.bowArrow.info.BowArrowItemInfo;
   import com.tgame.moudels.bowArrow.view.BowArrow_Mediator;
   import com.tgame.moudels.bowArrow.view.TargetBowArrow_Mediator;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class BowArrow_MsgReceivedProxy extends Proxy
   {
      
      private var _bowArrowMeditor:BowArrow_Mediator;
      
      private var _targetBowArrowMeditor:TargetBowArrow_Mediator;
      
      public function BowArrow_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(param1,param2);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([53032,53034,53036,53038,53040,53042,53044,53046,53048,53050],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([53032,53034,53036,53038,53040,53042,53044,53046,53048,53050],NAME);
      }
      
      private function get bowArrowMeditor() : BowArrow_Mediator
      {
         if(this._bowArrowMeditor == null)
         {
            this._bowArrowMeditor = facade.retrieveMediator(BowArrow_Mediator.NAME) as BowArrow_Mediator;
         }
         return this._bowArrowMeditor;
      }
      
      private function get targetBowArrowMeditor() : TargetBowArrow_Mediator
      {
         if(this._targetBowArrowMeditor == null)
         {
            this._targetBowArrowMeditor = facade.retrieveMediator(TargetBowArrow_Mediator.NAME) as TargetBowArrow_Mediator;
         }
         return this._targetBowArrowMeditor;
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
      
      public function received_53032(param1:ByteArray) : void
      {
         var _loc4_:Boolean = false;
         var _loc2_:BowArrowItemInfo = new BowArrowItemInfo(param1);
         this.bowArrowMeditor.updateBowArrowPanel(_loc2_);
         var _loc3_:String = "";
         if(_loc2_.dingJijinDu > 0)
         {
            _loc3_ = "<textformat leading=\'\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击:") + _loc2_.addGongji + " " + LanResManager.getLanCommonTextWords("防御:") + _loc2_.addFangyu + " " + LanResManager.getLanCommonTextWords("生命:") + _loc2_.addShengming + "</font>";
         }
         else
         {
            _loc3_ = "<textformat leading=\'\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("弓箭顶级激活属性（未激活）") + "</font>";
         }
         this.bowArrowMeditor.menuBowToolTip(_loc3_);
         if(_loc2_.curtID >= 7)
         {
            _loc4_ = true;
         }
         else
         {
            _loc4_ = false;
         }
         this.bowArrowMeditor.setBowJinduNum(_loc2_.dingJijinDu,_loc4_);
      }
      
      public function received_53034(param1:ByteArray) : void
      {
         var _loc2_:BowArrowCmpInfo = new BowArrowCmpInfo(param1);
         this.bowArrowMeditor.updateComposePanel(_loc2_);
      }
      
      public function received_53036(param1:ByteArray) : void
      {
         var _loc2_:BowArrowCmpResultInfo = new BowArrowCmpResultInfo(param1);
         GameInstance.mainCharData.attributeInfo.currentBowLv = _loc2_.curtBowArrowID;
         if(_loc2_.isSuccess == 1)
         {
            ZLog.add("53036： 弓箭进阶结果,成功");
            this.bowArrowMeditor.composeSuccess(_loc2_);
         }
         else
         {
            ZLog.add("53036： 弓箭进阶结果,失败");
            this.bowArrowMeditor.composeFaile(_loc2_);
         }
      }
      
      public function received_53038(param1:ByteArray) : void
      {
         this.installOrUnArrow(param1);
      }
      
      public function received_53040(param1:ByteArray) : void
      {
         this.installOrUnArrow(param1);
      }
      
      private function installOrUnArrow(param1:ByteArray) : void
      {
         var _loc2_:Array = [];
         var _loc3_:Boolean = Boolean(param1.readByte());
         var _loc4_:Goods = new Goods(param1.readInt());
         _loc4_.count = param1.readInt();
         _loc4_.bind = param1.readByte();
         if(_loc4_.id > 0)
         {
            _loc2_.push([_loc4_,1]);
         }
         var _loc5_:Goods = new Goods(param1.readInt());
         _loc5_.count = param1.readInt();
         _loc5_.bind = param1.readByte();
         if(_loc5_.id > 0)
         {
            _loc2_.push([_loc5_,2]);
         }
         this.bowArrowMeditor.updateArrowContainer(_loc2_);
      }
      
      public function received_53042(param1:ByteArray) : void
      {
         var _loc2_:String = param1.readUTF();
         NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_NO_JIAN,_loc2_);
      }
      
      public function received_53044(param1:ByteArray) : void
      {
         var _loc2_:Boolean = Boolean(param1.readByte());
         ZLog.add("53044： 箭矢使用结果," + _loc2_);
      }
      
      public function received_53046(param1:ByteArray) : void
      {
         var _loc4_:Boolean = false;
         var _loc2_:BowArrowItemInfo = new BowArrowItemInfo(param1,false);
         this.targetBowArrowMeditor.updateTargetBowArrow(_loc2_);
         var _loc3_:String = "";
         if(_loc2_.dingJijinDu > 0)
         {
            _loc3_ = "<textformat leading=\'\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击:") + _loc2_.addGongji + " " + LanResManager.getLanCommonTextWords("防御:") + _loc2_.addFangyu + " " + LanResManager.getLanCommonTextWords("生命:") + _loc2_.addShengming + "</font>";
         }
         else
         {
            _loc3_ = "<textformat leading=\'\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("弓箭顶级激活属性（未激活）") + "</font>";
         }
         this.targetBowArrowMeditor.menuBowToolTip(_loc3_);
         if(_loc2_.curtID >= 7)
         {
            _loc4_ = true;
         }
         else
         {
            _loc4_ = false;
         }
         this.targetBowArrowMeditor.setBowJinduNum(_loc2_.dingJijinDu,_loc4_);
      }
      
      public function received_53048(param1:ByteArray) : void
      {
         var _loc2_:Goods = new Goods(param1.readInt());
         _loc2_.count = param1.readInt();
         _loc2_.bind = param1.readByte();
         var _loc3_:Goods = new Goods(param1.readInt());
         _loc3_.count = param1.readInt();
         _loc3_.bind = param1.readByte();
         var _loc4_:Array = [];
         if(_loc2_.id != -1)
         {
            _loc4_.push([_loc2_,1]);
         }
         if(_loc3_.id != -1)
         {
            _loc4_.push([_loc3_,2]);
         }
         this.bowArrowMeditor.updateArrowContainer(_loc4_);
      }
      
      public function received_53050(param1:ByteArray) : void
      {
         ZLog.add("53050： 返回激活弓箭隐藏属性响应");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            this.bowArrowMeditor.f5();
         }
      }
   }
}

