package com.tgame.moudels.meiren.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.GirlFightStatus;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.vo.character.Girl;
   import com.tgame.common.vo.character.PureGirl;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.meiren.view.MeiRen_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class MeiRen_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "MeiRen_MsgReceivedProxy";
      
      private var _meirenMediator:MeiRen_Mediator;
      
      public function MeiRen_MsgReceivedProxy()
      {
         super(NAME);
      }
      
      private function get meirenMediator() : MeiRen_Mediator
      {
         if(!this._meirenMediator)
         {
            this._meirenMediator = facade.retrieveMediator(MeiRen_Mediator.NAME) as MeiRen_Mediator;
         }
         return this._meirenMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([60052,60054,60056,60060,60062,60064,60088,60090],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([60052,60054,60056,60060,60062,60064,60088,60090],NAME);
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
      
      public function received_60052(param1:ByteArray) : void
      {
         var _loc3_:PureGirl = null;
         var _loc5_:PureGirl = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         ZLog.add("60052：返回美人界面列表");
         var _loc2_:Array = [];
         var _loc4_:* = param1.readInt();
         var _loc6_:Array = new Array();
         var _loc7_:int = 0;
         while(_loc7_ < _loc4_)
         {
            _loc8_ = param1.readInt();
            _loc9_ = param1.readInt();
            _loc5_ = new PureGirl(_loc9_);
            _loc5_.girlAttributeInfo.mid = _loc8_;
            _loc5_.girlAttributeInfo.mkq = param1.readByte();
            _loc5_.girlAttributeInfo.mname = param1.readUTF();
            _loc5_.girlAttributeInfo.mhead = param1.readInt();
            _loc5_.girlAttributeInfo.mResId = _loc9_;
            _loc5_.girlAttributeInfo.mnameColor = param1.readInt();
            _loc5_.girlAttributeInfo.mIsHave = param1.readByte();
            if(_loc5_.girlAttributeInfo.mIsHave)
            {
               _loc5_.girlAttributeInfo.mHaveID = param1.readInt();
               _loc5_.girlAttributeInfo.mlv = param1.readInt();
               _loc5_.girlAttributeInfo.mstate = param1.readByte();
            }
            else
            {
               _loc5_.girlAttributeInfo.mHaveID = 0;
               _loc5_.girlAttributeInfo.mlv = 0;
               _loc5_.girlAttributeInfo.mstate = 2;
            }
            _loc6_.push(_loc5_.girlAttributeInfo);
            _loc5_.girlAttributeInfo.mTimeMax = param1.readInt();
            _loc5_.girlAttributeInfo.mTime = param1.readInt();
            _loc3_ = new PureGirl(_loc5_.girlAttributeInfo.mid);
            _loc3_.id = _loc5_.girlAttributeInfo.mHaveID;
            _loc3_.name = _loc5_.girlAttributeInfo.mname;
            _loc3_.fightStatus = _loc5_.girlAttributeInfo.mstate;
            _loc2_.push(_loc3_);
            _loc7_++;
         }
         GameInstance.mainCharData.girlInfo.init(_loc2_);
         this.meirenMediator.initMeiren(_loc6_);
         this.meirenMediator.setChuzhanBtn();
      }
      
      public function received_60054(param1:ByteArray) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
         var _loc10_:String = null;
         var _loc11_:Array = null;
         var _loc12_:Array = null;
         var _loc13_:Array = null;
         var _loc14_:String = null;
         var _loc15_:int = 0;
         var _loc16_:Skill = null;
         var _loc17_:int = 0;
         var _loc18_:Goods = null;
         var _loc19_:String = null;
         var _loc20_:int = 0;
         ZLog.add("60054：返回单个美人详细信息");
         var _loc2_:Object = new Object();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:PureGirl = new PureGirl(_loc4_);
         _loc5_.girlAttributeInfo.mResId = _loc4_;
         _loc5_.girlAttributeInfo.mid = _loc3_;
         _loc5_.girlAttributeInfo.mname = param1.readUTF();
         _loc5_.girlAttributeInfo.mkq = param1.readByte();
         _loc5_.girlAttributeInfo.mIsHave = param1.readByte();
         if(_loc5_.girlAttributeInfo.mIsHave)
         {
            _loc5_.girlAttributeInfo.mlv = param1.readInt();
            _loc5_.girlAttributeInfo.mexpNow = param1.readDouble();
            _loc5_.girlAttributeInfo.mexpMax = param1.readDouble();
            _loc5_.girlAttributeInfo.mSkillKQ = param1.readInt();
            _loc6_ = param1.readInt();
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc15_ = param1.readInt();
               _loc16_ = new Skill(_loc15_);
               _loc16_.isLearn = 1;
               _loc5_.girlAttributeInfo.mSkill.push(_loc16_);
               _loc7_++;
            }
            _loc8_ = param1.readInt();
            _loc9_ = new Array();
            _loc7_ = 0;
            while(_loc7_ < _loc8_)
            {
               _loc17_ = param1.readInt();
               _loc18_ = new Goods(_loc17_);
               _loc18_.position1 = ItemPositionRange.GOODS_IN_MEIREN_RANGE.x + _loc7_;
               _loc9_.push(_loc18_);
               _loc7_++;
            }
            GameInstance.mainCharData.goodsInfo.goodsMeirenArr = _loc9_;
            _loc5_.girlAttributeInfo.mhp = param1.readDouble();
            _loc5_.girlAttributeInfo.matk = param1.readDouble();
            _loc5_.girlAttributeInfo.matkspeed = param1.readDouble();
            _loc5_.girlAttributeInfo.mcritical = param1.readDouble();
            _loc5_.girlAttributeInfo.mevasion = param1.readDouble();
            _loc5_.girlAttributeInfo.mshiju = param1.readUTF();
            _loc5_.girlAttributeInfo.mIsChanmian = param1.readByte();
            _loc10_ = param1.readUTF();
            _loc11_ = [];
            _loc11_ = _loc10_.split(";");
            _loc7_ = 0;
            while(_loc7_ < _loc11_.length)
            {
               _loc2_ = new Object();
               _loc19_ = _loc11_[_loc7_];
               _loc13_ = _loc19_.split(",");
               _loc2_.name = this.setValue(int(_loc13_[0]));
               _loc2_.value = _loc13_[1];
               _loc5_.girlAttributeInfo.mchanmianArrBC.push(_loc2_);
               _loc7_++;
            }
            _loc12_ = new Array();
            _loc13_ = new Array();
            _loc14_ = param1.readUTF();
            _loc12_ = _loc14_.split(";");
            if(_loc14_ == "")
            {
               _loc7_ = 0;
               while(_loc7_ < _loc12_.length)
               {
                  _loc5_.girlAttributeInfo.mchanmianArr.push(0);
                  _loc7_++;
               }
            }
            else
            {
               _loc7_ = 0;
               while(_loc7_ < _loc12_.length)
               {
                  _loc19_ = _loc12_[_loc7_];
                  _loc13_ = _loc19_.split(",");
                  _loc5_.girlAttributeInfo.mchanmianArr.push(_loc13_[1]);
                  _loc7_++;
               }
            }
            _loc5_.girlAttributeInfo.mchanmianNumMax = param1.readInt();
            _loc5_.girlAttributeInfo.mchanmianNumNow = param1.readInt();
            _loc5_.girlAttributeInfo.mchanmianNumToday = param1.readInt();
            _loc5_.girlAttributeInfo.mchanmianNumTMax = param1.readInt();
            _loc5_.girlAttributeInfo.mchanmianCopper = param1.readInt();
         }
         else
         {
            _loc5_.girlAttributeInfo.mqindianMID = param1.readInt();
            _loc5_.girlAttributeInfo.mqindiLV = param1.readInt();
            _loc20_ = param1.readInt();
            _loc7_ = 0;
            while(_loc7_ < _loc20_)
            {
               _loc2_ = new Object();
               _loc2_.cid = param1.readInt();
               _loc18_ = new Goods(_loc2_.cid);
               _loc2_.name = _loc18_.res.name;
               _loc2_.num = param1.readInt();
               _loc5_.girlAttributeInfo.mqindianCailiaoArr.push(_loc2_);
               _loc7_++;
            }
            _loc5_.girlAttributeInfo.mqindianCopper = param1.readInt();
            _loc5_.girlAttributeInfo.mqindianYB = param1.readInt();
         }
         if(_loc5_.girlAttributeInfo.mkq == 1)
         {
            if(_loc5_.girlAttributeInfo.mIsHave)
            {
               this.meirenMediator.ListClick(_loc5_.girlAttributeInfo,GameInstance.mainCharData.goodsInfo.goodsMeirenArr.length);
               this.meirenMediator.showSprite(0);
            }
            else
            {
               this.meirenMediator.ListClickS(_loc5_.girlAttributeInfo);
               this.meirenMediator.showSprite(1);
            }
         }
         else
         {
            this.meirenMediator.ListClickS(_loc5_.girlAttributeInfo);
            this.meirenMediator.showSprite(2);
         }
      }
      
      private function setValue(param1:int) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case 1:
               _loc2_ = LanResManager.getLanCommonTextWords("攻击");
               break;
            case 2:
               _loc2_ = LanResManager.getLanCommonTextWords("防御");
               break;
            case 3:
               _loc2_ = LanResManager.getLanCommonTextWords("暴击");
               break;
            case 4:
               _loc2_ = LanResManager.getLanCommonTextWords("闪避");
               break;
            case 5:
               _loc2_ = LanResManager.getLanCommonTextWords("生命");
               break;
            case 6:
               _loc2_ = LanResManager.getLanCommonTextWords("体力");
               break;
            case 7:
               _loc2_ = LanResManager.getLanCommonTextWords("内力");
               break;
            case 8:
               _loc2_ = LanResManager.getLanCommonTextWords("攻击速度");
               break;
            case 9:
               _loc2_ = LanResManager.getLanCommonTextWords("移动速度");
               break;
            case 10:
               _loc2_ = LanResManager.getLanCommonTextWords("命中");
               break;
            case 20:
               _loc2_ = LanResManager.getLanCommonTextWords("青龙站纹");
               break;
            case 21:
               _loc2_ = LanResManager.getLanCommonTextWords("朱雀站纹");
               break;
            case 22:
               _loc2_ = LanResManager.getLanCommonTextWords("白虎站纹");
               break;
            case 23:
               _loc2_ = LanResManager.getLanCommonTextWords("玄武站纹");
               break;
            case 25:
               _loc2_ = LanResManager.getLanCommonTextWords("爆击免伤比例");
               break;
            case 32:
               _loc2_ = LanResManager.getLanCommonTextWords("暗器免伤比例");
               break;
            case 33:
               _loc2_ = LanResManager.getLanCommonTextWords("抵抗弓箭比例");
               break;
            case 34:
               _loc2_ = LanResManager.getLanCommonTextWords("抵抗丹田比例");
               break;
            case 47:
               _loc2_ = LanResManager.getLanCommonTextWords("抵抗暴击伤害几率");
               break;
            case 48:
               _loc2_ = LanResManager.getLanCommonTextWords("被攻击时有几率触发狂暴技能（3秒内增加人物攻击伤害30%）");
               break;
            case 49:
               _loc2_ = LanResManager.getLanCommonTextWords("武功层数");
         }
         return _loc2_;
      }
      
      public function received_60056(param1:ByteArray) : void
      {
         ZLog.add("60056：返回美人出战/休息结果");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         if(_loc3_ == 1)
         {
            GameInstance.mainCharData.girlInfo.setGirlFightStatus(_loc2_,GirlFightStatus.SHOW);
         }
         else
         {
            GameInstance.mainCharData.girlInfo.setGirlFightStatus(_loc2_,GirlFightStatus.REST);
         }
         this.meirenMediator.setListBtn(_loc3_);
         this.meirenMediator.requestMeiren();
      }
      
      public function received_60060(param1:ByteArray) : void
      {
         ZLog.add("60060：返回美人钦点结果");
         var _loc2_:int = param1.readByte();
         if(_loc2_)
         {
            this.meirenMediator.requestMeiren();
            this.meirenMediator.lianziMc(3);
         }
      }
      
      public function received_60062(param1:ByteArray) : void
      {
         ZLog.add("60062：返回美人缠绵结果");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            this.meirenMediator.requestMeiren();
            this.meirenMediator.lianziMc(2);
         }
         else
         {
            this.meirenMediator.cmBtn(true);
         }
      }
      
      public function received_60064(param1:ByteArray) : void
      {
         var _loc8_:Girl = null;
         var _loc9_:AvatarParamData = null;
         ZLog.add("60064： 收到美人升级");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readShort();
         var _loc5_:Number = param1.readDouble();
         var _loc6_:Number = param1.readDouble();
         var _loc7_:SceneCharacter = GameInstance.scene.getCharByID(_loc3_,SceneCharacterType.GIRL);
         if(_loc7_ != null)
         {
            _loc8_ = _loc7_.data as Girl;
            if(_loc8_ != null)
            {
               _loc8_.attributeInfo.lv = _loc4_;
               _loc8_.attributeInfo.hpNow = _loc5_;
               _loc8_.attributeInfo.hpMax = _loc6_;
            }
            _loc9_ = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_LEVEL_UP),AvatarPartType.MAGIC);
            _loc7_.loadAvatarPart(_loc9_);
         }
         if(_loc7_ == GameInstance.lockOnChar)
         {
            PipeManager.sendMsg(PipeConstants.CHANGED_LOCKEDCHAR_BASE_ATTR,GameInstance.lockOnChar);
         }
      }
      
      public function received_60088(param1:ByteArray) : void
      {
         var _loc5_:Skill = null;
         ZLog.add("60088： 收到美人技能列表");
         var _loc2_:Array = new Array();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = new Skill(param1.readInt());
            _loc5_.isLearn = param1.readByte();
            _loc2_.push(_loc5_);
            _loc4_++;
         }
         this.meirenMediator.showMeirenAllSkill(_loc2_);
      }
      
      public function received_60090(param1:ByteArray) : void
      {
         var _loc5_:Skill = null;
         ZLog.add("60090： 收到美人重置技能结果");
         var _loc2_:Array = new Array();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = new Skill(param1.readInt());
            _loc5_.isLearn = 1;
            _loc2_.push(_loc5_);
            _loc4_++;
         }
         this.meirenMediator.setMeiRenSkill(_loc2_);
      }
   }
}

