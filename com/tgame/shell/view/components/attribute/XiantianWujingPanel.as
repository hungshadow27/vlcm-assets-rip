package com.tgame.shell.view.components.attribute
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
   
   public class XiantianWujingPanel extends FPanel
   {
      
      public static const UI_XIANTIANWUJING_JIHUO_CLICK:String = "UI_XIANTIANWUJING_JIHUO_CLICK";
      
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
      
      public function XiantianWujingPanel()
      {
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 425;
         height = 259;
         titleText = LanResManager.getLanTextWords(this,"先天武境");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.ft = new FTextArea();
         with(this.ft)
         {
            autoSize = TextFieldAutoSize.LEFT;
            x = 15;
            y = 7;
            filters = StaticValue.filter;
            textColor = StaticValue.SKY_BLUE;
            htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanTextWords(this,"世人只知养天石可以用来强化装备的天生属性实在是暴敛天物之行为1",[StaticValue.GOLD_HTML,StaticValue.GREEN_HTML,StaticValue.BlUE50_HTML]) + "</textformat>";
         }
         addChild(this.ft);
         this.fc = new FCanvas();
         this.fc.x = 10;
         this.fc.y = 60;
         this.fc.width = 406;
         this.fc.height = 155;
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
            htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanTextWords(this,"激活条件",[StaticValue.YELLOW_HTML,StaticValue.GREEN_HTML,StaticValue.YELLOW_HTML,StaticValue.GREEN_HTML,StaticValue.YELLOW_HTML,StaticValue.GREEN_HTML,StaticValue.YELLOW_HTML,StaticValue.GREEN_HTML]) + "</textformat>";
         }
         addChild(this.ft1);
         this.ft2 = new FTextArea();
         with(this.ft2)
         {
            autoSize = TextFieldAutoSize.LEFT;
            x = 310;
            y = 100;
            filters = StaticValue.filter;
            textColor = StaticValue.YELLOW;
            htmlText = LanResManager.getLanCommonTextWords("养天石");
         }
         addChild(this.ft2);
         this.line = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.line);
         this.line.x = 320;
         this.line.y = 120;
         this.btn = new SecondButton();
         this.btn.label = LanResManager.getLanCommonTextWords("激活");
         addChild(this.btn);
         this.btn.x = 310;
         this.btn.y = 165;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn:
               dispatchEvent(new BaseEvent(UI_XIANTIANWUJING_JIHUO_CLICK));
         }
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setGoods(param1:Goods) : void
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
         this.item.y = 122;
         addChild(this.item);
         if(param1.count <= 0)
         {
            this.item.filters = Tools.blackWhiteFilter;
         }
      }
      
      public function setInitialize(param1:int, param2:int, param3:Boolean, param4:int, param5:Boolean) : void
      {
         var _loc6_:String = "";
         _loc6_ = "<textformat leading=\'1\'>";
         _loc6_ = _loc6_ + ("<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活条件：") + "（" + param1 + "/12）<br></font>");
         if(param1 == 12)
         {
            _loc6_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>    " + LanResManager.getLanCommonTextWords("全身穿戴的12件装备均为满天生装备") + "<br></font>";
         }
         else
         {
            _loc6_ += "<font color=\'" + StaticValue.RED_HTML + "\'>    " + LanResManager.getLanCommonTextWords("全身穿戴的12件装备均为满天生装备") + "<br></font>";
         }
         _loc6_ += "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活将消耗：") + "<br></font>";
         if(param3 && this.goods.count >= param2)
         {
            _loc6_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>    " + this.strName + param2 + LanResManager.getLanCommonTextWords("颗") + "<br></font>";
         }
         else
         {
            _loc6_ += "<font color=\'" + StaticValue.RED_HTML + "\'>    " + this.strName + param2 + LanResManager.getLanCommonTextWords("颗") + "<br></font>";
         }
         _loc6_ += "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活成功几率：") + "<br></font>";
         _loc6_ = _loc6_ + ("<font color=\'" + StaticValue.WHITE_HTML + "\'>    " + param4 + "%<br></font>");
         _loc6_ = _loc6_ + ("<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("先天武境激活状态：") + "<br></font>");
         if(param5)
         {
            _loc6_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>    " + LanResManager.getLanCommonTextWords("已激活") + "<br></font>";
         }
         else
         {
            _loc6_ += "<font color=\'" + StaticValue.RED_HTML + "\'>    " + LanResManager.getLanCommonTextWords("未激活") + "<br></font>";
         }
         _loc6_ += "</textformat>";
         this.ft1.htmlText = _loc6_;
      }
   }
}

