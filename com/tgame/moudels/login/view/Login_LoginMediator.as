package com.tgame.moudels.login.view
{
   import com.fireice.alert.FAlert;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.login.DisconnectInfo;
   import com.tgame.common.vo.login.LoginRoleVO;
   import com.tgame.manager.FacadeManager;
   import com.tgame.manager.ProcessManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.login.Login_ApplicationFacade;
   import com.tgame.moudels.login.model.Login_MsgSenderProxy;
   import com.tgame.moudels.login.view.compoents.LoginUI;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import flash.display.BitmapData;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Login_LoginMediator extends Mediator
   {
      
      public static const NAME:String = "Login_LoginMediator";
      
      private var roleArr:Array;
      
      private var avatar_zizeng:int = 0;
      
      private var _msgSenderProxy:Login_MsgSenderProxy;
      
      public function Login_LoginMediator(param1:Object = null)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
      }
      
      override public function onRemove() : void
      {
         if(this.loginComponent != null)
         {
            this.loginComponent.destory();
            if(this.loginComponent.parent)
            {
               this.loginComponent.parent.removeChild(this.loginComponent);
            }
         }
      }
      
      protected function get loginComponent() : LoginUI
      {
         return viewComponent as LoginUI;
      }
      
      private function get msgSenderProxy() : Login_MsgSenderProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(Login_MsgSenderProxy.NAME) as Login_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Login_ApplicationFacade.SHOW_LOGINUI];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Login_ApplicationFacade.SHOW_LOGINUI:
               this.showLoginUI();
         }
      }
      
      private function login(param1:String, param2:String) : void
      {
         GameConfig.test_userName = param1;
         GameConfig.test_passWord = param2;
         TPreLoader.updateLoadingUI(LanResManager.getLanTextWords(this,"正在登陆"),0.65,false);
         var _loc3_:Array = [param1,param2];
         this.msgSenderProxy.send_10011(_loc3_);
      }
      
      public function setRandomName(param1:String) : void
      {
         this.loginComponent.setRandomName(param1);
      }
      
      public function setRecoverCharData(param1:XML) : void
      {
         this.loginComponent.setRecoverData(param1);
      }
      
      public function showSelectLineUI(param1:Array) : void
      {
         var _loc6_:DisconnectInfo = null;
         var _loc7_:int = 0;
         if(param1.length == 0)
         {
            FAlert.show(LanResManager.getLanTextWords(this,"没有可用线路",[StaticValue.RED_HTML]),"",1);
            return;
         }
         if(param1.length == 1)
         {
            this.selectLine(param1[0]);
            return;
         }
         GameInstance.uiInstance.loginUI.mouseChildren = GameInstance.uiInstance.loginUI.mouseEnabled = true;
         var _loc2_:XML = <list></list>;
         var _loc3_:Array = [[LanResManager.getLanTextWords(this,"顺畅"),StaticValue.GREEN],[LanResManager.getLanTextWords(this,"良好"),StaticValue.YELLOW],[LanResManager.getLanTextWords(this,"繁忙"),StaticValue.RED]];
         var _loc4_:int = int(param1.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_.appendChild(<node label={param1[_loc5_].serverName + "（" + _loc3_[int(param1[_loc5_].status) - 1][0] + "）"} serverName={param1[_loc5_].serverName} color={_loc3_[int(param1[_loc5_].status) - 1][1]} data={param1[_loc5_].hostName + ":" + param1[_loc5_].hostPort} serverLineID={param1[_loc5_].id} id={param1[_loc5_].id} hostName={param1[_loc5_].hostName} hostPort={param1[_loc5_].hostPort}/>);
            _loc5_++;
         }
         this.loginComponent.showSelectLinePanel(_loc2_);
         if(ReloginManager.isDisconnectRelogin())
         {
            _loc6_ = ReloginManager.getInfo_disconnect();
            if(_loc6_ != null)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc4_)
               {
                  _loc7_ = int(param1[_loc5_].id);
                  if(_loc6_.lineID == _loc7_)
                  {
                     this.selectLine(param1[_loc5_]);
                     break;
                  }
                  _loc5_++;
               }
            }
         }
      }
      
      public function addCharSuccess(param1:Array) : void
      {
         if(param1[0] == 0)
         {
            FAlert.show("<font color=\'" + StaticValue.RED_HTML + "\'>" + param1[1] + "</font>","",1);
         }
         else
         {
            this.selecttRole(param1[1]);
         }
      }
      
      public function removeCharSuccess(param1:int) : void
      {
         if(param1 == 1)
         {
            this.msgSenderProxy.send_10013();
         }
         else
         {
            FAlert.show(LanResManager.getLanTextWords(this,"删除角色失败",[StaticValue.RED_HTML]),"",1,this.msgSenderProxy.send_10013);
         }
      }
      
      public function showSelectRoleUI(param1:Array) : void
      {
         var _loc7_:LoginRoleVO = null;
         var _loc8_:String = null;
         var _loc9_:DisconnectInfo = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         this.roleArr = param1;
         var _loc2_:String = GameConfig.gameNotice;
         var _loc3_:URLLoader = new URLLoader();
         _loc3_.load(new URLRequest(_loc2_));
         _loc3_.addEventListener(Event.COMPLETE,this.addGameNotice);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.addGameNoticeError);
         _loc3_.addEventListener(ErrorEvent.ERROR,this.addGameNoticeError);
         if(this.roleArr.length == 0)
         {
            this.addChar(false);
            return;
         }
         var _loc4_:XML = <list></list>;
         var _loc5_:String = LanResManager.getLanTextWords(this,"创建新角色");
         var _loc6_:int = 0;
         while(_loc6_ < 4)
         {
            if(this.roleArr[_loc6_] != undefined)
            {
               _loc7_ = LoginRoleVO(this.roleArr[_loc6_]);
               _loc8_ = PartyType.getName(_loc7_.partyID);
               _loc4_.appendChild(<node label={_loc7_.nickName} level={_loc7_.level} party={_loc8_} id={_loc7_.roleID} sex={_loc7_.sex} headImg={_loc7_.headImg} partyID={_loc7_.partyID}/>);
            }
            else
            {
               _loc4_.appendChild(<node label={_loc5_} id=""/>);
            }
            _loc6_++;
         }
         GameInstance.uiInstance.loginUI.showSelectChar(_loc4_,"");
         if(ReloginManager.isDisconnectRelogin())
         {
            _loc9_ = ReloginManager.getInfo_disconnect();
            if(_loc9_ != null)
            {
               _loc10_ = int(this.roleArr.length);
               _loc6_ = 0;
               while(_loc6_ < _loc10_)
               {
                  _loc7_ = LoginRoleVO(this.roleArr[_loc6_]);
                  _loc11_ = _loc7_.roleID;
                  if(_loc9_.playerID == _loc11_)
                  {
                     this.selecttRole(this.roleArr[_loc6_]);
                     break;
                  }
                  _loc6_++;
               }
            }
         }
      }
      
      public function loginDefect(param1:Boolean) : void
      {
         if(!param1)
         {
            FAlert.show("",LanResManager.getLanTextWords(this,"登录失败",[StaticValue.GREEN_HTML]));
         }
      }
      
      private function showLoginUI() : void
      {
         var auth:String;
         var sign:String;
         var loginUI:LoginUI = null;
         var disconnectInfo:DisconnectInfo = null;
         if(this.loginComponent == null)
         {
            loginUI = new LoginUI();
            UIEventsRegisterManager.registerUI(loginUI,LoginUI);
            UIEventsRegisterManager.addUIRegisterEvent(LoginUI,function():void
            {
               loginUI.addEventListener(LoginUI.UI_LOGIN_SUBMIT,loginUIEvents);
               loginUI.addEventListener(LoginUI.UI_LOGIN_SELECTLINE_OK,loginUIEvents);
               loginUI.addEventListener(LoginUI.UI_LOGIN_SELECTLINE_CANCEL,loginUIEvents);
               loginUI.addEventListener(LoginUI.UI_LOGIN_SELECTCHAR_ENTER_GAME,loginUIEvents);
               loginUI.addEventListener(LoginUI.UI_LOGIN_SELECTCHAR_GET_CHAR_AVATER,loginUIEvents);
               loginUI.addEventListener(LoginUI.UI_LOGIN_SELECTCHAR_SHOW_CREATECHARPANEL,loginUIEvents);
               loginUI.addEventListener(LoginUI.UI_LOGIN_SELECTCHAR_DELETE_CHAR,loginUIEvents);
               loginUI.addEventListener(LoginUI.UI_LOGIN_SELECTCHAR_CREATE_CHAR,loginUIEvents);
               loginUI.addEventListener(LoginUI.UI_LOGIN_SELECTCHAR_CREATE_CANCEL,loginUIEvents);
               loginUI.addEventListener(LoginUI.UI_LOGIN_CREATECHAR_NAME_RANDOM,loginUIEvents);
               loginUI.addEventListener(LoginUI.UI_LOGIN_SELECTCHAR_SHOW_RECOVER_CHAR,loginUIEvents);
               loginUI.addEventListener(LoginUI.UI_LOGIN_SELECTCHAR_RECOVER_CHAR,loginUIEvents);
            });
            UIEventsRegisterManager.addUIRemovedEvent(LoginUI,function():void
            {
               loginUI.removeEventListener(LoginUI.UI_LOGIN_SUBMIT,loginUIEvents);
               loginUI.removeEventListener(LoginUI.UI_LOGIN_SELECTLINE_OK,loginUIEvents);
               loginUI.removeEventListener(LoginUI.UI_LOGIN_SELECTLINE_CANCEL,loginUIEvents);
               loginUI.removeEventListener(LoginUI.UI_LOGIN_SELECTCHAR_ENTER_GAME,loginUIEvents);
               loginUI.removeEventListener(LoginUI.UI_LOGIN_SELECTCHAR_GET_CHAR_AVATER,loginUIEvents);
               loginUI.removeEventListener(LoginUI.UI_LOGIN_SELECTCHAR_SHOW_CREATECHARPANEL,loginUIEvents);
               loginUI.removeEventListener(LoginUI.UI_LOGIN_SELECTCHAR_DELETE_CHAR,loginUIEvents);
               loginUI.removeEventListener(LoginUI.UI_LOGIN_SELECTCHAR_CREATE_CHAR,loginUIEvents);
               loginUI.removeEventListener(LoginUI.UI_LOGIN_SELECTCHAR_CREATE_CANCEL,loginUIEvents);
               loginUI.removeEventListener(LoginUI.UI_LOGIN_CREATECHAR_NAME_RANDOM,loginUIEvents);
               loginUI.removeEventListener(LoginUI.UI_LOGIN_SELECTCHAR_SHOW_RECOVER_CHAR,loginUIEvents);
               loginUI.removeEventListener(LoginUI.UI_LOGIN_SELECTCHAR_RECOVER_CHAR,loginUIEvents);
            });
            loginUI.resize(GameConfig.sceneWidth,GameConfig.sceneHeight);
            GameInstance.uiInstance.uiContainer.addChild(loginUI);
            GameInstance.uiInstance.loginUI = loginUI;
            this.setViewComponent(loginUI);
         }
         auth = GameConfig.flashParameters["auth"];
         sign = GameConfig.flashParameters["sign"];
         if(auth != undefined && sign != undefined && auth != null && sign != null && auth != "undefined" && sign != "undefined" && auth != "null" && sign != "null" && auth != "" && sign != "")
         {
            this.login(auth,sign);
         }
         else
         {
            GameInstance.uiInstance.loginUI.showLoginPanel();
            disconnectInfo = ReloginManager.getInfo_disconnect();
            if(disconnectInfo != null)
            {
               if(disconnectInfo.userName != "" && disconnectInfo.passWord != "")
               {
                  this.login(disconnectInfo.userName,disconnectInfo.passWord);
               }
            }
         }
      }
      
      private function loginUIEvents(param1:*) : void
      {
         var _loc2_:Array = null;
         switch(param1.type)
         {
            case LoginUI.UI_LOGIN_SUBMIT:
               _loc2_ = param1.data as Array;
               this.login(_loc2_[0].name,_loc2_[0].password);
               break;
            case LoginUI.UI_LOGIN_SELECTLINE_OK:
               this.selectLine(param1.data);
               break;
            case LoginUI.UI_LOGIN_SELECTLINE_CANCEL:
               break;
            case LoginUI.UI_LOGIN_SELECTCHAR_ENTER_GAME:
               this.loginComponent.stopRollingBG();
               this.selecttRole(param1.data);
               break;
            case LoginUI.UI_LOGIN_SELECTCHAR_CREATE_CHAR:
               this.creatChar(param1.data);
               break;
            case LoginUI.UI_LOGIN_SELECTCHAR_CREATE_CANCEL:
               if(Boolean(this.roleArr) && this.roleArr.length > 0)
               {
                  this.showSelectRoleUI(this.roleArr);
               }
               break;
            case LoginUI.UI_LOGIN_SELECTCHAR_DELETE_CHAR:
               this.removeChar(param1.data);
               break;
            case LoginUI.UI_LOGIN_SELECTCHAR_SHOW_CREATECHARPANEL:
               this.addChar();
               break;
            case LoginUI.UI_LOGIN_SELECTCHAR_GET_CHAR_AVATER:
               this.selectedCharAvate(param1.data);
               break;
            case LoginUI.UI_LOGIN_CREATECHAR_NAME_RANDOM:
               this.msgSenderProxy.send_10009(param1.data);
               break;
            case LoginUI.UI_LOGIN_SELECTCHAR_SHOW_RECOVER_CHAR:
               if(this.roleArr.length == 4)
               {
                  FAlert.show(LanResManager.getLanCommonTextWords("人物列表已满，没有足够的位置"),"",1,null);
               }
               else
               {
                  this.msgSenderProxy.send_56001();
               }
               break;
            case LoginUI.UI_LOGIN_SELECTCHAR_RECOVER_CHAR:
               this.msgSenderProxy.send_56003(param1.data);
         }
      }
      
      private function selectLine(param1:Object) : void
      {
         var $lindData:Object = param1;
         GameConfig.lineID = $lindData.id;
         GameConfig.lineName = $lindData.serverName;
         GameConfig.lineServerIP = $lindData.hostName;
         GameConfig.lineServerPortArr = String($lindData.hostPort).split(",").map(function(param1:*, param2:int, param3:Array):int
         {
            return int(Number(param1));
         });
         GameConfig.lineServerPort = GameConfig.lineServerPortArr.shift();
         this.msgSenderProxy.send_10013();
      }
      
      private function selecttRole(param1:Object) : void
      {
         var _loc2_:LoginRoleVO = null;
         if(param1 is LoginRoleVO)
         {
            _loc2_ = LoginRoleVO(param1);
         }
         else
         {
            _loc2_ = new LoginRoleVO();
            _loc2_.headImg = param1.headImg;
            _loc2_.level = param1.level;
            _loc2_.nickName = param1.label;
            _loc2_.partyID = param1.partyID;
            _loc2_.roleID = param1.id;
            _loc2_.sex = param1.sex;
         }
         GameConfig.loginRoleVO = _loc2_;
         GameState.hasSelectedChar = true;
         ProcessManager.enterLine();
         FacadeManager.killFacade(PipeConstants.STARTUP_LOGIN);
      }
      
      private function addChar(param1:Boolean = true) : void
      {
         GameInstance.uiInstance.loginUI.showCreateChar(param1);
      }
      
      private function creatChar(param1:Object) : void
      {
         var _loc2_:Object = {};
         _loc2_.nickName = param1.name;
         _loc2_.headImg = param1.head;
         _loc2_.sex = 1;
         if(!param1.party)
         {
            param1.party = LanResManager.getLanCommonTextWords("无");
         }
         if(param1.party == LanResManager.getLanCommonTextWords("少林"))
         {
            param1.party = LanResManager.getLanCommonTextWords("少林派");
         }
         if(param1.party == LanResManager.getLanCommonTextWords("武当") || param1.party == LanResManager.getLanCommonTextWords("全真"))
         {
            param1.party = LanResManager.getLanCommonTextWords("全真教");
         }
         if(param1.party == LanResManager.getLanCommonTextWords("古墓"))
         {
            param1.party = LanResManager.getLanCommonTextWords("古墓派");
         }
         if(param1.party == LanResManager.getLanCommonTextWords("峨眉"))
         {
            param1.party = LanResManager.getLanCommonTextWords("桃花岛");
         }
         _loc2_.party = PartyType.getID(param1.party);
         this.msgSenderProxy.send_10015(_loc2_);
      }
      
      private function removeChar(param1:Object) : void
      {
         this.msgSenderProxy.send_10017(param1.id);
      }
      
      private function selectedCharAvate(param1:Object) : void
      {
         var apdArr:Array;
         var loginRoleVO:LoginRoleVO = null;
         var callBack:Function = null;
         var obj:Object = param1;
         callBack = function(param1:*, param2:BitmapData):void
         {
            if(param1 != loginRoleVO.roleID + "_" + avatar_zizeng)
            {
               return;
            }
            loginComponent.charAvatarImg = param2;
         };
         loginRoleVO = this.getSelectedChar(obj.id);
         if(!loginRoleVO)
         {
            return;
         }
         this.loginComponent.charAvatarImg = null;
         apdArr = loginRoleVO.avatarInfo.getSimpleAPDList(loginRoleVO.isOnMount);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar(loginRoleVO.roleID + "_" + ++this.avatar_zizeng,callBack,apdArr);
      }
      
      private function getSelectedChar(param1:int) : LoginRoleVO
      {
         var _loc2_:LoginRoleVO = null;
         for each(_loc2_ in this.roleArr)
         {
            if(_loc2_.roleID == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function addGameNotice(param1:Event) : void
      {
         var _loc2_:URLLoader = param1.target as URLLoader;
         _loc2_.dataFormat = URLLoaderDataFormat.TEXT;
         GameInstance.uiInstance.loginUI.addGameNotice(_loc2_.data);
      }
      
      private function addGameNoticeError(param1:*) : void
      {
      }
      
      public function showRecoverPanel() : void
      {
         this.loginComponent.showRecoverChar();
      }
      
      public function refreshRoleData(param1:int, param2:String) : void
      {
         var _loc3_:String = "";
         if(param1 == 1)
         {
            _loc3_ = LanResManager.getLanCommonTextWords("恢复角色成功");
         }
         else
         {
            _loc3_ = LanResManager.getLanCommonTextWords("恢复角色失败");
         }
         FAlert.show(_loc3_,"",1,this.msgSenderProxy.send_10013);
      }
   }
}

