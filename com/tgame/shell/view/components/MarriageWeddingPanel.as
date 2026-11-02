package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class MarriageWeddingPanel extends FPanel
   {
      
      public static const UI_MARRIAGE_WEDDING_APPLY:String = "UI_MARRIAGE_WEDDING_APPLY";
      
      public var $parent:DisplayObject;
      
      private var apply1Btn:SecondButton;
      
      private var apply2Btn:SecondButton;
      
      private var apply3Btn:SecondButton;
      
      public function MarriageWeddingPanel()
      {
         var bg:Bitmap;
         var v:Vector.<Bitmap>;
         var tf:TextFormat;
         var ft:FTextArea;
         var lb:FLabel;
         super();
         dragAble = true;
         this.skin = "sceondPanel";
         this.showCloseButton = true;
         width = 341;
         height = 481;
         this.titleText = LanResManager.getLanCommonTextWords("举办婚宴");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = new Bitmap();
         bg.name = "ui.marriage.wedding.ui";
         addChild(bg);
         bg.x = 6;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         tf = new TextFormat();
         tf.leading = "5";
         ft = new FTextArea();
         with(ft)
         {
            x = 15;
            y = 25;
            defaultTextFormat = tf;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanTextWords(this,"婚宴信息",[],false) + "</textformat>";
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 15;
            y = 120;
            defaultTextFormat = tf;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanTextWords(this,"婚宴信息2",[],false) + "</textformat>";
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 15;
            y = 233;
            defaultTextFormat = tf;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanTextWords(this,"婚宴信息3",[],false) + "</textformat>";
         }
         addChild(ft);
         lb = new FLabel();
         with(lb)
         {
            x = 15;
            y = 327;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("婚宴举办说明") + "：";
         }
         addChild(lb);
         ft = new FTextArea();
         with(ft)
         {
            x = 15;
            y = 345;
            defaultTextFormat = tf;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanTextWords(this,"婚宴信息4",[],false) + "</textformat>";
         }
         addChild(ft);
         this.apply1Btn = new SecondButton();
         this.apply1Btn.label = LanResManager.getLanCommonTextWords("申请举办");
         addChild(this.apply1Btn);
         this.apply1Btn.x = 256;
         this.apply1Btn.y = 75;
         this.apply1Btn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.apply2Btn = new SecondButton();
         this.apply2Btn.label = LanResManager.getLanCommonTextWords("申请举办");
         addChild(this.apply2Btn);
         this.apply2Btn.x = 256;
         this.apply2Btn.y = 185;
         this.apply2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.apply3Btn = new SecondButton();
         this.apply3Btn.label = LanResManager.getLanCommonTextWords("申请举办");
         addChild(this.apply3Btn);
         this.apply3Btn.x = 256;
         this.apply3Btn.y = 300;
         this.apply3Btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent) : void
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
            case this.apply1Btn:
               _loc2_ = 1;
               break;
            case this.apply2Btn:
               _loc2_ = 2;
               break;
            case this.apply3Btn:
               _loc2_ = 3;
         }
         dispatchEvent(new BaseEvent(UI_MARRIAGE_WEDDING_APPLY,"",_loc2_));
      }
      
      public function isShowBtn(param1:Boolean) : void
      {
         this.apply1Btn.visible = this.apply2Btn.visible = this.apply3Btn.visible = param1;
      }
   }
}

