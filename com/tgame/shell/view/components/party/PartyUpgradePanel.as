package com.tgame.shell.view.components.party
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.PartyFlagPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.RslLoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class PartyUpgradePanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var flagID:int;
      
      private var flagLv:int;
      
      private var flag:MovieClip;
      
      private var preBtn:FSimpleButton;
      
      private var flagPage:FTextArea;
      
      private var nextBtn:FSimpleButton;
      
      private var resetColorBtn:SmallButton;
      
      private var tips:FTextArea;
      
      private var startBtn:SecondButton;
      
      private var noChangeStartBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var upgradeTitle:FTextArea;
      
      private var upgradeCount:FTextArea;
      
      public function PartyUpgradePanel()
      {
         var img:Bitmap;
         var v:Vector.<Bitmap>;
         var ft:FTextArea;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 469;
         height = 264;
         titleText = LanResManager.getLanCommonTextWords("帮派升级");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         addChild(img);
         img.name = "ui.party.upgrade.ui";
         img.x = 10;
         img.y = 2;
         v = new Vector.<Bitmap>();
         v.push(img);
         this.DynamicManageImages = v;
         this.tips = new FTextArea();
         with(this.tips)
         {
            x = 318;
            y = 129;
            width = 136;
            height = 60;
            wordWrap = true;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
         }
         this.tips.htmlText = LanResManager.getLanTextWords(this,"请选择您的1级帮旗旗面造型");
         addChild(this.tips);
         ft = new FTextArea();
         with(ft)
         {
            x = 178;
            y = 27;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'4\'>R：<br>G：<br>B：</textformat>";
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 180;
            y = 88;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         ft.htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanTextWords(this,"红值蓝值黄值",[],false) + "</textformat>";
         addChild(ft);
         this.upgradeTitle = new FTextArea();
         with(this.upgradeTitle)
         {
            x = 318;
            y = 32;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         this.upgradeTitle.htmlText = "<textformat leading=\'3\'>" + LanResManager.getLanTextWords(this,"四种令牌",[],false) + "</textformat>";
         addChild(this.upgradeTitle);
         this.upgradeCount = new FTextArea();
         with(this.upgradeCount)
         {
            x = 380;
            y = 32;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'3\'>50000<br>399<br>999<br>999<br>990</textformat>";
         }
         addChild(this.upgradeCount);
         this.preBtn = new FSimpleButton();
         this.preBtn.skin = "previousButton";
         this.preBtn.enabled = false;
         addChild(this.preBtn);
         this.preBtn.x = 53;
         this.preBtn.y = 162;
         this.preBtn.addEventListener(MouseEvent.CLICK,this.onSelectFlag);
         this.flagPage = new FTextArea();
         with(this.flagPage)
         {
            x = 73;
            y = 164;
            textColor = StaticValue.WHITE;
            defaultTextFormat = new TextFormat(null,null,null,null,null,null,null,null,"center");
            width = 36;
            height = 20;
            text = "1/4";
         }
         addChild(this.flagPage);
         this.nextBtn = new FSimpleButton();
         this.nextBtn.skin = "nextButton";
         this.nextBtn.enabled = false;
         addChild(this.nextBtn);
         this.nextBtn.x = 108;
         this.nextBtn.y = 162;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onSelectFlag);
         this.resetColorBtn = new SmallButton();
         this.resetColorBtn.label = LanResManager.getLanTextWords(this,"颜色还原");
         this.resetColorBtn.enabled = false;
         addChild(this.resetColorBtn);
         this.resetColorBtn.x = 197;
         this.resetColorBtn.y = 162;
         this.resetColorBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanTextWords(this,"升级");
         addChild(this.startBtn);
         this.startBtn.x = 60;
         this.startBtn.y = 200;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.noChangeStartBtn = new SecondButton();
         this.noChangeStartBtn.label = LanResManager.getLanTextWords(this,"旗帜不变升级");
         addChild(this.noChangeStartBtn);
         this.noChangeStartBtn.x = (panelWidth - this.noChangeStartBtn.width) / 2;
         this.noChangeStartBtn.y = 200;
         this.noChangeStartBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = panelWidth - this.cancelBtn.width - 60;
         this.cancelBtn.y = 200;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.resetColorBtn:
               break;
            case this.startBtn:
               this.onClose();
               this.$parent.dispatchEvent(new BaseEvent(PartyFlagPanel.UI_PARTYFLAGPANEL_UPGRADE_FLAG,"",[this.flagLv * 10 + this.flagID,0,0,0]));
               break;
            case this.noChangeStartBtn:
               this.onClose();
               this.$parent.dispatchEvent(new BaseEvent(PartyFlagPanel.UI_PARTYFLAGPANEL_UPGRADE_FLAG_NO_CHANGE));
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      private function onSelectFlag(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.preBtn:
               --this.flagID;
               break;
            case this.nextBtn:
               this.flagID += 1;
         }
         RslLoaderManager.lazyLoad(this.onCom,null,[GameConfig.fileBaseFolder + "res/data/mc/flag/lv" + this.flagLv + "flag.swf"]);
         if(this.flagID == 1)
         {
            this.preBtn.enabled = false;
         }
         else
         {
            this.preBtn.enabled = true;
         }
         if(this.flagID == 4)
         {
            this.nextBtn.enabled = false;
         }
         else
         {
            this.nextBtn.enabled = true;
         }
         this.flagPage.text = this.flagID + "/4";
      }
      
      private function onCom() : void
      {
         if(Boolean(this.flag) && Boolean(this.flag.parent))
         {
            this.flag.parent.removeChild(this.flag);
            this.flag.stop();
         }
         this.flag = StaticValue.getMCByClassName("ui.party.flag.lv" + this.flagLv + "." + this.flagID) as MovieClip;
         addChild(this.flag);
         this.flag.x = 10;
         this.flag.y = 28;
      }
      
      public function setFlagLv(param1:int) : void
      {
         this.flagLv = param1;
         this.tips.htmlText = LanResManager.getLanTextWords(this,"帮旗旗帜造型",[param1]);
         this.flagID = 1;
         RslLoaderManager.lazyLoad(this.onCom,null,[GameConfig.fileBaseFolder + "res/data/mc/flag/lv" + this.flagLv + "flag.swf"]);
         this.preBtn.enabled = false;
         this.nextBtn.enabled = true;
      }
      
      public function setUpgradeInfo(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0) : void
      {
         this.upgradeCount.htmlText = "<textformat leading=\'3\'>" + param1 + "<br>" + param2 + "<br>" + param3 + "<br>" + param4 + "<br>" + param5 + "</textformat>";
      }
   }
}

