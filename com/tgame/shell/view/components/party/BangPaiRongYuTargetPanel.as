package com.tgame.shell.view.components.party
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class BangPaiRongYuTargetPanel extends FPanel
   {
      
      public static const UI_PARTYFLAGPANEL_RONGYU_CHENGCHI_CLICK:String = "UI_PARTYFLAGPANEL_RONGYU_CHENGCHI_CLICK";
      
      public var _parent:DisplayObject;
      
      private var tf:TextFormat;
      
      private var bg:DisplayObject;
      
      private var mingcheng:FTextArea;
      
      private var dengji:FTextArea;
      
      private var zuoshuxing:FTextArea;
      
      private var youshuxing:FTextArea;
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var Scroll:FVScorllBar;
      
      private var bangpaiId:int = 0;
      
      public function BangPaiRongYuTargetPanel()
      {
         var ft6:FTextArea = null;
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 576 + 130 - 33 + 8;
         height = 432 + 140 - 192;
         titleText = LanResManager.getLanCommonTextWords("帮派荣誉");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/bhrytaren.swf");
         this.bg.x = 10;
         this.bg.y = 2;
         addChild(this.bg);
         this.mingcheng = new FTextArea();
         this.mingcheng.autoSize = TextFieldAutoSize.LEFT;
         addChild(this.mingcheng);
         this.mingcheng.x = 8 + 6;
         this.mingcheng.y = 140 + 15 + 60;
         this.dengji = new FTextArea();
         this.dengji.autoSize = TextFieldAutoSize.LEFT;
         addChild(this.dengji);
         this.dengji.x = 8 + 130;
         this.dengji.y = 140 + 15 + 60;
         this.zuoshuxing = new FTextArea();
         this.zuoshuxing.autoSize = TextFieldAutoSize.LEFT;
         addChild(this.zuoshuxing);
         this.zuoshuxing.x = 8 + 6;
         this.zuoshuxing.y = 195 + 56;
         this.youshuxing = new FTextArea();
         this.youshuxing.autoSize = TextFieldAutoSize.LEFT;
         addChild(this.youshuxing);
         this.youshuxing.x = 8 + 140 + 6;
         this.youshuxing.y = 195 + 56;
         ft6 = new FTextArea();
         ft6.multiline = true;
         ft6.wordWrap = true;
         addChild(ft6);
         ft6.width = 230;
         ft6.x = 450 + 23;
         ft6.y = 30 - 19;
         ft6.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("城池列表") + "</font>";
         ft6 = new FTextArea();
         ft6.multiline = true;
         ft6.autoSize = TextFieldAutoSize.LEFT;
         addChild(ft6);
         ft6.x = 450 + 23 - 142 + 15;
         ft6.y = 30 - 19 + 30;
         ft6.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("名称") + "</font>";
         ft6 = new FTextArea();
         ft6.multiline = true;
         ft6.autoSize = TextFieldAutoSize.LEFT;
         addChild(ft6);
         ft6.x = 450 + 23 - 81 + 15 + 45;
         ft6.y = 30 - 19 + 30;
         ft6.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("阶层") + "</font>";
         ft6 = new FTextArea();
         ft6.multiline = true;
         ft6.autoSize = TextFieldAutoSize.LEFT;
         addChild(ft6);
         ft6.x = 450 + 23 - 13 + 45 + 10;
         ft6.y = 30 - 19 + 30;
         ft6.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("占领情况") + "</font>";
         ft6 = new FTextArea();
         ft6.multiline = true;
         ft6.autoSize = TextFieldAutoSize.LEFT;
         addChild(ft6);
         ft6.x = 450 + 23 + 95 + 30;
         ft6.y = 30 - 19 + 30;
         ft6.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前等级") + "</font>";
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 310 + 14;
            y = 110 - 50 - 1;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,320,170 + 70);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new ChengChiTargetList();
         this.giftList.listWidth = 320;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.giftList.addEventListener(MouseEvent.CLICK,this.onClick);
         this.Scroll = new FVScorllBar(this.listContainer,170 + 70);
         addChild(this.Scroll);
         this.Scroll.x = 630 + 16 + 2;
         this.Scroll.y = 110 - 50;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         this.dispatchEvent(new BaseEvent(UI_PARTYFLAGPANEL_RONGYU_CHENGCHI_CLICK,"",[this.bangpaiId,this.giftList.selectItem.biaoshi]));
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setInitialize(param1:Array, param2:int) : void
      {
         this.bangpaiId = param2;
         this.giftList.dataProvider = param1;
         this.giftList.setSelectItemByIndex(0);
         this.Scroll.update();
      }
      
      public function setChengchi(param1:Object) : void
      {
         if(param1.dengji == 0)
         {
            this.mingcheng.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param1.name + "<br></font>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("帅印附加属性") + "</font>";
            this.dengji.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前等级：") + param1.dengji + "</font>";
            this.zuoshuxing.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + "<br>" + LanResManager.getLanCommonTextWords("闪避：") + "<br>" + LanResManager.getLanCommonTextWords("生命：") + "</font>";
            this.youshuxing.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("防御：") + "<br>" + LanResManager.getLanCommonTextWords("内力：") + "<br>" + LanResManager.getLanCommonTextWords("暴击：") + "</font>";
         }
         else
         {
            this.mingcheng.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param1.name + "<br></font>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("帅印附加属性") + "</font>";
            this.dengji.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前等级：") + param1.dengji + "</font>";
            this.zuoshuxing.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：+") + param1.act + "<br>" + LanResManager.getLanCommonTextWords("闪避：+") + param1.shanbi + "<br>" + LanResManager.getLanCommonTextWords("生命：+") + param1.shengming + "</font>";
            this.youshuxing.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("防御：+") + param1.def + "<br>" + LanResManager.getLanCommonTextWords("内力：+") + param1.neili + "<br>" + LanResManager.getLanCommonTextWords("暴击：+") + param1.baoji + "</font>";
         }
      }
   }
}

