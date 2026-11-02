package com.tgame.shell.view.components.attribute
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class QiHaiPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var jingMaiType:int = 0;
      
      private var qiHaiBtn:SecondButton;
      
      private var qihaiDataArr:Array = [1,true,100,true,10000,"3%","攻击：100  防御：200  xx：oo"];
      
      private var upText:FTextArea;
      
      private var downText:FTextArea;
      
      private var zhuFuText:FTextArea;
      
      private var fc:FCanvas;
      
      private var fc2:FCanvas;
      
      public function QiHaiPanel()
      {
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 425;
         height = 219;
         titleText = LanResManager.getLanTextWords(this,"气海修炼");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.fc = new FCanvas();
         this.fc.x = 15;
         this.fc.y = 5;
         this.fc.width = 396;
         this.fc.height = 70;
         this.fc.skin = "box_transparence";
         addChild(this.fc);
         this.fc2 = new FCanvas();
         this.fc2.x = 15;
         this.fc2.y = 80;
         this.fc2.width = 396;
         this.fc2.height = 65;
         this.fc2.skin = "box_transparence";
         addChild(this.fc2);
         this.upText = new FTextArea();
         this.upText.htmlText = "xxx";
         this.upText.x = 20;
         this.upText.y = 8;
         this.upText.width = 400;
         addChild(this.upText);
         this.downText = new FTextArea();
         this.downText.htmlText = "xxx";
         this.downText.x = 20;
         this.downText.y = 90;
         this.downText.autoSize = TextFieldAutoSize.LEFT;
         addChild(this.downText);
         this.zhuFuText = new FTextArea();
         this.zhuFuText.htmlText = "xxx";
         this.zhuFuText.x = 167;
         this.zhuFuText.y = 45;
         this.zhuFuText.width = 200;
         addChild(this.zhuFuText);
         this.qiHaiBtn = new SecondButton();
         this.qiHaiBtn.label = LanResManager.getLanCommonTextWords("修炼");
         this.qiHaiBtn.x = this.width / 2 - this.qiHaiBtn.width / 2;
         this.qiHaiBtn.y = 150;
         this.qiHaiBtn.addEventListener(MouseEvent.CLICK,this.onStart);
         addChild(this.qiHaiBtn);
      }
      
      public function setQiHaiData(param1:Array) : void
      {
         this.qihaiDataArr = param1;
         this.jingMaiType = this.qihaiDataArr[0];
         var _loc2_:String = param1[1] == false ? StaticValue.RED_HTML : StaticValue.GREEN_HTML;
         var _loc3_:String = param1[3] == false ? StaticValue.RED_HTML : StaticValue.GREEN_HTML;
         this.upText.htmlText = "<textformat leading=\'\'><font size=\'14\' color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("修炼需要消耗：") + "<br>" + LanResManager.getLanCommonTextWords("铜钱：") + "</font><font size=\'14\' color=\'" + _loc2_ + "\'>" + this.qihaiDataArr[2] + "               </font><font size=\'14\' color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率：") + "<font size=\'14\' color=\'" + StaticValue.WHITE_HTML + "\'>" + this.qihaiDataArr[5] / 100 + "%<br></font><font size=\'14\' color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("真气：") + "<font size=\'14\' color=\'" + _loc3_ + "\'>" + this.qihaiDataArr[4];
         this.downText.htmlText = "<font size=\'14\' color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("加成：") + "<br></font><font size=\'14\' color=\'" + StaticValue.GREEN_HTML + "\'>" + this.qihaiDataArr[6];
         this.qiHaiBtn.enabled = this.qihaiDataArr[1] & this.qihaiDataArr[3];
      }
      
      public function setZhuFu(param1:int, param2:int) : void
      {
         this.zhuFuText.htmlText = "<font size=\'14\' color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("祝福值：") + param1 + " / " + param2;
      }
      
      public function clear() : void
      {
         this.zhuFuText.htmlText = "";
         this.upText.htmlText = "";
         this.downText.htmlText = "";
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onStart(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_QI_HAI_BTN_CLICKED,"",this.jingMaiType));
      }
   }
}

