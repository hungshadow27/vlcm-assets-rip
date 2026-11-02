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
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class Party_changeFlagPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var flag:MovieClip;
      
      private var lv1Flag:MovieClip;
      
      private var lv2Flag:MovieClip;
      
      private var lv3Flag:MovieClip;
      
      private var lv1ID:int;
      
      private var lv2ID:int;
      
      private var lv3ID:int;
      
      private var partyLv:int;
      
      private var flag1Container:Sprite;
      
      private var flag2Container:Sprite;
      
      private var flag3Container:Sprite;
      
      private var tips:FTextArea;
      
      private var okBtn:SecondButton;
      
      private var cnacelBtn:SecondButton;
      
      private var preBtn_1:FSimpleButton;
      
      private var flagPage_1:FTextArea;
      
      private var nextBtn_1:FSimpleButton;
      
      private var preBtn_2:FSimpleButton;
      
      private var flagPage_2:FTextArea;
      
      private var nextBtn_2:FSimpleButton;
      
      private var preBtn_3:FSimpleButton;
      
      private var flagPage_3:FTextArea;
      
      private var nextBtn_3:FSimpleButton;
      
      private var loadBuff:LoadBuffer;
      
      public function Party_changeFlagPanel()
      {
         var img:Bitmap;
         var v:Vector.<Bitmap>;
         var ft:FTextArea;
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddStage);
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 471;
         height = 428;
         titleText = LanResManager.getLanCommonTextWords("帮旗更换");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         addChild(img);
         img.name = "ui.party.flag.change.ui";
         img.x = 10;
         img.y = 2;
         v = new Vector.<Bitmap>();
         v.push(img);
         this.DynamicManageImages = v;
         ft = new FTextArea();
         with(ft)
         {
            x = 188;
            y = 35;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'3\'>R：<br>G：<br>B：</textformat>";
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 188;
            y = 95;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         ft.htmlText = "<textformat leading=\'5\'>" + LanResManager.getLanTextWords(this,"颜色标题",[],false) + "</textformat>";
         addChild(ft);
         this.tips = new FTextArea();
         with(this.tips)
         {
            x = 325;
            y = 54;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = "";
         }
         LanResManager.updateDobj_lanOffset(this,LanResManager.getLanCommonTextWords("等级描述"),this.tips);
         addChild(this.tips);
         this.flag1Container = new Sprite();
         addChild(this.flag1Container);
         this.flag1Container.x = 15;
         this.flag1Container.y = 194;
         this.flag1Container.addEventListener(MouseEvent.CLICK,this.selectLv);
         this.flag2Container = new Sprite();
         addChild(this.flag2Container);
         this.flag2Container.x = 164;
         this.flag2Container.y = 194;
         this.flag2Container.addEventListener(MouseEvent.CLICK,this.selectLv);
         this.flag3Container = new Sprite();
         addChild(this.flag3Container);
         this.flag3Container.x = 313;
         this.flag3Container.y = 194;
         this.flag3Container.addEventListener(MouseEvent.CLICK,this.selectLv);
         this.preBtn_1 = new FSimpleButton();
         this.preBtn_1.skin = "previousButton";
         this.preBtn_1.enabled = false;
         addChild(this.preBtn_1);
         this.preBtn_1.x = 50;
         this.preBtn_1.y = 324;
         this.preBtn_1.addEventListener(MouseEvent.CLICK,this.onSelectFlag1);
         this.flagPage_1 = new FTextArea();
         with(this.flagPage_1)
         {
            x = 70;
            y = 324;
            textColor = StaticValue.WHITE;
            defaultTextFormat = new TextFormat(null,null,null,null,null,null,null,null,"center");
            width = 36;
            height = 20;
            text = "1/4";
         }
         addChild(this.flagPage_1);
         this.nextBtn_1 = new FSimpleButton();
         this.nextBtn_1.skin = "nextButton";
         this.nextBtn_1.enabled = false;
         addChild(this.nextBtn_1);
         this.nextBtn_1.x = 105;
         this.nextBtn_1.y = 324;
         this.nextBtn_1.addEventListener(MouseEvent.CLICK,this.onSelectFlag1);
         this.preBtn_2 = new FSimpleButton();
         this.preBtn_2.skin = "previousButton";
         this.preBtn_2.enabled = false;
         addChild(this.preBtn_2);
         this.preBtn_2.x = 203;
         this.preBtn_2.y = 324;
         this.preBtn_2.addEventListener(MouseEvent.CLICK,this.onSelectFlag2);
         this.flagPage_2 = new FTextArea();
         with(this.flagPage_2)
         {
            x = 223;
            y = 324;
            textColor = StaticValue.WHITE;
            defaultTextFormat = new TextFormat(null,null,null,null,null,null,null,null,"center");
            width = 36;
            height = 20;
            text = "1/4";
         }
         addChild(this.flagPage_2);
         this.nextBtn_2 = new FSimpleButton();
         this.nextBtn_2.skin = "nextButton";
         this.nextBtn_2.enabled = false;
         addChild(this.nextBtn_2);
         this.nextBtn_2.x = 258;
         this.nextBtn_2.y = 324;
         this.nextBtn_2.addEventListener(MouseEvent.CLICK,this.onSelectFlag2);
         this.preBtn_3 = new FSimpleButton();
         this.preBtn_3.skin = "previousButton";
         this.preBtn_3.enabled = false;
         addChild(this.preBtn_3);
         this.preBtn_3.x = 354;
         this.preBtn_3.y = 324;
         this.preBtn_3.addEventListener(MouseEvent.CLICK,this.onSelectFlag3);
         this.flagPage_3 = new FTextArea();
         with(this.flagPage_3)
         {
            x = 374;
            y = 324;
            textColor = StaticValue.WHITE;
            defaultTextFormat = new TextFormat(null,null,null,null,null,null,null,null,"center");
            width = 36;
            height = 20;
            text = "1/4";
         }
         addChild(this.flagPage_3);
         this.nextBtn_3 = new FSimpleButton();
         this.nextBtn_3.skin = "nextButton";
         this.nextBtn_3.enabled = false;
         addChild(this.nextBtn_3);
         this.nextBtn_3.x = 409;
         this.nextBtn_3.y = 324;
         this.nextBtn_3.addEventListener(MouseEvent.CLICK,this.onSelectFlag3);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("更换");
         addChild(this.okBtn);
         this.okBtn.x = 100;
         this.okBtn.y = 365;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cnacelBtn = new SecondButton();
         this.cnacelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cnacelBtn);
         this.cnacelBtn.x = panelWidth - this.cnacelBtn.width - 100;
         this.cnacelBtn.y = 365;
         this.cnacelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
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
         var _loc2_:int = 0;
         switch(param1.target)
         {
            case this.okBtn:
               _loc2_ = this.partyLv * 10;
               if(this.partyLv == 1)
               {
                  _loc2_ += this.lv1ID;
               }
               if(this.partyLv == 2)
               {
                  _loc2_ += this.lv2ID;
               }
               if(this.partyLv == 3)
               {
                  _loc2_ += this.lv3ID;
               }
               this.$parent.dispatchEvent(new BaseEvent(PartyFlagPanel.UI_PARTYFLAGPANEL_CHANGE_FLAG_OK,"",[_loc2_,0,0,0]));
         }
         this.onClose();
      }
      
      private function onAddStage(param1:Event) : void
      {
         this.loadBuff = LoadBuffer.show(this);
         RslLoaderManager.lazyLoad(this.onCom,null,GameConfig.fileBaseFolder + "res/data/mc/flag/lv1flag.swf",GameConfig.fileBaseFolder + "res/data/mc/flag/lv2flag.swf",GameConfig.fileBaseFolder + "res/data/mc/flag/lv3flag.swf");
      }
      
      private function onCom() : void
      {
         this.loadBuff.close();
         if(Boolean(this.lv1Flag) && Boolean(this.lv1Flag.parent))
         {
            this.lv1Flag.parent.removeChild(this.lv1Flag);
            this.lv1Flag.stop();
         }
         this.lv1Flag = StaticValue.getMCByClassName("ui.party.flag.lv1.1") as MovieClip;
         this.flag1Container.addChild(this.lv1Flag);
         if(Boolean(this.lv2Flag) && Boolean(this.lv2Flag.parent))
         {
            this.lv2Flag.parent.removeChild(this.lv2Flag);
            this.lv2Flag.stop();
         }
         this.lv2Flag = StaticValue.getMCByClassName("ui.party.flag.lv2.1") as MovieClip;
         this.flag2Container.addChild(this.lv2Flag);
         if(Boolean(this.lv3Flag) && Boolean(this.lv3Flag.parent))
         {
            this.lv3Flag.parent.removeChild(this.lv3Flag);
            this.lv3Flag.stop();
         }
         this.lv3Flag = StaticValue.getMCByClassName("ui.party.flag.lv3.1") as MovieClip;
         this.flag3Container.addChild(this.lv3Flag);
         this.preBtn_1.enabled = false;
         this.flagPage_1.text = "1/4";
         this.nextBtn_1.enabled = true;
         this.preBtn_2.enabled = false;
         this.flagPage_2.text = "1/4";
         this.nextBtn_2.enabled = true;
         this.preBtn_3.enabled = false;
         this.flagPage_3.text = "1/4";
         this.nextBtn_3.enabled = true;
         this.lv1ID = this.lv2ID = this.lv3ID = 1;
      }
      
      private function selectLv(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         this.flag1Container.graphics.clear();
         this.flag2Container.graphics.clear();
         this.flag3Container.graphics.clear();
         with((e.currentTarget as Sprite).graphics)
         {
            lineStyle(2,StaticValue.YELLOW);
            beginFill(0,0);
            drawRect(0,0,142,122);
            endFill();
         }
         if(Boolean(this.flag) && Boolean(this.flag.parent))
         {
            this.flag.parent.removeChild(this.flag);
            this.flag.stop();
         }
         switch(e.currentTarget)
         {
            case this.flag1Container:
               this.partyLv = 1;
               this.flag = StaticValue.getMCByClassName("ui.party.flag.lv1." + this.lv1ID) as MovieClip;
               break;
            case this.flag2Container:
               this.partyLv = 2;
               this.flag = StaticValue.getMCByClassName("ui.party.flag.lv2." + this.lv2ID) as MovieClip;
               break;
            case this.flag3Container:
               this.partyLv = 3;
               this.flag = StaticValue.getMCByClassName("ui.party.flag.lv3." + this.lv3ID) as MovieClip;
         }
         addChild(this.flag);
         this.flag.x = 6;
         this.flag.y = 34;
      }
      
      private function onSelectFlag1(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.preBtn_1:
               --this.lv1ID;
               break;
            case this.nextBtn_1:
               this.lv1ID += 1;
         }
         if(Boolean(this.lv1Flag) && Boolean(this.lv1Flag.parent))
         {
            this.lv1Flag.parent.removeChild(this.lv1Flag);
            this.lv1Flag.stop();
         }
         if(this.partyLv == 1)
         {
            if(Boolean(this.flag) && Boolean(this.flag.parent))
            {
               this.flag.parent.removeChild(this.flag);
            }
            this.flag = StaticValue.getMCByClassName("ui.party.flag.lv1." + this.lv1ID) as MovieClip;
            addChild(this.flag);
            this.flag.x = 6;
            this.flag.y = 34;
         }
         this.lv1Flag = StaticValue.getMCByClassName("ui.party.flag.lv1." + this.lv1ID) as MovieClip;
         this.flag1Container.addChild(this.lv1Flag);
         if(this.lv1ID == 1)
         {
            this.preBtn_1.enabled = false;
         }
         else
         {
            this.preBtn_1.enabled = true;
         }
         if(this.lv1ID == 4)
         {
            this.nextBtn_1.enabled = false;
         }
         else
         {
            this.nextBtn_1.enabled = true;
         }
         this.flagPage_1.text = this.lv1ID + "/4";
      }
      
      private function onSelectFlag2(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.preBtn_2:
               --this.lv2ID;
               break;
            case this.nextBtn_2:
               this.lv2ID += 1;
         }
         if(Boolean(this.lv2Flag) && Boolean(this.lv2Flag.parent))
         {
            this.lv2Flag.parent.removeChild(this.lv2Flag);
            this.lv2Flag.stop();
         }
         if(this.partyLv == 2)
         {
            if(Boolean(this.flag) && Boolean(this.flag.parent))
            {
               this.flag.parent.removeChild(this.flag);
            }
            this.flag = StaticValue.getMCByClassName("ui.party.flag.lv2." + this.lv2ID) as MovieClip;
            addChild(this.flag);
            this.flag.x = 6;
            this.flag.y = 34;
         }
         this.lv2Flag = StaticValue.getMCByClassName("ui.party.flag.lv2." + this.lv2ID) as MovieClip;
         this.flag2Container.addChild(this.lv2Flag);
         if(this.lv2ID == 1)
         {
            this.preBtn_2.enabled = false;
         }
         else
         {
            this.preBtn_2.enabled = true;
         }
         if(this.lv2ID == 4)
         {
            this.nextBtn_2.enabled = false;
         }
         else
         {
            this.nextBtn_2.enabled = true;
         }
         this.flagPage_2.text = this.lv2ID + "/4";
      }
      
      private function onSelectFlag3(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.preBtn_3:
               --this.lv3ID;
               break;
            case this.nextBtn_3:
               this.lv3ID += 1;
         }
         if(Boolean(this.lv3Flag) && Boolean(this.lv3Flag.parent))
         {
            this.lv3Flag.parent.removeChild(this.lv3Flag);
            this.lv3Flag.stop();
         }
         if(this.partyLv == 3)
         {
            if(Boolean(this.flag) && Boolean(this.flag.parent))
            {
               this.flag.parent.removeChild(this.flag);
            }
            this.flag = StaticValue.getMCByClassName("ui.party.flag.lv3." + this.lv3ID) as MovieClip;
            addChild(this.flag);
            this.flag.x = 6;
            this.flag.y = 34;
         }
         this.lv3Flag = StaticValue.getMCByClassName("ui.party.flag.lv3." + this.lv3ID) as MovieClip;
         this.flag3Container.addChild(this.lv3Flag);
         if(this.lv3ID == 1)
         {
            this.preBtn_3.enabled = false;
         }
         else
         {
            this.preBtn_3.enabled = true;
         }
         if(this.lv3ID == 4)
         {
            this.nextBtn_3.enabled = false;
         }
         else
         {
            this.nextBtn_3.enabled = true;
         }
         this.flagPage_3.text = this.lv3ID + "/4";
      }
      
      public function setLv(param1:int) : void
      {
         var value:int = param1;
         this.partyLv = value;
         this.tips.htmlText = LanResManager.getLanTextWords(this,"等级描述",[value,value]);
         this.flag1Container.graphics.clear();
         this.flag2Container.graphics.clear();
         this.flag3Container.graphics.clear();
         switch(value)
         {
            case 1:
               with(this.flag1Container.graphics)
               {
                  
                  lineStyle(2,StaticValue.YELLOW);
                  beginFill(0,0);
                  drawRect(0,0,142,122);
                  endFill();
               }
               break;
            case 2:
               with(this.flag2Container.graphics)
               {
                  
                  lineStyle(2,StaticValue.YELLOW);
                  beginFill(0,0);
                  drawRect(0,0,142,122);
                  endFill();
               }
               break;
            case 3:
               with(this.flag3Container.graphics)
               {
                  
                  lineStyle(2,StaticValue.YELLOW);
                  beginFill(0,0);
                  drawRect(0,0,142,122);
                  endFill();
               }
         }
      }
   }
}

