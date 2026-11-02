package com.tgame.shell.view.components.mainui.chat
{
   import com.fireice.button.FButton;
   import com.fireice.button.FSimpleButton;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.tabBar.FTabBar;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.RichTextArea;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.RslLoaderManager;
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Loader;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.net.URLRequest;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import gs.TweenLite;
   
   public class Chat extends Sprite
   {
      
      public static const CHANNEL_ZONGHE:int = 0;
      
      public static const CHANNEL_PUTONG:int = 1;
      
      public static const CHANNEL_SILIAO:int = 2;
      
      public static const CHANNEL_DUIWU:int = 3;
      
      public static const CHANNEL_BANGPAI:int = 4;
      
      public static const CHANNEL_SHIJIE:int = 5;
      
      public static const CHANNEL_LABA:int = 6;
      
      public static const CHANNEL_FLOWER:int = 7;
      
      public static const MAX_TALK:Number = 30;
      
      public static const ICO_SIZE:Number = 30;
      
      public static const GIRD_SIZE:int = 43;
      
      public static const ICO_CONFIG_XML:XML = <root>
                     <icon iconUrl='res/ui/face28/1.jpg' iconType="jpg" iconStr="[#11]" descripe="微笑"/>
                     <icon iconUrl='res/ui/face28/2.jpg' iconType="jpg" iconStr="[#12]" descripe="害羞"/>
                     <icon iconUrl='res/ui/face28/3.jpg' iconType="jpg" iconStr="[#13]" descripe="得意"/>
                     <icon iconUrl='res/ui/face28/4.jpg' iconType="jpg" iconStr="[#14]" descripe="疑问"/>
                     <icon iconUrl='res/ui/face28/5.jpg' iconType="jpg" iconStr="[#15]" descripe="晕"/>
                     <icon iconUrl='res/ui/face28/6.jpg' iconType="jpg" iconStr="[#16]" descripe="抓狂"/>
                     <icon iconUrl='res/ui/face28/7.jpg' iconType="jpg" iconStr="[#17]" descripe="流汗"/>
                     <icon iconUrl='res/ui/face28/8.jpg' iconType="jpg" iconStr="[#18]" descripe="发呆"/>
                     <icon iconUrl='res/ui/face28/9.jpg' iconType="jpg" iconStr="[#19]" descripe="笑话"/>
                     <icon iconUrl='res/ui/face28/10.jpg' iconType="jpg" iconStr="[#20]" descripe="倒霉"/>
			

                     <icon iconUrl='res/ui/face28/11.jpg' iconType="jpg" iconStr="[#21]" descripe="亲亲"/>
                     <icon iconUrl='res/ui/face28/12.jpg' iconType="jpg" iconStr="[#22]" descripe="好色"/>
                     <icon iconUrl='res/ui/face28/13.jpg' iconType="jpg" iconStr="[#23]" descripe="发怒"/>
                     <icon iconUrl='res/ui/face28/14.jpg' iconType="jpg" iconStr="[#24]" descripe="惊讶"/>
                     <icon iconUrl='res/ui/face28/15.jpg' iconType="jpg" iconStr="[#25]" descripe="逗笑"/>
                     <icon iconUrl='res/ui/face28/16.jpg' iconType="jpg" iconStr="[#26]" descripe="很酷"/>
                     <icon iconUrl='res/ui/face28/17.jpg' iconType="jpg" iconStr="[#27]" descripe="闭嘴"/>
                     <icon iconUrl='res/ui/face28/18.jpg' iconType="jpg" iconStr="[#28]" descripe="睡觉"/>
                     <icon iconUrl='res/ui/face28/19.jpg' iconType="jpg" iconStr="[#29]" descripe="吐"/>
                     <icon iconUrl='res/ui/face28/20.jpg' iconType="jpg" iconStr="[#30]" descripe="撇嘴"/>

                     <icon iconUrl='res/ui/face28/21.jpg' iconType="jpg" iconStr="[#31]" descripe="哭"/>
                     <icon iconUrl='res/ui/face28/22.jpg' iconType="jpg" iconStr="[#32]" descripe="玫瑰花"/>
                     <icon iconUrl='res/ui/face28/23.jpg' iconType="jpg" iconStr="[#33]" descripe="爱心"/>
                     <icon iconUrl='res/ui/face28/24.jpg' iconType="jpg" iconStr="[#34]" descripe="心碎"/>
                     <icon iconUrl='res/ui/face28/25.jpg' iconType="jpg" iconStr="[#36]" descripe="便便"/>
                     <icon iconUrl='res/ui/face28/26.jpg' iconType="jpg" iconStr="[#37]" descripe="ok"/>
                     <icon iconUrl='res/ui/face28/27.jpg' iconType="jpg" iconStr="[#38]" descripe="强"/>
                     <icon iconUrl='res/ui/face28/28.jpg' iconType="jpg" iconStr="[#39]" descripe="爱你"/>
			
			

				</root>;
      
      private var descripeDict:Dictionary;
      
      private var _faceBox:Sprite;
      
      private var _parent:DisplayObject;
      
      private var _smileysContainer:Sprite;
      
      private var tabBar:FTabBar;
      
      private var changeSizeBtn:FSimpleButton;
      
      private var bugleChannel:RichTextArea;
      
      private var flowerBg:Sprite;
      
      private var flowerChannel:RichTextArea;
      
      private var allChannel:ChatShow;
      
      public var input:RichTextArea;
      
      private var smileyContainer:Sprite;
      
      private var faceBtn:FSimpleButton;
      
      private var sendBtn:FSimpleButton;
      
      private var channelBtn:SmallButton;
      
      private var defaultBtn:SmallButton;
      
      private var privateBtn:SmallButton;
      
      private var teamBtn:SmallButton;
      
      private var setupBtn:SmallButton;
      
      private var worldBtn:SmallButton;
      
      private var bugleBtn:SmallButton;
      
      private var btnCanvas:FCanvas;
      
      private var inputBg:F9GridBitmap;
      
      private var tipList:FList;
      
      private var tipCanvas:FCanvas;
      
      private var chatLog:Array;
      
      private var targetLog:Array;
      
      private var isChatLog:Boolean;
      
      private var itemArr:Array;
      
      private var menuCanvas:FCanvas;
      
      private var menuList:FList;
      
      private var linkID:int;
      
      private var linkName:String;
      
      private var isLink:Boolean;
      
      private var isDizi:Boolean = false;
      
      private var tipTxt:FTextArea;
      
      private var txtTipCanvas:FCanvas;
      
      private var url:String;
      
      private var url1:String;
      
      public function Chat()
      {
         var xml:XML = null;
         var tF:TextFormat = null;
         this.descripeDict = new Dictionary();
         this.chatLog = [];
         this.targetLog = [];
         this.itemArr = [];
         super();
         for each(xml in ICO_CONFIG_XML.icon)
         {
            if(xml.@iconType == "jpg" || xml.@iconType == "gif")
            {
               xml.@iconUrl = GameConfig.fileBaseFolder + xml.@iconUrl;
            }
         }
         this.menuCanvas = new FCanvas();
         this.menuCanvas.skin = "backGroud";
         this.menuList = new FList();
         this.menuList.skin = "menuList";
         this.menuCanvas.addChild(this.menuList);
         this.menuList.x = 2;
         this.menuList.y = 2;
         this.menuList.listWidth = 35;
         this.menuList.dataProvider = <list>
															<node label={LanResManager.getLanCommonTextWords("密聊")} id="1"/>
															<node label={LanResManager.getLanCommonTextWords("查看")} id="2"/>
															<node label={LanResManager.getLanCommonTextWords("交友")} id="3"/>
															<node label={LanResManager.getLanCommonTextWords("交易")} id="4"/>
															<node label={LanResManager.getLanCommonTextWords("组队")} id="5"/>
															<node label={LanResManager.getLanCommonTextWords("帮邀")} id="6"/>
															<node label={LanResManager.getLanCommonTextWords("看摊")} id="7"/>
															<node label={LanResManager.getLanCommonTextWords("赠花")} id="8"/>
															<node label={LanResManager.getLanCommonTextWords("求婚")} id="9"/>
															<node label={LanResManager.getLanCommonTextWords("双修")} id="10"/>
														</list>;
         this.menuList.addEventListener(MouseEvent.CLICK,this.onList);
         this.menuCanvas.width = this.menuList.width + 4;
         this.menuCanvas.height = this.menuList.height + 4;
         this.bugleChannel = new RichTextArea(279,40);
         this.bugleChannel.configXML = Chat.ICO_CONFIG_XML;
         this.bugleChannel.autoScrollToBottom = true;
         this.bugleChannel.textField.wordWrap = true;
         this.bugleChannel.textField.multiline = true;
         this.bugleChannel.textField.filters = StaticValue.filter;
         this.bugleChannel.textField.mouseWheelEnabled = false;
         this.bugleChannel.textField.selectable = false;
         tF = new TextFormat();
         tF.size = 12;
         tF.color = 16729344;
         tF.letterSpacing = 0;
         this.bugleChannel.defaultTextFormat = tF;
         this.bugleChannel.y = -175;
         addChild(this.bugleChannel);
         this.bugleChannel.textField.addEventListener(TextEvent.LINK,this.onLink);
         this.bugleChannel.textField.addEventListener(MouseEvent.MOUSE_DOWN,this.onTextMouse);
         this.bugleChannel.textField.addEventListener(MouseEvent.CLICK,this.onTextMouse);
         this.bugleChannel.textField.addEventListener(MouseEvent.MOUSE_MOVE,this.onTextMouse);
         this.flowerBg = new Sprite();
         this.flowerBg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/qingrenjiexianhua/songhualaba.png",331,86) as Sprite;
         this.flowerBg.y = -260;
         addChild(this.flowerBg);
         this.flowerChannel = new RichTextArea(266,60);
         this.flowerChannel.configXML = Chat.ICO_CONFIG_XML;
         this.flowerChannel.autoScrollToBottom = true;
         this.flowerChannel.textField.wordWrap = true;
         this.flowerChannel.textField.multiline = true;
         this.flowerChannel.textField.filters = StaticValue.filter;
         this.flowerChannel.textField.mouseWheelEnabled = false;
         this.flowerChannel.textField.selectable = false;
         tF = new TextFormat();
         tF.size = 12;
         tF.color = 16729344;
         tF.letterSpacing = 0;
         this.flowerChannel.defaultTextFormat = tF;
         this.flowerChannel.x = 20;
         this.flowerChannel.y = -235 - 8;
         addChild(this.flowerChannel);
         this.flowerBg.visible = false;
         this.flowerChannel.textField.addEventListener(TextEvent.LINK,this.onLink);
         this.flowerChannel.textField.addEventListener(MouseEvent.MOUSE_DOWN,this.onTextMouse1);
         this.flowerChannel.textField.addEventListener(MouseEvent.CLICK,this.onTextMouse1);
         this.flowerChannel.textField.addEventListener(MouseEvent.MOUSE_MOVE,this.onTextMouse1);
         this.allChannel = new ChatShow();
         this.allChannel.resize(279,115);
         addChild(this.allChannel);
         this.allChannel.y = -135;
         this.tabBar = new FTabBar();
         this.tabBar.alpha = 1;
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("综合"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("普通"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("私聊"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("队伍"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("帮派"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("世界"),this.onTabClick);
         this.tabBar.addEventListener(MouseEvent.MOUSE_OVER,this.onMouse);
         this.tabBar.addEventListener(MouseEvent.MOUSE_OUT,this.onMouse);
         this.tabBar.x = 13;
         this.tabBar.y = -20;
         addChild(this.tabBar);
         this.allChannel = new ChatShow();
         this.allChannel.resize(this.tabBar.width + 13,115);
         addChild(this.allChannel);
         this.allChannel.y = -135;
         this.inputBg = Tools.get9GridBitmpByName("chatInputBg");
         this.inputBg.width = this.tabBar.width + 13;
         addChild(this.inputBg);
         this.changeSizeBtn = new FSimpleButton();
         this.changeSizeBtn.skin = "hideButton";
         this.changeSizeBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("折叠/展开聊天信息显示栏") + "  </font><font color=\'" + StaticValue.GREEN_HTML + "\'>（R）</font>";
         addChild(this.changeSizeBtn);
         this.changeSizeBtn.x = 2;
         this.changeSizeBtn.y = 3;
         this.changeSizeBtn.addEventListener(MouseEvent.CLICK,this.changeSize);
         this.btnCanvas = new FCanvas();
         this.btnCanvas.skin = "backGroud";
         this.channelBtn = new SmallButton();
         this.channelBtn.label = LanResManager.getLanCommonTextWords("普通");
         this.channelBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击切换发言频道") + "</font>";
         addChild(this.channelBtn);
         this.channelBtn.x = 22;
         this.channelBtn.y = 3;
         this.channelBtn.addEventListener(MouseEvent.CLICK,this.onChanegChannal);
         this.defaultBtn = new SmallButton();
         this.defaultBtn.label = LanResManager.getLanCommonTextWords("普通");
         this.defaultBtn.toolTip = "<font color=\'" + StaticValue.GREEN_HTML + "\'>!" + LanResManager.getLanCommonTextWords("可快速切换") + "</font><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("在您身边的附近玩家可看到该发言") + "</font>";
         this.btnCanvas.addChild(this.defaultBtn);
         this.defaultBtn.x = 2;
         this.defaultBtn.y = 2;
         this.defaultBtn.addEventListener(MouseEvent.CLICK,this.onChanegChannal);
         this.privateBtn = new SmallButton();
         this.privateBtn.label = LanResManager.getLanCommonTextWords("私聊");
         this.privateBtn.toolTip = "<font color=\'" + StaticValue.GREEN_HTML + "\'>/" + LanResManager.getLanCommonTextWords("玩家名 可直接私聊") + "</font><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("只有私聊对象能看到该发言") + "</font>";
         this.btnCanvas.addChild(this.privateBtn);
         this.privateBtn.x = 2;
         this.privateBtn.y = this.defaultBtn.y + this.defaultBtn.height;
         this.privateBtn.addEventListener(MouseEvent.CLICK,this.onChanegChannal);
         this.teamBtn = new SmallButton();
         this.teamBtn.label = LanResManager.getLanCommonTextWords("队伍");
         this.teamBtn.toolTip = "<font color=\'" + StaticValue.GREEN_HTML + "\'>!!" + LanResManager.getLanCommonTextWords("可快速切换") + "</font><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("与您同队伍的玩家可看到该发言") + "</font>";
         this.btnCanvas.addChild(this.teamBtn);
         this.teamBtn.x = 2;
         this.teamBtn.y = this.privateBtn.y + this.privateBtn.height;
         this.teamBtn.addEventListener(MouseEvent.CLICK,this.onChanegChannal);
         this.setupBtn = new SmallButton();
         this.setupBtn.label = LanResManager.getLanCommonTextWords("帮派");
         this.setupBtn.toolTip = "<font color=\'" + StaticValue.GREEN_HTML + "\'>!~" + LanResManager.getLanCommonTextWords("可快速切换") + "</font><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("与您同帮会的玩家可看到该发言") + "</font>";
         this.btnCanvas.addChild(this.setupBtn);
         this.setupBtn.x = 2;
         this.setupBtn.y = this.teamBtn.y + this.teamBtn.height;
         this.setupBtn.addEventListener(MouseEvent.CLICK,this.onChanegChannal);
         this.worldBtn = new SmallButton();
         this.worldBtn.label = LanResManager.getLanCommonTextWords("世界");
         this.worldBtn.toolTip = "<font color=\'" + StaticValue.GREEN_HTML + "\'>!@" + LanResManager.getLanCommonTextWords("可快速切换") + "</font><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("全服玩家均可看到该发言") + "</font>";
         this.btnCanvas.addChild(this.worldBtn);
         this.worldBtn.x = 2;
         this.worldBtn.y = this.setupBtn.y + this.setupBtn.height;
         this.worldBtn.addEventListener(MouseEvent.CLICK,this.onChanegChannal);
         this.bugleBtn = new SmallButton();
         this.bugleBtn.width = this.worldBtn.width;
         this.bugleBtn.label = LanResManager.getLanCommonTextWords("喇叭");
         this.bugleBtn.toolTip = "<font color=\'" + StaticValue.GREEN_HTML + "\'>!#" + LanResManager.getLanCommonTextWords("可快速切换") + "</font><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("全服玩家均可看到该发言") + "</font>";
         this.btnCanvas.addChild(this.bugleBtn);
         this.bugleBtn.x = 2;
         this.bugleBtn.y = this.worldBtn.y + this.worldBtn.height;
         this.bugleBtn.addEventListener(MouseEvent.CLICK,this.onChanegChannal);
         this.bugleBtn.width = this.channelBtn.width = this.defaultBtn.width = this.privateBtn.width = this.teamBtn.width = this.setupBtn.width = this.worldBtn.width;
         this.btnCanvas.height = this.bugleBtn.height * 6 + 4;
         this.btnCanvas.width = this.bugleBtn.width + 4;
         this.btnCanvas.x = 22;
         this.btnCanvas.y = -this.btnCanvas.height;
         this.sendBtn = new FSimpleButton();
         this.sendBtn.skin = "sendButton";
         this.sendBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("发送聊天信息") + "</font><font color=\'" + StaticValue.GREEN_HTML + "\'>（ENTER）</font>";
         addChild(this.sendBtn);
         this.sendBtn.x = this.tabBar.width + 11 - this.sendBtn.width;
         this.sendBtn.y = 3;
         this.sendBtn.addEventListener(MouseEvent.CLICK,this.onSendBtnClick);
         this.faceBtn = new FSimpleButton();
         this.faceBtn.skin = "biaoqingButton";
         this.faceBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("添加表情") + "</font>";
         addChild(this.faceBtn);
         this.faceBtn.x = this.sendBtn.x - this.faceBtn.width - 2;
         this.faceBtn.y = 3;
         this.faceBtn.addEventListener(MouseEvent.CLICK,this.onFaceBtnClick);
         this._smileysContainer = new Sprite();
         addChild(this._smileysContainer);
         this._smileysContainer.x = 244;
         this._smileysContainer.y = -100;
         this.input = new RichTextArea(this.faceBtn.x - 22 - this.defaultBtn.width,18);
         this.input.configXML = Chat.ICO_CONFIG_XML;
         this.input.autoScrollToBottom = true;
         this.input.icoSize = 14;
         this.input.textField.type = TextFieldType.INPUT;
         this.input.textField.wordWrap = false;
         this.input.textField.multiline = false;
         this.input.textField.filters = StaticValue.filter;
         this.input.textField.mouseWheelEnabled = false;
         this.input.textField.maxChars = 90;
         tF = new TextFormat();
         tF.size = 12;
         tF.color = 16777215;
         tF.letterSpacing = 0;
         this.input.defaultTextFormat = tF;
         this.input.x = this.defaultBtn.width + 22;
         this.input.y = 2;
         this.input.textField.addEventListener(Event.CHANGE,this.onChange);
         addChild(this.input);
         this.txtTipCanvas = new FCanvas();
         this.txtTipCanvas.mouseChildren = false;
         this.txtTipCanvas.mouseEnabled = false;
         this.txtTipCanvas.skin = "backGroud";
         this.tipTxt = new FTextArea();
         this.tipTxt.x = 2;
         this.tipTxt.y = 2;
         this.tipTxt.textColor = StaticValue.WHITE;
         this.tipTxt.filters = StaticValue.filter;
         this.tipTxt.autoSize = "left";
         this.txtTipCanvas.addChild(this.tipTxt);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tipList = new FList();
         this.tipList.skin = "menuList_chat";
         this.tipList.itemRenderer = new ChatLogListRender();
         this.tipList.listWidth = 167;
         this.tipCanvas.addChild(this.tipList);
         this.tipList.x = 2;
         this.tipList.y = 2;
         this.tipCanvas.width = 171;
         this.tipCanvas.x = 54;
         this.tipList.addEventListener(MouseEvent.CLICK,this.onSelectLog);
         Tools.currentStage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         with(graphics)
         {
            clear();
            beginFill(0,0.3);
            drawRect(0,24,279,-height + 86);
            endFill();
         }
      }
      
      private function onLink(param1:TextEvent) : void
      {
         var _loc2_:Array = null;
         if(param1.text.search("Ω") != -1)
         {
            _loc2_ = param1.text.split("Ω");
            this.linkID = int(_loc2_[0]);
            this.linkName = _loc2_[1];
            this.isDizi = int(_loc2_[2]) == 1;
            this.showMenu();
         }
      }
      
      private function onTextMouse(param1:MouseEvent) : void
      {
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc2_:int = this.bugleChannel.textField.getCharIndexAtPoint(this.bugleChannel.textField.mouseX,this.bugleChannel.textField.mouseY);
         if(_loc2_ != -1 && _loc2_ < this.bugleChannel.textField.length)
         {
            _loc3_ = this.bugleChannel.textField.getTextFormat(_loc2_,_loc2_ + 1).url;
            switch(param1.type)
            {
               case MouseEvent.CLICK:
               case MouseEvent.MOUSE_DOWN:
                  if(_loc3_.indexOf("event:") == -1)
                  {
                     if(!GameState.isDoubleFlyStatus)
                     {
                        GameInstance.scene.sceneDispatchEvent(param1);
                     }
                  }
                  else
                  {
                     param1.stopPropagation();
                  }
                  break;
               case MouseEvent.MOUSE_MOVE:
                  _loc3_ = _loc3_.replace(/event:/g,"");
                  if(_loc3_ != this.url && _loc3_.indexOf("ξ") != -1)
                  {
                     _loc4_ = _loc3_.split("ξ");
                     this._parent.dispatchEvent(new BaseEvent(MainUI.CHAT_ITEM_LINK_CLICK,"",[int(_loc4_[0]),int(_loc4_[1]),int(_loc4_[2]),Tools.currentStage.mouseX,Tools.currentStage.mouseY]));
                  }
                  else if(_loc3_ != this.url)
                  {
                     this._parent.dispatchEvent(new BaseEvent(MainUI.CHAT_ITEM_LINK_HIDE));
                     if(!GameState.isDoubleFlyStatus)
                     {
                        GameInstance.scene.sceneDispatchEvent(param1);
                     }
                  }
                  this.url = _loc3_;
            }
         }
         else
         {
            this.url = "";
            this._parent.dispatchEvent(new BaseEvent(MainUI.CHAT_ITEM_LINK_HIDE));
            if(!GameState.isDoubleFlyStatus)
            {
               GameInstance.scene.sceneDispatchEvent(param1);
            }
         }
      }
      
      private function onTextMouse1(param1:MouseEvent) : void
      {
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc2_:int = this.flowerChannel.textField.getCharIndexAtPoint(this.flowerChannel.textField.mouseX,this.flowerChannel.textField.mouseY);
         if(_loc2_ != -1 && _loc2_ < this.flowerChannel.textField.length)
         {
            _loc3_ = this.flowerChannel.textField.getTextFormat(_loc2_,_loc2_ + 1).url;
            switch(param1.type)
            {
               case MouseEvent.CLICK:
               case MouseEvent.MOUSE_DOWN:
                  if(_loc3_.indexOf("event:") == -1)
                  {
                     if(!GameState.isDoubleFlyStatus)
                     {
                        GameInstance.scene.sceneDispatchEvent(param1);
                     }
                  }
                  else
                  {
                     param1.stopPropagation();
                  }
                  break;
               case MouseEvent.MOUSE_MOVE:
                  _loc3_ = _loc3_.replace(/event:/g,"");
                  if(_loc3_ != this.url1 && _loc3_.indexOf("ξ") != -1)
                  {
                     _loc4_ = _loc3_.split("ξ");
                     this._parent.dispatchEvent(new BaseEvent(MainUI.CHAT_ITEM_LINK_CLICK,"",[int(_loc4_[0]),int(_loc4_[1]),int(_loc4_[2]),Tools.currentStage.mouseX,Tools.currentStage.mouseY]));
                  }
                  else if(_loc3_ != this.url1)
                  {
                     this._parent.dispatchEvent(new BaseEvent(MainUI.CHAT_ITEM_LINK_HIDE));
                     if(!GameState.isDoubleFlyStatus)
                     {
                        GameInstance.scene.sceneDispatchEvent(param1);
                     }
                  }
                  this.url1 = _loc3_;
            }
         }
         else
         {
            this.url1 = "";
            this._parent.dispatchEvent(new BaseEvent(MainUI.CHAT_ITEM_LINK_HIDE));
            if(!GameState.isDoubleFlyStatus)
            {
               GameInstance.scene.sceneDispatchEvent(param1);
            }
         }
      }
      
      private function onChange(param1:Event) : void
      {
         this.onInput(null);
         if(this.input.textField.text.indexOf("! ") == 0)
         {
            this.channelBtn.label = LanResManager.getLanCommonTextWords("普通");
            this.input.richText = "";
         }
         if(this.input.textField.text.indexOf("!! ") == 0)
         {
            this.channelBtn.label = LanResManager.getLanCommonTextWords("队伍");
            this.input.richText = "";
         }
         if(this.input.textField.text.indexOf("!~ ") == 0)
         {
            this.channelBtn.label = LanResManager.getLanCommonTextWords("帮派");
            this.input.richText = "";
         }
         if(this.input.textField.text.indexOf("!@ ") == 0)
         {
            this.channelBtn.label = LanResManager.getLanCommonTextWords("世界");
            this.input.richText = "";
         }
         if(this.input.textField.text.indexOf("!# ") == 0)
         {
            this.channelBtn.label = LanResManager.getLanCommonTextWords("喇叭");
            this.input.richText = "";
         }
         this.channelBtn.width = this.worldBtn.width;
      }
      
      private function onInput(param1:TextEvent) : void
      {
         if(this.tipCanvas.parent != null)
         {
            this.tipCanvas.parent.removeChild(this.tipCanvas);
         }
      }
      
      private function onSelectLog(param1:MouseEvent) : void
      {
         if(this.tipCanvas.parent != null)
         {
            this.tipCanvas.parent.removeChild(this.tipCanvas);
            if(this.isChatLog)
            {
               this.input.richText = this.tipList.selectItem.label;
            }
            else
            {
               this.input.richText = "/" + this.tipList.selectItem.label + " ";
            }
            this.input.textField.setSelection(this.input.textField.length,this.input.textField.length);
         }
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         switch(param1.keyCode)
         {
            case Keyboard.ENTER:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
                  if(this.isChatLog)
                  {
                     this.input.richText = this.tipList.selectItem.label;
                  }
                  else
                  {
                     this.input.richText = "/" + this.tipList.selectItem.label + " ";
                  }
                  this.input.textField.setSelection(this.input.textField.length,this.input.textField.length);
                  return;
               }
               if(Tools.currentStage.focus != this.input.textField)
               {
                  Tools.currentStage.focus = this.input.textField;
               }
               else
               {
                  this.sendMessage();
               }
               break;
            case Keyboard.UP:
               if(this.tipCanvas.parent == null)
               {
                  if(this.input.textField.text == "/" && this.targetLog.length > 0)
                  {
                     this.tipList.dataProvider = this.targetLog;
                     this.tipList.setSelectItemByIndex(0);
                     this.tipCanvas.height = this.tipList.height + 4;
                     addChild(this.tipCanvas);
                     this.tipCanvas.y = -this.tipCanvas.height;
                     this.isChatLog = false;
                  }
                  else if(this.input.textField.text != "/" && this.chatLog.length > 0)
                  {
                     this.tipList.dataProvider = this.chatLog;
                     this.tipList.setSelectItemByIndex(0);
                     addChild(this.tipCanvas);
                     this.tipCanvas.height = this.tipList.height + 4;
                     this.tipCanvas.y = -this.tipCanvas.height;
                     this.isChatLog = true;
                  }
               }
               else
               {
                  this.tipList.setSelectPrevious();
                  if(this.isChatLog)
                  {
                     this.input.richText = this.tipList.selectItem.label;
                  }
                  else
                  {
                     this.input.richText = "/" + this.tipList.selectItem.label + " ";
                  }
                  this.input.textField.setSelection(this.input.textField.length,this.input.textField.length);
               }
               break;
            case Keyboard.DOWN:
               if(this.tipCanvas.parent == null)
               {
                  if(this.input.textField.caretIndex == 1 && this.input.textField.text.charAt(0) == "/" && this.targetLog.length > 1)
                  {
                     this.tipList.dataProvider = this.targetLog;
                     this.tipList.setSelectItemByIndex(0);
                     addChild(this.tipCanvas);
                     this.tipCanvas.height = this.tipList.height + 4;
                     this.tipCanvas.y = -this.tipCanvas.height;
                     this.isChatLog = false;
                  }
                  else if(this.chatLog.length > 1)
                  {
                     this.tipList.dataProvider = this.chatLog;
                     this.tipList.setSelectItemByIndex(0);
                     addChild(this.tipCanvas);
                     this.tipCanvas.height = this.tipList.height + 4;
                     this.tipCanvas.y = -this.tipCanvas.height;
                     this.isChatLog = true;
                  }
               }
               else
               {
                  this.tipList.setSelcetNext();
                  if(this.isChatLog)
                  {
                     this.input.richText = this.tipList.selectItem.label;
                  }
                  else
                  {
                     this.input.richText = "/" + this.tipList.selectItem.label + " ";
                  }
                  this.input.textField.setSelection(this.input.textField.length,this.input.textField.length);
               }
         }
      }
      
      public function changeSize(param1:MouseEvent = null) : void
      {
         var e:MouseEvent = param1;
         if(this.bugleChannel.width == this.tabBar.width + 13)
         {
            this.bugleChannel.resizeTo(460,40);
            this.bugleChannel.y = -330;
            this.flowerChannel.resizeTo(266,60);
            this.flowerChannel.y = -390 - 8;
            this.flowerBg.y = -415;
            this.allChannel.resize(460,270);
            this.allChannel.y = -290;
            this.sendBtn.x = 460 - this.sendBtn.width;
            this.faceBtn.x = this.sendBtn.x - this.faceBtn.width - 2;
            this.inputBg.width = 460;
            this.input.resizeTo(this.faceBtn.x - 22 - this.defaultBtn.width,18);
            with(graphics)
            {
               
               clear();
               beginFill(0,0.3);
               drawRect(0,24,460,-290 - 40 - 24);
               endFill();
            }
         }
         else
         {
            this.bugleChannel.resizeTo(this.tabBar.width + 13,40);
            this.bugleChannel.y = -175;
            this.allChannel.resize(this.tabBar.width + 13,115);
            this.flowerChannel.resizeTo(266,60);
            this.flowerBg.y = -260;
            this.flowerChannel.y = -235 - 8;
            this.allChannel.resize(266,115);
            this.allChannel.y = -135;
            this.sendBtn.x = this.tabBar.width + 13 - this.sendBtn.width;
            this.faceBtn.x = this.sendBtn.x - this.faceBtn.width - 2;
            this.inputBg.width = this.tabBar.width + 13;
            this.input.resizeTo(this.faceBtn.x - 22 - this.defaultBtn.width,18);
            with(graphics)
            {
               
               clear();
               beginFill(0,0.3);
               drawRect(0,24,tabBar.width + 13,-135 - 40 - 24);
               endFill();
            }
         }
         if(this._faceBox != null)
         {
            this._faceBox.x = this.faceBtn.x + this.faceBtn.width;
            this._faceBox.y = this.faceBtn.y - this._faceBox.height;
         }
      }
      
      private function onMouse(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OUT:
               this.tabBar.alpha = 1;
               break;
            case MouseEvent.MOUSE_OVER:
               this.tabBar.alpha = 1;
         }
      }
      
      private function addChatLog(param1:String) : void
      {
         param1 = param1.replace(/\[[^\]]+?\]/g,"");
         if(param1 == "")
         {
            return;
         }
         if(this.chatLog.push({"label":param1}) > 10)
         {
            this.chatLog.shift();
         }
      }
      
      private function addTargetLog(param1:String) : void
      {
         if(this.targetLog.push({"label":param1}) > 10)
         {
            this.targetLog.shift();
         }
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("综合"):
               this.allChannel.show(CHANNEL_ZONGHE);
               break;
            case LanResManager.getLanCommonTextWords("普通"):
               this.allChannel.show(CHANNEL_PUTONG);
               this.channelBtn.label = LanResManager.getLanCommonTextWords("普通");
               this.tabBar.getButtonByLabel(LanResManager.getLanCommonTextWords("普通")).coruscateStop();
               break;
            case LanResManager.getLanCommonTextWords("私聊"):
               this.allChannel.show(CHANNEL_SILIAO);
               this.channelBtn.label = LanResManager.getLanCommonTextWords("私聊");
               this.tabBar.getButtonByLabel(LanResManager.getLanCommonTextWords("私聊")).coruscateStop();
               break;
            case LanResManager.getLanCommonTextWords("队伍"):
               this.allChannel.show(CHANNEL_DUIWU);
               this.channelBtn.label = LanResManager.getLanCommonTextWords("队伍");
               this.tabBar.getButtonByLabel(LanResManager.getLanCommonTextWords("队伍")).coruscateStop();
               break;
            case LanResManager.getLanCommonTextWords("帮派"):
               this.allChannel.show(CHANNEL_BANGPAI);
               this.channelBtn.label = LanResManager.getLanCommonTextWords("帮派");
               this.tabBar.getButtonByLabel(LanResManager.getLanCommonTextWords("帮派")).coruscateStop();
               break;
            case LanResManager.getLanCommonTextWords("世界"):
               this.allChannel.show(CHANNEL_SHIJIE);
               this.channelBtn.label = LanResManager.getLanCommonTextWords("世界");
               this.tabBar.getButtonByLabel(LanResManager.getLanCommonTextWords("世界")).coruscateStop();
         }
         this.channelBtn.width = this.worldBtn.width;
      }
      
      private function onChanegChannal(param1:MouseEvent) : void
      {
         if(this.btnCanvas.parent)
         {
            this.btnCanvas.parent.removeChild(this.btnCanvas);
         }
         else
         {
            addChild(this.btnCanvas);
         }
         Tools.currentStage.focus = this.input.textField;
         switch(param1.target)
         {
            case this.channelBtn:
               break;
            case this.defaultBtn:
               this.channelBtn.label = LanResManager.getLanCommonTextWords("普通");
               this.input.richText = "";
               break;
            case this.privateBtn:
               this.channelBtn.label = LanResManager.getLanCommonTextWords("私聊");
               this.input.richText = "/";
               break;
            case this.teamBtn:
               this.channelBtn.label = LanResManager.getLanCommonTextWords("队伍");
               this.input.richText = "";
               break;
            case this.setupBtn:
               this.channelBtn.label = LanResManager.getLanCommonTextWords("帮派");
               this.input.richText = "";
               break;
            case this.worldBtn:
               this.channelBtn.label = LanResManager.getLanCommonTextWords("世界");
               this.input.richText = "";
               break;
            case this.bugleBtn:
               this.channelBtn.label = LanResManager.getLanCommonTextWords("喇叭");
               this.input.richText = "";
         }
         this.channelBtn.width = this.worldBtn.width;
      }
      
      private function onSendBtnClick(param1:MouseEvent) : void
      {
         this.sendMessage();
      }
      
      private function sendMessage() : void
      {
         var _loc3_:BaseEvent = null;
         var _loc1_:String = this.input.text;
         if(_loc1_.length == 0)
         {
            return;
         }
         _loc1_ = _loc1_.replace(/ξ/ig,"");
         var _loc2_:RegExp = /\[#[0-9]+\]/g;
         if(_loc1_.match(_loc2_).length > 3)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("最多输入三个表情"));
            return;
         }
         if(_loc1_.indexOf("#") == 0)
         {
            _loc3_ = new BaseEvent(MainUI.CHAT_SENDMESSAGEBTN_CLICK,"",[7,"",_loc1_]);
            this.input.richText = "";
         }
         else if(_loc1_.indexOf("/") == 0 && _loc1_.indexOf(" ") != -1)
         {
            _loc3_ = new BaseEvent(MainUI.CHAT_SENDMESSAGEBTN_CLICK,"",[2,_loc1_.slice(1,_loc1_.indexOf(" ")),this.replaceItem(_loc1_.slice(_loc1_.indexOf(" ") + 1))]);
            this.addChatLog(_loc1_.slice(_loc1_.indexOf(" ") + 1));
            this.addTargetLog(_loc1_.slice(1,_loc1_.indexOf(" ")));
            this.input.richText = "/" + _loc1_.slice(1,_loc1_.indexOf(" ")) + " ";
            this.input.textField.setSelection(this.input.textField.text.length,this.input.textField.text.length);
         }
         else if(_loc1_.indexOf("!") == 0)
         {
            _loc3_ = new BaseEvent(MainUI.CHAT_SENDMESSAGEBTN_CLICK,"",[1,"",this.replaceItem(_loc1_.slice(1))]);
            this.addChatLog(_loc1_);
            this.input.richText = "";
         }
         else if(_loc1_.indexOf("!!") == 0)
         {
            _loc3_ = new BaseEvent(MainUI.CHAT_SENDMESSAGEBTN_CLICK,"",[3,"",this.replaceItem(_loc1_.slice(2))]);
            this.addChatLog(_loc1_);
            this.input.richText = "";
         }
         else if(_loc1_.indexOf("!~") == 0)
         {
            _loc3_ = new BaseEvent(MainUI.CHAT_SENDMESSAGEBTN_CLICK,"",[4,"",this.replaceItem(_loc1_.slice(2))]);
            this.addChatLog(_loc1_);
            this.input.richText = "";
         }
         else if(_loc1_.indexOf("!@") == 0)
         {
            _loc3_ = new BaseEvent(MainUI.CHAT_SENDMESSAGEBTN_CLICK,"",[5,"",this.replaceItem(_loc1_.slice(2))]);
            this.addChatLog(_loc1_);
            this.input.richText = "";
         }
         else if(_loc1_.indexOf("!#") == 0)
         {
            _loc3_ = new BaseEvent(MainUI.CHAT_SENDMESSAGEBTN_CLICK,"",[6,"",this.replaceItem(_loc1_.slice(2))]);
            this.addChatLog(_loc1_);
            this.input.richText = "";
         }
         else
         {
            switch(this.channelBtn.label)
            {
               case LanResManager.getLanCommonTextWords("普通"):
                  _loc3_ = new BaseEvent(MainUI.CHAT_SENDMESSAGEBTN_CLICK,"",[1,"",this.replaceItem(_loc1_)]);
                  this.addChatLog(_loc1_);
                  this.input.richText = "";
                  break;
               case LanResManager.getLanCommonTextWords("私聊"):
                  _loc3_ = new BaseEvent(MainUI.CHAT_SENDMESSAGEBTN_CLICK,"",[2,_loc1_.slice(1,_loc1_.indexOf(" ")),this.replaceItem(_loc1_.slice(_loc1_.indexOf(" ") + 1))]);
                  this.addChatLog(_loc1_.slice(_loc1_.indexOf(" ") + 1));
                  this.addTargetLog(_loc1_.slice(1,_loc1_.indexOf(" ")));
                  this.input.richText = "/" + _loc1_.slice(1,_loc1_.indexOf(" ")) + " ";
                  this.input.textField.setSelection(this.input.textField.text.length,this.input.textField.text.length);
                  break;
               case LanResManager.getLanCommonTextWords("队伍"):
                  _loc3_ = new BaseEvent(MainUI.CHAT_SENDMESSAGEBTN_CLICK,"",[3,"",this.replaceItem(_loc1_)]);
                  this.addChatLog(_loc1_);
                  this.input.richText = "";
                  break;
               case LanResManager.getLanCommonTextWords("帮派"):
                  _loc3_ = new BaseEvent(MainUI.CHAT_SENDMESSAGEBTN_CLICK,"",[4,"",this.replaceItem(_loc1_)]);
                  this.addChatLog(_loc1_);
                  this.input.richText = "";
                  break;
               case LanResManager.getLanCommonTextWords("世界"):
                  _loc3_ = new BaseEvent(MainUI.CHAT_SENDMESSAGEBTN_CLICK,"",[5,"",this.replaceItem(_loc1_)]);
                  this.addChatLog(_loc1_);
                  this.input.richText = "";
                  break;
               case LanResManager.getLanCommonTextWords("喇叭"):
                  _loc3_ = new BaseEvent(MainUI.CHAT_SENDMESSAGEBTN_CLICK,"",[6,"",this.replaceItem(_loc1_)]);
                  this.addChatLog(_loc1_);
                  this.input.richText = "";
            }
         }
         if(_loc3_ != null)
         {
            parent.dispatchEvent(_loc3_);
         }
      }
      
      private function onFaceBtnClick(param1:MouseEvent) : void
      {
         var onFaceMouseOver:Function;
         var onFaceMouseOut:Function;
         var onFaceMouseClick:Function;
         var icoLen:int = 0;
         var H_COUNT:int = 0;
         var V_COUNT:int = 0;
         var _borderShape:Shape = null;
         var g:Graphics = null;
         var v:int = 0;
         var h:int = 0;
         var xml:XML = null;
         var type:String = null;
         var url:String = null;
         var key:String = null;
         var descripe:String = null;
         var face:DisplayObject = null;
         var e:MouseEvent = param1;
         if(this._faceBox == null)
         {
            onFaceMouseOver = function(param1:Event):void
            {
               var _loc2_:DisplayObject = param1.currentTarget as DisplayObject;
               var _loc3_:Array = [];
               _loc3_[0] = int(_loc2_.x / GIRD_SIZE) * GIRD_SIZE;
               _loc3_[1] = int(_loc2_.y / GIRD_SIZE) * GIRD_SIZE;
               _borderShape.graphics.clear();
               _borderShape.graphics.lineStyle(2,65280,0.8);
               _borderShape.graphics.drawRect(_loc3_[0],_loc3_[1],GIRD_SIZE,GIRD_SIZE);
               showTip(_loc2_);
            };
            onFaceMouseOut = function(param1:Event):void
            {
               _borderShape.graphics.clear();
               showTip(null,false);
            };
            onFaceMouseClick = function(param1:Event):void
            {
               var _loc2_:DisplayObject = param1.currentTarget as DisplayObject;
               if(input.textField.length < input.textField.maxChars)
               {
                  input.insertRichText(_loc2_.name);
                  removeChild(_faceBox);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,"输入文本过长");
               }
            };
            icoLen = ICO_CONFIG_XML.icon.length();
            H_COUNT = 7;
            V_COUNT = Math.ceil(icoLen / H_COUNT);
            this._faceBox = new Sprite();
            this._faceBox.mouseEnabled = false;
            _borderShape = new Shape();
            _borderShape.filters = [new GlowFilter(1187358,1,3,3,15,BitmapFilterQuality.LOW)];
            this._faceBox.addChild(_borderShape);
            g = this._faceBox.graphics;
            g.lineStyle(0);
            g.beginFill(0,0.65);
            g.drawRect(0,0,H_COUNT * GIRD_SIZE,V_COUNT * GIRD_SIZE);
            g.endFill();
            g.lineStyle(1,7578017,1);
            v = 0;
            while(v <= V_COUNT)
            {
               g.moveTo(0,v * GIRD_SIZE);
               g.lineTo(H_COUNT * GIRD_SIZE,v * GIRD_SIZE);
               v++;
            }
            h = 0;
            while(h <= H_COUNT)
            {
               g.moveTo(h * GIRD_SIZE,0);
               g.lineTo(h * GIRD_SIZE,V_COUNT * GIRD_SIZE);
               h++;
            }
            v = 0;
            while(v < V_COUNT)
            {
               h = 0;
               while(h < H_COUNT)
               {
                  xml = ICO_CONFIG_XML.icon[v * H_COUNT + h];
                  if(xml == null)
                  {
                     break;
                  }
                  type = xml.@iconType;
                  url = xml.@iconUrl;
                  key = xml.@iconStr;
                  descripe = xml.@descripe;
                  if(type == "jpg" || type == "gif")
                  {
                     face = new Loader();
                     (face as Loader).contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,function(param1:Event):void
                     {
                     });
                     (face as Loader).load(new URLRequest(url));
                  }
                  else
                  {
                     face = RslLoaderManager.getInstance(url);
                  }
                  if(face != null)
                  {
                     face.name = key;
                     if(!this.descripeDict.hasOwnProperty(key))
                     {
                        this.descripeDict[key] = descripe;
                     }
                     face.x = h * GIRD_SIZE + GIRD_SIZE / 2 - ICO_SIZE / 2;
                     face.y = v * GIRD_SIZE + GIRD_SIZE / 2 - ICO_SIZE / 2;
                     face.addEventListener(MouseEvent.MOUSE_OVER,onFaceMouseOver);
                     face.addEventListener(MouseEvent.MOUSE_OUT,onFaceMouseOut);
                     face.addEventListener(MouseEvent.CLICK,onFaceMouseClick);
                     this._faceBox.addChild(face);
                  }
                  h++;
               }
               v++;
            }
         }
         if(this._faceBox.parent == null)
         {
            this._faceBox.x = this.faceBtn.x + this.faceBtn.width;
            this._faceBox.y = this.faceBtn.y - this._faceBox.height;
            addChild(this._faceBox);
         }
         else
         {
            removeChild(this._faceBox);
         }
      }
      
      private function replaceItem(param1:String) : String
      {
         while(this.itemArr.length > 0)
         {
            param1 = param1.replace(this.itemArr[0].name,this.itemArr[0].link);
            this.itemArr.shift();
         }
         return param1;
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
         this.allChannel.$parent = param1;
      }
      
      public function showChat(param1:int = 1, param2:String = "", param3:int = -1, param4:String = "", param5:int = -1, param6:String = "", param7:Boolean = false, param8:Boolean = false, param9:Boolean = false) : void
      {
         param6 = param6.replace(/</g,"&lt;");
         var _loc10_:RegExp = /ξgoods(\d+)\,(\d+)\,(\d+)\,(\#[\da-zA-Z]+)\,([^;]+?);/g;
         var _loc11_:String = "<a href=\'event:$1ξ$2ξ$3\'><font color=\'$4\'> 【$5】 </font></a>";
         param6 = param6.replace(_loc10_,_loc11_);
         switch(param1)
         {
            case CHANNEL_SILIAO:
               if(param3 != -100 && param3 != -1 && this.tabBar.currentLabel != LanResManager.getLanCommonTextWords("私聊"))
               {
                  this.tabBar.alpha = 1;
                  this.tabBar.getButtonByLabel(LanResManager.getLanCommonTextWords("私聊")).coruscateStart();
               }
               break;
            case CHANNEL_DUIWU:
               if(param3 != -100 && param3 != -1 && this.tabBar.currentLabel != LanResManager.getLanCommonTextWords("队伍"))
               {
                  this.tabBar.alpha = 1;
                  this.tabBar.getButtonByLabel(LanResManager.getLanCommonTextWords("队伍")).coruscateStart();
               }
               break;
            case CHANNEL_BANGPAI:
               if(param3 != -100 && param3 != -1 && this.tabBar.currentLabel != LanResManager.getLanCommonTextWords("帮派"))
               {
                  this.tabBar.alpha = 1;
                  this.tabBar.getButtonByLabel(LanResManager.getLanCommonTextWords("帮派")).coruscateStart();
               }
               break;
            case CHANNEL_LABA:
               if(param3 == -100)
               {
                  break;
               }
               if(param3 != -1)
               {
                  this.bugleChannel.appendRichText("<textformat><font color=\'0xff4500\'>" + LanResManager.getLanCommonTextWords("『喇叭』") + "</font>" + (param7 ? "<font color=\'" + StaticValue.RED_HTML + "\'>[GM]</font>" : "") + "<font color=\'#b0e0e6\'><a href=\'event:" + param3 + "Ω" + param2 + "Ω" + (param8 ? "1" : "0") + "\'>" + (param8 ? "【门派弟子】" : "") + param2 + "：</a></font><font color=\'" + (param7 ? StaticValue.RED_HTML : (param9 ? StaticValue.PURPLE_HTML : "#ff4500")) + "\'>" + param6 + "</font></textformat>");
               }
               else
               {
                  this.bugleChannel.appendRichText("<textformat><font color=\'0xff4500\'>" + LanResManager.getLanCommonTextWords("『喇叭』") + "</font>" + (param7 ? "<font color=\'" + StaticValue.RED_HTML + "\'>[GM]</font>" : "") + "<font color=\'#ffffffff\'>" + GameInstance.mainChar.name + "：</font><font color=\'" + (param7 ? StaticValue.RED_HTML : (param9 ? StaticValue.PURPLE_HTML : "#ff4500")) + "\'>" + param6 + "</font></textformat>");
               }
               this.bugleChannel.alpha = 1;
               TweenLite.killTweensOf(this.bugleChannel);
               TweenLite.to(this.bugleChannel,30,{"onComplete":this.hideBugle});
               break;
            case CHANNEL_FLOWER:
               if(param3 == -100)
               {
                  break;
               }
               if(param3 != -1 && param5 != -1)
               {
                  this.flowerChannel.appendRichText("<textformat>" + (param7 ? "<font color=\'" + StaticValue.RED_HTML + "\'>[GM]</font>" : "") + "<font color=\'#84f2f9\'><a href=\'event:" + param3 + "Ω" + param2 + "\'>" + param2 + "<font color=\'#ffffff\'>" + LanResManager.getLanCommonTextWords("对") + "</font><font color=\'#84f2f9\'><a href=\'event:" + param5 + "Ω" + param4 + "\'>" + param4 + "<font color=\'#ffffff\'>" + LanResManager.getLanCommonTextWords("说：") + "</a></font><font color=\'" + (param7 ? StaticValue.RED_HTML : (param9 ? StaticValue.PURPLE_HTML : "#fefe42")) + "\'>" + param6 + "</font></textformat>");
               }
               else if(param3 == -1 && param5 != -1)
               {
                  this.flowerChannel.appendRichText("<textformat>" + (param7 ? "<font color=\'" + StaticValue.RED_HTML + "\'>[GM]</font>" : "") + "<font color=\'#ffffffff\'>" + LanResManager.getLanCommonTextWords("你对") + "<font color=\'#84f2f9\'><a href=\'event:" + param5 + "Ω" + param4 + "\'>" + param4 + "<font color=\'#ffffff\'>" + LanResManager.getLanCommonTextWords("说：") + "</a></font><font color=\'" + (param7 ? StaticValue.RED_HTML : (param9 ? StaticValue.PURPLE_HTML : "#fefe42")) + "\'>" + param6 + "</font></textformat>");
               }
               else if(param3 != -1 && param5 == -1)
               {
                  this.flowerChannel.appendRichText("<textformat>" + (param7 ? "<font color=\'" + StaticValue.RED_HTML + "\'>[GM]</font>" : "") + "<font color=\'#84f2f9\'><a href=\'event:" + param3 + "Ω" + param2 + "\'>" + param2 + "<font color=\'#ffffff\'>" + LanResManager.getLanCommonTextWords("对你说：") + "</a></font><font color=\'" + (param7 ? StaticValue.RED_HTML : (param9 ? StaticValue.PURPLE_HTML : "#fefe42")) + "\'>" + param6 + "</font></textformat>");
               }
               this.flowerChannel.alpha = 1;
               TweenLite.killTweensOf(this.flowerChannel);
               TweenLite.to(this.flowerChannel,30,{"onComplete":this.hideFlowerChannel});
               this.flowerBg.visible = true;
         }
         this.allChannel.showChat(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      private function hideBugle() : void
      {
         this.bugleChannel.richText = "";
      }
      
      private function hideFlowerChannel() : void
      {
         this.flowerChannel.richText = "";
         this.flowerBg.visible = false;
      }
      
      public function setPrivateTarget(param1:String) : void
      {
         this.input.richText = "/" + param1 + " ";
         this.input.textField.setSelection(this.input.textField.length,this.input.textField.length);
         Tools.currentStage.focus = this.input.textField;
      }
      
      public function setItem(param1:Goods, param2:int) : void
      {
         var _loc3_:String = null;
         if(this.input.textField.length < this.input.textField.maxChars)
         {
            this.input.appendRichText("[" + param1.res.name + "]");
            _loc3_ = "ξgoods" + param1.id + "," + param1.position + "," + param2 + "," + StaticValue.itemColors_html[param1.quality] + "," + param1.res.name + ";";
            this.itemArr.push({
               "name":"[" + param1.res.name + "]",
               "link":_loc3_
            });
         }
         else
         {
            NoticeManager.notify(NoticeManager.FOOT,"输入文本过长");
         }
      }
      
      private function showMenu() : void
      {
         if(this.isDizi)
         {
            this.menuList.dataProvider = <list>
					<node label={LanResManager.getLanCommonTextWords("密聊")} id="1"/>
					<node label={LanResManager.getLanCommonTextWords("查看")} id="2"/>
					<node label={LanResManager.getLanCommonTextWords("组队")} id="5"/>
					<node label={LanResManager.getLanCommonTextWords("双修")} id="10"/>
					</list>;
         }
         else
         {
            this.menuList.dataProvider = <list>
					<node label={LanResManager.getLanCommonTextWords("密聊")} id="1"/>
					<node label={LanResManager.getLanCommonTextWords("查看")} id="2"/>
					<node label={LanResManager.getLanCommonTextWords("交友")} id="3"/>
					<node label={LanResManager.getLanCommonTextWords("交易")} id="4"/>
					<node label={LanResManager.getLanCommonTextWords("组队")} id="5"/>
					<node label={LanResManager.getLanCommonTextWords("帮邀")} id="6"/>
					<node label={LanResManager.getLanCommonTextWords("看摊")} id="7"/>
					<node label={LanResManager.getLanCommonTextWords("赠花")} id="8"/>
					<node label={LanResManager.getLanCommonTextWords("求婚")} id="9"/>
					<node label={LanResManager.getLanCommonTextWords("双修")} id="10"/>
					</list>;
         }
         this.menuCanvas.width = this.menuList.width + 4;
         this.menuCanvas.height = this.menuList.height + 4;
         Tools.currentStage.addChild(this.menuCanvas);
         this.menuCanvas.x = Tools.currentStage.mouseX;
         this.menuCanvas.y = Tools.currentStage.mouseY - this.menuCanvas.height;
         Tools.currentStage.addEventListener(MouseEvent.CLICK,this.onStageClick);
      }
      
      private function onStageClick(param1:MouseEvent = null) : void
      {
         if(this.menuCanvas.parent != null)
         {
            this.menuCanvas.parent.removeChild(this.menuCanvas);
         }
         Tools.currentStage.removeEventListener(MouseEvent.CLICK,this.onStageClick);
      }
      
      private function onList(param1:MouseEvent) : void
      {
         this.onStageClick();
         this._parent.dispatchEvent(new BaseEvent(MainUI.CHAT_MENU_CLICK,"",[int(this.menuList.selectItem.id),this.linkID,this.linkName]));
      }
      
      private function showTip(param1:DisplayObject, param2:Boolean = true) : void
      {
         var _loc3_:Point = null;
         if(param2 && Boolean(param1))
         {
            this.tipTxt.htmlText = LanResManager.getLanCommonTextWords(this.descripeDict[param1.name]) + " " + param1.name;
            this.txtTipCanvas.width = this.tipTxt.width + 4;
            this.txtTipCanvas.height = this.tipTxt.height + 4;
            Tools.currentStage.addChild(this.txtTipCanvas);
            _loc3_ = new Point(param1.x,param1.y);
            _loc3_ = param1.parent.localToGlobal(_loc3_);
            if(_loc3_.x + param1.width + this.txtTipCanvas.width > Tools.currentStage.stageWidth)
            {
               this.txtTipCanvas.x = _loc3_.x - this.txtTipCanvas.width;
            }
            else
            {
               this.txtTipCanvas.x = _loc3_.x + param1.width + 10;
            }
            if(_loc3_.y + param1.height + this.txtTipCanvas.height > Tools.currentStage.stageHeight)
            {
               this.txtTipCanvas.y = _loc3_.y - this.txtTipCanvas.height;
            }
            else
            {
               this.txtTipCanvas.y = _loc3_.y + param1.height + 10;
            }
         }
         else if(this.txtTipCanvas.parent)
         {
            this.tipTxt.htmlText = "";
            this.txtTipCanvas.parent.removeChild(this.txtTipCanvas);
         }
      }
      
      public function setTeamChannel(param1:Boolean = true) : void
      {
         if(param1)
         {
            this.channelBtn.enabled = true;
            this.privateBtn.enabled = true;
            this.teamBtn.enabled = true;
            this.bugleBtn.enabled = true;
            this.defaultBtn.enabled = true;
            this.setupBtn.enabled = true;
            this.worldBtn.enabled = true;
            this.tabBar.mouseChildren = true;
         }
         else
         {
            this.channelBtn.enabled = false;
            this.privateBtn.enabled = false;
            this.teamBtn.enabled = false;
            this.bugleBtn.enabled = false;
            this.defaultBtn.enabled = false;
            this.setupBtn.enabled = false;
            this.worldBtn.enabled = false;
            this.tabBar.mouseChildren = false;
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("队伍"));
            this.allChannel.show(CHANNEL_DUIWU);
            this.channelBtn.label = LanResManager.getLanCommonTextWords("队伍");
            this.tabBar.getButtonByLabel(LanResManager.getLanCommonTextWords("队伍")).coruscateStop();
         }
      }
   }
}

