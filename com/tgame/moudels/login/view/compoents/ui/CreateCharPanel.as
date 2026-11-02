package com.tgame.moudels.login.view.compoents.ui
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.alert.FAlert;
   import com.fireice.button.FSimpleButton;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.moudels.login.view.compoents.LoginUI;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.text.*;
   import flash.ui.Keyboard;
   import flash.utils.getDefinitionByName;
   
   public class CreateCharPanel extends Sprite
   {
      
      private var partyTip:FTextArea;
      
      private var tipCanvas:FCanvas;
      
      private var boyHeadContainer:Sprite;
      
      private var grilHeadContainer:Sprite;
      
      public var nameInput:FTextInput;
      
      private var createBtn:FSimpleButton;
      
      private var obj:Object;
      
      public var returnBtn:FSimpleButton;
      
      private var randomBtn:SimpleButton;
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var Scroll:FVScorllBar;
      
      private var xingxiang:DisplayObject;
      
      private var touxiangId_sex:int;
      
      private var touxiangId:int;
      
      private var touxiangSpr:Sprite;
      
      private var liebiao:String = "";
      
      private var mc:MovieClip;
      
      private var loadUrl:String;
      
      private var wenzi:DisplayObject;
      
      private var headHighlight:Sprite;
      
      private var offSetY:int = 30;
      
      private var head_border:int = 3;
      
      private var head_gap:int = 2;
      
      private var avatarStand:DisplayObject;
      
      private var mcAvatarStand:MovieClip;
      
      public var imgSeal:Bitmap;
      
      public function CreateCharPanel()
      {
         this.obj = {};
         super();
         this.obj = {
            "party":LanResManager.getLanCommonTextWords("少林派"),
            "head":"ui.login.head.head_1_0"
         };
         addEventListener(Event.ADDED_TO_STAGE,function(param1:Event):void
         {
            parent.parent.dispatchEvent(new BaseEvent(LoginUI.UI_LOGIN_CREATECHAR_NAME_RANDOM,"",1));
         });
         with(graphics)
         {
            beginFill(0,0);
            drawRect(0,0,1000,580);
            endFill();
         }
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "tipsCanvasBg";
         this.partyTip = new FTextArea();
         this.tipCanvas.addChild(this.partyTip);
         with(this.partyTip)
         {
            x = 10;
            y = 10;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
         }
         this.init();
         this.initHead();
         this.onListClick();
      }
      
      private function init() : void
      {
         var $class:Class;
         var img:Bitmap = null;
         img = StaticValue.getBitmapByClassName("ui.login.chuangjian.xuanzheMenpai");
         addChild(img);
         img.x = 109;
         img.y = 34 - this.offSetY;
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         this.listContainer.y = -this.offSetY;
         with(this.listContainer)
         {
            x = 29;
            y = 99 - offSetY;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,415,240);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.isUseCellRealHeight = true;
         this.giftList.skin = "dengluList_cg";
         this.giftList.itemRenderer = new CreateCharListRender();
         this.giftList.listWidth = 96;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 87;
         this.giftList.y = 0;
         this.giftList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.imgSeal = StaticValue.getBitmapByClassName("ui.login.seal");
         addChild(this.imgSeal);
         this.imgSeal.x = 900;
         this.imgSeal.y = 430;
         img.visible = false;
         img = StaticValue.getBitmapByClassName("ui.login.chuangjian.shuru.bg");
         addChild(img);
         img.x = 453 - 80 + 30;
         img.y = 505 - this.offSetY + 12 + 30;
         this.nameInput = new FTextInput();
         addChild(this.nameInput);
         this.nameInput.width = 210;
         this.nameInput.x = 440;
         this.nameInput.y = 530 - this.offSetY + 30;
         this.nameInput.defaultTextFormat = StaticValue.format;
         this.nameInput.filters = StaticValue.filter;
         this.nameInput.textColor = StaticValue.BLUE;
         this.nameInput.setMaxChars(12);
         this.nameInput.addEventListener(Event.CHANGE,this.onChange);
         $class = getDefinitionByName("ui.login.create.button.random") as Class;
         this.randomBtn = new $class() as SimpleButton;
         addChild(this.randomBtn);
         this.randomBtn.x = 603;
         this.randomBtn.y = 520 - this.offSetY + 30;
         this.randomBtn.addEventListener(MouseEvent.CLICK,this.onRandomName);
         this.randomBtn.visible = false;
         this.createBtn = new FSimpleButton();
         this.createBtn.skin = "createCharBtn_cg";
         addChild(this.createBtn);
         this.createBtn.x = 473 + 180;
         this.createBtn.y = 525 - this.offSetY + 30;
         this.createBtn.addEventListener(MouseEvent.CLICK,this.onCreate);
         this.returnBtn = new FSimpleButton();
         this.returnBtn.skin = "createCharrRturnBtn_cg";
         addChild(this.returnBtn);
         this.returnBtn.x = 873;
         this.returnBtn.y = 510 - this.offSetY + 30;
         this.returnBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         this.uiChushihua();
      }
      
      private function uiChushihua() : void
      {
         var _loc3_:Object = null;
         var _loc1_:Array = new Array();
         var _loc2_:int = 1;
         while(_loc2_ < 5)
         {
            _loc3_ = new Object();
            if(_loc2_ == 1)
            {
               _loc3_.party = LanResManager.getLanCommonTextWords("少林派");
               _loc3_.name = "shaolin";
               _loc3_.sex = 1;
            }
            else if(_loc2_ == 2)
            {
               _loc3_.party = LanResManager.getLanCommonTextWords("全真教");
               _loc3_.name = "quanzhen";
               _loc3_.sex = 1;
            }
            else if(_loc2_ == 3)
            {
               _loc3_.party = LanResManager.getLanCommonTextWords("古墓派");
               _loc3_.name = "gumu";
               _loc3_.sex = 3;
            }
            else if(_loc2_ == 4)
            {
               _loc3_.party = LanResManager.getLanCommonTextWords("桃花岛");
               _loc3_.name = "taohua";
               _loc3_.sex = 3;
            }
            _loc1_.push(_loc3_);
            _loc2_++;
         }
         this.giftList.dataProvider = _loc1_;
         this.giftList.setSelectItemByIndex(0);
      }
      
      private function onListClick(param1:MouseEvent = null) : void
      {
         var party:String;
         var arr:Array;
         var str:String = null;
         var loadUrl2:String = null;
         var item:CreateCharListRender = null;
         var e:MouseEvent = param1;
         if(this.liebiao == this.giftList.selectItem.name)
         {
            return;
         }
         this.liebiao = this.giftList.selectItem.name;
         this.obj.party = this.giftList.selectItem.party;
         this.touxiangId_sex = this.giftList.selectItem.sex;
         this.touxiangId = 0;
         this.touxiangFun(this.touxiangId_sex);
         if(this.xingxiang != null && this.xingxiang.parent != null)
         {
            this.xingxiang.parent.removeChild(this.xingxiang);
         }
         party = this.giftList.selectItem.name;
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
         addChild(this.wenzi);
         if(party == "gumu" || party == "taohua")
         {
            this.wenzi.x = 244 + 260 - 50;
            this.wenzi.y = 100;
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
         if(this.avatarStand != null && this.avatarStand.parent != null)
         {
            this.avatarStand.parent.removeChild(this.avatarStand);
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
         arr = this.giftList.getAllRenders();
         if(e == null)
         {
            if(this.giftList.selectItem.id != "" && arr.length > 0)
            {
               arr[0].showMC();
            }
         }
         else
         {
            for each(item in arr)
            {
               if(e.target != item && !Fun.isParentChild(item,e.target as DisplayObject))
               {
                  item.showMC(false);
               }
               else
               {
                  item.showMC();
               }
            }
         }
      }
      
      private function onRandomBtn(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
            case MouseEvent.MOUSE_OUT:
         }
      }
      
      private function initHead() : void
      {
         this.boyHeadContainer = new Sprite();
         addChild(this.boyHeadContainer);
         this.boyHeadContainer.x = 800;
         this.boyHeadContainer.y = 60;
         var _loc1_:Bitmap = StaticValue.getBitmapByClassName("ui.login.chuangjian.xuanzhe.touxiang.bg");
         this.boyHeadContainer.addChild(_loc1_);
         _loc1_.y = 21;
         this.touxiangSpr = new Sprite();
         this.boyHeadContainer.addChild(this.touxiangSpr);
         this.touxiangSpr.x = 36;
         this.touxiangSpr.y = 62;
         this.headHighlight = new Sprite();
         var _loc2_:F9GridBitmap = Tools.get9GridBitmpByName("selectTouxiangKuang_cg");
         this.headHighlight.addChild(_loc2_);
         _loc2_.width = 40;
         _loc2_.height = 40;
         this.boyHeadContainer.addChild(this.headHighlight);
         this.headHighlight.x = this.touxiangSpr.x + this.head_border;
         this.headHighlight.y = this.touxiangSpr.y + this.head_border;
         this.touxiangId = 0;
         this.touxiangId_sex = 1;
         this.touxiangFun(1);
         this.touxiangSpr.addEventListener(MouseEvent.CLICK,this.onHeadClick);
         _loc1_ = StaticValue.getBitmapByClassName("ui.login.chuangjian.xuanze.touxiang.txt");
         this.boyHeadContainer.addChild(_loc1_);
         _loc1_.x = 27;
         _loc1_.y = 14;
      }
      
      private function onHeadClick(param1:MouseEvent) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:int = this.boyHeadContainer.mouseX - this.touxiangSpr.x;
         var _loc3_:int = this.boyHeadContainer.mouseY - this.touxiangSpr.y;
         if(_loc2_ > this.head_border && _loc2_ < this.head_border * 3 + this.head_gap + 40 * 2 && _loc3_ > this.head_border && _loc3_ < this.head_border * 9 + this.head_gap * 4 + 40 * 5)
         {
            _loc4_ = int((_loc2_ - this.head_border) / (40 + this.head_border * 2 + this.head_gap));
            _loc5_ = int((_loc3_ - this.head_border) / (40 + this.head_border * 2 + this.head_gap));
            this.headHighlight.x = this.head_border * (int(_loc4_ % 2) + 1) + (40 + this.head_border + this.head_gap) * int(_loc4_ % 2) + this.touxiangSpr.x - 3;
            this.headHighlight.y = this.head_border * (int(_loc5_ % 5) + 1) + (40 + this.head_border + this.head_gap) * int(_loc5_ % 5) + this.touxiangSpr.y - 2;
            this.touxiangId = _loc5_ + _loc4_ * 5;
            this.obj.head = "ui.login.head.head_" + this.touxiangId_sex + "_" + this.touxiangId;
         }
      }
      
      private function onInput(param1:TextEvent) : void
      {
      }
      
      private function onChange(param1:Event) : void
      {
         this.obj.name = this.nameInput.text;
      }
      
      private function onRandomName(param1:MouseEvent) : void
      {
         parent.parent.dispatchEvent(new BaseEvent(LoginUI.UI_LOGIN_CREATECHAR_NAME_RANDOM,"",this.giftList.selectItem.sex));
      }
      
      private function touxiangFun(param1:int = 0) : void
      {
         var _loc2_:Bitmap = null;
         var _loc3_:int = 0;
         if(param1 != 0)
         {
            this.touxiangId_sex = param1;
         }
         while(this.touxiangSpr.numChildren > 0)
         {
            this.touxiangSpr.removeChildAt(0);
         }
         var _loc4_:int = 0;
         while(_loc4_ < 10)
         {
            _loc3_ = _loc4_;
            _loc2_ = StaticValue.getBitmapByClassName("ui.login.head.head_" + this.touxiangId_sex + "_" + _loc3_ + "_40");
            this.touxiangSpr.addChild(_loc2_);
            _loc2_.y = this.head_border * (int(_loc4_ % 5) + 1) + (40 + this.head_border + this.head_gap) * int(_loc4_ % 5);
            _loc2_.x = this.head_border * (int(_loc4_ / 5) + 1) + (40 + this.head_border + this.head_gap) * int(_loc4_ / 5);
            _loc4_++;
         }
         this.headHighlight.x = this.touxiangSpr.x;
         this.headHighlight.y = this.touxiangSpr.y;
         this.touxiangId = 0;
         this.obj.head = "ui.login.head.head_" + this.touxiangId_sex + "_" + this.touxiangId;
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         this.removeMc();
         parent.parent.dispatchEvent(new BaseEvent(LoginUI.UI_LOGIN_SELECTCHAR_CREATE_CANCEL));
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         switch(param1.keyCode)
         {
            case Keyboard.ENTER:
               this.onCreate();
         }
      }
      
      private function onCreate(param1:MouseEvent = null) : void
      {
         if(this.obj.party == undefined || this.obj.party == "")
         {
            FAlert.show(LanResManager.getLanTextWords(CreateCharPanel,"请选择门派",[StaticValue.RED_HTML]));
            return;
         }
         if(this.obj.head == undefined || this.obj.head == "")
         {
            FAlert.show(LanResManager.getLanTextWords(CreateCharPanel,"请选择头像",[StaticValue.RED_HTML]));
            return;
         }
         if(this.obj.name == undefined || this.obj.name == "")
         {
            FAlert.show(LanResManager.getLanTextWords(CreateCharPanel,"请输入角色名称",[StaticValue.RED_HTML]));
            return;
         }
         if(this.tipCanvas != null && this.tipCanvas.parent != null)
         {
            this.tipCanvas.parent.removeChild(this.tipCanvas);
         }
         this.removeMc();
         parent.parent.dispatchEvent(new BaseEvent(LoginUI.UI_LOGIN_SELECTCHAR_CREATE_CHAR,"",this.obj));
         this.nameInput.text = "";
      }
      
      public function setRandomName(param1:String) : void
      {
      }
      
      private function removeMc() : void
      {
         if(Boolean(this.mc) && this.mc.parent != null)
         {
            this.mc.stop();
            this.mc.parent.removeChild(this.mc);
         }
         if(Boolean(this.xingxiang) && this.xingxiang.parent != null)
         {
            this.xingxiang.parent.removeChild(this.xingxiang);
         }
         if(Boolean(this.avatarStand) && this.avatarStand.parent != null)
         {
            this.avatarStand.parent.removeChild(this.avatarStand);
         }
         if(Boolean(this.wenzi) && this.wenzi.parent != null)
         {
            this.wenzi.parent.removeChild(this.wenzi);
         }
         if(Boolean(this.mcAvatarStand) && this.mcAvatarStand.parent != null)
         {
            this.mcAvatarStand.parent.removeChild(this.mcAvatarStand);
         }
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

