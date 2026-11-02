package com.tgame.moudels.friend.model
{
   import com.fireice.alert.FAlert;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.HeadResChange;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.PurePlayer;
   import com.tgame.common.vo.character.info.FriendInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.moudels.friend.view.Friend_Mediator;
   import com.tgame.moudels.friend.view.JingYanJiangLi_Mediator;
   import com.tgame.moudels.friend.view.ShiTu_Mediator;
   import com.tgame.moudels.login.view.*;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Friend_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Friend_MsgReceivedProxy";
      
      private var _msgSenderProxy:Friend_MsgSenderProxy;
      
      private var _friendMediator:Friend_Mediator;
      
      private var _shiTuMediator:ShiTu_Mediator;
      
      private var _jingYanJiangLi_Mediator:JingYanJiangLi_Mediator;
      
      private var _myFriends:FriendInfo;
      
      public function Friend_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      private function get msgSenderProxy() : Friend_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Friend_MsgSenderProxy.NAME) as Friend_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function get friendMediator() : Friend_Mediator
      {
         if(!this._friendMediator)
         {
            this._friendMediator = facade.retrieveMediator(Friend_Mediator.NAME) as Friend_Mediator;
         }
         return this._friendMediator;
      }
      
      private function get shiTuMediator() : ShiTu_Mediator
      {
         if(!this._shiTuMediator)
         {
            this._shiTuMediator = facade.retrieveMediator(ShiTu_Mediator.NAME) as ShiTu_Mediator;
         }
         return this._shiTuMediator;
      }
      
      private function get jingYanJiangLi_Mediator() : JingYanJiangLi_Mediator
      {
         if(!this._jingYanJiangLi_Mediator)
         {
            this._jingYanJiangLi_Mediator = facade.retrieveMediator(JingYanJiangLi_Mediator.NAME) as JingYanJiangLi_Mediator;
         }
         return this._jingYanJiangLi_Mediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([10302,10304,10306,10308,10310,10312,10314,10316,10318,10320,10322,10332,10334,10336,10342,10344,10346,10354,10358,10360,10366,10372,10374,10376,10378,10380,10382,10384,10398,11002,11004,11010,11012,11014,11016,11022,11024,52364],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([10302,10304,10306,10308,10310,10312,10314,10316,10318,10320,10322,10332,10334,10336,10342,10344,10346,10354,10358,10360,10366,10372,10374,10376,10378,10380,10382,10384,10398,11002,11004,11010,11012,11014,11016,11022,11024,52364],NAME);
      }
      
      public function get myFriends() : FriendInfo
      {
         return GameInstance.mainCharData.friendInfo;
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
      
      public function received_10308(param1:ByteArray) : void
      {
         var _loc5_:PurePlayer = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         ZLog.add("10308：收到  好友列表消息  数量=" + _loc3_);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = new PurePlayer();
            _loc5_.id = _loc2_.readInt();
            _loc5_.name = _loc2_.readUTF();
            _loc5_.favor = _loc2_.readInt();
            _loc5_.lineserver = _loc2_.readByte();
            _loc5_.specialAct = _loc2_.readByte();
            this.myFriends.insertFriends(_loc5_);
            _loc4_++;
         }
         this.myFriends.friendsReady = true;
         this.friendMediator.updateFriendListPanel();
      }
      
      public function received_10302(param1:ByteArray) : void
      {
         var _loc5_:Array = null;
         var _loc7_:PurePlayer = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readShort();
         var _loc4_:int = _loc2_.readByte();
         _loc5_ = new Array();
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc7_ = new PurePlayer();
            _loc7_.id = _loc2_.readInt();
            _loc7_.name = _loc2_.readUTF();
            _loc7_.attributeInfo.lv = _loc2_.readShort();
            _loc7_.attributeInfo.partyID = _loc2_.readByte();
            _loc5_.push(_loc7_);
            _loc6_++;
         }
         this.friendMediator.updateSearchPanel(_loc5_,_loc3_);
      }
      
      public function received_10304(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:PurePlayer = new PurePlayer();
         _loc3_.id = _loc2_.readInt();
         _loc3_.name = _loc2_.readUTF();
         _loc3_.favor = _loc2_.readInt();
         _loc3_.lineserver = _loc2_.readByte();
         _loc3_.specialAct = _loc2_.readByte();
         FAlert.show(LanResManager.getLanTextWords(this,"恭喜您添加好友",[StaticValue.WHITE_HTML,_loc3_.name]));
         this.myFriends.insertFriends(_loc3_);
         this.friendMediator.updateFriendListPanel();
      }
      
      public function received_10306(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:PurePlayer = new PurePlayer();
         _loc3_.id = _loc2_.readInt();
         _loc3_.name = _loc2_.readUTF();
         var _loc4_:int = _loc2_.readByte();
         _loc3_.attributeInfo.lv = _loc2_.readShort();
         _loc3_.attributeInfo.partyID = _loc2_.readByte();
         _loc3_.banghuiInfo.banghuiName = _loc2_.readUTF();
         this.friendMediator.showAddFriendTips(_loc3_,_loc4_);
      }
      
      public function received_10310(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:PurePlayer = new PurePlayer();
         _loc3_.id = _loc2_.readInt();
         this.myFriends.removeFriends(_loc3_);
         this.friendMediator.updateFriendListPanel();
      }
      
      public function received_10312(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:PurePlayer = new PurePlayer();
         _loc3_.id = _loc2_.readInt();
         _loc3_.lineserver = _loc2_.readByte();
         _loc3_.specialAct = _loc2_.readByte();
         this.myFriends.updateFriends(_loc3_.id,-1,_loc3_.lineserver,_loc3_.specialAct);
         this.myFriends.updateEnemies(_loc3_.id,FriendInfo.minHateValue,_loc3_.lineserver,_loc3_.specialAct);
         this.myFriends.updateTemps(_loc3_.id,-1,_loc3_.lineserver,_loc3_.specialAct);
         this.myFriends.updateBlacklist(_loc3_.id,_loc3_.lineserver,_loc3_.specialAct);
         this.friendMediator.updateFriendListPanel();
      }
      
      public function received_10314(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:PurePlayer = new PurePlayer();
         _loc3_.id = _loc2_.readInt();
         _loc3_.lineserver = 0;
         this.myFriends.updateFriends(_loc3_.id,-1,_loc3_.lineserver,-1);
         this.myFriends.updateEnemies(_loc3_.id,FriendInfo.minHateValue,_loc3_.lineserver,-1);
         this.myFriends.updateTemps(_loc3_.id,-1,_loc3_.lineserver,-1);
         this.myFriends.updateBlacklist(_loc3_.id,_loc3_.lineserver,-1);
         this.friendMediator.updateFriendListPanel();
      }
      
      public function received_10316(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readInt();
         this.myFriends.updateFriends(_loc3_,_loc4_);
         this.friendMediator.updateFriendListPanel();
      }
      
      public function received_10318(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readInt();
         this.myFriends.updateEnemies(_loc3_,_loc4_);
         this.friendMediator.updateFriendListPanel();
      }
      
      public function received_10320(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         this.myFriends.updateTemps(_loc3_);
         this.friendMediator.updateFriendListPanel();
      }
      
      public function received_10322(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readByte();
         this.myFriends.updateFriends(_loc3_,-1,-1,_loc4_);
         this.myFriends.updateEnemies(_loc3_,FriendInfo.minHateValue,-1,_loc4_);
         this.myFriends.updateTemps(_loc3_,-1,-1,_loc4_);
         this.friendMediator.updateFriendListPanel();
      }
      
      public function received_10332(param1:ByteArray) : void
      {
         var _loc5_:PurePlayer = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = new PurePlayer();
            _loc5_.id = _loc2_.readInt();
            _loc5_.name = _loc2_.readUTF();
            _loc5_.lineserver = _loc2_.readByte();
            _loc5_.specialAct = _loc2_.readByte();
            this.myFriends.insertTemps(_loc5_);
            _loc4_++;
         }
         this.friendMediator.updateFriendListPanel();
      }
      
      public function received_10334(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:PurePlayer = new PurePlayer();
         _loc3_.id = _loc2_.readInt();
         this.myFriends.removeTemps(_loc3_);
         this.friendMediator.updateFriendListPanel();
      }
      
      public function received_10336(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:PurePlayer = new PurePlayer();
         _loc3_.id = _loc2_.readInt();
         _loc3_.name = _loc2_.readUTF();
         _loc3_.lineserver = _loc2_.readByte();
         _loc3_.specialAct = _loc2_.readByte();
         this.myFriends.insertTemps(_loc3_);
         this.friendMediator.updateFriendListPanel();
      }
      
      public function received_10342(param1:ByteArray) : void
      {
         var _loc5_:PurePlayer = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = new PurePlayer();
            _loc5_.id = _loc2_.readInt();
            _loc5_.name = _loc2_.readUTF();
            _loc5_.hate = _loc2_.readInt();
            _loc5_.lineserver = _loc2_.readByte();
            _loc5_.specialAct = _loc2_.readByte();
            this.myFriends.insertEnemies(_loc5_);
            _loc4_++;
         }
         this.friendMediator.updateFriendListPanel();
      }
      
      public function received_10344(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:PurePlayer = new PurePlayer();
         _loc3_.id = _loc2_.readInt();
         this.myFriends.removeEnemies(_loc3_);
         this.friendMediator.updateFriendListPanel();
      }
      
      public function received_10346(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:PurePlayer = new PurePlayer();
         _loc3_.id = _loc2_.readInt();
         _loc3_.name = _loc2_.readUTF();
         _loc3_.hate = _loc2_.readInt();
         _loc3_.lineserver = _loc2_.readByte();
         _loc3_.specialAct = _loc2_.readByte();
         this.myFriends.insertEnemies(_loc3_);
         this.friendMediator.updateFriendListPanel();
      }
      
      public function received_10354(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:PurePlayer = new PurePlayer();
         _loc3_.id = _loc2_.readInt();
         _loc3_.name = _loc2_.readUTF();
         _loc3_.lineserver = _loc2_.readByte();
         this.myFriends.insertBlacklist(_loc3_);
         this.friendMediator.updateFriendListPanel();
         NoticeManager.notify(3,LanResManager.getLanTextWords(this,"添加黑名单成功") + _loc3_.name);
      }
      
      public function received_10358(param1:ByteArray) : void
      {
         var _loc5_:PurePlayer = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = new PurePlayer();
            _loc5_.id = _loc2_.readInt();
            _loc5_.name = _loc2_.readUTF();
            _loc5_.lineserver = _loc2_.readByte();
            this.myFriends.insertBlacklist(_loc5_);
            _loc4_++;
         }
         this.friendMediator.updateFriendListPanel();
      }
      
      public function received_10360(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:PurePlayer = new PurePlayer();
         _loc3_.id = _loc2_.readInt();
         var _loc4_:String = this.myFriends.getBlackByID(_loc3_.id).name;
         this.myFriends.removeBlacklist(_loc3_);
         this.friendMediator.updateFriendListPanel();
         NoticeManager.notify(3,LanResManager.getLanTextWords(this,"删除黑名单成功",[_loc4_]));
      }
      
      public function received_10366(param1:ByteArray) : void
      {
         var _loc4_:PurePlayer = null;
         var _loc2_:ByteArray = param1;
         this.myFriends.myFace = _loc2_.readUTF();
         this.myFriends.myFaceText = _loc2_.readUTF();
         var _loc3_:Boolean = _loc2_.readBoolean();
         if(_loc3_)
         {
            _loc4_ = new PurePlayer();
            _loc4_.id = _loc2_.readInt();
            _loc4_.name = _loc2_.readUTF();
            _loc4_.favor = _loc2_.readInt();
            _loc4_.lineserver = _loc2_.readByte();
            _loc4_.specialAct = _loc2_.readByte();
            _loc4_.attributeInfo.headImg = HeadResChange.headResChangeToString(_loc2_.readByte());
         }
         this.friendMediator.updateFacePanel();
         this.friendMediator.setPeiOu(_loc4_);
      }
      
      public function received_10372(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         this.myFriends.myFace = _loc2_.readUTF();
         ZLog.add("10372：返回更新后表情 = " + this.myFriends.myFace);
         this.friendMediator.updateFacePanel();
      }
      
      public function received_10374(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         this.myFriends.myFaceText = _loc2_.readUTF();
         ZLog.add("10374：返回更新后心情文字 = " + this.myFriends.myFaceText);
         this.friendMediator.updateFacePanel();
      }
      
      public function received_10376(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:String = _loc2_.readUTF();
         var _loc5_:String = _loc2_.readUTF();
         this.friendMediator.updateMouseTip(_loc3_,_loc4_,_loc5_);
      }
      
      public function received_10378(param1:ByteArray) : void
      {
         var name:String = null;
         var count:int = 0;
         var favor:int = 0;
         var reason:String = null;
         var $data:ByteArray = param1;
         var buf:ByteArray = $data;
         var id:int = buf.readInt();
         var success:Boolean = buf.readBoolean();
         if(success)
         {
            name = buf.readUTF();
            count = buf.readShort();
            favor = buf.readInt();
            GameInstance.uiInstance.mainUI.showSysICOTip(MainUI.TYPE_FRIEND_TIP,function():void
            {
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(Friend_MsgReceivedProxy,"成功赠出玫瑰花",[count,name,favor]),false);
            });
         }
         else
         {
            reason = NetWorkManager.readGILMsg(buf);
            FAlert.show(LanResManager.getLanTextWords(this,"送花失败",[StaticValue.WHITE_HTML,reason]));
         }
      }
      
      public function received_10380(param1:ByteArray) : void
      {
         var name:String = null;
         var itemCount:int = 0;
         var favor:int = 0;
         var $data:ByteArray = param1;
         var buf:ByteArray = $data;
         var id:int = buf.readInt();
         name = buf.readUTF();
         var itemID:int = buf.readInt();
         itemCount = buf.readShort();
         favor = buf.readInt();
         if(id == GameInstance.peioPlayerID)
         {
            GameInstance.uiInstance.mainUI.showSysICOTip(MainUI.TYPE_FRIEND_TIP,function():void
            {
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(Friend_MsgReceivedProxy,"您收到了来自TA的玫瑰花",[itemCount,favor]),false);
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您收到了来自TA的玫瑰花",[itemCount,favor]),false);
            });
         }
         else
         {
            GameInstance.uiInstance.mainUI.showSysICOTip(MainUI.TYPE_FRIEND_TIP,function():void
            {
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(Friend_MsgReceivedProxy,"您收到了来自玩家的玫瑰花",[name,itemCount,favor]),false);
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您收到了来自玩家的玫瑰花",[name,itemCount,favor]),false);
            });
         }
      }
      
      public function received_10382(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:Boolean = _loc2_.readBoolean();
         if(_loc4_)
         {
            _loc5_ = _loc2_.readShort();
            _loc6_ = _loc2_.readUTF();
            _loc7_ = _loc2_.readShort();
            _loc8_ = _loc2_.readShort();
            this.friendMediator.updateSnoopEnemyPanel(_loc3_,_loc6_,"x=" + _loc7_ + "  y=" + _loc8_,_loc5_.toString());
         }
         else
         {
            _loc9_ = NetWorkManager.readGILMsg(_loc2_);
            this.friendMediator.updateSnoopEnemyPanel(_loc3_,LanResManager.getLanTextWords(this,"未知"),LanResManager.getLanTextWords(this,"未知坐标"),"0",LanResManager.getLanTextWords(this,"打探失败",[_loc9_]));
         }
      }
      
      public function received_52364(param1:ByteArray) : void
      {
         ZLog.add("接收52364:更新夫妻间好感度在线等状态 ");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readByte();
         var _loc6_:int = param1.readByte();
         this.friendMediator.updatePeiOuStatus(_loc2_,_loc3_,_loc5_,_loc6_,_loc4_);
      }
      
      public function received_10384(param1:ByteArray) : void
      {
         var _loc7_:Object = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = _loc2_.readByte();
         var _loc5_:int = _loc2_.readByte();
         this.myFriends.shiTulist = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc7_ = {};
            _loc7_.label = _loc2_.readInt();
            _loc7_.state = _loc2_.readByte();
            _loc7_.playerName = _loc2_.readUTF();
            _loc7_.lv = _loc2_.readShort();
            _loc7_.otherName = _loc2_.readUTF();
            _loc7_.lineserver = _loc2_.readByte();
            this.myFriends.insertShiTulist(_loc7_);
            _loc6_++;
         }
         this.friendMediator.updateShiTuPanel(_loc4_);
         this.friendMediator.removeLoaderBuff();
         if(_loc3_ == 1)
         {
            this.shiTuMediator.refreshList(_loc4_);
         }
      }
      
      public function received_10398(param1:ByteArray) : void
      {
         var _loc12_:Object = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:int = _loc2_.readInt();
         var _loc6_:int = _loc2_.readByte();
         var _loc7_:int = _loc2_.readByte();
         var _loc8_:Array = [];
         var _loc9_:int = 0;
         while(_loc9_ < _loc7_)
         {
            _loc12_ = {};
            _loc12_.id = _loc2_.readInt();
            _loc12_.name = _loc2_.readUTF();
            _loc12_.lv = _loc2_.readShort();
            _loc12_.tuDiShu = _loc2_.readShort();
            _loc12_.huoyue = _loc12_.shanXian = _loc2_.readShort();
            _loc12_.partyId = _loc2_.readByte();
            _loc12_.partyName = PartyType.getName(_loc12_.partyId);
            _loc8_.push(_loc12_);
            _loc9_++;
         }
         var _loc10_:Number = _loc2_.readDouble();
         var _loc11_:int = _loc2_.readInt();
         this.shiTuMediator.showShiTuPanel(_loc3_,_loc4_,_loc5_,_loc8_,_loc10_,_loc11_);
         this.friendMediator.removeLoaderBuff();
         this.shiTuMediator.removeLoaderBuff();
      }
      
      public function received_11002(param1:ByteArray) : void
      {
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:Goods = null;
         var _loc26_:Goods = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:int = _loc2_.readInt();
         var _loc6_:Number = _loc2_.readDouble();
         var _loc7_:Number = _loc2_.readDouble();
         var _loc8_:Number = _loc2_.readDouble();
         var _loc9_:Number = _loc2_.readDouble();
         var _loc10_:Number = param1.readDouble();
         var _loc11_:Number = param1.readDouble();
         var _loc12_:int = param1.readShort();
         var _loc13_:int = param1.readShort();
         var _loc14_:int = param1.readByte();
         var _loc15_:int = param1.readByte();
         var _loc16_:int = param1.readShort();
         var _loc17_:int = param1.readShort();
         var _loc18_:int = param1.readInt();
         var _loc19_:Object = {};
         _loc19_.equipArr = [];
         var _loc20_:int = 0;
         while(_loc20_ < _loc18_)
         {
            _loc23_ = param1.readInt();
            _loc24_ = param1.readShort();
            _loc25_ = new Goods(_loc23_,_loc24_);
            _loc25_.quality = param1.readInt();
            _loc25_.isFullStar = param1.readByte();
            _loc25_.strengthen_grade = param1.readByte();
            _loc25_.isTuteng = param1.readByte();
            _loc25_.isBaoshiTOP = param1.readByte();
            _loc25_.isNiuBi = param1.readByte();
            _loc25_.isFullTianshen = param1.readByte();
            _loc25_.isSiShengShou = param1.readByte();
            _loc25_.isFullStone = param1.readByte();
            _loc19_.equipArr.push(_loc25_);
            if(SpecialGoodsID.getSpecialAvatarType(_loc23_) > 0)
            {
               _loc19_.usingFashion = SpecialGoodsID.getSpecialAvatarType(_loc23_);
            }
            _loc20_++;
         }
         _loc20_ = 0;
         while(_loc20_ < _loc18_)
         {
            _loc26_ = _loc19_.equipArr[_loc20_];
            _loc26_.roleID = _loc3_;
            _loc20_++;
         }
         _loc19_.isOnMount = param1.readByte() == 0 ? false : true;
         if(_loc19_.isOnMount)
         {
            _loc19_.mountID = param1.readInt();
         }
         else
         {
            param1.readInt();
         }
         _loc19_.yupeiID = param1.readInt();
         _loc19_.useIng_Weapon_id = param1.readInt();
         _loc19_.isXTWJ = param1.readByte() == 0 ? false : true;
         _loc19_.isRTJS = param1.readByte() == 0 ? false : true;
         _loc19_.wuhun = param1.readShort();
         var _loc21_:Number = param1.readDouble();
         var _loc22_:Number = param1.readDouble();
         _loc19_.TSNL = param1.readShort();
         _loc19_.HuXinYao = param1.readShort() == 0 ? false : true;
         _loc19_.wuHunShengJiDan = param1.readShort() == 0 ? false : true;
         _loc19_.ShenNongBaiChaoDanSta = param1.readShort();
         _loc19_.niXiStatus = param1.readShort() == 0 ? false : true;
         _loc19_.qianNengXinFaSta = param1.readInt();
         _loc19_.useAvatarType = param1.readInt();
         _loc19_.taoZhuang = param1.readByte() == 1 ? true : false;
         _loc19_.isFeixing = param1.readByte() == 1;
         _loc19_.isFeixing_huanzhuang_Id = param1.readByte();
         _loc19_.fengHuang = param1.readByte() == 1;
         _loc19_.huohundan = param1.readByte() == 1;
         _loc19_.wuhunshendan = param1.readInt();
         _loc19_.longhunwupo = param1.readByte() == 1;
         _loc19_.longhunshendan = param1.readInt();
         _loc19_.shenfumiji = param1.readByte() == 1;
         _loc19_.isNeitishenqi = param1.readInt() == 1;
         _loc19_.neitishenqi = param1.readInt();
         this.shiTuMediator.setInfo(0,_loc19_,_loc4_,0,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_,_loc17_,_loc21_,_loc22_);
      }
      
      public function received_11004(param1:ByteArray) : void
      {
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:Goods = null;
         var _loc25_:Goods = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:Number = _loc2_.readDouble();
         var _loc5_:int = _loc2_.readInt();
         var _loc6_:Number = _loc2_.readDouble();
         var _loc7_:Number = _loc2_.readDouble();
         var _loc8_:Number = _loc2_.readDouble();
         var _loc9_:Number = _loc2_.readDouble();
         var _loc10_:Number = param1.readDouble();
         var _loc11_:Number = param1.readDouble();
         var _loc12_:int = param1.readShort();
         var _loc13_:int = param1.readShort();
         var _loc14_:int = param1.readByte();
         var _loc15_:int = param1.readByte();
         var _loc16_:int = param1.readShort();
         var _loc17_:int = param1.readShort();
         var _loc18_:int = param1.readInt();
         data.equipArr = [];
         var _loc19_:int = 0;
         while(_loc19_ < _loc18_)
         {
            _loc22_ = param1.readInt();
            _loc23_ = param1.readShort();
            _loc24_ = new Goods(_loc22_,_loc23_);
            _loc24_.quality = param1.readInt();
            _loc24_.isFullStar = param1.readByte();
            _loc24_.strengthen_grade = param1.readByte();
            _loc24_.isTuteng = param1.readByte();
            _loc24_.isBaoshiTOP = param1.readByte();
            _loc24_.isNiuBi = param1.readByte();
            _loc24_.isFullTianshen = param1.readByte();
            _loc24_.isSiShengShou = param1.readByte();
            _loc24_.isFullStone = param1.readByte();
            data.equipArr.push(_loc24_);
            _loc19_++;
         }
         _loc19_ = 0;
         while(_loc19_ < _loc18_)
         {
            _loc25_ = data.equipArr[_loc19_];
            _loc25_.roleID = _loc3_;
            _loc19_++;
         }
         data.isOnMount = param1.readByte() == 0 ? false : true;
         if(data.isOnMount)
         {
            data.mountID = param1.readInt();
         }
         else
         {
            param1.readInt();
         }
         data.yupeiID = param1.readInt();
         data.useIng_Weapon_id = param1.readInt();
         data.isXTWJ = param1.readByte() == 0 ? false : true;
         data.isRTJS = param1.readByte() == 0 ? false : true;
         data.wuhun = param1.readShort();
         var _loc20_:Number = param1.readDouble();
         var _loc21_:int = param1.readInt();
         data.TSNL = param1.readShort();
         data.HuXinYao = param1.readShort() == 0 ? false : true;
         data.wuHunShengJiDan = param1.readShort() == 0 ? false : true;
         data.ShenNongBaiChaoDanSta = param1.readShort();
         data.niXiStatus = param1.readShort() == 0 ? false : true;
         data.qianNengXinFaSta = param1.readInt();
         data.useAvatarType = param1.readInt();
         data.taoZhuang = param1.readByte() == 0 ? false : true;
         data.isFeixing = param1.readByte() == 1;
         data.isFeixing_huanzhuang_Id = param1.readByte();
         data.fengHuang = param1.readByte() == 1;
         data.huohundan = param1.readByte() == 1;
         data.wuhunshendan = param1.readInt();
         data.longhunwupo = param1.readByte() == 1;
         data.longhunshendan = param1.readInt();
         data.shenfumiji = param1.readByte() == 1;
         data.isNeitishenqi = param1.readInt() == 1;
         data.neitishenqi = param1.readInt();
         this.shiTuMediator.setInfo(1,data,0,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_,_loc17_,_loc20_,_loc21_);
      }
      
      public function received_11022(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:int = _loc2_.readInt();
         var _loc6_:String = _loc2_.readUTF();
         this.shiTuMediator.showConfirmShouTu(_loc3_,_loc4_,_loc5_,_loc6_);
      }
      
      public function received_11010(param1:ByteArray) : void
      {
         var _loc8_:Object = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = _loc2_.readByte();
         var _loc5_:int = _loc2_.readByte();
         var _loc6_:Array = [];
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            _loc8_ = {};
            _loc8_.id = _loc2_.readInt();
            _loc8_.name = _loc2_.readUTF();
            _loc8_.lv = _loc2_.readShort();
            _loc8_.exp = _loc2_.readDouble();
            _loc8_.sw = _loc2_.readDouble();
            _loc6_.push(_loc8_);
            _loc7_++;
         }
         this.jingYanJiangLi_Mediator.showJingYanJiangLiPanel(_loc3_,_loc4_,_loc6_);
         this.jingYanJiangLi_Mediator.removeLoaderBuff();
      }
      
      public function received_11012(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readByte();
         if(_loc4_ == 1)
         {
            this.jingYanJiangLi_Mediator.refreshPageData();
         }
         else
         {
            this.jingYanJiangLi_Mediator.removeLoaderBuff();
         }
      }
      
      public function received_11014(param1:ByteArray) : void
      {
         var _loc7_:Object = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = _loc2_.readByte();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc7_ = {};
            _loc7_.id = _loc2_.readInt();
            _loc7_.head = _loc2_.readInt();
            _loc7_.name = _loc2_.readUTF();
            _loc7_.lv = _loc2_.readShort();
            _loc7_.party = PartyType.getName(_loc2_.readByte());
            _loc5_.push(_loc7_);
            _loc6_++;
         }
         if(_loc3_ == 0)
         {
            this.friendMediator.showShiFuTuiJianTips(_loc5_);
         }
         else if(_loc3_ == 1)
         {
            _loc8_ = _loc2_.readByte();
            _loc9_ = _loc2_.readByte();
            this.friendMediator.showTuDiTuiJianTips(_loc5_,_loc8_,_loc9_);
         }
      }
      
      public function received_11024(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = _loc2_.readByte();
         if(_loc4_ == 1)
         {
            this.shiTuMediator.refreshList(_loc3_);
         }
      }
      
      public function received_11016(param1:ByteArray) : void
      {
         NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_EN_SHI_LING,this.msgSenderProxy.send_11017);
      }
   }
}

