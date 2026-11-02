package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ColorBar;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class ZhuangBeiYangChengPanel extends FPanel
   {
      
      public static const UI_EQUIP_YANGCHENG_CLICK:String = "UI_EQUIP_YANGCHENG_CLICK";
      
      public static const UI_EQUIP_YANGCHENG_CANVAS_CLICK:String = "UI_EQUIP_YANGCHENG_CANVAS_CLICK";
      
      public static const UI_EQUIP_YANGCHENG_CANVAS_NEXT_IS_SHOW:String = "UI_EQUIP_YANGCHENG_CANVAS_NEXT_IS_SHOW";
      
      private var djBit1:Bitmap;
      
      private var djBit2:Bitmap;
      
      private var equip:Goods;
      
      private var jiHuoGoods:Goods;
      
      private var startBtn:SecondButton;
      
      private var yiJianBtn:SecondButton;
      
      private var myCloseBtn:SecondButton;
      
      private var menuContainer1:FCanvas;
      
      private var menuContainer2:FCanvas;
      
      private var equipContainer:Sprite;
      
      private var equipContainer2:Sprite;
      
      private var fa:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var yangChengStaFa:FTextArea;
      
      private var jiaChengFa:FTextArea;
      
      private var yuanbaoFa:FTextArea;
      
      private var barBg:Bitmap;
      
      private var itemFace:ItemFace;
      
      private var itemFace2:ItemFace;
      
      private var staBar:ColorBar;
      
      private var yangChengSta:int;
      
      private var yangChengCanvas:YangChengTiShiCanvas;
      
      public function ZhuangBeiYangChengPanel()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 325 - 40;
         height = 356 - 40 + 20;
         this.titleText = LanResManager.getLanCommonTextWords("装备养成");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.menuContainer1 = new FCanvas();
         this.menuContainer1.skin = "box_transparence";
         addChild(this.menuContainer1);
         this.menuContainer1.width = 267;
         this.menuContainer1.height = 70;
         this.menuContainer1.x = 10;
         this.menuContainer1.y = 0;
         this.menuContainer2 = new FCanvas();
         this.menuContainer2.skin = "backGroud";
         addChild(this.menuContainer2);
         this.menuContainer2.width = 267;
         this.menuContainer2.height = 90;
         this.menuContainer2.x = 10;
         this.menuContainer2.y = 67;
         this.djBit1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit1.x = 30;
         this.djBit1.y = 15;
         addChild(this.djBit1);
         this.equipContainer = new Sprite();
         this.equipContainer.x = this.djBit1.x + 2;
         this.equipContainer.y = this.djBit1.y + 2;
         addChild(this.equipContainer);
         this.jiaChengFa = new FTextArea();
         this.jiaChengFa.x = 100 + 10;
         this.jiaChengFa.y = 20;
         this.jiaChengFa.width = 150;
         this.jiaChengFa.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("养成属性加成") + "：<br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>\t\t" + LanResManager.getLanCommonTextWords("攻击：") + "+0 </font>";
         addChild(this.jiaChengFa);
         this.yangChengStaFa = new FTextArea();
         this.yangChengStaFa.x = 15;
         this.yangChengStaFa.y = 80;
         this.yangChengStaFa.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("养成状态") + "" + LanResManager.getLanCommonTextWords("未激活") + "<br></font>";
         addChild(this.yangChengStaFa);
         this.barBg = StaticValue.getBitmapByClassName("ui.char.attribute.colorBar.bg");
         addChild(this.barBg);
         this.barBg.x = 20 + 5;
         this.barBg.y = 120 - 10;
         this.barBg.height = 12;
         this.barBg.width = 150;
         this.barBg.filters = Tools.blackWhiteFilter;
         this.staBar = new ColorBar(4,140,8,true,false,true,"<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前养成值"),"<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("最大养成值"));
         this.staBar.x = 25 + 5;
         this.staBar.y = 122 - 10;
         this.staBar.setValue(0,2000);
         this.staBar.visible = false;
         addChild(this.staBar);
         this.fa = new FTextArea();
         this.fa.x = 200;
         this.fa.y = 80;
         this.fa.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活材料") + "：<br></font>";
         addChild(this.fa);
         this.djBit2 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit2.x = this.fa.x + 10;
         this.djBit2.y = this.fa.y + 20;
         addChild(this.djBit2);
         this.equipContainer2 = new Sprite();
         this.equipContainer2.x = this.djBit2.x + 2;
         this.equipContainer2.y = this.djBit2.y + 2;
         addChild(this.equipContainer2);
         this.miaoshu = new FTextArea();
         this.miaoshu.x = 15;
         this.miaoshu.wordWrap = true;
         this.miaoshu.y = 150 - 30 + 20 - 5 + 30 - 8;
         this.miaoshu.width = 230 + 30;
         this.miaoshu.autoSize = TextFieldAutoSize.LEFT;
         this.miaoshu.htmlText = "";
         addChild(this.miaoshu);
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("激活养成");
         addChild(this.startBtn);
         this.startBtn.x = 10;
         this.startBtn.y = 220 + 30 + 20;
         this.startBtn.enabled = true;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onStart);
         this.yiJianBtn = new SecondButton();
         this.yiJianBtn.label = LanResManager.getLanCommonTextWords("一键养成");
         addChild(this.yiJianBtn);
         this.yiJianBtn.x = 80;
         this.yiJianBtn.y = 220 + 30 + 20;
         this.yiJianBtn.enabled = false;
         this.yiJianBtn.addEventListener(MouseEvent.CLICK,this.onStart);
         var _loc1_:F9GridBitmap = Tools.get9GridBitmpByName("inputBg");
         addChild(_loc1_);
         _loc1_.x = 120 + 5 + 50 + 2 + 90 - 50 - 10;
         _loc1_.y = 200 - 3 + 20 + 2 + 2 + 30 + 20;
         _loc1_.width = 58;
         this.yuanbaoFa = new FTextArea();
         this.yuanbaoFa.x = 120 + 90 - 50 - 10 + 28;
         this.yuanbaoFa.y = 220 + 2 + 30 + 20;
         this.yuanbaoFa.autoSize = TextFieldAutoSize.LEFT;
         this.yuanbaoFa.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前元宝") + "：0<br></font>";
         addChild(this.yuanbaoFa);
         this.yangChengSta = 1;
      }
      
      private function onStart(param1:MouseEvent) : void
      {
         switch(param1.target.label)
         {
            case LanResManager.getLanCommonTextWords("激活养成"):
               dispatchEvent(new BaseEvent(UI_EQUIP_YANGCHENG_CLICK,"",[1,this.equip]));
               break;
            case LanResManager.getLanCommonTextWords("开始养成"):
               dispatchEvent(new BaseEvent(UI_EQUIP_YANGCHENG_CLICK,"",[2,this.equip]));
               break;
            case LanResManager.getLanCommonTextWords("一键养成"):
               dispatchEvent(new BaseEvent(UI_EQUIP_YANGCHENG_CLICK,"",[3,this.equip]));
         }
      }
      
      private function onClose(param1:*) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
            if(this.equipContainer.numChildren > 0)
            {
               this.equipContainer.removeChildAt(0);
            }
            if(this.equipContainer2.numChildren > 0)
            {
               this.equipContainer2.removeChildAt(0);
            }
            this.equip = null;
         }
      }
      
      public function setDate(param1:int, param2:Goods, param3:Goods, param4:int, param5:int, param6:Number, param7:String, param8:int = 0) : void
      {
         if(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         if(this.equipContainer2.numChildren > 0)
         {
            this.equipContainer2.removeChildAt(0);
         }
         this.equip = param2;
         this.itemFace = new ItemFace(param2);
         this.equipContainer.addChild(this.itemFace);
         this.jiHuoGoods = param3;
         this.itemFace2 = new ItemFace(this.jiHuoGoods);
         this.equipContainer2.addChild(this.itemFace2);
         this.yangChengSta = param1;
         if(param1 == 1)
         {
            this.yangChengStaFa.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("养成状态") + "" + LanResManager.getLanCommonTextWords("未激活") + "<br></font>";
            this.staBar.setValue(0,param5);
            this.barBg.filters = Tools.blackWhiteFilter;
            this.staBar.visible = false;
            this.startBtn.label = LanResManager.getLanCommonTextWords("激活养成");
            this.yiJianBtn.enabled = false;
            if(this.jiHuoGoods.count > 0)
            {
               this.startBtn.enabled = true;
            }
            else
            {
               this.itemFace2.filters = Tools.blackWhiteFilter;
               this.startBtn.enabled = false;
            }
         }
         else if(param1 == 2)
         {
            if(this.jiHuoGoods.count == 0)
            {
               this.itemFace2.filters = Tools.blackWhiteFilter;
            }
            this.yangChengStaFa.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("养成状态") + "" + LanResManager.getLanCommonTextWords("已激活") + "<br></font>";
            this.staBar.setValue(0,param5);
            this.barBg.filters = null;
            this.staBar.visible = true;
            this.startBtn.label = LanResManager.getLanCommonTextWords("开始养成");
            if(param6 <= 0 || param4 == param5)
            {
               this.startBtn.enabled = false;
               this.yiJianBtn.enabled = false;
            }
            else
            {
               this.startBtn.enabled = true;
               this.yiJianBtn.enabled = true;
            }
         }
         this.miaoshu.htmlText = param7;
         this.yuanbaoFa.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前元宝") + "：" + param6 + "</font>";
         this.staBar.setValue(param4,param5);
         this.jiaChengFa.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("养成属性加成") + "：<br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + "+" + param4 + "</font>";
      }
      
      public function setStartBtnEnabled(param1:Boolean) : void
      {
         this.startBtn.enabled = param1;
      }
      
      public function showYangChengCanves(param1:String, param2:String, param3:Boolean) : void
      {
         if(!this.yangChengCanvas)
         {
            this.yangChengCanvas = new YangChengTiShiCanvas();
            this.yangChengCanvas.$parent = this;
         }
         this.yangChengCanvas.setCheckSta(param3);
         this.yangChengCanvas.setText(param1,param2);
         POPWindowManager.showWindow(this.yangChengCanvas);
      }
   }
}

