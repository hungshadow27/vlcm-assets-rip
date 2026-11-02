package com.tgame.shell.view.components.huodong
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class JihuoRouShenDaJinLongShuXingPanel extends FPanel
   {
      
      public static const UI_JIHUODAJINLONGSHUXING_CLICK:String = "UI_JIHUODAJINLONGSHUXING_CLICK";
      
      private var ft:FTextArea;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var ft3:FTextArea;
      
      private var btn:SecondButton;
      
      private var djBit3:Bitmap;
      
      private var ifItem3:ItemFace;
      
      private var imgFc:FCanvas;
      
      public function JihuoRouShenDaJinLongShuXingPanel()
      {
         super();
         this.skin = "panel_btn";
         this.showCloseButton = true;
         dragAble = true;
         width = 205;
         height = 251;
         titleText = LanResManager.getLanCommonTextWords("大金龙属性激活");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.imgFc = new FCanvas();
         this.imgFc.x = 98;
         this.imgFc.y = 2;
         this.imgFc.width = 97;
         this.imgFc.height = 94;
         this.imgFc.skin = "box_transparence";
         addChild(this.imgFc);
         this.imgFc = new FCanvas();
         this.imgFc.x = 10;
         this.imgFc.y = 95;
         this.imgFc.width = 185;
         this.imgFc.height = 80;
         this.imgFc.skin = "box_transparence";
         addChild(this.imgFc);
         this.ft = new FTextArea();
         this.ft.x = 25;
         this.ft.y = 18;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.textColor = StaticValue.WHITE;
         addChild(this.ft);
         this.ft1 = new FTextArea();
         this.ft1.x = 121;
         this.ft1.y = 18;
         this.ft1.autoSize = TextFieldAutoSize.LEFT;
         this.ft1.textColor = StaticValue.WHITE;
         this.ft1.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活后") + "：<br></font>";
         addChild(this.ft1);
         this.ft2 = new FTextArea();
         this.ft2.x = 111;
         this.ft2.y = 43;
         this.ft2.autoSize = TextFieldAutoSize.LEFT;
         this.ft2.textColor = StaticValue.WHITE;
         this.ft2.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：+5000") + "<br></font>";
         addChild(this.ft2);
         this.ft3 = new FTextArea();
         this.ft3.x = 15;
         this.ft3.y = 102;
         this.ft3.autoSize = TextFieldAutoSize.LEFT;
         this.ft3.htmlText = "<font color = \'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("肉身达到八层可以在此激活大金龙属性。") + "<br></font>" + "<font color =\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活后，人物将获得大量的属性") + "<br>" + LanResManager.getLanCommonTextWords("加成") + "</font>";
         addChild(this.ft3);
         this.btn = new SecondButton();
         this.btn.label = LanResManager.getLanCommonTextWords("激活");
         addChild(this.btn);
         this.btn.x = width / 2 - this.btn.width / 2;
         this.btn.y = 188;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn:
               this.dispatchEvent(new BaseEvent(UI_JIHUODAJINLONGSHUXING_CLICK));
               this.onClose();
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setGoods(param1:Goods = null) : void
      {
         this.djBit3 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit3.x = 30;
         this.djBit3.y = 37;
         addChild(this.djBit3);
         if(this.ifItem3 != null && this.ifItem3.parent != null)
         {
            this.ifItem3.parent.removeChild(this.ifItem3);
         }
         if(param1 == null)
         {
            return;
         }
         this.ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + param1.res.name + "<br></font>";
         this.ifItem3 = new ItemFace(param1);
         this.ifItem3.x = this.djBit3.x + 2;
         this.ifItem3.y = this.djBit3.y + 2;
         if(param1.count == 0)
         {
            this.ifItem3.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.ifItem3.filters = [];
         }
         addChild(this.ifItem3);
      }
   }
}

