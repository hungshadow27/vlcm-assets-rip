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
   
   public class JinZhongZhaoQiangHuaPanel extends FPanel
   {
      
      public static const UI_QIANGHUAJINZHONGZHAO_CLICK:String = "UI_QIANGHUAJINZHONGZHAO_CLICK";
      
      private var ft:FTextArea;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var ft3:FTextArea;
      
      private var btn:SecondButton;
      
      private var djBit3:Bitmap;
      
      private var ifItem3:ItemFace;
      
      private var imgFc:FCanvas;
      
      private var menuContainer:FCanvas;
      
      public function JinZhongZhaoQiangHuaPanel()
      {
         super();
         this.skin = "panel_btn";
         this.showCloseButton = true;
         dragAble = true;
         width = 250;
         height = 300;
         titleText = LanResManager.getLanCommonTextWords("金钟罩强化");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.ft1 = new FTextArea();
         this.ft1.x = 11 + 25;
         this.ft1.y = 5 + 22;
         this.ft1.width = 218 + 4;
         this.ft1.autoSize = TextFieldAutoSize.LEFT;
         this.ft1.wordWrap = true;
         this.ft1.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("金钟罩强化后属性：攻击+2888") + "</font>";
         addChild(this.ft1);
         this.ft = new FTextArea();
         this.ft.x = 11 + 3;
         this.ft.y = 153 - 8 + 10;
         this.ft.width = 218 + 4;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.wordWrap = true;
         this.ft.htmlText = "<font color = \'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("金钟罩最强防御招式，以无上神通将内力凝聚成护体真气，与对手交战之时，护体真气会自动外放，化解所受伤害。") + "</font>";
         addChild(this.ft);
         this.menuContainer = new FCanvas();
         this.menuContainer.skin = "backGroud";
         addChild(this.menuContainer);
         this.menuContainer.width = 230;
         this.menuContainer.height = 80;
         this.menuContainer.x = 10;
         this.menuContainer.y = 66;
         this.btn = new SecondButton();
         this.btn.label = LanResManager.getLanCommonTextWords("强化");
         addChild(this.btn);
         this.btn.x = width / 2 - this.btn.width / 2;
         this.btn.y = 235;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn:
               this.dispatchEvent(new BaseEvent(UI_QIANGHUAJINZHONGZHAO_CLICK));
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
         this.djBit3.x = 105;
         this.djBit3.y = 90;
         addChild(this.djBit3);
         if(this.ifItem3 != null && this.ifItem3.parent != null)
         {
            this.ifItem3.parent.removeChild(this.ifItem3);
         }
         if(param1 == null)
         {
            return;
         }
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
         this.ifItem3.setShowCount(false);
         addChild(this.ifItem3);
      }
   }
}

