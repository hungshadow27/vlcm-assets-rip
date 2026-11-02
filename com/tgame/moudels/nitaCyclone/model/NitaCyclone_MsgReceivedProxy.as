package com.tgame.moudels.nitaCyclone.model
{
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.nitaCyclone.info.NitaCycloneCmpInfo;
   import com.tgame.moudels.nitaCyclone.info.NitaCycloneCmpResultInfo;
   import com.tgame.moudels.nitaCyclone.info.NitaCycloneItemInfo;
   import com.tgame.moudels.nitaCyclone.info.NitaSkillInfo;
   import com.tgame.moudels.nitaCyclone.view.NitaCyclone_Mediator;
   import com.tgame.moudels.nitaCyclone.view.NitaSkill_Mediator;
   import com.tgame.moudels.nitaCyclone.view.TargetNitaCyclone_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class NitaCyclone_MsgReceivedProxy extends Proxy
   {
      
      private var _nitaCycloneMeditor:NitaCyclone_Mediator;
      
      private var _targetNitaCycloneMediator:TargetNitaCyclone_Mediator;
      
      private var _nitaSkillMediator:NitaSkill_Mediator;
      
      public function NitaCyclone_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(param1,param2);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([53152,53154,53156,53158,53162,53014,53164,53166,53170],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([53152,53154,53156,53158,53162,53014,53164,53166,53170],NAME);
      }
      
      private function get nitaCycloneMeditor() : NitaCyclone_Mediator
      {
         if(this._nitaCycloneMeditor == null)
         {
            this._nitaCycloneMeditor = facade.retrieveMediator(NitaCyclone_Mediator.NAME) as NitaCyclone_Mediator;
         }
         return this._nitaCycloneMeditor;
      }
      
      private function get targetNitaCycloneMediator() : TargetNitaCyclone_Mediator
      {
         if(this._targetNitaCycloneMediator == null)
         {
            this._targetNitaCycloneMediator = facade.retrieveMediator(TargetNitaCyclone_Mediator.NAME) as TargetNitaCyclone_Mediator;
         }
         return this._targetNitaCycloneMediator;
      }
      
      private function get nitaSkillMediator() : NitaSkill_Mediator
      {
         if(this._nitaSkillMediator == null)
         {
            this._nitaSkillMediator = facade.retrieveMediator(NitaSkill_Mediator.NAME) as NitaSkill_Mediator;
         }
         return this._nitaSkillMediator;
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
      
      public function received_53152(param1:ByteArray) : void
      {
         var _loc4_:Boolean = false;
         var _loc5_:Skill = null;
         var _loc6_:Boolean = false;
         ZLog.add("53152 : 请求丹田信息数据返回 ");
         var _loc2_:NitaCycloneItemInfo = new NitaCycloneItemInfo(param1,true);
         this.nitaCycloneMeditor.updateNitaCyclonePanel(_loc2_);
         this.nitaCycloneMeditor.setDantianJihuo(_loc2_.isJiHuo);
         this.nitaCycloneMeditor.setJihuoDantianJinjieBtn(_loc2_.shouJinjie);
         var _loc3_:String = "";
         if(_loc2_.dingJijinDu > 0)
         {
            _loc3_ = "<textformat leading=\'\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击:") + _loc2_.addGongji + " " + LanResManager.getLanCommonTextWords("防御:") + _loc2_.addFangyu + " " + LanResManager.getLanCommonTextWords("生命:") + _loc2_.addShengming + "</font>";
         }
         else
         {
            _loc3_ = "<textformat leading=\'\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("丹田顶级激活属性（未激活）") + "</font>";
         }
         this.nitaCycloneMeditor.menuDantianToolTip(_loc3_);
         if(_loc2_.curtID >= 8)
         {
            _loc4_ = true;
         }
         else
         {
            _loc4_ = false;
         }
         this.nitaCycloneMeditor.setDantianJinduNum(_loc2_.dingJijinDu,_loc4_);
         if(_loc2_.jinjie != 0)
         {
            _loc6_ = true;
            if(_loc2_.jinjie == 4 || _loc2_.jinjie == 1 && _loc2_.jinjiePd == 0)
            {
               _loc6_ = false;
            }
            this.nitaCycloneMeditor.setDengjiTupoBtn(_loc2_.jinjieBtnStr,false,_loc6_);
            if(_loc2_.jinjie == 1)
            {
               if(_loc2_.jinjiePd == 1)
               {
                  _loc5_ = new Skill(_loc2_.jinjieSkill);
                  _loc5_.isLearn = 0;
                  this.nitaCycloneMeditor.setDantianJinjieBuff(_loc5_);
               }
            }
            else if(_loc2_.jinjie > 1)
            {
               _loc5_ = new Skill(_loc2_.jinjieSkill);
               _loc5_.isLearn = 1;
               this.nitaCycloneMeditor.setDantianJinjieBuff(_loc5_);
            }
         }
         else
         {
            this.nitaCycloneMeditor.setDantianJinjieBuff(null);
         }
         this.nitaCycloneMeditor.setXinFaSta(_loc2_.xinFaSta);
      }
      
      public function received_53154(param1:ByteArray) : void
      {
         var _loc2_:NitaCycloneCmpInfo = new NitaCycloneCmpInfo(param1);
         this.nitaCycloneMeditor.updateComposePanel(_loc2_);
      }
      
      public function received_53156(param1:ByteArray) : void
      {
         var _loc2_:NitaCycloneCmpResultInfo = new NitaCycloneCmpResultInfo(param1);
         if(_loc2_.isSuccess == 1)
         {
            this.nitaCycloneMeditor.composeSuccess(_loc2_);
         }
         else
         {
            this.nitaCycloneMeditor.composeFaile(_loc2_);
         }
      }
      
      public function received_53158(param1:ByteArray) : void
      {
         var _loc4_:Boolean = false;
         var _loc5_:Skill = null;
         var _loc6_:Boolean = false;
         var _loc2_:NitaCycloneItemInfo = new NitaCycloneItemInfo(param1,false);
         this.targetNitaCycloneMediator.updateNitaCyclonePanel(_loc2_);
         this.targetNitaCycloneMediator.setDantianJihuo(_loc2_.isJiHuo);
         this.targetNitaCycloneMediator.setJihuoDantianJinjieBtn(_loc2_.shouJinjie);
         var _loc3_:String = "";
         if(_loc2_.dingJijinDu > 0)
         {
            _loc3_ = "<textformat leading=\'\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击:") + _loc2_.addGongji + " " + LanResManager.getLanCommonTextWords("防御：") + _loc2_.addFangyu + " " + LanResManager.getLanCommonTextWords("生命:") + _loc2_.addShengming + "</font>";
         }
         else
         {
            _loc3_ = "<textformat leading=\'\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("丹田顶级激活属性（未激活）") + "</font>";
         }
         this.targetNitaCycloneMediator.menuDantianToolTip(_loc3_);
         if(_loc2_.curtID >= 8)
         {
            _loc4_ = true;
         }
         else
         {
            _loc4_ = false;
         }
         this.targetNitaCycloneMediator.setDantianJinduNum(_loc2_.dingJijinDu,_loc4_);
         if(_loc2_.jinjie != 0)
         {
            _loc6_ = true;
            if(_loc2_.jinjie == 4)
            {
               _loc6_ = false;
            }
            this.targetNitaCycloneMediator.setDengjiTupoBtn(_loc2_.jinjieBtnStr,false,_loc6_);
            if(_loc2_.jinjie == 1)
            {
               if(_loc2_.jinjiePd == 1)
               {
                  _loc5_ = new Skill(_loc2_.jinjieSkill);
                  _loc5_.isLearn = 0;
                  this.targetNitaCycloneMediator.setDantianJinjieBuff(_loc5_);
               }
               else
               {
                  this.targetNitaCycloneMediator.setDantianJinjieBuff(null);
               }
            }
            else if(_loc2_.jinjie > 1)
            {
               _loc5_ = new Skill(_loc2_.jinjieSkill);
               _loc5_.isLearn = 1;
               this.targetNitaCycloneMediator.setDantianJinjieBuff(_loc5_);
            }
         }
         else
         {
            this.targetNitaCycloneMediator.setDantianJinjieBuff(null);
         }
         this.targetNitaCycloneMediator.setDantianEnabledFun();
         this.targetNitaCycloneMediator.setXinFaSta(_loc2_.xinFaSta);
      }
      
      public function received_53162(param1:ByteArray) : void
      {
         var _loc2_:NitaSkillInfo = new NitaSkillInfo(param1);
         this.nitaSkillMediator.updateSkillPanel(_loc2_);
      }
      
      public function received_53014(param1:ByteArray) : void
      {
         var _loc2_:Boolean = param1.readByte() == 0 ? false : true;
         this.nitaCycloneMeditor.jihuoComplete(_loc2_);
      }
      
      public function received_53164(param1:ByteArray) : void
      {
         var _loc6_:int = 0;
         var _loc8_:Object = null;
         ZLog.add("53164:请求丹田激活进阶面板数据");
         var _loc2_:String = param1.readUTF();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readByte();
         var _loc5_:Array = new Array();
         while(_loc6_ < _loc4_)
         {
            _loc8_ = new Object();
            _loc8_.id = param1.readInt();
            _loc8_.shuliang = param1.readInt();
            _loc5_.push(_loc8_);
            _loc6_++;
         }
         var _loc7_:String = param1.readUTF();
         this.nitaCycloneMeditor.showJinjiePanel(_loc2_,_loc3_,_loc5_,_loc7_);
      }
      
      public function received_53166(param1:ByteArray) : void
      {
         ZLog.add("53166:返回丹田进阶激活");
         var _loc2_:int = param1.readByte();
         if(_loc2_)
         {
            this.nitaCycloneMeditor.closeJinjiePanel();
            this.nitaCycloneMeditor.shuaxinAantian();
         }
      }
      
      public function received_53170(param1:ByteArray) : void
      {
         ZLog.add("53170:返回越南特殊定制勾选框选中状态");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = SpecialGoodsID.YN_QIXUAN_ARR.indexOf(_loc2_);
         this.nitaCycloneMeditor.setXunzhangSelectYN_DT(_loc3_ + 1);
      }
   }
}

