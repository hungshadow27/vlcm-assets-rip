package com.tgame.shell.view.components.huodong
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class HuyiLingHuaPanel extends FPanel
   {
      
      public static const UI_HUYILINGHUA_OK_CLICK:String = "UI_HUYILINGHUA_OK_CLICK";
      
      private var ft:FTextArea;
      
      private var ft2:FTextArea;
      
      private var ft3:FTextArea;
      
      private var ft1:FTextArea;
      
      private var bg:Bitmap;
      
      private var imgIco:DisplayObject;
      
      private var btn:SecondButton;
      
      private var fc:FCanvas;
      
      private var line:Bitmap;
      
      private var item:ItemFace;
      
      private var strName:String;
      
      private var goods:Goods;
      
      private var strName2:String;
      
      public function HuyiLingHuaPanel()
      {
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 425;
         height = 300;
         this.titleText = LanResManager.getLanCommonTextWords("灵化");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.ft = new FTextArea();
         with(this.ft)
         {
            width = 450;
            height = 100;
            x = 15;
            y = 7;
            filters = StaticValue.filter;
            textColor = StaticValue.SKY_BLUE;
            htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.GOLD_HTML + "\'>" + LanResManager.getLanCommonTextWords("虎翼本属上古邪兵之列，曾被神器击碎散落于世，自此销声匿迹于世。") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("后人机缘巧合之下重铸虎翼，但其展现其的实力却大不如前！") + "</font><br>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("传说中通过灵化,能让虎翼获得神秘的力量，大展远古神兵之威！") + "</font>" + "</textformat>";
         }
         addChild(this.ft);
         this.fc = new FCanvas();
         this.fc.x = 10;
         this.fc.y = 60;
         this.fc.width = 406;
         this.fc.height = 196;
         this.fc.skin = "box_transparence";
         addChild(this.fc);
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            width = 200;
            autoSize = TextFieldAutoSize.LEFT;
            x = 20;
            y = 70;
            filters = StaticValue.filter;
            textColor = StaticValue.SKY_BLUE;
            htmlText = "";
         }
         addChild(this.ft1);
         this.ft2 = new FTextArea();
         with(this.ft2)
         {
            autoSize = TextFieldAutoSize.LEFT;
            x = 270 + 10 + 10;
            y = 100 + 15;
            filters = StaticValue.filter;
            textColor = StaticValue.YELLOW;
            htmlText = "";
         }
         addChild(this.ft2);
         this.line = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.line);
         this.line.x = 270 + 27;
         this.line.y = 120 + 15;
         this.ft3 = new FTextArea();
         with(this.ft3)
         {
            autoSize = TextFieldAutoSize.LEFT;
            x = 330;
            y = 100 + 15;
            filters = StaticValue.filter;
            textColor = StaticValue.YELLOW;
            htmlText = "";
         }
         addChild(this.ft3);
         this.btn = new SecondButton();
         this.btn.label = LanResManager.getLanCommonTextWords("灵化");
         addChild(this.btn);
         this.btn.x = 303 - 15;
         this.btn.y = 165 + 15;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn:
               dispatchEvent(new BaseEvent(UI_HUYILINGHUA_OK_CLICK));
         }
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setInitialize(param1:Goods, param2:int) : void
      {
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.strName = param1.res.name;
         this.ft2.htmlText = this.strName;
         this.goods = param1;
         this.item = new ItemFace(param1);
         this.item.x = 272 + 27;
         this.item.y = 122 + 15;
         addChild(this.item);
         if(param1.count <= 0)
         {
            this.item.filters = Tools.blackWhiteFilter;
         }
         var _loc3_:String = "";
         _loc3_ = "<textformat leading=\'4\'>";
         _loc3_ += "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("灵化条件：") + "<br></font>";
         _loc3_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>    " + LanResManager.getLanCommonTextWords("拥有虎翼神兵") + "<br></font>";
         _loc3_ += "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("灵化效果：") + "<br></font>";
         _loc3_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>    " + LanResManager.getLanCommonTextWords("虎翼将拥有6条附加属性(攻击力)") + "<br></font>";
         _loc3_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>    " + LanResManager.getLanCommonTextWords("附加属性的初始值为1") + "<br></font>";
         _loc3_ += "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("灵化将消耗：") + "<br></font>";
         if(this.goods.count >= param2)
         {
            _loc3_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>    " + this.strName + param2 + LanResManager.getLanCommonTextWords("颗") + "\n" + "</font>";
         }
         else
         {
            _loc3_ += "<font color=\'" + StaticValue.RED_HTML + "\'>    " + this.strName + param2 + LanResManager.getLanCommonTextWords("颗") + "\n" + "</font>";
         }
         _loc3_ += "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("灵化成功几率：") + "<br></font>";
         _loc3_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>    100%<br></font>";
         _loc3_ += "</textformat>";
         this.ft1.htmlText = _loc3_;
      }
   }
}

