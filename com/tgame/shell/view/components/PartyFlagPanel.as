package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.list.FListCellRenderer;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.shell.view.components.party.PartyFlagHelpPanel;
   import com.tgame.shell.view.components.party.PartyFlagInstallListRender;
   import com.tgame.shell.view.components.party.PartyUpgradePanel;
   import com.tgame.shell.view.components.party.Party_changeFlagPanel;
   import com.tgame.shell.view.components.party.Party_change_flagNamePanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.RslLoaderManager;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.geom.Point;
   import flash.text.*;
   
   public class PartyFlagPanel extends FPanel
   {
      
      public static var QIZHI_COUNT:int = 19;
      
      public static const UI_PARTYFLAGPANEL_CONTRIBUTE_RENAME_BTN_CLICK:String = "UI_PARTYFLAGPANEL_CONTRIBUTE_RENAME_BTN_CLICK";
      
      public static const UI_PARTYFLAGPANEL_CONTRIBUTE_CHANGE_BTN_CLICK:String = "UI_PARTYFLAGPANEL_CONTRIBUTE_CHANGE_BTN_CLICK";
      
      public static const UI_PARTYFLAGPANEL_CONTRIBUTE_UPGRADE_BTN_CLICK:String = "UI_PARTYFLAGPANEL_CONTRIBUTE_UPGRADE_BTN_CLICK";
      
      public static const UI_PARTYFLAGPANEL_UPGRADE_FLAG:String = "UI_PARTYFLAGPANEL_UPGRADE_FLAG";
      
      public static const UI_PARTYFLAGPANEL_UPGRADE_FLAG_NO_CHANGE:String = "UI_PARTYFLAGPANEL_UPGRADE_FLAG_NO_CHANGE";
      
      public static const UI_PARTYFLAGINSTALLPANEL_FIX_FLAG:String = "UI_PARTYFLAGINSTALLPANEL_FIX_FLAG";
      
      public static const UI_PARTYFLAGINSTALLPANEL_RENOVATE:String = "UI_PARTYFLAGINSTALLPANEL_RENOVATE";
      
      public static const UI_PARTYFLAGPANEL_RENAME_OK:String = "UI_PARTYFLAGPANEL_RENAME_OK";
      
      public static const UI_PARTYFLAGPANEL_CHANGE_FLAG_OK:String = "UI_PARTYFLAGPANEL_CHANGE_FLAG_OK";
      
      public static const UI_PARTYFLAGPANEL_PARTY_CONTRIBUTE_SHOW:String = "UI_PARTYFLAGPANEL_PARTY_CONTRIBUTE_SHOW";
      
      public static const UI_PANRTYFLAGPANEL_HELPPANEL_ISSHOW_HELPPANEL:String = "UI_PANRTYFLAGPANEL_HELPPANEL_ISSHOW_HELPPANEL";
      
      public static const UI_PANELFLAGPANEL_HELPPAEL_OKBTN_CLICK:String = "UI_PANELFLAGPANEL_HELPPAEL_OKBTN_CLICK";
      
      private var flagName:FTextArea;
      
      private var flagLv:FTextArea;
      
      private var flagID:int;
      
      private var mv:MovieClip;
      
      private var partyList:FList;
      
      private var listScroll:FVScorllBar;
      
      private var flagUpgradePanel:PartyUpgradePanel;
      
      private var flagRenamePanel:Party_change_flagNamePanel;
      
      private var changeFlagPanel:Party_changeFlagPanel;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var helpPanel:PartyFlagHelpPanel;
      
      private var renameBtn:SecondButton;
      
      private var changeBtn:SecondButton;
      
      private var upgradeBtn:SecondButton;
      
      private var fixBtn:SecondButton;
      
      private var helpBtn:SecondButton;
      
      private var renovateBtn:SecondButton;
      
      private var contributeBtn:SecondButton;
      
      private var flagCount:FLabel;
      
      private var yiancha:FTextArea;
      
      private var shili:FTextArea;
      
      private var flagTotal:FLabel;
      
      private var purpleBar:Bitmap;
      
      private var greenBar:Bitmap;
      
      private var blueBar:Bitmap;
      
      public function PartyFlagPanel()
      {
         var img:Bitmap;
         var v:Vector.<Bitmap>;
         var tf:TextFormat;
         var lb:FLabel;
         var fb:FLabel;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 680;
         height = 378;
         titleText = LanResManager.getLanCommonTextWords("帮会旗帜");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         img = new Bitmap();
         addChild(img);
         img.name = "ui.party.flag.ui";
         img.x = 10;
         img.y = 2;
         v = new Vector.<Bitmap>();
         v.push(img);
         this.DynamicManageImages = v;
         tf = new TextFormat();
         tf.align = "center";
         lb = new FLabel();
         with(lb)
         {
            x = 26;
            y = 30;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("帮旗名称") + ":";
         }
         addChild(lb);
         this.flagName = new FTextArea();
         with(this.flagName)
         {
            x = 18;
            y = 45;
            width = 127;
            height = 20;
            defaultTextFormat = tf;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
         }
         addChild(this.flagName);
         lb = new FLabel();
         with(lb)
         {
            x = 26;
            y = 68;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("帮旗等级") + ":";
         }
         addChild(lb);
         this.flagLv = new FTextArea();
         with(this.flagLv)
         {
            x = 18;
            y = 85;
            width = 127;
            height = 20;
            defaultTextFormat = tf;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
         }
         addChild(this.flagLv);
         lb = new FLabel();
         with(lb)
         {
            x = 25;
            y = 243;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("本帮已安插帮旗");
         }
         addChild(lb);
         this.yiancha = new FTextArea();
         with(this.yiancha)
         {
            x = 18;
            y = 256;
            width = 127;
            height = 20;
            defaultTextFormat = tf;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = "1";
         }
         addChild(this.yiancha);
         this.flagCount = new FLabel();
         with(this.flagCount)
         {
            x = 25;
            y = 280;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("最大可安插X面帮旗");
         }
         addChild(this.flagCount);
         this.shili = new FTextArea();
         with(this.shili)
         {
            x = 245;
            y = 33;
            width = 423;
            height = 20;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
         }
         addChild(this.shili);
         this.flagTotal = new FLabel();
         with(this.flagTotal)
         {
            x = 194;
            y = 57;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = QIZHI_COUNT + LanResManager.getLanTextWords(this,"面");
         }
         addChild(this.flagTotal);
         this.purpleBar = StaticValue.getBitmapByClassName("ui.party.flag.bar.purple");
         addChild(this.purpleBar);
         this.purpleBar.x = 248;
         this.purpleBar.y = 57;
         this.greenBar = StaticValue.getBitmapByClassName("ui.party.flag.bar.green");
         addChild(this.greenBar);
         this.greenBar.x = 248;
         this.greenBar.y = 57;
         this.blueBar = StaticValue.getBitmapByClassName("ui.party.flag.bar.blue");
         addChild(this.blueBar);
         this.blueBar.x = 248;
         this.blueBar.y = 57;
         fb = new FLabel();
         with(fb)
         {
            x = 196;
            y = 100;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("地图名字");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            x = 283;
            y = 100;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("坐标");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            x = 350;
            y = 100;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("旗帜名称");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            x = 430;
            y = 100;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("等级");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            x = 483;
            y = 100;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("所属帮会");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            x = 583;
            y = 100;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("帮旗生命");
         }
         addChild(fb);
         this.partyList = new FList();
         this.partyList.skin = "list";
         this.partyList.itemRenderer = new PartyFlagInstallListRender();
         this.partyList.listWidth = 474;
         addChild(this.partyList);
         this.partyList.x = 176;
         this.partyList.y = 122;
         this.partyList.addEventListener(MouseEvent.CLICK,this.onList);
         this.partyList.addEventListener(MouseEvent.MOUSE_OVER,this.onListMouse);
         this.partyList.addEventListener(MouseEvent.MOUSE_OUT,this.onListMouse);
         this.listScroll = new FVScorllBar(this.partyList,180);
         addChild(this.listScroll);
         this.listScroll.x = 650;
         this.listScroll.y = 122;
         this.helpBtn = new SecondButton();
         with(this.helpBtn)
         {
            label = LanResManager.getLanCommonTextWords("帮助信息");
            x = 135;
            y = 315;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         addChild(this.helpBtn);
         this.contributeBtn = new SecondButton();
         this.contributeBtn.visible = false;
         with(this.contributeBtn)
         {
            label = LanResManager.getLanCommonTextWords("帮会贡献");
            x = 135;
            y = 315;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         addChild(this.contributeBtn);
         this.renameBtn = new SecondButton();
         with(this.renameBtn)
         {
            label = LanResManager.getLanCommonTextWords("帮旗改名");
            x = 208;
            y = 315;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         addChild(this.renameBtn);
         this.changeBtn = new SecondButton();
         with(this.changeBtn)
         {
            label = LanResManager.getLanCommonTextWords("帮旗更换");
            x = 285;
            y = 315;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         addChild(this.changeBtn);
         this.upgradeBtn = new SecondButton();
         with(this.upgradeBtn)
         {
            label = LanResManager.getLanCommonTextWords("帮旗升级");
            x = 360;
            y = 315;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         addChild(this.upgradeBtn);
         this.fixBtn = new SecondButton();
         with(this.fixBtn)
         {
            label = LanResManager.getLanCommonTextWords("安插本帮帮旗");
            x = 438;
            y = 315;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         addChild(this.fixBtn);
         this.renovateBtn = new SecondButton();
         this.renovateBtn.enabled = false;
         this.renovateBtn.visible = false;
         with(this.renovateBtn)
         {
            label = LanResManager.getLanCommonTextWords("修复帮旗血量");
            x = 538;
            y = 315;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         addChild(this.renovateBtn);
      }
      
      private function onList(param1:MouseEvent) : void
      {
         if(this.partyList.selectItem.flagID == "")
         {
            this.fixBtn.enabled = true;
            this.renovateBtn.enabled = false;
         }
         else
         {
            this.fixBtn.enabled = false;
            this.renovateBtn.enabled = true;
         }
      }
      
      private function onListMouse(param1:MouseEvent) : void
      {
         var _loc2_:FListCellRenderer = null;
         var _loc3_:Object = null;
         var _loc4_:Point = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               Tools.currentStage.addChild(this.tipCanvas);
               this.tipCanvas.visible = false;
               this.partyList.addEventListener(MouseEvent.MOUSE_MOVE,this.onListMouse);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(param1.target as TextField)
               {
                  _loc2_ = (param1.target as TextField).parent as FListCellRenderer;
                  _loc3_ = _loc2_.data;
                  if(_loc3_.party == "")
                  {
                     this.tipCanvas.visible = false;
                  }
                  else
                  {
                     this.tip.text = _loc3_.party;
                     this.tipCanvas.width = this.tip.width + 4;
                     this.tipCanvas.height = this.tip.height + 4;
                     this.tipCanvas.visible = true;
                     _loc4_ = _loc2_.parent.localToGlobal(new Point(_loc2_.x,_loc2_.y));
                     this.tipCanvas.x = _loc4_.x - this.tipCanvas.width;
                     this.tipCanvas.y = _loc4_.y;
                  }
               }
               else
               {
                  this.tipCanvas.visible = false;
               }
               break;
            case MouseEvent.MOUSE_OUT:
               this.partyList.removeEventListener(MouseEvent.MOUSE_MOVE,this.onListMouse);
               Tools.currentStage.removeChild(this.tipCanvas);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.renameBtn:
               dispatchEvent(new BaseEvent(UI_PARTYFLAGPANEL_CONTRIBUTE_RENAME_BTN_CLICK));
               break;
            case this.changeBtn:
               this.showChangeFlagPanel(1);
               dispatchEvent(new BaseEvent(UI_PARTYFLAGPANEL_CONTRIBUTE_CHANGE_BTN_CLICK));
               break;
            case this.upgradeBtn:
               dispatchEvent(new BaseEvent(UI_PARTYFLAGPANEL_CONTRIBUTE_UPGRADE_BTN_CLICK));
               break;
            case this.fixBtn:
               dispatchEvent(new BaseEvent(UI_PARTYFLAGINSTALLPANEL_FIX_FLAG,"",int(this.partyList.selectItem.coordinateID)));
               break;
            case this.helpBtn:
               this.showHelpPanel();
               break;
            case this.renovateBtn:
               dispatchEvent(new BaseEvent(UI_PARTYFLAGINSTALLPANEL_RENOVATE,"",int(this.partyList.selectItem.coordinateID)));
               break;
            case this.contributeBtn:
               dispatchEvent(new BaseEvent(UI_PARTYFLAGPANEL_PARTY_CONTRIBUTE_SHOW));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setListData(param1:XML) : void
      {
         this.partyList.dataProvider = param1;
         if(param1.children().length() > 0)
         {
            this.partyList.setSelectItemByIndex(0);
         }
         this.listScroll.update();
      }
      
      public function showHelpPanel() : void
      {
         if(!this.helpPanel)
         {
            this.helpPanel = new PartyFlagHelpPanel();
            this.helpPanel.$parent = this;
            UIEventsRegisterManager.registerUI(this.helpPanel,PartyFlagHelpPanel);
         }
         GameInstance.uiInstance.uiContainer.addChild(this.helpPanel);
         this.helpPanel.x = (GameConfig.sceneWidth - this.helpPanel.width) / 2;
         this.helpPanel.y = (GameConfig.sceneHeight - this.helpPanel.height) / 2;
      }
      
      public function setIsAtuoShowHelpPanel(param1:Boolean) : void
      {
         if(!this.helpPanel)
         {
            this.helpPanel = new PartyFlagHelpPanel();
            this.helpPanel.$parent = this;
            UIEventsRegisterManager.registerUI(this.helpPanel,PartyFlagHelpPanel);
         }
         this.helpPanel.checkBox.selectState = param1;
      }
      
      public function setInfo(param1:String, param2:int, param3:int) : void
      {
         var onCom:Function = null;
         var $flagName:String = param1;
         var $flagLv:int = param2;
         var $flagID:int = param3;
         onCom = function():void
         {
            if(Boolean(mv) && Boolean(mv.parent))
            {
               mv.parent.removeChild(mv);
               mv.stop();
            }
            mv = StaticValue.getMCByClassName(StaticValue.conversionFlagID(flagID)) as MovieClip;
            addChild(mv);
            mv.x = 29;
            mv.y = 115;
         };
         this.flagName.text = $flagName;
         this.flagLv.text = $flagLv + LanResManager.getLanCommonTextWords("等级");
         if(this.flagID == $flagID && Boolean(this.mv))
         {
            if(Boolean(this.mv) && Boolean(this.mv.parent))
            {
               this.mv.parent.removeChild(this.mv);
               this.mv.stop();
            }
            addChild(this.mv);
            this.mv.play();
            this.mv.x = 29;
            this.mv.y = 115;
            return;
         }
         this.flagID = $flagID;
         if(Boolean(this.mv) && Boolean(this.mv.parent))
         {
            this.mv.parent.removeChild(this.mv);
            this.mv.stop();
         }
         RslLoaderManager.lazyLoad(onCom,null,GameConfig.fileBaseFolder + "res/data/mc/flag/lv1flag.swf",GameConfig.fileBaseFolder + "res/data/mc/flag/lv2flag.swf",GameConfig.fileBaseFolder + "res/data/mc/flag/lv3flag.swf");
      }
      
      public function setFlagID(param1:int) : void
      {
         var onCom:Function = null;
         var $flagID:int = param1;
         onCom = function():void
         {
            if(Boolean(mv) && Boolean(mv.parent))
            {
               mv.parent.removeChild(mv);
               mv.stop();
            }
            mv = StaticValue.getMCByClassName(StaticValue.conversionFlagID(flagID)) as MovieClip;
            addChild(mv);
            mv.x = 29;
            mv.y = 29;
         };
         this.flagID = $flagID;
         if(Boolean(this.mv) && Boolean(this.mv.parent))
         {
            this.mv.parent.removeChild(this.mv);
            this.mv.stop();
         }
         RslLoaderManager.lazyLoad(onCom,null,GameConfig.fileBaseFolder + "res/data/mc/flag/lv1flag.swf",GameConfig.fileBaseFolder + "res/data/mc/flag/lv2flag.swf",GameConfig.fileBaseFolder + "res/data/mc/flag/lv3flag.swf");
      }
      
      public function setFlagName(param1:String) : void
      {
         this.flagName.text = param1;
      }
      
      public function setYiAnCha(param1:String) : void
      {
         this.yiancha.text = param1;
      }
      
      public function setAnChaShuLiang(param1:int) : void
      {
         this.flagCount.text = LanResManager.getLanTextWords(this,"最大安插帮旗",[param1]);
      }
      
      public function showFlagUpgradePanel(param1:int, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0, param6:int = 0) : void
      {
         if(!this.flagUpgradePanel)
         {
            this.flagUpgradePanel = new PartyUpgradePanel();
            this.flagUpgradePanel.$parent = this;
         }
         this.flagUpgradePanel.visible = true;
         this.flagUpgradePanel.setFlagLv(param1);
         this.flagUpgradePanel.setUpgradeInfo(param2,param3,param4,param5,param6);
         GameInstance.uiInstance.uiContainer.addChild(this.flagUpgradePanel);
         this.flagUpgradePanel.x = (GameConfig.sceneWidth - this.flagUpgradePanel.panelWidth) / 2;
         this.flagUpgradePanel.y = (GameConfig.sceneHeight - this.flagUpgradePanel.panelHeight) / 2;
      }
      
      public function showFlagRenamePanel() : void
      {
         if(!this.flagRenamePanel)
         {
            this.flagRenamePanel = new Party_change_flagNamePanel();
            this.flagRenamePanel.$parent = this;
         }
         this.flagRenamePanel.visible = true;
         POPWindowManager.showWindow(this.flagRenamePanel);
      }
      
      public function showChangeFlagPanel(param1:int) : void
      {
         if(!this.changeFlagPanel)
         {
            this.changeFlagPanel = new Party_changeFlagPanel();
            this.changeFlagPanel.$parent = this;
         }
         this.changeFlagPanel.visible = true;
         this.changeFlagPanel.setLv(param1);
         GameInstance.uiInstance.uiContainer.addChild(this.changeFlagPanel);
         this.changeFlagPanel.x = (GameConfig.sceneWidth - this.changeFlagPanel.panelWidth) / 2;
         this.changeFlagPanel.y = (GameConfig.sceneHeight - this.changeFlagPanel.panelHeight) / 2;
      }
      
      public function setShiLiDuibi(param1:String, param2:int, param3:String, param4:int) : void
      {
         var _loc5_:String = "";
         if(param2 != 0)
         {
            _loc5_ += "<font color=\'" + StaticValue.PURPLE_HTML + "\'>1:" + param1 + "(" + param2 + LanResManager.getLanTextWords(this,"面") + ")</font>";
         }
         else
         {
            _loc5_ += "<font color=\'" + StaticValue.PURPLE_HTML + "\'>1:" + LanResManager.getLanCommonTextWords("空缺") + "(" + param2 + LanResManager.getLanTextWords(this,"面") + ")</font>";
         }
         if(param4 != 0)
         {
            _loc5_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>2:" + param3 + "(" + param4 + LanResManager.getLanTextWords(this,"面") + ")</font>";
         }
         else
         {
            _loc5_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>2:" + LanResManager.getLanCommonTextWords("空缺") + "(" + param4 + LanResManager.getLanTextWords(this,"面") + ")</font>";
         }
         _loc5_ += "<font color=\'" + StaticValue.BLUE_HTML + "\'>3:" + LanResManager.getLanCommonTextWords("其他") + "(" + (QIZHI_COUNT - param2 - param4) + LanResManager.getLanTextWords(this,"面") + ")</font>";
         this.shili.htmlText = _loc5_;
         var _loc6_:Number = param2 == 0 ? 0 : int(param2 / QIZHI_COUNT * 100) / 100;
         var _loc7_:Number = param4 == 0 ? 0 : int(param4 / QIZHI_COUNT * 100) / 100;
         var _loc8_:Number = 1 - _loc6_ - _loc7_;
         if(param2 == 0)
         {
            this.purpleBar.width = 1;
         }
         else
         {
            this.purpleBar.width = 400 * _loc6_;
         }
         if(param4 == 0)
         {
            this.greenBar.width = 1;
         }
         else
         {
            this.greenBar.width = 400 * _loc7_;
         }
         this.blueBar.width = 400 * _loc8_;
         this.greenBar.x = this.purpleBar.x + this.purpleBar.width;
         this.blueBar.x = this.greenBar.x + this.greenBar.width;
      }
   }
}

