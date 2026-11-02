package com.tgame.shell.view.components.huodong
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class TishengZhuangbeiMenghuanPanel extends FPanel
   {
      
      public static const UI_TISHENGZHUANGBEIMENGHUANDUCLICK:String = "UI_TISHENGZHUANGBEIMENGHUANDUCLICK";
      
      public static const UI_FANGRUZHUANGBEICLICK:String = "UI_FANGRUZHUANGBEICLICK";
      
      private var btnIN:SmallButton;
      
      private var btnOK:SecondButton;
      
      private var djBit1:Bitmap;
      
      private var djBit2:Bitmap;
      
      private var jtBit:Bitmap;
      
      private var ft:FTextArea;
      
      private var line:Bitmap;
      
      private var ifItem1:ItemFace;
      
      private var ifItem2:ItemFace;
      
      private var menuContainer:FCanvas;
      
      public function TishengZhuangbeiMenghuanPanel()
      {
         super();
         this.skin = "panel_btn";
         this.showCloseButton = true;
         dragAble = true;
         width = 300;
         height = 220;
         titleText = LanResManager.getLanCommonTextWords("装备提炼");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.setUI();
      }
      
      private function setUI() : void
      {
         this.btnIN = new SmallButton();
         this.btnIN.label = LanResManager.getLanCommonTextWords("放入装备");
         addChild(this.btnIN);
         this.btnIN.x = 10 + 3;
         this.btnIN.y = 35;
         this.btnIN.addEventListener(MouseEvent.CLICK,this.onClick);
         this.djBit1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit1.x = 20;
         this.djBit1.y = 55 + 1;
         addChild(this.djBit1);
         this.ft = new FTextArea();
         this.ft.x = 88;
         this.ft.y = 15;
         this.ft.width = 200;
         this.ft.height = 130;
         this.ft.wordWrap = true;
         this.ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("提升装备梦幻追加属性说明：") + "<br /></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("请在左侧装备框放入要操作的装备") + "<br /></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点“确定”按钮即可开始提升梦幻追加属性") + "<br />3：</font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>100%</font><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功提升装备梦幻追加属性") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>10%</font>";
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         addChild(this.ft);
         this.line = new Bitmap();
         this.line = StaticValue.getBitmapByClassName("ui.line");
         this.line.x = 75;
         this.line.y = 2;
         this.line.width = 138;
         this.line.rotation = 90;
         addChild(this.line);
         this.btnOK = new SecondButton();
         this.btnOK.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.btnOK);
         this.btnOK.x = 125;
         this.btnOK.y = 155;
         this.btnOK.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btnIN:
               if(this.btnIN.label == LanResManager.getLanCommonTextWords("放入装备"))
               {
                  this.dispatchEvent(new BaseEvent(UI_FANGRUZHUANGBEICLICK,"",1));
               }
               else
               {
                  this.dispatchEvent(new BaseEvent(UI_FANGRUZHUANGBEICLICK,"",2));
               }
               break;
            case this.btnOK:
               this.dispatchEvent(new BaseEvent(UI_TISHENGZHUANGBEIMENGHUANDUCLICK));
         }
      }
      
      public function setGoods1(param1:Goods = null) : void
      {
         if(this.ifItem1 != null && this.ifItem1.parent != null)
         {
            this.ifItem1.parent.removeChild(this.ifItem1);
         }
         if(param1 == null)
         {
            this.btnIN.label = LanResManager.getLanCommonTextWords("放入装备");
            return;
         }
         this.ifItem1 = new ItemFace(param1);
         this.ifItem1.x = 20 + 2;
         this.ifItem1.y = 55 + 1 + 2;
         addChild(this.ifItem1);
         this.btnIN.label = LanResManager.getLanCommonTextWords("取出装备");
      }
   }
}

