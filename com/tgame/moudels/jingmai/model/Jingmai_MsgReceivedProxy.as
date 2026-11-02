package com.tgame.moudels.jingmai.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.jingmai.XueweiRes;
   import com.tgame.common.res.jingmai.XueweiResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpeciaAvatarPartID;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.JingmaiInfo;
   import com.tgame.manager.AvatarManager;
   import com.tgame.manager.FightManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.jingmai.view.Jingmai_MaincharJingmaiPlaneMediator;
   import com.tgame.moudels.jingmai.view.Jingmai_TargetJingmaiPlaneMediator;
   import com.tgame.moudels.login.view.*;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.graphics.avatar.AvatarPart;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.staticdata.RestType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import com.zcp.manager.TimerManager;
   import flash.geom.Point;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Jingmai_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Jingmai_MsgReceivedProxy";
      
      private var loaderBuff:LoadBuffer;
      
      private var _mainCharjingmaiPlaneMediator:Jingmai_MaincharJingmaiPlaneMediator;
      
      private var _taJingmaiPanelMediator:Jingmai_TargetJingmaiPlaneMediator;
      
      public function Jingmai_MsgReceivedProxy()
      {
         super();
      }
      
      private function get mainCharjingmaiPlaneMediator() : Jingmai_MaincharJingmaiPlaneMediator
      {
         if(!this._mainCharjingmaiPlaneMediator)
         {
            this._mainCharjingmaiPlaneMediator = facade.retrieveMediator(Jingmai_MaincharJingmaiPlaneMediator.NAME) as Jingmai_MaincharJingmaiPlaneMediator;
         }
         return this._mainCharjingmaiPlaneMediator;
      }
      
      private function get taJingmaiPanelMediator() : Jingmai_TargetJingmaiPlaneMediator
      {
         if(!this._taJingmaiPanelMediator)
         {
            this._taJingmaiPanelMediator = facade.retrieveMediator(Jingmai_TargetJingmaiPlaneMediator.NAME) as Jingmai_TargetJingmaiPlaneMediator;
         }
         return this._taJingmaiPanelMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([50202,50204,50206,50208,50210,50212,50214,50218,50234,50232,50236],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([50202,50204,50206,50208,50210,50212,50214,50218,50234,50232,50236],NAME);
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
      
      public function received_50202(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         ZLog.add("50202：初始主角经脉信息");
         var _loc2_:JingmaiInfo = GameInstance.mainCharData.jingmaiInfo;
         _loc2_.clear();
         var _loc3_:ByteArray = param1;
         _loc2_.isZhenlong = _loc3_.readByte() == 1;
         var _loc4_:int = _loc3_.readByte();
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = _loc3_.readByte();
            _loc7_ = _loc3_.readShort();
            _loc2_.openXuewei(_loc7_,GameInstance.mainCharData.jingmaiInfo.isZhenlong);
            _loc5_++;
         }
      }
      
      public function received_50214(param1:ByteArray) : void
      {
         ZLog.add("50214： 返回经脉总揽数据");
         var _loc2_:ByteArray = param1;
         GameInstance.uiInstance.charAttribute.setVenationAddValue(_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt());
         GameInstance.uiInstance.charAttribute.setVenationExpAddValue(_loc2_.readInt(),_loc2_.readDouble());
         GameInstance.uiInstance.charAttribute.setIsHuti(Boolean(_loc2_.readByte() == 1),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),Boolean(_loc2_.readByte() == 1),Boolean(_loc2_.readByte() == 1),_loc2_.readInt());
         var _loc3_:Boolean = Boolean(_loc2_.readByte() == 1);
         var _loc4_:Boolean = Boolean(_loc2_.readByte() == 1);
         GameInstance.uiInstance.charAttribute.isZuoQi(_loc3_,_loc4_);
      }
      
      public function received_50218(param1:ByteArray) : void
      {
         ZLog.add("50218： 返回主角经脉重伤");
         var _loc2_:ByteArray = param1;
         var _loc3_:Array = [];
         var _loc4_:int = _loc2_.readByte();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_[_loc3_.length] = [_loc2_.readByte(),_loc2_.readInt()];
            _loc5_++;
         }
         this.mainCharjingmaiPlaneMediator.received_zhongshang(_loc3_);
      }
      
      public function received_50204(param1:ByteArray) : void
      {
         var _loc8_:AvatarParamData = null;
         ZLog.add("50204： 返回冲穴延时");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readShort();
         var _loc5_:int = _loc2_.readByte();
         var _loc6_:Boolean = _loc2_.readByte() == 1;
         var _loc7_:SceneCharacter = GameInstance.scene.getCharByID(_loc3_);
         if(_loc7_ != null)
         {
            if(_loc7_ == GameInstance.mainChar)
            {
               PipeManager.sendMsg(PipeConstants.HIDE_ALL_UI_EXCEPT_MAINUI);
            }
            if(_loc6_)
            {
               _loc8_ = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_XUEWEI_DELAY),AvatarPartType.MAGIC);
               _loc8_.id = SpeciaAvatarPartID.XUEWEI_DELAY;
               _loc7_.loadAvatarPart(_loc8_);
            }
            else
            {
               _loc7_.removeAvatarPartByID(SpeciaAvatarPartID.XUEWEI_DELAY);
            }
         }
      }
      
      public function received_50206(param1:ByteArray) : void
      {
         var shake:Function;
         var addLoadBuffer:Function;
         var removeLoaderBuff:Function;
         var xueweiID:int = 0;
         var hasRun:Boolean = false;
         var char:SceneCharacter = null;
         var sucessStr:String = null;
         var apd:AvatarParamData = null;
         var jingmaiInfo:JingmaiInfo = null;
         var failStr:String = null;
         var $data:ByteArray = param1;
         var reShowJingmai:Function = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
         {
            if(hasRun)
            {
               return;
            }
            hasRun = true;
            if((char.restStatus == RestType.SIT || char.restStatus == RestType.DOUBLE_SIT) && char.isOnMount != true && char.getStatus() != CharStatusType.SIT)
            {
               char.playTo(CharStatusType.SIT);
            }
            if(char.isMainChar())
            {
               mainCharjingmaiPlaneMediator.f5JingmaiByXeiweiID(xueweiID);
            }
         };
         var _buf:ByteArray = $data;
         var charID:int = _buf.readInt();
         xueweiID = _buf.readShort();
         var tag:int = _buf.readByte();
         hasRun = false;
         char = GameInstance.scene.getCharByID(charID);
         if(tag == 1 && char != null)
         {
            shake = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
            {
            };
            sucessStr = NetWorkManager.readGILMsg(_buf);
            ZLog.add("50206： 返回冲穴成功," + sucessStr);
            apd = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_XUEWEI_OPEN),AvatarPartType.MAGIC);
            if(char == GameInstance.mainChar)
            {
               jingmaiInfo = GameInstance.mainCharData.jingmaiInfo;
               jingmaiInfo.openXuewei(xueweiID,GameInstance.mainCharData.jingmaiInfo.isZhenlong);
               PipeManager.sendMsg(PipeConstants.HIDE_ALL_UI_EXCEPT_MAINUI);
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"冲穴成功"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"冲穴成功"),false);
            }
            char.removeAvatarPartByID(SpeciaAvatarPartID.XUEWEI_DELAY);
         }
         else
         {
            failStr = NetWorkManager.readGILMsg(_buf);
            ZLog.add("50206： 返回冲穴失败," + failStr);
            if(char == GameInstance.mainChar)
            {
               addLoadBuffer = function():void
               {
                  removeLoaderBuff();
                  loaderBuff = LoadBuffer.show(GameInstance.uiInstance.charAttribute);
               };
               removeLoaderBuff = function():void
               {
                  if(loaderBuff)
                  {
                     loaderBuff.close();
                  }
                  loaderBuff = null;
               };
               addLoadBuffer();
               TimerManager.createOneOffTimer(2000,1,function():void
               {
                  removeLoaderBuff();
                  char.removeAvatarPartByID(SpeciaAvatarPartID.XUEWEI_DELAY);
                  NoticeManager.notify(NoticeManager.FOOT,failStr);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,failStr);
                  reShowJingmai();
                  var _loc1_:XueweiRes = XueweiResManager.getXueweiRes(xueweiID,GameInstance.mainCharData.jingmaiInfo.isZhenlong);
                  if(_loc1_ != null)
                  {
                     mainCharjingmaiPlaneMediator.showOpenXuewei(_loc1_.f_name);
                  }
               });
            }
         }
      }
      
      public function received_50208(param1:ByteArray) : void
      {
         var reShowJingmai:Function;
         var shake:Function;
         var jingmaiID:int = 0;
         var char:SceneCharacter = null;
         var player:Player = null;
         var jingmaiOpenedNum:int = 0;
         var hasRun:Boolean = false;
         var apd:AvatarParamData = null;
         var fromApd:AvatarParamData = null;
         var jingmaiInfo:JingmaiInfo = null;
         var $data:ByteArray = param1;
         var _buf:ByteArray = $data;
         var charID:int = _buf.readInt();
         jingmaiID = _buf.readByte();
         char = GameInstance.scene.getCharByID(charID);
         if(char != null)
         {
            reShowJingmai = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
            {
               if(hasRun)
               {
                  return;
               }
               hasRun = true;
               if((char.restStatus == RestType.SIT || char.restStatus == RestType.DOUBLE_SIT) && char.isOnMount != true && char.getStatus() != CharStatusType.SIT)
               {
                  char.playTo(CharStatusType.SIT);
               }
               if(char.isMainChar())
               {
                  mainCharjingmaiPlaneMediator.f5Jingmai(jingmaiID);
               }
            };
            shake = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
            {
               FightManager.screen_shake(0.5,70);
            };
            player = char.data as Player;
            hasRun = false;
            apd = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_JINGMAI_OPEN),AvatarPartType.MAGIC);
            if(char == GameInstance.mainChar)
            {
               jingmaiInfo = player.jingmaiInfo;
               jingmaiInfo.openJingmai(jingmaiID);
               jingmaiOpenedNum = jingmaiInfo.getOpenedJingmaiNum();
               PipeManager.sendMsg(PipeConstants.HIDE_ALL_UI_EXCEPT_MAINUI);
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"恭喜您成功打通一条经脉"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"恭喜您成功打通一条经脉"),false);
            }
            else
            {
               ++player.otherPlayerInfo.jingmaiOpenedNum;
               jingmaiOpenedNum = player.otherPlayerInfo.jingmaiOpenedNum;
            }
            fromApd = new AvatarParamData();
            fromApd.extendCallBack(null,shake,null,reShowJingmai);
            char.removeAvatarPartByID(SpeciaAvatarPartID.XUEWEI_DELAY);
            char.showMagic_from1passNtoRectArea(new Point(char.piexl_x,char.piexl_y),10 * 25,10 * 25,5 * 25,false,fromApd,apd,null);
            AvatarManager.updateJingmaiAvatar(char,jingmaiOpenedNum);
         }
      }
      
      public function received_50212(param1:ByteArray) : void
      {
         ZLog.add("50212： 返回真龙脉突破瓶颈面板数据");
         if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            return;
         }
         var _loc2_:ByteArray = param1;
         var _loc3_:Array = [_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt()];
         var _loc4_:Array = [_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt()];
         var _loc5_:Array = [GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.LONGZHU,true,true),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt() / 100];
         GameInstance.uiInstance.charAttribute.showVenationBreakthroughPanel(_loc3_,_loc4_,_loc5_);
      }
      
      public function received_50210(param1:ByteArray) : void
      {
         var _loc4_:JingmaiInfo = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         if(_loc3_ == 1)
         {
            ZLog.add("50210： 返回真龙脉突破瓶颈成功");
            _loc4_ = GameInstance.mainCharData.jingmaiInfo;
            _loc4_.clear();
            _loc4_.isZhenlong = true;
            if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
            }
            this.mainCharjingmaiPlaneMediator.setZonglan(true);
            GameInstance.uiInstance.charAttribute.hideVenationBreakthroughPanel();
         }
         else
         {
            ZLog.add("50210： 返回真龙脉突破瓶颈失败");
            GameInstance.uiInstance.charAttribute.setLongZhu(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.LONGZHU,true,true));
         }
      }
      
      public function received_50234(param1:ByteArray) : void
      {
         ZLog.add("50234：当前经脉气海是否冲通");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = _loc2_.readByte();
         var _loc5_:int = _loc2_.readInt();
         var _loc6_:int = _loc2_.readInt();
         this.mainCharjingmaiPlaneMediator.shouQihai(_loc3_,_loc4_,_loc5_,_loc6_);
      }
      
      public function received_50232(param1:ByteArray) : void
      {
         ZLog.add("50232：当前经脉气海修炼是否成功");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:int = _loc2_.readInt();
         this.mainCharjingmaiPlaneMediator.qihaiIsChenggong(_loc3_,_loc4_,_loc5_);
      }
      
      public function received_50236(param1:ByteArray) : void
      {
         var _loc11_:int = 0;
         var _loc15_:JingmaiInfo = null;
         var _loc16_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:int = 0;
         var _loc32_:int = 0;
         ZLog.add("50236： 返回TA的经脉");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         if(_loc3_ != GameInstance.lookPlayerID)
         {
            return;
         }
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:int = _loc2_.readInt();
         var _loc6_:int = _loc2_.readInt();
         var _loc7_:int = _loc2_.readInt();
         var _loc8_:int = _loc2_.readInt();
         var _loc9_:int = _loc2_.readInt();
         var _loc10_:int = _loc2_.readInt();
         _loc11_ = _loc2_.readInt();
         var _loc12_:Number = _loc2_.readDouble();
         var _loc13_:Boolean = _loc2_.readByte() == 1;
         var _loc14_:int = _loc2_.readByte();
         GameInstance.uiInstance.targetAttribute.setVenationAddValue(_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_);
         GameInstance.uiInstance.targetAttribute.setVenationExpAddValue(_loc11_,_loc12_);
         _loc15_ = GameInstance.lookPlayerData.jingmaiInfo;
         _loc15_.clear();
         _loc15_.isZhenlong = _loc13_;
         _loc16_ = 0;
         while(_loc16_ < _loc14_)
         {
            _loc29_ = _loc2_.readByte();
            _loc30_ = _loc2_.readShort();
            _loc15_.openXuewei(_loc30_,_loc15_.isZhenlong);
            _loc16_++;
         }
         if(_loc13_)
         {
            _loc11_ = _loc2_.readByte();
            _loc16_ = 0;
            while(_loc16_ < _loc11_)
            {
               _loc31_ = _loc2_.readByte();
               _loc32_ = _loc2_.readByte();
               _loc15_.setQiHaiSta(_loc31_,_loc32_);
               _loc16_++;
            }
         }
         var _loc17_:Boolean = Boolean(_loc2_.readByte() == 1);
         var _loc18_:int = _loc2_.readInt();
         var _loc19_:int = _loc2_.readInt();
         var _loc20_:int = _loc2_.readInt();
         var _loc21_:int = _loc2_.readInt();
         var _loc22_:int = _loc2_.readInt();
         var _loc23_:int = _loc2_.readInt();
         var _loc24_:Boolean = Boolean(_loc2_.readByte() == 1);
         var _loc25_:* = _loc2_.readByte() == 1;
         var _loc26_:int = _loc2_.readInt();
         GameInstance.uiInstance.targetAttribute.setIsHuti(_loc17_,_loc18_,_loc19_,_loc20_,_loc21_,_loc22_,_loc23_,_loc24_,_loc25_,_loc26_);
         this.taJingmaiPanelMediator.showTaJingmaiInfo();
         var _loc27_:Boolean = _loc2_.readByte() == 1;
         var _loc28_:Boolean = Boolean(_loc2_.readByte() == 1);
         GameInstance.uiInstance.targetAttribute.isZuoQi(_loc27_,_loc28_);
      }
   }
}

