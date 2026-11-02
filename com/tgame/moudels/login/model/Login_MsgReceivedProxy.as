package com.tgame.moudels.login.model
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.HeadResChange;
   import com.tgame.common.vo.character.info.AvatarInfo;
   import com.tgame.common.vo.login.LoginRoleVO;
   import com.tgame.manager.AvatarManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.moudels.login.Login_ApplicationFacade;
   import com.tgame.moudels.login.view.*;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Login_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Login_MsgReceivedProxy";
      
      private var _loginSocketProxy:Login_LoginSocketManager;
      
      private var _msgSenderProxy:Login_MsgSenderProxy;
      
      private var _login_Mediator:Login_LoginMediator;
      
      public function Login_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      private function get loginSocketProxy() : Login_LoginSocketManager
      {
         if(this._loginSocketProxy == null)
         {
            this._loginSocketProxy = facade.retrieveProxy(Login_LoginSocketManager.NAME) as Login_LoginSocketManager;
         }
         return this._loginSocketProxy;
      }
      
      private function get msgSenderProxy() : Login_MsgSenderProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(Login_MsgSenderProxy.NAME) as Login_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([10012,10014,10016,10018,10010,56002,56004],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([10012,10014,10016,10018,10010,56002,56004],NAME);
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
      
      public function received_10012(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = param1.readByte();
         if(_loc3_ == 1)
         {
            ZLog.add("10012：登陆成功");
            _loc4_ = _loc2_.readInt();
            GameConfig.gameAccount = _loc4_;
            GameConfig.isChenMi = _loc2_.readByte();
            GameConfig.loginAuth = _loc2_.readUTF();
            GameConfig.loginSign = _loc2_.readUTF();
            GameConfig.yunying_serverID = _loc2_.readInt();
            GameConfig.yunying_userID = _loc2_.readUTF();
            GameConfig.serverTime_onLogin = _loc2_.readDouble();
            TVersion.BANBENHAO = String(_loc2_.readInt());
            GameConfig.localTime_serverTime_D_value = new Date().getTime() - GameConfig.serverTime_onLogin;
            GameConfig.yunying_chongzhi = GameConfig.yunying_chongzhi.replace("_","&").replace("$s",GameConfig.yunying_serverID).replace("$u",GameConfig.yunying_userID);
            NetWorkManager.startHeart();
            TPreLoader.updateLoadingUI(LanResManager.getLanTextWords(this,"正在请求分线列表"),0.8,false);
            this.msgSenderProxy.send_40209();
            sendNotification(Login_ApplicationFacade.LOGIN_DEFEAT,true);
         }
         else
         {
            ZLog.add(["10012：登陆失败",_loc5_]);
            _loc5_ = NetWorkManager.readGILMsg(_loc2_);
            NoticeManager.notify(NoticeManager.ALERT,_loc5_);
            TPreLoader.updateLoadingUI(LanResManager.getLanTextWords(this,"登陆失败"),1,false);
         }
      }
      
      public function received_10014(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc11_:LoginRoleVO = null;
         ZLog.add("10014：接收玩家角色列表消息");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc10_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc11_ = new LoginRoleVO();
            _loc11_.roleID = _loc2_.readInt();
            _loc11_.headImg = HeadResChange.headResChangeToString(_loc2_.readByte());
            _loc11_.nickName = _loc2_.readUTF();
            _loc11_.level = _loc2_.readShort();
            _loc11_.partyID = _loc2_.readByte();
            _loc10_.push(_loc11_);
            _loc4_++;
         }
         sendNotification(Login_ApplicationFacade.SHOW_ROLE_LIST,_loc10_);
      }
      
      public function received_10016(param1:ByteArray) : void
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:LoginRoleVO = null;
         var _loc10_:AvatarInfo = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            _loc6_ = param1.readInt();
            _loc7_ = HeadResChange.headResChangeToString(param1.readByte());
            _loc3_ = param1.readUTF();
            _loc4_ = param1.readShort();
            _loc5_ = param1.readByte();
            _loc9_ = new LoginRoleVO();
            _loc9_.roleID = _loc6_;
            _loc9_.headImg = _loc7_;
            _loc9_.nickName = _loc3_;
            _loc9_.level = _loc4_;
            _loc9_.partyID = _loc5_;
            _loc10_ = _loc9_.avatarInfo;
            _loc11_ = param1.readByte();
            _loc12_ = 0;
            while(_loc12_ < _loc11_)
            {
               _loc14_ = param1.readInt();
               _loc15_ = param1.readByte();
               AvatarManager.dressAvatarData(_loc10_,_loc15_,_loc14_,_loc9_.getSex());
               _loc12_++;
            }
            _loc13_ = param1.readByte();
            _loc9_.isOnMount = _loc13_ == 1;
            if(_loc13_ == 1)
            {
               _loc14_ = param1.readInt();
               _loc10_.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,_loc14_),AvatarPartType.MOUNT);
            }
            sendNotification(Login_ApplicationFacade.CREATE_ROLE_SUCCESS,[1,_loc9_]);
            ZLog.add(["10016：接收创建玩家成功消息:",_loc6_,_loc3_]);
         }
         else
         {
            _loc8_ = NetWorkManager.readGILMsg(param1);
            ZLog.add(["10016：接收创建玩家失败消息:",_loc8_]);
            sendNotification(Login_ApplicationFacade.CREATE_ROLE_SUCCESS,[0,_loc8_]);
         }
      }
      
      public function received_10018(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readByte();
         sendNotification(Login_ApplicationFacade.DELETE_CHAR,_loc2_);
         ZLog.add(["10018：接收删除玩家消息:" + (_loc2_ == 1 ? "删除成功" : "删除失败")]);
      }
      
      public function received_10010(param1:ByteArray) : void
      {
         var _loc2_:String = param1.readUTF();
         this.login_Mediator.setRandomName(_loc2_);
         ZLog.add(["10010：接收随机名字"]);
      }
      
      private function get login_Mediator() : Login_LoginMediator
      {
         if(!this._login_Mediator)
         {
            this._login_Mediator = facade.retrieveMediator(Login_LoginMediator.NAME) as Login_LoginMediator;
         }
         return this._login_Mediator;
      }
      
      public function received_56002(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:Date = null;
         var _loc10_:String = null;
         var _loc11_:XML = null;
         var _loc2_:int = param1.readByte();
         var _loc3_:XML = <list/>;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = param1.readInt();
            _loc6_ = param1.readUTF();
            _loc7_ = param1.readShort();
            _loc8_ = param1.readDouble();
            _loc9_ = new Date();
            _loc9_.setTime(_loc8_);
            _loc10_ = _loc9_.getFullYear() + "-" + (_loc9_.getMonth() + 1) + "-" + _loc9_.getDate();
            _loc11_ = <node id={_loc5_} name={_loc6_} dengji={_loc7_} date={_loc10_}/>;
            _loc3_.appendChild(_loc11_);
            _loc4_++;
         }
         this.login_Mediator.setRecoverCharData(_loc3_);
         this.login_Mediator.showRecoverPanel();
      }
      
      public function received_56004(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readByte();
         var _loc3_:String = "";
         this.login_Mediator.refreshRoleData(_loc2_,_loc3_);
      }
   }
}

