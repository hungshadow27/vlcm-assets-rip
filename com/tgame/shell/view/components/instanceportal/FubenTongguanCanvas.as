package com.tgame.shell.view.components.instanceportal
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.InstanceConvectionPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class FubenTongguanCanvas extends FCanvas
   {
      
      public var $parent:DisplayObject;
      
      private var closeBtn:FSimpleButton;
      
      private var tip:FTextArea;
      
      private var SubBtn:SecondButton;
      
      private var bit:Bitmap;
      
      public function FubenTongguanCanvas()
      {
         var tf:TextFormat;
         super();
         skin = "menuBg";
         width = 280;
         height = 96;
         tf = new TextFormat();
         tf.align = "center";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 7;
            y = 12;
            autoSize = TextFieldAutoSize.LEFT;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("恭喜您副本通关成功！") + "<font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您本次闯关共使用了：") + "<font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("XX分钟XX秒") + "<font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("恭喜您获得通关奖励：") + "<font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("【XXXXX】*1") + "<font><br>" + "</textformat>";
         }
         addChild(this.tip);
         this.SubBtn = new SecondButton();
         this.SubBtn.label = LanResManager.getLanCommonTextWords("领取奖励");
         addChild(this.SubBtn);
         this.SubBtn.x = 110;
         this.SubBtn.y = 68;
         this.SubBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 5;
         this.closeBtn.y = 5;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
      }
      
      public function onClose(param1:MouseEvent = null) : void
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
            case this.SubBtn:
               this.$parent.dispatchEvent(new BaseEvent(InstanceConvectionPanel.UI_FUBENTONGGUANCANVAS_SUBCLICK));
         }
      }
      
      public function setInitialize(param1:String, param2:Array, param3:Boolean, param4:int) : void
      {
         var _loc5_:String = "";
         _loc5_ = "<textformat leading=\'6\'>" + LanResManager.getLanTextWords(this,0,[StaticValue.GREEN_HTML]);
         if(param3)
         {
            _loc5_ += LanResManager.getLanTextWords(this,1,[StaticValue.GREEN_HTML,param1]);
         }
         if(param2.length == 0)
         {
            _loc5_ += LanResManager.getLanTextWords(this,2);
         }
         var _loc6_:int = 0;
         while(_loc6_ < param2.length)
         {
            if(_loc6_ == 0)
            {
               _loc5_ += LanResManager.getLanTextWords(this,3,[StaticValue.GREEN_HTML,param2[_loc6_]]);
            }
            else
            {
               _loc5_ += "<br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param2[_loc6_] + "<font><br>";
            }
            _loc6_++;
         }
         _loc5_ += "</textformat>";
         this.tip.htmlText = _loc5_;
         this.SubBtn.y = this.tip.height + this.tip.y + 5;
         height = this.SubBtn.height + this.SubBtn.y + 10;
         if(this.bit != null && this.bit.parent != null)
         {
            this.bit.parent.removeChild(this.bit);
         }
         if(param4 == 2)
         {
            this.bit = StaticValue.getBitmapByClassName("ui.instance.shuangbei.txt");
            this.bit.x = 40;
            this.bit.y = 15;
            addChild(this.bit);
         }
      }
   }
}

