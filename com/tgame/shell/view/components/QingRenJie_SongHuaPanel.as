package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import gs.TweenMax;
   
   public class QingRenJie_SongHuaPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var name1:FTextArea;
      
      private var name2:FTextArea;
      
      private var head1:Bitmap;
      
      private var head2:Bitmap;
      
      private var num:int = 0;
      
      private var shuoming:FTextArea;
      
      private var ty:int = 1;
      
      private var kuang:Bitmap;
      
      private var xianhuaItemFace:ItemFace;
      
      private var xianhuaContainer:Sprite;
      
      private var fangruBtn:SecondButton;
      
      private var okBtn:SecondButton;
      
      private var huayushuoming:HuaYuShuoMingCanvas;
      
      private var playerId:int = 0;
      
      private var input:FTextInput;
      
      private var bg1:DisplayObject;
      
      private var closeBtn1:FSimpleButton;
      
      private var tf:TextFormat;
      
      public function QingRenJie_SongHuaPanel()
      {
         var headImg:String;
         var $mask:Sprite;
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         skin = "sceondPanel_btn";
         this.dragRestrict = false;
         dragAble = true;
         showCloseButton = true;
         width = 284;
         height = 267 - 66;
         titleText = LanResManager.getLanCommonTextWords("送花");
         addEventListener(FCloseEvent.CLOSE,this.onClose1);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/qingrenjiexianhua/songhuabg.swf");
         this.bg1.x = 2 - 100;
         this.bg1.y = 2 - 90;
         addChild(this.bg1);
         this.closeBtn1 = new FSimpleButton();
         this.closeBtn1.skin = "closeButton";
         addChild(this.closeBtn1);
         this.closeBtn1.x = width - this.closeBtn1.width - 2;
         this.closeBtn1.y = 2 - 44;
         this.closeBtn1.addEventListener(MouseEvent.CLICK,this.onClose);
         this.name1 = new FTextArea();
         addChild(this.name1);
         this.name1.multiline = true;
         this.name1.wordWrap = true;
         this.name1.defaultTextFormat = this.tf;
         this.name1.filters = StaticValue.filter;
         this.name1.width = 230 - 50;
         this.name1.x = -13 - 22;
         this.name1.y = 5;
         this.name2 = new FTextArea();
         addChild(this.name2);
         this.name2.multiline = true;
         this.name2.filters = StaticValue.filter;
         this.name2.wordWrap = true;
         this.name2.defaultTextFormat = this.tf;
         this.name2.width = 230 - 50;
         this.name2.x = 100 + 12;
         this.name2.y = 5;
         headImg = "ui.login.head.head_3_0";
         this.input = new FTextInput();
         with(this.input)
         {
            x = 90;
            y = 6 + 128 + 5;
            restrict = "0-9";
            textColor = StaticValue.WHITE;
         }
         this.input.setMaxChars(12);
         addChild(this.input);
         this.shuoming = new FTextArea();
         addChild(this.shuoming);
         this.shuoming.multiline = true;
         this.shuoming.wordWrap = true;
         this.shuoming.x = 15 + 90;
         this.shuoming.y = 80 + 40 + 77;
         this.shuoming.htmlText = "<font  color=\'" + StaticValue.GREEN_HTML + "\'><a><u>" + LanResManager.getLanCommonTextWords("花语说明") + "</u></a></font>";
         this.shuoming.addEventListener(MouseEvent.CLICK,this.onClick);
         this.huayushuoming = new HuaYuShuoMingCanvas();
         addChild(this.huayushuoming);
         this.huayushuoming.x = 100 - 20;
         this.huayushuoming.y = 0;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410 - 38;
         $mask.y = 0;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,500,390);
            endFill();
         }
         this.huayushuoming.mask = $mask;
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定送出");
         addChild(this.okBtn);
         this.okBtn.enabled = true;
         this.okBtn.x = 15 + 200 - 114;
         this.okBtn.y = 212 - 40;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function getItem() : void
      {
         this.num = 0;
         this.input.text = "";
      }
      
      private function onClose1(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
         this.num = 0;
         this.input.text = "";
         if(this.huayushuoming.x == 410 - 38)
         {
            TweenMax.to(this.huayushuoming,1,{"x":100 - 20});
         }
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
         this.num = 0;
         this.input.text = "";
         if(this.huayushuoming.x == 410 - 38)
         {
            TweenMax.to(this.huayushuoming,1,{"x":100 - 20});
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.fangruBtn:
               this.$parent.dispatchEvent(new BaseEvent(QingRenJie_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_FANGRUBTN_CLICK));
               break;
            case this.okBtn:
               this.$parent.dispatchEvent(new BaseEvent(QingRenJie_ChaXunWanJiaPanel.UI_QINGRENJIE_CHAXUNWANJIA_SONGHUABTN_CLICK,"",[this.playerId,int(this.input.text)]));
               this.getItem();
               break;
            case this.shuoming:
               this.onClick2();
         }
      }
      
      private function onClick2() : void
      {
         if(this.huayushuoming.x == 100 - 20)
         {
            TweenMax.to(this.huayushuoming,1,{"x":410 - 38});
         }
         if(this.huayushuoming.x == 410 - 38)
         {
            TweenMax.to(this.huayushuoming,1,{"x":100 - 20});
         }
      }
      
      public function setTouxiang(param1:String, param2:String, param3:String, param4:String, param5:int) : void
      {
         this.name1.htmlText = "<font  color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "</font>";
         this.head1 = new Bitmap();
         addChild(this.head1);
         this.head1.x = 100 - 70;
         this.head1.y = 100 - 65 + 1;
         this.head1.bitmapData = StaticValue.getBitmapByClassName(param2).bitmapData;
         this.head1.width = this.head1.height = 60;
         this.name2.htmlText = "<font  color=\'" + StaticValue.WHITE_HTML + "\'>" + param3 + "</font>";
         this.head2 = new Bitmap();
         addChild(this.head2);
         this.head2.x = 100 + 100 - 24;
         this.head2.y = 100 - 65 + 1;
         this.head2.bitmapData = StaticValue.getBitmapByClassName(param4).bitmapData;
         this.head2.width = this.head2.height = 60;
         this.playerId = param5;
      }
      
      public function setItem(param1:Goods) : void
      {
         this.num = param1.count;
         this.xianhuaContainer.addChild(new ItemFace(param1));
      }
      
      public function setType(param1:int = 1) : void
      {
         this.ty = param1;
         if(param1 == 1)
         {
            this.shuoming.visible = true;
         }
         else
         {
            this.shuoming.visible = false;
         }
      }
   }
}

