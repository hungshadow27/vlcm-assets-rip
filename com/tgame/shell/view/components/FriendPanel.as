package com.tgame.shell.view.components
{
   import com.fireice.alert.FAlert;
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextInput;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.shell.view.components.friend.AddFriendPanel;
   import com.tgame.shell.view.components.friend.BlackCanvas;
   import com.tgame.shell.view.components.friend.EnemyCanvas;
   import com.tgame.shell.view.components.friend.FriendCanvas;
   import com.tgame.shell.view.components.friend.LargessFlowerPanel;
   import com.tgame.shell.view.components.friend.NPCAttributePanel;
   import com.tgame.shell.view.components.friend.NPCCanvas;
   import com.tgame.shell.view.components.friend.SearchPlayerPanel;
   import com.tgame.shell.view.components.friend.ShiTuCanvas;
   import com.tgame.shell.view.components.friend.SnoopEnemyPanel;
   import com.tgame.shell.view.components.friend.TempCanvas;
   import com.tgame.shell.view.components.shitu.ShifuTuiJianPanel;
   import com.tgame.shell.view.components.shitu.TuDiTuiJianPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import flash.utils.getQualifiedClassName;
   
   public class FriendPanel extends FPanel
   {
      
      public static const TYPE_FRIEND:String = "TYPE_FRIEND";
      
      public static const TYPE_BLACKLIST:String = "TYPE_BLACKLIST";
      
      public static const UI_FRIEND_SHOW:String = "UI_FRIEND_SHOW";
      
      public static const UI_FRIEND_HEADIMG_CLICK:String = "UI_FRIEND_HEADIMG_CLICK";
      
      public static const UI_FRIEND_MOODICO_SET:String = "UI_FRIEND_MOODICO_SET";
      
      public static const UI_FRIEND_MOODTXT_SET:String = "UI_FRIEND_MOODTXT_SET";
      
      public static const UI_FRIEND_MOUSE_OVER_TIP_SHOW:String = "UI_FRIEND_MOUSE_OVER_TIP_SHOW";
      
      public static const UI_FRIEND_FRIEND_MENU_SHOW:String = "UI_FRIEND_FRIEND_MENU_SHOW";
      
      public static const UI_FRIEND_FRIEND_ADDBTN_CLICK:String = "UI_FRIEND_FRIEND_ADDBTN_CLICK";
      
      public static const UI_FRIEND_FRIEND_SEARCHBTN_CLICK:String = "UI_FRIEND_FRIEND_SEARCHBTN_CLICK";
      
      public static const UI_FRIEND_FRIEND_INFOBTN_CLICK:String = "UI_FRIEND_FRIEND_INFOBTN_CLICK";
      
      public static const UI_FRIEND_FRIEND_YANBTN_CLICK:String = "UI_FRIEND_FRIEND_YANBTN_CLICK";
      
      public static const UI_FRIEND_FRIEND_TANBTN_CLICK:String = "UI_FRIEND_FRIEND_TANBTN_CLICK";
      
      public static const UI_FRIEND_BLACK_ADDBTN_CLICK:String = "UI_FRIEND_BLACK_ADDBTN_CLICK";
      
      public static const UI_FRIEND_SEARCH_BNT_CLICK:String = "UI_FRIEND_SEARCH_BNT_CLICK";
      
      public static const UI_FRIEND_BLACK_ADDTOBTN_CLICK:String = "UI_FRIEND_BLACK_ADDTOBTN_CLICK";
      
      public static const UI_FRIEND_ADD_FRIEND_BTN_CLICK:String = "UI_FRIEND_ADD_FRIEND_BTN_CLICK";
      
      public static const UI_FRIEND_SHITU_BAISHI:String = "UI_FRIEND_SHITU_BAISHI";
      
      public static const UI_FRIEND_SHITU_SHOUTU:String = "UI_FRIEND_SHITU_SHOUTU";
      
      public static const UI_FRIEND_SHITU_TUICHU:String = "UI_FRIEND_SHITU_TUICHU";
      
      public static const UI_FRIEND_SHITU_QUZHU:String = "UI_FRIEND_SHITU_QUZHU";
      
      public static const UI_FRIEND_SHITU_LINGQU:String = "UI_FRIEND_SHITU_LINGQU";
      
      public static const UI_FRIEND_SHITU_FAFANG:String = "UI_FRIEND_SHITU_FAFANG";
      
      public static const UI_SHITU_CHENGHAOTXT_SET:String = "UI_SHITU_CHENGHAOTXT_SET";
      
      public static const UI_TUDITUIJIAN_SHOUTU:String = "UI_SHITUTUIJIAN_SHOUTU";
      
      public static const UI_TUDITUIJIAN_CHECK:String = "UI_SHITUTUIJIAN_CHECK";
      
      public static const UI_SHITUTUIJIAN_BAISHI:String = "UI_SHITUTUIJIAN_BAISHI";
      
      public static const UI_SHITUTUIJIAN_CHECK:String = "UI_SHITUTUIJIAN_CHECK";
      
      public static const UI_FRIEND_LOOK_INFOBTN_CLICK:String = "UI_FRIEND_LOOK_INFOBTN_CLICK";
      
      public static const UI_FRIEND_ENEMY_SNOOP_BTN_CLICK:String = "UI_FRIEND_ENEMY_SNOOP_BTN_CLICK";
      
      public static const UI_FRIEND_SELECT_FLOWER_BTN_CLICK:String = "UI_FRIEND_SELECT_FLOWER_BTN_CLICK";
      
      public static const UI_FRIEND_LARGEWW_FLOWER_PANEL_CLICK:String = "UI_FRIEND_LARGEWW_FLOWER_PANEL_CLICK";
      
      public static const UI_FRIEND_LARGESS_OK_BTN_CLICK:String = "UI_FRIEND_LARGESS_OK_BTN_CLICK";
      
      public static const UI_FRIEND_LARGESS_CANCEL_BTN_CLICK:String = "UI_FRIEND_LARGESS_CANCEL_BTN_CLICK";
      
      public static const UI_FRIEND_NPC_RECOVER_HP_BTN_CLICK:String = "UI_FRIEND_NPC_RECOVER_HP_BTN_CLICK";
      
      public static const UI_FRIEND_NPC_BATTLE_BTN_CLICK:String = "UI_FRIEND_NPC_BATTLE_BTN_CLICK";
      
      public static const UI_FRIEND_GET_PREPAGE:String = "UI_FRIEND_GET_PREPAGE";
      
      public static const UI_FRIEND_GET_NEXTPAGE:String = "UI_FRIEND_GET_NEXTPAGE";
      
      public static var faces:Array = ["ui.friend.face::xi","ui.friend.face::shuai","ui.friend.face::ku","ui.friend.face::nu"];
      
      public var tabBar:FTabBar;
      
      private var mood:String;
      
      private var faceContainer:Sprite;
      
      private var selectFaceContainer:Sprite;
      
      private var faceID:int;
      
      private var head1:Bitmap;
      
      private var head2Container:Sprite;
      
      private var heart:Bitmap;
      
      private var moodTxt:FTextInput;
      
      private var friendCanvas:FriendCanvas;
      
      private var shituCanvas:ShiTuCanvas;
      
      private var enemyCanvas:EnemyCanvas;
      
      private var blackCanvas:BlackCanvas;
      
      private var tempCanvas:TempCanvas;
      
      private var npcCanvas:NPCCanvas;
      
      private var friendSearchPanel:SearchPlayerPanel;
      
      private var blackSearchPanel:SearchPlayerPanel;
      
      private var snoopPanel:SnoopEnemyPanel;
      
      private var largessFlowerPanel:LargessFlowerPanel;
      
      private var npcPanel:NPCAttributePanel;
      
      private var moodText:String;
      
      private var xlText:FLabel;
      
      public function FriendPanel()
      {
         var img:Bitmap;
         var v:Vector.<Bitmap>;
         var i:int = 0;
         var ico:Sprite = null;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 246;
         height = 483;
         titleText = LanResManager.getLanCommonTextWords("好友社交");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         img.name = "ui.friend.ui.top";
         addChild(img);
         img.x = 10;
         img.y = 2;
         v = new Vector.<Bitmap>();
         v.push(img);
         this.xlText = new FLabel();
         with(this.xlText)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 40;
            y = 38;
            textColor = StaticValue.BLUE;
            text = "";
         }
         addChild(this.xlText);
         this.faceContainer = new Sprite();
         this.faceContainer.x = 17;
         this.faceContainer.y = 38;
         this.faceContainer.addEventListener(MouseEvent.CLICK,this.onFace);
         this.selectFaceContainer = new Sprite();
         this.selectFaceContainer.addEventListener(MouseEvent.CLICK,this.onSelectFace);
         i = 0;
         while(i < 4)
         {
            ico = StaticValue.getMCByClassName(faces[i]);
            ico.buttonMode = true;
            this.selectFaceContainer.addChild(ico);
            ico.y = 25 * i;
            i++;
         }
         this.head1 = new Bitmap();
         addChild(this.head1);
         this.head1.x = 112;
         this.head1.y = 14;
         this.head2Container = new Sprite();
         addChild(this.head2Container);
         this.head2Container.buttonMode = true;
         this.head2Container.x = 189;
         this.head2Container.y = 14;
         with(this.head2Container.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.head2Container.addEventListener(MouseEvent.CLICK,this.onHeadClick);
         this.heart = new Bitmap();
         addChild(this.heart);
         this.heart.x = 156;
         this.heart.y = 24;
         this.moodTxt = new FTextInput();
         with(this.moodTxt)
         {
            selectable = false;
            x = 17;
            y = 71;
            width = 210;
            height = 20;
            defaultTextFormat = new TextFormat(null,null,StaticValue.WHITE,null,null,null,null,null,"center");
            text = LanResManager.getLanCommonTextWords("今日心情描述文字，点击本处修改");
         }
         this.moodTxt.setMaxChars(30);
         addChild(this.moodTxt);
         this.moodTxt.addEventListener(FocusEvent.FOCUS_IN,this.onFocus);
         this.moodTxt.addEventListener(FocusEvent.FOCUS_OUT,this.onFocus);
         this.friendCanvas = new FriendCanvas();
         this.friendCanvas.$parent = this;
         this.friendCanvas.x = 10;
         this.friendCanvas.y = 120;
         this.friendCanvas.visible = false;
         addChild(this.friendCanvas);
         v.push(this.friendCanvas.bgImg);
         this.enemyCanvas = new EnemyCanvas();
         this.enemyCanvas.$parent = this;
         this.enemyCanvas.x = 10;
         this.enemyCanvas.y = 120;
         this.enemyCanvas.visible = false;
         addChild(this.enemyCanvas);
         v.push(this.enemyCanvas.bgImg);
         this.blackCanvas = new BlackCanvas();
         this.blackCanvas.$parent = this;
         this.blackCanvas.x = 10;
         this.blackCanvas.y = 120;
         this.blackCanvas.visible = false;
         addChild(this.blackCanvas);
         v.push(this.blackCanvas.bgImg);
         this.tempCanvas = new TempCanvas();
         this.tempCanvas.$parent = this;
         this.tempCanvas.x = 10;
         this.tempCanvas.y = 120;
         addChild(this.tempCanvas);
         v.push(this.tempCanvas.bgImg);
         this.npcCanvas = new NPCCanvas();
         this.npcCanvas.$parent = this;
         this.npcCanvas.x = 10;
         this.npcCanvas.y = 120;
         this.npcCanvas.visible = false;
         addChild(this.npcCanvas);
         v.push(this.npcCanvas.bgImg);
         this.shituCanvas = new ShiTuCanvas();
         this.shituCanvas.$parent = this;
         this.shituCanvas.x = 10;
         this.shituCanvas.y = 120;
         this.shituCanvas.visible = false;
         addChild(this.shituCanvas);
         this.DynamicManageImages = v;
         this.tabBar = new FTabBar();
         addChildAt(this.tabBar,0);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("好友"),this.onTabBarClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("师徒"),this.onTabBarClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("仇人"),this.onTabBarClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("黑名单"),this.onTabBarClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("最近"),this.onTabBarClick);
         this.tabBar.x = 10;
         this.tabBar.y = 100;
      }
      
      private function onTabBarClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("好友"):
               dispatchEvent(new BaseEvent(UI_FRIEND_SHOW,"",1));
               break;
            case LanResManager.getLanCommonTextWords("仇人"):
               dispatchEvent(new BaseEvent(UI_FRIEND_SHOW,"",2));
               break;
            case LanResManager.getLanCommonTextWords("黑名单"):
               dispatchEvent(new BaseEvent(UI_FRIEND_SHOW,"",3));
               break;
            case LanResManager.getLanCommonTextWords("最近"):
               dispatchEvent(new BaseEvent(UI_FRIEND_SHOW,"",4));
               break;
            case LanResManager.getLanCommonTextWords("NPC"):
               dispatchEvent(new BaseEvent(UI_FRIEND_SHOW,"",5));
               break;
            case LanResManager.getLanCommonTextWords("师徒"):
               dispatchEvent(new BaseEvent(UI_FRIEND_SHOW,"",6));
         }
      }
      
      private function onFace(param1:MouseEvent) : void
      {
         this.faceID = int(param1.target.name);
         addChild(this.selectFaceContainer);
         this.selectFaceContainer.y = 60;
         this.selectFaceContainer.x = 17 + this.faceID * 22;
      }
      
      private function onSelectFace(param1:MouseEvent) : void
      {
         var _loc2_:int = faces.indexOf(getQualifiedClassName(param1.target));
         this.mood = this.mood.slice(0,this.faceID) + _loc2_ + this.mood.slice(this.faceID + 1);
         dispatchEvent(new BaseEvent(UI_FRIEND_MOODICO_SET,"",this.mood));
         this.selectFaceContainer.parent.removeChild(this.selectFaceContainer);
      }
      
      private function onHeadClick(param1:MouseEvent) : void
      {
         if(this.head2Container.numChildren == 0)
         {
            FAlert.show(LanResManager.getLanCommonTextWords("您目前还没有结婚"));
         }
         else
         {
            dispatchEvent(new BaseEvent(UI_FRIEND_HEADIMG_CLICK));
         }
      }
      
      private function onFocus(param1:FocusEvent) : void
      {
         switch(param1.type)
         {
            case FocusEvent.FOCUS_IN:
               this.moodTxt.selectable = true;
               this.moodTxt.text = "";
               break;
            case FocusEvent.FOCUS_OUT:
               this.moodTxt.selectable = false;
               if(this.moodTxt.text == "")
               {
                  if(this.moodText == "")
                  {
                     this.moodTxt.text = LanResManager.getLanCommonTextWords("今日心情描述文字，点击本处修改");
                  }
                  else
                  {
                     this.moodTxt.text = this.moodText;
                  }
               }
               else
               {
                  dispatchEvent(new BaseEvent(UI_FRIEND_MOODTXT_SET,"",this.moodTxt.text));
               }
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setHeadImg(param1:String, param2:String = "", param3:int = 0) : void
      {
         var _loc4_:Bitmap = null;
         var _loc5_:FLabel = null;
         this.head1.bitmapData = StaticValue.getBitmapByClassName(param1).bitmapData;
         this.head1.width = this.head1.height = 40;
         while(this.head2Container.numChildren > 0)
         {
            this.head2Container.removeChildAt(0);
         }
         if(param2 == "")
         {
            this.heart.bitmapData = StaticValue.getBitmapByClassName("ui.friend.ico.heart.dark").bitmapData;
         }
         else
         {
            this.heart.bitmapData = StaticValue.getBitmapByClassName("ui.friend.ico.heart.light").bitmapData;
            _loc4_ = StaticValue.getBitmapByClassName(param2);
            if(param3 == 0)
            {
               _loc4_.visible = false;
               _loc5_ = new FLabel();
               _loc5_.textColor = StaticValue.YELLOW;
               _loc5_.text = LanResManager.getLanCommonTextWords("不在线");
               this.head2Container.addChild(_loc5_);
            }
            else
            {
               _loc4_.visible = true;
               _loc4_.width = _loc4_.height = 40;
               this.head2Container.addChild(_loc4_);
            }
         }
      }
      
      public function setMood(param1:String) : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:int = 0;
         this.mood = param1;
         while(this.faceContainer.numChildren > 0)
         {
            this.faceContainer.removeChildAt(0);
         }
         if(param1 == "")
         {
            return;
         }
         var _loc4_:int = 4;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc2_ = StaticValue.getMCByClassName(faces[int(param1.charAt(_loc3_))]);
            _loc2_.name = _loc3_.toString();
            _loc2_.buttonMode = true;
            this.faceContainer.addChild(_loc2_);
            _loc2_.x = 22 * _loc3_;
            _loc3_++;
         }
      }
      
      public function setMoodText(param1:String) : void
      {
         if(param1 == "")
         {
            this.moodTxt.text = LanResManager.getLanCommonTextWords("今日心情描述文字，点击本处修改");
         }
         else
         {
            this.moodTxt.text = param1;
         }
         this.moodText = param1;
      }
      
      public function showMouseMoveTip(param1:int, param2:String = "", param3:String = "") : void
      {
         if(this.friendCanvas.parent)
         {
            this.friendCanvas.showTip(param1,param2,param3);
         }
         if(this.enemyCanvas.parent)
         {
            this.enemyCanvas.showTip(param1,param2,param3);
         }
         if(this.blackCanvas.parent)
         {
            this.blackCanvas.showTip(param1,param2,param3);
         }
         if(this.tempCanvas.parent)
         {
            this.tempCanvas.showTip(param1,param2,param3);
         }
      }
      
      public function showLargessFlwoerPanel(param1:int, param2:String, param3:String) : void
      {
         if(this.largessFlowerPanel == null)
         {
            this.largessFlowerPanel = new LargessFlowerPanel();
            UIEventsRegisterManager.registerUI(this.largessFlowerPanel,LargessFlowerPanel);
            this.largessFlowerPanel.$parent = this;
         }
         this.largessFlowerPanel.visible = true;
         GameInstance.uiInstance.uiContainer.addChild(this.largessFlowerPanel);
         this.largessFlowerPanel.setPlayer(param1,param2,param3);
         var _loc4_:Point = this.globalToLocal(new Point(Tools.currentStage.stageWidth / 2,Tools.currentStage.stageHeight / 2));
         this.largessFlowerPanel.x = _loc4_.x - this.largessFlowerPanel.width / 2;
         this.largessFlowerPanel.y = _loc4_.y - this.largessFlowerPanel.height / 2;
      }
      
      public function setFlowers(param1:Array) : void
      {
         if(this.largessFlowerPanel == null)
         {
            return;
         }
         this.largessFlowerPanel.setFlower(param1);
      }
      
      public function showAddFriendSearchPlayerPanel() : void
      {
         if(this.friendSearchPanel == null)
         {
            this.friendSearchPanel = new SearchPlayerPanel();
            this.friendSearchPanel.$parent = this;
            this.friendSearchPanel.type = FriendPanel.TYPE_FRIEND;
         }
         addChild(this.friendSearchPanel);
         this.friendSearchPanel.visible = true;
         var _loc1_:Point = this.globalToLocal(new Point(Tools.currentStage.stageWidth / 2,Tools.currentStage.stageHeight / 2));
         this.friendSearchPanel.x = _loc1_.x - this.friendSearchPanel.width / 2;
         this.friendSearchPanel.y = _loc1_.y - this.friendSearchPanel.height / 2;
      }
      
      public function setAddFriendSearchPanelList(param1:XML, param2:int) : void
      {
         this.friendSearchPanel.setList(param1,param2);
      }
      
      public function showFriend(param1:XML = null) : void
      {
         if(param1)
         {
            this.friendCanvas.dataProvider = param1;
         }
         this.friendCanvas.visible = true;
         this.enemyCanvas.visible = false;
         this.blackCanvas.visible = false;
         this.tempCanvas.visible = false;
         this.npcCanvas.visible = false;
         this.shituCanvas.visible = false;
      }
      
      public function showAddFriendPanel(param1:int, param2:String, param3:String, param4:String, param5:String, param6:String, param7:Boolean = false) : void
      {
         var _loc8_:AddFriendPanel = new AddFriendPanel();
         _loc8_.$parent = this;
         GameInstance.uiInstance.uiContainer.addChild(_loc8_);
         _loc8_.setPlayer(param1,param2,param3,param4,param5,param6,param7);
         POPWindowManager.showWindow(_loc8_);
      }
      
      public function showShiFuTuiJianPanel(param1:XML) : void
      {
         var _loc2_:ShifuTuiJianPanel = new ShifuTuiJianPanel();
         _loc2_.$parent = this;
         _loc2_.dataProvider = param1;
         GameInstance.uiInstance.uiContainer.addChild(_loc2_);
         _loc2_.x = (GameConfig.sceneWidth - _loc2_.width) / 2;
         _loc2_.y = (GameConfig.sceneHeight - _loc2_.height) / 2;
      }
      
      public function showTuDiTuiJianPanel(param1:XML, param2:int, param3:int) : void
      {
         var _loc4_:TuDiTuiJianPanel = new TuDiTuiJianPanel();
         _loc4_.$parent = this;
         _loc4_.setTudiNum(param2,param3);
         _loc4_.dataProvider = param1;
         GameInstance.uiInstance.uiContainer.addChild(_loc4_);
         _loc4_.x = (GameConfig.sceneWidth - _loc4_.width) / 2;
         _loc4_.y = (GameConfig.sceneHeight - _loc4_.height) / 2;
      }
      
      public function showShiTu(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("师徒"));
         }
         this.friendCanvas.visible = false;
         this.enemyCanvas.visible = false;
         this.blackCanvas.visible = false;
         this.tempCanvas.visible = false;
         this.npcCanvas.visible = false;
         this.shituCanvas.visible = true;
      }
      
      public function setShituInfo(param1:int, param2:XML = null) : void
      {
         this.shituCanvas.setShituInfo(param1);
         if(param2)
         {
            this.shituCanvas.dataProvider = param2;
         }
      }
      
      public function showEnemy(param1:XML = null) : void
      {
         if(param1)
         {
            this.enemyCanvas.dataProvider = param1;
         }
         this.friendCanvas.visible = false;
         this.enemyCanvas.visible = true;
         this.blackCanvas.visible = false;
         this.tempCanvas.visible = false;
         this.npcCanvas.visible = false;
         this.shituCanvas.visible = false;
      }
      
      public function showSnoopEnemyPanel(param1:int, param2:String, param3:String) : void
      {
         if(this.snoopPanel == null)
         {
            this.snoopPanel = new SnoopEnemyPanel();
            this.snoopPanel.$parent = this;
         }
         this.snoopPanel.reset();
         addChild(this.snoopPanel);
         this.snoopPanel.visible = true;
         this.snoopPanel.setEnemy(param1,param2,param3);
      }
      
      public function setSnoopResult(param1:int, param2:String, param3:String, param4:String, param5:String = "") : void
      {
         this.snoopPanel.setResult(param1,param2,param3,param5,param4);
      }
      
      public function showBlack(param1:XML = null) : void
      {
         if(param1)
         {
            this.blackCanvas.dataProvider = param1;
         }
         this.friendCanvas.visible = false;
         this.enemyCanvas.visible = false;
         this.blackCanvas.visible = true;
         this.tempCanvas.visible = false;
         this.npcCanvas.visible = false;
         this.shituCanvas.visible = false;
      }
      
      public function showBlackSearchPlayerPanel() : void
      {
         if(this.blackSearchPanel == null)
         {
            this.blackSearchPanel = new SearchPlayerPanel();
            this.blackSearchPanel.$parent = this;
            this.blackSearchPanel.type = FriendPanel.TYPE_BLACKLIST;
         }
         addChild(this.blackSearchPanel);
         this.blackSearchPanel.visible = true;
         var _loc1_:Point = this.globalToLocal(new Point(Tools.currentStage.stageWidth / 2,Tools.currentStage.stageHeight / 2));
         this.blackSearchPanel.x = _loc1_.x - this.blackSearchPanel.width / 2;
         this.blackSearchPanel.y = _loc1_.y - this.blackSearchPanel.height / 2;
      }
      
      public function setBlaskSearchPanelList(param1:XML, param2:int) : void
      {
         this.blackSearchPanel.setList(param1,param2);
      }
      
      public function showTemp(param1:XML = null) : void
      {
         if(param1)
         {
            this.tempCanvas.dataProvider = param1;
         }
         this.friendCanvas.visible = false;
         this.enemyCanvas.visible = false;
         this.blackCanvas.visible = false;
         this.tempCanvas.visible = true;
         this.npcCanvas.visible = false;
         this.shituCanvas.visible = false;
      }
      
      public function showNPC(param1:XML = null) : void
      {
         if(param1)
         {
            this.npcCanvas.dataProvider = param1;
         }
         this.friendCanvas.visible = false;
         this.enemyCanvas.visible = false;
         this.blackCanvas.visible = false;
         this.tempCanvas.visible = false;
         this.npcCanvas.visible = true;
      }
      
      public function showNPCAttributePanel(param1:int, param2:BitmapData, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Array, param13:String, param14:String) : void
      {
         if(this.npcPanel == null)
         {
            this.npcPanel = new NPCAttributePanel();
            this.npcPanel.$parent = this;
         }
         this.npcPanel.visible = true;
         this.npcPanel.setNPC(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14);
         addChild(this.npcPanel);
      }
      
      public function setNPCAttribute(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int) : void
      {
         this.npcPanel.setAttribute(param1,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function setNPCState(param1:int, param2:String) : void
      {
         this.npcPanel.setState(param1,param2);
      }
      
      public function setXlNum(param1:int) : void
      {
         this.xlText.text = String(param1);
      }
   }
}

