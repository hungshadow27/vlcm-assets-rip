package com.tgame.moudels.skill.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.skill.SkillRes;
   import com.tgame.common.res.skill.SkillResManager;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.ExchangePositionManager;
   import com.tgame.manager.HeadFaceManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.login.view.*;
   import com.tgame.moudels.skill.view.Skill_Banghui_Mediator;
   import com.tgame.moudels.skill.view.Skill_Mediator;
   import com.tgame.moudels.skill.view.Skill_XinFaXiuLian_Mediator;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.manager.CDFaceManager;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Skill_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Skill_MsgReceivedProxy";
      
      private var _skillProxy:Skill_Proxy;
      
      private var _skillMediator:Skill_Mediator;
      
      private var _xinfaXiuLian:Skill_XinFaXiuLian_Mediator;
      
      private var _skillBanghui:Skill_Banghui_Mediator;
      
      public function Skill_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      private function get skillMediator() : Skill_Mediator
      {
         if(!this._skillMediator)
         {
            this._skillMediator = facade.retrieveMediator(Skill_Mediator.NAME) as Skill_Mediator;
         }
         return this._skillMediator;
      }
      
      private function get xinFaXiuLianMediator() : Skill_XinFaXiuLian_Mediator
      {
         if(!this._xinfaXiuLian)
         {
            this._xinfaXiuLian = facade.retrieveMediator(Skill_XinFaXiuLian_Mediator.NAME) as Skill_XinFaXiuLian_Mediator;
         }
         return this._xinfaXiuLian;
      }
      
      private function get skillBanghui() : Skill_Banghui_Mediator
      {
         if(!this._skillBanghui)
         {
            this._skillBanghui = facade.retrieveMediator(Skill_Banghui_Mediator.NAME) as Skill_Banghui_Mediator;
         }
         return this._skillBanghui;
      }
      
      private function get skillProxy() : Skill_Proxy
      {
         if(!this._skillProxy)
         {
            this._skillProxy = facade.retrieveProxy(Skill_Proxy.NAME) as Skill_Proxy;
         }
         return this._skillProxy;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([10272,10274,10276,10278,10284,10100,50632,10288,10292,10294,10296,10290,82422,83242,83244],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([10272,10274,10276,10278,10284,10100,50632,10288,10292,10294,10296,10290,82422,83242,83244],NAME);
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
      
      public function received_10276(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Skill = null;
         var _loc8_:SkillRes = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         ZLog.add("接收10276:主角技能初始化 ");
         var _loc2_:Number = param1.readDouble();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         GameInstance.mainCharData.attributeInfo.gqNow = _loc3_;
         GameInstance.mainCharData.skillInfo.skillLevel = _loc2_;
         if(GameInstance.mainCharData.attributeInfo.gqNow >= GameInstance.mainCharData.attributeInfo.gqMax)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_ZHENGQI_FULL);
         }
         GameInstance.mainCharData.skillInfo.skillObj = {};
         GameInstance.mainCharData.goodsInfo.skillsOfQuickBar = [];
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc12_ = 0;
            _loc13_ = 0;
            _loc14_ = 0;
            _loc15_ = 0;
            _loc16_ = 0;
            _loc17_ = 0;
            _loc18_ = 0;
            _loc19_ = 0;
            _loc20_ = param1.readInt();
            _loc6_ = param1.readByte();
            _loc21_ = 0;
            if(_loc6_ == 1)
            {
               _loc12_ = param1.readInt();
               _loc21_ = param1.readInt();
               _loc15_ = param1.readInt();
               _loc13_ = param1.readInt();
               _loc17_ = param1.readInt();
               _loc19_ = param1.readInt();
               _loc16_ = _loc15_ - _loc17_;
            }
            _loc14_ = param1.readInt();
            _loc18_ = param1.readByte();
            _loc8_ = SkillResManager.getSkillRes(_loc20_);
            _loc7_ = new Skill(_loc20_,_loc8_.position,_loc21_,_loc19_,_loc12_,_loc16_,_loc6_);
            _loc7_.copper = _loc13_;
            _loc7_.studyLevel = _loc14_;
            _loc7_.shulianCurrent = _loc17_;
            _loc7_.shulianTotal = _loc15_;
            _loc7_.isPingJingSkill = _loc18_;
            if(_loc7_.level == _loc7_.res.grade_limit)
            {
               _loc7_.isTop = 1;
            }
            else
            {
               _loc7_.isTop = 0;
            }
            GameInstance.mainCharData.skillInfo.addSkill(_loc7_);
            if(Boolean(_loc6_) && _loc21_ != 0)
            {
               ExchangePositionManager.addSkillsOfQuickBar(_loc7_);
            }
            if(_loc7_.shulianCurrent > 0 && _loc7_.shulianCurrent >= _loc7_.shulianTotal && _loc7_.grade <= GameInstance.mainCharData.attributeInfo.lv)
            {
               NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_KUNGFU_LV);
            }
            if(_loc19_ > 0 || CDFaceManager.isCooling(_loc7_.getID()))
            {
               CDFaceManager.cdPlay(_loc7_.getID(),_loc7_.getCoolingtime(),_loc7_.getCoolingtime() - _loc19_,0,0,[]);
            }
            _loc5_++;
         }
         var _loc9_:int = param1.readInt();
         _loc5_ = 0;
         while(_loc5_ < _loc9_)
         {
            _loc22_ = param1.readInt();
            _loc6_ = param1.readByte();
            _loc23_ = 0;
            _loc24_ = 0;
            if(_loc6_ == 1)
            {
               _loc24_ = param1.readInt();
               _loc15_ = param1.readInt();
               _loc13_ = param1.readInt();
               _loc17_ = param1.readInt();
               _loc16_ = _loc15_ - _loc17_;
            }
            _loc14_ = param1.readInt();
            _loc18_ = param1.readByte();
            _loc8_ = SkillResManager.getSkillRes(_loc22_);
            _loc7_ = new Skill(_loc22_,_loc8_.position,0,_loc8_.coolingtime,_loc24_,_loc16_,_loc6_);
            _loc7_.copper = _loc13_;
            _loc7_.studyLevel = _loc14_;
            _loc7_.shulianCurrent = _loc17_;
            _loc7_.shulianTotal = _loc15_;
            _loc7_.isPingJingSkill = _loc18_;
            if(_loc7_.level == _loc7_.res.grade_limit)
            {
               _loc7_.isTop = 1;
            }
            else
            {
               _loc7_.isTop = 0;
            }
            GameInstance.mainCharData.skillInfo.addSkill(_loc7_);
            if(_loc7_.shulianCurrent > 0 && _loc7_.shulianCurrent >= _loc7_.shulianTotal && _loc7_.grade <= GameInstance.mainCharData.attributeInfo.lv)
            {
               NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_KUNGFU_LV);
            }
            _loc5_++;
         }
         var _loc10_:int = param1.readInt();
         _loc5_ = 0;
         while(_loc5_ < _loc10_)
         {
            _loc25_ = param1.readInt();
            _loc21_ = param1.readInt();
            _loc8_ = SkillResManager.getSkillRes(_loc22_);
            _loc7_ = new Skill(_loc25_,_loc8_.position,_loc21_);
            _loc7_.isLearn = 1;
            GameInstance.mainCharData.skillInfo.addSkill(_loc7_);
            if(Boolean(_loc6_) && _loc21_ != 0)
            {
               ExchangePositionManager.addSkillsOfQuickBar(_loc7_);
            }
            _loc5_++;
         }
         var _loc11_:int = param1.readInt();
         this.xinFaXiuLianMediator.updateXinFa();
         this.xinFaXiuLianMediator.updateXiuLianSkill(_loc11_);
         ExchangePositionManager.getShortIndexItem();
         ExchangePositionManager.parseSkillStatus();
         this.skillMediator.updateSkillLevel();
         HeadFaceManager.updateCharSkillLevel(GameInstance.mainChar.id,GameInstance.mainCharData.skillInfo.skillLevel);
      }
      
      public function received_10278(param1:ByteArray) : void
      {
         ZLog.add("接收10278:接收主角技能快捷栏更新");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         ExchangePositionManager.setShortKey2(_loc2_,_loc3_);
         ExchangePositionManager.setCurrentMainSkill();
      }
      
      public function received_10274(param1:ByteArray) : void
      {
         ZLog.add("接收10274:接收主角学习新技能消息");
         var _loc2_:int = param1.readInt();
         GameInstance.mainCharData.skillInfo.skillLevel = param1.readDouble();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:Skill = this.skillProxy.getSkill(_loc2_);
         if(!_loc7_)
         {
            return;
         }
         _loc7_.studyLevel = _loc6_;
         _loc7_.quickbarindex = 0;
         _loc7_.level = _loc3_;
         _loc7_.isLearn = 1;
         _loc7_.zhenqi = _loc4_;
         _loc7_.copper = _loc5_;
         _loc7_.shulianCurrent = 0;
         _loc7_.isStudy = 0;
         _loc7_.shulianTotal = _loc7_.zhenqi;
         this.skillMediator.updateMenPaiRight();
         this.skillMediator.updateMenPaiLeft();
         ExchangePositionManager.parseSkillStatus();
         this.skillMediator.updateTab();
         PipeManager.sendMsg(PipeConstants.UPDATE_AFK_CONFIG,[1]);
         this.xinFaXiuLianMediator.updateXinFa();
         this.skillBanghui.updateSkill(_loc2_);
         PipeManager.sendMsg(PipeConstants.UPDATE_SKILL);
         this.skillMediator.showNewSkillMovie(_loc7_);
      }
      
      public function received_10272(param1:ByteArray) : void
      {
         ZLog.add("接收10272:接收主角技能升级消息");
         var _loc2_:int = param1.readInt();
         GameInstance.mainCharData.skillInfo.skillLevel = param1.readDouble();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readByte();
         var _loc8_:Skill = this.skillProxy.getSkill(_loc2_);
         if(!_loc8_)
         {
            return;
         }
         if(Boolean(_loc8_.isLearn) && _loc8_.quickbarindex != 0)
         {
            ExchangePositionManager.deleteSkillsOfQuickBar(_loc8_);
         }
         _loc8_.studyLevel = _loc6_;
         _loc8_.level = _loc3_;
         _loc8_.zhenqi = _loc4_;
         _loc8_.copper = _loc5_;
         _loc8_.shulianCurrent = 0;
         _loc8_.isStudy = 0;
         _loc8_.isPingJingSkill = _loc7_;
         _loc8_.shulianTotal = _loc8_.zhenqi;
         this.skillMediator.updateMenPaiRight();
         this.skillMediator.updateMenPaiLeft();
         if(_loc8_.level == _loc8_.res.grade_limit)
         {
            _loc8_.isTop = 1;
         }
         else
         {
            _loc8_.isTop = 0;
         }
         if(Boolean(_loc8_.isLearn) && _loc8_.quickbarindex != 0)
         {
            ExchangePositionManager.addSkillsOfQuickBar(_loc8_);
         }
         ExchangePositionManager.parseSkillStatus();
         ExchangePositionManager.getShortIndexItem();
         ExchangePositionManager.setCurrentMainSkill();
         this.skillMediator.updateTab();
         this.skillMediator.updateSkillLevel();
      }
      
      public function received_10284(param1:ByteArray) : void
      {
         ZLog.add("接收10284:接收主角技能使用更新熟练度消息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:Skill = this.skillProxy.getSkill(_loc2_);
         if(!_loc4_)
         {
            return;
         }
         if(Boolean(_loc4_.isLearn) && _loc4_.quickbarindex != 0)
         {
            ExchangePositionManager.deleteSkillsOfQuickBar(_loc4_);
         }
         _loc4_.shulianCurrent = _loc3_;
         _loc4_.zhenqi = _loc4_.shulianTotal - _loc4_.shulianCurrent;
         if(Boolean(_loc4_.isLearn) && _loc4_.quickbarindex != 0)
         {
            ExchangePositionManager.addSkillsOfQuickBar(_loc4_);
         }
         ExchangePositionManager.parseSkillStatus();
         this.skillMediator.updateMenPaiRight();
         this.skillMediator.updateTab();
         this.xinFaXiuLianMediator.updateXinFaShow(_loc2_);
         if(_loc4_.shulianCurrent > 0 && _loc4_.shulianCurrent >= _loc4_.shulianTotal && _loc4_.grade <= GameInstance.mainCharData.attributeInfo.lv)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_KUNGFU_LV);
         }
      }
      
      public function received_10100(param1:ByteArray) : void
      {
         ZLog.add("接收10100:接收角色被动技能被触发时在头顶显示技能名称消息");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
      }
      
      public function received_50632(param1:ByteArray) : void
      {
         ZLog.add("接收50632:接收主角心法修炼消息");
         var _loc2_:int = param1.readInt();
         this.xinFaXiuLianMediator.updateXiuLianSkill(_loc2_);
      }
      
      public function received_10288(param1:ByteArray) : void
      {
         ZLog.add("接收10288:接收技能突破成功消息");
         var _loc2_:int = param1.readInt();
         this.skillMediator.skillTupoOK(_loc2_);
      }
      
      public function received_10292(param1:ByteArray) : void
      {
         ZLog.add("接收10292:接收该技能的突破瓶颈信息消息");
         var _loc2_:int = param1.readInt();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:Skill = GameInstance.mainCharData.skillInfo.getSkillByID(_loc2_);
         _loc8_.tupoInfo.tupoCopper = _loc5_;
         _loc8_.tupoInfo.tupoGailv = _loc7_;
         _loc8_.tupoInfo.tupoGoods = _loc3_;
         _loc8_.tupoInfo.tupoTime = _loc6_;
         _loc8_.tupoInfo.tupoZhenqi = _loc4_;
         this.skillMediator.getSkillTuPoInfo(_loc8_);
      }
      
      public function received_10294(param1:ByteArray) : void
      {
         ZLog.add("接收10294:接收更新武功境界消息");
         var _loc2_:Number = param1.readDouble();
         GameInstance.mainCharData.skillInfo.skillLevel = _loc2_;
         this.skillMediator.updateSkillLevel();
      }
      
      public function received_10296(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         var _loc6_:Skill = null;
         ZLog.add("接收10296:武功等级加成更新消息");
         var _loc2_:int = param1.readShort();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readDouble();
            _loc5_ = param1.readDouble();
            _loc6_ = GameInstance.mainCharData.skillInfo.getSkillByID(_loc4_);
            if(_loc6_ != null)
            {
               if(Boolean(_loc6_.isLearn) && _loc6_.quickbarindex != 0)
               {
                  ExchangePositionManager.deleteSkillsOfQuickBar(_loc6_);
               }
               _loc6_.levelAppend = _loc5_;
               if(Boolean(_loc6_.isLearn) && _loc6_.quickbarindex != 0)
               {
                  ExchangePositionManager.addSkillsOfQuickBar(_loc6_);
               }
            }
            _loc3_++;
         }
         ExchangePositionManager.getShortIndexItem();
         this.skillMediator.updateTab();
      }
      
      public function received_10290(param1:ByteArray) : void
      {
         ZLog.add("接收10290:删除技能消息");
         var _loc2_:int = param1.readInt();
         var _loc3_:Skill = GameInstance.mainCharData.skillInfo.getSkillByID(_loc2_);
         ExchangePositionManager.deleteSkillsOfQuickBar(_loc3_);
         _loc3_.isLearn = 0;
         this.skillMediator.updateMenPaiLeft();
         ExchangePositionManager.getShortIndexItem();
         PipeManager.sendMsg(PipeConstants.UPDATE_SKILL);
         PipeManager.sendMsg(PipeConstants.UPDATE_AFK_CONFIG);
      }
      
      public function received_82422(param1:ByteArray) : void
      {
         ZLog.add("接收82412:接收武防消息");
         var _loc2_:Number = param1.readDouble();
         this.skillMediator.setWufang(_loc2_);
      }
      
      public function received_83242(param1:ByteArray) : void
      {
         ZLog.add("接收83242:接收功夫天赋数据");
         var _loc2_:Object = new Object();
         _loc2_.curZhuFu = param1.readInt();
         _loc2_.totalZhuFu = param1.readInt();
         _loc2_.singleUp = param1.readInt();
         _loc2_.tianFuNum = param1.readUTF();
         _loc2_.jinpiaoNum = param1.readInt();
         _loc2_.chenggongNum = param1.readByte();
         this.skillMediator.setTianFuData(_loc2_);
      }
      
      public function received_83244(param1:ByteArray) : void
      {
         ZLog.add("接收83244:接收功夫天赋数据领悟");
         var _loc2_:Boolean = param1.readByte() == 1 ? true : false;
         this.skillMediator.setTianFuUpSuccess(_loc2_);
      }
   }
}

