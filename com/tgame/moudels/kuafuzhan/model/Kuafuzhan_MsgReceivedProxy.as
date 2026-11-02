package com.tgame.moudels.kuafuzhan.model
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.Player;
   import com.tgame.manager.HeadFaceManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ProcessManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.TaskTracker;
   import com.tgame.manager.TopTipManager;
   import com.tgame.moudels.kuafuzhan.view.Kuafuzhan_Mediator;
   import com.tgame.moudels.login.view.*;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Kuafuzhan_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Kuafuzhan_MsgReceivedProxy";
      
      private var _kuafuzhan_Mediator:Kuafuzhan_Mediator;
      
      private var _msg_sender:Kuafuzhan_MsgSenderProxy;
      
      public function Kuafuzhan_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      private function get kuafuzhan_Mediator() : Kuafuzhan_Mediator
      {
         if(!this._kuafuzhan_Mediator)
         {
            this._kuafuzhan_Mediator = facade.retrieveMediator(Kuafuzhan_Mediator.NAME) as Kuafuzhan_Mediator;
         }
         return this._kuafuzhan_Mediator;
      }
      
      private function get msg_sender() : Kuafuzhan_MsgSenderProxy
      {
         if(!this._msg_sender)
         {
            this._msg_sender = facade.retrieveProxy(Kuafuzhan_MsgSenderProxy.NAME) as Kuafuzhan_MsgSenderProxy;
         }
         return this._msg_sender;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([40212,10114,10116,10118,51150,51152,10600],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([40212,10114,10116,10118,51150,51152,10600],NAME);
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
      
      public function received_40212(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:int = 0;
         var _loc11_:String = null;
         var _loc12_:uint = 0;
         var _loc13_:XML = null;
         ZLog.add("40212：收到跨服服务器列表");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:XML = <list/>;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = _loc2_.readByte();
            _loc7_ = _loc2_.readUTF();
            _loc8_ = _loc2_.readUTF();
            _loc9_ = _loc2_.readUTF();
            _loc10_ = _loc2_.readInt();
            if(_loc10_ < 100)
            {
               _loc11_ = LanResManager.getLanCommonTextWords("【顺畅】");
               _loc12_ = uint(StaticValue.GREEN_STRONG);
            }
            else if(_loc10_ >= 100 && _loc10_ < 150)
            {
               _loc11_ = LanResManager.getLanCommonTextWords("【良好】");
               _loc12_ = uint(StaticValue.GREEN);
            }
            else if(_loc10_ >= 150 && _loc10_ < 200)
            {
               _loc11_ = LanResManager.getLanCommonTextWords("【繁忙】");
               _loc12_ = uint(StaticValue.YELLOW);
            }
            else if(_loc10_ >= 200 && _loc10_ < 250)
            {
               _loc11_ = LanResManager.getLanCommonTextWords("【爆满】");
               _loc12_ = uint(StaticValue.RED);
            }
            else if(_loc10_ >= 250)
            {
               _loc11_ = LanResManager.getLanCommonTextWords("【满员】");
               _loc12_ = uint(StaticValue.RED);
            }
            _loc13_ = <node label={_loc9_ + _loc11_} id={_loc6_} color={_loc12_} data="占位"/>;
            _loc4_.appendChild(_loc13_);
            _loc5_++;
         }
         this.kuafuzhan_Mediator.showKuafuLineList(_loc4_);
         PipeManager.sendMsg(PipeConstants.MAINUI_KUAFU_GUIZHE_QUERY,3);
      }
      
      public function received_10114(param1:ByteArray) : void
      {
         var _buf:ByteArray;
         var alertType:int;
         var serverLineID:int = 0;
         var bangzhuOn:String = null;
         var msg:String = null;
         var $data:ByteArray = param1;
         var requestEnterKuafu:Function = function(param1:int):void
         {
            msg_sender.send_10115(param1);
         };
         ZLog.add("10114：收到跨服服务器进入确认框");
         _buf = $data;
         serverLineID = _buf.readByte();
         alertType = _buf.readByte();
         if(alertType == 1)
         {
            FAlert.okLabel = LanResManager.getLanCommonTextWords("确定");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
            FAlert.show(LanResManager.getLanCommonTextWords("确定要传入跨服论剑台吗？"),"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  requestEnterKuafu(serverLineID);
               }
            });
         }
         else if(alertType == 2)
         {
            bangzhuOn = _buf.readUTF();
            if(bangzhuOn != "")
            {
               msg = "";
               msg += LanResManager.getLanCommonTextWords("您的帮主当前所在战场为：") + bangzhuOn + "\n\n";
               msg += LanResManager.getLanCommonTextWords("您确定不与帮主在同一战场游戏吗？") + "\n";
               msg += LanResManager.getLanCommonTextWords("您在论剑台内的收益计算公式为：") + "\n";
               msg += LanResManager.getLanCommonTextWords("等级*等级*所在帮会持有轩辕剑经验倍数*所处论剑台位置经验倍数") + "\n";
               FAlert.okLabel = LanResManager.getLanCommonTextWords("确定进入");
               FAlert.cancelLabel = LanResManager.getLanCommonTextWords("重新选择");
               FAlert.show(msg,"",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     requestEnterKuafu(serverLineID);
                  }
                  else
                  {
                     msg_sender.send_40211();
                  }
               });
            }
            else
            {
               FAlert.okLabel = LanResManager.getLanCommonTextWords("确定");
               FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
               FAlert.show(LanResManager.getLanCommonTextWords("确定要传入跨服论剑台吗？"),"",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     requestEnterKuafu(serverLineID);
                  }
               });
            }
         }
         else if(alertType == 3)
         {
            bangzhuOn = _buf.readUTF();
            msg = "";
            msg += LanResManager.getLanCommonTextWords("本帮帮主已前往跨服论剑台：") + bangzhuOn + "\n\n";
            msg += LanResManager.getLanCommonTextWords("在跨服论剑台中您将可以获取高额经验收益，") + "\n";
            msg += LanResManager.getLanCommonTextWords("如果战胜对手则可以获得论剑声望，") + "\n";
            msg += LanResManager.getLanCommonTextWords("使用论剑声望可以购买声望商店中的珍稀物品。") + "\n";
            msg += LanResManager.getLanCommonTextWords("在论剑台中同样存在各种珍贵商城道具爆出，") + "\n";
            msg += LanResManager.getLanCommonTextWords("（只有60级以上可以进入跨服论剑台）");
            FAlert.okLabel = LanResManager.getLanCommonTextWords("传送我");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("不传送");
            FAlert.show(msg,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  requestEnterKuafu(serverLineID);
               }
            });
         }
      }
      
      public function received_10116(param1:ByteArray) : void
      {
         var $data:ByteArray = param1;
         ZLog.add("10116：收到进入跨服服务器密钥 ");
         GameConfig.lineID = $data.readByte();
         GameConfig.lineServerIP = $data.readUTF();
         GameConfig.lineServerPortArr = String($data.readUTF()).split(",").map(function(param1:*, param2:int, param3:Array):int
         {
            return int(Number(param1));
         });
         GameConfig.lineServerPort = GameConfig.lineServerPortArr.shift();
         GameConfig.lineName = $data.readUTF();
         GameConfig.loginAuth = $data.readUTF();
         GameConfig.loginSign = $data.readUTF();
         GameConfig.chatServerIP = $data.readUTF();
         GameConfig.chatServerPortArr = String($data.readUTF()).split(",").map(function(param1:*, param2:int, param3:Array):int
         {
            return int(Number(param1));
         });
         GameConfig.chatServerPort = GameConfig.chatServerPortArr.shift();
         GameConfig.loginRoleVO.roleID = $data.readInt();
         GameConfig.gameAccount = $data.readInt();
         if(NetWorkManager.lineSocket != null && NetWorkManager.lineSocket.connected)
         {
            NetWorkManager.lineSocket.close();
         }
         if(NetWorkManager.chatSocket != null && NetWorkManager.chatSocket.connected)
         {
            NetWorkManager.chatSocket.close();
         }
         GameState.switchServer = true;
         GameState.enterLineSucess = false;
         ReloginManager.isInKuafu = true;
         GameInstance.mainChar.data = new Player(GameInstance.mainChar);
         PipeManager.sendMsg(PipeConstants.KUAFU_STATUS,true);
         TaskTracker.updateTaskUI();
         GameInstance.uiInstance.mainUI.setTrackVisible(false);
         GameInstance.mainCharData.afkInfo2.isStart = false;
         TopTipManager.getInstance().removeTip("guaji");
         PipeManager.sendMsg(PipeConstants.HIDE_ALL_UI_EXCEPT_MAINUI);
         NetWorkManager.connectChat();
         ProcessManager.enterLine();
      }
      
      public function received_10118(param1:ByteArray) : void
      {
         var $data:ByteArray = param1;
         ZLog.add("10118：收到返回原服务器密钥 ");
         GameConfig.lineID = $data.readByte();
         GameConfig.lineServerIP = $data.readUTF();
         GameConfig.lineServerPortArr = String($data.readUTF()).split(",").map(function(param1:*, param2:int, param3:Array):int
         {
            return int(Number(param1));
         });
         GameConfig.lineServerPort = GameConfig.lineServerPortArr.shift();
         GameConfig.lineName = $data.readUTF();
         GameConfig.loginAuth = $data.readUTF();
         GameConfig.loginSign = $data.readUTF();
         GameConfig.chatServerIP = $data.readUTF();
         GameConfig.chatServerPortArr = String($data.readUTF()).split(",").map(function(param1:*, param2:int, param3:Array):int
         {
            return int(Number(param1));
         });
         GameConfig.chatServerPort = GameConfig.chatServerPortArr.shift();
         GameConfig.loginRoleVO.roleID = $data.readInt();
         GameConfig.gameAccount = $data.readInt();
         if(NetWorkManager.lineSocket != null && NetWorkManager.lineSocket.connected)
         {
            NetWorkManager.lineSocket.close();
         }
         if(NetWorkManager.chatSocket != null && NetWorkManager.chatSocket.connected)
         {
            NetWorkManager.chatSocket.close();
         }
         GameState.switchServer = true;
         GameState.enterLineSucess = false;
         ReloginManager.isInKuafu = false;
         GameInstance.mainChar.data = new Player(GameInstance.mainChar);
         GameState.isMainCharChanged = true;
         PipeManager.sendMsg(PipeConstants.KUAFU_STATUS,false);
         TaskTracker.updateTaskUI();
         GameInstance.uiInstance.mainUI.setTrackVisible(true);
         NetWorkManager.connectChat();
         ProcessManager.enterLine();
      }
      
      public function received_51150(param1:ByteArray) : void
      {
         ZLog.add("51150：跨服战实时信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readShort();
         var _loc4_:String = _loc2_.readUTF();
         var _loc5_:int = _loc2_.readShort();
         var _loc6_:int = _loc2_.readInt();
         var _loc7_:int = _loc2_.readShort();
         var _loc8_:int = _loc2_.readShort();
         var _loc9_:int = _loc2_.readShort();
         var _loc10_:int = _loc2_.readShort();
         var _loc11_:int = _loc2_.readShort();
         var _loc12_:int = _loc2_.readShort();
         var _loc13_:int = _loc2_.readShort();
         var _loc14_:int = _loc2_.readShort();
         var _loc15_:int = _loc2_.readShort();
         this.kuafuzhan_Mediator.receive_time(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_);
      }
      
      public function received_51152(param1:ByteArray) : void
      {
         var _loc8_:SceneCharacter = null;
         ZLog.add("51152：轩辕剑所在帮会ID");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:int = _loc2_.readInt();
         var _loc6_:int = _loc2_.readInt();
         GameConfig.xuanyuanjian_banghuiIDList.length = 0;
         if(_loc3_ > 0)
         {
            GameConfig.xuanyuanjian_banghuiIDList.push(_loc3_);
         }
         if(_loc4_ > 0)
         {
            GameConfig.xuanyuanjian_banghuiIDList.push(_loc4_);
         }
         if(_loc5_ > 0)
         {
            GameConfig.xuanyuanjian_banghuiIDList.push(_loc5_);
         }
         if(_loc5_ > 0)
         {
            GameConfig.xuanyuanjian_banghuiIDList.push(_loc5_);
         }
         var _loc7_:Array = [];
         for each(_loc8_ in GameInstance.scene.sceneCharacters)
         {
            if(_loc8_.type == SceneCharacterType.PLAYER)
            {
               _loc7_.push(_loc8_.id);
            }
         }
         HeadFaceManager.updatePlayersName(_loc7_);
      }
      
      public function received_10600(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:String = null;
         ZLog.add("10600：客户端通知服务器锁屏与解锁");
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = _loc2_.readByte() == 1;
         if(_loc3_)
         {
            _loc4_ = _loc2_.readShort();
            _loc5_ = NetWorkManager.readGILMsg(_loc2_);
            TPreLoader.startLock(_loc5_,_loc4_);
         }
         else
         {
            TPreLoader.stopLock();
         }
      }
   }
}

