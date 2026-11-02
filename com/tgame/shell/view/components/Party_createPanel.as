package com.tgame.shell.view.components
{
   import com.fireice.alert.FAlert;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.manager.TextManager;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.RslLoaderManager;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class Party_createPanel extends FPanel
   {
      
      public static const UI_PARTYPANEL_CREATE_PARTY_CHECK_NAME:String = "UI_PARTYPANEL_CREATE_PARTY_CHECK_NAME";
      
      public static const UI_PARTYPANEL_CREATE_PARTY_CREATE:String = "UI_PARTYPANEL_CREATE_PARTY_CREATE";
      
      private var partyNameInput:FTextInput;
      
      private var checkBtn:SmallButton;
      
      private var partyAfficheInput:FTextInput;
      
      private var flagNameInput:FTextInput;
      
      private var preBtn:FSimpleButton;
      
      private var flagPage:FTextArea;
      
      private var nextBtn:FSimpleButton;
      
      private var resetColorBtn:SmallButton;
      
      private var createBtn:SecondButton;
      
      private var flagID:int = 1;
      
      private var mv:MovieClip;
      
      public function Party_createPanel()
      {
         var v:Vector.<Bitmap>;
         var ft:FTextArea;
         var img:Bitmap = null;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 471;
         height = 428;
         titleText = LanResManager.getLanCommonTextWords("帮会创建");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         addChild(img);
         img.name = "ui.party.create.ui";
         img.x = 10;
         img.y = 2;
         RslLoaderManager.lazyLoad(this.onCom,null,[GameConfig.fileBaseFolder + "res/data/mc/flag/lv1flag.swf"]);
         v = new Vector.<Bitmap>();
         v.push(img);
         this.DynamicManageImages = v;
         ft = new FTextArea();
         with(ft)
         {
            x = 20;
            y = 15;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("输入帮会名称") + "：\n" + LanResManager.getLanCommonTextWords("输入帮会公告") + "：";
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 32;
            y = 207;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("输入帮旗名称") + "：";
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 15;
            y = 268;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("初始帮旗为一级") + "\n【" + LanResManager.getLanCommonTextWords("可不断升级") + "】\n" + LanResManager.getLanTextWords(this,"帮旗加成");
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 334;
            y = 254;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'5\'>" + LanResManager.getLanTextWords(this,"帮旗颜色") + "：</textformat>";
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 12;
            y = 366;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"建立帮会条件");
         }
         addChild(ft);
         this.partyNameInput = new FTextInput();
         with(this.partyNameInput)
         {
            x = 115;
            y = 13;
            width = 240;
            height = 20;
            textColor = StaticValue.WHITE;
            text = LanResManager.getLanCommonTextWords("帮会名称2-6个字");
         }
         this.partyNameInput.setMaxChars(12);
         addChild(this.partyNameInput);
         this.partyNameInput.addEventListener(FocusEvent.FOCUS_IN,this.onFocus);
         this.partyNameInput.addEventListener(FocusEvent.FOCUS_OUT,this.onFocus);
         this.checkBtn = new SmallButton();
         this.checkBtn.label = LanResManager.getLanCommonTextWords("检测重名");
         addChild(this.checkBtn);
         this.checkBtn.x = 365;
         this.checkBtn.y = 13;
         this.checkBtn.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.partyAfficheInput = new FTextInput();
         with(this.partyAfficheInput)
         {
            x = 23;
            y = 53;
            width = 427;
            height = 113;
            textColor = StaticValue.WHITE;
            text = LanResManager.getLanCommonTextWords("在此输入公告");
         }
         addChild(this.partyAfficheInput);
         this.partyAfficheInput.addEventListener(FocusEvent.FOCUS_IN,this.onFocus);
         this.partyAfficheInput.addEventListener(FocusEvent.FOCUS_OUT,this.onFocus);
         this.partyAfficheInput.addEventListener(Event.CHANGE,this.onpartyAffichelChange);
         this.flagNameInput = new FTextInput();
         with(this.flagNameInput)
         {
            x = 37;
            y = 228;
            width = 103;
            height = 20;
            textColor = StaticValue.WHITE;
            text = LanResManager.getLanCommonTextWords("帮旗名字2-6字");
         }
         this.flagNameInput.setMaxChars(12);
         addChild(this.flagNameInput);
         this.flagNameInput.addEventListener(FocusEvent.FOCUS_IN,this.onFocus);
         this.flagNameInput.addEventListener(FocusEvent.FOCUS_OUT,this.onFocus);
         this.preBtn = new FSimpleButton();
         this.preBtn.skin = "previousButton";
         this.preBtn.enabled = false;
         addChild(this.preBtn);
         this.preBtn.x = 195;
         this.preBtn.y = 326;
         this.preBtn.addEventListener(MouseEvent.CLICK,this.onSelectFlag);
         this.flagPage = new FTextArea();
         with(this.flagPage)
         {
            x = 215;
            y = 328;
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
         this.nextBtn.x = 250;
         this.nextBtn.y = 326;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onSelectFlag);
         this.resetColorBtn = new SmallButton();
         this.resetColorBtn.label = LanResManager.getLanCommonTextWords("颜色还原");
         this.resetColorBtn.enabled = false;
         addChild(this.resetColorBtn);
         this.resetColorBtn.x = 350;
         this.resetColorBtn.y = 326;
         this.resetColorBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.createBtn = new SecondButton();
         this.createBtn.label = LanResManager.getLanCommonTextWords("创建");
         addChild(this.createBtn);
         this.createBtn.x = (panelWidth - this.createBtn.width) / 2 + 180;
         this.createBtn.y = 364;
         this.createBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onFocus(param1:FocusEvent) : void
      {
         if(param1.type == FocusEvent.FOCUS_IN)
         {
            switch(param1.target)
            {
               case this.partyNameInput:
                  this.partyNameInput.text = "";
                  break;
               case this.flagNameInput:
                  this.flagNameInput.text = "";
                  break;
               case this.partyAfficheInput:
                  this.partyAfficheInput.text = "";
            }
         }
         else if(param1.type == FocusEvent.FOCUS_OUT)
         {
            switch(param1.target)
            {
               case this.partyNameInput:
                  if(this.partyNameInput.text == "")
                  {
                     this.partyNameInput.text = LanResManager.getLanCommonTextWords("帮会名称2-6个字");
                  }
                  break;
               case this.flagNameInput:
                  if(this.flagNameInput.text == "")
                  {
                     this.flagNameInput.text = LanResManager.getLanCommonTextWords("帮旗名字2-6字");
                  }
                  break;
               case this.partyAfficheInput:
                  if(this.partyAfficheInput.text == "")
                  {
                     this.partyAfficheInput.text = LanResManager.getLanCommonTextWords("在此输入公告");
                  }
            }
         }
      }
      
      private function onFlagNameChange(param1:Event) : void
      {
         var _loc3_:Array = null;
         var _loc2_:String = this.flagNameInput.text;
         while(TextManager.getSBCSLength(this.flagNameInput.text) > 12)
         {
            _loc3_ = _loc2_.split("");
            _loc3_.pop();
            this.flagNameInput.text = _loc3_.join("");
         }
      }
      
      private function onpartyAffichelChange(param1:Event) : void
      {
         var _loc3_:Array = null;
         var _loc2_:String = this.partyAfficheInput.text;
         while(TextManager.getSBCSLength(this.partyAfficheInput.text) > 400)
         {
            _loc3_ = _loc2_.split("");
            _loc3_.pop();
            this.partyAfficheInput.text = _loc3_.join("");
         }
      }
      
      private function onPartyNameChange(param1:Event) : void
      {
         var _loc3_:Array = null;
         var _loc2_:String = this.partyNameInput.text;
         while(TextManager.getSBCSLength(this.partyNameInput.text) > 12)
         {
            _loc3_ = _loc2_.split("");
            _loc3_.pop();
            this.partyNameInput.text = _loc3_.join("");
         }
      }
      
      private function onCom() : void
      {
         this.mv = StaticValue.getMCByClassName("ui.party.flag.lv1.1") as MovieClip;
         addChild(this.mv);
         this.mv.x = 178;
         this.mv.y = 200;
         this.flagID = 1;
         this.preBtn.enabled = false;
         this.nextBtn.enabled = true;
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
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
         if(Boolean(this.mv) && Boolean(this.mv.parent))
         {
            this.mv.parent.removeChild(this.mv);
            this.mv.stop();
         }
         this.mv = StaticValue.getMCByClassName("ui.party.flag.lv1." + this.flagID) as MovieClip;
         addChild(this.mv);
         this.mv.x = 176;
         this.mv.y = 200;
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
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.createBtn:
               if(this.partyNameInput.text.length > 6 || this.partyNameInput.text.length < 2)
               {
                  FAlert.show(LanResManager.getLanCommonTextWords("帮会名字不符合"));
                  return;
               }
               if(this.partyAfficheInput.text.length == 0 || this.partyAfficheInput.text == LanResManager.getLanCommonTextWords("在此输入公告"))
               {
                  FAlert.show(LanResManager.getLanCommonTextWords("请输入公告"));
                  return;
               }
               if(this.flagNameInput.text.length > 6 || this.flagNameInput.text.length < 2)
               {
                  FAlert.show(LanResManager.getLanCommonTextWords("帮旗名字不符合"));
                  return;
               }
               dispatchEvent(new BaseEvent(UI_PARTYPANEL_CREATE_PARTY_CREATE,"",[this.partyNameInput.text,this.partyAfficheInput.text,this.flagNameInput.text,this.flagID,0,0,0]));
         }
      }
      
      private function onCheck(param1:MouseEvent) : void
      {
         if(this.partyNameInput.text.length < 2)
         {
            FAlert.show(LanResManager.getLanCommonTextWords("帮会名字最少两个字"));
            return;
         }
         dispatchEvent(new BaseEvent(UI_PARTYPANEL_CREATE_PARTY_CHECK_NAME,"",this.partyNameInput.text));
      }
   }
}

