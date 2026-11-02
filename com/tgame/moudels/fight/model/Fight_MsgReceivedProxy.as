package com.tgame.moudels.fight.model
{
   import com.fireice.panel.FPanel;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.anqi.AnQiRes;
   import com.tgame.common.res.anqi.AnqiResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.TaskTargetType;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.character.info.AnQiInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.McBaseItem;
   import com.tgame.manager.FightManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TaskTracker;
   import com.tgame.moudels.fight.view.Fight_AnqiActiveMediator;
   import com.tgame.moudels.fight.view.Fight_AnqiMediator;
   import com.tgame.moudels.fight.view.Fight_AnqiOtherMediator;
   import com.tgame.moudels.fight.view.Fight_PKMediator;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.handler.HandlerThread;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.utils.Transformer;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import flash.utils.ByteArray;
   import gs.TweenLite;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Fight_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Fight_MsgReceivedProxy";
      
      private static var huadongHT:HandlerThread = new HandlerThread();
      
      private var _fightProxy:Fight_proxy;
      
      private var _fightBuffProxy:Fight_BuffProxy;
      
      public var thread:HandlerThread = new HandlerThread();
      
      public var thread1:HandlerThread = new HandlerThread();
      
      private var _lianzhanProxy:Fight_LianZhanProxy;
      
      private var _pkMeditor:Fight_PKMediator;
      
      private var _anqiMeditor:Fight_AnqiMediator;
      
      private var _anqiOtherMeditor:Fight_AnqiOtherMediator;
      
      private var _anqiActiveMeditor:Fight_AnqiActiveMediator;
      
      public function Fight_MsgReceivedProxy(param1:Object = null)
      {
         super(NAME,param1);
      }
      
      private function get fightProxy() : Fight_proxy
      {
         if(!this._fightProxy)
         {
            this._fightProxy = facade.retrieveProxy(Fight_proxy.NAME) as Fight_proxy;
         }
         return this._fightProxy;
      }
      
      public function get lianzhanProxy() : Fight_LianZhanProxy
      {
         if(this._lianzhanProxy == null)
         {
            this._lianzhanProxy = facade.retrieveProxy(Fight_LianZhanProxy.NAME) as Fight_LianZhanProxy;
         }
         return this._lianzhanProxy;
      }
      
      public function get fightBuffProxy() : Fight_BuffProxy
      {
         if(this._fightBuffProxy == null)
         {
            this._fightBuffProxy = facade.retrieveProxy(Fight_BuffProxy.NAME) as Fight_BuffProxy;
         }
         return this._fightBuffProxy;
      }
      
      private function get pkMeditor() : Fight_PKMediator
      {
         if(this._pkMeditor == null)
         {
            this._pkMeditor = facade.retrieveMediator(Fight_PKMediator.NAME) as Fight_PKMediator;
         }
         return this._pkMeditor;
      }
      
      private function get anqiMeditor() : Fight_AnqiMediator
      {
         if(this._anqiMeditor == null)
         {
            this._anqiMeditor = facade.retrieveMediator(Fight_AnqiMediator.NAME) as Fight_AnqiMediator;
         }
         return this._anqiMeditor;
      }
      
      private function get anqiOtherMeditor() : Fight_AnqiOtherMediator
      {
         if(this._anqiOtherMeditor == null)
         {
            this._anqiOtherMeditor = facade.retrieveMediator(Fight_AnqiOtherMediator.NAME) as Fight_AnqiOtherMediator;
         }
         return this._anqiOtherMeditor;
      }
      
      private function get anqiActiveMeditor() : Fight_AnqiActiveMediator
      {
         if(this._anqiActiveMeditor == null)
         {
            this._anqiActiveMeditor = facade.retrieveMediator(Fight_AnqiActiveMediator.NAME) as Fight_AnqiActiveMediator;
         }
         return this._anqiActiveMeditor;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([10086,10400,10402,10404,10406,10408,10410,10658,10148,12001,12002,10144,10162,10154,10150,10142,11168,11170,20046,20048,20040,20076,20078,10902,10088,10904,10906,10286,10102,11150,52000,52002,52004,52006,52008,52012,52014,52016,52018,52020,52022,52024,53960,10412,20050,10152,61032,61036,72456],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([10086,10400,10402,10404,10406,10408,10410,10658,10148,12001,12002,10144,10162,10154,10150,10142,11168,11170,20046,20048,20040,20076,20078,10902,10088,10904,10906,10286,10102,52018,52020,52022,52024,53960,10412,20050,10152,61032,61036,72456],NAME);
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
      
      public function received_10086(param1:ByteArray) : void
      {
         var tag:int;
         var useSkillOnebyOne:Function;
         var useSkillOnebyOne1:Function;
         var selfSkillID:int = 0;
         var selfSkillLevel:int = 0;
         var selfType:int = 0;
         var selfID:int = 0;
         var count:int = 0;
         var i:int = 0;
         var targets:Array = null;
         var useType:int = 0;
         var isCD:Boolean = false;
         var delay:int = 0;
         var targetType:int = 0;
         var targetID:int = 0;
         var len:int = 0;
         var id:int = 0;
         var failureType:int = 0;
         var $data:ByteArray = param1;
         ZLog.add("10086：其他角色攻击其他角色消息");
         tag = $data.readByte();
         if(tag == 1)
         {
            selfSkillID = $data.readInt();
            if(selfSkillID == OtherConst.LIUMAISHNEJIAN_SKILL_ID_7)
            {
               delay = $data.readShort();
            }
            if(selfSkillID != 50000)
            {
            }
            selfSkillLevel = $data.readShort();
            selfType = $data.readByte();
            selfID = $data.readInt();
            count = $data.readByte();
            targets = [];
            i = 0;
            while(i < count)
            {
               targetType = $data.readByte();
               targetID = $data.readInt();
               targets[targets.length] = [targetType,targetID];
               i++;
            }
            useType = $data.readByte();
            isCD = Boolean($data.readByte() == 1);
            if(selfSkillID >= OtherConst.LIUMAISHNEJIAN_SKILL_ID_1 && selfSkillID <= OtherConst.LIUMAISHNEJIAN_SKILL_ID_7)
            {
               useSkillOnebyOne = function(param1:int):void
               {
                  if(param1)
                  {
                     fightProxy.receivedCharAttackChars(param1,1,selfType,selfID,targets,-1,-1,0,0,0,isCD);
                  }
               };
               len = int(selfSkillID.toString().substr(selfSkillID.toString().length - 1,1));
               id = 8;
               while(id < len + 8)
               {
                  this.thread.push(useSkillOnebyOne,[OtherConst["LIUMAISHNEJIAN_SKILL_ID_" + id]],200);
                  id++;
               }
            }
            else if(selfSkillID == OtherConst.FABAOHULU_SKILL_ID)
            {
               useSkillOnebyOne1 = function(param1:int):void
               {
                  if(param1)
                  {
                     fightProxy.receivedCharAttackChars(param1,1,selfType,selfID,targets);
                  }
               };
               id = 0;
               while(id < 7)
               {
                  this.thread1.push(useSkillOnebyOne1,[OtherConst.FABAOHULU_SKILL_ID],200);
                  id++;
               }
            }
            else
            {
               this.fightProxy.receivedCharAttackChars(selfSkillID,selfSkillLevel,selfType,selfID,targets,-1,-1,0,0,useType,isCD);
            }
         }
         else
         {
            failureType = $data.readByte();
            this.fightProxy.receivedAttackFailure(failureType);
         }
      }
      
      public function received_10400(param1:ByteArray) : void
      {
         ZLog.add("10400：弓箭--连珠箭(面伤害，群攻)");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readShort();
         var _loc6_:int = param1.readShort();
         var _loc7_:int = param1.readShort();
         var _loc8_:int = param1.readByte();
         this.fightProxy.received_bowAttack_lianzhujian(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
      }
      
      public function received_10402(param1:ByteArray) : void
      {
         ZLog.add("10402：弓箭--穿刺箭(线伤害，群攻)");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readShort();
         var _loc6_:int = param1.readShort();
         this.fightProxy.received_bowAttack_chuanzijian(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_);
      }
      
      public function received_10404(param1:ByteArray) : void
      {
         ZLog.add("10404：弓箭--其他箭");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readByte();
         var _loc6_:int = param1.readInt();
         this.fightProxy.received_bowAttack_others(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_);
      }
      
      public function received_10406(param1:ByteArray) : void
      {
         ZLog.add("10406：丹田技能--只有触发效果");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         this.fightProxy.received_dantian_FROM(_loc2_,_loc3_);
      }
      
      public function received_10408(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         ZLog.add("10408：丹田技能--触发+弹道+群攻");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readByte();
         var _loc6_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc7_ = param1.readByte();
            _loc8_ = param1.readInt();
            _loc6_[_loc6_.length] = [_loc7_,_loc8_];
            _loc5_++;
         }
         this.fightProxy.received_dantian_FROM_PASS_TO(_loc2_,_loc3_,_loc6_);
      }
      
      public function received_10410(param1:ByteArray) : void
      {
         ZLog.add("10410：直接在玩家身上播放技能下效果(广播)");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         this.fightProxy.received_self_skill(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_10658(param1:ByteArray) : void
      {
         ZLog.add("10658：骑乘坐骑组合技攻击");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         this.fightProxy.receivedRideMountZuheji(_loc2_,_loc3_);
      }
      
      public function received_10286(param1:ByteArray) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         ZLog.add("10286：点击地面攻击广播");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readShort();
         var _loc6_:int = param1.readShort();
         var _loc7_:int = param1.readByte();
         var _loc11_:Array = [];
         _loc8_ = 0;
         while(_loc8_ < _loc7_)
         {
            _loc9_ = param1.readByte();
            _loc10_ = param1.readInt();
            _loc11_[_loc11_.length] = [_loc9_,_loc10_];
            _loc8_++;
         }
         this.fightProxy.receivedCharAttackChars(_loc2_,0,_loc3_,_loc4_,_loc11_,_loc5_,_loc6_);
      }
      
      public function received_10148(param1:ByteArray) : void
      {
         var _loc7_:int = 0;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:int = 0;
         ZLog.add("10148：角色被攻击直接影响");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readByte();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readByte();
         var _loc8_:int = param1.readByte();
         if(_loc8_ == 0 || _loc8_ == 4)
         {
            _loc11_ = param1.readDouble();
            _loc12_ = param1.readDouble();
            _loc13_ = param1.readByte();
            if(_loc13_ == 2)
            {
               _loc7_ = 1;
            }
         }
         var _loc9_:int = param1.readByte();
         var _loc10_:int = param1.readByte();
         this.fightProxy.receivedSkillShowEffectHP(_loc2_,_loc4_,_loc3_,_loc6_,_loc5_,_loc8_,_loc11_,_loc12_,_loc13_,_loc9_,_loc10_,0,_loc7_);
      }
      
      public function received_20046(param1:ByteArray) : void
      {
         ZLog.add("20046：玩家死亡/击退死亡");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:Boolean = Boolean(param1.readByte() == 1);
         var _loc5_:int = -1;
         var _loc6_:int = -1;
         if(!_loc4_)
         {
            _loc5_ = param1.readByte();
            _loc6_ = param1.readInt();
         }
         this.fightProxy.receivedCharDeath(_loc3_,_loc2_,_loc5_,_loc6_,_loc4_);
      }
      
      public function received_20048(param1:ByteArray) : void
      {
         ZLog.add("20048：怪物死亡");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readInt();
         this.fightProxy.receivedCharDeath(_loc2_,SceneCharacterType.MONSTER,_loc3_,_loc4_);
      }
      
      public function received_20050(param1:ByteArray) : void
      {
         ZLog.add("20050：美人死亡");
         var _loc2_:int = param1.readInt();
         this.fightProxy.receivedCharDeath(_loc2_,SceneCharacterType.GIRL);
      }
      
      public function received_20040(param1:ByteArray) : void
      {
         ZLog.add("20040：怪物击退死亡");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readInt();
         this.fightProxy.receivedCharDeath(_loc2_,SceneCharacterType.MONSTER,_loc3_,_loc4_);
      }
      
      public function received_20078(param1:ByteArray) : void
      {
         ZLog.add("20078：玩家复活延时");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         this.fightProxy.receivedCharDelayRelive(_loc2_,SceneCharacterType.PLAYER,_loc3_);
      }
      
      public function received_20076(param1:ByteArray) : void
      {
         ZLog.add("20076：玩家复活");
         var _loc2_:int = param1.readInt();
         this.fightProxy.receivedCharRelive(_loc2_,SceneCharacterType.PLAYER);
      }
      
      public function received_12001(param1:ByteArray) : void
      {
         ZLog.add("12001：接收主角连斩消息");
         var _loc2_:int = param1.readShort();
         this.lianzhanProxy.lianzhan(GameInstance.mainCharData.lianzhanInfo.getTime(),_loc2_);
      }
      
      public function received_12002(param1:ByteArray) : void
      {
         ZLog.add("12002：接收主角连斩信息消息");
         GameInstance.mainCharData.lianzhanInfo.id = param1.readByte();
      }
      
      public function received_10144(param1:ByteArray) : void
      {
         ZLog.add("10144：接收角色被击退");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readShort();
         var _loc5_:int = param1.readShort();
         var _loc6_:int = param1.readByte();
         this.fightProxy.receivedCharAttackBack(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_);
      }
      
      public function received_10162(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         ZLog.add("10162：接收主角被定身，绵骨，阴风，沉睡, 失明, 神爪，青龙魔失明，迷雾, 血刀");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            FightManager.be_fixed(GameInstance.mainChar,false);
         }
         else if(_loc2_ == 2)
         {
            FightManager.be_soft(GameInstance.mainChar,false);
         }
         else if(_loc2_ == 3)
         {
            FightManager.be_inDrink(GameInstance.mainChar,false);
         }
         else if(_loc2_ == 4)
         {
            FightManager.be_sleep(GameInstance.mainChar,false);
         }
         else if(_loc2_ == 5)
         {
            FightManager.be_blind(GameInstance.mainChar,false);
         }
         else if(_loc2_ == 6)
         {
            _loc3_ = param1.readInt();
            FightManager.be_jiuYinShenZhua(GameInstance.mainChar,_loc3_,false);
            FightManager.screen_shake(0.4,50);
         }
         else if(_loc2_ == 7)
         {
            FightManager.be_qlblind(GameInstance.mainChar,false);
         }
         else if(_loc2_ == 8)
         {
            FightManager.be_miwu(GameInstance.mainChar,false);
         }
         else if(_loc2_ == 9)
         {
            _loc3_ = param1.readInt();
            FightManager.be_xueDao(GameInstance.mainChar,_loc3_,false);
            FightManager.screen_shake(0.4,50);
         }
         else if(_loc2_ == 10)
         {
            FightManager.be_stop(GameInstance.mainChar,false);
         }
         else if(_loc2_ == 11)
         {
            FightManager.be_ZiQi(GameInstance.mainChar,false);
         }
         else if(_loc2_ == 12)
         {
            FightManager.be_Muzhiren(GameInstance.mainChar,false);
         }
         else if(_loc2_ == 13)
         {
            FightManager.be_ZiJinHuLu(GameInstance.mainChar,false);
         }
         else if(_loc2_ == 14)
         {
            FightManager.be_duoMingShiSanJian(GameInstance.mainChar,false);
         }
         else if(_loc2_ == 15)
         {
            FightManager.be_xiangLongAoYi(GameInstance.mainChar,false);
         }
      }
      
      public function received_10154(param1:ByteArray) : void
      {
         ZLog.add("10154：接收主角解除定身，绵骨，阴风，沉睡, 失明, 神爪，青龙魔失明，迷雾,血刀");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            FightManager.be_fixed(GameInstance.mainChar,true);
         }
         else if(_loc2_ == 2)
         {
            FightManager.be_soft(GameInstance.mainChar,true);
         }
         else if(_loc2_ == 3)
         {
            FightManager.be_inDrink(GameInstance.mainChar,true);
         }
         else if(_loc2_ == 4)
         {
            FightManager.be_sleep(GameInstance.mainChar,true);
         }
         else if(_loc2_ == 5)
         {
            FightManager.be_blind(GameInstance.mainChar,true);
         }
         else if(_loc2_ == 6)
         {
            FightManager.be_jiuYinShenZhua(GameInstance.mainChar,0,true);
         }
         else if(_loc2_ == 7)
         {
            FightManager.be_qlblind(GameInstance.mainChar,true);
         }
         else if(_loc2_ == 8)
         {
            FightManager.be_miwu(GameInstance.mainChar,true);
         }
         else if(_loc2_ == 9)
         {
            FightManager.be_xueDao(GameInstance.mainChar,0,true);
         }
         else if(_loc2_ == 10)
         {
            FightManager.be_stop(GameInstance.mainChar,true);
         }
         else if(_loc2_ == 11)
         {
            FightManager.be_ZiQi(GameInstance.mainChar,true);
         }
         else if(_loc2_ == 12)
         {
            FightManager.be_Muzhiren(GameInstance.mainChar,true);
         }
         else if(_loc2_ == 13)
         {
            FightManager.be_ZiJinHuLu(GameInstance.mainChar,true);
         }
         else if(_loc2_ == 14)
         {
            FightManager.be_duoMingShiSanJian(GameInstance.mainChar,true);
         }
         else if(_loc2_ == 15)
         {
            FightManager.be_xiangLongAoYi(GameInstance.mainChar,true);
         }
      }
      
      public function received_10150(param1:ByteArray) : void
      {
         ZLog.add("10150：接收角色触发Buff");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:Number = param1.readDouble();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readByte();
         var _loc10_:String = param1.readUTF();
         this.fightBuffProxy.r_trigBuff(_loc4_,_loc2_,_loc3_,_loc5_,_loc6_,_loc7_,_loc8_,0,_loc9_,_loc10_);
      }
      
      public function received_11150(param1:ByteArray) : void
      {
         ZLog.add("11150：接收VIP月卡触发Buff");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:Number = param1.readDouble();
         this.fightBuffProxy.r_trigBuff(_loc3_,SceneCharacterType.PLAYER,_loc2_,0,0,0,0,_loc4_,1);
      }
      
      public function received_10142(param1:ByteArray) : void
      {
         ZLog.add("10142：取消角色触发Buff");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         this.fightBuffProxy.r_cancelBuff(_loc4_,_loc2_,_loc3_);
      }
      
      public function received_10152(param1:ByteArray) : void
      {
         ZLog.add("10152：比武招亲飞大雕");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         this.fightBuffProxy.feidadiao(_loc2_,_loc3_);
      }
      
      public function received_61032(param1:ByteArray) : void
      {
         ZLog.add("61032：夫妻竞技飞大雕");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = 0;
         if(_loc2_ == 0)
         {
            _loc4_ = 0;
         }
         else
         {
            _loc4_ = param1.readInt();
         }
         this.fightBuffProxy.FQJJfeidadiao(_loc3_,_loc4_);
         PipeManager.sendMsg(PipeConstants.HIDE_ALL_UI_EXCEPT_MAINUI,2);
      }
      
      public function received_61036(param1:ByteArray) : void
      {
         var _loc5_:AvatarParamData = null;
         var _loc6_:AvatarParamData = null;
         ZLog.add("61036：夫妻竞技飞大雕给周围玩家加经验震屏爆炸特效");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         if(_loc3_ == 0)
         {
            FightManager.screen_shake(0.4,50);
         }
         else
         {
            FightManager.screen_shake(1,50);
         }
         var _loc4_:SceneCharacter = GameInstance.scene.getCharByID(_loc2_);
         if(_loc4_ != null)
         {
            _loc5_ = new AvatarParamData();
            _loc6_ = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_XUEWEI_OPEN),AvatarPartType.MAGIC);
            _loc4_.showMagic_from1passNtoRectArea(new Point(_loc4_.piexl_x,_loc4_.piexl_y),10 * 25,10 * 25,5 * 25,false,_loc5_,_loc6_,null);
         }
      }
      
      public function received_11168(param1:ByteArray) : void
      {
         ZLog.add("11168：主角（或其队友）杀死了怪物");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         TaskTracker.doTask(TaskTargetType.TARGET_MONSTER,_loc2_);
         this.fightProxy.useLianZhan(_loc2_,_loc3_);
      }
      
      public function received_11170(param1:ByteArray) : void
      {
         var type:int;
         var len:int;
         var itemFaceArr:Array;
         var i:int;
         var tileP:Point;
         var backpackBtn:DisplayObject;
         var dis:Number;
         var pixelP:Point = null;
         var toPixelP:Point = null;
         var dur:Number = NaN;
         var addHuadong:Function = null;
         var goodsID:int = 0;
         var goodsCount:int = 0;
         var goods:Goods = null;
         var itemFace:ItemFace = null;
         var mcItem:McBaseItem = null;
         var giftPanel:FPanel = null;
         var npcShopPanel:FPanel = null;
         var npcSc:SceneCharacter = null;
         var playerSc:SceneCharacter = null;
         var otherCharShop:FPanel = null;
         var mallPanel:FPanel = null;
         var squirrelGiftPanel:FPanel = null;
         var tianFuSuiPianHeChengPanel:FPanel = null;
         var $data:ByteArray = param1;
         addHuadong = function(param1:ItemFace):void
         {
            var onComplete:Function = null;
            var $itemFace:ItemFace = param1;
            onComplete = function():void
            {
               if($itemFace.parent != null)
               {
                  $itemFace.parent.removeChild($itemFace);
                  $itemFace.destroy();
               }
            };
            $itemFace.x = pixelP.x;
            $itemFace.y = pixelP.y;
            GameInstance.stage.addChild($itemFace);
            TweenLite.to($itemFace,dur,{
               "x":toPixelP.x,
               "y":toPixelP.y,
               "alpha":0.35,
               "onComplete":onComplete
            });
         };
         ZLog.add("11170：主角得到道具播放道具滑入包裹特效");
         type = $data.readByte();
         len = $data.readShort();
         itemFaceArr = [];
         i = 0;
         while(i < len)
         {
            goodsID = $data.readInt();
            goodsCount = $data.readShort();
            goods = new Goods(goodsID);
            goods.count = goodsCount;
            if(goods.res.kind == 48)
            {
               mcItem = new McBaseItem(goodsID);
               itemFace = new ItemFace(mcItem,25,25);
            }
            else
            {
               itemFace = new ItemFace(goods,25,25);
            }
            itemFace.mouseEnabled = false;
            itemFace.mouseChildren = false;
            itemFaceArr.push(itemFace);
            i++;
         }
         tileP = new Point();
         pixelP = new Point();
         if(type == 1)
         {
            tileP.x = $data.readShort();
            tileP.y = $data.readShort();
            pixelP = Transformer.transTilePoint2PixelPoint(tileP);
            pixelP = GameInstance.scene.localToGlobal(pixelP);
         }
         else if(type == 2 || type == 3)
         {
            giftPanel = GameInstance.uiInstance._giftPanel;
            if(Fun.isVisible(giftPanel))
            {
               pixelP = giftPanel.localToGlobal(new Point(giftPanel.panelWidth / 2,giftPanel.panelHeight / 2));
            }
            else
            {
               pixelP = new Point(GameInstance.stage.stageWidth / 2,GameInstance.stage.stageHeight / 2);
            }
         }
         else if(type == 4)
         {
            npcShopPanel = GameInstance.uiInstance._npcShopPanel;
            if(Fun.isVisible(npcShopPanel))
            {
               pixelP = npcShopPanel.localToGlobal(new Point(npcShopPanel.panelWidth / 2,npcShopPanel.panelHeight / 2));
            }
            else
            {
               npcSc = GameInstance.scene.getCharByID($data.readInt(),SceneCharacterType.NPC);
               if(npcSc != null)
               {
                  pixelP.x = npcSc.piexl_x;
                  pixelP.y = npcSc.piexl_y;
                  pixelP = GameInstance.scene.localToGlobal(pixelP);
               }
               else
               {
                  pixelP = new Point(GameInstance.stage.stageWidth / 2,GameInstance.stage.stageHeight / 2);
               }
            }
         }
         else if(type == 5)
         {
            playerSc = GameInstance.scene.getCharByID($data.readInt());
            tileP.x = $data.readShort();
            tileP.y = $data.readShort();
            if(playerSc != null)
            {
               pixelP.x = playerSc.piexl_x;
               pixelP.y = playerSc.piexl_y;
            }
            else
            {
               pixelP = Transformer.transTilePoint2PixelPoint(tileP);
            }
            pixelP = GameInstance.scene.localToGlobal(pixelP);
         }
         else if(type == 6)
         {
            otherCharShop = GameInstance.uiInstance._otherCharShop;
            if(Fun.isVisible(otherCharShop))
            {
               pixelP = otherCharShop.localToGlobal(new Point(otherCharShop.panelWidth / 2,otherCharShop.panelHeight / 2));
            }
            else
            {
               pixelP = new Point(GameInstance.stage.stageWidth / 2,GameInstance.stage.stageHeight / 2);
            }
         }
         else if(type == 7)
         {
            mallPanel = GameInstance.uiInstance._mallPanel;
            if(Fun.isVisible(mallPanel))
            {
               pixelP = mallPanel.localToGlobal(new Point(mallPanel.panelWidth / 2,mallPanel.panelHeight / 2));
            }
            else
            {
               pixelP = new Point(GameInstance.stage.stageWidth / 2,GameInstance.stage.stageHeight / 2);
            }
         }
         else if(type == 8)
         {
            pixelP = new Point(GameInstance.stage.stageWidth / 2,GameInstance.stage.stageHeight / 2);
         }
         else if(type == 9)
         {
            squirrelGiftPanel = GameInstance.uiInstance._squirrelGiftPanel;
            if(Fun.isVisible(squirrelGiftPanel))
            {
               pixelP = squirrelGiftPanel.localToGlobal(new Point(squirrelGiftPanel.panelWidth / 2,squirrelGiftPanel.panelHeight / 2));
            }
            else
            {
               pixelP = new Point(GameInstance.stage.stageWidth / 2,GameInstance.stage.stageHeight / 2);
            }
         }
         else if(type == 10)
         {
            tianFuSuiPianHeChengPanel = GameInstance.uiInstance._tianFuSuiPianHeChengPanel;
            if(Fun.isVisible(tianFuSuiPianHeChengPanel))
            {
               pixelP = tianFuSuiPianHeChengPanel.localToGlobal(new Point(90 + 35 / 2,184 + 35 / 2));
            }
            else
            {
               pixelP = new Point(GameInstance.stage.stageWidth / 2,GameInstance.stage.stageHeight / 2);
            }
         }
         backpackBtn = GameInstance.uiInstance.mainUI.functionContainer.backpackBtn;
         toPixelP = backpackBtn.localToGlobal(new Point(backpackBtn.width / 2 - 15,backpackBtn.height / 2 - 20));
         dis = Point.distance(pixelP,toPixelP);
         dur = dis * 0.003;
         for each(itemFace in itemFaceArr)
         {
            huadongHT.push(addHuadong,[itemFace],200);
         }
      }
      
      public function received_10902(param1:ByteArray) : void
      {
         ZLog.add("10902：PK模式切换");
         var _loc2_:int = param1.readByte();
         this.pkMeditor.switchPKMode(_loc2_);
         GameInstance.tabSelectArr.length = 0;
      }
      
      public function received_10088(param1:ByteArray) : void
      {
         ZLog.add("10088：PK时的表情");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         this.pkMeditor.showPK(_loc2_,_loc3_);
      }
      
      public function received_10904(param1:ByteArray) : void
      {
         ZLog.add("10904：PK时的表情");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_CHAT,LanResManager.getLanTextWords(this,"需要人物达到10级并且要切换到pk模式"));
         }
         else if(_loc2_ == 2)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_CHAT,LanResManager.getLanTextWords(this,"对方处于新手保护期不能被攻击"));
         }
      }
      
      public function received_10906(param1:ByteArray) : void
      {
         ZLog.add("10906：自动用平砍打怪");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:SceneCharacter = GameInstance.scene.getCharByID(_loc3_,_loc2_);
         if(!_loc4_)
         {
            return;
         }
         this.fightProxy.attackChar(_loc4_,OtherConst.DEFAULT_SKILL_ID,OtherConst.DEFAULT_SKILL_DISTANCE,true);
      }
      
      public function received_10102(param1:ByteArray) : void
      {
         ZLog.add("10102：当角色被动技能被触发时在头顶显示技能名称");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         this.fightProxy.showXinFaSKillName(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_52000(param1:ByteArray) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         ZLog.add("52000：其他角色暗器攻击其他角色消息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readByte();
         var _loc9_:Array = [];
         _loc8_ = 0;
         while(_loc8_ < _loc5_)
         {
            _loc6_ = param1.readByte();
            _loc7_ = param1.readInt();
            _loc9_[_loc9_.length] = [_loc6_,_loc7_];
            _loc8_++;
         }
         var _loc10_:AnQiRes = AnqiResManager.getAnQiRes(_loc2_);
         var _loc11_:int = 1;
         this.fightProxy.receivedCharAttackChars(_loc10_.skillID,0,_loc3_,_loc4_,_loc9_,-1,-1,_loc11_);
      }
      
      public function received_52002(param1:ByteArray) : void
      {
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:int = 0;
         ZLog.add("52002：受到暗器攻击影响");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readByte();
         var _loc6_:int = param1.readByte();
         if(_loc6_ == 0)
         {
            _loc8_ = param1.readDouble();
            _loc9_ = param1.readDouble();
            _loc10_ = param1.readByte();
         }
         var _loc7_:int = 1;
         this.fightProxy.receivedSkillShowEffectHP(_loc3_,_loc2_,_loc5_,_loc4_,_loc6_,_loc8_,_loc9_,_loc10_,0,0,_loc7_);
      }
      
      public function received_52004(param1:ByteArray) : void
      {
         ZLog.add("52004：增加当前暗器熟练度");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         this.anqiMeditor.setAnqiShuLian(_loc2_,_loc3_);
      }
      
      public function received_52006(param1:ByteArray) : void
      {
         ZLog.add("52006：开启暗器使用");
         var _loc2_:int = param1.readByte();
         this.anqiMeditor.setOpen(_loc2_);
      }
      
      public function received_52008(param1:ByteArray) : void
      {
         ZLog.add("52008：当前暗器信息初始化（第一次进入场景）");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readByte();
         var _loc9_:int = 0;
         if(param1.bytesAvailable > 0)
         {
            _loc9_ = param1.readInt();
            if(_loc9_ < 60)
            {
               _loc9_ = 60;
            }
         }
         var _loc10_:AnQiInfo = GameInstance.mainCharData.anqiInfo;
         _loc10_.have = _loc2_;
         _loc10_.anqiID = _loc3_;
         _loc10_.shulian = _loc4_;
         _loc10_.xiulian = _loc5_;
         _loc10_.xiulianMax = _loc6_;
         _loc10_.zhufu = _loc7_;
         _loc10_.isOpen = _loc8_;
         _loc10_.isKf = param1.readByte() == 1;
         _loc10_.isNowKf = param1.readByte() == 1;
         _loc10_.skillId = param1.readInt();
         _loc10_.tangMenMiJi = param1.readByte() == 1 ? true : false;
         _loc10_.zhongJiAnqi = param1.readByte() == 1 ? true : false;
         var _loc11_:Boolean = param1.readByte() == 1 ? true : false;
         _loc10_.setAnqiArray();
         this.anqiMeditor.shengjiInit();
         this.anqiMeditor.setRTime(_loc9_);
         this.anqiMeditor.anqiZuoQi(_loc11_);
      }
      
      public function received_52012(param1:ByteArray) : void
      {
         ZLog.add("52012：暗器已达瓶颈提示");
         NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_ANQI_LV_STOP);
      }
      
      public function received_52014(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         ZLog.add("52014：暗器突破结果");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            this.anqiMeditor.tupuSuccess();
         }
         else if(_loc2_ == 0)
         {
            _loc3_ = param1.readByte();
            if(_loc3_ == 1)
            {
               this.anqiMeditor.stopAutoCompose();
            }
            else if(_loc3_ == 2)
            {
               this.anqiMeditor.composeFaile();
            }
         }
      }
      
      public function received_52016(param1:ByteArray) : void
      {
         ZLog.add("52016：第一次获得暗器");
         NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_GTE_ANQI);
      }
      
      public function received_52018(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:AnQiInfo = null;
         var _loc12_:Boolean = false;
         ZLog.add("received_52018：获取其他玩家的暗器信息");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            _loc3_ = param1.readInt();
            _loc4_ = param1.readInt();
            _loc5_ = param1.readInt();
            _loc6_ = param1.readInt();
            _loc7_ = param1.readInt();
            _loc8_ = param1.readByte();
            _loc9_ = param1.readByte();
            _loc10_ = param1.readDouble();
            _loc11_ = new AnQiInfo();
            _loc11_.have = _loc2_;
            _loc11_.anqiID = _loc3_;
            _loc11_.shulian = _loc4_;
            _loc11_.xiulian = _loc5_;
            _loc11_.xiulianMax = _loc6_;
            _loc11_.zhufu = _loc7_;
            _loc11_.isOpen = _loc8_;
            _loc11_.ap = _loc10_;
            _loc11_.isKf = param1.readByte() == 1;
            _loc11_.isNowKf = param1.readByte() == 1;
            _loc11_.skillId = param1.readInt();
            _loc11_.tangMenMiJi = param1.readByte() == 1 ? true : false;
            _loc11_.zhongJiAnqi = param1.readByte() == 1 ? true : false;
            _loc11_.isActiveAnqi = _loc9_;
            _loc12_ = param1.readByte() == 1 ? true : false;
            this.anqiOtherMeditor.anqiZuoQi(_loc12_);
            this.anqiOtherMeditor.showAnqiInfo(_loc11_);
         }
         else
         {
            this.anqiOtherMeditor.showNoInfo();
            this.anqiOtherMeditor.anqiZuoQi(false);
         }
      }
      
      public function received_52020(param1:ByteArray) : void
      {
         ZLog.add("52020：激活暗器隐藏属性反馈");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"恭喜您的暗器已成功激活隐藏属性攻击"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"恭喜您的暗器已成功激活隐藏属性攻击"),false);
         }
         GameInstance.mainCharData.anqiInfo.isActiveAnqi = _loc2_;
         this.anqiActiveMeditor.close();
      }
      
      public function received_52022(param1:ByteArray) : void
      {
         ZLog.add("52022：暗器开封信息返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         this.anqiMeditor.setKfPanel(_loc2_,_loc3_);
      }
      
      public function received_52024(param1:ByteArray) : void
      {
         ZLog.add("52024：暗器开封成功返回");
         var _loc2_:int = param1.readByte();
         this.anqiMeditor.kfIsOK(_loc2_);
      }
      
      public function received_53960(param1:ByteArray) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         ZLog.add("53960：收到飞龙探云手攻击消息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readByte();
         var _loc9_:Array = [];
         _loc8_ = 0;
         while(_loc8_ < _loc5_)
         {
            _loc6_ = param1.readByte();
            _loc7_ = param1.readInt();
            _loc9_[_loc9_.length] = [_loc6_,_loc7_];
            _loc8_++;
         }
         this.fightProxy.receivedCharAttackChars(_loc2_,0,_loc3_,_loc4_,_loc9_,-1,-1,0,_loc2_);
      }
      
      public function received_10412(param1:ByteArray) : void
      {
         ZLog.add("10412：机关怪攻击");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readByte();
         this.fightProxy.received_jiguanguai_gongji(_loc2_,_loc3_,_loc4_,_loc5_);
      }
   }
}

