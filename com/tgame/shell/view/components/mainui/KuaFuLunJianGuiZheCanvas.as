package com.tgame.shell.view.components.mainui
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class KuaFuLunJianGuiZheCanvas extends Sprite
   {
      
      private var title:Bitmap;
      
      private var btn:FSimpleButton;
      
      private var canvas:FCanvas;
      
      private var queryBtn:SecondButton;
      
      private var ftext:FTextArea;
      
      private var guizhiQueryBtn:SecondButton;
      
      private var shouyiQueryBtn:SecondButton;
      
      public function KuaFuLunJianGuiZheCanvas()
      {
         super();
         this.title = StaticValue.getBitmapByClassName("ui.main.kuafu.guizhe.title");
         addChild(this.title);
         this.btn = new FSimpleButton();
         this.btn.skin = "subButton";
         addChild(this.btn);
         this.btn.x = 238 - this.btn.width;
         this.btn.y = 0;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.canvas = new FCanvas();
         this.canvas.skin = "menuBg";
         addChildAt(this.canvas,0);
         this.canvas.y = 22;
         this.canvas.width = 238;
         this.ftext = new FTextArea();
         this.ftext.autoSize = TextFieldAutoSize.LEFT;
         this.ftext.textColor = StaticValue.WHITE;
         this.ftext.filters = StaticValue.filter;
         this.ftext.x = 5;
         this.ftext.y = 7;
         this.canvas.addChild(this.ftext);
         this.guizhiQueryBtn = new SecondButton();
         this.guizhiQueryBtn.label = LanResManager.getLanCommonTextWords("规则查询");
         this.canvas.addChild(this.guizhiQueryBtn);
         this.guizhiQueryBtn.x = 2;
         this.guizhiQueryBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shouyiQueryBtn = new SecondButton();
         this.shouyiQueryBtn.label = LanResManager.getLanCommonTextWords("收益查询");
         this.canvas.addChild(this.shouyiQueryBtn);
         this.shouyiQueryBtn.x = 72;
         this.shouyiQueryBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.queryBtn = new SecondButton();
         this.queryBtn.label = LanResManager.getLanCommonTextWords("打开跨服包裹");
         this.canvas.addChild(this.queryBtn);
         this.queryBtn.x = 142;
         this.queryBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn:
               if(this.btn.skin == "subButton")
               {
                  this.btn.skin = "sumButton";
                  this.canvas.visible = false;
               }
               else
               {
                  this.btn.skin = "subButton";
                  this.canvas.visible = true;
               }
               break;
            case this.guizhiQueryBtn:
               parent.dispatchEvent(new BaseEvent(MainUI.MAINUI_KUAFU_GUIZHE_QUERY,"",1));
               break;
            case this.shouyiQueryBtn:
               parent.dispatchEvent(new BaseEvent(MainUI.MAINUI_KUAFU_GUIZHE_QUERY,"",2));
               break;
            case this.queryBtn:
               parent.dispatchEvent(new BaseEvent(MainUI.MAINUI_KUAFU_GUIZHE_QUERY,"",3));
         }
      }
      
      public function setValue(param1:int, param2:int, param3:String, param4:int, param5:Number) : void
      {
         var _loc6_:String = param4 + " * " + param4 + " * <font color=\'" + StaticValue.PURPLE50_HTML + "\'>" + param1 + "</font> * <font color=\'" + StaticValue.ORANGE_HTML + "\'>" + param2 + "</font>";
         var _loc7_:Array = [StaticValue.GREEN_HTML,StaticValue.PURPLE50_HTML,param1,param3,StaticValue.ORANGE_HTML,param2,param4,StaticValue.BLUE_HTML,param4 * param4 * param1 * param2,StaticValue.BLUE_HTML,_loc6_,StaticValue.BLUE_HTML,int(param5 / 60),param5 % 60];
         this.ftext.htmlText = LanResManager.getLanTextWords(this,"跨服论剑规则",_loc7_);
         this.canvas.height = this.ftext.height + 27 + this.queryBtn.height;
         this.guizhiQueryBtn.y = this.shouyiQueryBtn.y = this.queryBtn.y = this.ftext.y + this.ftext.height + 10;
      }
   }
}

