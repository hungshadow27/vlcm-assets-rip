package com.tgame.moudels.kuafu3v3.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.monster.MonsterResManager;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.ui.componets.SmallLoadingBar;
   import com.tgame.manager.HeadFaceManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.moudels.kuafu3v3.view.Kuafu3v3_Mediator;
   import com.tgame.moudels.login.view.*;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.graphics.tagger.AttackFace;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.manager.TimerManager;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Kuafu3v3_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Kuafu3v3_MsgReceivedProxy";
      
      private var _kuafu3v3_Mediator:Kuafu3v3_Mediator;
      
      private var _msg_sender:Kuafu3v3_MsgSenderProxy;
      
      public function Kuafu3v3_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      private function get kuafu3v3_Mediator() : Kuafu3v3_Mediator
      {
         if(!this._kuafu3v3_Mediator)
         {
            this._kuafu3v3_Mediator = facade.retrieveMediator(Kuafu3v3_Mediator.NAME) as Kuafu3v3_Mediator;
         }
         return this._kuafu3v3_Mediator;
      }
      
      private function get msg_sender() : Kuafu3v3_MsgSenderProxy
      {
         if(!this._msg_sender)
         {
            this._msg_sender = facade.retrieveProxy(Kuafu3v3_MsgSenderProxy.NAME) as Kuafu3v3_MsgSenderProxy;
         }
         return this._msg_sender;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([53602,53604,53606,53608,53610,53612,53614,53616,53618,53620,53622,53624],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([53602,53604,53606,53608,53610,53612,53614,53616,53618,53620,53622,53624],NAME);
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
      
      public function received_53602(param1:ByteArray) : void
      {
         var _loc12_:String = null;
         var _loc13_:int = 0;
         var _loc14_:String = null;
         var _loc15_:int = 0;
         ZLog.add("53602：报名确认（向除队长的全队广播,此消息如有变化需要刷新）");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:String = _loc2_.readUTF();
         var _loc5_:int = _loc2_.readInt();
         var _loc6_:String = _loc2_.readUTF();
         var _loc7_:String = PartyType.getName(_loc2_.readByte());
         var _loc8_:int = _loc2_.readByte();
         var _loc9_:Array = [];
         var _loc10_:int = _loc2_.readByte();
         var _loc11_:int = 0;
         while(_loc11_ < _loc10_)
         {
            _loc12_ = _loc2_.readUTF();
            _loc13_ = _loc2_.readInt();
            _loc14_ = PartyType.getName(_loc2_.readByte());
            _loc15_ = _loc2_.readByte();
            if(_loc15_ == 0)
            {
               _loc15_ = 4;
            }
            _loc9_.push({
               "name":_loc12_,
               "grade":_loc13_,
               "school":_loc14_,
               "state":_loc15_
            });
            _loc11_++;
         }
         this.kuafu3v3_Mediator.received_querenBaoming(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
      }
      
      public function received_53604(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         ZLog.add("53604：报名状态控制(向全队广播)");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         if(_loc3_ == 1)
         {
            _loc4_ = _loc2_.readShort();
            ReloginManager.isKuafu3v3Baominging = true;
         }
         else
         {
            ReloginManager.isKuafu3v3Baominging = false;
         }
         this.kuafu3v3_Mediator.received_baomingStatus(_loc3_ == 1,_loc4_);
      }
      
      public function received_53606(param1:ByteArray) : void
      {
         var _buf:ByteArray;
         var miao:int;
         var timerHandler:Function = null;
         var $data:ByteArray = param1;
         timerHandler = function(param1:Number):void
         {
            var _loc2_:int = Math.round(param1) + 1;
            GameInstance.mainChar.showAttackFace("",0,LanResManager.getLanCommonTextWords("进入跨服战场倒计时：") + _loc2_,AttackFace.DEFAULT_FOUNT_SIZE_14,AttackFace.DEFAULT_FOUNT_COLOR_GREEN);
         };
         ZLog.add("53606：匹配结果(向全队广播)");
         _buf = $data;
         miao = _buf.readByte();
         TimerManager.createOneOffExactTimer(miao,miao,0,timerHandler,null,1);
      }
      
      public function received_53608(param1:ByteArray) : void
      {
         ZLog.add("53608：匹配结果(向全队广播)");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:String = NetWorkManager.readGILMsg(_loc2_);
         this.kuafu3v3_Mediator.received_pipeiStatus(_loc3_,_loc4_);
      }
      
      public function received_53610(param1:ByteArray) : void
      {
         ZLog.add("53610：延时秒数（byte,一般为10)");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         SmallLoadingBar.showLoading(LanResManager.getLanCommonTextWords("占领旗帜中"),_loc3_ * 1000);
      }
      
      public function received_53612(param1:ByteArray) : void
      {
         var _loc4_:String = null;
         ZLog.add("53612：返回拔剑结果");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         if(_loc3_ == 0)
         {
            _loc4_ = NetWorkManager.readGILMsg(_loc2_);
         }
         else
         {
            _loc4_ = LanResManager.getLanCommonTextWords("拔剑成功");
         }
         SmallLoadingBar.close();
         NoticeManager.notify(NoticeManager.FOOT,_loc4_);
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc4_);
      }
      
      public function received_53614(param1:ByteArray) : void
      {
         var _loc7_:int = 0;
         var _loc15_:String = null;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:String = null;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         ZLog.add("53614：刷新战斗信息(广播给两个队伍)");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readByte();
         var _loc5_:int = _loc2_.readByte();
         var _loc6_:Array = [];
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            _loc15_ = _loc2_.readUTF();
            _loc16_ = _loc2_.readInt();
            _loc17_ = _loc2_.readInt();
            _loc18_ = _loc2_.readInt();
            _loc19_ = _loc2_.readByte();
            _loc6_.push([_loc15_,_loc16_,_loc17_,_loc18_,_loc19_]);
            _loc7_++;
         }
         var _loc8_:int = _loc2_.readInt();
         var _loc9_:int = _loc2_.readByte();
         var _loc10_:int = _loc2_.readByte();
         var _loc11_:Array = [];
         _loc7_ = 0;
         while(_loc7_ < _loc10_)
         {
            _loc20_ = _loc2_.readUTF();
            _loc21_ = _loc2_.readInt();
            _loc22_ = _loc2_.readInt();
            _loc23_ = _loc2_.readInt();
            _loc24_ = _loc2_.readByte();
            _loc11_.push([_loc20_,_loc21_,_loc22_,_loc23_,_loc24_]);
            _loc7_++;
         }
         var _loc12_:int = _loc2_.readShort();
         var _loc13_:int = _loc2_.readInt();
         var _loc14_:int = _loc2_.readInt();
         this.kuafu3v3_Mediator.received_fightInfo(_loc3_,_loc4_,_loc6_,_loc8_,_loc9_,_loc11_,_loc12_,_loc13_,_loc14_);
      }
      
      public function received_53616(param1:ByteArray) : void
      {
         var _loc5_:XML = null;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:Array = null;
         var _loc20_:String = null;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:String = null;
         var _loc28_:int = 0;
         ZLog.add("53616：返回竞技结果");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:XML = <list/>;
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_)
         {
            _loc20_ = _loc2_.readUTF();
            _loc21_ = _loc2_.readByte();
            _loc22_ = _loc2_.readInt();
            _loc23_ = _loc2_.readInt();
            _loc24_ = _loc2_.readInt();
            _loc25_ = _loc2_.readInt();
            _loc26_ = _loc2_.readByte();
            _loc27_ = _loc21_ == 1 ? LanResManager.getLanCommonTextWords("黄队") : LanResManager.getLanCommonTextWords("蓝队");
            _loc5_ = <node paiming={_loc6_ + 1} userName={_loc20_} team={_loc27_} qizhiNum={_loc22_} shenglv={Math.floor(_loc23_ / 100) + "%"} jibaiNum={_loc24_} beiJibaiNum={_loc25_} suoshu={_loc21_}/>;
            _loc4_.appendChild(_loc5_);
            _loc6_++;
         }
         var _loc7_:int = _loc2_.readInt();
         var _loc8_:int = _loc2_.readInt();
         for each(_loc5_ in _loc4_.children())
         {
            _loc28_ = 2;
            if(_loc7_ != _loc8_)
            {
               if(_loc5_.@suoshu == 1)
               {
                  _loc28_ = _loc7_ > _loc8_ ? 1 : 0;
               }
               else
               {
                  _loc28_ = _loc7_ > _loc8_ ? 0 : 1;
               }
            }
            _loc5_.@fightStatus = _loc28_;
         }
         _loc9_ = _loc2_.readByte();
         _loc10_ = _loc2_.readDouble();
         _loc11_ = _loc2_.readDouble();
         _loc12_ = _loc2_.readDouble();
         _loc13_ = _loc2_.readInt();
         _loc14_ = _loc2_.readInt();
         _loc15_ = _loc2_.readInt();
         _loc16_ = _loc2_.readInt();
         _loc17_ = _loc2_.readInt();
         _loc18_ = _loc2_.readInt();
         _loc19_ = [_loc10_,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_,_loc17_,_loc18_,_loc9_];
         this.kuafu3v3_Mediator.received_fightResult(_loc4_,_loc7_,_loc8_,_loc19_);
      }
      
      public function received_53618(param1:ByteArray) : void
      {
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         ZLog.add("53618：刷新战斗信息下地图上的旗子(广播给两个队伍)");
         var _loc2_:ByteArray = param1;
         var _loc3_:Array = [];
         var _loc4_:int = _loc2_.readByte();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = _loc2_.readInt();
            _loc7_ = MonsterResManager.getMonsterRes(_loc2_.readInt()).name;
            _loc8_ = _loc2_.readByte();
            _loc9_ = _loc2_.readShort() * 25;
            _loc10_ = _loc2_.readShort() * 25;
            _loc3_.push([_loc6_,_loc7_,_loc8_,_loc9_,_loc10_]);
            _loc5_++;
         }
         this.kuafu3v3_Mediator.received_fightSmallMapInfo(_loc3_);
      }
      
      public function received_53620(param1:ByteArray) : void
      {
         var _loc7_:int = 0;
         var _loc15_:String = null;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:String = null;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         ZLog.add("53620：刷新战斗信息(广播给两个队伍)(3V3杀人模式)");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readByte();
         var _loc5_:int = _loc2_.readByte();
         var _loc6_:Array = [];
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            _loc15_ = _loc2_.readUTF();
            _loc16_ = _loc2_.readInt();
            _loc17_ = _loc2_.readInt();
            _loc18_ = 0;
            _loc19_ = _loc2_.readByte();
            _loc6_.push([_loc15_,_loc16_,_loc17_,_loc18_,_loc19_]);
            _loc7_++;
         }
         var _loc8_:int = _loc2_.readInt();
         var _loc9_:int = _loc2_.readByte();
         var _loc10_:int = _loc2_.readByte();
         var _loc11_:Array = [];
         _loc7_ = 0;
         while(_loc7_ < _loc10_)
         {
            _loc20_ = _loc2_.readUTF();
            _loc21_ = _loc2_.readInt();
            _loc22_ = _loc2_.readInt();
            _loc23_ = 0;
            _loc24_ = _loc2_.readByte();
            _loc11_.push([_loc20_,_loc21_,_loc22_,_loc23_,_loc24_]);
            _loc7_++;
         }
         var _loc12_:int = _loc2_.readShort();
         var _loc13_:int = _loc2_.readInt();
         var _loc14_:int = _loc2_.readInt();
         this.kuafu3v3_Mediator.received_fightInfo_PK(_loc3_,_loc4_,_loc6_,_loc8_,_loc9_,_loc11_,_loc12_,_loc13_,_loc14_);
      }
      
      public function received_53622(param1:ByteArray) : void
      {
         var _loc5_:XML = null;
         var _loc10_:int = 0;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:Array = null;
         var _loc21_:String = null;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:String = null;
         ZLog.add("53622：返回竞技结果(3V3杀人模式)");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:XML = <list/>;
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_)
         {
            _loc21_ = _loc2_.readUTF();
            _loc22_ = _loc2_.readByte();
            _loc23_ = 0;
            _loc24_ = _loc2_.readInt();
            _loc25_ = _loc2_.readInt();
            _loc26_ = _loc2_.readInt();
            _loc27_ = _loc2_.readByte();
            _loc28_ = _loc22_ == 1 ? LanResManager.getLanCommonTextWords("黄队") : LanResManager.getLanCommonTextWords("蓝队");
            _loc5_ = <node paiming={_loc6_ + 1} userName={_loc21_} team={_loc28_} qizhiNum={_loc23_} shenglv={Math.floor(_loc24_ / 100) + "%"} jibaiNum={_loc25_} beiJibaiNum={_loc26_} suoshu={_loc22_}/>;
            _loc4_.appendChild(_loc5_);
            _loc6_++;
         }
         var _loc7_:int = _loc2_.readInt();
         var _loc8_:int = _loc2_.readInt();
         var _loc9_:int = _loc2_.readByte();
         for each(_loc5_ in _loc4_.children())
         {
            switch(_loc9_)
            {
               case 0:
                  _loc5_.@fightStatus = 2;
                  break;
               case 1:
                  _loc5_.@fightStatus = _loc5_.@suoshu == 1 ? 1 : 0;
                  break;
               case 2:
                  _loc5_.@fightStatus = _loc5_.@suoshu == 2 ? 1 : 0;
            }
         }
         _loc10_ = _loc2_.readByte();
         _loc11_ = _loc2_.readDouble();
         _loc12_ = _loc2_.readDouble();
         _loc13_ = _loc2_.readDouble();
         _loc14_ = _loc2_.readInt();
         _loc15_ = _loc2_.readInt();
         _loc16_ = _loc2_.readInt();
         _loc17_ = _loc2_.readInt();
         _loc18_ = _loc2_.readInt();
         _loc19_ = _loc2_.readInt();
         _loc20_ = [_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_,_loc17_,_loc18_,_loc19_,_loc10_];
         this.kuafu3v3_Mediator.received_fightResult_PK(_loc4_,_loc7_,_loc8_,_loc20_);
      }
      
      public function received_53624(param1:ByteArray) : void
      {
         var _loc3_:SceneCharacter = null;
         ZLog.add("53624：返回主角所属队伍颜色");
         GameInstance.mainCharData.attributeInfo.vs3V3Team = param1.readByte();
         var _loc2_:Array = [];
         for each(_loc3_ in GameInstance.scene.sceneCharacters)
         {
            if(_loc3_.type == SceneCharacterType.PLAYER)
            {
               _loc2_.push(_loc3_.id);
            }
         }
         HeadFaceManager.updatePlayersName(_loc2_);
      }
   }
}

