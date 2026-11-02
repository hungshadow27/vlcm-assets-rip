package com.tgame.moudels.char.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.login.view.*;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import flash.geom.Point;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Char_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Char_MsgReceivedProxy";
      
      private var _charProxy:Char_CharProxy;
      
      public function Char_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([10094,10062,10064,10090,50824,10092,50826,30000,30002,10120,10122,10124,50828,40110,10098,10298,10126,10104,10112,10130],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([10094,10062,10064,10090,50824,10092,50826,30000,30002,10120,10122,10124,50828,40110,10098,10298,10126,10104,10112,10130],NAME);
      }
      
      private function get charProxy() : Char_CharProxy
      {
         if(!this._charProxy)
         {
            this._charProxy = facade.retrieveProxy(Char_CharProxy.NAME) as Char_CharProxy;
         }
         return this._charProxy;
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
      
      public function received_10098(param1:ByteArray) : void
      {
         ZLog.add("10098：接收怪物说话");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         this.charProxy.monsterTalk(_loc2_,_loc3_);
      }
      
      public function received_10298(param1:ByteArray) : void
      {
         ZLog.add("10298：接收怪物说话");
         var _loc2_:int = param1.readInt();
         var _loc3_:String = param1.readUTF();
         this.charProxy.monsterTalk1(_loc2_,_loc3_);
      }
      
      public function received_10094(param1:ByteArray) : void
      {
         ZLog.add("10094：接收怪物移动");
         var _loc2_:int = param1.readInt();
         this.charProxy.monsterWalk(_loc2_,param1);
      }
      
      public function received_10090(param1:ByteArray) : void
      {
         ZLog.add("10090：接收坐骑移动");
         var _loc2_:int = param1.readInt();
         this.charProxy.mountWalk(_loc2_,param1);
      }
      
      public function received_10104(param1:ByteArray) : void
      {
         ZLog.add("10104：接收美人移动");
         var _loc2_:int = param1.readInt();
         this.charProxy.girlWalk(_loc2_,param1);
      }
      
      public function received_50824(param1:ByteArray) : void
      {
         ZLog.add("50824：接收NPC好友移动");
         var _loc2_:int = param1.readInt();
         this.charProxy.npcFriendWalk(_loc2_,param1);
      }
      
      public function received_10092(param1:ByteArray) : void
      {
         ZLog.add("10092：接收坐骑跳跃消息");
         var _loc2_:int = param1.readInt();
         var _loc3_:Point = new Point();
         _loc3_.x = param1.readShort();
         _loc3_.y = param1.readShort();
         var _loc4_:Point = new Point();
         _loc4_.x = param1.readShort();
         _loc4_.y = param1.readShort();
         this.charProxy.mountJump(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_10112(param1:ByteArray) : void
      {
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         ZLog.add("10112：接收美人跳跃消息");
         var _loc2_:int = param1.readInt();
         var _loc3_:Point = new Point();
         _loc3_.x = param1.readShort();
         _loc3_.y = param1.readShort();
         var _loc4_:Point = new Point();
         _loc4_.x = param1.readShort();
         _loc4_.y = param1.readShort();
         var _loc5_:int = param1.readByte();
         if(_loc5_ == 1)
         {
            _loc6_ = false;
            _loc7_ = false;
         }
         else if(_loc5_ == 2)
         {
            _loc6_ = true;
            _loc7_ = false;
         }
         else if(_loc5_ == 3)
         {
            _loc6_ = true;
            _loc7_ = true;
         }
         this.charProxy.girlJump(_loc2_,_loc3_,_loc4_,_loc6_,_loc7_);
      }
      
      public function received_10130(param1:ByteArray) : void
      {
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         ZLog.add("10130：接收怪物跳跃消息");
         var _loc2_:int = param1.readInt();
         var _loc3_:Point = new Point();
         _loc3_.x = param1.readShort();
         _loc3_.y = param1.readShort();
         var _loc4_:Point = new Point();
         _loc4_.x = param1.readShort();
         _loc4_.y = param1.readShort();
         var _loc5_:int = param1.readByte();
         if(_loc5_ == 1)
         {
            _loc6_ = false;
            _loc7_ = false;
         }
         else if(_loc5_ == 2)
         {
            _loc6_ = true;
            _loc7_ = false;
         }
         else if(_loc5_ == 3)
         {
            _loc6_ = true;
            _loc7_ = true;
         }
         this.charProxy.monsterJump(_loc2_,_loc3_,_loc4_,_loc6_,_loc7_);
      }
      
      public function received_50826(param1:ByteArray) : void
      {
         ZLog.add("50826：接收NPC好友跳跃消息");
         var _loc2_:int = param1.readInt();
         var _loc3_:Point = new Point();
         _loc3_.x = param1.readShort();
         _loc3_.y = param1.readShort();
         var _loc4_:Point = new Point();
         _loc4_.x = param1.readShort();
         _loc4_.y = param1.readShort();
         this.charProxy.npcFriendJump(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_10062(param1:ByteArray) : void
      {
         ZLog.add("10062：接收其他玩家移动队列消息");
         var _loc2_:int = param1.readInt();
         this.charProxy.charWalk(_loc2_,param1);
      }
      
      public function received_10064(param1:ByteArray) : void
      {
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         ZLog.add("10064：接收其他玩家跳跃消息");
         var _loc2_:int = param1.readInt();
         var _loc3_:Point = new Point();
         _loc3_.x = param1.readShort();
         _loc3_.y = param1.readShort();
         var _loc4_:Point = new Point();
         _loc4_.x = param1.readShort();
         _loc4_.y = param1.readShort();
         var _loc5_:int = param1.readByte();
         if(_loc5_ == 1)
         {
            _loc6_ = false;
            _loc7_ = false;
         }
         else if(_loc5_ == 2)
         {
            _loc6_ = true;
            _loc7_ = false;
         }
         else if(_loc5_ == 3)
         {
            _loc6_ = true;
            _loc7_ = true;
         }
         this.charProxy.charJump(_loc2_,_loc3_,_loc4_,_loc6_,_loc7_);
      }
      
      public function received_30000(param1:ByteArray) : void
      {
         ZLog.add("30000：同步角色位置");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readShort();
         var _loc5_:int = _loc2_.readShort();
         this.charProxy.reviseTileXY(_loc3_,_loc4_,_loc5_);
      }
      
      public function received_30002(param1:ByteArray) : void
      {
         ZLog.add("30002：角色立刻停下来");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readShort();
         var _loc5_:int = _loc2_.readShort();
         this.charProxy.stopToTileXY(_loc3_,_loc4_,_loc5_);
      }
      
      public function received_10120(param1:ByteArray) : void
      {
         ZLog.add("10120：玩家瞬移");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:int = _loc2_.readShort();
         var _loc6_:int = _loc2_.readShort();
         this.charProxy.shunyiTileXY(_loc3_,_loc4_,_loc5_,_loc6_);
      }
      
      public function received_10122(param1:ByteArray) : void
      {
         ZLog.add("10122：怪物瞬移");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readShort();
         var _loc5_:int = _loc2_.readShort();
         this.charProxy.shunyiTileXY(SceneCharacterType.MONSTER,_loc3_,_loc4_,_loc5_);
      }
      
      public function received_10124(param1:ByteArray) : void
      {
         ZLog.add("10124：马瞬移");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readShort();
         var _loc5_:int = _loc2_.readShort();
         this.charProxy.shunyiTileXY(SceneCharacterType.MOUNT,_loc3_,_loc4_,_loc5_);
      }
      
      public function received_10126(param1:ByteArray) : void
      {
         ZLog.add("10126：美人瞬移");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readShort();
         var _loc5_:int = _loc2_.readShort();
         this.charProxy.shunyiTileXY(SceneCharacterType.GIRL,_loc3_,_loc4_,_loc5_);
      }
      
      public function received_50828(param1:ByteArray) : void
      {
         ZLog.add("50828：NPC好友瞬移");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readShort();
         var _loc5_:int = _loc2_.readShort();
         this.charProxy.shunyiTileXY(SceneCharacterType.NPC_FRIEND,_loc3_,_loc4_,_loc5_);
      }
      
      public function received_40110(param1:ByteArray) : void
      {
         ZLog.add("40110：主角行走到该目标点");
         var _loc2_:int = param1.readShort();
         var _loc3_:int = param1.readShort();
         MainCharSeachPathManager.mainCharWalk(GameInstance.scene.mapConfig.mapID + "," + _loc2_ + "," + _loc3_ + ",0",false,null,true,false);
      }
   }
}

