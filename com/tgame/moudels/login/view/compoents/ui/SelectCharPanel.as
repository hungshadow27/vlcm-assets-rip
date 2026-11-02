package com.tgame.moudels.login.view.compoents.ui
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.alert.FAlert;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FAlertEvent;
   import com.fireice.list.FList;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.MainButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.moudels.login.view.compoents.LoginUI;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import flash.utils.getTimer;
   
   public class SelectCharPanel extends Sprite
   {
      
      private var tip:FTextArea;
      
      private var charList:FList;
      
      private var loginBtn:FSimpleButton;
      
      private var delBtn:MainButton;
      
      private var xingxiang:DisplayObject;
      
      private var slAvatar:DisplayObject;
      
      private var wdAvatar:DisplayObject;
      
      private var gmAvatar:DisplayObject;
      
      private var emAvatar:DisplayObject;
      
      private var idArr:Array;
      
      private var deleteBtn:FSimpleButton;
      
      private var recoverBtn:FSimpleButton;
      
      private var time:Number;
      
      private var p:Point;
      
      private var mc:MovieClip;
      
      private var loadUrl:String;
      
      private var wenzi:DisplayObject;
      
      private var avatarStand:DisplayObject;
      
      private var mcAvatarStand:MovieClip;
      
      public var imgSeal:Bitmap;
      
      public function SelectCharPanel()
      {
         var tf:TextFormat;
         var bg:F9GridBitmap = null;
         this.idArr = [];
         super();
         with(graphics)
         {
            beginFill(0,0);
            drawRect(0,0,1000,580);
            endFill();
         }
         this.p = new Point();
         this.time = getTimer();
         this.imgSeal = StaticValue.getBitmapByClassName("ui.login.seal");
         addChild(this.imgSeal);
         this.imgSeal.x = 900;
         this.imgSeal.y = 430;
         tf = new TextFormat();
         tf.leading = 6;
         this.tip = new FTextArea();
         this.tip.defaultTextFormat = tf;
         this.tip.x = 694;
         this.tip.wordWrap = true;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tip.y = 140;
         this.tip.width = 274;
         this.tip.height = 346;
         this.charList = new FList();
         this.charList.isUseCellRealHeight = true;
         this.charList.skin = "dengluList_cg";
         this.charList.itemRenderer = new SelectCharListRender();
         this.charList.listWidth = 96;
         addChild(this.charList);
         this.charList.x = 98 + 18;
         this.charList.y = 47 + 22;
         this.charList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.deleteBtn = new FSimpleButton();
         this.deleteBtn.skin = "deleteCharBtn_cg";
         addChild(this.deleteBtn);
         this.deleteBtn.x = 380;
         this.deleteBtn.y = 432 + 86;
         this.deleteBtn.addEventListener(MouseEvent.CLICK,this.delChar);
         this.recoverBtn = new FSimpleButton();
         this.recoverBtn.skin = "recoverCharBtn";
         addChild(this.recoverBtn);
         this.recoverBtn.x = 650;
         this.recoverBtn.y = 432 + 86;
         this.recoverBtn.addEventListener(MouseEvent.CLICK,this.onRecoverClick);
         this.loginBtn = new FSimpleButton();
         this.loginBtn.skin = "loginBtn_cg";
         addChild(this.loginBtn);
         this.loginBtn.x = 477;
         this.loginBtn.y = 420 + 96;
         this.loginBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.loginBtn:
               if(this.charList.selectItem == null || Fun.isVisible(this) == false)
               {
                  break;
               }
               this.removeMc();
               parent.parent.dispatchEvent(new BaseEvent(LoginUI.UI_LOGIN_SELECTCHAR_ENTER_GAME,"",this.charList.selectItem));
               if(parent)
               {
                  parent.removeChild(this);
               }
         }
      }
      
      private function delChar(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         if(this.charList.selectItem == null)
         {
            return;
         }
         FAlert.show(LanResManager.getLanTextWords(SelectCharPanel,"确认要删除角色",[StaticValue.RED_HTML,this.charList.selectItem.label,this.charList.selectItem.party,this.charList.selectItem.level]),"",2,function(param1:FAlertEvent):void
         {
            if(param1.eventData == FAlert.OK)
            {
               parent.parent.dispatchEvent(new BaseEvent(LoginUI.UI_LOGIN_SELECTCHAR_DELETE_CHAR,"",charList.selectItem));
            }
         });
      }
      
      private function onRecoverClick(param1:MouseEvent) : void
      {
         parent.parent.dispatchEvent(new BaseEvent(LoginUI.UI_LOGIN_SELECTCHAR_SHOW_RECOVER_CHAR));
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         switch(param1.keyCode)
         {
            case Keyboard.ENTER:
               if(this.charList.selectItem == null || Fun.isVisible(this) == false)
               {
                  break;
               }
               this.removeMc();
               parent.parent.dispatchEvent(new BaseEvent(LoginUI.UI_LOGIN_SELECTCHAR_ENTER_GAME,"",this.charList.selectItem));
               if(parent)
               {
                  parent.removeChild(this);
               }
         }
      }
      
      private function setImage(param1:Object) : void
      {
         var str:String = null;
         var party:String = null;
         var loadUrl2:String = null;
         var value:Object = param1;
         switch(value.party)
         {
            case LanResManager.getLanCommonTextWords("少林派"):
               party = "shaolin";
               break;
            case LanResManager.getLanCommonTextWords("全真教"):
               party = "quanzhen";
               break;
            case LanResManager.getLanCommonTextWords("古墓派"):
               party = "gumu";
               break;
            case LanResManager.getLanCommonTextWords("桃花岛"):
               party = "taohua";
               break;
            case LanResManager.getLanCommonTextWords("白驼山"):
               party = "baituoshan";
               break;
            case LanResManager.getLanCommonTextWords("明教"):
               party = "mingjiao";
         }
         if(this.xingxiang != null && this.xingxiang.parent != null)
         {
            this.xingxiang.parent.removeChild(this.xingxiang);
         }
         str = GameConfig.fileBaseFolder + "res/ui/xingxiang_" + party + ".png";
         if(typeof LoginUI.objCache[str] == "object")
         {
            this.xingxiang = LoginUI.objCache[str];
         }
         else
         {
            this.xingxiang = FLoader.startLoad(str,550,550);
            LoginUI.objCache[str] = this.xingxiang;
         }
         this.xingxiang.x = 244;
         this.xingxiang.y = -10;
         addChildAt(this.xingxiang,0);
         if(this.wenzi != null && this.wenzi.parent != null)
         {
            this.wenzi.parent.removeChild(this.wenzi);
         }
         str = GameConfig.fileBaseFolder + "res/ui/wenzi_" + party + ".png";
         if(typeof LoginUI.objCache[str] == "object")
         {
            this.wenzi = LoginUI.objCache[str];
         }
         else
         {
            this.wenzi = FLoader.startLoad(str,89,32);
            LoginUI.objCache[str] = this.wenzi;
         }
         this.wenzi.x = 244 + 260 + 110;
         this.wenzi.y = 0 + 340;
         addChild(this.wenzi);
         if(party == "gumu" || party == "taohua")
         {
            this.wenzi.x = 244 + 260 - 50;
            this.wenzi.y = 100;
         }
         else if(party == "mingjiao")
         {
            this.wenzi.x = 244 + 260 - 110;
            this.wenzi.y = 100;
         }
         else if(party == "baituoshan")
         {
            this.wenzi.x = 244 + 260 + 140 - 240;
            this.wenzi.y = 100 + 70;
         }
         else
         {
            this.wenzi.x = 244 + 260 + 110;
            this.wenzi.y = 0 + 340;
         }
         if(Boolean(this.mc) && this.mc.parent != null)
         {
            this.mc.stop();
            this.mc.parent.removeChild(this.mc);
         }
         this.loadUrl = GameConfig.fileBaseFolder + "res/data/mc/denglu2/" + party + ".swf";
         if(typeof LoginUI.objCache[this.loadUrl] == "object")
         {
            this.mc = LoginUI.objCache[this.loadUrl];
            this.mc.x = 244;
            this.mc.y = -10;
            this.mc.play();
            addChild(this.mc);
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl)
               {
                  return;
               }
               if(Boolean(mc) && mc.parent != null)
               {
                  mc.stop();
                  mc.parent.removeChild(mc);
               }
               mc = _loc2_.content as MovieClip;
               if(mc)
               {
                  LoginUI.objCache[loadUrl] = mc;
                  mc.x = 244;
                  mc.y = -10;
                  addChild(mc);
               }
            },null,false,this.loadUrl);
         }
         str = GameConfig.fileBaseFolder + "res/ui/login/stand.png";
         if(typeof LoginUI.objCache[str] == "object")
         {
            this.avatarStand = LoginUI.objCache[str];
            addChild(this.avatarStand);
         }
         else
         {
            this.avatarStand = FLoader.startLoad(str,550,550);
            LoginUI.objCache[str] = this.avatarStand;
            addChild(this.avatarStand);
         }
         this.avatarStand.x = 244 + 10;
         this.avatarStand.y = -20;
         setChildIndex(this.avatarStand,0);
         if(Boolean(this.mcAvatarStand) && this.mcAvatarStand.parent != null)
         {
            this.mcAvatarStand.stop();
            this.mcAvatarStand.parent.removeChild(this.mcAvatarStand);
         }
         loadUrl2 = GameConfig.fileBaseFolder + "res/data/mc/login/stand.swf";
         if(typeof LoginUI.objCache[loadUrl2] == "object")
         {
            this.mcAvatarStand = LoginUI.objCache[loadUrl2];
            this.mcAvatarStand.x = 354;
            this.mcAvatarStand.y = 255;
            this.mcAvatarStand.play();
            addChild(this.mcAvatarStand);
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl2)
               {
                  return;
               }
               mcAvatarStand = _loc2_.content as MovieClip;
               if(mcAvatarStand)
               {
                  LoginUI.objCache[loadUrl2] = mcAvatarStand;
                  mcAvatarStand.x = 354;
                  mcAvatarStand.y = 255;
                  addChildAt(mcAvatarStand,1);
               }
            },null,false,loadUrl2);
         }
         if(this.mcAvatarStand)
         {
            setChildIndex(this.mcAvatarStand,1);
         }
         setChildIndex(this.deleteBtn,numChildren - 1);
         setChildIndex(this.recoverBtn,numChildren - 1);
         setChildIndex(this.loginBtn,numChildren - 1);
      }
      
      private function onListClick(param1:MouseEvent = null) : void
      {
         var _loc2_:Array = null;
         var _loc3_:SelectCharListRender = null;
         if(this.charList.selectItem.id == "")
         {
            parent.parent.dispatchEvent(new BaseEvent(LoginUI.UI_LOGIN_SELECTCHAR_SHOW_CREATECHARPANEL));
         }
         else
         {
            if(getTimer() - this.time < 500 && Math.abs(this.p.x - mouseX) < 5 && Math.abs(this.p.y - mouseY) < 5)
            {
               parent.parent.dispatchEvent(new BaseEvent(LoginUI.UI_LOGIN_SELECTCHAR_ENTER_GAME,"",this.charList.selectItem));
               if(parent)
               {
                  parent.removeChild(this);
               }
               return;
            }
            this.time = getTimer();
            this.p.x = mouseX;
            this.p.y = mouseY;
            this.setImage(this.charList.selectItem);
            _loc2_ = this.charList.getAllRenders();
            if(param1 == null)
            {
               if(this.charList.selectItem.id != "" && _loc2_.length > 0)
               {
                  _loc2_[0].showMC();
               }
            }
            else
            {
               for each(_loc3_ in _loc2_)
               {
                  if(param1.target != _loc3_ && !Fun.isParentChild(_loc3_,param1.target as DisplayObject))
                  {
                     _loc3_.showMC(false);
                  }
                  else
                  {
                     _loc3_.showMC();
                  }
               }
            }
         }
      }
      
      public function set dataProvider(param1:XML) : void
      {
         var _loc2_:int = 0;
         var _loc4_:XML = null;
         this.charList.dataProvider = param1;
         this.charList.setSelectItemByIndex(0);
         var _loc3_:int = param1.children().length();
         this.idArr = [];
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = param1.children()[_loc2_];
            this.idArr.push(_loc4_.@id.toString());
            _loc2_++;
         }
         this.onListClick();
      }
      
      private function removeMc() : void
      {
         if(Boolean(this.mc) && this.mc.parent != null)
         {
            this.mc.stop();
            this.mc.parent.removeChild(this.mc);
         }
         if(Boolean(this.slAvatar) && this.slAvatar.parent != null)
         {
            this.slAvatar.parent.removeChild(this.slAvatar);
         }
         if(Boolean(this.wdAvatar) && this.wdAvatar.parent != null)
         {
            this.wdAvatar.parent.removeChild(this.wdAvatar);
         }
         if(Boolean(this.gmAvatar) && this.gmAvatar.parent != null)
         {
            this.gmAvatar.parent.removeChild(this.gmAvatar);
         }
         if(Boolean(this.emAvatar) && this.emAvatar.parent != null)
         {
            this.emAvatar.parent.removeChild(this.emAvatar);
         }
         if(Boolean(this.wenzi) && this.wenzi.parent != null)
         {
            this.wenzi.parent.removeChild(this.wenzi);
         }
         if(Boolean(this.avatarStand) && this.avatarStand.parent != null)
         {
            this.avatarStand.parent.removeChild(this.avatarStand);
         }
         if(Boolean(this.mcAvatarStand) && this.mcAvatarStand.parent != null)
         {
            this.mcAvatarStand.parent.removeChild(this.mcAvatarStand);
         }
      }
      
      public function set tipContent(param1:String) : void
      {
         this.tip.htmlText = param1;
      }
      
      public function destory() : void
      {
         if(this.mc)
         {
            this.mc.stop();
         }
         if(this.mcAvatarStand)
         {
            this.mcAvatarStand.stop();
         }
      }
   }
}

