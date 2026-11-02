package com.tgame.shell.view.components.Accomplishment
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.AccomplishmentPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class AccomplishmentContrastPanel extends FPanel
   {
      
      private var _parent:DisplayObject;
      
      private var ft:FTextArea;
      
      private var moodTxt:FTextArea;
      
      private var ghBtn:SecondButton;
      
      private var listContainer2:Sprite;
      
      private var selectList2:FList;
      
      private var Scroll2:FVScorllBar;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      public function AccomplishmentContrastPanel()
      {
         var bg:Bitmap;
         var v:Vector.<Bitmap>;
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 255;
         height = 455;
         titleText = LanResManager.getLanCommonTextWords("成就与称号");
         bg = new Bitmap();
         bg.name = "ui.char.attribute.accomplishment.contrast.ui";
         addChild(bg);
         bg.x = 10;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 20;
            y = 9;
            width = 65;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"比较对象");
         }
         addChild(this.ft);
         this.moodTxt = new FTextArea();
         with(this.moodTxt)
         {
            x = 85;
            y = 9;
            width = 210;
            height = 20;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.moodTxt);
         this.ghBtn = new SecondButton();
         this.ghBtn.label = LanResManager.getLanTextWords(this,"更换");
         addChild(this.ghBtn);
         this.ghBtn.x = 196;
         this.ghBtn.y = 9;
         this.ghBtn.addEventListener(MouseEvent.CLICK,this.onBtnFun);
         this.listContainer2 = new Sprite();
         addChild(this.listContainer2);
         with(this.listContainer2)
         {
            x = 14;
            y = 37;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,209,336);
            graphics.endFill();
         }
         this.selectList2 = new FList();
         this.selectList2.skin = "list";
         this.selectList2.itemRenderer = new AccomplishmentContrastListRender();
         this.selectList2.listWidth = 209;
         this.listContainer2.addChild(this.selectList2);
         this.selectList2.x = 0;
         this.selectList2.y = 0;
         this.Scroll2 = new FVScorllBar(this.listContainer2,336);
         addChild(this.Scroll2);
         this.Scroll2.x = 225;
         this.Scroll2.y = 37;
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 15;
            y = 385;
            wordWrap = true;
            width = 65;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanTextWords(this,"成就点数");
         }
         addChild(this.ft);
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            x = 75;
            y = 385;
            wordWrap = true;
            width = 65;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.ft1);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 135;
            y = 385;
            wordWrap = true;
            width = 65;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanTextWords(this,"称号个数");
         }
         addChild(this.ft);
         this.ft2 = new FTextArea();
         with(this.ft2)
         {
            x = 195;
            y = 385;
            wordWrap = true;
            width = 65;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.ft2);
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         this._parent.dispatchEvent(new BaseEvent(AccomplishmentPanel.UI_CHENGJIU_DUIBI_CLOSE));
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onBtnFun(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.ghBtn:
               this._parent.dispatchEvent(new BaseEvent(AccomplishmentPanel.UI_CHENGJIU_DUIBI_GENGHUANBTN_CLICK));
         }
      }
      
      public function SetInitializeContentRight(param1:Array, param2:String, param3:int, param4:int) : void
      {
         this.selectList2.dataProvider = param1;
         this.moodTxt.text = param2;
         this.ft1.htmlText = String(param3);
         this.ft2.htmlText = String(param4);
         this.Scroll2.update();
      }
   }
}

