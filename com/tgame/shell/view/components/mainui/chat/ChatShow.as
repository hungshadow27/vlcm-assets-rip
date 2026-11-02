package com.tgame.shell.view.components.mainui.chat
{
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.RichTextArea;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.handler.HandlerThread;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.text.TextFormat;
   import flash.utils.Dictionary;
   
   public class ChatShow extends Sprite
   {
      
      public var colors:Array = ["#b0e0e6","#ffffff","#da70d6","#87ceeb","#00c957","#ffd700","#ff4500","#00ff00"];
      
      public var $parent:DisplayObject;
      
      private var chatText:RichTextArea;
      
      private var scrollBar:FVScorllBar;
      
      private var tipCanvas:FCanvas;
      
      private var menuList:FList;
      
      private var linkID:int;
      
      private var linkName:String;
      
      private var url:String;
      
      private var _showChannel:int = -1;
      
      private var _chatDict:Dictionary = new Dictionary();
      
      private var _appendTextHD:HandlerThread = new HandlerThread();
      
      private var isDizi:Boolean = false;
      
      public function ChatShow()
      {
         super();
         this.init();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.menuList = new FList();
         this.menuList.skin = "menuList";
         this.tipCanvas.addChild(this.menuList);
         this.menuList.x = 2;
         this.menuList.y = 2;
         this.menuList.listWidth = 53;
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
															<node label={LanResManager.getLanCommonTextWords("禁言")} id="11"/>
														</list>;
         this.menuList.addEventListener(MouseEvent.CLICK,this.onList);
         this.tipCanvas.width = this.menuList.width + 4;
         this.tipCanvas.height = this.menuList.height + 4;
      }
      
      private function getChannelChats(param1:int) : Array
      {
         if(this._chatDict[param1] == undefined)
         {
            this._chatDict[param1] = [];
         }
         return this._chatDict[param1];
      }
      
      private function init() : void
      {
         this.chatText = new RichTextArea(200,200);
         this.chatText.configXML = Chat.ICO_CONFIG_XML;
         this.chatText.autoScrollToBottom = true;
         this.chatText.textField.wordWrap = true;
         this.chatText.textField.multiline = true;
         this.chatText.textField.filters = StaticValue.filter;
         this.chatText.textField.selectable = false;
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.size = 12;
         _loc1_.color = 16777215;
         _loc1_.letterSpacing = 0;
         this.chatText.defaultTextFormat = _loc1_;
         addChild(this.chatText);
         this.scrollBar = new FVScorllBar(this.chatText.textField,this.chatText.height);
         addChild(this.chatText);
         addChild(this.scrollBar);
         this.chatText.x = 15;
         this.scrollBar.alpha = 1;
         this.scrollBar.addEventListener(MouseEvent.MOUSE_OUT,this.onMouse);
         this.scrollBar.addEventListener(MouseEvent.MOUSE_OVER,this.onMouse);
         this.chatText.textField.addEventListener(TextEvent.LINK,this.onLink);
         this.chatText.textField.addEventListener(MouseEvent.MOUSE_DOWN,this.onTextMouse);
         this.chatText.textField.addEventListener(MouseEvent.CLICK,this.onTextMouse);
         this.chatText.textField.addEventListener(MouseEvent.MOUSE_MOVE,this.onTextMouse);
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
         else if(param1.text.search("&") != -1)
         {
            _loc2_ = param1.text.split("&");
            this.linkID = int(_loc2_[0]);
            this.linkName = _loc2_[1];
            this.$parent.dispatchEvent(new BaseEvent(MainUI.CHAT_MENU_CLICK,"",[7,this.linkID,this.linkName]));
         }
      }
      
      private function onTextMouse(param1:MouseEvent) : void
      {
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc2_:int = this.chatText.textField.getCharIndexAtPoint(this.chatText.textField.mouseX,this.chatText.textField.mouseY);
         if(_loc2_ != -1 && _loc2_ < this.chatText.textField.length)
         {
            _loc3_ = this.chatText.textField.getTextFormat(_loc2_,_loc2_ + 1).url;
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
                     this.$parent.dispatchEvent(new BaseEvent(MainUI.CHAT_ITEM_LINK_CLICK,"",[int(_loc4_[0]),int(_loc4_[1]),int(_loc4_[2]),Tools.currentStage.mouseX,Tools.currentStage.mouseY]));
                  }
                  else if(_loc3_ != this.url)
                  {
                     this.$parent.dispatchEvent(new BaseEvent(MainUI.CHAT_ITEM_LINK_HIDE));
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
            if(this.$parent == null)
            {
               return;
            }
            this.$parent.dispatchEvent(new BaseEvent(MainUI.CHAT_ITEM_LINK_HIDE));
            if(!GameState.isDoubleFlyStatus)
            {
               GameInstance.scene.sceneDispatchEvent(param1);
            }
         }
      }
      
      private function showMenu() : void
      {
         if(this.isDizi)
         {
            if(GameState.isDoubleFlyStatus)
            {
               this.menuList.dataProvider = <list>
					<node label={LanResManager.getLanCommonTextWords("密聊")} id="1"/>
					</list>;
            }
            else
            {
               this.menuList.dataProvider = <list>
					<node label={LanResManager.getLanCommonTextWords("密聊")} id="1"/>
					<node label={LanResManager.getLanCommonTextWords("查看")} id="2"/>
					<node label={LanResManager.getLanCommonTextWords("组队")} id="5"/>
					<node label={LanResManager.getLanCommonTextWords("双修")} id="10"/>
					</list>;
            }
         }
         else if(GameState.isDoubleFlyStatus)
         {
            this.menuList.dataProvider = <list>
					<node label={LanResManager.getLanCommonTextWords("密聊")} id="1"/>
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
         this.tipCanvas.width = this.menuList.width + 4;
         this.tipCanvas.height = this.menuList.height + 4;
         Tools.currentStage.addChild(this.tipCanvas);
         this.tipCanvas.x = Tools.currentStage.mouseX;
         this.tipCanvas.y = Tools.currentStage.mouseY - this.tipCanvas.height;
         Tools.currentStage.addEventListener(MouseEvent.CLICK,this.onStageClick);
      }
      
      private function onStageClick(param1:MouseEvent = null) : void
      {
         if(this.tipCanvas.parent != null)
         {
            this.tipCanvas.parent.removeChild(this.tipCanvas);
         }
         Tools.currentStage.removeEventListener(MouseEvent.CLICK,this.onStageClick);
      }
      
      private function onList(param1:MouseEvent) : void
      {
         this.onStageClick();
         this.$parent.dispatchEvent(new BaseEvent(MainUI.CHAT_MENU_CLICK,"",[int(this.menuList.selectItem.id),this.linkID,this.linkName]));
      }
      
      private function onMouse(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.scrollBar.alpha = 1;
               break;
            case MouseEvent.MOUSE_OUT:
               this.scrollBar.alpha = 1;
         }
      }
      
      public function show(param1:int) : void
      {
         var _loc5_:Array = null;
         if(this._showChannel == param1)
         {
            return;
         }
         this._showChannel = param1;
         this._appendTextHD.removeAllHandlers();
         var _loc2_:Array = this.getChannelChats(this._showChannel);
         this.chatText.richText = "";
         var _loc3_:int = int(_loc2_.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = [_loc2_[_loc4_]];
            if(_loc4_ < _loc3_ - 1)
            {
               _loc5_.push(_loc2_[++_loc4_]);
            }
            this._appendTextHD.push(this.hd_appendRT,[this._showChannel,_loc5_],1);
            _loc4_++;
         }
      }
      
      private function hd_appendRT(param1:int, param2:Array) : void
      {
         if(this._showChannel != param1)
         {
            return;
         }
         while(param2.length > 0)
         {
            this.chatText.appendRichText(param2.shift());
         }
         while(this.chatText.textField.numLines > Chat.MAX_TALK)
         {
            this.chatText.insertRichText("",0,this.chatText.textField.getLineLength(0));
         }
      }
      
      public function showChat(param1:int = 1, param2:String = "", param3:int = -1, param4:String = "", param5:int = -1, param6:String = "", param7:Boolean = false, param8:Boolean = false, param9:Boolean = false) : void
      {
         var _loc10_:String = this.cacheChatMsg(param1,param2,param3,param4,param5,param6,param7,param8,param9);
         if(this._showChannel == param1 || this._showChannel == Chat.CHANNEL_ZONGHE || param1 == 8)
         {
            this._appendTextHD.push(this.hd_appendRT,[this._showChannel,[_loc10_]],1);
         }
      }
      
      private function cacheChatMsg(param1:int = 1, param2:String = "", param3:int = -1, param4:String = "", param5:int = -1, param6:String = "", param7:Boolean = false, param8:Boolean = false, param9:Boolean = false) : String
      {
         var _loc12_:String = null;
         var _loc10_:String = "";
         if(param3 == -100)
         {
            _loc12_ = param2 == "" ? LanResManager.getLanCommonTextWords("系统") : (param8 ? "【门派弟子】" : "" + param2);
            _loc10_ += "<textformat><font color=\'" + this.colors[0] + "\'>『" + _loc12_ + "』 </font><font color=\'" + this.colors[1] + "\'>" + param6 + "</font></textformat></br>";
         }
         else
         {
            switch(param1)
            {
               case 1:
                  if(param2 != "")
                  {
                     _loc10_ += "<textformat><font color=\'" + this.colors[1] + "\'>" + LanResManager.getLanCommonTextWords("『普通』") + " </font>" + (param7 ? "<font color=\'" + StaticValue.RED_HTML + "\'>[GM]</font>" : "") + "<font color=\'" + this.colors[0] + "\'><a href=\'event:" + param3 + "Ω" + param2 + "Ω" + (param8 ? "1" : "0") + "\'>" + (param8 ? LanResManager.getLanCommonTextWords("【门派弟子】") : "") + param2 + "<font color=\'" + this.colors[1] + "\'> ：</font></a></font><font color=\'" + (param7 ? StaticValue.RED_HTML : (param9 ? StaticValue.PURPLE_HTML : this.colors[1])) + "\'>" + param6 + "</font></textformat>";
                  }
                  else
                  {
                     _loc10_ += "<textformat><font color=\'" + this.colors[1] + "\'>" + LanResManager.getLanCommonTextWords("『普通』") + " </font>" + (param7 ? "<font color=\'" + StaticValue.RED_HTML + "\'>[GM]</font>" : "") + "<font color=\'" + this.colors[1] + "\'>" + GameInstance.mainChar.name + " ：</font><font color=\'" + (param7 ? StaticValue.RED_HTML : (param9 ? StaticValue.PURPLE_HTML : this.colors[1])) + "\'>" + param6 + "</font></textformat>";
                  }
                  break;
               case 2:
                  if(param2 != "")
                  {
                     _loc10_ += "<textformat><font color=\'" + this.colors[1] + "\'>" + LanResManager.getLanCommonTextWords("『私聊』") + " </font>" + (param7 ? "<font color=\'" + StaticValue.RED_HTML + "\'>[GM]</font>" : "") + "<font color=\'" + this.colors[0] + "\'><a href=\'event:" + param3 + "Ω" + param2 + "Ω" + (param8 ? "1" : "0") + "\'>" + (param8 ? "【门派弟子】" : "") + param2 + "<font color=\'" + this.colors[1] + "\'> > " + LanResManager.getLanCommonTextWords("你") + " ：</font></a></font><font color=\'" + (param7 ? StaticValue.RED_HTML : (param9 ? StaticValue.PURPLE_HTML : this.colors[2])) + "\'>" + param6 + "</font></textformat>";
                  }
                  else
                  {
                     _loc10_ += "<textformat><font color=\'" + this.colors[1] + "\'>" + LanResManager.getLanCommonTextWords("『私聊』") + " </font>" + (param7 ? "<font color=\'" + StaticValue.RED_HTML + "\'>[GM]</font>" : "") + "<font color=\'" + this.colors[1] + "\'>" + LanResManager.getLanCommonTextWords("你") + " > </font><font color=\'" + this.colors[0] + "\'><a href=\'event:" + param5 + "Ω" + param4 + "\'>" + param4 + " ：</a></font><font color=\'" + (param7 ? StaticValue.RED_HTML : (param9 ? StaticValue.PURPLE_HTML : this.colors[2])) + "\'>" + param6 + "</font></textformat>";
                  }
                  break;
               case 3:
                  if(param2 != "")
                  {
                     _loc10_ += "<textformat><font color=\'" + this.colors[3] + "\'>" + LanResManager.getLanCommonTextWords("『队伍』") + " </font>" + (param7 ? "<font color=\'" + StaticValue.RED_HTML + "\'>[GM]</font>" : "") + "<font color=\'" + this.colors[0] + "\'><a href=\'event:" + param3 + "Ω" + param2 + "Ω" + (param8 ? "1" : "0") + "\'>" + (param8 ? "【门派弟子】" : "") + param2 + "<font color=\'" + this.colors[1] + "\'> ：</font></a></font><font color=\'" + (param7 ? StaticValue.RED_HTML : (param9 ? StaticValue.PURPLE_HTML : this.colors[3])) + "\'>" + param6 + "</font></textformat>";
                  }
                  else
                  {
                     _loc10_ += "<textformat><font color=\'" + this.colors[3] + "\'>" + LanResManager.getLanCommonTextWords("『队伍』") + " </font>" + (param7 ? "<font color=\'" + StaticValue.RED_HTML + "\'>[GM]</font>" : "") + "<font color=\'" + this.colors[1] + "\'>" + GameInstance.mainChar.name + " ：</font><font color=\'" + (param7 ? StaticValue.RED_HTML : (param9 ? StaticValue.PURPLE_HTML : this.colors[3])) + "\'>" + param6 + "</font></textformat>";
                  }
                  break;
               case 4:
                  if(param2 != "")
                  {
                     _loc10_ += "<textformat><font color=\'" + this.colors[4] + "\'>" + LanResManager.getLanCommonTextWords("『帮派』") + " </font>" + (param7 ? "<font color=\'" + StaticValue.RED_HTML + "\'>[GM]</font>" : "") + "<font color=\'" + this.colors[0] + "\'><a href=\'event:" + param3 + "Ω" + param2 + "Ω" + (param8 ? "1" : "0") + "\'>" + (param8 ? "【门派弟子】" : "") + param2 + "<font color=\'" + this.colors[1] + "\'> ：</font></a></font><font color=\'" + (param7 ? StaticValue.RED_HTML : (param9 ? StaticValue.PURPLE_HTML : this.colors[4])) + "\'>" + param6 + "</font></textformat>";
                  }
                  else
                  {
                     _loc10_ += "<textformat><font color=\'" + this.colors[4] + "\'>" + LanResManager.getLanCommonTextWords("『帮派』") + "  </font>" + (param7 ? "<font color=\'" + StaticValue.RED_HTML + "\'>[GM]</font>" : "") + "<font color=\'" + this.colors[1] + "\'>" + GameInstance.mainChar.name + " ：</font><font color=\'" + (param7 ? StaticValue.RED_HTML : (param9 ? StaticValue.PURPLE_HTML : this.colors[4])) + "\'>" + param6 + "</font></textformat>";
                  }
                  break;
               case 5:
                  if(param2 != "")
                  {
                     _loc10_ += "<textformat><font color=\'" + this.colors[5] + "\'>" + LanResManager.getLanCommonTextWords("『世界』") + "  </font>" + (param7 ? "<font color=\'" + StaticValue.RED_HTML + "\'>[GM]</font>" : "") + (param3 == GameConfig.xiangyangcheng_bangzhuID ? "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("【城主】") + "</font>" : "") + "<font color=\'" + this.colors[0] + "\'><a href=\'event:" + param3 + "Ω" + param2 + "Ω" + (param8 ? "1" : "0") + "\'>" + (param8 ? LanResManager.getLanCommonTextWords("【门派弟子】") : "") + param2 + "<font color=\'" + this.colors[1] + "\'> ：</font></a></font><font color=\'" + (param7 ? StaticValue.RED_HTML : (param9 ? StaticValue.PURPLE_HTML : this.colors[5])) + "\'>" + param6 + "</font></textformat>";
                  }
                  else
                  {
                     _loc10_ += "<textformat><font color=\'" + this.colors[5] + "\'>" + LanResManager.getLanCommonTextWords("『世界』") + "  </font>" + (param7 ? "<font color=\'" + StaticValue.RED_HTML + "\'>[GM]</font>" : "") + (GameInstance.mainChar.id == GameConfig.xiangyangcheng_bangzhuID ? "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("【城主】") + "</font>" : "") + "<font color=\'" + this.colors[1] + "\'>" + GameInstance.mainChar.name + " ：</font><font color=\'" + (param7 ? StaticValue.RED_HTML : (param9 ? StaticValue.PURPLE_HTML : this.colors[5])) + "\'>" + param6 + "</font></textformat>";
                  }
                  break;
               case 6:
                  if(param2 != "")
                  {
                     _loc10_ += "<textformat><font color=\'" + this.colors[5] + "\'>" + "『" + LanResManager.getLanCommonTextWords("喇叭") + "』" + " </font>" + (param7 ? "<font color=\'" + StaticValue.RED_HTML + "\'>[GM]</font>" : "") + "<font color=\'" + this.colors[0] + "\'><a href=\'event:" + param3 + "Ω" + param2 + "\'>" + param2 + "<font color=\'" + this.colors[1] + "\'> ：</font></a></font><font color=\'" + (param7 ? StaticValue.RED_HTML : this.colors[4]) + "\'>" + param6 + "</font></textformat>";
                  }
                  else
                  {
                     _loc10_ += "<textformat><font color=\'" + this.colors[5] + "\'>" + "『" + LanResManager.getLanCommonTextWords("喇叭") + "』" + " </font>" + (param7 ? "<font color=\'" + StaticValue.RED_HTML + "\'>[GM]</font>" : "") + "<font color=\'" + this.colors[1] + "\'>" + GameInstance.mainChar.name + " ：</font><font color=\'" + (param7 ? StaticValue.RED_HTML : this.colors[4]) + "\'>" + param6 + "</font></textformat>";
                  }
                  break;
               case 0:
                  _loc12_ = param2 == "" ? LanResManager.getLanCommonTextWords("系统") : (param8 ? "【门派弟子】" : "" + param2);
                  _loc10_ += "<textformat><font color=\'" + this.colors[0] + "\'>『" + _loc12_ + "』 </font><font color=\'" + this.colors[1] + "\'>" + param6 + "</font></textformat>";
                  break;
               case 8:
                  if(param2 != "")
                  {
                     _loc10_ += "<textformat><font color=\'" + this.colors[7] + "\'>" + LanResManager.getLanCommonTextWords("『商贸』") + "  </font>" + (param7 ? "<font color=\'" + StaticValue.RED_HTML + "\'>[GM]</font>" : "") + (param3 == GameConfig.xiangyangcheng_bangzhuID ? "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("【城主】") + "</font>" : "") + "<font color=\'" + this.colors[0] + "\'><a href=\'event:" + param3 + "Ω" + param2 + "Ω" + (param8 ? "1" : "0") + "\'>" + (param8 ? "【门派弟子】" : "") + param2 + "<font color=\'" + this.colors[1] + "\'> ：</font></a></font><font color=\'" + (param7 ? StaticValue.RED_HTML : (param9 ? StaticValue.PURPLE_HTML : this.colors[7])) + "\'>" + param6 + "<a href=\'event:" + param3 + "&" + param2 + "\'><u>【" + param2 + LanResManager.getLanCommonTextWords("的摊位") + "】</u></a>" + "</font></textformat>";
                  }
                  else
                  {
                     _loc10_ += "<textformat><font color=\'" + this.colors[7] + "\'>" + LanResManager.getLanCommonTextWords("『商贸』") + "  </font>" + (param7 ? "<font color=\'" + StaticValue.RED_HTML + "\'>[GM]</font>" : "") + (GameInstance.mainChar.id == GameConfig.xiangyangcheng_bangzhuID ? "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("【城主】") + "</font>" : "") + "<font color=\'" + this.colors[1] + "\'>" + GameInstance.mainChar.name + " ：</font><font color=\'" + (param7 ? StaticValue.RED_HTML : (param9 ? StaticValue.PURPLE_HTML : this.colors[7])) + "\'>" + param6 + "<a href=\'event:" + GameInstance.mainChar.id + "&" + GameInstance.mainChar.name + "\'><u>【" + GameInstance.mainChar.name + LanResManager.getLanCommonTextWords("的摊位") + "】</u></a>" + "</font></textformat>";
                  }
            }
         }
         var _loc11_:Array = this.getChannelChats(param1);
         _loc11_.push(_loc10_);
         while(_loc11_.length > Chat.MAX_TALK)
         {
            _loc11_.shift();
         }
         if(param1 != Chat.CHANNEL_ZONGHE)
         {
            if(param1 == 8)
            {
               _loc11_ = this.getChannelChats(Chat.CHANNEL_SHIJIE);
               _loc11_.push(_loc10_);
            }
            _loc11_ = this.getChannelChats(Chat.CHANNEL_ZONGHE);
            _loc11_.push(_loc10_);
            while(_loc11_.length > Chat.MAX_TALK)
            {
               _loc11_.shift();
            }
         }
         return _loc10_;
      }
      
      public function resize(param1:int, param2:int) : void
      {
         this.chatText.resizeTo(param1 - 10,param2);
         this.scrollBar.height = param2;
         this.chatText.textField.scrollV = this.chatText.textField.maxScrollV;
      }
   }
}

