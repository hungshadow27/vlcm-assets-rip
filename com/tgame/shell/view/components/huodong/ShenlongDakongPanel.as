package com.tgame.shell.view.components.huodong
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFormat;
   
   public class ShenlongDakongPanel extends FPanel
   {
      
      public static const UI_SHENLONGDAKONG_OK_CLICK:String = "UI_SHENLONGDAKONG_OK_CLICK";
      
      public static const UI_DAKONGSHI_OPTION_PANEL_DRAG_START:String = "UI_DAKONGSHI_OPTION_PANEL_DRAG_START";
      
      public static const UI_DAKONGSHI_OPTION_PANEL_STONE_CLICK:String = "UI_DAKONGSHI_OPTION_PANEL_STONE_CLICK";
      
      public static const UI_DAKONGSHI_OPTION_PANEL_DRAG_ENTER:String = "UI_DAKONGSHI_OPTION_PANEL_DRAG_ENTER";
      
      private var _listArr1:Array = new Array();
      
      private var bit1:Bitmap;
      
      private var bit2:Bitmap;
      
      private var bg:Bitmap;
      
      private var ft1:FTextArea;
      
      private var bg9:F9GridBitmap;
      
      private var AcquiredDesignationTxt:FTextArea;
      
      private var selectBtn1:FSimpleButton;
      
      private var Scroll1:FVScorllBar;
      
      private var listContainer1:FCanvas;
      
      private var selectList1:FList;
      
      private var ft3:FTextArea;
      
      private var btnOK:SecondButton;
      
      private var gg:Goods;
      
      private var ifItem1:ItemFace;
      
      private var ifItem2:ItemFace;
      
      private var item:ItemFace;
      
      private var stoneContainer:Sprite;
      
      private var p:Point;
      
      private var currItem:ItemFace;
      
      private var arr:Array;
      
      private var tip:FTextArea;
      
      private var tf:TextFormat;
      
      private var ScrollPd1:Boolean = true;
      
      private var menuContainer:FCanvas;
      
      public function ShenlongDakongPanel()
      {
         super();
         this.skin = "panel_btn";
         this.showCloseButton = true;
         dragAble = true;
         width = 261;
         height = 300;
         titleText = LanResManager.getLanCommonTextWords("神龙护身符");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.setUI();
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_DAKONGSHI_OPTION_PANEL_DRAG_ENTER));
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.stoneContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currItem = param1.target as ItemFace;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(this.currItem != param1.target)
         {
            this.stoneContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            dispatchEvent(new BaseEvent(UI_DAKONGSHI_OPTION_PANEL_DRAG_START,"",this.currItem));
            this.stoneContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function setUI() : void
      {
         this.menuContainer = new FCanvas();
         this.menuContainer.skin = "backGroud";
         addChild(this.menuContainer);
         this.menuContainer.width = 241;
         this.menuContainer.height = 90;
         this.menuContainer.x = 10;
         this.menuContainer.y = 0;
         this.bit1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.bit1.x = 50;
         this.bit1.y = 35;
         addChild(this.bit1);
         this.bit2 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.bit2.x = 173;
         this.bit2.y = 35;
         addChild(this.bit2);
         this.stoneContainer = new Sprite();
         addChild(this.stoneContainer);
         this.stoneContainer.x = 0;
         this.stoneContainer.y = 0;
         with(this.stoneContainer.graphics)
         {
            beginFill(0,0);
            drawRect(50,35,50,50);
            endFill();
         }
         this.stoneContainer.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         this.stoneContainer.addEventListener(MouseEvent.CLICK,this.onClicks);
         this.bg9 = Tools.get9GridBitmpByName("inputBg");
         this.bg9.width = 130;
         this.bg9.height = 20;
         this.bg9.x = 24;
         this.bg9.y = 105;
         addChild(this.bg9);
         this.ft1 = new FTextArea();
         this.ft1.x = 25;
         this.ft1.y = 108;
         this.ft1.width = 130;
         this.ft1.height = 25;
         this.ft1.textColor = StaticValue.WHITE;
         this.ft1.htmlText = LanResManager.getLanCommonTextWords("已打孔数：");
         addChild(this.ft1);
         this.ft3 = new FTextArea();
         this.ft3.x = 19;
         this.ft3.y = 140;
         this.ft3.wordWrap = true;
         this.ft3.width = 231;
         this.ft3.height = 100;
         this.ft3.textColor = StaticValue.WHITE;
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("神龙打孔石可以用来打造神龙护身符，打孔后，玩家都将可以将任意品级的宝石镶嵌入神龙护身符内，让强大的神龙护身符如虎添翼！") + "</font>";
         addChild(this.ft3);
         this.btnOK = new SecondButton();
         this.btnOK.x = 100;
         this.btnOK.y = 234;
         this.btnOK.label = LanResManager.getLanCommonTextWords("确定");
         this.btnOK.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnOK);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_SHENLONGDAKONG_OK_CLICK));
      }
      
      private function onClicks(param1:MouseEvent) : void
      {
         if(param1.target is ItemFace)
         {
            dispatchEvent(new BaseEvent(UI_DAKONGSHI_OPTION_PANEL_STONE_CLICK));
            return;
         }
      }
      
      public function setGoods2(param1:Goods = null) : void
      {
         if(this.ifItem1 != null && this.ifItem1.parent != null)
         {
            this.ifItem1.parent.removeChild(this.ifItem1);
         }
         if(param1 == null)
         {
            return;
         }
         this.ifItem1 = new ItemFace(param1);
         this.ifItem1.x = 173 + 2;
         this.ifItem1.y = 35 + 2;
         addChild(this.ifItem1);
      }
      
      public function setGoods1(param1:Goods = null) : void
      {
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         if(param1 == null)
         {
            return;
         }
         this.item = new ItemFace(param1);
         this.stoneContainer.addChild(this.item);
         this.item.x = 50 + 2;
         this.item.y = 35 + 2;
      }
      
      public function setNum(param1:int) : void
      {
         this.ft1.htmlText = LanResManager.getLanCommonTextWords("已打孔数：") + param1 + LanResManager.getLanCommonTextWords("个");
      }
      
      public function setNull() : void
      {
         this.setGoods1();
         this.ft1.htmlText = LanResManager.getLanCommonTextWords("已打孔数：");
      }
      
      public function setShenbing(param1:String) : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + param1 + "</font>";
      }
      
      public function setShenglong() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神龙护身符");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("神龙打孔石可以用来打造神龙护身符，打孔后，玩家都将可以将任意品级的宝石镶嵌入神龙护身符内，让强大的神龙护身符如虎添翼！") + "</font>";
      }
      
      public function setXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords("最终勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将任意属性的宝珠镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setHundunXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords("最终勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将任意属性的混沌宝石镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setKunShouZhiDouXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords("最终勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将任意属性的困兽宝石镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setSuDuZhiXingXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords("最终勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将速度之星镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setYuMoXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords("最终勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将技能镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setWuXiangShenGongXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords("最终勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将无相宝石镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setWanJianXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords("最终勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将剑谱镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setBazhuXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords("霸主勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将天辰石镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setKuapingtaiBazhuXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords("跨平台霸主勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将霸主攻速石镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setMengHuanBaZhuXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords(" 梦幻霸主勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将梦幻霸主石镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setBeiDouXingChenXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords(" 北斗星辰勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将北斗星石镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setHuMoShenJiaXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords(" 虎魔神甲勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将魔牙镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setDaGouBang() : void
      {
         titleText = LanResManager.getLanCommonTextWords(" 打狗棒打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造打狗棒，打孔后，玩家可以将传功长老石、执法长老石、掌钵长老石、掌棒龙头石、丐帮帮主石镶嵌到打狗棒内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setShenDaoXueYin() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为神刀血饮打孔，镶嵌超强属性石。") + "</font>";
      }
      
      public function setHuangJinXueYin() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为黄金血饮打孔，镶嵌超强属性石。") + "</font>";
      }
      
      public function setZiJingZhongJian() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为紫晶重剑打孔，镶嵌超强属性石。") + "</font>";
      }
      
      public function setQingLongYanYue() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为青龙偃月打孔，镶嵌超强属性石。") + "</font>";
      }
      
      public function setLanYuPanLongGun() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为蓝玉蟠龙棍打孔，镶嵌超强属性石。") + "</font>";
      }
      
      public function setYuanYueWanDao() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为圆月弯刀打孔，镶嵌超强属性石。") + "</font>";
      }
      
      public function setTianFaAoJian() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为天罚傲剑打孔，镶嵌超强属性石。") + "</font>";
      }
      
      public function setXueShaGuXing() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为血煞孤星打孔，镶嵌超强属性石。") + "</font>";
      }
      
      public function setHuangJinYanYue() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为黄金偃月打孔，镶嵌超强属性石。") + "</font>";
      }
      
      public function setXuanTieZhongJian() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为玄铁重剑打孔，镶嵌超强属性石。") + "</font>";
      }
      
      public function setShenBingQuanShen() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为神兵犬神打孔，镶嵌超强属性石。") + "</font>";
      }
      
      public function setJinLongPanGu() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为金龙盘古（绝版）神器打孔。") + "</font>";
      }
      
      public function setSiWangShaLouXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords(" 死亡沙漏勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将死亡武神石镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setWuLeiHuaJiXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords(" 五雷化极勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将五雷化极宝石镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setXueTianMoGongXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords("血天魔功勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将血天魔功宝石镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setYuRenJieXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords(" 愚人节勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将愚人节宝石镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setWuHunTianShang() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为武魂天殇（真?武魂天殇）打孔，镶嵌超强属性石。") + "</font>";
      }
      
      public function setYuanShenYuJianXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords("元神御剑勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将元神御剑攻击石、元神御剑防御石、元神御剑生命石、元神御剑战力石、元神御剑武神石镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setPoJunCangLong() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为真?破军苍龙神器打孔。") + "</font>";
      }
      
      public function setHuangJinKaiTianFu() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为黄金开天斧神器打孔。") + "</font>";
      }
      
      public function setHuangJinXingTian() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为黄金刑天神器打孔。") + "</font>";
      }
      
      public function setJiHuoHuangZhenXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords("疾火煌阵勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将疾火煌阵宝石镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setWuXingShenLongXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords("五行神龙勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将五行神龙宝石镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setJiDaoQianKunXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords("极道乾坤勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将极道乾坤宝石镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setZiWuQiXing() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为子午七星神器打孔。") + "</font>";
      }
      
      public function setTuLongMoYing() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为屠龙魔影神器打孔。") + "</font>";
      }
      
      public function setLuTuWanRen() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为戮屠万刃神器打孔。") + "</font>";
      }
      
      public function setLuoHanFuTiXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords("罗汉附体勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将罗汉附体宝石镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setLieTianBaWangJi() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为裂天霸王枪神器打孔。") + "</font>";
      }
      
      public function setPoXiaoLanYue() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为破晓蓝月神器打孔。") + "</font>";
      }
      
      public function setYingXiongHuFu() : void
      {
         titleText = LanResManager.getLanCommonTextWords("英雄护符打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将英雄护符宝石镶嵌到护身符内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setHunDunYouLongQiang() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为混沌游龙枪神器打孔。") + "</font>";
      }
      
      public function setJieTian() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为劫天神器打孔。") + "</font>";
      }
      
      public function setZhuXian() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为诛仙剑神器打孔。") + "</font>";
      }
      
      public function setHuangJinJian() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为黄金剑神器打孔。") + "</font>";
      }
      
      public function setHongLian() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为红莲神器打孔。") + "</font>";
      }
      
      public function setChiYan() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为赤炎神器打孔。") + "</font>";
      }
      
      public function setDuanHun() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为断魂神器打孔。") + "</font>";
      }
      
      public function setFengLeiHuShenFu() : void
      {
         titleText = LanResManager.getLanCommonTextWords("风雷护身符打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造风雷护身符，打孔后，玩家可以将风雷护身符宝石镶嵌到护身符内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setShiShen() : void
      {
         titleText = LanResManager.getLanCommonTextWords("魔神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为噬神魔神器打孔。") + "</font>";
      }
      
      public function setHuangQuanBaZhu() : void
      {
         titleText = LanResManager.getLanCommonTextWords("皇权霸主勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将皇权霸主宝石镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setDaoGuXianFeng() : void
      {
         titleText = LanResManager.getLanCommonTextWords("道骨仙风勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将道骨仙风宝石镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setWuYingJian() : void
      {
         titleText = LanResManager.getLanCommonTextWords("帝王神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为无影剑帝王神器打孔。") + "</font>";
      }
      
      public function setMingHongDao() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为鸣鸿刀神器打孔。") + "</font>";
      }
      
      public function setQiYueBaZhu() : void
      {
         titleText = LanResManager.getLanCommonTextWords("七月跨平台霸主勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将宝石镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setQiYueBaZhu_ChuanCheng() : void
      {
         titleText = LanResManager.getLanCommonTextWords("传承七月跨平台霸主勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将宝石镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setJinGu() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为金箍神器打孔。") + "</font>";
      }
      
      public function setHuTaoZhenHun1() : void
      {
         titleText = LanResManager.getLanCommonTextWords("虎韬阵魂勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将宝石镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setLongZhuXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords("龙珠打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙王功能石可以给龙珠打孔，打孔后玩家可以将龙王宝石和龙珠石镶嵌到龙珠内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setPoTian() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为破天神器打孔。") + "</font>";
      }
      
      public function setLuoShenJian() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为洛神锏神器打孔。") + "</font>";
      }
      
      public function setTianZhu() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为天诛神器打孔。") + "</font>";
      }
      
      public function setZiYingJian() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为紫郢剑神器打孔。") + "</font>";
      }
      
      public function setHongMo() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为红魔神器打孔。") + "</font>";
      }
      
      public function setHuangTuBaYeHuangShi() : void
      {
         titleText = LanResManager.getLanCommonTextWords("皇途霸业皇室勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将宝石镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setYanTian() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为衍天打孔。") + "</font>";
      }
      
      public function setPanGuKaiTian() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为盘古开天斧打孔。") + "</font>";
      }
      
      public function setNiYan() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为逆炎打孔。") + "</font>";
      }
      
      public function setChuangShi() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为创世打孔。") + "</font>";
      }
      
      public function setXuanYuanShenJian() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为轩辕神剑打孔。") + "</font>";
      }
      
      public function setLianYaoHu() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为炼妖壶打孔。") + "</font>";
      }
      
      public function setChiXiao() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为赤宵打孔。") + "</font>";
      }
      
      public function setLongWangSanChaJi() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为龙王三叉戟打孔。") + "</font>";
      }
      
      public function setMoJian() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为魔剑打孔。") + "</font>";
      }
      
      public function setBingJingChui() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为寒冰神器锤打孔。") + "</font>";
      }
      
      public function setHuoYun() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为火陨打孔。") + "</font>";
      }
      
      public function setMoDao() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为邪皇魔刀打孔。") + "</font>";
      }
      
      public function setYuanJianLingPo() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为辕剑灵魄打孔。") + "</font>";
      }
      
      public function setBaJiaoShan() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为芭蕉铁扇打孔。") + "</font>";
      }
      
      public function setXiaLvTuMo() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为侠侣屠魔打孔。") + "</font>";
      }
      
      public function setFengLei() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为风雷打孔。") + "</font>";
      }
      
      public function setLiuXingLuo() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为流星落打孔。") + "</font>";
      }
      
      public function setXieLongMoJian() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为邪龙魔剑打孔。") + "</font>";
      }
      
      public function setXueWu() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为血舞旋月打孔。") + "</font>";
      }
      
      public function setJuLongZhiJi() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为巨龙之击打孔。") + "</font>";
      }
      
      public function setHanGuang() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + "可以为寒光打孔。" + "</font>";
      }
      
      public function setTaoWuNeiDan() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + "可以为梼杌内丹。" + "</font>";
      }
      
      public function setSuiHunYinXue() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为碎魂饮血打孔。") + "</font>";
      }
      
      public function setShenMo() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为神魔打孔。") + "</font>";
      }
      
      public function setXiangYangShuaiYin() : void
      {
         titleText = LanResManager.getLanCommonTextWords("襄阳帅印打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将宝石镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setJunQi() : void
      {
         titleText = LanResManager.getLanCommonTextWords("军旗打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将宝石镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setTianLong() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为天龙打孔。") + "</font>";
      }
      
      public function setMingJiaoHuShenFu() : void
      {
         titleText = LanResManager.getLanCommonTextWords("明教教主护身符打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为明教教主护身符打孔。") + "</font>";
      }
      
      public function setShenBingFu() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神兵符打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为神兵符打孔。") + "</font>";
      }
      
      public function setLiHuaQiang() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为暴雨梨花枪神器打孔。") + "</font>";
      }
      
      public function setTianJing() : void
      {
         titleText = LanResManager.getLanCommonTextWords("神器打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为天晶神器打孔。") + "</font>";
      }
      
      public function setTuLongDao() : void
      {
         titleText = LanResManager.getLanCommonTextWords("屠龙刀打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为屠龙刀打孔。") + "</font>";
      }
      
      public function setJiuYueXinShiDai() : void
      {
         titleText = LanResManager.getLanCommonTextWords("九月新时代王者勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打孔石可以用来打造最终版勋章，打孔后，玩家可以将宝石镶嵌到勋章内，同时获得更强大的属性加成！") + "</font>";
      }
      
      public function setXiongBaXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords("雄霸勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为雄霸勋章打孔。") + "</font>";
      }
      
      public function setNieFengXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords("聂风勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为聂风勋章打孔。") + "</font>";
      }
      
      public function setBuJingYunXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords("步惊云勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为步惊云勋章打孔。") + "</font>";
      }
      
      public function setYNTongGuXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords("铜鼓勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为铜鼓勋章打孔。") + "</font>";
      }
      
      public function setYNBaiLongJiangShiXunZhang() : void
      {
         titleText = LanResManager.getLanCommonTextWords("白龙降世勋章打孔");
         this.ft3.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以为白龙降世勋章打孔。") + "</font>";
      }
   }
}

