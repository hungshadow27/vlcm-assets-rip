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
   
   public class MenghuanSishengshouPanel extends FPanel
   {
      
      public static const UI_MENGHUANSISHENGSHOU_JIHUO_CLICK:String = "UI_MENGHUANSISHENGSHOU_JIHUO_CLICK";
      
      private var ft:FTextArea;
      
      private var ft2:FTextArea;
      
      private var ft1:FTextArea;
      
      private var bg:Bitmap;
      
      private var imgIco:DisplayObject;
      
      private var btn:SecondButton;
      
      private var fc:FCanvas;
      
      private var line:Bitmap;
      
      private var item:ItemFace;
      
      private var strName:String;
      
      private var goods:Goods;
      
      public function MenghuanSishengshouPanel()
      {
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 435;
         height = 219;
         this.titleText = LanResManager.getLanCommonTextWords("梦幻四圣兽阵眼");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.ft = new FTextArea();
         with(this.ft)
         {
            autoSize = TextFieldAutoSize.LEFT;
            x = 15;
            y = 7;
            filters = StaticValue.filter;
            textColor = StaticValue.SKY_BLUE;
            htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanTextWords(this,"世人只知道聚灵珠可以用来提升四灵阵法实在是暴殄天物之行为聚灵1",[StaticValue.GOLD_HTML,StaticValue.GREEN_HTML,StaticValue.BlUE50_HTML]) + "</textformat>";
         }
         addChild(this.ft);
         this.fc = new FCanvas();
         this.fc.x = 10;
         this.fc.y = 60;
         this.fc.width = 416;
         this.fc.height = 115;
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
            x = 310;
            y = 100 - 30;
            filters = StaticValue.filter;
            textColor = StaticValue.YELLOW;
            htmlText = "";
         }
         addChild(this.ft2);
         this.line = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.line);
         this.line.x = 320;
         this.line.y = 120 - 30;
         this.btn = new SecondButton();
         this.btn.label = LanResManager.getLanCommonTextWords("激活");
         addChild(this.btn);
         this.btn.x = 310;
         this.btn.y = 165 - 30;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn:
               dispatchEvent(new BaseEvent(UI_MENGHUANSISHENGSHOU_JIHUO_CLICK));
         }
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setInitialize(param1:Goods, param2:int, param3:Boolean = false) : void
      {
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.strName = param1.res.name;
         this.ft2.htmlText = this.strName;
         this.goods = param1;
         this.item = new ItemFace(param1);
         this.item.x = 322;
         this.item.y = 122 - 30;
         addChild(this.item);
         if(param1.count <= 0)
         {
            this.item.filters = Tools.blackWhiteFilter;
         }
         var _loc4_:String = "";
         _loc4_ = "<textformat leading=\'6\'>";
         _loc4_ = _loc4_ + ("<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活将消耗：") + "<br></font>");
         if(this.goods.count >= param2)
         {
            _loc4_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>    " + this.strName + param2 + LanResManager.getLanCommonTextWords("颗") + "<br></font>";
         }
         else
         {
            _loc4_ += "<font color=\'" + StaticValue.RED_HTML + "\'>    " + this.strName + param2 + LanResManager.getLanCommonTextWords("颗") + "<br></font>";
         }
         _loc4_ += "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活成功几率：") + "<br></font>";
         _loc4_ = _loc4_ + ("<font color=\'" + StaticValue.WHITE_HTML + "\'>    100%<br></font>");
         _loc4_ = _loc4_ + "</textformat>";
         this.ft1.htmlText = _loc4_;
      }
   }
}

