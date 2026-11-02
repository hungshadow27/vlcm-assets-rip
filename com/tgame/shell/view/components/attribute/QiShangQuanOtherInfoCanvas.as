package com.tgame.shell.view.components.attribute
{
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import com.tgame.moudels.qishangquan.model.info.QiShangQuanVo;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.*;
   
   public class QiShangQuanOtherInfoCanvas extends Sprite
   {
      
      private var bgCanvas:FCanvas;
      
      public var _parent:DisplayObject;
      
      private var fta:FTextArea;
      
      private var fta1:FTextArea;
      
      public function QiShangQuanOtherInfoCanvas()
      {
         var fc:FCanvas = null;
         super();
         this.bgCanvas = new FCanvas();
         this.bgCanvas.x = 0;
         this.bgCanvas.y = 0;
         this.bgCanvas.width = 250;
         this.bgCanvas.height = 215;
         this.bgCanvas.skin = "backGroud";
         addChild(this.bgCanvas);
         fc = new FCanvas();
         fc.skin = "canvas1";
         fc.x = 0;
         fc.y = 0;
         fc.width = 250;
         fc.height = 215;
         addChild(fc);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            x = 10;
            y = 187;
            textColor = StaticValue.RED;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<font size=\'12\'>" + "注意：三种不同总纲使用总和数量为1000本" + "</font>";
         }
         addChild(this.fta);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            x = 10;
            y = 10;
            textColor = StaticValue.YELLOW;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.fta1);
      }
      
      public function setInitialize(param1:QiShangQuanVo) : void
      {
         var _loc2_:String = "";
         _loc2_ += "<textformat leading=\'6\'>";
         _loc2_ += "使用攻击总纲数量：" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param1.bookcountGJ + "</font><br>";
         _loc2_ += "使用防御总纲数量：" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param1.bookcountFY + "</font><br>";
         _loc2_ += "使用血量总纲数量：" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param1.bookcountXL + "</font><br>";
         _loc2_ += "<br>";
         _loc2_ += "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + "属性加成" + "</font><br>";
         _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + "攻击：" + "12888 + " + param1.bookAttack + "</font><br>";
         _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + "防御：" + "10888 + " + param1.bookDefence + "</font><br>";
         _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + "生命：" + "68888 + " + param1.bookLife + "</font><br>";
         _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + "暴击：" + param1.bookBaoJi + "</font><br>";
         _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + "闪避：" + param1.bookShanBi + "</font><br>";
         _loc2_ += "</textformat>";
         this.fta1.htmlText = _loc2_;
      }
   }
}

